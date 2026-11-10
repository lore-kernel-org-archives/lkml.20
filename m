Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316533;
	b=XLxLVJLbAQFCE8dkkdd0ep6Y3uXtFZbbzmAYNth/h0vZR0sjPQLmP5MtIC3uHk/4iQvO
	 f9m1ZOIK3uPhI0wVP5hPonFflf1uf+Wh1as8ZoLuzOVRNfegNj1NAW/BWgIfaMxrvDoSZ
	 ZOwgzoe1cLrcghYaAHF8x8wMDtstug9fFF3jA3ITiOuO1Cr7l/lLDUlxSyfU919BPytmT
	 R24vLSLC29GpmILMlFiNpPB9ZmSJ5zvXrzoAS9wEE5iK2rgmyH6kz8qBAnNWp04mdxIQQ
	 oGyBSb6vbJern2MpApPWIEbbxohqa4F9Oqp0qX7L3IWbtUCn6tw4VxtLql4e+3un64w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JWzAuUod3dRgtMpvML4dHGtO+fvxYrtKFqQrNT4osTU=;
	b=LvUYLUyhjsSU9RUx5NYJ0P7gY/yuujRvLQzp/x9VRaFYlkSAKIhS3m6/61XlZG64A6vk
	 bffaC2vZNSTwXpbELoXvL4Bl/YkSEniul+IQcE8a1V765Wd8qigvDuD1cnehHwWpMbJ3s
	 xwdr7XfAZbWCg9e6GjD/HmJAHzpE+xmZ7HpasvOnBrTgNdZmhp5hkm5tQlozAMKMB0HLT
	 2ZHjsFe3dMG1vg58znKqlyJ20XmivQnBFK5L4CHqDb2CG0QhwbpdEpvS2pivfCrHNB367
	 Rt0ZTRCGbOrVra83/rUV5qhSJqi6He6Xqlk9SIYtCKbe23jsijS6S5iYojm2OTNTrfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/M5iauG";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B61606A749
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B61606A749
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/M5iauG
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so2659383a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316532; x=1794921332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWzAuUod3dRgtMpvML4dHGtO+fvxYrtKFqQrNT4osTU=;
        b=k/M5iauGYm8NYgyc/J91ovk+QgUpHShVZsAhqw18Xg7qgopS3Wuc7tqvRKQszj8Vab
         1+40i9caj58JYQBxQaKQoIXht2GwNhDODL9iAa+LxbVbu4qUnmduN5j6SLWHuZEn4FKj
         oWLUuVmceCUDr3s5offbHsGoiqNRXlCgvusVGXmbYk70xDabSeQww/somL1bDWneV/ql
         n7m9VnOW19rg0co9lWDxKIhCUCOTDfRUInEvkpFuRQIfHiMNEcgAzQcQe/Z3PXCJLLkH
         cTX644iqnFic0ojHuV2L/z16iFikvQs18+OY5zeUdGJYAeoxGel9/Tj6bGDLYpNBo4z6
         DxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316532; x=1794921332;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWzAuUod3dRgtMpvML4dHGtO+fvxYrtKFqQrNT4osTU=;
        b=w68YZNX4Ac/yI/lqhtC/dHonAYFrZcP5E5nOCQ0ERKA7367eC8xw9K9tBRV6xKCqxF
         IIq5F2RvRdoo0S3KcFCH5Rj5f+I0HmzRFqJjq7oSTD8qacdqBZZj6AA//YNh3/mcGnut
         SUsGY1WO6eeMgG89MHPMiSdsc2Vrtd1Xi8yZexfrNSHWKTLF/Q1mf2pS6zPPbsWYAlCD
         DKd4A5tTwppNZFEhBFMYLRc8/2VFbiPQ6cr1prGrk1ztYwUZg4KyISldsFCQgqTPsXdf
         ccOQ4/8CwbH8mILTI2MIMa8XR/OPNSjrh4d+I7UQ+8GxIkQM6RVBRLUbP3XKwKICGfgl
         XPcg==
X-Forwarded-Encrypted: i=1; AL+hErGnAn8J2eGK/4UxlJYX45sRsMrR59VLjKJvOrJLQhidaPJ1dT/Hgu0yuShJCehYqYM77KL23601zYYCfl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iCSev1Iq5e43ZzA+Tm627iTKNQQi+Xkov80TqQDIUIOYg0nTp
	b0HPmGY8XR93cJ4LbpUsF/l+tAsdOL+Ni3OETZDvZDrF2vaMF3AZ3D9p
X-Gm-Gg: AYBFou3ulex7p2Q5JeukFlaXSiCwsvGX9KruE4Q0dyPnueYLCdbyyyhnamGEHn0nYH7
	02d5Wb43g6XaDoA9Ki191H0as0aKQ1J8kzmmq/KuLJ4YjWKjZOwluhiip3rj8A1OtqU1WwD2tzx
	5Krha7IztXO6mWQGok34ns8sp+llb82xGW6i45jB7eC2zw7U2HjcVtxkXg88B0KmUsOIyj5uUDD
	HFigYkoIHCBolTUy+53GujCBKpuZCXW8qBAtWsMLciz4mdRTHB508W0QJj5xQhoFe3BsIn74+/f
	A0DBjSBW1k3qoJAjykfyGS2VNH/pi54WU44raWxmV2aJjs3y6Q2JF/oiFLechTVtH5HwaGk4BjH
	HZz9IdvFFvsl77SrUzrNaFDl0bmaTA7kTQhlJ00QbrGhSyAcCaVvd7a4/oNHNcdGI2oLsnjG+bg
	0jm/oH5PadNlGYdvW1ihX3YBMwTHe8PJbvV+0rvYGsq4Msrr5WwBwFuUD3GS7yfj74VtLW5RXOO
	3Iniw8m1x9BZHCZfGXaME5Rv0PpYQ5Mc166vmYLDroitNzV5WSEqcj22VpC7bLcUFUnyqKBR/hT
	uIIgMvaDWlukr8eVGT73i3+7Niciee35rZ3yZV9G8ajohLHgBzFUmvCVYvV6g1nIqJgORwRGe7E
	=
X-Received: by 2002:a05:6402:90d:b0:6b6:e8cb:642a with SMTP id 4fb4d7f45d1cf-6b7564dd74fmr1981433a12.17.1794316531608;
        Tue, 10 Nov 2026 05:15:31 -0800 (PST)
Received: from desktop.home ([46.205.207.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1126372a12.31.2026.11.10.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:30 -0800 (PST)
From: =?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Relja Vojvodic <Relja.Vojvodic@amd.com>,
	Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
Subject: [PATCH 0/3] drm/amd/display: HDMI FRL training fixes for slow sinks
Date: Tue, 10 Nov 2026 14:09:53 +0100
Message-ID: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With FRL on by default since commit 5fd3b60d9b80 ("drm/amd/display:
Enable HDMI FRL by default"), an RX 9070 XT mostly trains a Samsung
QE65Q80T (2020) at 6 Gbps x 3, where 4K 120 Hz needs DSC. Windows on
the same machine trains it at 10 Gbps x 4.

The TV needs one TxFFE step at 10 Gbps x 4, but requested levels never
reach the PHY; with patch 1, the driver programs them right away. The
TV sometimes answers an LTP request only after up to 967 ms, while the
driver waits only 220 ms in LTS:3; patch 2 raises the limit to 1 s.
After waking up, the TV can stay silent at 10 Gbps x 4 for up to about
four seconds, but link verification gives up on that rate after one
attempt; with patch 3, verification tries the same rate again first, as
the enable path does.

Tested on 7.3 with an equivalent backport. Without the series, 4 of 6
boots and TV wake-ups ended at 6 Gbps x 3. With patches 1 and 2, 16 of
20 reached 10 Gbps x 4, and the other 4 are the case patch 3 handles.
With all three, all 63 boots and TV wake-ups over 12 days reached
10 Gbps x 4. In 13 of them the sink stayed silent at first during link
verification and answered after one to three more attempts at the same
rate. On amd-staging-drm-next the series is build-tested only.

Andrzej Piątyszek (3):
  drm/amd/display: Apply requested TxFFE level right away in FRL
    training
  drm/amd/display: Wait up to 1 s for slow sinks in FRL link training
  drm/amd/display: Retry the same FRL rate after a sink timeout

 .../display/dc/link/protocols/link_hdmi_frl.c | 56 +++++++++++--------
 1 file changed, 33 insertions(+), 23 deletions(-)


base-commit: 47df73aa49d1988c8f684b7caf8be6570e966844
-- 
2.56.0

