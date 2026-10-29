Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269677;
	b=gRwNyNzBaxMiY0U/XikX7eiLNBm0UWvubnLv/v2fTq4Xs5GjqET/VmV2opx9FobZs0iR
	 oDQ8YF8EEYVbz7vnV5FUY3sZmVSzshHzqjNewKRLAVqhBP3eLl1NVYEnIeY5q3NbQUsUC
	 QvrQpQG4k1W6/2IgVzsveGCfVebF9kabU0ASLISQGS6uy4wtXWBGePxJyodnhX0SVIZAz
	 tUd7gVZpaiyrqcthj0AGo1ROO4g+GnU2neLLrUxvZvwxTGyDmp5kJW2Z+qwVfLJks4OOW
	 Pv3ZRWrj+7gMTf5SK3fpg33jkmZjMERjgf8HrtVJ6N7YqeU4HhYnDZOu+217YvWU0tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DnYYldOHNT4jayxYyWDlCgPG99APkcSyvyyLERzh7ms=;
	b=f/blD09dKnvAcN10LldJcbA45zA0YgXJlKo8mgfRvc0lLAQf/bVpsvgkb87XZDZni23h
	 LDbvbBlSxYOTowTdiyyy3aeNX4Ozm9c3LeqByjKIHl68OPYVDt1DSln0p1H3QsFcK1RpV
	 f2VviJ4YewzAjB79jKzEN2tpf0K5N8L4Dm22abEHKqD2Fkiza+AwVSpfVaWm9lZLy+kdu
	 0L+qxglCtAiNxDSHQfrM8vLQUnubOmwgGjrqyyIvnZVgoZcFbN4rNCl9P0xKY0ytJNU4L
	 TJsEwbcgdtRlLFE9vOf0Yk4sej5yda9UKrfmzAvmCDXsAAMnG7mBJi4MrpjFXwFLrtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+H1XOcs;
	arc=none smtp.remote-ip=74.125.229.134
Received: from mail-dl2-f6.google.com (mail-dl2-f6.google.com [74.125.229.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+H1XOcs
Received: by mail-dl2-f6.google.com with SMTP id a92af1059eb24-1aa624b5738so153956c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269677; x=1793874477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnYYldOHNT4jayxYyWDlCgPG99APkcSyvyyLERzh7ms=;
        b=e+H1XOcsX3N60FQlJe7XEu5zWBKsVn5kyFGhZXtSjC4P/bh5lTxGcVZZiDtBWsNQAB
         kV5A75WpG9S62gIsMjjxzfQty5TPaZ1+oBzKQyIanIwTOZOUpW+lpadjN03SvkuEh9ap
         B8g29S+fF5kX5yx8FPNKXYd8/7ltNPnFjqHyiGXESspGr2zBiPfyFdZ2bJ9vb7MgUYLS
         rch7ZXUDHWqooUt/TnLphGfj1p8pES9l20+I92c2lOREX7PQk/Iy5izyDzqlpqO75pcD
         ck+C1nFkc2gJweYxx9rm9v1XeIeP+3OSlvTgRKfFR/JAdFfQ5e6j6Uchx8OXnAmQrHuq
         YAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269677; x=1793874477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnYYldOHNT4jayxYyWDlCgPG99APkcSyvyyLERzh7ms=;
        b=jRgy0lYUI4qu3iIPfzEjM8icu8spoLxqLt5mF5UvFf8kfIzs3m46oDUYnckeumCYUd
         OgOnnib/kzZMiPvb0uIrXi7pJdjeHVljt//KexE+pFhEQczVGkLXdbtB9uJAdjRBZkRn
         mNLIQ4LccnuHp3+s0Mtir9OCX5Dx7erPXrNxyQIYjPAuMq9QT6TOX7/VMX5pm4aBQVAI
         NxCpe/THGKZp/BskMYg75V7Pn7KdfwO57ntXE6r4j8jzQQJArLxQm5UNG0GCXHDUogly
         qL90xLyzXIV4A5piVv6lb6ofUpRGgicvO6MF7mGUYNwyW6SyBZxM3wp4Pln+ylnSwbKp
         +F3A==
X-Forwarded-Encrypted: i=1; AKwUvByFzSoX0P3EBRDZW9aJnuToi8g6SKiFSLuAxL4Eyp2CzbEBJqHf/Ug+lsTGLrh//xMkc5baF3CupJQqBd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/I9JKdJDjoZ6y+wd23o0Q+eEXUdsFVQ7RyTnFS5sg9AgW2m6G
	hve81Ina0/nhXpmsqa7d7wVlCWzk9etCLx0Umxm7MkIKbIIMqy4pyowYgcETJPWNkP8=
X-Gm-Gg: AYBFou2U9zHoVfRGtaZUzmvKV9Ax4LeuPUFrsKveG/xdr0dgv0JaLVDsusL6I5Y4iBE
	E/7VX/3P/iEN7H5k/FnjX0rGp1aYIOvrA3gBUUkw7BJSd10YdnzCqngripIn4vOL06BlOekGNaz
	X9/OMPU3cmE8sLCg33gXcsIO/8ZotP9DoATwvAA1XCXcegij1khr1FNIJWXNwb/Fb+W2f81o7yy
	BVRR5VY7vCWnibgV7HwourkksKRzuuVFbQfiFkdQjJd+bWVsSOPe52fx0rVAnqT1NqVwrqgdBbs
	jHB0nX2k8UqELtOEIYQ+OkPMdqIkL0LUmig0AuWXVSlcItS5XuUjOfMFY7HYZZEDMynalj51w0F
	6HFKejrrckMtjjN42aUFSsViT9cpPT8Dhik8iqm94zeObOBEOEbcMoibuUM0soGENb3dSH3DyLw
	WxmH90sTfr2raMBidvJL/wf9H0XGX+hjNQI5bk5iihbCzBwUQme02CMmjeUwqQZMYf/2RSk13sy
	kKqkWnTUAwX7r171UkyyBCOUvvLbYERlMmTYgSmNI5NMO3fFBi8X8LDR9KHiR4NgIWbazaBiG5u
	kg7oIh9DVowzJvxriyTR3xX09wInkFZ8rIsRwr96HP8+NZvE
X-Received: by 2002:a05:701b:4503:20b0:144:fb42:52 with SMTP id a92af1059eb24-1a6ceba5bf9mr6386744c88.28.1793269676390;
        Thu, 29 Oct 2026 03:27:56 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d85f23dsm11958719c88.11.2026.10.29.03.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:27:55 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Coia Prant <coiaprant@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: pcs: xpcs: make supported_interfaces authoritative
Date: Thu, 29 Oct 2026 18:27:29 +0800
Message-ID: <20261029102728.3189359-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset: the RK3568 XPCS supports 1000BASE-X, SGMII and
QSGMII in hardware, but does not implement the C73 10G or 2500BASE-X
modes that the Synopsys compat table advertises.

The Rockchip glue currently advertises only SGMII, since that is what
the RK3568 MAC side supports today. 1000BASE-X and QSGMII can be added
later when the MAC side gains support.

Without narrowing the mask, stmmac_phylink_setup() merges the PCS
supported_interfaces into the MAC mask with phy_interface_or(), so the
XPCS would contribute 1000BASE-X, 2500BASE-X, USXGMII and the 10G/25G
modes to the combined set. The MAC side forces the phy modes and
phylink start passes the mode explicitly, so this does not currently
make phylink switch to an unsupported mode, but the combined mask still
advertises interfaces the SoC cannot use.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, clear the mask inherited from the compat table
  and advertise only SGMII, matching what the RK3568 integration
  exposes today.

This is a logical inconsistency rather than a user-visible bug in a
released kernel: the affected Rockchip platform is not present in any
released version, and the MAC side forces the phy mode, so phylink does
not normally pass an interface outside the mask. The patch makes the
mask the single source of truth for both the core and the glue.

1000BASE-X and QSGMII can be enabled later when the MAC side supports
them. The C73 10G and 2500BASE-X modes are not implemented on RK3568
and are cleared by the mask.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 6 ++++++
 drivers/net/pcs/pcs-xpcs.c    | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index 6f0a110e32d2..cc11a70d624f 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -536,6 +536,12 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	phy_interface_zero(xpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, xpcs->pcs.supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3

