Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665FB4E431C;
	Wed, 30 Sep 2026 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772278; cv=none; b=I4hCVgAzbKVcgmX2877+4KxB0ExoQnv5V2KKRuxnUT2zAJOuoGqXakm6txk9G/5zVGr5BurlYD6tmgNPfmNvyzC2Yhb4b6Gf75ySQOv1fS7zra84tJp3JtAfh2ELqUXSVU2JHgOelE9DkZRbxOC30vOJGxwswqa5zbPpcfS209Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772278; c=relaxed/simple;
	bh=NGqdnwnUvBZxVA1GeH0SjjfBXNw7+fXjQR75iosVxoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=en/em9IcGtHXYjWg7B2lcR1UIswkshIyZdc2UM2Vsh6bKR7hMffmW73hyBknvw3DLPO57ztU5CMXP3eacsRmMIQ/8no3Y4q22GO5O39mcIfwGd0i83qeiaJVbK6qHyrI57h6/0+z+iv9TwVY9dRy//JWf0nU0qxeYQc2xI2ChSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772169t64b28dbf
X-QQ-Originating-IP: qDMJQCvc/X6gK9EeyapjuZFtWVRaYsWr0gWkAsEZfQI=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4880174641488719103
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:55 +0800
Subject: [PATCH 11/13] drm/msm/dp: Initialize the debugfs connector pointer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-11-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=sophon@radxa.com;
 h=from:subject:message-id; bh=NGqdnwnUvBZxVA1GeH0SjjfBXNw7+fXjQR75iosVxoQ=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZdlzLFyrc/fJpq90WjZ+jd7FcLOf9y48WSzV3FA3
 qrPVWu7OkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEzk6BtGhgPz5hQen8QrtTtF
 I3zH7fdpbyy/VzYsX/luTuGicwZL4+8y/A9K583hFrg2JfKHs+tWgwlu66wcov722W/R3/clmLd
 mDQsA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OY4d4zk+uix1FNiAVhW1IwVEW2LlIgxVOIpKpHfGbeuN5NMAO0gFnLpC
	k9TFHHCa7EDcbuwcfkVfzwQ+iyRPSQ1G818gAwIVxa3TLc3LZIPtxCgLL2VMvKwIUwpg35t
	mxGQYotHQY5Jc5IKaefkaclz5cxnYqkYgEXgQsdfM4Wa6HF1vM8XAeV+gB9HQjuor9Tqbxc
	v4Tijy4RNtxAyqeD1lgWKOCrZuCCtUfcXod43nkUbZR/hnjdwAjIYWEh1EPutwov4WVQ2BO
	+vxYp9g4Bw6jrOC/IqrBYmnU/Epp1Lk8HYoqB6PZdLjnFATz1meCxoeLENTG0giadNO1gkm
	rYFvoSFw4MK3JP9KIuHN4cffCPwjrGa86EwHw6qgOWJOoskI9yL+JkAWgzbXJRESZclIInh
	n0Sj4ZPGAkSDzB4QVKrWyR1wy/mGDCCTfhlFYdaIzKGSFCMgiLSMGs6JpmproiChwYhtWLA
	Jjco+UvjRZrt8H0BVVnBNul2AZTESeuN+a/Pkn6AJ7x7HKzSOyKoYEoDz9dWhGKb3KNl28q
	DLih8g9RpFgXxt5j97AsNoFm2NPGBzZbscrB3TlWj9VMWTLqWLRyfd/U02ekIFeelVHYscT
	4+w9qIVy46MfVY/uKVaPRx+Pvu9IfMawP7BbHjl3GaaV6SI7qjwmgCTCEcxkuGrtjERZg1p
	gKhxzgkvwPifXsX80JJPL6wtxs6PtP0t7p34WKfx+3ZDPqU7AM58kZL8cpfQj+RXm5LCpVd
	yJy4l3+twjtiUygB2/gRwD+A+wMFwZdXMjtPIIyu34AcqXE4tuLJ8wn0s1NVJm+T2AhX2s4
	JFmuF78BYckOZ526uBuIeUrJcIuZvGN5X032+kNxpF5kz9lAt/DcxX4nTRi3R+HyxPawYK2
	nykbriPLtn3TXXUk41GXiOiNFLaWhpKMAKyhyIynCxkS9bSuu+y+0jriwzrH0xYEPeVXtoF
	V27w6KO2IKjTbrD4vuNjGNkyCmBUHhbtJrx3CkNZxT5JZnigvfnV1AeDJVR0hmOw7VfN66M
	50O2h6jSUi0TEv1nVd6jbvkpL3o9zaZA5pR7RXejU1/WX/U/MF71MNsdFqD8ZsLRGUcG5q3
	9PzwCJqfayK2QfqStdf9JE=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The debugfs cleanup removed the connector assignment from the debug
context, but the video-pattern test files still dereference that pointer
to check connector status. Reading those files can therefore dereference
NULL.

Store the supplied connector before creating the debugfs files.

Fixes: ab8420418c2e ("drm/msm/dp: cleanup debugfs handling")

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index cf3838fcd154..00fb1a7ba40e 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -216,6 +216,7 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	debug->link = link;
 	debug->panel = panel;
+	debug->connector = connector;
 
 	debugfs_create_file("dp_debug", 0444, root,
 			debug, &msm_dp_debug_fops);

-- 
2.55.0

