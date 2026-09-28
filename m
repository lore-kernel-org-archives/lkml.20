Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805B4EE87A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615921; cv=none; b=DUTyhCA0T+loDKY9JB0bpPoG5h8t/1aPpJIPKumOxMcsHhRKTi36n4l8mft8tlFtRi+pi8ViFa8dIXYXnagIC/MFglG77E1p1odqKN2m7foDWQ9EO7h5RfDlkuJSSl792it4tWAqhLAWPRZejUfNPaw97miQjcMywwdtvuf8lG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615921; c=relaxed/simple;
	bh=zmMCjORbtJtWDSFmQRFFbUAM5lSo+Rhe75Em9QNmcMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgSZim3VihULPSzUDHukqHcgEfb5+Rys2igw/+4YuaftBqi9GfTdlyu294skoxWkfSFs81tlgrIwB4nuc4RCf7k9KnL5W8nxUSX+n/Y6DFmquF40s200Ubq0H+7mDR/Kl8n2qlhGcGVPJJj/2IWdFGMBsxx7sx5dktL+oFhuDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NetVhJQc; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NetVhJQc"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso1489858f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615915; x=1791220715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeSLEttyfMvpfX1KhFTKCRoBV4HzzJzo8yo9uusQA3w=;
        b=NetVhJQcIKlctspETkivLt3vo5OFIC7FFYjSpRuWBjISR0xu89urR6sFRMU/UdBOA9
         3iivU1hE+waIaMaDNXTsqYVgS14uTtY0Xs9M9eQktB6xdSwqBTqqPMUZmPqyYXQdmwUL
         EYuSkGG4Tp6mUhG6+JXHfX8wE1kh6Y5fuaPfTGeckZ482svWR6yZdFTHRnUMqgANyKNR
         NzjTPu1akf3ZV9mSaA3jc1gKahocd5sWuQIDMRh0nMXzS/t4jjMCaCxSmlIwo/dp/HuW
         NxySGHuDEQ+HkPDP3P+URdbHMHsWIERXAUexZKWcFNe73Ug+0civ+H2mSt9jxjwQSpeG
         W5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615915; x=1791220715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeSLEttyfMvpfX1KhFTKCRoBV4HzzJzo8yo9uusQA3w=;
        b=aBJwWYFyyyN+C7EqFlKtd1Dx5VC8uvjfQpFyeJHvIPbqsQJJB1v3WWftBj3CTD5zNb
         JIRu6iLsvm0Jk99VP3JUShvsk3GPDnriL0y9T29cGIn+PiRkBGRUj5LPGAd0tW/Jitw/
         kP2TWKo58Zj5YmzM0esC5KhkjwPt5/8hiCoakJAG6ffib6EYiefa+FvMlZq/EQ5tpry2
         2s+aLQXZ1zBAn/cn7HM+xFMzC2ATRb0MCOOWN1OCRnZvvDl0z764ZMWId31RSVJn1FoG
         r+JInLD+7vJEGOasuMpN88zspw9HLkEedUrs+tOXjCb2grxOHwqwSvWgeN2eCfyslRsF
         kIhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5TYeg04VQDe2/yP6OoPk/wj/uUiD2LTY8L6VtFL7GZJF9TMzMCvNrZOxjibMboruq9ppEFFh1tuEgnBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsy1EVa5dKvESPuBlnI34CDMksOQLMLnW1HiOzpJ1MeLFAarbt
	NVMSPOoK305PB0rqPlm2+rdD7dx8QYD1ty59a9nlzpuh6MI4ocEhBg9xQuSsJcZSsgZtVYdczlk
	QU4Af
X-Gm-Gg: AYBFou3XNNaz0EYceaUosKhtd0VE2YMvtRAulKDTYYIzgOQO4dAWgHk8TaXk7g3+pL+
	WwXJhEqAQ2yxqlxzr5VA+MaTn7+sjsTn4rArzkjKpQLEnKfas7h86xQqH9j6PP6QtJXLXDf++1w
	9WpoOdJ5+pM7yFK9uI/sUCsrLUo7L7m2cpJ19d350xTHP4GDPvaNa04GKBJTfOTGdZvMIrmxP8j
	gNQOZ1kWpAOKi8SdPbB7gHllAHHDnkzNZh6coRSuktj7X1MJfBF+RPlhK/mDJJNCIT/amDov/7f
	9TbnT1YUVj2Gjntf0pD2Ws2CSLc3YTZWwH1/9bFQz5OYEmNkGOy8QrvqlTIaQ/YsuXD/OpaSxcI
	sv+9QOZh1YDxtroQzuGKnZlBYbewve3131JJlitHqeIm52bwspIWfwBWX/Tp+G6qBCBvtRUR2BA
	xxgX8192Ks+ctSa9KFt6ovlN5EiAOCbfngl+IM5ztoou5DqmZ2tPzdGc1vmphLErKnXYaxPhoKw
	HNEtzSdK+0yYXmH
X-Received: by 2002:a05:6000:2010:b0:488:7803:c1ef with SMTP id ffacd0b85a97d-4887db496acmr19598301f8f.48.1790615915014;
        Mon, 28 Sep 2026 10:18:35 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:34 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:19 +0400
Subject: [PATCH 4/5] arm64: dts: rockchip: add reboot-mode node to RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-4-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965; i=alchark@flipper.net;
 h=from:subject:message-id; bh=zmMCjORbtJtWDSFmQRFFbUAM5lSo+Rhe75Em9QNmcMI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhj3YPL0uTO2f9BiZBOvFShcsOx+TPNS04cRlyJ/n
 NhoxZrl3DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUP1Zm+GfCGWTwv5jr0yTn6vTWuYubuoonyJqYCTx5oahRz/y19jXDP+P9028
 9SFQJEnud6vLruqLUqsUTilI7+E7pzmyTivQIZAMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The RK3576 boot ROM chooses its boot device order from PMU1_GRF OS_REG0
when that register holds one of its magic values: 0xef08a53c selects USB
download (maskrom) mode, 0xef085a3X selects boot mode X, overriding what
OTP or the SARADC strap would otherwise give.

OS_REG0 cannot be written ahead of a reset, as it is cleared by NPOR.
Instead TF-A takes a request from PMU0_GRF OS_REG16, forwards it to
OS_REG0 and masks the reset outputs so that it reaches the boot ROM.
That register is the one U-Boot uses for its own boot modes as well.

Describe it as a syscon-reboot-mode node, so that a reboot can carry a
request for maskrom or for a particular boot device. Under Linux, for
example:

	systemctl reboot --reboot-argument=maskrom

Requesting anything other than maskrom needs a TF-A containing commit
2a97ba20e901 ("feat(rk3576): forward any boot ROM boot mode request on
reset"); older builds ignore those requests and boot normally.

Link: https://docs.flipper.net/one/hardware/rk3576/boot-rom
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index e87ace5d05e6..c938dbcad712 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -881,6 +881,42 @@ php_grf: syscon@26020000 {
 		pmu0_grf: syscon@26024000 {
 			compatible = "rockchip,rk3576-pmu0-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26024000 0x0 0x1000>;
+
+			/*
+			 * OS_REG16 carries a boot mode request across a reset.
+			 * TF-A picks it up while resetting the system, forwards
+			 * it to the boot ROM through PMU1_GRF OS_REG0 and masks
+			 * the reset outputs, so that the request survives NPOR.
+			 * The modes below are listed in boot mode order, each
+			 * naming the devices the boot ROM tries in turn.
+			 */
+			reboot_mode: reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x40>;
+				mode-normal = <BOOT_NORMAL>;
+				/* 1: USB */
+				mode-maskrom = <BOOT_BROM_DOWNLOAD>;
+				/* 2: SPI NOR, SPI NAND, USB */
+				mode-spi = <0xef085a32>;
+				/* 3: SPI NOR/NAND M1, eMMC, USB */
+				mode-spi-m1 = <0xef085a33>;
+				/* 4: SPI NOR/NAND M2, eMMC, USB */
+				mode-spi-m2 = <0xef085a34>;
+				/* 5: SPI NOR, SPI NAND, UFS, USB */
+				mode-spi-ufs = <0xef085a35>;
+				/* 6: SPI NOR/NAND M1, UFS, USB */
+				mode-spi-m1-ufs = <0xef085a36>;
+				/* 7: UFS, USB */
+				mode-ufs = <0xef085a37>;
+				/* 8: UFS, SD, USB */
+				mode-ufs-sd = <0xef085a38>;
+				/* 9: every SPI iomux, eMMC, SD, USB */
+				mode-spi-all = <0xef085a39>;
+				/* 10: eMMC, SD, USB */
+				mode-emmc-sd = <0xef085a3a>;
+				/* 11: eMMC, USB */
+				mode-emmc = <0xef085a3b>;
+			};
 		};
 
 		pmu1_grf: syscon@26026000 {

-- 
2.55.0

