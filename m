Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641526;
	b=zO5YT0RW/O7rdN6PGiUpQ4vU9Hin1nQkHreCm2jFLQQ7WDWgTuD8yTKJoKn1dDRB8P2A
	 dod929KA2vL9OMOX42gJNzuHGjt9sukl1wqWXxlfRRL6aVJu+egogeIAcmYsa7niw4wck
	 rw+E9r0ofmyxzr1cBzUuuOrjKWR6X+dF63T0sh6oX6bha0rYP+6vhD0O94g6nv/N/QVyA
	 338gyomXlK/0PQzJgNRz+M7G1VLuRIh5tNm6QBfcq9F9UzDlz/kDJUc+w6aNzsXcokgUt
	 eV5h8xiAl7VL7YltzX6rFDRBIPBdaExrOhoqsy4YYUvWBJpoJ4acsPCW8JKTYsWw9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
	b=eISXDsumFzTCb0NbPX93SIzTKt9FYyx4anXloZlWqQpp8tYoDpXYpwb2hLaRtKWV3erM
	 8VumkPxpig2PR2cfb3EN09/cvpfnuOYOgY7ltoJHq/ha+Td/H0j/wV36CC2B77ca3vvTh
	 8f+UmyltsgB1/5mwp8pzidw5mMJnNPE4yvf+yaSD+IaYBN7o9oUS2N+iqpwzxQarxsj2D
	 urvmL/3/CJX7TRJNx5fVvdXzs3sopD6xq3Ww87gG/TgJW+6pFDlWtV9xEvzxpdQA3qG9o
	 VP8lRbYef7+s5ouQEucrg/7/UXZAU6T1QNlbUWifMoRh4QqSqIfVN3cCvlX8zY4NPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFq1Bl28;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE160A262F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCE160A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFq1Bl28
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so862197c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641524; x=1794246324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
        b=NFq1Bl28iwPQFVPYTvj+Yagg2+m0npXOSHihDrwQXrtHemgtn+4yWsfJ6mbPHfrXwr
         WlfqGcaaHoN7gMrW/Z0zMa5nwFmRxjt9xbm7lKk58/Wphfej6Uv6TfangX+w9vht+ri2
         tc4tvdVur5ZLm+5RrdRp+iEMKJ1YcCmBNWtJfrAA5SHkkcjr/USOsFl8DRXm8M7nVjOf
         XkLlkjBpP0g1NgwgvEKny7O6Yl5Fejglm++xH6k6+EFCJ8kcaOSDDKCilExU425isJhS
         c+ugknChvH8XD5K4iyugKB8rgB51y44AMrx7QJVZhPguhjQdUqzXQ4WogsYPoqyhUlYV
         OHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641525; x=1794246325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
        b=JwICdabNe1PZiPviv//ZyJVoEtkFq0jnZE6dN4OWwEauLerhsrykTs6B5PGv1v4Kky
         0UiA3IYUR5gpLtV3+TY0YNg3xKTRdo9exF4GRiu5aLYNQUdCaI5rm5yOB6ymi+4BVwDC
         vgT1FjWUnzmNVMkgTEbQWsZvQ+zv9jLmK2Rv6l+OsYAsC3PohZCx6C8YXwrUwFxVPiFH
         a7wSiRkpf0bSaMQJmJ1nQpnqibirQv7s+esz+7r/XPU/Zk6ASKJ8+cuIQmbwsZJHRqkt
         Yv8L9XavvVdY1r1tiswLXRXbW5DQ2d6mvNmkV0kL+QnS8oFEynI6A8Fopyop5KX3QCRs
         B6Gw==
X-Forwarded-Encrypted: i=1; AKwUvByeDZeNCGg3P+usFJRRCgJlE3U6joCXbbiN/FcC/c4rHRQDMKyjozh3gTuJ7VZIEBkejmjJR7haanvgUH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r7sKeEyQFL1K+fME10sZ5otyR3yfaSpiNGUHU8HbWh4+B0UUx
	TnXd5Q1wToOMnqM7XQwR7WrfzfOIwrWLr44v7d8+DlpRuyxIg/cY9+1+
X-Gm-Gg: AYBFou35Ngo5Nc1lpN8WipRtX7R74eX59PUxbEeTpdM8mi+7ESVy/X8Rf/VVPRznyKa
	cZwagQNo396T5nLKoFmyg/He7kZwTvY+TWqD9GFPZNtlJXnzNLu+5RKMHIr/dJI3HGlMyk8ll0D
	pQk+2/eQ4KhLPQ/D3ltf799v+pn4sQ6ane2YkMZ7XaZLrZxCCOAB/XM9vkSF6AsiZjeS098WNOl
	4KcAG10qjjbLAg3p9OJsxpLl/uR+mS8clHY1F1Sp9n2Bca7Nssb5sgLtlGk5bhbZJMUdgncPy2b
	QgHWr/heEJzhdVC4E+z3Z3fK3XrMdN7QaCYOGeGmCsX3ODFVSkqJxIFJ06oIblz+pZFu8gqC26K
	Bm9N/UjF6VJ14CJKFJeGUBmQtLRtZfj3KkKqgNBPGe3getVAzbjTHYeOFHQb45vnjOsVZd94ckJ
	DS7mo392WX/X+UZGN9Puoe/dqInBTPqsZ29X2UWLL+3su7DTHyEn9+RidLbYKRm/Uakq7urhAnW
	PM6phQ144ygqMBbHVGk7Ovj16oDKMPqMQzNf6mnX3kfES+Ur2v4ikbp1RwQb41UbjNYcOgK+PjM
	4NTBOYkSFTp6ovVHlsPzJHp/Sm8=
X-Received: by 2002:a05:7301:4b10:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a424940d9mr16596225eec.38.1793641524327;
        Mon, 02 Nov 2026 09:45:24 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:23 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 6/6] arm64: dts: rockchip: fix modem power supply topology on Photonicat
Date: Tue,  3 Nov 2026 01:44:50 +0800
Message-ID: <20261102174450.3000397-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

The vcc3v4_rf regulator supplies the M.2 B-Key 5G modem. It was
incorrectly modeled as being supplied by vccin_5v (the external DC
input, before the main power switch).

Per the schematic, VCC3V4_RF is actually derived from VCC_SYSON (the
main system power rail after the power switch Q5013) via a ferrite
bead (B1).

Change the vin-supply of vcc3v4_rf to vcc_syson to accurately reflect
the hardware topology. While both vccin_5v and vcc_syson are
always-on fixed regulators without runtime GPIO control, this ensures
the DT power tree matches the schematic and traces the modem's power
path correctly. It also clarifies that the modem relies on the main
system rail rather than the external DC input directly.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 290e3ee97c709..6ba70e5d9037e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -177,7 +177,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
 		regulator-name = "vcc3v4_rf";
 		regulator-min-microvolt = <3400000>;
 		regulator-max-microvolt = <3400000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&vcc_syson>;
 	};
 
 	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
-- 
2.47.3

