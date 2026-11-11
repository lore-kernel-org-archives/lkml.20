Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434497;
	b=aAVyrhKyqA6l8/voDEO9gK6vn2Fxyytf7AQxMsN8U3wJnIyD1H5aNrEbIcfvFDJeZn8m
	 vtAM5dmrBB1JGxh8QLgqiw2sGd3BPUg+HHZnGy2Qp0EF+3ePzdxzX+sVbUmtx2LEGfZ3q
	 2MH/WjbZrxeA/89VWe2j/9B09tmURSoXB+n4CMti7ZOCbEsU/r20tVS7PASC6gL/ZiXyT
	 jI33GXhXXAOzztJ/G48VEAG5jnkQttEe5Kl4Hizf0xj86pQvJi+OaZUgczrMPh/WuRzRe
	 zOL0hgGuJaREUQBKYhRCuyU8KiCtJJl/2d70y6DagiDaA3BWsI2oX4VjoFWc8+y+NxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aGRCzrOyLm5RcQrXArj7+bIIsdtxJpzMcLjLki4ZcpA=;
	b=Y/MPiLP1PMOszSztfgGIJsw6LKHCAPArZW4A7Ric47M7+qzdTHpuVwOS52emEgC2TtzN
	 EWSLIqwDFaOFLbY7urGO00dSTsKMcMYWYJDAxLFGZhjQrIP3+iaDCVFc3Q4D3mJ62d+qe
	 hf6McFVvCSc/YR9A45XqYhWpNtw6ir3+7tv7vRG6IPu/YDZl27TQUOdARDS+CqXudp4K1
	 0T4CNppVECf8QUgotSLpjQ90D7Q+NxHvdjZoTy1c8jtdEBtO+htAz3oU52GHvzqtKHz2+
	 mN4j42QwnMCY/yhmCsXUbaPA34vX4YJ8mGBP7dpQ8I0q6wpLl1QW0DL6xiewN7pSzEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcXgxU1T;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15323606B348
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15323606B348
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcXgxU1T
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so2669500e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434496; x=1795039296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGRCzrOyLm5RcQrXArj7+bIIsdtxJpzMcLjLki4ZcpA=;
        b=GcXgxU1TEaoOwaQ7FaxKHoS5/K0blKwcO56rckk9IDy3SjnQHN3Iw50VBqitaHeg7y
         lgkgpGefeWc+bcvNEPmTDesPRvuz3qAL6pJ+xUI6GRDwZwPXrR+X9/mZ6uvLRQ8i/FE0
         SOVhNtRg07R3g/sKIqXh+BcByQgtKnyNgMIrlsBRIJq+MpwZM79DNBOZfNgasvRuXvHU
         CRsUb1pODK+FvcUbtvembZdiH06na+XlvqjfCb54SF8T3N8Y7lGxeNBikZTHFizpzPlY
         7oKDg85rgh7JMpclRR4R5y3lPDfv5nvnrS2R4+LtfIr90uAZosvQ0Wfmla/FhvqEROLB
         cbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434496; x=1795039296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGRCzrOyLm5RcQrXArj7+bIIsdtxJpzMcLjLki4ZcpA=;
        b=KKA/vkJ3nbAYrMOROlsi3wDpt3HrYjLSWka1KqRz/Z6jvjORIfXCkguzaQC0VDZsk1
         ZyS5bASELWp2yd99Wzd0FjtLZ7Bu9n8HKdjMy0VNoaq/08hXfCR2T60ggrNRVYaOYCWo
         m59JLEx4H/MeaUO9fHJw+4chVAYHRQe2pl8w924cO64h9vPaMFF3sMw3Xw57K6wD8uG/
         Rj5V44mEpWDBZFsA+ytojQDOMxKqZOGtf+uT1J30Rh2bzSiIQFs/on5nK54GbbspAVSt
         10WW3scH2DSxyB/xc1hQlIv519wYg4kqrjinft2t7TEh3sVGQ+C3I1o+GopRYNGwBiQ3
         vVwg==
X-Forwarded-Encrypted: i=1; AL+hErFXtK9loF7v1dh4UNNI2ZHD9QllEdXEU1MvbjfiUGabGCP0972F20yD4O3UluKxy1qafvK1DD5yztqv+Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z98uYszwJWWuRI4Sg9XmS5UhCfVEgFKrt/P+2mmi0JzKG19MAZT
	oqzLK7logT5sPh8NTIFSxUl3IzTbUDKj//Fkzn3t3irKLLkP3XnotfE=
X-Gm-Gg: AYBFou2S9hZec5NUfGY5M+/4ilJTCtMVXlLNCx6q28GFdJ7Im3lR43aUmH6pHd4Lg7R
	Xn5cbnHzZvp38j+JHATbxd//A869pO7OqA6/RS++OhojcFfPDYob4mFTjJosXOXqzyz64q7G/JM
	CFV//mFa8F3SbS/mP2b0ySO5VSIvldKnecn9S9k0yfc5Fs3i54jBbRwED6yxcWBmmGMXhcYVnyI
	tRu3yJFbgiBITd0ha9aaunYAHSHZfR9UUvxPVUnkK8vtlPwmjAxdDQ+EPuNMbqTBMRtwEXtHK/0
	SrQKXCkp7R1xJCTQ1kbSqe4AHKg0Pte7O1KQQN9tmju/0TsrybJX5cXL0ZO3SwctMnJiLThoM+b
	Tr/FnhIqlDX30eRwQ1hB4WAlxArP2jqgJ+JuB6HvcgESN8PsLOsYNWgNGttJSNy37e5Y6IGdQ+k
	vTuCJ0woshFRxpJlL8r61VWqxr7nYxpgJEkqFjuMFJx8eDRwBq7MLWx1L5OpedAYrix4/3v3sXJ
	gKHuHAcaDjxrzj0Nea5woNNvfFnDiSOOQx5t6hYADxhq9+h0V2aZJzbOdqjvXUn+wVnQNbbtwwV
	BwnTKiWUAvsr4k5Q69/6uCdvqeta
X-Received: by 2002:a05:6122:1d12:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee1bf5e39cmr1711028e0c.0.1794434496006;
        Wed, 11 Nov 2026 14:01:36 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm4557992241.4.2026.11.11.14.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:35 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 5/5] r8169: enable RSS on the RTL8125B
Date: Wed, 11 Nov 2026 17:01:14 -0500
Message-ID: <20261111220114.3863505-6-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111220114.3863505-1-montrealtango@gmail.com>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
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

The RTL8125B has four RSS queues with the vector-map interrupt model:
RX queue N on vector N, TX on 16, link change on 21, and at least 22
vectors. RSS requires the type 3 descriptor. The RTL8125A has neither,
so enable this for RTL_GIGA_MAC_VER_63 only.

Hash on TCP and IP only: the RTL8125B does not spread UDP flows by port.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 27 ++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 85e2c03fa61d..a313216998d2 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -78,6 +78,7 @@
 #define R8169_TX_STOP_THRS	(MAX_SKB_FRAGS + 1)
 #define R8169_TX_START_THRS	(2 * R8169_TX_STOP_THRS)
 #define R8169_MAX_RX_QUEUES	8
+#define R8125B_MAX_RX_QUEUES	4
 #define R8169_DEFAULT_RX_QUEUES	1
 #define R8169_MAX_TX_QUEUES	1
 #define R8169_IRQ_DEFAULT	1
@@ -880,6 +881,13 @@ struct rtl_vec_map {
 	u8 max_nvecs;
 };
 
+static const struct rtl_vec_map rtl_vec_map_8125b = {
+	.tx		= 16,
+	.linkchg	= 21,
+	.min_nvecs	= 22,
+	.max_nvecs	= 32,
+};
+
 static const struct rtl_vec_map rtl_vec_map_8127 = {
 	.tx		= 8,
 	.linkchg	= 29,
@@ -1835,7 +1843,8 @@ static enum rtl_sfp_mode rtl_get_sfp_mode(struct rtl8169_private *tp)
 
 static bool rtl_hw_support_rss(struct rtl8169_private *tp)
 {
-	return tp->mac_version == RTL_GIGA_MAC_VER_80;
+	return tp->mac_version == RTL_GIGA_MAC_VER_63 ||
+	       tp->mac_version == RTL_GIGA_MAC_VER_80;
 }
 
 static enum rtl_dash_type rtl_get_dash_type(struct rtl8169_private *tp)
@@ -2965,6 +2974,20 @@ static void rtl_setup_rx_params(struct rtl8169_private *tp)
 {
 	tp->num_rx_rings = 1;
 	switch (tp->mac_version) {
+	case RTL_GIGA_MAC_VER_63:
+		/* The UDP hash types do not spread UDP flows by port on the
+		 * RTL8125B, so hash TCP and IP only.
+		 */
+		tp->hw_supp_num_rx_queues = R8125B_MAX_RX_QUEUES;
+		tp->rss_data->hw_supp_indir_tbl_entries = RTL_MAX_INDIRECTION_TABLE_ENTRIES;
+		tp->rss_data->hash_types = RSS_CTRL_TCP_IPV4_SUPP |
+					   RSS_CTRL_IPV4_SUPP |
+					   RSS_CTRL_IPV6_SUPP |
+					   RSS_CTRL_IPV6_EXT_SUPP |
+					   RSS_CTRL_TCP_IPV6_SUPP |
+					   RSS_CTRL_TCP_IPV6_EXT_SUPP;
+		tp->rss_desc_type = RX_DESC_TYPE_V3;
+		break;
 	case RTL_GIGA_MAC_VER_80:
 		tp->hw_supp_num_rx_queues = R8169_MAX_RX_QUEUES;
 		tp->rss_data->hw_supp_indir_tbl_entries = RTL_MAX_INDIRECTION_TABLE_ENTRIES;
@@ -6236,6 +6259,8 @@ static void rtl_set_irq_mask(struct rtl8169_private *tp)
 static const struct rtl_vec_map *rtl_get_vec_map(struct rtl8169_private *tp)
 {
 	switch (tp->mac_version) {
+	case RTL_GIGA_MAC_VER_63:
+		return &rtl_vec_map_8125b;
 	case RTL_GIGA_MAC_VER_80:
 		return &rtl_vec_map_8127;
 	default:
-- 
2.53.0

