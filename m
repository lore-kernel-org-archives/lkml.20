Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7C3E2AD7;
	Fri, 18 Sep 2026 03:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700562; cv=none; b=f2rsOIabHJG5L1CUt6ZCFhCxfHSRk05/qLZ/4ygNv0O+MNdKpZ/K9Cg9DlrmngYqK8hgTWQu8C8hEd99M4KRS331T/khtOsIyUCaZQ6SudX7SSO2ACXYF+avalQUsfFAqpwzCQrYHwxoNSD3Za0tsjLCMuxgZud7gH2KmuYC4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700562; c=relaxed/simple;
	bh=bGMM5QcTdrKYS7Zph2fOWchXxLN1RGRWWj/xp/ZsTMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmXZrThrByvn0xw2/kc6YvJsmuq/bDKpH5ggLBOUybCobcQ+OQ6bfhI/YbbW8tFvq3EjQYT+v4UCSc/fm8fx6PF1dJMKGf+P+aRvhZ8IX9Ip9FY6Nd21PK/3u+qqY884lIgahU33MRT/B+T1ou4ltJGWpgTx5036ZCfcoVs3WwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=S8H3Yyl2; arc=none smtp.client-ip=115.124.28.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="S8H3Yyl2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789700544; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ZchKATo4SGalM4NsIgxZx/qZNcebZQH3Xqdfka7zIZo=;
	b=S8H3Yyl2PCy23qSn1lZBsF083HJvFjVbiOsF8FgNPOpBA1JmvXQv9+E+EkHuUALjeyqhgghQi7sZOvOyYZQ1NzVzSuenOfN9NJOkAHGx9T9JQXLp9oheO2tHcS0wCyUwYQtITop+i88hIte+HX3HCM+eYF+r/Wd8aJP80Eh9fyQ=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.9087309|0.09921987;CH=green;DM=|AD|false|;DS=CONTINUE|ham_system_inform|0.0207302-0.00358289-0.975687;FP=14399330002124975970|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037031241;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGNq8K8_1789700543;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGNq8K8_1789700543 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:02:23 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fang Xieyan <fangxy@xiaopeng.com>
Subject: [PATCH] media: dvb_net: reject the pointer field at the cell boundary
Date: Fri, 18 Sep 2026 11:02:22 +0800
Message-ID: <20260918030222.638961-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_net_ule_ts_pusi() checks the ULE payload pointer field before
skipping to the start of the first SNDU, but the comparison is off by
one:

        if (h->ts[4] > h->ts_remain) {
                pr_err("%lu: Invalid ULE packet (pointer field %d)\n",
                        h->priv->ts_count, h->ts[4]);
                ...
        }
        h->from_where = &h->ts[5] + h->ts[4];
        h->ts_remain -= 1 + h->ts[4];

ts_remain counts the bytes left in the cell after the four byte TS
header, so it starts at 184 and acts as an offset from &ts[4]. The
pointer field is an offset from &ts[5], one byte further along, so it
has to stay strictly below ts_remain. A value of exactly ts_remain
passes the test, and then

 - from_where points one byte past the end of the 188 byte cell, and
 - ts_remain -= 1 + ts[4] wraps around to 255, because ts_remain is u8.

The wrapped value is what turns this into more than a one byte overread.
It defeats the ts_remain < 2 check in dvb_net_ule_new_payload(), which
is the guard that stops the parser from reading the two byte SNDU length
out of bounds, and every later use of ts_remain in
dvb_net_ule_handle() works from the wrapped count.

Reject a pointer field of ts_remain as well. Values below it, including
the largest one that still leaves the length field readable, behave as
before.

No Fixes tag. The comparison and the from_where calculation next to it
were introduced together in 59142330aaea (2005) and have not been
touched since.

Reviewed-by: Fang Xieyan <fangxy@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
The packet arrives through the demux, so a crafted MPEG2-TS stream
carrying a ULE SNDU with a pointer field of 184 reaches this code with
nothing else required to be well formed.

Pointer fields of 182 and 183 caused a separate endless loop in this
same block and were addressed in 29e1fa3565a7 ("dvb-core: Fix DoS bug in
ULE decapsulation code that can be triggered by an invalid Payload
Pointer"), which added the resync handling but left the comparison
operator alone.

handle_one_ule_extension() in this file got a bound of the same shape
last February (24d87712727a), so the ULE decapsulation path has taken
this kind of fix before.

 drivers/media/dvb-core/dvb_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..604c767e1 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -371,7 +371,7 @@ static int dvb_net_ule_ts_pusi(struct dvb_net_ule_handle *h)
 		/* Synchronize continuity counter. */
 		h->priv->tscc = h->ts[3] & 0x0F;
 		/* There is a pointer field here. */
-		if (h->ts[4] > h->ts_remain) {
+		if (h->ts[4] >= h->ts_remain) {
 			pr_err("%lu: Invalid ULE packet (pointer field %d)\n",
 				h->priv->ts_count, h->ts[4]);
 			h->ts += TS_SZ;
-- 
2.50.1

