Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819596;
	b=2H7InvZ2fazoI/6iztjN8+VbqVXUCqg1TpUEPM+50a7ZZwlJ5d7LCE/xo4KgtD3W38KU
	 ws/JnoF7TOELdlP9uFIiATykt5HQAkVCNm9gb9ajFlrAuye8UwDt6ANczvtJn6iynJalt
	 OsmZ4l2smRN4oMiVBCP2qOG6tjmZwZHPsun26UkUs+z+zQKh0XgwRQcClAv7vp///IE2w
	 TlJCDWgrz4LPAfQQHPhz+mFWLsMOtCDh3U5sDTTJF633JvmEgfukmDdmB1zvK3NlHM1nc
	 0cQIAEoaRJj/n1RntkB40konhI8lXi60Yl7AKCUXMRkn7wxB2sNQVpoNubFCFKRm2hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819596;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:Received:X-Original-From:
	 References:To:Cc:From:Subject:Date:Message-Id:X-Lms-Return-Path:
	 Mime-Version:Content-Type:X-Mailer:Content-Transfer-Encoding;
	bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
	b=rhNQYUGwckxwOltQSUceeacWCHBgqWxlrbJWDWPJTC/+3R4dBVIqpRsIMS9VwLVUfO3x
	 EhPrDY624+Z61GZObqPDBQnkS9aq0Lm4eglhoDoxKfHBqrEUChOA4hyExBZ7ZTc4SyK32
	 As9v4Y+Sg/DI8iA6Sk3EWc9sjmvrC7pmWCQ20CdkznArM8HT0X4oiwCGBuzzudcKqxZbH
	 0Z4+8B6M8hgPhtbr6j2qlBgWIORZwPJ3enQCbexalulm3zmaPZRKjHh9ihFEoLI2g/Dgs
	 dmnjKHWj0Wr4Ge5D1iJwzkUQCvht2JYAP0NT1et3ykN9uKHqajyBmn2ZS+44u3z3UeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=VzF2SKeb;
	arc=none smtp.remote-ip=209.127.231.40
Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF341606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF341606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=VzF2SKeb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819587;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
 b=VzF2SKebM2tfBqKWHLsX6g8reSqKCVz2vlO6e//8DdstCMFTUGJ+jFOnhcHHH8EUKzvB2v
 0A2Q6Outjo9PxvOgc0MG6jhqgRQDghuT5ucXhKKuybR6cd4LUMqSX/ZV3RPybaGX6HY9YC
 WXBbJGremhZe+D2ru5lS/Lzu5zMuI4jICsI2nPQA40/eALVj38cGuS1mGUdJqr99kcyzb0
 40GGjRp4Y2BXj9K5SOIc4akgzJGh5jzhZopaIrllBtOC0i5Oci/0O5ilKeyfgi/xHxJF21
 aO8S0HFEK0d6D+uN9iajh8rOBC4HB597c2Va8NUNfL1DnG/Te5TJxBw8t0+yPA==
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:39 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for Bluetooth
Date: Mon, 16 Nov 2026 16:59:30 +0800
Message-Id: <20261116085930.951304-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac5fc+7c7f4c+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit

Expose the Bluetooth enable signal of the FML13V05 as an rfkill-gpio
device so the Bluetooth driver or userspace can toggle it, following
the K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index f84225cda1e9..8c12fd01227b 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -37,6 +37,13 @@ rfkill-pcie-wlan {
 		radio-type = "wlan";
 		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(30) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0
