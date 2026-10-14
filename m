Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4CA445ACE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973211; cv=none; b=Abb58B2gImMmn/Nk+N2D+LRvffrFO/vZQbZpa812nUtK0QUhIw/a41Yx4dzlliBgirMJazhclSgTZay82HW4HY3dwhTUikxsA0/aY0TITqtnUAvhioYsYCQYApMhw07936ofxIkCUH5kmz6WfFEc+9glNgPzb80At32At+TKeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973211; c=relaxed/simple;
	bh=g6gjgcN5EyAZWO1W6II6Lk9i/SUmEcmgfNushEimAtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcTOgP4Z4qfV6hliyErEvKSfBtxil9KDeUfSdd7fVMf35MAq4rsO0sNZFfGYhMG6QN8tpAInnz0grDlKvojsHvcyAdxidUGoCoD6DBMj61hCck0oeMyEv204IbkIQdr++kFq1juEIlfxTt1ynmRBZvMPdzA76AKLr6p4L3KLEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy2+aJMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/PaoJ7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy2+aJMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/PaoJ7A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9KdYR2222165
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=slGu8WvW62RLRh45NPBc1MSW
	HZx6u7Xy9JQffUxucLs=; b=Hy2+aJMs1gRshg51tHlSPone0lxZ27VNEcGFFAdL
	DL6vAzNHdgejhLi//d06rxMMt9B2stvNj48p0XrCyek0e16oRxk2+IdvjZjOdrLr
	hvIGSI0DrkZWTiOFGaF0sz5VZoHszhzAqS9JSIkm4+sbuTLdmn4zJZYhf0yTDnL5
	tm6anPiTvUGy2bJbupap4880zpyPMDXrQRkimjs7KuinxOPLTJ6vMEYDpmaQ1ers
	jXHZ/jepUSyNYW+dOZe/kuCNwSfbE4mtlg+yienD0m9QZHmVVH4SR7c4GD0Yo/mh
	S8tVwJqiTXGICke6EM2CzFPGrLsNdE8T5Z5Ehtu4YjXMyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsb41u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:20:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so22663585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791973205; x=1792578005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=slGu8WvW62RLRh45NPBc1MSWHZx6u7Xy9JQffUxucLs=;
        b=F/PaoJ7AXu1oLUfbN1WvIhwVmLk13jtnqqJrHt37RYUFhwvRw7NhL6tbXl7Te15FWm
         YJCICTLIfheYaQHIwOs2LnRCA/+TL+ca5Vb863NJDTH9NLeTI6machgsu1/0/53Y85H/
         YFK1moNiBxNFZYAnvvIzvDSINuLzfwatU/Lxb6aRK2/L+71BKQQC5jMXVutXOEWIVJs+
         eIIZrBAXN58M5eOPSOcRH3aDWNbJTGyUxkFzT0sRbqUqV6QQXpGFGCrzLSkkE+BvDyn9
         8OowGhJB/GCd3q5IYRimTy5QF1APpTjEVGfjBdn+u0W6R6WncU/5krPENO1cWJ62HLcQ
         dHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973205; x=1792578005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slGu8WvW62RLRh45NPBc1MSWHZx6u7Xy9JQffUxucLs=;
        b=2xgGpqQ63cvPv9QHrGvHQwe4Hsk0svyoO50Fv/Y0czt3eEnIzLNASERncuRAaOkNnN
         GFncdkBXTuToPq0Ce5bm3aYo7uGZ2qaMp9sZHlQD6lsjPC/oE0CligoNfEx1tQDeuuP1
         osydwCwxyJwWOHe+uHh06G2JFJ5vTvNXdyJURYzYr9hV7p1KfACmsstjJW7XwmB0x+Fh
         gUCacn+eQUVOj0AU3jk22vIz2ee9NeJQKpik71Tm//gO19Bm1rRG6f4b9oYHCTCeEsBa
         lO4sOeHUGJG2kxmR48u5s9UcZNsZ4/I2DJNqqqzBkYuZXcY8QYK7FpR/S90VTo9ZC0tp
         ufzg==
X-Forwarded-Encrypted: i=1; AKwUvByq5TscUJbkj2NUM9byHULDSeRgIxF6o6HFTwq0FDjV5yhhhCTCfEIOcduzwhwF/R41qn5m84OBHrZnPAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT7/yrs5n3Q8O+AoE67CAgA2/AlbumxpJ0Glb5p1hiSFyJyxot
	ECus8nPltykeXTKd3uXQBOijWIiOOkOOPhWsdB6rwDTTyqH7zACz1Zkxjg1nRSiFd7fjv5Phwrh
	pBIuN5ALoFs+Srp2xXVFml2hwXjrAb2CXYw1n4xExgHe1WHaQCYoyJZunVWYwi2i3ADQ=
X-Gm-Gg: AYBFou32Y/P8Y5RYtgGNN3NApM2VnhxsE/pm73cO5H9sqGMzR2Zrip0Sc3+hymU/vjr
	HlJxorlJEJ61lMmAqKvlQCA8bfvhUBaRJ76TfBpsPOVf9KaHPIWZx/CNE0CeVUHiMzAahGKbrAH
	Fx/1kOWD8zrAcWTbOoJoyDrjjTqLOUP0iaeSjX6TdygWL6tRyFRSEkupuLxp8fvdoUTbEoRoxg3
	zK7wlHB7aC2mftVOo9B+QOzyW1KH/GR5h8TOZoRDACj7vQ6ftfpm4vWsrpVkZZPbfgM4Lz5+d6q
	l5o/ryR0Puco1oIvnY8KbtPdkezl6+uNSTFXnLYFETAIP+g1QNciCY1Z3cThxK7PIzBkw4xnj+1
	pesmwfwyjRisV8A==
X-Received: by 2002:a05:620a:7118:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93ebd211368mr2513666685a.18.1791973204333;
        Wed, 14 Oct 2026 03:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93ebd211368mr2513660485a.18.1791973203546;
        Wed, 14 Oct 2026 03:20:03 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm14157454f8f.49.2026.10.14.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:20:02 -0700 (PDT)
Date: Wed, 14 Oct 2026 12:20:01 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split
 header support
Message-ID: <as9XUbOfJazEQ4y5@lore-desk>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Va93bnXPgVMhmS7J"
Content-Disposition: inline
In-Reply-To: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX08N64de2h6Be
 6+X+i1m5c9pnAq6gO3oagHNfpImpllhw/up/JPAtcFafDYxa64GNnOk3SdlZGFKNjEt2+MrLzG6
 DV77sD9Hd/QDmJJlGu7nvwSvFA920vxLIyCKKPxpMbZjWsX74vyR5kfSKFeK1Oejh7pT1T0WngM
 nfy2cbJm3lRcr+h1SLDB9Pj6qYCNHnvXEQ7H1EyqpVa60q3UM4OR0mimvTC1uFbejdYN9wXxgF4
 YsipvwJrzoHqMOgem1+QEWSBoCY0SL2qMxR/gFkagPg4uodXFuebpUShaN9edgIA6HXDRP/4SOh
 ogOdBqT6gGZARhuoG1TB9APb2qKnhhXhSrVprkfjHlkGCfsfb1koq3Wi1pXSIWnYzfgZ29QrsaK
 FWtlgG97idN3ra34v87MAA9kg4cz0eJmVYKPxgyeungzqmz8FFCnN1dvm29aXkPZuA+2DvXPMKb
 ctPKF7zuh/rLibcobXw==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf5755 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K8_CPFW8AYnmyr30bPQA:9 a=CjuIK1q_8ugA:10
 a=4yWUPP8YMvIpZnTD_-MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX4CdS7KusTODu
 jef+Jg80/04Bwm0WSJ7RptwzGtJgV2MxTQ+xUgg1JHDVcRs3B/z9Nv6wcAJdwQEwkPjt5QKr9I3
 zNAzdYMx1YfQhGVbY2NHVpjg9mYknJo=
X-Proofpoint-ORIG-GUID: svBq9whEKz61xRZeBgYmveKiEYkN049W
X-Proofpoint-GUID: svBq9whEKz61xRZeBgYmveKiEYkN049W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

--Va93bnXPgVMhmS7J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 13, Sagar Cheluvegowda wrote:
> XGMAC2 doesn't program the MAC extended configuration registers
> needed for L2 header splitting when split-header mode is enabled,
> so tagged AV packets can't use the split-header path. Configure
> split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
> extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
> stmmac: Programming sequence for VLAN packets with split header")
> to XGMAC2.
>=20
> Also fix the RX header-length calculation for split-header
> descriptors. Per the XGMAC2 descriptor format, RDES3's L34T and
> L2T fields are only valid on the last descriptor (LD set); on a
> non-last descriptor they can hold stale write-back data from a
> previous packet. Read the header length from RDES2[9:0] directly
> for non-last descriptors, and only consult L34T/L2T on the last
> descriptor: RDES2[9:0] for IP packets (L34T set) and RDES2[9:2]
> for non-IP packets (L2T set).
>=20
> Finally, disable the variable-length preamble when L2 splitting
> is enabled. A variable-length preamble shifts the position of the
> Ethernet header, making the L2 split offset non-deterministic.
>=20
> Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
> Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
> Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
> Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
> Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
> ---
> v3:
>   - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
> v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluve=
gowda@oss.qualcomm.com/
>   - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
> v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluveg=
owda@oss.qualcomm.com/
>=20
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net=
/ethernet/stmicro/stmmac/dwxgmac2.h
> index f8ab347f7b5b..7d1a7802a131 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -167,6 +167,12 @@
>  #define XGMAC_HW_FEATURE4		0x0000012c
>  #define XGMAC_HWFEAT_EASP		BIT(4)
>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
> +#define XGMAC_EXT_CFG0			0x00000140
> +#define XGMAC_EXT_CFG0_VPRE		BIT(8)
> +#define XGMAC_EXT_CFG1			0x00000144
> +#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
> +#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
> +#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
>  #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
>  #define XGMAC_MAC_FSM_CONTROL		0x00000158
>  #define XGMAC_PRTYEN			BIT(1)
> @@ -434,6 +440,7 @@
>  #define XGMAC_RDES2_L4FM		BIT(28)
>  #define XGMAC_RDES2_L3FM		BIT(27)
>  #define XGMAC_RDES2_HL			GENMASK(9, 0)
> +#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
>  #define XGMAC_RDES3_OWN			BIT(31)
>  #define XGMAC_RDES3_CTXT		BIT(30)
>  #define XGMAC_RDES3_IOC			BIT(30)
> @@ -441,6 +448,7 @@
>  #define XGMAC_RDES3_CDA			BIT(27)
>  #define XGMAC_RDES3_RSV			BIT(26)
>  #define XGMAC_RDES3_L34T		GENMASK(23, 20)
> +#define XGMAC_RDES3_L2T			GENMASK(19, 16)
>  #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
>  #define XGMAC_L34T_IP4TCP		0x1
>  #define XGMAC_L34T_IP4UDP		0x2
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 6719ac6e395b..65ac5403ec58 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, =
u32 *hash,
> =20
>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int =
*len)
>  {
> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
> +	u32 rdes3 =3D le32_to_cpu(p->des3);
> +
> +	/* when FD=3D1 and LD=3D0, HL is RDES2[9:0] */
> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> +		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +		return;
> +	}
> +
> +	if (rdes3 & XGMAC_RDES3_L34T)

should we check FD=3D1 here? Since HL is not defined for the case {FD=3D0,L=
D=3D1},
right?

>  		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +	else if (rdes3 & XGMAC_RDES3_L2T)
> +		*len =3D (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;

same here.

Regards,
Lorenzo

>  }
> =20
>  static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, b=
ool is_valid)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers=
/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index ff83858ebc1f..0a9c787305a4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -561,6 +561,16 @@ static void dwxgmac2_enable_sph(struct stmmac_priv *=
priv, void __iomem *ioaddr,
>  	value |=3D XGMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
>  	writel(value, ioaddr + XGMAC_RX_CONFIG);
> =20
> +	value =3D readl(ioaddr + XGMAC_EXT_CFG1);
> +	value |=3D XGMAC_CONFIG1_SPLM(1);
> +	value |=3D XGMAC_CONFIG1_SAVE_EN;
> +	writel(value, ioaddr + XGMAC_EXT_CFG1);
> +
> +	/* Disable variable preambles to keep the L2 split offset deterministic=
=2E */
> +	value =3D readl(ioaddr + XGMAC_EXT_CFG0);
> +	value &=3D ~XGMAC_EXT_CFG0_VPRE;
> +	writel(value, ioaddr + XGMAC_EXT_CFG0);
> +
>  	value =3D readl(ioaddr + XGMAC_DMA_CH_CONTROL(chan));
>  	if (en)
>  		value |=3D XGMAC_SPH;
> --=20
> 2.34.1
>=20

--Va93bnXPgVMhmS7J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas9XUQAKCRA6cBh0uS2t
rG4HAP4goEYjxrArM6TdJd+MFIeqzUtidp4JYTu12RjAE+mlUwD/e5GewtsO9RV7
k+CeJufRbJRvlTiMT8RjKAZEgMRGYwE=
=sUaN
-----END PGP SIGNATURE-----

--Va93bnXPgVMhmS7J--
