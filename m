Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099951C078
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983973; cv=none; b=ckQ2fQ3FlFFEiSbq2S2QvetCc8Q2zOvpXPPG/WZvDBgYArhQa2n8VP8wXBbkiKW0cjMrOgCFBOPMXSlYuFohEQa51CPtESjdZE/0L0Xw3qgJk+vBeYPyvvd+LSLq9MbVcvaSf1/ZZYdOfIMo+oW8F5AaaCE1vsM40DcO6qni7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983973; c=relaxed/simple;
	bh=4H5DCy4Nnq3ERHMcMyekxMdmq0rKudaj80zUmH9iYds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qt+OtEsaOysQjmdcLh7+W4SIE5QheY5LFFhwHWp2rUMbkJqPxrZ0JuymtSFX4Bk9wzunYcM2iaCAJqDJs/2qXUWVlJ0jGKw8XeaTFe8W/mGiaHgNQX5Faf9mXRA6ukWrU/hhHuQmiMPQV1nWi7Oso0BIEGXzrF/c5miHZy0YxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd0D6eY/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd0D6eY/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8852525e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983964; x=1792588764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfF3Dk+FXEFm1U9KB2J9gUYhe/61ZYoILCrSmOxnVkI=;
        b=Vd0D6eY/GDtHU4p3Po+3/04IZiIh9uS2kXZOyTpCG5nntD3uqwbLFCQK1GBJEXcOZV
         3XaUUfV8oICUL0eyjb/qf20Pe0V7bwadv2ImOqVyXDbJLNunUsNDUe5jyx65T+8vBOku
         9TWPDnPJVLxgdOvTKyewV/VBytQ3FDQRLZSIqxtzQS0uer9i/6v3U94h+Ww9htBNcV/1
         GWRDZ/o3a3IkjlMCAZuCVMot6Fv8xHmzx206Igxvs1kWd2Y7TeMCIvL8V2xrVnvmpQnV
         s+1kbP32mEudlIxDc48C6w1Paxhj12fsEpsRhIZzrV/KWgK5bv3eLnza5UyKHRCxtyVI
         obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983964; x=1792588764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfF3Dk+FXEFm1U9KB2J9gUYhe/61ZYoILCrSmOxnVkI=;
        b=NRYsHK7NZkaUBdL8QX3lNO+aUm+wXOU0qpTdMk6B+CZM4BDQ6Tqn/qxL/mVw7rdOid
         fEfV7AyNj3PAB4RKhcwa246sCh6ZDwhlxtN1SZwUwHwhPqb74aZ8Iq7wdbDljnXt4QGS
         fKsSwXLPMwUPS5EuCBctfmAdWrSYcci2RPC8zIbothYQEdMwgMKWdnGN9wBvGM1QOkK9
         gfjE39N/jM3jACFPIX5QQ+09F/4EeFUIc4TBA2NqXoRCAMaNJDE/UCpD83vhYdbIW9oE
         DWJBHhtBZo8mQC4eMWeAABMhxOMDMEJVfUuesm5QAu//87NL3nYD/PJ1h5nPh1yYSv1D
         jj1g==
X-Forwarded-Encrypted: i=1; AKwUvBzZ/LWxYhHtchxVFjEQp9ShIEPmvW0JEi7DxjREg8o0R2nPaT+rYPWuMgF9wZSGcTugKL2Bm03VY2wJD9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIkYnLxcUz0cGpgvTA1wwzXMKPRWXL/IgEVF0EmzsA431/O6Ke
	fUliUP61ZRza6bdazNOzHJEE6ho65A08mTbYkdC4d87/IfrGHg43S36+
X-Gm-Gg: AYBFou2JBvZ4GzU4qYURTfV/NnBArDEmovAMVAEhqijzDhiKvuG9HY8feYWlXvCXcsC
	uwyUhtIcLr4CqF9Oqdj//NpObH2/H4LQYSh07c1zpQx16UWV7Y+Vz2Iq3RHx3dnstLFcIMqXHGV
	s+q4xdmzDCE44/QmtfZnbAHLk4GCgo3/y7SSZLEH/1Q3YkbzG8IxF5JEC3beDtAhj1x3DLoBpCZ
	ynTCuzqYIAXPT/CcWZQzojLxdCbDZTeToKnxJTiCmEeLOKT+amEZyO+UKwkPQg9BroFD9McKCia
	JvQrEYucPqpDMqowjzfcXAhxObFKfJ+qCNxPFO0bK2aGwAGm9z0NLYqpZcz56eVO125GmxCInCZ
	L/bscScDySoAeXUz+UdQeRCZDuBdoT0Xq3a3GgN1exHUEw4N9mszUVPAM/1yfm1cpkNYsd+32NO
	KNRvOp/Yhudo4KebD6XobJHCJxOK+heBmyhxK/ElNHBFCmh43olE3OMaG4S9Q55LDuSh/s1AL44
	5Brn+s/D8E8vhEEJ64JI/Kx1h2vnSmGrZAsuioa8juVbR1mS8Kk9lwpzR1EI357VW4Ktp4BllqL
	XnCix3g3JGSUMcK2ug==
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr310151045e9.7.1791983963653;
        Wed, 14 Oct 2026 06:19:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 11/13] net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
Date: Wed, 14 Oct 2026 14:18:59 +0100
Message-ID: <20261014131906.990077-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The ETHSW IP used in SoCs such as RZ/T2H and RZ/N2H has a hardware issue
where the internal mgmt_tag_vld signal is asserted as a level instead of
a single-cycle pulse. This causes the frame length counter on the
management (CPU) port to over-increment, so valid frames are falsely
detected as oversized and dropped.

The recommended workaround is to program the maximum frame length
register (FRM_LENGTH) of the management port with a fixed, large value.

Add a management_port_fixed_frame_len member to struct a5psw_of_data to
hold the SoC-specific value. When it is set, program A5PSW_FRM_LENGTH
for the CPU port with this value in a5psw_setup(), and skip updating
FRM_LENGTH for the CPU port in a5psw_port_change_mtu() so that MTU
changes do not override the workaround.

No functional change for existing SoCs, which leave the value unset.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Marked of_data as const pointer to avoid build warning

v1->v2:
- Added info about the IP issue and the workaround.
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 18 +++++++++++++++++-
 drivers/net/dsa/rzn1_a5psw.h |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 0b0b4055e615..30eca64fb218 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -209,8 +209,13 @@ static int a5psw_port_enable(struct dsa_switch *ds, int port,
 static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct a5psw *a5psw = ds->priv;
+	const struct a5psw_of_data *of_data = a5psw->of_data;
+
+	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
+		return 0;
 
 	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
+
 	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
 
 	return 0;
@@ -990,8 +995,19 @@ static int a5psw_setup(struct dsa_switch *ds)
 		if (dsa_port_is_unused(dp))
 			continue;
 
-		/* Enable egress flooding and learning for CPU port */
 		if (dsa_port_is_cpu(dp)) {
+			/*
+			 * Workaround for ETHSW IP issue, mgmt_tag_vld is asserted as a level
+			 * instead of a single-cycle pulse, causing the frame length counter
+			 * to over-increment and trigger false oversize frame drops.
+			 * The recommended workaround is to set the maximum frame
+			 * length on the management port.
+			 */
+			if (a5psw->of_data->management_port_fixed_frame_len)
+				a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port),
+						 a5psw->of_data->management_port_fixed_frame_len);
+
+			/* Enable egress flooding and learning for CPU port */
 			a5psw_flooding_set_resolution(a5psw, port, true);
 			a5psw_port_learning_set(a5psw, port, true);
 		}
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index e952afd95dca..5bec33b23079 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -237,12 +237,15 @@ union lk_data {
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
  * @tag_proto: DSA tag protocol used by the switch
+ * @management_port_fixed_frame_len: Fixed frame length for the management
+ *   port to account for the HW issue.
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
+	unsigned int management_port_fixed_frame_len;
 };
 
 /**
-- 
2.55.0

