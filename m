Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920294252B7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277580; cv=pass; b=aVpFbuIO2xeDsY8z697vy1nNTNWsxHMxSb4Nm0an63cZznAPzLJMbkO3+i2DsX/jDYJ0Me7SE61UGO6rG3ws3PK6A1hUvkOhZOL90khJi4K87YAU+az7dbfycOh0J63fipfJHAnMRNOC5yN+tL9ArcTB5Tu+5lNR8VfHYDAf0us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277580; c=relaxed/simple;
	bh=kBO/AzoZx1ofZasrbnMAMlpidRtyOjDHcD5P0zRr+dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=io076DReTgQQj6Tm79A9IkJHDuM3nCiXIFdH7+xdZ/ZLgndXlIiEsU72E0Nq4i7X8cp1t9eKvIajp5zL7o4eCKu0aV2cVItjAzuqddxdymTpphDhmN3EjJ7HgNyzoEnxzTULuGVHADz/e31yLnC7lEbFlXZKEZQnxV3Xi9MEDho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8d7mRg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXz/ab7L; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8d7mRg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXz/ab7L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8X5x2270303
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=; b=n8d7mRg28ll7i78w
	GqCzjFy0bizbLYoxqeGEpp6HFGBcrpvYeGy0TgT44jO0MzXaTLOz5lSZQRx/cifK
	Qp53mkNeloVnt9XCz8Wkl2Z2UjvxruvtLNSWce8M5UCfS2XYre+q28svzAdUAN1a
	oO0WPu+sbLecb5I3Yl/150I4ELsWPMH2+2EEJF9sywBuK4Le/v37rX2UlYJrXRFV
	whYQjE1yZFKS/Lona50Jy1d5URXP5IqnzVgObOGpy6OmC5WelxY9gdSww8RbVmeJ
	mko9TaWKwNKqgfguXDScgTLVfJUpaSjTAq5CaDMajq5yWdPM1KFYXyfoaMDJAld6
	XRrawg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx443v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1527060b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277576; cv=none;
        d=google.com; s=arc-20260327;
        b=Ff/uMkOhSaP/xEGrebocnqtiTZtWwC6q2U6efeRNJCmvUQYVdPHgkk2NlvA6t7Rigt
         VKwJqPF/OO/CqiX8SGrnu2U4FqZhupn8ESMHcUR67nNNnPVikGVfG4lBgaT/aZUh3Iqf
         BVYBjzBiAx+R1yNgKW9LJRSX2FcPrLdN61bq7tAalwZAnKi7/5Z77etbLl8R2K9DifSm
         G3VzVYSfdkMdkT4sCCN0BvP7Be74WH+QWjZWMxUS/m6I1VZH36bsi33ScMlMFUKrE0W2
         x1Y7P1vqICUIgl6h0T5BxJJS0dJeb19G5b4ITdhj0n0H0jm12BJO07TOUe/8iFNZXCVs
         pOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=;
        fh=5PXB3yMXww33b7llWwjt8IdK+5epUG+fSptSEEMeA2M=;
        b=d1SXJIDYt1JhU4uY2uQQewkEAx4mb9Xjq2GYYZadNS/l4PwIhj40U6teQjQcDuP52i
         CBiSC+HiYfnk67YKUHX2XkRj2At0nPAPnvwvF9r4kjg7ZSWmFEw8V5KRabe8aabX/bwB
         VHzayI/Ip7sitkW+ruFSzjxXrwnlH6ZJbzWh7/Df357m4Cbbq2dos0LqneevJ256F/RT
         EsxriVBW2MJ8LOVn/ZUmF/uqx6kGbGvDRoqcbq1/IB8oN/Cn/1zlzZrbw8nOJiKv49Qe
         Y/3JB4omXiAPF5B1DdZZYE7ElLtR9jZkJkrJ22JoDB5pH/TsM+X9rI7Pwx5QHi15xC9+
         e4tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277576; x=1788882376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=;
        b=aXz/ab7LQl9y63RellizNIOD0WjddTGovZcxQhYNNMJ95HWsOXIgbbHfla3sHhexE9
         BLTIvmt6tIh4Jem5KJ7xQ7hypnZbtlssFTgdX/2xLLaZl0nWd8nJNQz79dRaQLXnnfZA
         CQU38jXVEx3x3fPC5f99WHkR9iHdyZTpBwSwwl9JuGCncNYZa9AIVwWwjQNHPLGLi/xU
         pHuCNWHDL3xPEkMek7cGnnJzHfRNTLAMmvXB/TSb212/h6Dm+zbm87X0uDoz/yMy7fVa
         8Dx8MigqsAp0nG8S1DIxeTeVbm0OcTJde7IY82jXeykkf2l8+rsGMQQM4gso5ISsQkyH
         Yfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277576; x=1788882376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXMurLz1uw6v5dbnfD45z53kR9FFKD293CZNB/HTMoE=;
        b=kd+vnemVVw9+2efbWrdl2HQ7RLLiPe5GP5++65DaaOPKtH5hmZrMbCltqWQh3UZTW0
         yhlAGm9e1JhQAArQB8VmUL7X9pmK45BklXpjc6/LBtkiNwWr6/meHyQ4BnPBmFqRDUJS
         ZNipL6r9adOy9EqkD3GZDPxecY/HDkMk/iGViOvpcddTLMvllJINbGsZDmYAO69iEt6I
         blOoF51+901txNXL/o+73drIwbj/fbwq9CebH1Zi9DUBV0ICmV4eL1/3PFIapgU2bs/3
         QBWARkJULE8n97zg2IGybb3miN9aQPIG52uchDQ010DGSZzG3sr6Nm9s7VW9gYcyeuEI
         Bo7Q==
X-Forwarded-Encrypted: i=1; AHgh+RovOwZ1KOFn3sL645j6SbFwCB5EcSSLrgLpzWtpAjb/k40ej58KCMENoK9KQJJHEhwwuyaE4rh+OitxBL0=@vger.kernel.org
X-Gm-Message-State: AFuF++nY9wMAZOJR/HHUw1LGy0VklLjmvi/SkUG+ETk8mweCZgKDvjNp
	J604QxrQKnjeyGPcEDbi2jp8MWPliTMdCspm+eMSgj/KqE+cfvN14SJvHAOWx/6fbZyy3LPsW5V
	6f790+P1A6eUfx9Y4pxxqKP/N8jX1JlWAPfEvddB1bgCza5xeljpOH3Pwdrq6ZZYTJixwdTOE48
	0EYopovqjSsr+2gGjxwLQuVTK2uC/san69e0le6UZMpZMsngdnWQ==
X-Gm-Gg: AR+sD13NRUSAbcsULCfl8GingQ0lqxM/oheud/6XpcdoypDlB6JQwmaSbcKPk/vjLep
	ABCZOyVZKBJdywwsE/veaRK0a7UJHostEKQ2rIJXmBDW0oU9+hV5lkG7o24a/5bXnBEb268mmWJ
	V+fzvFH8BiGRUmzizG5BFEK5WcyxTXnkTP4mJGs3OFyrnXhml4CZRTqJA1xg==
X-Received: by 2002:a05:6a00:4191:b0:853:430e:6b60 with SMTP id d2e1a72fcca58-85bcbd8ad6fmr5717501b3a.14.1788277576161;
        Tue, 01 Sep 2026 08:46:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:4191:b0:853:430e:6b60 with SMTP id
 d2e1a72fcca58-85bcbd8ad6fmr5717449b3a.14.1788277575650; Tue, 01 Sep 2026
 08:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826101316.22193-1-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260826101316.22193-1-ayman.chaudhry.kc@renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:01 +0200
X-Gm-Features: AcwNN1Wk6oa8z3X-T1jHCneIimH6M9AciAx9hJy1lSv_z1qxgSpmHgEf1Fp22kk
Message-ID: <CAPx+jO8eNBgcWf8d8xUhS6n=a4ztLV1ZSytTyMMqj79f0SFLeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pmdomain: renesas: rcar-sysc: Update description
 of chan_offs, chan_bit, isr_bit
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96f348 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yC-0_ovQAAAA:8 a=ftZ7uTllurLVGgvAASsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXzcTS+R4S3O0M
 wizFuT5ekjpYqzJyllpo15rwhRXHV5Ql2CBpRVqifA7utL+hzLRnYfgXAynH7nSjnWDIs7kDggZ
 on7kEgOBlBsj+F/HrU1hwJgZ+soKgHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX0oYk9esUzFr/
 hEkeif6sYhcbIo4FEbzXjTeGgcEEnmU/+ph5R2VwBKdXoMuyXTe1rDRCZ74/v1jzJ0EC/UArr36
 sC+J/og2ISYg8HPVaVMX6bGhEZQG2EaU7+Ar0ZrPF0CQoqafDOA3iA8L/S452ugA1gJWR5cJ1Yb
 qSZbt7DlIOZGzcbW4QZ2IkHC/vOekKx+RS+exlCRzpzW8E90NkLcLBPBcnyyTTafuOFXT4pMqBG
 6WzdSmh9VgcTuWCcbTQsGhgY96KxkRLauryqeIE8XNGkTjIVZWyKzEx4fPZVl05zOp4GrGhYpVL
 IheyyswabIaBTz+vw6FanQgYZWjskrdBHd2WHdi3CHT95FrxBrE9RUpI/r0NMFb4Cjx5STljl7Y
 uRrmYI4/BWvdXs/RgEmsCpHR1yb0FohHs6f/a1tc6mXKBRBlwkdYqQzl7W8SPmS9sk4BHp5MMvA
 UKxFfvCqITpPua1w3wA==
X-Proofpoint-GUID: oqTbt8QCKrDspxoy_TGVHBsONCKmOIlX
X-Proofpoint-ORIG-GUID: oqTbt8QCKrDspxoy_TGVHBsONCKmOIlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Wed, Aug 26, 2026 at 12:13=E2=80=AFPM Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
>
> The descriptions of `rcar_sysc_area.chan_offs`,
> `rcar_sysc_area.chan_bits`, and `rcar_sysc_area.isr_bit` do not clearly
> document how these fields are used.
>
> When `rcar_sysc_area.flags` is set to `PD_ALWAYS_ON` (i.e. `PD_NO_CR`),
> these fields are ignored, therefore improve the description of
> `rcar_sysc_area.chan_offs`, `rcar_sysc_area.chan_bit`, and
> `rcar_sysc_area.isr_bit` to make it clear that the field is set to 0 if
> power is always on.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
> - Updated commit title and message
> - Changed the description of `rcar_sysc_area.chan_bit` and
>   `rcar_sysc_area.isr_bit`
>
>  drivers/pmdomain/renesas/rcar-sysc.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.h b/drivers/pmdomain/rene=
sas/rcar-sysc.h
> index 9e93a1f98f68..b264e727883b 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.h
> +++ b/drivers/pmdomain/renesas/rcar-sysc.h
> @@ -29,9 +29,15 @@
>
>  struct rcar_sysc_area {
>         const char *name;
> -       u16 chan_offs;          /* Offset of PWRSR register for this area=
 */
> -       u8 chan_bit;            /* Bit in PWR* (except for PWRUP in PWRSR=
) */
> -       u8 isr_bit;             /* Bit in SYSCI*R */
> +       u16 chan_offs;          /*
> +                                * PWRSR register offset; or 0 if area is
> +                                * always on
> +                                */
> +       u8 chan_bit;            /*
> +                                * Bit in PWR* (except for PWRUP in PWRSR=
);
> +                                * 0 if area is always on
> +                                */
> +       u8 isr_bit;             /* Bit in SYSCI*R; 0 if area is always on=
 */
>         s8 parent;              /* -1 if none */
>         u8 flags;               /* See PD_* */
>  };
> --
> 2.34.1
>
