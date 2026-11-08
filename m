Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794175374;
	b=FTnlFsVyf1vj9Gs9Km7jQ4rx5/f15OPTrXJ1XfltMuW3QFEnZ1rY84DEJZZlwEToN12Q
	 0WjIYq0Ec8g0u0ScJ0U2UtBNf1Ai1o5Fsc1v2qykCE0ckR7jUqFTLCbOoJQu1lzhicXcY
	 Bbhg0RB1ju6C+896ELk9fESPtbBESrtUrhnOQXPsVeEVzKzXGQjzU3utkv1UHE/9fYSsO
	 z4zGLcn0q7uFNPRcSKaadnp9N/OmYssvTYGq8Q05U6wYBKEdD5ijDFRxObXS86V7qQAdS
	 5hvywCZdFoYYd43frE0voP64n3i6JyHR9N7GCSL/74mc/4MMmPhJfJeB5ADeEMpLf6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175374;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mimUxCXmRdRWf680HpItYRr1bGkMxj6FEoMyisnpVbg=;
	b=J+tEjgBp9SNyG92jDucGaJPqbFmYIHNNFid0b9cP40uiW22+qkYWnlMsVwXN9/hDms3x
	 /tZH7Pdx2qULTPRgMgsEeHKEkD0ejaRHvnefdFZ7rCgL6xq2zDChMCO2Axb2oiNkZBl02
	 05o9h/MswIeYxbaOTdfExhJhJRwp9961NcpKkQ9okq8RDmc7WePq5K9h0D0GNO3OM/RWl
	 t5KP+l/HH16MhZDhC47Do9skDixc1oRMz+vftTnvbMmS02mFh+JeopmSeB+kuy3qAtBYZ
	 f+uDj1ShhW9fLdRLeOw3+ziNtubYDeyrkpmR0PdggPAaz80+CyBJ0lFqW4pnPz3VfxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pi7Vrb+1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90E606A320;
	Sun,  8 Nov 2026 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pi7Vrb+1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794175374;
	b=JttGF4kCf7/WOWCO1HBkZ9uEkoRnspOXug9VRSkqYNfzp01LUhGNsy8t///7k9A+Awe7
	 YO/5ETHkoZRTp4HrqHUo3SLtWOdXmO9uWFyT3R7r8JQXYtIrbOJmNfhBSnDivR+3XLhgt
	 xr3wTG0AUhij4f9vmRla6fs47ok8UDsHPbgVltEQYYjCGVEGRIuF/dxm9Sm73jILF8RXa
	 spaNoUkLSvu8ZG3kbC7MPYuZVzxPI9Wz5bJ8aSNiWEaH3bm8BnKX5b+RIheviGZBdKEqK
	 GAZNv00GCinkPnfWS7C3e3dUKdw48e+AyCIinPfjeuUjwHHz20tiPvYMaSYD9PVCL9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794175374;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=mimUxCXmRdRWf680HpItYRr1bGkMxj6FEoMyisnpVbg=;
	b=fRErTDQxK6nhZMCXx4PAu9q2pJa+2o3+FUmLvWxQ0sNWq1VRXpS19ZevgLD4qh0v9X4O
	 bik+Qwng+bUv33qOC5b236VQ/50xyOniAn0GFbUnd7Rp1+W59OkluPxB8KFM0cXkF0wdk
	 iZA+um+SAZ9g7yN5Afbd/rDf3nL8DSXf37F/JPqYRxHeLvJ4eFmCraAMGmnoybAzGx6k0
	 ahX0dTEhj5bok655xmh5l9Wp9cALUHworfxA655z7QkXscJ+zUrbDn6HhmAWltQCgJXcF
	 g3JBi8FsF0absxvd67CffGA0hu/RAkDZd4+15MCkiN8KZgPbo1p23ZrKaVNaVt4H3Pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 899801F0089F;
	Sun,  8 Nov 2026 22:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794175374;
	bh=mimUxCXmRdRWf680HpItYRr1bGkMxj6FEoMyisnpVbg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Pi7Vrb+1SmxCIbk2rv2+FLdua3Nu5/LTFXW7ezqn+iijXO31sccfK3LMugf0pDarO
	 H0H0UnciBbL/v0iWs2X94XO+mr86V0pbTUxHBP6wAX1ZRMnzbzHbPj/FUN5kMLnNJ1
	 I2Y3A1Xjiojxngd1LH+5K1clw7GkGyjMVX1UmwljyPYcc5iDpG3rOnmrmAYMPWZCNr
	 fiEdoZGe+i2iJ/bnYd03NASi9NvO0JL4r7ZsmfWFwUf+CkkxyuObPaTuMzUYjW3KpG
	 rmKRIHzY1a9YCg6DQsPoM23Q4GAwpqKpUVngewBpezwNb3hE6FFPb8vIdWs4lLU6+d
	 9upV1/plj0Csg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1539948120;
	Sun,  8 Nov 2026 22:02:53 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 08 Nov 2026 22:02:51 +0000
Subject: [PATCH] arm64: dts: rockchip: Enable all CPU OPPs on Kobol
 Helios64
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
Message-Id: <20261108-helios64-cpu-opps-v1-1-31aa4afb7eb8@iav.lv>
X-B4-Tracking: v=1; b=H4sIAIrx8GoC/x3MMQqAMAxA0atIZgONSBGvIg5aUxsQWxoUQXp3i
 +Mb/n9BOQsrjM0LmW9RiWcFtQ24sJw7o2zV0JnOEpkBAx8S1fbo0oUxJcVhWTfr2ZI3BLVLmb0
 8/3OaS/kA9iWdAWMAAAA=
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=edWxjml98aK3nfS7bKrBTOBhCYbn9/aBY4i4ZQTEi+w=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkfPvbcO3oyY5n4PY38eIPUy4H8X5MyS+d79cz2eHWCP
 17kCeOMjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCR4ixGhsaSmH//uleGmGUJ
 yaTNFvHkY1ad/Orxue5HHBKbHlU/TGT4X7nt5sT5M9OYOcROTH2ybdsZu3uB3Pb/jjlpVM2ZczD
 wKRsA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The Helios64 device tree deletes the lower OPPs of both CPU clusters
because the board was not stable with cpufreq.

With all OPPs and regulator-ramp-delay = <1000> on vdd_cpu_b, the board
hung about 9.5 s into boot both times we tried. With 40000 it ran 40
boots and three one-hour DVFS runs under load without errors. We did not
find out why the slower ramp hangs.

40000 selects the slew rate we read from the regulator in U-Boot after a
cold start, 64 mV/us; 1000 slows it down.

Restore the OPPs and raise the ramp delay.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on Linux 7.3 and its device tree, with the U-Boot and the .config
of Armbian. The PCIe host driver was not loaded: on this board it takes
an external abort at probe on some boots, with or without this change
(about 5% of boots with it, 1 of 4 without). One boot with it loaded
brought the link up, without DVFS load.

Besides the boots and runs above: one hour each of schedutil under
bursty load and of switching only one cluster.

Ramp delay scan with all OPPs: 2000 hung twice in 5 boots (once at boot,
once on reboot after an hour under load), 8000 passed 13 of 13 boots,
32000 passed 3 of 3.
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 24 +---------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index f13ea2df7a30..f2f900f576a0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -354,28 +354,6 @@ vdd_log: regulator-vdd-log {
 	};
 };
 
-/*
- * The system doesn't run stable with cpu freq enabled, so disallow the lower
- * frequencies until this problem is properly understood and resolved.
- */
-&cluster0_opp {
-	/delete-node/ opp00;
-	/delete-node/ opp01;
-	/delete-node/ opp02;
-	/delete-node/ opp03;
-	/delete-node/ opp04;
-};
-
-&cluster1_opp {
-	/delete-node/ opp00;
-	/delete-node/ opp01;
-	/delete-node/ opp02;
-	/delete-node/ opp03;
-	/delete-node/ opp04;
-	/delete-node/ opp05;
-	/delete-node/ opp06;
-};
-
 &cpu_b0 {
 	cpu-supply = <&vdd_cpu_b>;
 };
@@ -542,7 +520,7 @@ vdd_cpu_b: regulator@40 {
 		regulator-boot-on;
 		regulator-min-microvolt = <712500>;
 		regulator-max-microvolt = <1500000>;
-		regulator-ramp-delay = <1000>;
+		regulator-ramp-delay = <40000>;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261108-helios64-cpu-opps-8abd6fe61f01

Best regards,
-- 
Igor Velkov <iav@iav.lv>


