Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5AE544D42
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081706; cv=none; b=hdTUfrj+e2xfigB0WHBIauuzLZQUrxG8qDOcKSGPYvLzw7aiANiSidzhU9LW+D6a1GlmNYKo/SI/cTMFV0GxzTaVP7o6KJkeA1Su8sWwtlrQhJCMUH7lFZU+6/YE5Pb0RU/eUC1DmulNgjYMaphGRvx0QB4K7jaqbyIgErtrHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081706; c=relaxed/simple;
	bh=D6Mqjmve2D3zEFxpcoNopgmlnH0PCZW4Mf2l1TSVcy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtEPTaBHu3S1O8T6379LklBS4sh2oPHDuCzJHB5iAg+psLVJ+Ka8aj6h6bpE+6BJW+YlwO7A2KbMkta/Z20l5PcZWBrFx7nbYOIxaEeXanetxjc0jmsmpb7jfdSPqB2VN3v1U2KgrIFtGh6P+ao/yIO6tPlsMZYeljnnPyfnTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwKBBGZ+; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwKBBGZ+"
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93a3f97e134so76011585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081695; x=1790686495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDRh6ngAev1ysNp6h43FdwC9/x8vMsMXBOvQ5CbbrUo=;
        b=KwKBBGZ+NDiccadZEDq+hlkoiWUCyhx32esOp931tsqaDJ6cUl1qrKzpD+Jlpmh8tC
         lOuvS0Xqlb3CSH97ZWjo6djxYdVSgz8vcJqBMe6rPFO9+MmktbMCPxv7clcNmnDe+AD8
         Z/D1yP/3rXU8bouCSljSEQKh5t85ZIHvtxGczP7ATPwlNGJR3WRdDKrkprRhSnSXPoUk
         DDHR8OQ4xr9xKRGjHqEWKAaqEjKtN4ByG7vnqgbGnHq3Zt1dgW7ZoHxF6StKfBkw1WfJ
         Qk6D4Ex9/qTbp3UojZVue5yjIDVljOJtV1Mf+kefOe4lxFM+7N7zhpt/ZoBqysKfknFO
         j1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081695; x=1790686495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDRh6ngAev1ysNp6h43FdwC9/x8vMsMXBOvQ5CbbrUo=;
        b=Nfvabv4zZ1qauaO1w5sqOT9pAMhMKTny04nCbf6OXzJcoJTZH6S+11eXA5xejqYErE
         etfmaEIPmFsszMUibG3sv3XVbqlsFVaLy3b5gC2OOvPQvxLE+CVp/hqb7byRHtzpRnNu
         wRGo8EUp7sbvsBz9F+VMHFuRaIcYj94q1PRqQDFC024Wa6B3UrQwcuuVIsDEGEW/6yBd
         v5b6YdK1xJlHvjZiAHgwQKhcnodEny2dmmJBIwZy+SidOtXXGNhyQLFNBZpkHQCYoAQy
         jL88KMNukTAxgmA3w/bnIv6rKNyMcjGWuJzBVaNQqerWsDe4ZhaSUs5zhNAYIMbLlP6h
         ovDQ==
X-Forwarded-Encrypted: i=1; AKwUvByZNBG/5yPkdoR/BVT33VORWO0wvvfL/9gxWFscokEANEbzhjmpfbh8+S+rhD5S+YjFDTuXgu2pNnu7ehQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l87VxjPXFAgurFHDXn6ehuCKetqm/Shdj9lLKZB+9ovP62MYC6
	4YPfZSiybU4TIFX4XrFR8Y1POf6QjFB0486RxgAJBrD77gzlfteHCcwt
X-Gm-Gg: AYBFou3WYA2iC6ti3XEbUl2UcuHuYxfJ6yucItYXls8iKSTrtDAeB497j7dXTfZv217
	JMwjntN8aVMDq+W1zo7eaa2HGGzlByaKMwvcV/U2cNmHy1WliNuV6m6Fiq64kD+eAWWT0Oz0xYq
	Bx0rTzTCAOyXuTQFPMsdSOPnzpAsSBsIjDtXREUQo0+XYPPVVq8ge3DGNb2smSRyTF/X/2yDfiS
	Nrf5/oKh5twh71jQrKHRsWOnFjkwpdsUJ0o2TSAaJX0l/URVA0UbbEFew7F4jP9ET1OVqP42v62
	hEOoWlprRRrEwcbnZCRwVAezk3zBq2MoRQ6HMdRU4/61hoEXAR/PjkFcXseWGn05UK8EfIvpfLO
	stQ1YclvXH7fPyrG3ns2GzOVYfHvGhIjpwGe2VWo5PgO4xf5UXldlnmD5Anfgm8ISixvS3ZiVlA
	9dOVxi3dXf2NlXcUxXu3f8aFnbVLPwMiYxmVzdxRcTgXZJVEy4tESHwMzrzIKUuGv2IxdgYc1hk
	ehzxp6tJqsApW5vs8FvUswbydC+MbQXCL5qmb0V0u91qRYuwOY2WxQE
X-Received: by 2002:a05:620a:4412:b0:93a:2a78:34a3 with SMTP id af79cd13be357-93c15d7531emr557029885a.22.1790081695011;
        Tue, 22 Sep 2026 05:54:55 -0700 (PDT)
Received: from Raccoon ([2409:408d:3188:aa03:3bb2:acc7:b581:620])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d1c17e2sm138050885a.27.2026.09.22.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:54:54 -0700 (PDT)
From: Rohinthan <rokinthanp03@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com,
	Rohinthan <rokinthanp03@gmail.com>
Subject: [PATCH] media: vivid: check for NULL dev in vivid_probe() control setup
Date: Tue, 22 Sep 2026 18:24:34 +0530
Message-ID: <20260922125434.19361-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vivid_probe(), after creating instances, the driver iterates
through vivid_devs[0..n_devs-1] to populate HDMI and S-Video
'Connected To' controls. However, it dereferences dev->has_vid_out
without verifying that dev is non-NULL.

If an instance fails during creation (or if devices race during
probe/remove), vivid_devs[i] remains NULL, causing a general
protection fault:

    Oops: general protection fault
    KASAN: probably user-memory-access in range
    [0x0000000000005f38-0x0000000000005f3f]
    RIP: 0010:vivid_probe+0x579/0x10d0

Add NULL pointer checks in both loops in vivid_probe() before accessing
vivid_devs[i]. Also set .suppress_bind_attrs = true on
vivid_pdrv.driver to prevent concurrent sysfs bind/unbind operations
from triggering races.

Fixes: d7c969f37515 ("media: vivid: Add 'Is Connected To' menu controls")
Reported-by: syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=caaca441bae2799984d3
Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 62cfb5f..31a90ec 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -2116,17 +2116,19 @@ static int vivid_probe(struct platform_device *pdev)
 	for (int i = 0; i < n_devs; i++) {
 		struct vivid_dev *dev = vivid_devs[i];
 
+		if (!dev)
+			continue;
 		if (!dev->has_vid_out)
 			continue;
 		for (int j = 0; j < dev->num_outputs && hdmi_count < MAX_MENU_ITEMS; ++j) {
 			if (dev->output_type[j] == HDMI) {
-				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = vivid_devs[i];
+				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = dev;
 				vivid_ctrl_hdmi_to_output_index[hdmi_count++] = j;
 			}
 		}
 		for (int j = 0; j < dev->num_outputs && svid_count < MAX_MENU_ITEMS; ++j) {
 			if (dev->output_type[j] == SVID) {
-				vivid_ctrl_svid_to_output_instance[svid_count] = vivid_devs[i];
+				vivid_ctrl_svid_to_output_instance[svid_count] = dev;
 				vivid_ctrl_svid_to_output_index[svid_count++] = j;
 			}
 		}
@@ -2134,13 +2136,17 @@ static int vivid_probe(struct platform_device *pdev)
 	hdmi_count = min(hdmi_count, MAX_MENU_ITEMS);
 	svid_count = min(svid_count, MAX_MENU_ITEMS);
 	for (int i = 0; i < n_devs; i++) {
-		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
-			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
+		struct vivid_dev *dev = vivid_devs[i];
+
+		if (!dev)
+			continue;
+		for (int j = 0; j < dev->num_hdmi_inputs; j++) {
+			struct v4l2_ctrl *c = dev->ctrl_hdmi_to_output[j];
 
 			v4l2_ctrl_modify_range(c, c->minimum, hdmi_count - 1, 0, c->default_value);
 		}
-		for (int j = 0; j < vivid_devs[i]->num_svid_inputs; j++) {
-			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_svid_to_output[j];
+		for (int j = 0; j < dev->num_svid_inputs; j++) {
+			struct v4l2_ctrl *c = dev->ctrl_svid_to_output[j];
 
 			v4l2_ctrl_modify_range(c, c->minimum, svid_count - 1, 0, c->default_value);
 		}
@@ -2240,6 +2246,7 @@ static struct platform_driver vivid_pdrv = {
 	.remove		= vivid_remove,
 	.driver		= {
 		.name	= "vivid",
+		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.53.0

