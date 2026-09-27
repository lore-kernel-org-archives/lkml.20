Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CD3B5314
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477816; cv=none; b=mUhF2I6pr5Fh3X1a+QcAGQPJMtdSNEqYRg0XhYUeSDj7yb6COjyPK9+h9ha4ipkZn/GfuLSV0A3iuXzmLwBN/UVWosj8JYqIAcEOHNCstqVd+yqmXwOkcVHrbI2jYzWy748/Ilang/D4MqCX8HtBzcCVnt0XHEM/qK3atYNqV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477816; c=relaxed/simple;
	bh=JLLY8202AFqPiR7IQZMFqT+Np/Pbs4qmrHh6nwqETJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dCJTSFj4tMq1/AKgkasbZMj6O5PKBs9uBpVv9xcYjuaCiHJNyQLmD82q59R4DfhXwyOx467/b3M9rKSCyjkJVm5kzL654PpWF2Mr6eEEDD3EPrBdIau0sTosKdY1M6UqFCOum/Sq167R8GWQ0v0jKU3jAeBWkVYVPXDLzBRJMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=yoKSfm/1; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="yoKSfm/1"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso10873755ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477815; x=1791082615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=yoKSfm/15VtXpMM9+BHs8gsYgRdp7fwEG7DGqYNixRewKAmjD+qpvwSmp0EN7Imgkd
         oY3BYVDjMuvkHdv3wVGcCYa1eLytphX1iofvzCFLTe6/xXEBzItwgUbIYD6vwGiTKQvH
         YsflVsgNZD4ccxI0buRouR+CCUQscg4+bkUJqfwSfemJY4SAQnSId+Ao8TKWQFz+TYx/
         SPDvXZTvanTWMeaKDza11K4VFayIFhUtvnDrO4OQY6ik3vjL1Yqgwt6ccQgDidztCsL0
         GYr7N9KVBlSh5/msOduPrHWiBT/w7z072H/4wkcAq6co32A0ghbZwKj14oxSbgajNfXO
         nJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477815; x=1791082615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=Gm9oS+Mgucen/CHQd6X6ZiDrDlUoIq7/fauppjj5qUFV/XGIFpbMTESh+cd5pAMkDv
         xqHVJd6pD02jGGSepvPqjRKp+0UNJOpaQIXXepZJ3a2/X2yvIpC7UoaEXF7id99mX6B+
         oDjCs+nAfL4PtulvCKeHxhkymwqeb4lPrJYxlriRFJ5DjFEToIPvHRRgHZjGeku84T6f
         7MZOv0WrnxZU9cxS3FmKgxXTAAxZBKZtQy4VSZw/8lOxbgIS+dRWivermmiT7UZfwn6/
         RRqZ/JBoH1voVPgYTu73WSegiQZFqSTH1JXRRiIqsldM/nDo/7NgrqrIlDlAgKyOoPSS
         xTgA==
X-Forwarded-Encrypted: i=1; AKwUvBwXlgza9tA4u5/MFzNWsDhYkBBmRwfygqbzPPCZ0RE6C2C7VMJLVll9AkEAGbyUiT07Vn5QoENlx0uabSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYInk35+l70zOtNi1kyjg4U5Qq+VKfvGpmbSVs0pGg8eooIPu3W7
	6joBoj6wlnwAk8N+RiQUQBajdMBPm9Tp6YrHzilC74tf3zSzK1+0wxvtlyGuJw73iUZr
X-Gm-Gg: AYBFou3Bg4ApsLIqAO/FlxZc0ds7AABsDkv0Y1dt70Fpk0RPfGodWprEFKfQvewhg9K
	BJPR64Ou6yXlj5wj7l8Vhz9mAac7oTFdC7CaUwBnuAIb1dkVPgL1Ne1ymwYViJ4A78cM2TdLFFV
	eeOnYMy7UVuGowgAQN6UOQm/ISVh7/KhfROeK/nUI3DEfr+6yROwuhyHLE6zkAWwtRqe1Bo/3es
	/XiPW09FxbmknG6dTgZejZZlwC+PPu9VU6cQyQlDphsTZ2WbZnu1rPAIxmDIptFPw0a+G2TwXsZ
	Pyz21DyXvXASAcNz86DTSQ/olsNRGfo1BDRu3Vjb4LyGjmjAxVbkUilyQergCSDe8QwPgSa2xvp
	tyUN+pr0e3GKsEuRmVbYbIOjyhrwLTWa9XiCZr/OkZotTjvCpERBk2DOJ84eoNc4jG21jDe9yH7
	giaXQKp9BQrPPSozmz3dcJb/qq8v4p4dQEi+GCkJTh9mULXsNGcr/vqbpkDgjeiB7EtSWgXwxYz
	a/7
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr80615525ad.42.1790477814644;
        Sat, 26 Sep 2026 19:56:54 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:52 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Sun, 27 Sep 2026 09:56:26 +0700
Message-Id: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware spinlock of the D1 and T113. It goes in
sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
has no spinlock in its memory map.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
index 3b077dc086..228cc5c074 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
@@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
 			clock-names = "hosc", "losc";
 			status = "reserved";
 		};
+
+		hwlock: hwlock@3005000 {
+			compatible = "allwinner,sun20i-d1-hwspinlock",
+				     "allwinner,sun6i-a31-hwspinlock";
+			reg = <0x3005000 0x1000>;
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			#hwlock-cells = <1>;
+		};
 	};
 };
-- 
2.34.1

