Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181993;
	b=cAeVhc8JY4/oNnkSRHsnYbwemYZ3DtK0kKFG7Eilf9Yb0Uw1srsP3MAP7Kd/yo+UyMYT
	 UBfjzS6OlT1w1mqeRnSNHjJQHDGwvXCabyEEeowLQbC734h5qVpugIfirf0g6hCRS63kL
	 gK+VFbw04m4kG1JTJdSwucQ3sGLCDpRWO7doJsif2MRzatRWBFiobXSBZlCfwJGt1lljZ
	 FKE52/PurIyGQmabH7dq8CsAWBGdSV9jOQBUWDsBl2wAe6Ulcdmj2sIswpKV1DFppbH7/
	 NXOih6TcPvF+8W5VhVwwtUoM787b4idY3LmfAqkr9Y6lAHV3eCZCq3/fv39LUA3nlMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181993;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Lkdx2/+suUTz0QeM7LaWNEt4yxPDX3sDWLZCb1ez1Mw=;
	b=z3t7zmEISNyBQit5TG7og4mDAoPJqiL+UHnQzY/EM1/kb367Njrvm7Do/2vApR/k19SL
	 iAWzna4UY9ScWlsS2aDLkpA+ctKJcm4brLxNKu9eKhLObEivnlJf957aDKnYasZ5sdfu0
	 e5NcOpVIoSvHRVdPIZHBYDVrU2WgW0zsMD9Yb8Rz/5tZg8fqZfU/Yyh59XZZHxOw4DFpH
	 EM/dFANk5MwI0NWCfH9dtofCd+RJSz+ANQKRtFwIkdV57O7v2yO41bF5BttnAkZhkYvBM
	 zboSWXi2aFx6l6MCGnkLT74yYsGv0LkC0RRfkxi16oBa6x5HVPoZHK95gx8cTl9APyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ueul6yteafccnn2btkfrjkjkeu.protonmail2 header.b=HmHTGK9a;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F34606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=ueul6yteafccnn2btkfrjkjkeu.protonmail2 header.b=HmHTGK9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ueul6yteafccnn2btkfrjkjkeu.protonmail2; t=1794181989;
	x=1794441189; bh=Lkdx2/+suUTz0QeM7LaWNEt4yxPDX3sDWLZCb1ez1Mw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HmHTGK9a9aqnbkNgiUkCFZjwGFYjHU8xcCNk+5Ff7TWfvfbuincBaRpYGq2JEFzxw
	 VNarg4atN9P2Auvvfpekh9CNqUlIyEj5hh/t0KPlN0Oz+qIG0rGmQgrA2RcSuxihVa
	 lx4wEtgRAxnalM5LFSzd996rPvutxXSsUL7ur/Mi4EQSPfREhVMLc1YPAlMBIfDwke
	 Xh5zODuYipahknUYaDrgn4CV2+/msmDIU/p65T2zWAiTgh6nQqAqpi+PWM/J8i1r44
	 0pi7nhkxcCIaDvanIuFMpFY0oIbBaETso18S+khckSMMPqFvSaDvKZdUiMdH3KwslV
	 AFAJBvoJlw35A==
Date: Sun, 08 Nov 2026 23:53:05 +0000
To: "michael.chan@broadcom.com" <michael.chan@broadcom.com>, "pavan.chebbi@broadcom.com" <pavan.chebbi@broadcom.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] net: bnxt: size agg_id_tbl for the full 12-bit agg_id
Message-ID: <w1AJ7wCLHvuqCakfZ0kTc_L-W4jMRfvRL-1b2ivJckwUDD60O40hiI9-wk9mj0mQlyPqT4iHIMjFqDDn7vbW4UGMxln2gEYTtGR2ieyVxrc=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 660295346ee5819db07350f26ba45ec72a35f054
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On P5-generation devices the TPA aggregation ID is a 12-bit field
(masks RX_TPA_START_CMP_AGG_ID_P5 / RX_TPA_END_CMP_AGG_ID_P5 /
RX_AGG_CMP_AGG_ID, all 0x0fff), but the per-ring mapping table is
sized for 10 bits:

    u16 agg_id_tbl[1024];

    static u16 bnxt_alloc_agg_idx(..., u16 agg_id)
    {
        u16 idx =3D agg_id & (bp->max_tpa_roundup_size - 1);
        ...
        __set_bit(idx, map->agg_idx_bmap);
        map->agg_id_tbl[agg_id] =3D idx;   /* unmasked agg_id */

    static u16 bnxt_lookup_agg_idx(struct bnxt_rx_ring_info *rxr, u16 agg_i=
d)
    {
        return map->agg_id_tbl[agg_id]; /* unmasked agg_id */

Any agg_id >=3D 1024 writes a u16 out of bounds (into the trailing
agg_idx_bmap and the adjacent heap) and the lookup reads an
out-of-bounds u16 whose value is then used as the index into
rxr->rx_tpa[]. Pre-P5 parts use a 7-bit field and cannot reach it.

The patch sizes the table for the full 12-bit range. The map is
allocated with kzalloc(sizeof(*rxr->rx_tpa_idx_map)), so the
allocation scales automatically (~8 KB per RX ring).

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/net/ethernet/broadcom/bnxt/bnxt.h:43=
6-437 and :560-561 and :398-399 (P5 AGG_ID masks are 12 bits: 0x0fff), :110=
1-1102 (u16 agg_id_tbl[1024]; DECLARE_BITMAP(agg_idx_bmap, MAX_TPA_P5)), bn=
xt.c:1555-1569 (bnxt_alloc_agg_idx: idx =3D agg_id & (max_tpa_roundup_size =
- 1) but map->agg_id_tbl[agg_id] =3D idx with the UNMASKED agg_id), :1579-1=
584 (bnxt_lookup_agg_idx: map->agg_id_tbl[agg_id]), :1628-1629 and :1951-19=
52 and :2082 (callers pass TPA_START_AGG_ID_P5 / TPA_END_AGG_ID_P5 / RX_AGG=
_CMP_AGG_ID, all 12-bit on P5)
The agg_id_tbl mechanism predates the reviewed window (P5-era code). No cla=
mp was added since.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethern=
et/broadcom/bnxt/bnxt.h
index 41d05efd63..ab6b2530ab 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -1098,7 +1098,7 @@ struct bnxt_tpa_info {
 };
=20
 struct bnxt_tpa_idx_map {
-=09u16=09=09agg_id_tbl[1024];
+=09u16=09=09agg_id_tbl[4096];
 =09DECLARE_BITMAP(agg_idx_bmap, MAX_TPA_P5);
 };
=20

