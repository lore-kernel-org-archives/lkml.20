Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FCA412266
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951161; cv=pass; b=sG1Nmj+RofFn/PjMLub9faJf8NCr3kwFwIszDe7a1h55QwSr6WnbnJThGIMrud+qy8qOJTvUdGY1+PEBtmIoke3UGP8sLDXFPv96HC20AUuTSqoVvL2RUd5AqU6YnqwWgwgSGo+v9dKqGcZUVRNXsz0XvZJHLYu4K1vGXvD17HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951161; c=relaxed/simple;
	bh=l8OShMunAP6CnTzML3fBuG0pGlsaDFB/65p8ok5Q4Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OC+21I+fyau/e5KNlCIKcJA/IraY6zcrfyCfHkVyfJtlmJ2uajXR8Wk76dWP2QXB6umwA7hJxPHPmED6ZFh3NQd3RN766z0ZYwbId4WkQKyg+/wX2M/gHpkxL/3rbHEozxmesq1YFjs5mSBG2TKW4uAMUV2Po6TUuUBEyUPAH2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQpxAFcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EknhqSZd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQpxAFcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EknhqSZd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DNCjRZ2088027
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=; b=SQ
	pxAFcS+1SQ+AskTGAEMjYX4fMsFRgqxpslh90yM7fF594sep6OqAVAwInsXHsgow
	BL4dDj70qgx0yW/FdzUvYhHMO8SUBiok8zHTz6DSJBKyC0S4es+UWv/sZjUvtB1Q
	TxV5RCv2MGp+BxeFreqNTpTU7fXT2tpYrpmdEw6b7ZTBhWvN23zZqH0oOurCfQvy
	G3APDC2Bjgke2qis/y9PITSOfzrkrgKQsfmbESyB0b/xsLDCdGh6NNcuY6CZemZl
	CrTd8bOlb+4yZjuzD+VH5KQ6O+MpmOgd1goEeBssdRzvh3c8oFP+RtOb4dtVAjRx
	RRaASqepXNhztxsusPNw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49gvxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:12:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0ab72a6e8so30273457b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791951157; cv=none;
        d=google.com; s=arc-20260327;
        b=i5N4z2X8XTpjLt0hQmyjE9JbyKtR0uLtSRs/zN3otTvcleZsjKu/DdkzS81Bh0DlKJ
         1m7koH/SJT94qKZV9smSwkiCCJHEkWpnglM+fwM4IRhND5IhLW8PNdmVXyg2huXQmqkM
         aPkFtVBdgQZty4PfkQAoG9xPdovyIcMbRQPAJ+z4y50sr85Gl9C4Ux6Ioc/H7fVhwdWt
         N6X+jnXFlBkI7au/zljRVaIs86TLHZvUp+ENJpGr03jgK9lp5NyzNK2F7xd2xdFEtLSH
         348uf1D66BNW+Zwf/sg3SdJtFPYIH/9mFcDJ74a4ct+B/wuOTmTF2hVoOJ1Iqs52DrSb
         4o8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=;
        fh=ntdzv2HoGgjvaZIFcNnZ3pTvxAXbEtv+3saioSlYgVc=;
        b=lROi2Ow7UCXKd69884DgCrKbYzOF9MhLUo/aXNiGpAx5WZrj54byCCzXUr07Doiulx
         M7mXV6wDJC2aUS9rPpValbhlobA3F9SRqSM6Qt4a84NhuOv/P01CBE/sTiUu5kVVBIgo
         t2WEoIGya/N76icyyE6C1dgevB5MS+vAPkNV9ExOzTrogzJ8c8BEbcq8qUc9Kp6qQJc/
         ncqK8Y1o9Le5vq8cr/qNdPEhEOZ0qxMHoCouAnTsGfmMjPIzFkV4olc0K8KUCyzRVDmU
         prnt/Wy68SBKyr/c0ZlgqYKzIRXUUbL54kqpdEpTchLfUKp6XYjznr9ycI3z0L2SlWs/
         7nVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791951157; x=1792555957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=;
        b=EknhqSZdA02RjdPCdSlEE1sx7b/lKuo/EOOTg4GgHLOtey5qWTpLO/I1+0SlmOhSzY
         Oe3UP91lqEvde47yCSF1+ITa8aXYeQMjudEfLSCjnI5Rma/l1eAPqgfIFUBzg7tfpJvn
         K8Vv0TtqJTtrGx0kXDkPoo5CIvxUgjc1eGn6pBB/s10fNK3xO7dPt3nqXFj/LS74tu/m
         dECyzsMAI/wCFKS6r7H2YWcVgAOYehm//I5LS8q4sWFFvIyBI02uxhbNH0jX+VJierBX
         laCVYLuTMl9QdG7SmTnuYA3ghwO0udl8ZfF/kMqalrvGWSWt5dWtBMzfvvyvnJpIea6j
         BhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951157; x=1792555957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=;
        b=LWi1BYwL0OaOEZT3eIJCjpsPY3YSNAeq3Vxqdsf/0ASNFBCN8EXCHasosNb1EGIzEI
         TwA9mtPm8aXKdF/INkc/y563Orx8Vzsr7uaAdWTyYkPzq1i0/SJnR4RF83V5WBZxddjd
         /vGhczsQbV8L05dabVJhvlX2qGuzR1pHAwDen7TI4CRYk38BHFa7P/fclpi+UIU1q7QQ
         eaShV+KqRGX3cHahAAWS88d9LGaciVvwdWLfxm0GaeULuOWn7wPZN9QDjA57FcEAfs5w
         Hy3DAim+VEmlmmNC9fipG+LZx6N8y/PwTTDO7JiP5xi1tH186CXUCcrHDs/QiA8n2S1h
         lALg==
X-Forwarded-Encrypted: i=1; AKwUvBzvq8CCAYeym6J/9dqVDB4Yg74GE7TrisEJfhrpKDHRPAH42alce/jhg5gAx/z+VOVCrkMuzPyz2rGdg0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYImfd1tdX5sBT74b4naZweygHH9XKr7q9A+zORswEfTCRBLdFmF
	qFhmztjAVJsUDf0PInyqNeM9mlh0+0WQcEGKxPY9Rud7VJ0sYkN14aeO7Xsz30U71hPX0kWt3Ew
	38nP57//uyBljHIvLJwQnqCaSgK5WuWHYSjRCDNWxZdE8DAPDwLQiGifPzvKQolvNnTxDPyRf8q
	3+LKV0e+Md4FOtV0RkIqABTUR0gdCFDbVImJ8X2qzXTYjqcHf0BLwu
X-Gm-Gg: AYBFou13s1iMo1nHcvmypl1UkYVpvW01NYsLBnKLyqsXk5ZNObscpK+kvciRZPd+yNA
	APirq7pAWoohBZjL6hvU+E4PL878Q+lzXzHq8QMtgKGzfCKqavK2w6NxEIcE5W0snCteKu+Agl9
	cHlM/oEOaCN2jSj5zS+zKCCRBgAdfoleaDUtrwnvJwL4wTDJ7y1yTUHvCkGzQ=
X-Received: by 2002:a05:690e:128c:b0:679:8835:a554 with SMTP id 956f58d0204a3-6798835b6f3mr595926d50.94.1791951157122;
        Tue, 13 Oct 2026 21:12:37 -0700 (PDT)
X-Received: by 2002:a05:690e:128c:b0:679:8835:a554 with SMTP id
 956f58d0204a3-6798835b6f3mr595910d50.94.1791951156684; Tue, 13 Oct 2026
 21:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903140031.3684-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260903140031.3684-1-fangyu.yu@linux.alibaba.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:42:25 +0530
X-Gm-Features: AclHuK86voQc4FUtiCdkEZEAZb2HJ7wq0GZX-kU_HOfP197uYVxA3KPb_kIuB4o
Message-ID: <CAB19ukELrF5wf3vKaPhoCLWmzGDExv1mZQAyEs8K6uq-zxqsKQ@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: RIMT: Enable PCI ACS for root complexes mapped
 to an IOMMU
To: fangyu.yu@linux.alibaba.com
Cc: rafael@kernel.org, lenb@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf0136 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=N72Xn8VYRMkAawgvMsQA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNiBTYWx0ZWRfXyEqkfnQ2Rg/X
 BFQf35dNR97JR2OrsWDRNGRNyRefXmqUBo+6qdt+MgBnAzH026KJSIGOBgyKv9fC8RZ/j7blPop
 n3IRaoOc7iAkTtmQp/4RvDTWuSD9LbO+joMTgft/cZx9ns01jJGzh4CygcAtncRCg9r3C02/c8K
 kWcua0R542pAoTFRl0B2GJeBQKPY7PoGR93lgKWF5c7U7FAuM28MDvXHm5cJZ3Rlf/d7KddWaiK
 jrhMLhxRgsF/QKheqFuX9tDli4/uMgRKvkN7zSZKPcQET7w2RZgTl8ma9Spzyx3icjj9kW/QdMv
 8S7orCTpKV6/ZHHF8OhuEZztVmRUyOlaHeTMXmSSxm0345m36/7M4yAWgo9KRLtTgL103u6ivTU
 Tub5hXsMizA8vSSOgoVvdJK8huWUO9u3c9G+4SRYh9uO4omv8fkQqg+oxLlJpOJEVvd+orhcW2X
 3Aw7PVy3j3XhFiEKvNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNiBTYWx0ZWRfXzR9ncfmSmknv
 mqraClQAGnoPW4Edm1p9PRbQj8YOBAQa/V9gysukYHPhCxYNw2AZCHf3N4yvNPPYIbeThinGvgA
 A1wNy21hhKQ9dr+APyMpzMHHddC1/fk=
X-Proofpoint-GUID: DuS2fuoIXYANGA-gXo3De-pJlgfG6gl9
X-Proofpoint-ORIG-GUID: DuS2fuoIXYANGA-gXo3De-pJlgfG6gl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140016

Hi Rafael,

On Thu, Sep 3, 2026 at 7:30=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote:
>
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Mirror the ACPI IORT solution used on arm64 (see iort_enable_acs())
> by scanning the RIMT table for PCIe root complex nodes during
> riscv_acpi_rimt_init(), which runs before ACPI PCI enumeration. If a
> root complex node's ID mapping points at an IOMMU node, call
> pci_request_acs() immediately, so pci_acs_enable is already set by
> the time any PCI device is scanned and pci_enable_acs() runs.
>
> Only one call to pci_request_acs() is needed regardless of how many
> root complexes are found, so track that with a static acs_enabled
> flag, same as iort_enable_acs() does.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
>
> ---
> Changes in v2 (Suggested by Sunil):
>     - Check the RIMT node type in riscv_acpi_rimt_init() and invoke
>       rimt_enable_acs() only for PCIe root-complex nodes.
> ---
>  drivers/acpi/riscv/rimt.c | 58 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
Could you please take this patch via ACPI tree?

Thanks,
Sunil
