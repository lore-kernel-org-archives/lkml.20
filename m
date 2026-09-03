Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8982033939A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401843; cv=none; b=jB+m7QLrSYG1KEe6IJZoNNLpCHwrjcQfw1wqY8b3W4CE8J3QFesOtNgwPZTmvOG9/waBIBN/fme6NIvKF/M2OrjHDWSqKHWEFHwTBsd4b1uyLl2LIHCt8+7E6cQYv19SOhYdFeTHibGcDJSS7eDoyL0+lIvMW+uIl5TueDtz8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401843; c=relaxed/simple;
	bh=ltGCsPM9g4dL27hzeJYprlsMCLIuGBzrExUAh+1/n8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d3P+SjnUEcJx+SX/VSG8WEeBBMO6PKBBP97V+rmzsJOSgdocQkM31oh1ighSmZ/ASsLFIFI+P2fOEL3BEWI9Dpy0tNfbunscFhPIcuoneHkIqGR9hwnp/TXiXTegG8h/DBzbuGJQaC0Z0I5B5uzBTYrRirS4MCFhceINjx3ndi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Ru7EJkGu; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Ru7EJkGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788401730;
	bh=NNBPer/UqmzXtzPtWUFkVQGu/BhnIGA3Q4Ww1JPF9B0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Ru7EJkGuPrPb2cHBDMZxwYoWhdN+k8Un0xTngdnHxsRmi7J+Db+IcIB3CeI1/BphE
	 m8yIhS7D28qaKc0WDUMEGX4OE5+RWeT2YyhAnJI4SWCmYQClrAMUET+6E3a+J4WLKo
	 mz0kjVo6sh73lrBBFFp7lsKUzDYcw68CUbTOCJZw=
X-QQ-mid: esmtpgz16t1788401724t6d55b7c7
X-QQ-Originating-IP: o1bCMaKcd5K4sGAPBG6wOUQ88v1EnArt+Z/BFPA4eFM=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 10:15:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7393804203611463141
EX-QQ-RecipientCnt: 15
From: Haowen Tu <tuhaowen@uniontech.com>
To: rafael@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: tuhaowen@uniontech.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	huangbibo@uniontech.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	oneukum@suse.com,
	pavel@kernel.org,
	stern@rowland.harvard.edu
Subject: [PATCH v5 4/4] media: uvcvideo: skip post-snapshot hibernation THAW
Date: Thu,  3 Sep 2026 10:14:59 +0800
Message-Id: <e72835b9abb06dd3a14728b4bb8789567ba3a747.1788399733.git.tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1788399733.git.tuhaowen@uniontech.com>
References: <20260730153817.GA1555869@killaraus.ideasonboard.com> <cover.1788399733.git.tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ML8hOghqQD+0+AnvW5UypZvMXjLVHB4KkNxGe4/bhDpG2TUzLJfOAdVs
	zbUkT38jf+q8tdMQHWqoFuxAmEjC+SLdXqUxikW/yFajWTNNMKiPZ8biqacGv+2W0edgnL6
	FlGhi0t+ROoBMQxrX6en6A3Xkd7s/1raD+yJYGpvnq7MFGZ00/kYsE9BwaK7Ivm41VsNGv5
	ld0TXAurZZlB4AnYE6j7Op+lJ9Ejn3YS81zvW0/Yxw7bi+fo2WL0b5rD6LEtrWHCrNSLwuk
	CdA8e9eYlMUm2C2S0bN8vR+tx7b1Offt8Uv99WBykDhxubGe9nbf1VrvU9GXv6zH1EhllsD
	X3jJIskxBNh+CdcMCIwQ1SZevHkA4cyxFigdz0ccvUmi019Tp6qeFMI9oW5CE9TvIpJYhxc
	P3Cpbs+5EefMNwmto+ceyzRxrLYZ4/2Fnt6XzcPCRS6KVKh63SEdE2jXnYknWcxpSEI/6ax
	q4WeF3qYAFgqno0ucncrcdgfFZntxv3FxFsksI3EnMDEGYEtkS/FPudKKE2WzK5u6HDSo0k
	MsUXegFBeng7xNvNUvBshO1BqmVOsd8OxnJ4sDb3IxgS/dn/pUi/yaMfob7SNemhjky8zsp
	We0KFFRStSgYca5GD74wZ82FyVBgQxbtW2/vPs2toFMju4ql9GPYQaFIom6pa4O+yHT916V
	Im1wrS2xNNr4IDKMuc1w76mqrNyq+FxsQlh2N6yMML8vpmJrCqz6y74Zm4VIT5RMAbuIPbr
	9llzZTvX7DCN9HEu+BHcuLXXcyrr2KZELEIlLGCP6AGNwXrnAg6quuZ1R/TbOqdWDhUwz9/
	ail4D66sfjR0TG6um0OPAIOpzH0VFpRT1ucY1Zc3xRgNxoU8NjHe/MOfJ8znFsAESr4TwsA
	VWwBj9Mt2KW/T9q+biG/q+Iox7UhmfyO+CCEYIV6FzIUu00gzkamYMK1DvMrCjsMAN3sX9T
	G6mG0ejSEjpY1NteITXlPCCBT9hwlp+7BM6jySmBgYPpNa3IGxPkqioSCQB4ieimx3WuCXb
	3oT/zED+GeHdIwKxDTO2rg5UH14BSGQ/tnjkgnMVvIobk7ngi/sw/mOtWN/Dey5RNkpUU46
	lHIlHRkwA6k0Qi+7v9Od2E=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

When a UVC camera is streaming and the system enters hibernation, the
streaming interface is frozen before the snapshot is created.  The
original kernel then resumes devices with PMSG_THAW so it can write the
hibernation image.

The UVC streaming interface is not needed for image writeout.  Mark it
with DPM_FLAG_SKIP_HIBERNATION_THAW so the PM core can leave it
suspended during the post-snapshot THAW phase.  This avoids restarting
the streaming hardware and turning the camera indicator LED back on while
the image is being written.

If the original kernel continues running instead of powering down, the PM
core resumes devices skipped this way before userspace is thawed.

Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 31b4ac3b48c1..d44c17c99daf 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -559,6 +559,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 			intf->altsetting[0].desc.bInterfaceNumber);
 		return -EINVAL;
 	}
+	dev_pm_set_driver_flags(&intf->dev, DPM_FLAG_SKIP_HIBERNATION_THAW);
 
 	streaming = uvc_stream_new(dev, intf);
 	if (streaming == NULL) {
-- 
2.20.1
