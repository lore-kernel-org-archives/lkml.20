Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367623;
	b=t2iVpBjKyPop4vbWriXBz7+e08aCSbDlx8xDHwf7vnkzmH5+7nZ9fi0pVqc0jBo00HdZ
	 Z2WBsnDonJr8uaaNsUVYDNzLW+QsWBYOHBCd+Pp8pQh5Jm5yuzF4RHKA2sAI+FZDKxKdz
	 L3GpTFOP88ZVAxCi85tO9w2yWJc9PZjpn/c/a0ne9ZY6H9sqo6onyaQbL96jN57vukey8
	 RznEaExX5XYPDLpTu234O2s4r9p3Y2w3ZWD4os5GtQO/6+GKMH0k6PLEGCP6lLPjxhQaZ
	 VJoAyDr5ejlMZCU/NDVpM5GkGyA+uuNUtbAA1cTqIJRvQSl5qwoCZXSweuAvsiFmmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QP9+Ctp3NviXfDVXP2gE2ILUUDfgBim84aqNH/sgLwY=;
	b=JNwS2ikaB/nGbJ5hPMZfRsEGUdARPpEpK/jc5BB7jITQIpZN5CVH8hir3wtMqSjLSqG5
	 infdzmPZkUBP+nfFm3k2XFXBG+pa60CSjl7WPsX3RF0idFezEP+9OFSdXlaE79OFBiwe2
	 kbOxoYC85cD04OfAgpMVttiykNKdqEvlb8xwF/Hu6y5wZQAWluPjDDhnFuicyxc32j4w+
	 s1/bAlt7Wy8pfNWWYh+CGNAJ38lCI6XS4GXwkD0T9gTw58AGEJ2iOoMjOd1pV/9ED8cKi
	 wkPuS365yEQ2wX43N5nyoXWE5QXX95xwKfoTl2e1gFCLc4qn47QSL4gAyiBYqv3AtrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drMtwf+m;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887C0606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 887C0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drMtwf+m
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso4792623eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794367622; x=1794972422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QP9+Ctp3NviXfDVXP2gE2ILUUDfgBim84aqNH/sgLwY=;
        b=drMtwf+m1+TCoaArpSMFE+ivILjRcW1xOEKThdlbgJn+jW6tmYXM6ESSXNnUC7kyI6
         Pnp2tEMVcinXZsDXOFZjXb9p0LAtTfEEakcHaOQXaJp5Qu86o3y/QOmCv46eolZIkO6R
         fiFGJkpAocQRzieorgMBUgJkCKIvGnNMifPhTIQO8PVDrVzA31mNZh173bkQ7E8ytjad
         1547enDvgfylM8STbfTy1kiwoo1Xy+HSR3RzNTa9/B30AhHPFHQk9TJD39PJDLnONw0y
         sEtIy8IySjstTlZP6LtgoU0UAa8m1q+GdLeZHKCFhgB5lvGE61telG5FithNRP4a80MV
         LTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367622; x=1794972422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QP9+Ctp3NviXfDVXP2gE2ILUUDfgBim84aqNH/sgLwY=;
        b=suABkOkySz6SWP1PfzSg0tIVA2QZUUUgHn3hyQG6fLYC3YoYpzJDpHGeN6/smBiZ/r
         FS80XeTO0KkGqyFj//g4oqrmZFw0DXbTG2FajFvlF/gMQ63oOvQmI4CZO0yS6Vsmo6Li
         m2jI8HypUDli9nvNUg12T3BQkEoyZ58xwa6oDwz3V+le2sHjuYPA6wWl8cIZi8DLrUP9
         t821wVWlZd1fSI6+PIeiiuyghNU1IJ9cSBuTzlm/4JfEUQ9Yuf2YvJ7MeZ1PEjIjaPph
         QPTJKQ+f6YlZkJJxL7pUxQm0Utc3piK9nRCoHqui0rvtLpl1dCvgQg+MY0RtKHotiyxG
         kPMw==
X-Forwarded-Encrypted: i=1; AL+hErEcFlicH0NovixqibjVQsPrpSNoTQaNtd3KFyV1x9+TTuP+HMXe3qjHXb/EPUJdWoYPicPmWZtlwf4RVuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xm5Mp2+06L0e5LQ1U8byVo2zkcyaTqviRrKJljcy3jmTiDVnD
	UlCDzTyCrhlNiDV5KW5bWEqDowoewOKzkRAR52ok0Yg8bEOTPv+DRnwy
X-Gm-Gg: AYBFou3lxvkCSzxSXWkowqnK/Wj6ARSxvpQqXwwB8QvX6jPuUPUttAToLmtxdj7Rq5r
	T85jMUYi0CBLqsvxLHm5Ur+vJqBGkBKXoBfy0jHdF6PATT3w6lJLTqqMRFssH7uq+h4UGd25PdG
	zG+DcqUCUWIsk+XvHCzKDXdtBKJ6lXxmT3j/FGHxCzUrIvvMwFJy4sNPtl9bNKVNnTwaKNCjLPQ
	w3IxQhXHzhKnZRE+AsvR89b/7RTlcj9o0FhFfb2N9Xwmvy81mpsg9x1XBtpRAmuAoTH8yVPo2gC
	xEfgOOItDV/U0WXlL0zTvmJZa2jUWFVAgGs18MwHsEIr0zo9zRmqTF6KbWi6rSObAXxlj/nKON9
	jOfVYBDH3t8ecU51JTnkMWQumDUDh9MSyQ8jLDhqBrfsCcGLKdec9hxe2NjWID0WBbkRWdqohDF
	fn2W7sLAc6q5t5hQN65zucmayV49Z++OPdgsGTwYLiTvpdODZN73Ygwz59iy1PhUwIsghlx9Opy
	gSZvw2ypKX/JKpeCKnz49EL2QG+rWb+08LEgBbSg4Rm943CzCPbQfqhTJFeeziWO/RTEFpSzfuo
	XcdDORfsxKlet0eDFbV4nCl7SxXNJBSwtXfVDAgonj0+7by3qq9NpTNwcf8n
X-Received: by 2002:a05:7300:51c3:b0:36e:d060:8bad with SMTP id 5a478bee46e88-3768385dc4fmr1982303eec.5.1794367622326;
        Tue, 10 Nov 2026 19:27:02 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:521b:36dc:be93:10f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm10567569eec.12.2026.11.10.19.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:27:01 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	david.laight.linux@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v2] media: verisilicon: Replace strlcat() with scnprintf()
Date: Tue, 10 Nov 2026 19:24:46 -0800
Message-ID: <20261111032446.29803-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for removing the deprecated strlcat() API [1], replace the
strscpy() and strlcat() calls in hantro_add_func() with a single
scnprintf() call.

This preserves the resulting string, including NUL termination
and truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
Changes in v2:
- Replace seq_buf with a single scnprintf() call, as suggested
  by Hans Verkuil.

 drivers/media/platform/verisilicon/hantro_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..d8854ceb4fed 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -902,9 +902,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	vfd->ioctl_ops = &hantro_ioctl_ops;
-	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
-	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
-		"-enc" : "-dec", sizeof(vfd->name));
+	scnprintf(vfd->name, sizeof(vfd->name), "%s%s", match->compatible,
+		  funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "-enc" : "-dec");
 
 	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		vpu->encoder = func;
-- 
2.43.0

