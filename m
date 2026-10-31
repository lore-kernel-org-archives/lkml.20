Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793460459;
	b=42woKSZMhP63ODSU+XGaE7e2da8FbXTIJFnU7NA+x79SVUz9Ahunmj7H6lHUXkZhx+ei
	 yDIeF+2VT4MZcnuLwBfSWOLqy2BuykCdt121Veb+WgzjzSjaX/JQKSGak1ctYEjiF1QdQ
	 /fc7eAcXbvRkMco0vhAVzspPimmbcTvKJC2S+vkGf0BeHo4cDgqh9N10Rq71Uz8i/VDsK
	 yP7lLtHDrxZgccbXEY1ncgFZJZhtTRvWZrklb044i7NAuxh4KktbkRwBrWfJ8SrgG16zW
	 +dcyAmAHx57HbWQ4iuvi/7qAEAFGUWSi6zbCqIv7nTmk2r81tDzjy87W6H9EUrc0xHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
	b=2+5Q13wQete5ZYQP8JDvFLbQuh5OnOjAbudYsLelRSX7n+JKtEIakVyHTawcQm1Wgart
	 Qq3x1UyX4wqRZdZJggEWG62w0HAUJgkuZdH3RIRL91o4q+RqY+aDyW4B8KNzPphXOcfMW
	 sBPwCw8HRA5wc+HLYM89vFsVbzb3enFpt6tNxCpri8yLsWb2c7jPkIhRp5lE4TcO+rXRw
	 /DbxsID3wLjPcBMmwYoKSmJ/VmNdlEw/zj0svXNqz+YhWdte6wnvn5Ny89vtmHDAo+JTx
	 nedWO+flmkJLhcaeL+Irhcvm4P3qKwImLVwDSET7UVJo9+WeVSBzUMjj80Xx/m6b0tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJvFxJvg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyPWHxAD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA6D606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA6D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJvFxJvg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyPWHxAD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0CgL2196378
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=; b=FJ
	vFxJvgYCstEvbDKYUxxz1B9BCgQ0xfgx/UEGaF1nIXCswS1rwnxg2MGi4LH9mC/z
	m0CNX+MrrlBxER6K9e5WE7YFVR9cU4n06eirW9IXTWyr1WFHRfuQmTguT2TwbH3n
	nhM+M/w8FkQrlv9aWpmXsP5h5wG+5lDPvwpU+Ly9sTZ588JDZKn+bkKKujwO2MY3
	gvDJoWlR6s8NwUwgmZdHpJ1vr++wRrHyUSoJAs7yW5rocMv+ZNdTHDP4T99XFnZk
	+JRc4j8CgPg9nqu36ovtuGDjuaU8DlNHOa7Qu3MQET/V8i6+Tb0v/jhTmy64kdAj
	7MO7z2UqRBPzaEBkf1xg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du9cd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:27:37 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-48296f34f1dso1492749fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460457; cv=none;
        d=google.com; s=arc-20260327;
        b=UA3qx+o5q+w+w2hqVfBPFRQXYkOuunVztGUGO3/pYN2rrjkKxFi36sf90bURRdhdpL
         iyEBA8k1jldepnGIdfFfYiaIgnvZkM1EcSPkhq2eWtohbA2Ju4EeUnkrIpUzs1f4Ffjo
         bajd4jdybA8OZOtnaTG3y3nywwut7p2GrJ52BBuMy4o1PRl/AsfgWrQz+FU0ipwROrFz
         azRHwGSOT9J4pFsS56qKFnzV4jmnyabS6yzfroQx4ZSX97XqP0avNXtJHhQ0aHGE/BlY
         AeR12R8RWGThrAFERvEyk0Ewd7oCAvnBMcDdJI1YP8LybDd/uPGR3jZZG2cgBwk2vj8D
         s/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        fh=MhJdvVIixiriv+voKf0CWf3VMvgaluetxf1qzsSON34=;
        b=klR5Q5jkUGbTnBGHmLZJO0M6ewEmi4sFQhAXWLe4UFxmtEF+0jtCFF3kpS9t7ci3OE
         3YlgyVNw1mjIkDUw5JIKyMZ0d1kIbUeDOR7g3TsyeRsXtuYrZ2/2c0eHhphsO2GAbfgL
         3AUaF0kzo6kfexJYTfKI++J3xrV0lDfnkf1zBKXKkhkX2hrrS5pyJD+/mPLWOW5baRTE
         usZuxSM5Z4s5kjTkwUg+c8tdO3BUhd8W2h7+tFDUPgxBJjWz2n657ClsGQIltRxv5GT0
         h2O2eGcARruE74Ic5u1ST276d5dIXuuK2Z/6iDoKnQZ4qpJ9dUPoyL8rbTTJwkfY9PBG
         ni3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460457; x=1794065257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        b=PyPWHxADp1pWjWDSDTGV9orzS15rjIGMYWdiFuyXYSRB6pKNQI/fZsixMqmqJQyNe2
         GVT8pfLkb9lGBwL6z4kmIDyIaObMIa1IVxFEqWYIj2+xQl+fFfLhneL9x4Fx77RRbJ94
         XvLdUXWzxi3239joHCOOJL5RONN9I7N68xs6o996liqeW4/dk3uHx0CMqnFwAnvpBQ2K
         CJjiXfAqReA576EFBQLMcZuSHzrE5EUHJhbUIfDf/r4AR1sI1ZZcNFnqKq96L7zwCeYb
         6ftu66MWux4zcsERnsRBMDWB3wL17YZ2T8dzWHqFSpqKT1iT+3N/YTgX0Km3E2vhLbAT
         guWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460457; x=1794065257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        b=eAc8cjuW7sQSFIVL+KTs57ybj7SUvD4zBtP1OWFrHPXmbtvIV7zYb0nnDVOQ06/dFo
         5Oh0XIYAhEYRe+3i0k8b06T3Ky0IcKdyJFZt50KhqhvR9GsuDdBrlpewAVXwExkLUbgl
         F+osuH78Nt896qLBItGhrBXOYT4FN7xIwKS8XdxDpdAm+pHD842qw+AWOuVJC/4Y6glp
         pRDlkUUj4+H2RmDBy6qamK4lyTcNy3oNlPDjuoVT8Acuz75hYKJ5X25zKvj4zVe8HZHM
         SbpMaUPnXgMVNhG02H60FcgVAfrnGE8Ak8ZPlAxi+3AjQIEBMy/8+gCpEcM2K7NuNg0i
         OfEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9Zimyw+bsbu1rvDKkVVgIJSzjzlzUCbI5kiqypmR00xGz6HDQDL5vQIgPwnaswruCdWOU8xkAGtgsT3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJib12KM1VU6YSmH00HghQgqUgrW4hjgUiLMIn/4q3hTRu/Y/eT
	AQQTiEOm2Fjmbw8PBmaIfhUB7RGpJD6mTCrzMlMD0icRgvdyyHG9ILZ5ZZ/Xbf9qpnWwvsaApXr
	lus4aXiGe+L9wb3vDEVlJl6AcvcZjFj8qPvm9BQf4RjfJS4GE+tNuXhT+YX1DWzoq7hZGwTEpux
	QZEvwWn1nbaoi9lQVZUyQDEJES9O+NrOBcqrXshhXYPw==
X-Gm-Gg: AYBFou3tr0cR81Du6AtL7PQx+G35GbbfTcztgwtMHeTGm9iK2wN0CocR2J8O/NcfRyk
	UJmimhQDf1mG9GVK/QPHeXcsiGRqRMQByPnOdjhAJ1BKNsydcysEC/B8d5McA4qNnsxhePzK2Dk
	QsMY4UORO/2uVCM4JRIR9QZvctisCEu1pUj8QPmSUv3pmd5Q0Bt58GOq2Njw==
X-Received: by 2002:a05:6870:82ab:b0:4a6:d85c:a3f2 with SMTP id 586e51a60fabf-4a907684d6cmr3466579fac.33.1793460456863;
        Sat, 31 Oct 2026 08:27:36 -0700 (PDT)
X-Received: by 2002:a05:6870:82ab:b0:4a6:d85c:a3f2 with SMTP id
 586e51a60fabf-4a907684d6cmr3466570fac.33.1793460456464; Sat, 31 Oct 2026
 08:27:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:27:25 -0700
X-Gm-Features: AclHuK-pzJRTbh4UTFiq0fs-4bAqq6ic9ym9r9ejSwbktmESwt9yc0oaaUOjgyA
Message-ID: <CACSVV01pWNJsLLek+az=uHbt1-Cavv5M=QhX=xD6_AG9J+magw@mail.gmail.com>
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae608e9 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=BFTSSJhH0xhXNpwrsgYA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: OP-zDUrNhImnYQjuyEZN72jzRbUlaY3s
X-Proofpoint-GUID: OP-zDUrNhImnYQjuyEZN72jzRbUlaY3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX28t4ewoIEmpL
 4O5jmYKzf/mjPJrfox3hgorUnNH00UN3BkIR2f9K4IL4Whg5T6aNwGmf3aOeGdGprEL1TLR7iHL
 xnUMLJ73AmX+ymVovoXtgSA9MxOqaKQKRdDaPi44TskjW5Se2LYzJBjxTPKfgS1IHu52iObq6bq
 +PjpNdX5tkTjOnd7NJFwhVcxM32eUv4ItYijEbsZ4BK5zdWjc00oCxj6KaeFbf/EJFzYsG51AJz
 pa6X+YJnA5b8K5QtW0MTkZr7iJ0sy6zm+e6oRAHMtdDrHi82+yrrwLF6VR+SmMaHG+/wyLGwG8Z
 9G4Le2wGDfqx0n99OoKqaR0EIWM++Tp+Ysj10d4YuxCh80DIYHZTIoGO/4TkxZK721ln1iO+Ffn
 p6HQgLDK1pbrrioYoaHfjcxj2cfY8lDcc4wTEGQAEsR0M32MET42vua7/0juv/XNxZKnIXTpqsG
 4qljeoPlKVtZ4A/I7Eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXyykF991VO2X8
 WNUqrocIJ3V5WGnJTEAhS5m4vj73mqVbesT/CKyzR8Llvgj51rCSGSN9rPXzrwGUU7pH4QuP5Wt
 8/XwpMUY8ecnt8wuGE+Q69IJxVNNu/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
>
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 21d18ce67b98..54130c32056a 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu=
_domain *domain)
>                 return;
>
>         pm_runtime_get_sync(qcom_domain->iommu->dev);
> -       qcom_iommu_tlb_sync(pgtable->cookie);
> +       qcom_iommu_tlb_inv_context(pgtable->cookie);
>         pm_runtime_put_sync(qcom_domain->iommu->dev);
>  }
>
>  static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
>                                   struct iommu_iotlb_gather *gather)
>  {
> -       qcom_iommu_flush_iotlb_all(domain);
> +       struct qcom_iommu_domain *qcom_domain =3D to_qcom_iommu_domain(do=
main);
> +       struct io_pgtable *pgtable =3D container_of(qcom_domain->pgtbl_op=
s,
> +                                                 struct io_pgtable, ops)=
;
> +       if (!qcom_domain->pgtbl_ops)
> +               return;
> +
> +       pm_runtime_get_sync(qcom_domain->iommu->dev);
> +       qcom_iommu_tlb_sync(pgtable->cookie);
> +       pm_runtime_put_sync(qcom_domain->iommu->dev);
>  }
>
>  static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
>
> --
> 2.47.3
>
