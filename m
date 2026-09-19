Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9F3403E8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800739; cv=none; b=Sfgxol8SUPr0TCY2L/2NR9pe5hNiCcDYdQSKhIaw30ba1FBLCvvyTTlgqTbMbo9dOnTbT6nX/aRP+QNKP1tvbRH7W3TRE9p3toxXn1uvxcbpbypTNtw5dwy0qnD5C4F4c4AYy4HlEb5GxuuitQUtLDW+toFdtxiZMBIuCakBXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800739; c=relaxed/simple;
	bh=WZ0ZRhan8lsrqK8t27uFdghXGLPk3AZWuDzdY70eeCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvMAzEcOrQQiFCQLnlfWpgPMUHvb+0qNz2GEsWoDxh0Fo3eYQisgjlInMG9Ohwt+1k2ofhlzpUkaauwyfvm3K7AxjMWMy0cyfU/ZYbP/0KaR+8tC8poLzgANHFDBPytOks+0svCb06Ht6DpG9ZaPm42pRAsFXolaAdWCn3b1rRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoYNJa7g; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoYNJa7g"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2379838b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789800738; x=1790405538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhDYniwbZK/cLIuF0+kBZ9daKL8rPuxnkEwAZ8qtlXY=;
        b=RoYNJa7gqWJwFbv9/xLXnL7aq0q+LOGxD3H4MsrAuxzY+KTENQvvEOD3l2OG1YtVDc
         +MBTjKbmLFl7UwkfIf9fiTAo9qpd1+7ou5ZyoH652IgcR8rBzeL4YcPAYp7+/qrpJ99k
         lq3/BGoRR974nSk/+xYCCaMX7SFdjAYz+9wMrabqWuUbxklrkCxqjb+rP6GMLPOK/sb7
         Pjj+rLWWuFsguTMmEE+OqF/cIt7wp82i7CZCF6Uf9YgBj15mtnZaOGBYrMKEwxMHEBwd
         t6XAbfgTdN9D+dSpQV7AHzBeIeOwQ927xMmfip/EiEqdRUr6ZQuw6FJHomqp/Yoj/pCF
         oNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800738; x=1790405538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhDYniwbZK/cLIuF0+kBZ9daKL8rPuxnkEwAZ8qtlXY=;
        b=RJpOYgsTPPmPu6mXjMXCwZoFxqVhL0a+glFNPOC6RNpLLmRZ/edMd+iKTFJH3Pcs/J
         5Ggrye5klI1ok8fS85W21QWxUOHuQIq8/sU8zsV9QL12rGvXL7EG9MIKtO0+fhfOkOrJ
         7vczItGEPufJp1WNZoDeqf7HEJFfXgyKCUAgOeVLhAc0Zbhaq981gAzl1YjodHXut++S
         ECsJLqSu9+o8VjmQHjdd/0T174DF9ZwOiQ2VLGnV29jJQ8iMrNou7dcQyg7Cof9UpHKv
         ObtiWD9qHZohENRlKjjd246w9viHrB/+i4En6aujunZUOrPMkVRHRdgscMmGHDWh8CJ6
         WmWA==
X-Forwarded-Encrypted: i=1; AKwUvBwTVGYZivf928cl2/u3dcmV2EHAIoHxPKwnWwYUIh1G2Wxz/QKbIZQ+h0wcY8w1u4YLNNAEdaIb/SUcwK0=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ89BLCtytfqCOqWMWJ+dob4p9DtJhoVlJNC5eHKc1X4KTK8+s
	Ox+RWF3yK/G2a8DHWQxDfh6nMiWIrJ/aQcKqt47gTZ7qSgCbzAUfM4WO
X-Gm-Gg: AYBFou0b5nbFLhQPMYybKiQ63zz4BLbzxfj1PLwe6/1HsvAjDVaKIHebaoCeKh9VJCJ
	YhlLaqxEETZ5RydXBdvwlXZH4WMya16D5Muz3scWlSuv6wKAveJaPBrg5UGD2r1K+AAHfZPMnPL
	LirsfeRhSEjgEUr6/y3HDC+iBZ+ld9tsnqL2pwGIK3M2xILu+WYdUGT5H85pMuFfIsODVR1vOgH
	dOEEIsNnLTgj5MrlNntyU2ppmAq5gUVEjSvQVlJjpPPfrvHu6IFUAt+vYZk0QmALfAc/uCNJHni
	Gcz1D+ZBvyREK+HkrhipXYbob6B9K2nOFsOf7MhMnKakivgNeEagPw5VPm9rH6v9KCMl+kwkfUe
	uwLYGGIiQu5tX1wkpahpCk+kXpXpH7V3Uz4FBsHwRCWbEA0u5n4rZQtgcUTtaBp22klL53Ha62o
	WhUdciRXjMd6TWe/wTAMDQncmDjyt0+wjjavK04GpSMCnNdbaGuOlStls0MP/2eHkEEc6o0Hoop
	0/4VUIiq0Egbc+h5DwXEJNUeycaGS43uQ==
X-Received: by 2002:a05:6a00:3905:b0:874:72b6:7da4 with SMTP id d2e1a72fcca58-87472b680f6mr7159549b3a.31.1789800737620;
        Fri, 18 Sep 2026 23:52:17 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f5464sm678077b3a.27.2026.09.18.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:52:17 -0700 (PDT)
From: Tao <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: Tao <gongtao0607@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 1/2] net: dsa: mt7530: use consistent egress tag for trapped link-local frames
Date: Sat, 19 Sep 2026 06:52:11 +0000
Message-ID: <20260919065214.31604-2-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919065214.31604-1-gongtao0607@gmail.com>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
link-local frames") changed the egress VLAN tag attribute for trapped
link-local frames in BPC, RGAC1, and RGAC2 from MT7530_VLAN_EG_UNTAGGED
to MT7530_VLAN_EG_DISABLED, with the intention of passing frames
through without VLAN tag modification.

However, in MT7530 hardware, MT7530_VLAN_EG_DISABLED disables the
protocol-level egress tagging override, causing trapped frames to
fall back to the egress port's active VLAN table (VAWD2) rule. When a
bridge with VLAN filtering is active, the CPU port is configured with
stack mode, causing the switch to insert a VLAN tag into incoming
untagged BPDUs (01:80:C2:00:00:00) and other link-local frames before
delivering them to the CPU conduit.

Because BPDUs arrive at the CPU with a VLAN tag (EtherType 0x8100
at offset 12 instead of 802.3 length <= 1500), userspace STP daemons
(such as ustpd) and the kernel bridge drop or ignore them, breaking
STP convergence.

Use MT7530_VLAN_EG_CONSISTENT instead. This instructs the hardware to
keep egress tagging consistent with the ingress wire format: frames
received untagged on the wire remain untagged when forwarded to the
CPU, while VLAN-tagged frames preserve their original VLAN tag.

Fixes: 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped link-local frames")
Signed-off-by: Tao <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 14692497e1a6..863f2079833f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1245,39 +1245,39 @@ static void
 mt753x_trap_frames(struct mt7530_priv *priv)
 {
 	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress
-	 * them with the EG_TAG attribute set to disabled (system default)
-	 * so that any VLAN tags in the frame are not modified by the
-	 * switch egress VLAN tag processing. This preserves VLAN tags
-	 * for reception on VLAN sub-interfaces.
+	 * them with the EG_TAG attribute set to consistent so that any
+	 * VLAN tags in the frame are not modified by the switch egress
+	 * VLAN tag processing. This preserves VLAN tags for reception
+	 * on VLAN sub-interfaces.
 	 */
 	regmap_update_bits(priv->regmap, MT753X_BPC,
 			   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
 				   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
-			   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
-				   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+				   BPDU_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :01 and :02 MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	regmap_update_bits(priv->regmap, MT753X_RGAC1,
 			   R02_BPDU_FR | R02_EG_TAG_MASK | R02_PORT_FW_MASK |
 				   R01_BPDU_FR | R01_EG_TAG_MASK | R01_PORT_FW_MASK,
-			   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   R02_PORT_FW(TO_CPU_FW_CPU_ONLY) | R01_BPDU_FR |
-				   R01_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+				   R01_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	regmap_update_bits(priv->regmap, MT753X_RGAC2,
 			   R0E_BPDU_FR | R0E_EG_TAG_MASK | R0E_PORT_FW_MASK |
 				   R03_BPDU_FR | R03_EG_TAG_MASK | R03_PORT_FW_MASK,
-			   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   R0E_PORT_FW(TO_CPU_FW_CPU_ONLY) | R03_BPDU_FR |
-				   R03_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+				   R03_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   TO_CPU_FW_CPU_ONLY);
 }
 
-- 
2.55.0

