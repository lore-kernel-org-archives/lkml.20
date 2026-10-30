Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385616;
	b=fhXnou43LW6EF3huENuA8tJJ8VHJkZFh3g2YYCJx5AscK2bsrUUct4SsQplY2aezwhuT
	 uPUBkkuUDmC+TGnh3wfnWTtz9O7svJlQ+YbaldDGp2bO39z0k4RprPBmUmww6sRvPB8j4
	 NrSBTZvfcxWipW/jef/UPxCfZGic5zJGT7nFDn30AchIGfAj61VBQ/sf6SVeGhdBfvDp4
	 obURUskhWz3fYXm55M3fM/OfrVCzh5SV9wiaxU5pGC18Om+H+MV7UfjcNHXSr3ca0XeN9
	 8H+EI/ppPlDvxZaDE2OjIavzWg49Ij6556cacU5QftWRq2Uh+UOpyBaQ5lxBrVE0aHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385616;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nmKp4v41/VuOsBN9J0z1kpzyiFhTpOACyc1o25V2f18=;
	b=RIzkIZyt1ihDAZj7UKlXte8dP+OSlIVJICVWEzaM1g1UqUzeybnYIP+vHtoYhfmm2Qqq
	 27YxzZHegwf12YKN/8bC/0Qe5UJHezYS4YVLAHLHknsfUCXsxmLCpVZ1oS5cmc57Il9v6
	 trrwci7OFXSlz79zU+BNxUSV6ieGRWMs2OSNHWJIPbbygsq5UFbEOVufTNd/stqOpfPe4
	 hKR6gxE71ExQNGQiv50JlHr82Ur46D0P/akAPW8ikt+Se7FGH4mQcd9mGg7AuHYzwE5c5
	 NMgz2B1KGPjbqgfPJ03ifmsrHJAHMN8Y/lSPNHVMWMi3slK3V1fNXA6LYTLMKM5Pw5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmH+nol6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8015606A31A;
	Fri, 30 Oct 2026 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmH+nol6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793385615;
	b=SiP/MLXfy2SnPcNm04UeVnR+zrcQC1GK7Gm0LiwaNSLz2TqPcKCKVd2YLOz3VeYR6BlR
	 z8RU8BxBnPK3fY7CkIMb+EVtAgfqbgFlpeUajNrPfjbD8to7zCpiZG2qoUa9wKsPiiRkJ
	 biSTvD/JUmBVVbzkE+78UeWqAUy8/BgaBddM/RqqElpiX4It1vFrdxNKB/c8bIK4cqDPU
	 o3SG+KSDYpXXS/HyePTWMLGI3r+ygQSfieCvKn3koaCfsDZU//8G3Ta0S8cPKIgJz2rlv
	 TZhC0aQVZ2dE9DUtu3zlbyiyvQVEgHmq0maTKUgsHu78nzecYqVDMlWBvKZcRVrXjeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793385615;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nmKp4v41/VuOsBN9J0z1kpzyiFhTpOACyc1o25V2f18=;
	b=Yu3sz4UdhDCgvKmOzGUdYFSkl4YbmJw553IHYDWxVz6aiC+nTDp+vyFroM2l+CakriiO
	 z8BDkXzlMX4ssZLaehOfMto3k/HZ/3FcPx7h2N6RTKKmJ/5RXQFzwlklolGBJlGUE5VCr
	 LDBnNjVe40u4MBsHxXbnjO1AtpUFZ9UFeFFdVJ2NCREJR0CpE8lF7bTaYnV5YRlFd5iKv
	 yypF0T2T16p7oY7HRXt7BIfFCtJWsceA2VzcWQMwiY86fFoIoemsppfEKW3qqZma9PRLz
	 u6mxBp96B8HaJfuv59Vc9fFdi525MfnR13TORcDqVjrBy910B8dFB/1uWhMOuxhoeVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5A701F000C1;
	Fri, 30 Oct 2026 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793385615;
	bh=nmKp4v41/VuOsBN9J0z1kpzyiFhTpOACyc1o25V2f18=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=EmH+nol6Q/g8Y2eZ24nVluAEOweNP87AdS19W/ixpZnAd3NOOUC6rXVyr2Yp43uwQ
	 WAltNT1l9pZglNyJmN7ZW+Ye45xE/QZySPELULaFvOjVA9V1o3fzUyaZ4GAWmVTYcC
	 BfQWS7+IfepVeBXgsWPUufhG5eCvfPhASc0dlB/bJlcaGE2Ius+WpZgu9a5yTweySx
	 uhNIjLkk5mzfKxvtJ+aEaMZmMDwsPmU55GA2pIGSX3IOpR21ywqWyfJmzrupjp9006
	 SNE3D51CMb4ll6s5tfdv5NAhh1fPn6aPOeZDBkV4hL+1nTHLjPW96iT57hAYrCLwf3
	 74508H2oHCWpQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 389B744239;
	Fri, 30 Oct 2026 18:40:14 +0000 (UTC)
From: Rodnei Cilto via B4 Relay <devnull+rcilto1.lenovo.com@kernel.org>
Date: Fri, 30 Oct 2026 15:39:08 -0300
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-ideapad-mic-support-v1-1-7677371af384@lenovo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpCRFXEYvqDEaCpoNIxN0Vy
 7f4/wKhwCRQJxcEOlh4XSJMmoAb7TKQYoyGTGel0bmOJOstqpmdkt37NWwKy6JCxK4yhYVY+kA
 9n9+1aX/L3k3ktncF9/0AgjSgDHcAAAA=
X-Change-ID: 20261030-ideapad-mic-support-d658dddb815a
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rodnei Cilto <rcilto1@lenovo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793385554; l=1565;
 i=rcilto1@lenovo.com; s=20261030; h=from:subject:message-id;
 bh=ngSYT+Mjnj1bJD7gv/LtVb+GccB+Gm/tJ1Kvc5e3BMg=;
 b=2LxSq+RHIcA8dEoRez96sR+lFpsXGWYD38N80aDf5NYq9RcM3X7aadQQi7UKBAbo2Ltf806IB
 Hl42ySeSi89CXE6e4axzxavYCBQWy90xkrzukZ6B4+hBLzdUSJYqI6d
X-Developer-Key: i=rcilto1@lenovo.com; a=ed25519;
 pk=6PTykaxM+bmmv9zzOdlotAPqQJMtcwF9npDR/4gLHaA=
X-Endpoint-Received: by B4 Relay for rcilto1@lenovo.com/20261030 with
 auth_id=1365
X-Original-From: Rodnei Cilto <rcilto1@lenovo.com>
Reply-To: rcilto1@lenovo.com
Content-Transfer-Encoding: 7bit

From: Rodnei Cilto <rcilto1@lenovo.com>

The Lenovo V15 AMN G6 (product name 83VD and 84CS) uses the ACP6x PDM
interface for its internal digital microphone array.

Its firmware exposes neither the AcpDmicConnected _DSD property
nor the _WOV method, causing acp6x_probe() to fall through to
the DMI check and return -ENODEV. As a result, acp_yc_mach.0
is not bound and no capture device is registered.

Add a DMI quirk entry for this model. With it, the machine
driver binds correctly and the DMIC capture device becomes
available.

Capture was verified working with arecord and PipeWire.

Signed-off-by: Rodnei Cilto <rcilto1@lenovo.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 41f8c0885865..fc648590409a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -395,6 +395,20 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83UU"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "84CS"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83VD"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261030-ideapad-mic-support-d658dddb815a

Best regards,
--  
Rodnei Cilto <rcilto1@lenovo.com>


