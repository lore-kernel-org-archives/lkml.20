Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAD522EF8;
	Tue, 22 Sep 2026 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063590; cv=none; b=R5EW7cKOk7mSmAWsJqCdzADOMd2GMP3DNiSv6Zvc9o4/pZr2LYLMMwS8S+wmkXSLeWku+FE8ZNElK5WZCvdysT3SyP9XX0Swx+xF5DDy6ML0qfK4Jy7J1+9EYFoB6wqwCsw5uay/oqwCPy0QtxiQLwS8BVuA74uiaB/5HVYMtUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063590; c=relaxed/simple;
	bh=7y11n5aos28q3/VXCPQTZicAK4pN+oSV9a0C+YvJznw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsORMHjfpwy6MCMRvXNWq/tGoPvFw0wqAPC17iWzfyO0/KAoXydOaI0xTYCnBhJAkGloSRHhIUfrE2hxrBcYu1VNt5M/Glx9c3LMh7byHlPW0kVfmYMNIM4K6v613MGeTM4daTg+6vJdbd1PvoErPQ4KQ40UYg0Aj3bw2PeaTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=SgdjMI18; arc=none smtp.client-ip=115.124.28.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="SgdjMI18"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1790063567; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4wEfZjHoKpEKZdE4Q14aKMGx95mdXOozZgnNcquZyb8=;
	b=SgdjMI18SC345Af3nBf39I+O7lcsqA3l54eqPQRxIRfy4VpJqZVP8al1aqejdPlXq025rtcCw7sIBpua7RXdzrKYlE5vW3rcQV2+C3Da5pgU5CXrpxHg4QLdQfrOU+PDx1r+zndyxWvH87mlv1p3VRAYpHUqcXqMs5SpGyG/KwU=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.764885|0.8870502;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_system_inform|0.164553-0.00562562-0.829822;FP=961415426815343994|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.jJp.7vS_1790063566;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jJp.7vS_1790063566 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 22 Sep 2026 15:52:47 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Weibin <liuwb@xiaopeng.com>
Subject: [PATCH v2] media: i2c: thp7312: bound the focus lookup against the table size
Date: Tue, 22 Sep 2026 15:52:46 +0800
Message-ID: <20260922075246.1319707-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

thp7312_set_focus() indexes thp7312_focus_values[] with the value of the
V4L2_CID_FOCUS_ABSOLUTE control:

        if (thp7312->focus_absolute->is_new) {
                unsigned int value;

                value = thp7312_focus_values[thp7312->focus_absolute->val];

The control is registered with the table size as its maximum:

        v4l2_ctrl_new_std(hdl, &thp7312_ctrl_ops,
                          V4L2_CID_FOCUS_ABSOLUTE,
                          0, ARRAY_SIZE(thp7312_focus_values),
                          1, 0);

The table has 19 entries, so the valid indices are 0 to 18, but the
maximum passed to the control is 19. The control framework does not
reject the bound itself for an integer control: std_validate_elem() only
rounds the value into [minimum, maximum] through ROUND_TO_RANGE() and
returns 0, whereas a menu control returns -ERANGE for a value outside the
range. So a value of 19 is accepted and the lookup reads one entry past
the end of the array. That value is then written to the sensor through
cci_write(THP7312_REG_MANUAL_FOCUS_POSITION).

Reject a value that is not a valid index before the lookup. The control
range is the safer place for the bound, but leaving the lookup guarded
keeps the table and its only user consistent with each other; narrowing
the control is a follow-up that does not affect this fix.

No Fixes tag. The table, its registration and the lookup all come from
the initial driver import, 7a52ab415b43 ("media: i2c: Add driver for
THine THP7312"), and have not been touched since.

Reviewed-by: Liu Weibin <liuwb@xiaopeng.com>
Assisted-by: LLM
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
v2: add the THP7312 maintainers to the recipients, and say that the value
    read out of range is written to the sensor.

    The previous version said the read was of a value next to the table
    and left it at that. The read result goes into cci_write() for
    THP7312_REG_MANUAL_FOCUS_POSITION, so the description now follows the
    value to where it is used.

    Add the Assisted-by tag.
---
 drivers/media/i2c/thp7312.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 775cfba18..20698b7a1 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -931,6 +931,11 @@ static int thp7312_set_focus(struct thp7312_device *thp7312)
 	if (thp7312->focus_absolute->is_new) {
 		unsigned int value;
 
+		if (thp7312->focus_absolute->val < 0 ||
+		    thp7312->focus_absolute->val >=
+		    ARRAY_SIZE(thp7312_focus_values))
+			return -EINVAL;
+
 		value = thp7312_focus_values[thp7312->focus_absolute->val];
 
 		ret = cci_write(thp7312->regmap,
-- 
2.50.1

