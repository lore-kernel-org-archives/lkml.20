Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CAF40B373
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277578; cv=pass; b=qA8ncTEei92eGpM++hZVXe7BMAgArXLFxFJcBzfk2QWxo+YjnMYUORMcR7Tkzu43oP8Qvl1+sQd1wdQpAomf2c4Kx9pJQT6/FjXUjg4XFOyuxN91rLa1S2MQLI0mSqF9FoRInszsg8+hojLDkk5wEJrLXOel8GwdIamhTfCDHRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277578; c=relaxed/simple;
	bh=bvjz9RXhe/Z+ZfaOA8mxJN7jP5/j+wC1mkikCF15B5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shpbV5k5tEn0Xu43ChOq77FrErKn7wehCUocVYXP4nOm1YLHa3gZe6JI9wTD0pxRV4mdrpmb+UUQ7SNnngz2ew6o39nnCTqRd3i5aFKC15AXv6xS7/9UDWpR0fdG67KOCHVAb/odyP9Kxmp+dA9+CZTo1UI3WtHr3ZxLQzPUxrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdgIMwqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/xwsA4X; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdgIMwqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/xwsA4X"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8eq72825090
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPr0GkIr+y44pxZZibhR/VHICVWXw4xIXLCVK5Fed5c=; b=QdgIMwqeylIzo8F9
	YCDovoAwRUT/5BZwQAbiO0c3d50Ttm3DNJPYmgxgGeWxNtNnCs25OmsQP35+sIUa
	Nw9w2I/fOCKO772sIgiPk/wJK/hNFnuzRGq9O6bGm3PH93CmPUcgOlNiRwG+aA1c
	S++3vqErDSEFJBdFBbU/Y8cNWBo6gLsePzCn39QhMrg0tTPkDM132SZ9V8KKsv+C
	mMGS/Dwaw8ROa3oQdbyDjd0AMfqnkLSqRTwTguHT/5Hic4QTzik6mfKp/rZosgKY
	n5u6b4SieyWmnf/jCOEDjGQpUO7Khbz9xWNHCHmFkq0ic0aIkv66qen4rMFqalk+
	pPNrxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cbc1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so1698930a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277576; cv=none;
        d=google.com; s=arc-20260327;
        b=OdCo0+EnVvMrvCvADnLdF2qzlR3b2ksjQweLxDowwQ3t5EzkNNTG3elD27m1UhksHi
         8VduTOThWnryaZdbZXHMeNqw13812ESDSJO9XWHJAcxyx8KexMlOhxdRpfFf6vM7vzST
         ItQRiJrrhZeILgVXTZTjHvtmhOZgbHE9d8HXePXskBo8oUma3YFL+AJ/0Uik7dN5bjF/
         DTVaHrHN89LpX0IDMij3qhxOZEnaT0YJbRTZTxgfpFn5m0sP9v3WzKK0yGsK4qIBXeHQ
         BkeB8kF1AIDmQskZgkX4IxEde8nNPgUcLDvKIwZUBGGGQb523PXtgiKYw2K+3VlF6b0M
         JDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SPr0GkIr+y44pxZZibhR/VHICVWXw4xIXLCVK5Fed5c=;
        fh=OyQUFpekYHR11qHao6gz9s4N6rdo9vKAGsacR6R2vWM=;
        b=ScYKgF/JMSe5c4LDscyl3+eDndBe96TkRJJtO+9l8ufv1iq/oTdC6Cdp///viELavw
         yjJe9skpfzKZ/R/g14cIkaJLNheE5ybdCe6hlcTViH1lVzqpwpUbAD280CPEpvAnP5fi
         qeQDsWeBODuwlOf2C6X4ukZVAwdfFhv5cgeODAOLf4sLl6kLTUxaVEQrGi4CMNLfFSSm
         c0PvmiNCs6xxsCc6bpKYb7dF7Dxxgqozkgiy0vQ+fRuoy3PuMXjJw8sbNgyJ6BXTDONI
         LzAu/DM2VB6J1R0hUTORjUdgFf5rSREK3/ZdKSwQcJXq1Gi9S0wh8XLfMv+jibWuNf/v
         iDCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277576; x=1788882376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPr0GkIr+y44pxZZibhR/VHICVWXw4xIXLCVK5Fed5c=;
        b=c/xwsA4XlLFd+k0qNTN0A2H6QOzDwd0j/xTbX207hJvsvQsRd57Ap813D+fTAzNtu9
         SdJHhoxTTjS/ziQqu3J77EZUfHi29SuqjHo9l/sv8YZCIKfR0dyrE/DGJCNdku2x+aYK
         PISBCptZhcPBCWwxI/CyPjrC11OQmFP6PCtMAGMDBT+doSOpcHox38vHl5rCfJgMJj9H
         dXydJ53sgOd+Gu4WYBf2sFzskxMdk6Dbp6Ah9PSf8ha7fNfRvtG2CR63nSp9uqjJrQre
         0XnxXX6noqWjZF772VXeEX9RYWm4usZl9wn7RrR4lXZxzWtNlb+3fivMYxW5FocJgM95
         +AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277576; x=1788882376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPr0GkIr+y44pxZZibhR/VHICVWXw4xIXLCVK5Fed5c=;
        b=tVcM9UZ4hypA4C6A7M7FY7rTuDNRVQYvxbTakT/fmneFoAszmRsN3aAz3YwMX87PzQ
         dPF2vghScHWQNTq+o1ZhqDnMeaiy/03qjvEJqxQKc/exYjclsl+tkZLj+CzNhW3KUQBf
         FitglZ46masm9Ka0f1xNRT9TbFvvuSfgcI1rVeYWUXovyJQR8tmQqWmSeuQ7Pc/OvZ3r
         95PX0o4S7yD2BBpfx21SKr8/fDC8WPD1U5b2eS/uzvuV5YYE0kjcknwJkvZeAX69GcmZ
         m1UzR0gpl0ZkiIKpSAeFLzUk8cJuTYp/+sU+Sj611uv7O78tr/amCaeCeHgrMbDhtrIj
         CAQg==
X-Forwarded-Encrypted: i=1; AKwUvBw+Jyn4FmKdl3W1S92WV2E8uVuiAP1mLI4JJgRIoWSa8vKCpt00B9+tZWW36vJ4FWipgRI3C6R2BEPGBQY=@vger.kernel.org
X-Gm-Message-State: AFuF++mH2tv5oYBR2OY+dVXlt+boOeQOL7lAoxxqsczgqxS2HGqR5qtG
	f0ewI1Bd7Lnc9Hu7srFIDlgBKXBvJl0xMCJ05xbbuEA18ZxWwrThTiNNUvOUJ70kavXF9BhuSUf
	xFuCNNhaiMttPOmLTiVjUMqsdudQ8+WqdAC3tjzhW7ZaTQvbdOzKRjv0NkJJxEtfo4YLuJV3sjj
	BC7au9OZrIJBJixDCTm6ltoB/KHE88DsotgxuyrmgDzFF0zBWGjw==
X-Gm-Gg: AYBFou3bbQprqaUYuP0k/okarX3elQR/R5fNgKvkyK7Xh9LaCp6mfvwlLV8+k7H0o/c
	MOz83XWxRGiZR4W3KWGSz+p4IP2of5Z0+ygLoqwedFZVDSe9M08TEi0wVx033d13L0jcEsA60f6
	ReccsxNfPDdId1539iywsKDOihvB5QRuce+dZQd3+GYwByJd39WBnsRw4JuA==
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr29078670a91.21.1788277575959;
        Tue, 01 Sep 2026 08:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id
 98e67ed59e1d1-398ba9e7753mr29078607a91.21.1788277575470; Tue, 01 Sep 2026
 08:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821075728.273004-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260821075728.273004-1-gonglinkai@kylinos.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:04 +0200
X-Gm-Features: AcwNN1VX_i35MYWk1BRKRMPd_ejniyU3wi6Q06RCOJsNKrSWKss17q7PohQ4c-Y
Message-ID: <CAPx+jO8kfpBTYw7TCM=+2ebN_i_adYM5dUVPf2NRR8QBFKdXkQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: dt_idle_genpd: kfree() the original name allocation
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96f348 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=JdndqbUKdSgka_8NYHQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4GYURBqnBV475WR0BWVDdeW_SbYK2aUP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX64urXjVtM3qk
 QEYGuCnEU/gVwCgxj2VZhFiKjdBM2y+hS+Y9u1P1/qbxB0+UWAFgguZjdjYw6duuJP4PcWnJxgH
 Gdf2cO2UkDWxZH3qt1jFmSmbBYWkVe4=
X-Proofpoint-GUID: 4GYURBqnBV475WR0BWVDdeW_SbYK2aUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX3cQRhbB5Ue67
 jxMrDVexv4Oz2Bf2oAH6ne4ughjEP/CpYbRrmDJP5BMHqyC+jR3Cyscpdg5QGYkIZUoPKhPx74b
 nv+IMtg2DZ9M0yU10mqMpNCdNrMrD8Wz/FZ+QhV0dlJK30j3r7KmfQlbAx5+/K1Z9U1dHdiX1wC
 UsR3PNzCINymSSsyLQ/idKorEmeWVpqCoJxIw1tQdsRwDSx7DiWy3homL30weaAvlbFWzLu8y85
 vIstCCbC3Xse8OZ3xPts+PKc5lwFVDyytoFBHJN0zYhNwWgCLckau7UKBfCs+nFOmyhvT5VKVt+
 W2UxO7OF24MJIODbqVc16InEtDsATKOirfJqj368n7Z09bA+WMFSe/r7+N4M+trbxxnYwGCn2Y/
 g1wSrIq1ljpct4LuOh/+Zlkdp/sOIQZRoj94fcQ56MxRi+xQC5r5UfstJjEgRG7ccINhUmHDjR6
 27nOzOEdykAkSWVLy/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010140

On Fri, Aug 21, 2026 at 9:57=E2=80=AFAM Linkai Gong <gonglinkai@kylinos.cn>=
 wrote:
>
> dt_idle_pd_alloc() kasprintf()s the full node path, then points
> pd->name at kbasename() of that string. dt_idle_pd_free() kfree()s
> pd->name, which is no longer the start of the allocation.
>
> Copy the basename instead.
>
> Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from =
PSCI domain driver")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/cpuidle/dt_idle_genpd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/dt_idle_genpd.c b/drivers/cpuidle/dt_idle_ge=
npd.c
> index d292975cc468..ed41a90eeeb7 100644
> --- a/drivers/cpuidle/dt_idle_genpd.c
> +++ b/drivers/cpuidle/dt_idle_genpd.c
> @@ -99,7 +99,7 @@ struct generic_pm_domain *dt_idle_pd_alloc(struct devic=
e_node *np,
>         if (!pd)
>                 goto out;
>
> -       pd->name =3D kasprintf(GFP_KERNEL, "%pOF", np);
> +       pd->name =3D kstrdup(kbasename(of_node_full_name(np)), GFP_KERNEL=
);
>         if (!pd->name)
>                 goto free_pd;
>
> @@ -112,7 +112,6 @@ struct generic_pm_domain *dt_idle_pd_alloc(struct dev=
ice_node *np,
>                 goto free_name;
>
>         pd->free_states =3D pd_free_states;
> -       pd->name =3D kbasename(pd->name);
>         pd->states =3D states;
>         pd->state_count =3D state_count;
>
> --
> 2.25.1
>
