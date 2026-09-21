Received: from e3i491.smtp2go.com (e3i491.smtp2go.com [158.120.85.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272AF4E0B81
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013781; cv=none; b=DvVRs0s0yxbACUMng5sUGRThu1fSUy6Xzzblmbu9AeVByxkFwMLDjtsI2mjSwpa5vs1qbWZ3NcFAQLLdoB9lqMXs62ENGUNs1uPLc4d7ztqMDW8r/k7IxGKIdqOdEQSr5etHfV3CvIfX4iogQyQ++TAmr3o6dmkHDCAYS4cCn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013781; c=relaxed/simple;
	bh=4G0M6iu+3DbIzYRQG1Yv+jgmq0Cbd09bKLZUBE2dFXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H4wsrkniytMOLr2q3Nii0/kvdBfKJu2aq8fgyYzRIqeNRWilixK1PJVIv+2oV1UXcKxo78CaTG9Pm2n3pSr+UrHGTJdISQ57dRdbtszVPIdVh/iHzonfZRCQ6HT+iI8B4KGrmsfcWksceV4oWtpssS0D5r+5LSpCbA3IeLJsnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fkr.dev; spf=pass smtp.mailfrom=em1020969.fkr.dev; arc=none smtp.client-ip=158.120.85.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fkr.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1020969.fkr.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fkr.dev;
 i=@fkr.dev; q=dns/txt; s=s1020969; t=1790013777; h=from : subject : to
 : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=LNZ1eajasSywAC8cAFwe6Gt9F01M/AHsm3wncnenzU0=;
 b=Qf7n0o4JRZ1BKIG23MN3egH3XKRwrVc46tEytznX3ieD7Zt+c7jWjDjhGD2dPDJLEgDQz
 Quas0CuQnIrOcUpa89xuLraflYoW7f6APrxgMfMwV0i0XQzQniFm+wFO9n8jyYaovB8+HP/
 9fYjVmvECMZi31u8LZ42zKoRBvftZG5W6/Ca2M8Yeb+07Vb10GBVWoimyjUf8TO+1dvDRKK
 9yNfdRereA79AVXP7k2i6fCknF4jTTY7n8AYf1duNqkph9MCXb61eR+4Xekr4re/tPdDqLQ
 XLa0B3IUk5W4XmxlZpxPt9MtZXGVJJ56EzBfGXIwD30HtTWmzS9r7I8wOu0Q==
Received: from [10.244.246.9] (helo=fkr.dev)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128:X25519)
	(Exim 4.100)
	(envelope-from <florian.krischer@fkr.dev>)
	id 1x8iLu-FnQW0hPx9vz-lvtM;
	Mon, 21 Sep 2026 18:02:54 +0000
DKIM-Signature: a=rsa-sha256; bh=LNZ1eajasSywAC8cAFwe6Gt9F01M/AHsm3wncnenzU0=; c=relaxed/relaxed; d=fkr.dev; 
 =?utf-8?q?h=3DSubject=3ASubject=3ASender=3ATo=3ATo=3ACc=3ACc=3AFrom=3AFrom=3ADate=3ADate=3AMIME-Version=3AMIME-Versio?=
 =?utf-8?q?n=3AContent-Type=3AContent-Type=3AContent-Transfer-Encoding=3AContent-Transfer-Encoding=3AReply-To=3AIn-Rep?=
 =?utf-8?q?ly-To=3AMessage-Id=3AMessage-Id=3AReferences=3AAutocrypt=3AOpenpgp=3B?= i=@fkr.dev; s=default; t=1790013773;
 v=1; x=1790445773; b=ahqJ2WoFTtstcSInWpnQjqsCfK1JUeSmnXS0HfRESzJZg8g4D0D7dlwfDIAbIeV+M47o46UD
 Nplz6CsSq4cn5gXrOcpx3l1eHtqqDFPSjztefxBtwpTLJMibCzv4ZsPOXmue1zTcB4AClj+rfD9
 brPwnsmJDYzoLzNpsHDKfuk8CApguk1dGQc+U/exNSBEdOhaDb4ckz6HH3JUFPAtHmwKuRn8QzL
 GXoN90rfz4ONG4ejuLiinPQ6w7yuzyhjxLkq7/+IN+VLkM9ZC/QphMS2tuLu5upGg5R9n8B74a1
 hYWmSFZWEnd6bIcKhjl+nN55eEZIYLrH9F7CB6Q43DKWQ==
Received: by fkr.dev (envelope-sender <florian.krischer@fkr.dev>) with
 ESMTPS id 1c4aeddb; Mon, 21 Sep 2026 18:02:53 +0000
From: Florian Krischer <florian.krischer@fkr.dev>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Krischer <florian.krischer@fkr.dev>
Subject: [PATCH] ARM: tegra: Add embedded controller to ASUS SL101
Date: Mon, 21 Sep 2026 20:02:52 +0200
Message-ID: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1020969m:1020969amTSgpp:1020969sz5l73ojUQ
X-smtpcorp-track: ATBo55LLOMD0.DSfuz4jNXSVb.EoZkkwJhyjg

The ASUS Eee Pad Slider SL101 has an embedded controller for its
built-in sliding keyboard.

Describe the EC on the PTA/GEN2 I2C mux leg. The EC responds at 0x19,
with DockRAM at 0x1b. AP_WAKE is GPIO S2 and EC_REQUEST is GPIO S3.

The node has been tested on a physical SL101 with EC model
ASUS-EP102-DOCK and firmware SL101-0202. With the ASUS Transformer EC
MFD/serio driver and the SL101 event-protocol fixups, the built-in
keyboard works through serio/atkbd.

This patch depends on the ASUS Transformer EC binding that provides the
"asus,sl101-ec-dock" compatible.

Signed-off-by: Florian Krischer <florian.krischer@fkr.dev>
---
 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

--- a/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
@@ -59,3 +59,16 @@
 		};
 	};
 };
+
+&lvds_ddc {
+	embedded-controller@19 {
+		compatible = "asus,sl101-ec-dock";
+		reg = <0x19>, <0x1b>;
+		reg-names = "ec", "dockram";
+
+		interrupt-parent = <&gpio>;
+		interrupts = <TEGRA_GPIO(S, 2) IRQ_TYPE_LEVEL_LOW>;
+
+		request-gpios = <&gpio TEGRA_GPIO(S, 3) GPIO_ACTIVE_LOW>;
+	};
+};
--
