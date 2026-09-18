Received: from out28-221.mail.aliyun.com (out28-221.mail.aliyun.com [115.124.28.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FEF248880;
	Fri, 18 Sep 2026 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699039; cv=none; b=Fw2r4h/vyw3/X0ZCMqf8NOSRTZgXaY8ZZRSalwXacG94wd0g0kmAxMb2yOtGcwiDEUwxqCN/+HOfLba1rF9T5Kox7qP3rJOXAU+WI/d0XE34wsFofGBvufzx4eFobE8pQcqMU1cmhVOjsiyMmx7hoi9mpkiZ5/+CEyUcjlB9FLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699039; c=relaxed/simple;
	bh=fG8s2Rbuo1jfWojmNf3RSIRc91piDlgqYy+unMLmx7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVbMysVFmgKKlEB8kp33C0FvngOYvaC3lLHWwXkRJ1ZCM2E2+q5KEs3Ds7ibusbRTcG1rXO3M2chFMvF8HCpc/KsKOKd2R8PPbhyQX3XV8NnYr2UOdQbEiQsQ/Bz93zdml3GdnOfLrgAlAP0Pji3CAbC/PHCG5G/rVI2n+Yc60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=p80KohTm; arc=none smtp.client-ip=115.124.28.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="p80KohTm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789699021; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=oeMHnYZJ6KNxI0SiboJu3JfQeQKWe3PW6bkDrXO2XDw=;
	b=p80KohTmQTvYjKHTuXfjJGhYxP60WDzNV1Yw+f1Qm44eK0N/jYfPPt+g1JcJX8iZCySmM91Oxy3SCo4e8j76IWtzAfbkVnl53nrAbboF7YJI7zv5eLCrFdMWJ7ro7thoLjQErODmcA/OZyJf0GC8h0AcqcLXvsdX74welM0Z/ao=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07452739|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00963083-0.00484189-0.985527;FP=17220283626844399422|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGJMEY8_1789699020;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGJMEY8_1789699020 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 10:37:00 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: dst_ca: validate the CA message length in ca_set_pmt()
Date: Fri, 18 Sep 2026 10:36:59 +0800
Message-ID: <20260918023659.467911-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ca_set_pmt() takes the payload length from the ASN.1 length field of the
userspace supplied CA_PMT message and uses it to clear and fill
hw_buffer->msg, which is a fixed 256 byte array:

        length = asn_1_decode(&p_ca_message->msg[3]);
        debug_string(&p_ca_message->msg[4], length, 0);

        memset(hw_buffer->msg, '\0', length);
        handle_dst_tag(state, p_ca_message, hw_buffer, length);

asn_1_decode() implements the ASN.1 long form length, so msg[3] = 0x84
reads four length bytes and can return up to 0xffffffff. Nothing
compares the result against the size of the destination, so the memset()
overruns the kmalloc'd hw_buffer.

handle_dst_tag() does reject lengths above 247, but three things make it
ineffective here:

 - it runs after the memset() has already overflowed the buffer,
 - it is skipped entirely on the DST_TYPE_HAS_SESSION path,
 - debug_string() walks the message up to length and is called before
   any of the checks, so it reads out of bounds as well.

Validate the decoded length against sizeof(hw_buffer->msg) before it is
used, accounting for the tag that handle_dst_tag() prepends. Messages
that do not fit are rejected with -EINVAL.

No Fixes tag. asn_1_decode() and the ca_set_pmt() call chain come from
the original driver import, and the ASN.1 long form handling was last
touched in 93a14f15d35c (2005). The missing bound has been there since.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
Reaching this needs nothing more than a CA device node: open
/dev/dvb/adapterX/ca0 and issue CA_SEND_MSG with msg[0..2] set to
0x00 0x9f 0x80 (CA_PMT) and msg[3] = 0x84 followed by four length
bytes. No CAM has to be present, because the overrun happens before any
hardware access.

The 247 limit handle_dst_tag() uses is one byte short of what
sizeof(hw_buffer->msg) - tag_length allows, so the two bounds disagree.
Removing the check from handle_dst_tag() is not part of this patch, but
if a single check in one place is preferred, that would be the natural
follow-up.

cxd2099 bounds its CAM reply length the same way after a comparable
report (len > ecount || len < 2), so there is precedent in the DVB
frontend drivers.

 drivers/media/pci/bt8xx/dst_ca.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
index 6da75c6ed..e126afc2f 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -401,6 +401,13 @@ static int ca_set_pmt(struct dst_state *state, struct ca_msg *p_ca_message, stru
 	u8 tag_length = 8;
 
 	length = asn_1_decode(&p_ca_message->msg[3]);
+	if (length > sizeof(hw_buffer->msg) - tag_length) {
+		dprintk(verbose, DST_CA_ERROR, 1,
+			" CA Message too long (%u) ! *** Bailing Out *** !",
+			length);
+		return -EINVAL;
+	}
+
 	dprintk(verbose, DST_CA_DEBUG, 1, " CA Message length=[%d]", length);
 	debug_string(&p_ca_message->msg[4], length, 0); /*	length is excluding tag & length	*/
 
-- 
2.50.1

