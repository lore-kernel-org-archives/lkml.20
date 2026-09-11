Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1A83EA957
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117026; cv=none; b=ZP/MKizrUe77KSAZ+TaxaR12fWyQzEb4wECdTKjQ5tLx20KWp0IeRz+L3MTU+RakLekchbSK+hR1tqVQoNQL3OQGX+dg/EUiPzlYCMG/F8/TrY6o04GIql4pM3lAbEZ0yUK5Qen6JztinrZT/MqXW11qo6WgGR1XMrXZS6nzUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117026; c=relaxed/simple;
	bh=RWfu/HRa3SrdgMlqR32ywgK9njxC//lrHo6Myo1LrI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0BhG4TEK4CzSX7KWs1pZtXZbjTr8XBor05jD7Txc34canXLU9eZFf1+BffjdS0NazHfe8zvgp/RlECikckdsoJRvG3bu3dNe/NAFOsspCy7gS65usgXDIHwWt47Lppf7uAlqAq3LTcI6S3PdyY5V//XhV7aR68sbM9yTnvIpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afHp1Mlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvqEa6sd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afHp1Mlj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvqEa6sd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqkI3845459
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DV87j3YPKMz/2sM/dKeewkBI
	fJFa9Ggy6SoP78/7TM4=; b=afHp1MljYR5yAZy4PzJnQivda2dkyUPfow+fUzB2
	ln8cpe3KR+wC7yE/8ZS+o+ZPz5Z1zyg9EVaKjDfC5vvSC/8yx//+5gHcF+Gl/7Qa
	PpiMwFVU2t2WVe1Yaiuk6Xpk66yWuF5I9FAdXCipt0cEI6Djboub2r1XUhuFszFW
	bWYwPDCGNuq3N35aU1hml6ld/Q1FkYnUHiVBiwvCO4Xjzswu9KNzOwA4z5nbPr0M
	cR92Gc0N6LU95ldfYTxgKh2xr+bP56XGMp3vJZR4ZwrpyNrqOpZsD6mN4ZJ/C5C5
	JC+FqrlBfA1OQYhhZTv97TyPXvoKye/leo30rNi9k11IVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q421js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:57:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939694871aaso106020885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117023; x=1789721823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DV87j3YPKMz/2sM/dKeewkBIfJFa9Ggy6SoP78/7TM4=;
        b=EvqEa6sdQIz2ZIrn51iRWBvkJXAx3/BWvh1lP+J1V56fLM1edGofKDNoGy7X0LEX10
         44hL6GTZRAcRaPYsvG9Ki7XJ+E5jEVhf+FoMVLvJ3oYY/ajQiKWJCi4YfnbYbNVg0YKT
         HsG8ievGI+rkr/1QBVRnpz5kJ0WlDM9p1A7CFrdvIhPCxtML0j1fG5/QnnxG3d/e9dKQ
         TM5Szh2kTp42+HQTIpkhB/S2+IJ99VDK6dZLqLmnX3HqWYYdioIvGEgE6jW81WPoOWFb
         YCRY9eKmoaoWosg8ZYFznTss9bwOiyqjuGNp3kHsraPgmMR5+FFbu7WV+Fr2GMMhns9W
         09Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117023; x=1789721823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DV87j3YPKMz/2sM/dKeewkBIfJFa9Ggy6SoP78/7TM4=;
        b=OR5g9wFfFVSkNdGwX93oVy9RZBRqeQCCZI6e9qameEHMUzr4BqTNFrPH3dGO0bm1Cm
         BiEK4Um2IhoH8MJAaip50PdDH0mx932fDFftXRp9r7DlSaVgqJ2A1Mce8aS7g+YhdD80
         SUQHRvBFS5sAtuQVNTfu5yZNw445mKjKZ5MRIWANhAgjMVsuv2j7DFkfYsFbLY3dhKTT
         E0drGZqQZYRVWDinqbLb3Udj0u69FTOiHz5YVC1a59+PMyrbTCVaCkrZuQaXc2AlFHRv
         PcG7uude22HOTY7X/SslJNR2j0Zj8tAAb27JGf6IASDkgOn0z003Vg/yXc9Qk8unjrBp
         0QMw==
X-Forwarded-Encrypted: i=1; AKwUvBwU5axt5gN/CQIKh65OcjmjsBRVbKv0Jf1ZbSb8KqRi1foSmb727w03c2RHy26IWqNI+pjg+jK67ImO33I=@vger.kernel.org
X-Gm-Message-State: AFuF++lOSlQ1BycWueA72Hl+M2468/2ncG4E9r99QkSkHmUBDEdDm8fT
	0rD+53B23teTNZCQGWIks+I4fq+t5SAE0qkzGKoTC9llh4o8VhZKFIohF14dwjSkC+cx8f1otKT
	Tqto47cmfWptAVE9IYOFok45yrVQJ7+vjShBntmtz46gSrOFtsY2faUljx1QfyuOftj4=
X-Gm-Gg: AYBFou1wdSbavOdPnpMLtb42tp+fE6mw0MIb+sj52iaapPOpt6YP1PufQxadOXcyvu+
	4tUPyz5Ffp/7iS0C4VkIpCO0wTWVAql42NZ9c1oF9e9HMStwLNgKkRcTbAU7wWfIKaWjPvqXhxN
	JIYO/ux/fiQiz2/SOl8bTnF7NgrodZfifsxy/UhzXZnvda40R8qYhBCXPpMiswwxDuHBf0/eavp
	exEuD3DRxyaFZ9qwboy63bVgBHlHNNtyBNmmZ5dEnEeIXaLjKwtERnadbYapEWEsD6pH0ve8Dgz
	bmBehjqzaEFU9EHJHJpNdiQfN4MRV3mBxWyjfpaXWUIvtWO/tiAzBODQ73LFq/8PlXEIOyLg8us
	S7pA4hx2dM+OqAA==
X-Received: by 2002:a05:620a:d8c:b0:939:4890:98e1 with SMTP id af79cd13be357-939ea2452a1mr410766985a.42.1789117018174;
        Fri, 11 Sep 2026 01:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:939:4890:98e1 with SMTP id af79cd13be357-939ea2452a1mr410762485a.42.1789117017510;
        Fri, 11 Sep 2026 01:56:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm4378706f8f.15.2026.09.11.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:56:56 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:56:55 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        0x1207@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: preserve real_num_tx_queues on
 mqprio setup failure
Message-ID: <aqPCV1R-HD_p4t9L@lore-desk>
References: <178905286654.219967.8364160447492855923@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HrmAbjJqhtvIqFSV"
Content-Disposition: inline
In-Reply-To: <178905286654.219967.8364160447492855923@kernel.org>
X-Proofpoint-GUID: erupm36O6mPzkz2LbOsqAyz9D1L8RwTA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX//VkO2tWWZ7z
 yjAFJF+OLjloSyuPNR0qZmL32XglpVhSNnYLCJ6iidWmNjrEUn9EugOvU6aWfa3ogFeDaUEYlUQ
 2TF8x1UnUaWVnpKyCAjxMlZfSIHTqs4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX3kzvMHOoemuA
 c2akRGmqa9jk8525hcDTN4evzU5jxmh+F+jAbAZldSq8ZN7YAzr+0UY1warM3eYlJY4lStA7dOE
 Knq/VeQvzxEjxewYcR/ByrC6bx5m/RceLoYN9UVWm4nCb27A9/2ebS7PPQr/+LrRz3K8i+vcqrv
 68oEADX5fBJAaV89MGdPmp4LLjVXO3SHfpCbhjj591PoU81KXlx7Tk76FTnpBl0gZLUm805uw4q
 QGaNZhxL4CuRh6dkyoINhvxwwihn2qKCg5HNHcrJZ3ujOfKxQ4VyfNM40sbto2U5Lhmc/xYfowV
 NJi11iLWiYu1UfbeCFZxaSarnDIDST3RAhClEc+HfCEfvyPrshIaLBnsLSd0motGHzMLRo4MZFs
 PADS/+OxljqMkEw7Br1QPCcI3hyr+85Bksv6jiRvqeKLr/f0YMoT3QQTxeN/KSnhXWxqRYu78+a
 SSvkJekfVRIjh8pHL1w==
X-Proofpoint-ORIG-GUID: erupm36O6mPzkz2LbOsqAyz9D1L8RwTA
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3c25f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=SezJOjr8nxHBZigFMSMA:9 a=QEXdDO2ut3YA:10
 a=nTf4xZ6BBMX2ThzGkc8A:9 a=PEH46H7Ffwr30OY-TuGO:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110123

--HrmAbjJqhtvIqFSV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 2
>=20
> - [Medium] The reproducer quoted in the commit message cannot demonstrate
>   the bug being fixed.
> - [Medium] The new error path no longer reprograms the MAC's FPE
>   preemption-class register.
> - [Medium] Spurious kernel warning triggered during mqprio teardown path
>   in `tc_setup_dwmac510_mqprio`
> - [Low] The driver-side restore of dev->num_tc / tc_to_txq[] /
>   prio_tc_map[] on the FPE-failure path is immediately overridden in=E2=
=80=A6
> - [Low] The newly added rollback in tc_setup_dwmac510_mqprio() discards
>   the return value of netif_set_real_num_tx_queues(ndev,=E2=80=A6
>=20
> --
>=20
> net: stmmac: preserve real_num_tx_queues on mqprio setup failure
>=20
> This patch saves ndev->real_num_tx_queues along with the TC-to-queue and
> priority-to-TC mappings before an mqprio offload is applied, and restores
> them if stmmac_fpe_map_preemption_class() fails, instead of calling
> stmmac_reset_tc_mqprio() which reset the queue count to the platform
> maximum.
>=20
> Some questions about the commit message and the new rollback path below.
>=20
> >     The issue can be triggered using the following configuration:
> >    =20
> >       # First mqprio config lowers the hw queue count.
> >       $tc qdisc add dev eth0 root handle 1: mqprio queues 4@0 4@4
>=20
> [Severity: Medium]
> Does this reproducer actually show the difference between the old and new
> error paths?
>=20
> "queues 4@0 4@4" totals 8 TX queues, and mqprio only accepts it if
> real_num_tx_queues is already >=3D 8:

ack, I will fix it in v3.

>=20
> net/sched/sch_mqprio_lib.c:mqprio_validate_queue_counts() {
> 	...
> 	if (qopt->offset[i] >=3D dev->real_num_tx_queues ||
> 	    last > dev->real_num_tx_queues) {
> 	...
> }
>=20
> stmmac opts into that check via caps->validate_queue_counts =3D true in
> tc_query_caps(), allocates MTL_MAX_TX_QUEUES (8) TX queues, and
> stmmac_hw_setup() sets:
>=20
> 	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
>=20
> So the first command is only accepted when tx_queues_to_use =3D=3D 8, i.e.
> real_num_tx_queues is already at the platform maximum, and the comment
> "First mqprio config lowers the hw queue count" does not match what
> happens.
>=20
> With real_num_tx_queues =3D=3D 8, the old path
> stmmac_reset_tc_mqprio() -> netif_set_real_num_tx_queues(ndev,
> priv->plat->tx_queues_to_use) restores exactly the same 8 that the new
> code restores from ndev_num_tx_queues, so the two behave identically for
> the quoted commands.
>=20
> Would a first configuration that totals fewer queues than
> tx_queues_to_use, for example "queues 2@0 2@2" on an 8-queue MAC followed
> by the failing "queues 2@0 2@2 fp E P", be a better reproducer?
>=20
> >     Note that a failed setup makes the qdisc layer run mqprio_destroy()=
 on
> >     the new qdisc, which resets dev->num_tc to 0; that is qdisc-layer h=
andling,
> >     out of the driver's control, and the driver-side restore remains co=
rrect
> >     for the still-active previous configuration.
>=20
> [Severity: Low]
> Is "the driver-side restore remains correct for the still-active previous
> configuration" accurate for num_tc and the two map arrays?
>=20
> mqprio_enable_offload() only assigns priv->hw_offload after ndo_setup_tc()
> succeeds:
>=20
> net/sched/sch_mqprio.c:mqprio_enable_offload() {
> 	err =3D dev->netdev_ops->ndo_setup_tc(dev, TC_SETUP_QDISC_MQPRIO, &mqpri=
o);
> 	if (err)
> 		return err;
>=20
> 	priv->hw_offload =3D mqprio.qopt.hw;
> }
>=20
> so on the failure path mqprio_destroy() takes the else branch:
>=20
> net/sched/sch_mqprio.c:mqprio_destroy() {
> 	if (priv->hw_offload && dev->netdev_ops->ndo_setup_tc)
> 		mqprio_disable_offload(sch);
> 	else
> 		netdev_set_num_tc(dev, 0);
> }
>=20
> netdev_set_num_tc() writes num_tc only, so the netdev ends up with num_tc
> =3D=3D 0 while the driver-restored tc_to_txq[] and prio_tc_map[] stay
> populated, a combination netdev_reset_tc() never produces on its own.
>=20
> Since skb_tx_hash(), netif_setup_tc(), mqprio_qopt_reconstruct() and XPS
> all gate on num_tc, is the newly added save/restore of num_tc and of the
> two 16-entry maps doing anything observable, and is priority
> classification for the still-installed previous qdisc actually preserved?

I think mqprio replace error path is broken since the user would assume if
'qdisc replace' fails, the old qdisc will be properly working, right? So I
guess this issue should be fixed in sch_mqprio.

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index 5398616fcdfe..7d73b0c16f50 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
>=20
> [ ... ]
>=20
> > @@ -1251,43 +1275,59 @@ static int stmmac_reset_tc_mqprio(struct net_de=
vice *ndev,
>=20
> [ ... ]
>=20
> > +	err =3D stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq);
> > +	if (err)
> > +		goto error_reset_tc;
> > +
> > +	ndev_num_tx_queues =3D ndev->real_num_tx_queues;
> > +	err =3D netif_set_real_num_tx_queues(ndev, num_tx_queues);
> >  	if (err)
> > -		goto err_reset_tc;
> > +		goto error_reset_tc;
> > =20
> >  	err =3D stmmac_fpe_map_preemption_class(priv, ndev, extack,
> >  					      mqprio->preemptible_tcs);
> >  	if (err)
> > -		goto err_reset_tc;
> > +		goto error_reset_num_tx_queues;
> > =20
> >  	return 0;
> > =20
> > -err_reset_tc:
> > -	stmmac_reset_tc_mqprio(ndev, extack);
> > +error_reset_num_tx_queues:
> > +	netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues);
> > +error_reset_tc:
> > +	stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq);
> > +	for (i =3D 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
> > +		netdev_set_prio_tc_map(ndev, i, ndev_prio_tc_map[i]);
>=20
> [Severity: Medium]
> Is the rollback order at these two labels right when the new mqprio
> configuration asks for more TX queues than the one it replaces?
>=20
> When error_reset_num_tx_queues is reached, the netdev still carries
> the mapping that stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq)
> just installed: dev->num_tc is qopt->num_tc and tc_to_txq[] describes
> num_tx_queues queues. The restore call then shrinks
> real_num_tx_queues back to ndev_num_tx_queues, and because
> dev->num_tc is non-zero netif_set_real_num_tx_queues() goes through
> netif_setup_tc():
>=20
> net/core/dev.c:netif_setup_tc() {
> 	struct netdev_tc_txq *tc =3D &dev->tc_to_txq[0];
>=20
> 	/* If TC0 is invalidated disable TC mapping */
> 	if (tc->offset + tc->count > txq) {
> 		netdev_warn(dev, "Number of in use tx queues changed"
> 				 " invalidating tc mappings...\n");
> 		dev->num_tc =3D 0;
> 		return;
> 	}
>=20
> 	for (i =3D 1; i < TC_BITMASK + 1; i++) {
> 		...
> 		if (tc->offset + tc->count > txq) {
> 			netdev_warn(dev, "... Setting map to 0\n");
> 			netdev_set_prio_tc_map(dev, i, 0);
> 		}
> 	}
> }
>=20
> So for a sequence such as "queues 2@0 2@2" followed by a failing
> "queues 4@0 4@4 fp E P", the driver's own rollback makes the core
> print "Priority traffic classification disabled!" (and possibly the
> per-priority warnings), zero dev->num_tc and rewrite prio_tc_map[]
> entries, purely as a side effect of the intermediate state. The
> following stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq) and
> the netdev_set_prio_tc_map() loop do repair all of that, so the
> end state looks correct, but users see a scary warning for an
> internal undo step and the tc mappings are transiently invalid.
>=20
> Would reversing the two rollback steps, restoring ndev_ntc /
> ndev_tc_to_txq / ndev_prio_tc_map first and only then calling
> netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues), avoid this?
> The saved mapping by construction fits ndev_num_tx_queues, so
> netif_setup_tc() should have nothing to complain about. If there is
> a reason the queue count has to be restored first, could that be
> spelled out in a comment?

Can this really happen? mqprio_validate_queue_counts() should avoid that.

>=20
> [Severity: Low]
> Should the return value of the restoring netif_set_real_num_tx_queues() be
> checked here?
>=20
> On this path the call always grows the queue count, because
> mqprio_validate_queue_counts() already ensured num_tx_queues <=3D
> ndev_num_tx_queues, and growing can fail:
>=20
> net/core/dev.c:netif_set_real_num_tx_queues() {
> 	...
> 		rc =3D netdev_queue_update_kobjects(dev, dev->real_num_tx_queues,
> 						  txq);
> 		if (rc)
> 			return rc;
> 	...
> }
>=20
> net/core/net-sysfs.c:netdev_queue_update_kobjects() {
> 	for (i =3D old_num; i < new_num; i++) {
> 		error =3D netdev_queue_add_kobject(dev, i);
> 		if (error) {
> 			new_num =3D old_num;
> 			break;
> 		}
> 	}
> }
>=20
> The early return happens before dev->real_num_tx_queues is assigned, so on
> -ENOMEM the device keeps the lower queue count while the following
> stmmac_set_ndev_tcs() reinstates a tc_to_txq[] whose offsets and counts
> describe queues beyond real_num_tx_queues. The function still returns only
> the original FPE error, so nothing above sees the partial restore.

ack, I will fix it in v3.

>=20
> [Severity: Medium]
> Does this error path need to reprogram the FPE preemption-class register?
>=20
> The previous code reached the disarm through:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:stmmac_reset_tc_mqprio() {
> 	netdev_reset_tc(ndev);
> 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
>=20
> 	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
> }
>=20
> dwmac5_fpe_map_preemption_class() does all of its validation before its
> single read-modify-write:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c {
> 		if (priv->plat->tx_sched_algorithm =3D=3D MTL_TX_ALGORITHM_SP) {
> 			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
> 			return -EINVAL;
> 		}
> 	...
> update_mapping:
> 	val =3D readl(priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
> 	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
> 	       priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
> }
>=20
> so on the -EINVAL path GMAC5_MTL_FPE_CTRL_STS still holds the mask
> programmed by the previous successful configuration.
>=20
> The new error_reset_num_tx_queues/error_reset_tc labels touch no MAC
> register, and the qdisc layer then zeroes dev->num_tc via
> mqprio_destroy() -> netdev_set_num_tc(dev, 0). Is the hardware then left
> with a per-TXQ preemptible mask armed while the driver's only description
> of which TXQs belong to which TC says there are no traffic classes, so
> express-intended frames can land on TXQs the MAC merge layer will
> fragment?
>=20
> The driver recomputes the mask only from netdev_get_num_tc() and
> tc_to_txq[] on later calls, so it appears the stale mask stays until the
> previous qdisc is deleted or replaced. Would it be worth mentioning this
> hardware-state change in the commit message?

as pointed out above, I guess this is a problem in sch_mqprio error path, a=
nd
it should be fixed there.

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d%4=
0oss.qualcomm.com

--HrmAbjJqhtvIqFSV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqPCVwAKCRA6cBh0uS2t
rOZ6AQDbKmd+4I+fmew299SgoO+jRFzg1FschzgrkvU1LRgEZQD+MDGAVAoptk+1
a3FxR2WJPivqxtyn2G8HRkvI3YO5CQ4=
=6D31
-----END PGP SIGNATURE-----

--HrmAbjJqhtvIqFSV--
