Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639010;
	b=c9qe4S0Ua9/ZNmaU3qdYH8ze2pNerAAS+Qtryrtk7KeTC6P+JAXIAeP/7JvOozwSMB+G
	 BkMRZTFw+qHemjuZub4/2mQ+1Di53A/4nsO0oZAoLfQ8yq4upwm1GAla6tjxDFS0cliLJ
	 Y79CZXhTofoz0el3a3d0FUcFGZUG+rpkDi30xIJkrf0/cs4lnFW8gdUYCVoNvlCw/bGsX
	 ziR5L7sjJAM1bjJkQBw6LzBl+BgvAoxLx1EogkTAkL6n9tlhVepjpIjY7oa8FiYbaFGe4
	 2lqThjjDM/eWH+jriOTuA9dhHktdVAwmy2w6jRwjZTmOF/6K/oWStllNFFm0EPeilwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
	b=BM5+IGNMConjBPhLKnl4JFnNRshR6jp7fvgy7JDhEEPv+uuAuXVrzZss1h7dzUz5XqIQ
	 NPx2oEMz1lhF/pcZjLvJaAAy/etT7Pn4p6jrBS2bypPDXNI0jGwOHwIF+gUhEhW+9S706
	 6ztCloyAb+3gdnE5wzO2qQYO94aNFz7u7KOi8+YVFwHB6Q7ldUg+hNGriV+msDqvLTkLk
	 3qtzXnpM3e26b0uusWSaamIkBib11ht0/aj3JiXaPK3QcaqgFC2gx74nY4b7JfhBR+laF
	 J2SLxOrvk2bAqYKgVhJm7fPYr+fgdNs/rBpZbXR5dkcr2ml9+IJa3eU8YlZn4ZueEMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuWHqt5V;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7A8607BDDC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7A8607BDDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuWHqt5V
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so33340095e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639008; x=1794243808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=BuWHqt5VzLYepYCUJileVJnI/3vztC281ximLogJkdQgpWZlIvdFSapFuVCiXO/wnd
         stuCMGPPeHllzneN+h7Vmg+tzjvFwh58hwKeGcrqKSuObq2I77bXidAATD/Vema55ktt
         w8olA7KV9JE9mc5gF8Z6CmkCsgidyddgEelmfJp0pDoMPf7Fqn+h3YCQGng2nUgcHONC
         JCBCO6VKAQV3Wm4KHEqC7D06/mZgR+MyMiqtJiIUFOsP2xCVyqI1Kgcl4Fk2K67lcjPO
         9wkj3TwZ3hYjaaFwDnPG3sjZcQvvtKDjaMyFef1iq1iSO/AhuAGY1Oe9WDRxZY4OA4ad
         MoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639008; x=1794243808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=u0sh5GZXqvlGO5X+KV/JPjc0mMGPKz7uF6/mhgcfKU8KHGrnaxqKBTSgujvASJcolO
         WgX5E/X5n4X81df85cb0fZHAIQ7LwM1RgNuvo+LRkvgdiywd2RlXp5DdZZStPwbc3IXb
         iy/+AcRneCZsuVEsjrBwZug8dyYSnl7NfO5q0OLzHgtNJkIqLdqXKw4zDXNEmRUYUPF1
         hT1HHQiy4htpX0WQCkG4o0+NuwnE2n2jiD3TaH9QdjJTio/1EK6CJOSIGHOhV7I03Mat
         ui/DIMokmjbINjsVDDq3QWLZ7PKWEmhAl6WTKdU0kcmYCnPJi+HoXyl7jE5dHB5jY2Cf
         EpDA==
X-Forwarded-Encrypted: i=1; AKwUvBylb9lEMwD/jD1rXCllyQyobuYeaGkY4L00EuaYpJqhkmCU4/Scwk3L+P+Ov+FY4b8vd5m5zxuiO1sY/KI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv0HH9PVqXYS4ha2+q1WR9s8gbFp8fzXxeyB6wTS5NNKCK19Co
	tU+A4ykq2fhrDHBfv1f4I+CT8dcyZcM7atCgqJTFe7+tuN0Tlrxjrksw
X-Gm-Gg: AYBFou2XT5weT0v/k27sVlaxAy/vjv6oyc6DRdAug3kJccVgRMHsygB7unUVW5sCUrQ
	FqK90/U5C+A88x97gORjbbMFe4G/6lF2TxDeCuG1P5Mbjyls0/kLJTIoEkehRlnmmLwyaCKTila
	pYwNmI2xyBd+Cqa5kZw1tmwfD4XpFLA8zKoKHojDdOS5tmj4bccLUbWvwE27wF7VCI5fwAJ26B5
	tYtdoXbvk+amMBtj1d3JBpD6SiQaWT4LUdyg0jlg1URnDBDKesC8BByPG5vSnB7Ll8ed3/wngPc
	RMH35gazxPuSSZ6DkE6v3ZPF0uTZDi+0DcAzQxjxwhL4g79k6HQxBvdQPJ2lsXqh5jiyR8h6CEv
	Wc0LTZm05Xo+FD6BmLesmJnvJ/fWY3V8mtpKUiI50OU3PIl4jkp3QHb3+B55x6LIdePOlI0YCgD
	TAHkkQmjC7a8h/FzbQAjee0YZoR6lmCAifB0sXBYM4DKPpBHyFS9tM05C+pTPAwxkAmKpuwf9M5
	Vwm13zcE/A+p0YIRN+D2ptOjY4wUtXxesi37w+VQci8AkSCdvRWECW0oM0tvlUcKno/0boIG+Yc
	YeBxIzJUm70DkZLnpif7lsJo3pRi9zIK/ZvdHxFQ8S3ad4hAd5q/cdBojBvsjVB+CxeBUze5ggm
	DOZ4+W/NzxqYgPnIIPW0hVebHKkQyNqRpPOkxYsn5Zqe+8wqUCafHrFgHY5aQyCerqi9P5C6YAi
	WYi3IJneDCYmvahE6TR8DnSB0vxtTONg7oQb1jgsEloQWaxQ3g7Et2fsj4jG6UKCnp2OLy4ndTD
	VnCaXdy1qGNbN7Ya/oTQeKhhDiC3TMQ1HczJdATV1oXfrUdTg==
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr261716365e9.16.1793639008306;
        Mon, 02 Nov 2026 09:03:28 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:27 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
Date: Mon,  2 Nov 2026 18:03:00 +0100
Message-ID: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 45deebddb630..756243795de8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
 					  height))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		unsigned int bit_depth, max_depth;
@@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
-- 
2.43.0

