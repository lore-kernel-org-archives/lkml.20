Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867654E2F01
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107533; cv=none; b=V8VP/nN/BtXEaEabQwD63LaNvGd1lzDC3gKyVpVi194yX0lUoRFw1qmhwM79aUWmtCDI1vbE9Ik+oceDV8bmrciQXGz1+OZWJ9/noY6kvPHFf2/ag1v1678qLIEJL7RM67MT8Op5OMERhUeXFxAUQhRF7tYpvaVJxFTI8LaAUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107533; c=relaxed/simple;
	bh=fh2Uu82ejF0DtKt0brgXH//fEo0R202bASP2cymwUFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qT0Lg13hGRtjqTvLlfAaJ8px6NeBTPuzi/mzwyh/coRZhrFcIscZYVR02NVXYOqf1tALfmpYRMebxuzt1pmvz23jq6gnFFq64r32qJM/hCq15QOlp7BhY42AV5FC3p36TN3xoyLlYLoVkLvjqUxAEv/4mm9U1Ecddnsly4cqRtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdSVq3K+; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdSVq3K+"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso1031805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107512; x=1790712312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=UdSVq3K+yojQHpnGmXGkAEkPTwJMk03Ajk4hF9OLMwsODOjQCbvDf+WSAgGPzHIWq2
         nRgmIJdoOtiaRZUQPD/DhCTuMORzVe9/jqNUoQDo7z8ZzIP1FdXm3Jbo7tZViUWx/m31
         mfF3kkwqEvFh+8FkrYN59yqQKqKabszHdHIUpi3BwZZ4l9FlpmJHXUFjaMmFfT8kaew/
         dqm+gs3l9v5N45jo9WZ/YYs9i92/yVuHWd1nTp1K2lPxtAkEO6cXxCakPlh1XJj13VRM
         YMCFM8YYrgdAsN6HoQjVmGG1cS7BIFlI4ER2QtgfLQl7oyIKbQBmNofZOf90LUkmEbNL
         KdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107512; x=1790712312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=t1cJ4iN5oqvxiS97dy9fw8vUu0yL6OWbc2nR9a7fORvF7W9cKM8glAX0EU8nHcqvTJ
         padnHm+FmU/J1uFiq0/cgJg2KwAai41f7cQQQ+aCLaxRflAYPxH9GSeXP4Yj2OzUo5AJ
         XSdiWbtzGql1H5fa68dkIBvqxPUSvs5R10t8RVMS9zhgiuCkYU0M/apoSXktArASeggy
         w9+f4TX8n1yC3y0rvkWTNV8XP2yurkX9eAjGRO7md7S4rympBZiGXyBOASriRNyT/h2l
         dBrsrGq498zQFxHsbHUtFUwDThqwyS11rHS9p5x8NFbF0uncgiP3Q9bFGitdvzZToqbs
         na1g==
X-Forwarded-Encrypted: i=1; AKwUvBzHGsJEsw92EWWb+pdbukpwwu9NVdy8EvJYdSTl1g1MNEKPtxLi1FDpQOHCs7nE3CWhyxjU9mnDI4J1+GM=@vger.kernel.org
X-Gm-Message-State: AFuF++l4MLCKpd0PVuhVTyjCaQg4Z1wlHnQef5c9IIULzZVjzp0/LAS7
	OEO1MrYKMJUf9Q+JPUjWzaVyN32B1qAC/423yBZ+9MOrFZorzuzCYYqh
X-Gm-Gg: AYBFou2NhgtEWGoCBg5s8w9KoRVSkLdQkII2Com4z/3d4MQ8lq84B8EbYmFqMWiRFfc
	6JTr4xLmPDIW9UBSzO3hTVPFJxI27Blq3+m7Pdy6ILobMEmAgOM3Kc7rK+IrocR9c5KFGOXBzOT
	avnSW6a1eePBOXkNbstzMP79vhQT/8U5G0N1QR4IRI7V5ScZNxqOCCTQIycS6lj/6HgRi+LRXbt
	4rZ/RON67/rSdn7AwAmsMfU5W9YSo3+jJzr01XQbIiIJbeH56R1GRjO/PWDFehxS7omL+8o2mt6
	UXhFhn3ZXBqQKPJx7olf/sRwAy3ZPsvDk2PWLaN0y6gKGj2d89D8SsCpNiYuIqXXr7gx8MqBTnj
	qrwpHDLpc8jKx6+tZU/lc2840CsHO/UPcDh+vWOUGdeBmhSQV+ThBem1RpFrx2B7wxEecw1LvQY
	aFBlXQPJg2YE6ygSewhWeurMi5Ws5m3SYU/LvhZvitCDtHtwCD66E0CinWPAZ/4QTCH8JJ
X-Received: by 2002:a17:903:234e:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2df69d3649amr4211185ad.22.1790107512560;
        Tue, 22 Sep 2026 13:05:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:05:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Wed, 23 Sep 2026 04:03:35 +0800
Message-ID: <20260922200336.2201212-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b3..085589b8ba65e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23740,6 +23740,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

