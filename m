Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C873E2BEFF6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126096; cv=none; b=QwBWXGX9sckZjGKfC56IRgHkTN8uvTHr0EROKm6lmpan4g5qSbU4/NJLcy6t/Gyi6tGueFbZPX7t7iqeLMyyYfm5qsDAv10NcWAFwhYy9IEB3Oxz3vGGbtn3DrHtU7kSVRKXV0o9o3o3DdbmP/61qP/LMCJxBe5DPSFsqS/9gt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126096; c=relaxed/simple;
	bh=PY+mguwkhJfjayVlC94WM+vz9MeHyZawDi4qHK2XeNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7/jFCUmc0GnGOtyD26Jr42B/bkkdpUZseYnCktWyfrd/j4cjKSCL7YC1NwUMfBSHb6OYlJRvU0Uq2bbhWAVBwpCYP3GgVbsoOZyL9Qf6jNl+2awqxGT12YpSSUAlZyh/BqHNr6X+4y6ySEgcpzI0sJWYRFQ4N4PXb7vlDSLSGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICDJ4j5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DU5QNE0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICDJ4j5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DU5QNE0m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Srgr406165
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=; b=ICDJ4j5bWCIwmJOQ
	V5khTEnetsj7M5M/eOBr7hWqmi5k8RmCEuXgC5e/f57oQFarfdCp7JQGBTo1Gq+k
	7J5Lk+hHkc6oVD+1b7wRQnlJqD1OjBEORRLqPyItqZeGKpxKCheRcSJZhM8Gin45
	VZ5vg86FgdVHlhmI6e7dYNu5YQumZ327Tqx/dLrg9+l+kVN5N9NOoE/J6ziWWOZv
	G5IgV9mbyb0pjGgaZqIZBLLJ3tnnNYyZuAdO9QBpna83Ch7K0UZoXe+p5oPLODF4
	c3ZdcfK3Et4ZeSu38EHYbRWVtP/KEc7TnD5a2vkANMCrB1gf/1tr9O6YTQq8Wxr6
	XswU2w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa21ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:48:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so23452756c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126092; x=1792730892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=;
        b=DU5QNE0mqyifnyL5chovk/vZM6y3d+6ysqSmr3dPgra+lMqos1Rcjz3QvrI3SDKBfD
         uj1RAUIjn7RJXkJ29HI+gThclusDJmg2j1RWCM85xPGn+50Lai0WN8LIk2mEo9TKSOnu
         /IrJ+ws4/Fo7EioLv0ju0YX+bfIJRfi8D+b+JrnUl48C+9MpDWxIuuv0ffKTTaexfYFS
         yVNRs+jG5Z/RpdMb895GPZWApaYP6aJAJDnNf8Zpgm2SbspNcL4OP4qYlmwOfXe8D9jW
         24NiZxieDEtkWxyFZ3Edrtx26KEsqFLW+UJD0ejYE9Y/ia4NR5ftbHDNWr75qngVDfOF
         yvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126092; x=1792730892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=;
        b=LLDYPG6X4Aslc7fn9CXVjzF28u3Ta8xSaEbI/qnRmS0o2Enj7u+Pi4zuFuCJlbng3O
         1mXeKRlSlFMK0nKXnisn4dULlV9Ch/urIPqFobR09peeFTrgmJ1h/WYYD0U4Laeo3Cg0
         iobT2xATVMmriCQJCgmyZ7dxgy+Daa+ZpNWx9MUGedcU9TDT8S/+ygjWoOaXlHcgFR9z
         AoM+2dIvmRYBnqww6rRcWL3iF3LliFkBkDoHSUvmPDTyXaHD2aerCgertgrZCeqXUq1h
         CCgIn6JeSWQC991LLWHyy871R1Mn6bTtV39ikLA9/hG8GnaObEW39TldkJP7dXa/XKzH
         Rbiw==
X-Forwarded-Encrypted: i=1; AKwUvBxtaFFSchuFsjwjrarcu/oTPQ7qod2C+sdUXCgYbbR3O5jpKL0dabX36ug56/9izB38u8V+oyGtDPUodnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5CXWaCkH+XfMfLkAwrym0PkI3vOg54U88ffxJaD7897tCXLjH
	YYX0JvIQep8RFjXn69O3q19T94oMYbYs1ppPyKdv6B0ky1GO8AcMuiuPrix2IOdy9GwXWZ5fJ/M
	v6ZGVS4bTpzZUR6nm75pzlVeZLin4eqtOnBOJ85NDd+I5WAKbeP18wrbos0TEzy8OMTc=
X-Gm-Gg: AYBFou01egUgz8jo/KrEV/2/OYRrzRBPNTmQIkLdpmFiiCrYy6FhwNnmkjkbbsjBxxU
	BaBERytczrmfLrZTyYFlQMK1bdLKpC2fI/5IoOh28c1fu50wcN1Hrl/Za7FEiuVcXlaFWaTnUxG
	KhF4f4km/AcdxHte2qkX5GwwnH9Lnj7DmGUyMI/Fei5Gjy34vOT6wh2Hs40HOekwVpWQk2EDGu3
	c4d28AWhGIM9KwcGQDtGJaWnB+5fn4L8D9p80C6aqSNGrpq9UY6U3MyyvTol/geuQ1AOP3VdCQd
	U1G273OLimtdTL6cU/PYgJn9PW/2QWbc/rfwNxwcfLiZjPx4MRPSm5u61lhqQIA3+hPhgY2mLE5
	PBnF+sSsAn4yEnpvrg0oFXTed8tnRfQ==
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr33405254c88.16.1792126091501;
        Thu, 15 Oct 2026 21:48:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr33405214c88.16.1792126090833;
        Thu, 15 Oct 2026 21:48:10 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm3044571c88.11.2026.10.15.21.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:48:10 -0700 (PDT)
Message-ID: <22b729e1-f592-4312-b2d0-d08965c4b808@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:18:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfXxAbQK+LwJn7/
 7Qh+4aqZevErwp/KTIOrGfLi5nFixl8gs7x3K1apIrxF5IY864P2X1nQg19zoeAer0jNGzvMrOv
 2JoRHt0IwUhOkEcYMxS+iFMC8NcH8Vw=
X-Proofpoint-ORIG-GUID: QqW5vRXVH8xyx6Gg4byB0lPipDgUw-sE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX8P8RLrnECYn3
 nXUcEisciKylKefoy3cXDMqJrrfMP57mrZ4PJYPgZxQ8TvLqCjbMZ5wMjku6cB+xZKFRkZ6yBPP
 MhHU7/AhKrmGDBlhA7bc3aqMHnmfsMX7SwucUCNfTST632TA4hlwNgHhCjoHg3hul/jzHTsxZBn
 bLFMDtTRdSIOMIEEb+6u06R9hkwrYYAd4sUcKoKpjNWzcfZGgTCAkmsqa4G7Q/Bjk0EgfXXd2C6
 YG4sHUjP1GmRHKpfpLoL6jZwAwCRXBowfoGBnZA45nB04NB6rqi751p/YqQpk/CxpGiQMyFr5AD
 HcFp4XWrpHXYtFkYEaGZLqwuwctFJ/h/kjxk/LFS+OkDgYDmUVHD/oOdkeAWn6j4Ffp6OUmbexq
 d6rB5IkqDXMQDoHTKeCmdJtYrcorngwsn/Tj9FqWGCcgXkEU6P6Of6thcYLeM3+OBWKtlWSnm79
 FT3gviyPVq5HKWbM2Ng==
X-Proofpoint-GUID: QqW5vRXVH8xyx6Gg4byB0lPipDgUw-sE
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1ac8c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lyEmEM9vGBA4pv7bqbIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Kodiak, a synchronous external abort was reported during storage
> testing when the kernel accessed memory within the ADSP remote heap.
> The faulting address was outside the HLOS stage-2 mapping.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
> Link: https://lore.kernel.org/all/20260423063502.484-1-
> jianping.li@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

