Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308103;
	b=PDfsNHzA8Dyf0gT44ztZb8IEoOjclqp+CcwActrV3RXNBCv1RDIfOsUtbARQm9IrhNJm
	 /53U/C38UqW3jzcLoamnCmSK5nTU/coHc8hsGkKc5uXfJLpwp7UByaRFmpOYe+IDqIgda
	 HKVed4eBsGybXyxLbBAwD2CL1gBlkfjdhFM0NbuwZqUmHAMgdonhcEwa4lOFkYWCCwm5i
	 ctc1Qc/dV8sPQYBd6e7SVv96qIPBcmX0Ht1YDB81YdqtgcC8mmNOA4zAKliq0FL8zpX37
	 0sfjcPmY9kPb+efDGt9c3ejOIRwzoq2DsOR40JdtC58pv1Z4o9600F6Ekxm2kkkPdeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
	b=4Uf/hxdjWDz+2TzhAo9t4rlTIOSSiG6fSvdPqRxeLZMdNAj+c5e7BW3ctNhK47kFn8gu
	 uMAN6L4zRcOzq19gxPo+4beE7D+tow0o9EahkzCJdVLfPc0jbidasCXhk3KbAViIlXD7T
	 H+QVOzb0+bjjlvY+kfeo4eGBfQL3kp0jUUqZvHWZ5ayz7HQLDndUphDtP7A5NklJyR1QZ
	 4FUFQSHZYihdj7VNjebZ10DVaFUi7Q7+pE4svTypx8HO4G4iTsFfLKwdzxZpIY7oGFJvG
	 gNCq3wWAHhvoMBAOuN3VepJbkXzsJKnsZEOI/IGw1N/V6kkXVAaunW7Yi3iYh/m5dag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1ksWaxW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sz1BlcZU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44C5606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44C5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1ksWaxW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sz1BlcZU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4Bh1155030
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=; b=f1ksWaxWVw8Rz8ld
	MqqA6xAmL1eaI6KdF6ngVxTNfe1rtXeAfa8cXSgx6t1OROxJRizyCT5xXOijzAo+
	t1vFUcTmIUNcDluxD58KWpiMHoHx/ae6W5Ifo1i1L0DXFil5/mwaBy2xBvMQcbh8
	ds+/A7dr60U4fxFL8T+0SgPIj7G2qGMqT8DYQiYO7VvVN/7apninibA6e0dBArk5
	pjbgEMufR8WBkr9hfxmbnqxaYq08dZKJ4bA+PsAQFBomORtfEyNf68lKGIByyrHl
	yNmv2RqOp/XTP9UBHJTFcwse3MP/WEC1d3ThUO6vipuukBkY8buc3KA20SJySRwA
	27wEXQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49rnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065e2933fso2443939b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308101; cv=none;
        d=google.com; s=arc-20260327;
        b=QpfUacD/fVzBSD5XpxanA9vEHbs0iQo0i7fMkezVwDs13UmkufE8UR5AqGw/e0kMol
         dQvKZTun8rH3pEtI4Xrpuj0t5OwCK5hy+g93R8bmu2WVJoBKbXZgvKdekZiM3nkp5UzT
         DbKT9WLEgaVF17DCSSR1sHn+o0doVdYMlhXoX1d46BPtb6kmq4vkFKTRHrIXThuwBMs4
         i9v06Yit6Q47tcSkovBqtdoME8jWPLN2CYETMcz9vHGEp3vRjTN+g7vfQBhyc1oZfmS1
         fSAQZ02C2nYQP/BGA5zAXNVtUWg4+VTwO2NhPkzk3qAe39bHA9yL0WqganRAjbfGP7Gq
         NZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        fh=so98GBXRpzldysau073eW/+00QxW+72bQThLRAFNVes=;
        b=Fpi3AG47l9OXCfvMvgFW8aWA8RkozfInnsj48dE22/aACTM1JfQYRYkdOJJ8W2Az5k
         SHhtIUT5aw1MaWh4Y92h057pLF6JjaI3rgWsJIyl9MamjQM0jxly9gHr5l70i9heknu9
         a9TFf4GuLca/7xLtPk4Z7WUfOV6hbb0i+sIvv0kESEdUAaSenoMqIQ3To8WEPGwf2Cgv
         mQUp6Tv/rka2+ZLv62z/71VJc2dge48vyEg/CsMcjZ8ppdohP6Xp585k5uOOwZnTQ374
         jsOG8Q3ObPQr2hGOPriJL8wFX9iJ99BOX8qZqVZjfeGb2kkzrDX/5zUH79aWP/VMgvMC
         5exg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308101; x=1794912901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        b=Sz1BlcZUowedlQQ6wH2xi7CfP8kiMQSqZXVo2jjcPzN60T0rUUyA05TFnEfl18woRZ
         Da6jCCli86Ja5RA/B/DqVT3hTSByV7isarvMqNUwPtYcKADODiHilnA+9rrpnlLDTWAJ
         3+ESG+SQhR2W5fr5iaAbp6Jv/hcZGEsR0+4TO+GX60Zd3fvMGRl/V0209k4GCqMlmMmT
         Go9H2j8dRWJEPbpEZeFx9ll2LjPv73vE1F8+XKEoogXkmBzx1663xxVINtrzoCKmvVI/
         7Todg8xbPUUKr5frHf27gRrrf+Ugh7cXMjGHYl5IXNs5xsxK+gDBMlynF3MdTEG1T2sP
         mErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308101; x=1794912901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        b=guyyK9q7f2nMbd+RKFLDpjhQLWFe6chV1BOzGJBihvINVIg+1ukqL3tp0VV225z5JF
         8lEzmza7d98HCvQCKhRKKFFvvpodkFIlxvzunnRQd2T+rwZTWm0BWTOJU2apfFHQBMyT
         tuXHc6kVxUyGF2czsjb37xAA1tf6UnR3nllojeX3XLmbi24XNcDzPngp/8trP4gWwl4N
         Xkcp4OATp9dtS4x6EvwHe8XKamVlvI0/7Bmru9AobG99v7BQfU0n9WQOTPhyXvVSIq23
         rMsTFMCS0RPgoCnxkO+3fJNTV/iT96LqSBINRFOtTNvz3ltSs3qw9/AktwR9kJUTlGYJ
         izUQ==
X-Forwarded-Encrypted: i=1; AL+hErEvlO3m4vCOu4SR+e0hnErnslhTmhApT6vQhztg8TYn7As7VwqiVEGYZlIUNcfaT+zNiUSXCvzp/ychXKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UijM3zkpq4sANxBKLX2Asff+j2L7hxMsfTYRKgqRrCR1lYdAI
	i8qUAG+LEF87WzhJkFbdl9sNddDmgnvg7ILRenNn9jrd8rqHK66dYdW2ctpC1EYfkT4OITDcv5x
	Jl/RTV+hD9RjrMKCMsbiiU8EpaDxzNkY4CKaFb5D0oVv09zhxxb3Qt6/U8fk+o2dmk+XqQhhm39
	mCLVJYDbWSf/QirQ4nolLn9jJUQ2Eg50yaE8HlQT04E++GXFnNWQ==
X-Gm-Gg: AYBFou1UuAcTzapFPv6v46uLsKJ9OjPEwfpKLRAYEaOWgwu6+VXpuma1yyIbF8wO7cr
	o1LWoru+QVxETztTg9PXIdgvzoz2Sra2ft+hGMFLan5rL0aOMLfkTERLnFjdgr4BaMtbnS7o+VN
	onxeh4KbCAm3WW4DvGbZ4oo8tkODkRLt+BQMhvpb7EeFeIiJqghE5OqyGdZw==
X-Received: by 2002:a05:6a00:13a1:b0:8a0:1435:fda0 with SMTP id d2e1a72fcca58-8ba8aeaabd9mr2606957b3a.51.1794308101013;
        Tue, 10 Nov 2026 02:55:01 -0800 (PST)
X-Received: by 2002:a05:6a00:13a1:b0:8a0:1435:fda0 with SMTP id
 d2e1a72fcca58-8ba8aeaabd9mr2606940b3a.51.1794308100616; Tue, 10 Nov 2026
 02:55:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924142520.1594149-1-lgs201920130244@gmail.com>
In-Reply-To: <20260924142520.1594149-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:49 +0100
X-Gm-Features: AclHuK8rWqeadVtw_i39_uuIhclFTsB4ghO-HIhVp563_1PxcLFRfqznhN0nh6k
Message-ID: <CAPx+jO_EVCeOtSKSekve_w11a=nnpyq2qWAa-R__T-URjNXwbg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpc: remove all initialized power domains
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miaoqian Lin <linmq006@gmail.com>, Wentao Liang <vulab@iscas.ac.cn>,
        Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXxCdnDl0xDQz6
 E/AJvTVFhaYw0BG350MbnYsIBbv0cl4H6XibcD8l4pD50KpQM7xo1Wgr92hLztu0MVrUfGP2lnk
 NSb76RnOIYeAfx9JV0wz8mzri7bdE+4=
X-Proofpoint-ORIG-GUID: fqIPKLadLBlJzrs9dYhveAASV07wEsgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX65vJJoz1RQ+x
 hRDLhwH+bwwkO9vX7/YEVgNYaeFbT3c6X+LvPydow0t0h2evy7xHU2CLIR5D3xCi7ft3C8RW5FY
 /zReWc3sft4CcwQQhE8LFrfjsP6IX1P0YNRaPa5p6DDXtwtoNy0A50s7Ak/m0HsyBpziCvfYiJR
 qJuvSvrc3iP5chsVINr0VayWMjwATrGJZzTdy1sqZmSPC654R9XeaOHr5JBfkAPVjD53cvPGoIy
 EdnnMSnal9vy9w6fHblAZC0qYPQc8DRZU3o5At3R+JZM7QWV7MEWiU0Bn+tnQkNPyNfv3HIp9ix
 Y4FT2mYWRmToiCusExOzzgTPp5gTdmzXf7AScln5eq5YzqVQNLmXEihchHgQR8Zje6oRatAHXdf
 kxi8+6l7okWDxnElwTTijomUlrU3FGoyE9DJA0IAvVR6CIk9S1FT5OcmCEdSvEwFoCeL46WfgVo
 a1twnhp58JhrDYvpiog==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2f805 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Dljt1d-j0Gip_uCM0CgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: fqIPKLadLBlJzrs9dYhveAASV07wEsgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043

On Thu, Sep 24, 2026 at 4:25=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> imx_gpc_old_dt_init() initializes all power domains described by
> of_id_data->num_domains, while imx_gpc_remove() only removes the PU and
> ARM domains.
>
> Use the match data to remove all initialized power domains in reverse
> order. Release the PU clocks after the PU domain is removed.
>
> This issue was found by manual code inspection.
>
> Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regressi=
on")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
>   - Check the result of device_get_match_data() before using it.
>   - Use an unsigned num_domains variable and a decrementing while loop,
>     as suggested by Andy Shevchenko.
>
>  drivers/pmdomain/imx/gpc.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a22..d83fb37e2297 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -502,7 +502,9 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>
>  static void imx_gpc_remove(struct platform_device *pdev)
>  {
> +       const struct imx_gpc_dt_data *of_id_data;
>         struct device_node *pgc_node;
> +       unsigned int num_domains;
>         int ret;
>
>         pgc_node =3D of_get_child_by_name(pdev->dev.of_node, "pgc");
> @@ -519,20 +521,23 @@ static void imx_gpc_remove(struct platform_device *=
pdev)
>         if (!pgc_node) {
>                 of_genpd_del_provider(pdev->dev.of_node);
>
> -               ret =3D pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_P=
U].base);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to remove PU power do=
main (%pe)\n",
> -                               ERR_PTR(ret));
> +               of_id_data =3D device_get_match_data(&pdev->dev);
> +               if (!of_id_data)
>                         return;
> -               }
> -               imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
>
> -               ret =3D pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_A=
RM].base);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to remove ARM power d=
omain (%pe)\n",
> -                               ERR_PTR(ret));
> -                       return;
> -               }
> +               num_domains =3D of_id_data->num_domains;
> +               while (num_domains--) {
> +                       ret =3D pm_genpd_remove(&imx_gpc_domains[num_doma=
ins].base);
> +                       if (ret) {
> +                               dev_err(&pdev->dev,
> +                                       "Failed to remove %s power domain=
 (%pe)\n",
> +                                       imx_gpc_domains[num_domains].base=
.name,
> +                                       ERR_PTR(ret));
> +                               return;
> +                       }
> +
> +               if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +                       imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
>         }
>
>         of_node_put(pgc_node);
> --
> 2.43.0
>
