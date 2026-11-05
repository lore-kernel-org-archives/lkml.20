Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874371;
	b=cS041Wgwz1YhnwUoJ3R2V6h6RtmPg3uvroclcjz9u5RcfrBD8C6NiDZzG/Ds0cdJZLF7
	 w2Id38yGsG/HHq/by9w8L77LFI3RlYIAOgLLdGu4F4JCxx1m7lr52Yw5fVp3R4KZaTFhn
	 p2sU+1GgaTD9VDOPTqn/zIBqI0prr4Wumkx4SdWriW+sLjkkTlPUNjYcVRLmEOlxi2e44
	 OHjyCuhZSE2lFPNARXTKgGxGhmpi3WoO8bGqyBUt/cCjnAjzkWQKSltc3VBrfA0PvFdQu
	 IR9Asb8gBxwK8BPPpa+MZyIvnjP8ntHWcEFWtf1TEXX/IDYM1Y4M+cJLVpRIkQLq7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
	b=hfshzsld/bY96GN6m3toYaa6AI6MEXJo/21oWOuou5wbAW8atbP/PAbmjQXoCbsp+Vs9
	 I8ChL85qSFkg4teRshyBfgh1aVjpWdX1fsfTTKjxNllE6Q1b6kATV9KRg/on8FsjSN51N
	 xHsW9tmR2Wp83GY9jwk/iGDoJecUDS1GBHjA33FtAf/Pkp/IdAt0UurWx/GIvsViPmqCN
	 cye5gspeY54Z2KSJBak/O3S6mVHb01I6d0DpoIvLqLC3nfXuTgja5Rbubd//o81d6Z7oP
	 VBzUUnE+7K/+zfU7xZBOhVV7eGlX8tasGUlAE0dMKJKODhhapI/uVmP7uwCgb1fcJgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJyQ3TJT;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60201606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60201606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJyQ3TJT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so2228533eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793874370; x=1794479170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
        b=PJyQ3TJT2CEor3Cn/UrBve2pePRDy/wgARH795D7FN1PbR3aOqLJ/hPMakI9+8myev
         eKv3gtfPBL5Up657E+/j8eWmoFCX2Ug4x5iscFInhpV7uRslS5DiXIHe95s7YYiFBLjG
         YsfwO4vJlu072pOdLdgvn79T3NOsHvrfDekO5l2lMZ0HeAYzZYdXzcQ1hOtwJNWmpeFj
         4yCSRTEvwA3cIvOzekhWI4UM2YpyZbbWG6CQafkIF/y7a4BUyViPFiqsxtwtRPsBw1S5
         szNS8uxlgcHmnj0zX7CUZ8yJroOzZ/qBOzeGZGqP1hWkMc4YOy0NgLI9lAdu5vZDojB8
         SQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874370; x=1794479170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
        b=OxAqkbTS6i9AenWSX38KDoVgpA7dSVtHgygnmUlLQOJ+kZVKhnDzGLXKu2eD+7gQUo
         WLssywGjqP8NZSEfZP5lISuhqQ8tKKo6E2Jg7mbyxJYoeWVMad0LK5KpDn5GMIdld7Gc
         nxkcPsirP7h/Ik+f3x7rvKkOWb+XJBVTsojLsaA1Zy057FtxWlk94EiPvruBHESQGu8Q
         Ri7IInLf0MfV49b8qEInFUfMO7qXKDhJp4Sa8FhOsVm7tc+pidss1/P3afXNS6gZsuDj
         fV+SkFArDbW017ni3VL84y/28/m+eyJxznltlPepUdqRP1BfCHZ1ME9SXGqkXOVXOJGT
         1JUw==
X-Forwarded-Encrypted: i=1; AKwUvBxNYSdpGXMBnqYQkektCHEN9tVwbx37mTvafb0WkS3yBsyGhmPsE99R4/v1nWrGkTIGthlUVO7gT5dN8Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F4mNT1PfHukf8ZPzZasaMo10hPwf+OyOImW91SZHQN9bR67r7
	jgiz97NwL4469GxfEs/2c2zFaRfEnMRR5pN5kR8ez9bRVDZkFJVpO1bg
X-Gm-Gg: AYBFou1TuKDnXy3mHLiJAoV6mqhyJZMdNYKoq7XDrj/KhvnDnlnzKi8dUi2TA3WiUmc
	3droyEWV2eiZrWMRUX8W3SxsBdpDzikePmHFCKJzHfpK7D1Vm909VyIa3Dc25PrHR8ZSz34HQi2
	yPJQbUB8vgQyT+O8PWj/8jB1yF8WD6TALSYlxiunZvDtbR5VynmkY13dlDTaF94EhPdsAHk3Y9D
	GaXemUMHL5HmAy6NSVrdoOMpNJRg7v/diGDUiUCzKqrNM4Io7k0uEpMk8BHOgDKw8SR4q3VMhfc
	5gj8akDN4sjEBehZu74KRnVQBttaunLWHNSxDAEcXIt0TeFTBOZ/NuJpI1l3YYNuUUiSCZ+EC6v
	FfHQsFog9jB3g3Ln2MbSewA6WBhKOnO+VysFmyeEFIwX/nXKzntBVuECoOw6Lx82GB4+6QkqvRf
	Pviecwd4Spfuwiwts9TqbbUY9t3dlAuWxAp+7zCNiXrScmbjBFdvjILoV0nYIs6sINGZUNosV19
	mQgcfiD3aBXIT7YUqM9rsHlvovKAj39wcZix8BoIAGid48y3fK16drdiYphM0ftsfpShqN6VWle
	AnpkoDGuKh63+7R2Ie22hgzW3LhEsdL8pcP7LFNECtPc
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr27765980eec.17.1793874369763;
        Thu, 05 Nov 2026 02:26:09 -0800 (PST)
Received: from aaron-m75q ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36e194f4633sm6253335eec.11.2026.11.05.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:26:09 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Thu,  5 Nov 2026 18:25:56 +0800
Message-ID: <20261105102556.1365-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
of the WiFi SDIO node instead, and that consumer keeps the rail from
switching to 1.8V.

The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
supply stays vcc1v8_s3.

Fix the supplies of sdio0 and sdmmc accordingly and enable SDR104, which
now becomes possible.

With UHS enabled, sequential read from a 64GB SDXC card inserted after
boot goes from 22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz,
with no WiFi errors.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
Changes in v2:
- Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
  instead of dropping it (Heiko)
- Rewrite the commit message (Heiko)
- Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhonguwl@gmail.com/

A note on testing: with a card in the slot at boot, the first
initialisation fails tuning ("All phases bad") and the card comes up in
high speed mode, as it does without this patch. A card inserted after
boot, or a rebind of the controller, comes up in SDR104; the numbers
above were taken that way.

The GRF io-domain device binds about 250 ms after fe320000.mmc here, so
SDMMC0_VDD is still configured for 3.3V when the card switches to 1.8V.
Forcing that GRF_IO_VSEL bit to 3.3V with the io-domain driver unbound
reproduces the same failure on demand. This looks like the probe
ordering issue Jonas described for the ROCK 3B [1]. It also happens with
SDR50, with a second card, and with sdio0 left without a vmmc-supply as
in v1.

If you would rather not enable UHS until that is solved, I can send the
supply changes on their own.

[1] https://lore.kernel.org/all/e9ff5387-b3c1-41a7-b251-a12789d25a70@kwiboo.se/

 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..fe1f8d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -777,7 +777,7 @@ &sdio0 {
 
 	/* Power supply */
 	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
-	vmmc-supply = <&vcc_sdio>;	/* card's power */
+	vmmc-supply = <&vcc3v3_sys>;	/* card's power */
 
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -804,6 +804,8 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

