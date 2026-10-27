Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114761;
	b=Hmm1IT3H7hEeoyZJEklQsDirhzNWvvqbPZIfUmBrbjuFyCQp4J4yb5a6iFShmA/jebOY
	 6vtvzSJmGCIJi/J92+8AODSzsvz+GKEGWeRkM7RvsBXwGcmDzzOtoFElK4Q1QftIXhSe6
	 tlNJ1YOSgFv+ocFzSAVybjSZGJCE1UwGpvXn/OTvXZE/HrgEqwX8iPr91B62zYkSy8P0a
	 AqFjFd+76OKnnqRe5fZIFN96SgBAV8hkgDBSw005iVhbMIVjoDniW8Mv6ll0t3bGU/Nka
	 MiOA+KRdq1dpv0TVDF/g3qvku4SSkq1SKZuTbIRHClHzvdjmVbioWXs4g57hMMeKatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
	b=1jguhFWJIyE0g0E3N6VFPqvo9WmeXbdZKFRCU1dlrzuyXY8PfCondOxf4xjF5Z5HYumQ
	 Flo9Q3Rdkx5yF1PQpcwI1B58rXTmRki4H2nDCsdJsQ9yzqkUl/OwB8G5vA/lc06Qg2SDb
	 A6KTdFnXuswAdHDc7cIL5dMacJa4zFabZBBjgsVDSfCIF9+NuucNZMc06/cVYJE9f+kS4
	 nJ0O7yEhRzZksvRBaNGE1Gi5yka74Lfghbeucpcr25XQ8DRkkB/FRUkXG7nWpSoMz7Kjq
	 l/+ChW7lejuB5ZZLlffVjtWQc4mSJNK/mQb3PGIzwqvVUqZzHcH6TUe+HcTB3lnCP4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAaIK2LQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fkp4aW73;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1642B606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1642B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAaIK2LQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fkp4aW73
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKung1521248
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3rkZRJrRIMFJtHN7Q3UeT/+V
	0Hg/1Tzp+aXrMpL9biQ=; b=IAaIK2LQuupkR0d59j2dTJm+872fnmF8tN5tK2Xr
	BfG2WDrLVt7h1AjTVsw1xQVvprY9JX1RxBF3ElYN468tPBgRK6zcxYQtFj5lgMl8
	3dUrOhOiTkDdlkQpmwQh/b5iS0cxC04dBp+MBy58ne3n4e3P6IowIa0KYdh6A8oc
	d7zvM3+ZDM7ogysqSNgiTc3CLjQ2gat742hsLgCBVZHzZnFJmcgcCiZvTX8BbRg/
	WEj1P+vtl/uUWzjxmSK15CujJS0IOXjMkmxdT8C2zHmyTrCv++PfL9nM2jXFoguG
	fdvbAekl7osBdnbF5Y/0x5OvwUVCpV97D+1zIBxMN4puXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98sjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:25:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso1015789185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114759; x=1793719559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
        b=Fkp4aW73Ic93TMynKTPrKZOWzU7Ez5GK/sQazFdXjao7jUGQR40JtbfiyZKrrh2Q1u
         rlnTVyIb8zHJFPCbOZguIaXGBaZKoY6Mhy3UuAzKC02LZAj73/fGIQnskVvPkcpQI4Ot
         hvi+hBK9QsPODoIBEwXK75rBjCpKvKPww69mJ0j+VgoDiToSYUEg5pybZgsmKg3+nT6E
         boWfP63Yf6Ow2GGnpI9k8fbkRxWU4UuElMDVK43M8XdoxUHbZndvZJvgw/fuiPyAxfqP
         1wj7JenIjl814XkGx+FS/RiPNDOq92R9/wZJphVOecoejXrtS2QMSQn6X4Sb3/XUPxKz
         /xVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114759; x=1793719559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
        b=gq0lA/ixp4nJfji7HLn+IascdJfdfdRyOG1N+7mzuF+MiaW6+IVPU5XJwxiIT/NPlS
         Bxw4nIZX3AllSWnvbb4CfDIHby9Zw1mET/EC45EQIGJs4EiSI+WCWNX+ftHRsmCarbjv
         BA8Up2bOjcxYtLXOb5sgqjaGvz6lLNM50apQWSbm5oyWl5Ft3f8WjcVYzRPIwceXr9m8
         eO1iMI9c7OmLIE6AD6EPKfpn2L7DCXt9N28AAFtnLyTEOKWD5T8zvYrJiD9VoKX7pOuC
         MRsIp7+DhaM2mTeN+scca8LO987fWUwvkluRcuxHQggGsy0S2YQMEKuhcpiWxu2NVa0P
         sNyA==
X-Forwarded-Encrypted: i=1; AKwUvByK0QAF4k/tx5l1BWrYBJgKScLkGhGZt5+E3pe63Rse02UHgJrCTsRzqEBlBBnBt7Tv3wlpyt2Q0dlFvrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8OepCNGuTZPT30PbHrA/FgpsVBHKBJEBdR0NtDCbfPWdZSjWd
	s/kkbaopO1m9Qpxv40Vj8EWzNPfzyvDxvmAByBjOKILLU2LHa2Q0J5QsHV01+D0p0Qpgn8FkeVj
	Ni1frx2boB/9+rF3jr5dCmSB02QH6T5HecInnyUHcnYB3615FhFjr3d86Z/7A/MzXHT0=
X-Gm-Gg: AYBFou0H73Gg3HYl699GOmNSsipFkWs4iMALwrCohXpnO4U22iRhLrgNQXB7NBmJfZx
	P2ckf55zbPMTIjpazN8izlGYQZXbI9K1kR7xAFnlKRc+8PjZU9j1EF+yWuqeYfTrPhDQPkt6u56
	FVZg8T+vKVAVIQc1J6qfqU1klnccOoWeXAZ39UE0inBv0OfvtKNdHo0NSlkU4ZY3Rf7ohcHL5pc
	qqyU0x/wia5qhmC/nHm5Zfvjg74e3y/KDo76OKB+kUTisbFNMD0XBD6t+0DQrhSOpYjFIUtbVWA
	vIo+1l7QawpUpuGHcovflA30hNczqKkKERjsWZTJYwm0uEM+M5o6c2x0LAMYT6AebMdQ+9WA1/S
	sd3ks9vIi2UVnrs0h
X-Received: by 2002:a05:620a:29c8:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-940ef8f0f5bmr1573172485a.44.1793114758952;
        Tue, 27 Oct 2026 08:25:58 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-940ef8f0f5bmr1573167785a.44.1793114758351;
        Tue, 27 Oct 2026 08:25:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm288934095e9.15.2026.10.27.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:25:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:25:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot
 supplies to the Port nodes
Message-ID: <w5wuuxf7pkjp3lvlmxh2mek7k427pod2ldirs4fwcsivigngtk@aorbeshgymwg>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0c287 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ibfqn94CS5QR_ObWptoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gPjD_SoWHzmOzuVO-RRRsfZwuzx0xMjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX9dZJlVJNLEyF
 cCiJEEH22wUz0mD6WOC4V3O05OqzxPlFh/K1y4cu/y98YApym9cPeU+FxTTV+pTdupZ2r31kI5N
 hAJgJIfROA4hNY1heyXzImUQyZ2hmNW3eH6Fzc6oKoC9U+KX4/+zzUx2pGctX1Xfr0dO0H5dFRV
 p6HjooQyeLIJeaY77oxRJPrIMutNf6KZOh79lvhaJhShiWalmekauLI9dkcuX17m7BF3pYxjZW2
 EgKyvBEhQqMN2zqIzDtrgfCS9KLwjgDRULSJhS711RFpuvTmjpufq9KAtzJ6bN/YPB3pN2D0w+3
 I/T+IFtm1mnVjD1kGLdzUYeJziu1xhgOVZAVpelU5FUOexpT4LasfiLoExulKxH08Vp4rXyWLrD
 hIGO2EHeTAWKWMlcUt6qBI1NH+bYotSQJKCha7r8KOpKc3CC1N2v5G5U4I8Yg8fGqSdRektDNsm
 vLDrpjUSdF6XfhgKa+w==
X-Proofpoint-GUID: gPjD_SoWHzmOzuVO-RRRsfZwuzx0xMjx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX4UrqBNalSsAv
 clrnVdOMBEHcBwfW6HYjg1x8l+rIDqAgT+vNDcvvMp5QZ8VK8d9p9m4tnMT9UpbvHXG6VDBlAhf
 8XEi1bmht8OzAnimeHuk6z11WtAsyZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

On 26-10-27 13:24:10, Manivannan Sadhasivam wrote:
> Since all controller nodes have Root Port nodes, move the slot supplies to
> the port nodes where they should belong to.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
