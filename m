Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061AF3F482C;
	Fri, 18 Sep 2026 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713158; cv=none; b=NQTjWww25VK3WLBO+h1UPxHMso159AX352aeg9ZcShhUljdD975jCJTfHiDnk3A5PUmWFTmfrs1C5hzq9Qi1bpY/u7y9pVhP98luvj2TQ+ZYqC33zX/35IxO44yefrKCDwXZdv2E6LDiMILLQ2s0zMs88o5M6JEtmLVCRmiwzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713158; c=relaxed/simple;
	bh=p+Vy6iIWJDLD80+27c4Dd2e4A5/sYhaTlDkpq1rVLKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQ24crymJp5pnWk1/GGKdPfD8hwyRztrUJ1GaCwrKq2jKPBHLRPDhJw7d9ZsV1fv6fb4/uEtKI1V9uJ04Jy2OVXOHAaM9ziNfFmwwKk/qg7k0MgZZpzDw4o8TiuJ5RhsVTrs16aGKkrsaojwasBkjE55IJfAbqvgRJ65YYt52LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=c2eO6U9B; arc=none smtp.client-ip=115.124.28.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="c2eO6U9B"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789713145; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Q/wpCJYRqZ/z2PVcQlZwQCoTFamMkdkhmaupm/FB/zw=;
	b=c2eO6U9BvBA0EfN7unEBYigHsF2lioe2acAa03imdEeub8VCKDOJ/aMxR9Qz/XhCCdMFXOJAx9irxtcUwaEQSW04eTOiDmWyGiB7UpbwNZMG9xDfK0pBlUg0mWtKOAf0y08jR7QMzpl1gaCC99yLIsLYRRlMrJT7ufBwHlCY3Rs=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.8346694|0.8957153;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_system_inform|0.0864226-0.00127432-0.912303;FP=709213718829449050|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGYhKtZ_1789713144;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGYhKtZ_1789713144 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 14:32:25 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Weibin <liuwb@xiaopeng.com>
Subject: [PATCH] media: i2c: thp7312: bound the focus lookup against the table size
Date: Fri, 18 Sep 2026 14:32:24 +0800
Message-ID: <20260918063224.2085420-1-guozh23@xiaopeng.com>
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

The table has 19 entries, so the valid indices are 0 to 18, but
maximum is an inclusive bound in the control framework. For an integer
control the framework rounds the value into [minimum, maximum] with
ROUND_TO_RANGE() in std_validate_elem() and accepts the bound itself, so
a value of 19 passes. The read one past the end of the array then returns
whatever follows the table in the driver image, and that value is
written to the sensor.

Reject a value that is not a valid index before the lookup. The control
range is the safer place for the bound, but leaving the lookup guarded
keeps the table and its only user consistent with each other; narrowing
the control is a follow-up that does not affect this fix.

No Fixes tag. The table, its registration and the lookup all come from
the initial driver import, 7a52ab415b43 ("media: i2c: Add driver for
THine THP7312"), and have not been touched since.

Reviewed-by: Liu Weibin <liuwb@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
The value is reachable from userspace through the control API
(VIDIOC_S_CTRL / VIDIOC_S_EXT_CTRLS) on the sensor's V4L2 subdev node, so
any user with access to the device can set it to the maximum.

The read is of a u16 past a static const table, so the usual outcome is
reading an adjacent constant rather than anything sensitive; the value
is then written to the sensor. I am reporting it because the same
off-by-one is easy for the next person to repeat when the table grows.

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

