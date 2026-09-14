Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287A4779A8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394295; cv=none; b=QDqgTQD5MJ/BKSZByLAtC5MQWaixTa4GZPTtiZN5ykdroutztARJkJXStxQexo/mHn7UMX8ic3+EjCr8ldE/pTtuU6MUNoLOz0SiV+3H3X+pZIAVkmGiceuBhdhgevVYg5f9TiUUjk7YSeWUww49lEXoX8qZKKxRladvJpaz5ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394295; c=relaxed/simple;
	bh=jzANVhxi3U0Q7co8WVjMrCO5T4ohItLIgag3THjnhF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK0JCRx0aXBqtO0PEVoCoSHvY0dwVPwN92MgtJ5oF70hpe2HgSDBJpl1oiR7jinB5FMX1JSY0OHL1yoDMCUorBKVY96pi30SaUYdr/RSVDaLxdqMoXkWUxHRuJ6DIuCELrPeVqmyqWvoSuXwZHqsVo2WIa5RVcSoZ9gX2T9C6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUsnfwhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ci/U6rG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUsnfwhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ci/U6rG0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0i1Q1200889
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2IAtlPzeg741fpM1oZzwHcy
	AEmoxVX2ixWPS+m0Rk0=; b=NUsnfwhNRJ5ILfIr9EoUJAYFRsSdUYqH1nVTbGny
	A8rPS/ZwlcHX4Pu87LLqA1NhOfafq7fUy/CKd5LIbztza/nWqBaqjI0YRw0ReKlj
	H/GSDu9we0U5hZKiW1XVLpULtBPl+GgfQzL1prDJzKGxvgvW3qvMJDSbSskaNS70
	arPpaic69QERTuGKbZcFLJczu/f4uNLS/V6YkHHlahsRxn8CnDfrr8E8I2z219kP
	WvBB6llbo4pl9ZoBNfKLFiUBtDeTAz5Ro2lFwjHk9FznUX+wM+1p2N5sTN+3ZFS3
	5bH9LZiyWGWPjhdT/SgdKmx0BPWC4rCUZuqxH5WX1jxvFA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs5re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:58:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78f4d6af128so598917137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394291; x=1789999091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2IAtlPzeg741fpM1oZzwHcyAEmoxVX2ixWPS+m0Rk0=;
        b=Ci/U6rG03wydZV9GHcXnEi4pnXWaOVCsTiSqrMI91G+dbQQ/ntGdK1xJvGDA+3/44P
         tQk8Nh/wSAx52mbtLkoop8EI+A2S3naY+m3f0beQhg7rsLdd/0Hu4/gZ676DYJHdy54j
         WB6v6zB0ov5RPxrKy7NUuyNZ1VwgCDeY/VMGQfsPx9GemlbUbdwTaIhqhai0vgG8l5wS
         PfEq+VtGuz9GDZLGFg9oxA/SbS8yWieYyURhj2caKF5l8/f0bsEwGHlhG6BhR/dNqGPH
         sTkVeim90vOQ6q2/cqcPhuAXO42GzIs8kADvKaZjQScZO0khZBwyZAqeXkgfMo8VQoPV
         MJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394291; x=1789999091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2IAtlPzeg741fpM1oZzwHcyAEmoxVX2ixWPS+m0Rk0=;
        b=KlUZxnD3tebFwgVcgp0q0ugIkSYcHJSUNqkHXPpcPA8W0mvbqnJxOzclhbJ3ImzXl8
         JPV2Jm4ch8sb+fvrSsDR3fhStnPqhsD/dtFnwJzCmJw6KkwHqhrB40k0u4cPRoP8UUbe
         PxA0CoNhmoAGxmuckmBaZgFZRfMm2J2hfbPkbQlgVDUf9S2jSTe9I6whhmRK0TjygnTr
         E+P10Bt5cUwf8gR0+F72/rDN8WhcWD8LbiCwvvTqOMo2m4oPse6zjADG1BB1JR076aOS
         CXdUlJ1qfTpLdzngmWyW/hw9KQkGWqAxChlg8+3X6mH8oo1GXiNR4ntxgdQntZEht8Wb
         I3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxuwj9N4xFt7eZNBGBZn/HVMfznZlGKl9r6YZamd62DhQ8tH8qgriLx/HBqmLfx4sdpZkYJNhPO1t4VCuk=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ7CtDKJWn3CHgK4/9AkpDUxoWwKzYkDXQpFHrN8Bq8H83Pk8H
	ABUe8jociL1rrCKanjbGBf1TY8Ln2MyM4WvEqarUJXTfyOmxB8428HMyCJZWIIhNJNv82rz5qRR
	AyJfzJd9pTRwVv5PkHjHqFlXau+8I1EAGMbz5Sgby0FAflTx138Jml+Jkh8Ia7Bm26Fw=
X-Gm-Gg: AYBFou2maNEMw9rQUnKwsYLbU84OF4qeNoY+G1LDGjeE7KZqGZhisT/AzfiTTJ4ZtEJ
	MBupvRwMEXG263fc4bbp6htuipsOVozPE6SzOMjWiq2i2ichThMnufACfaBcxbgjjZp77PqSgsw
	tWo2+kyTziBC4mgMUq7MaLoNWvBGakAK75ZcVzsib9LF55Avkh4k9VEuLdpvHWp+LpogHYjz2iY
	4NFViOeIgqemdqjTpgg7GfpbQWN2Gspv4NH4kQ4FmIvFj2Z7+TE6SWLwjOuaO5mRjdKoT7sO9Ra
	J4Zc16UnsqfwOjkLLlfbc9VZB6y2dWQyMpr5KGHkdQAiWXA+UkMb8MEcwOog8v2fBRSBjBCiD8c
	yVq0jWmDK0lv4kQ==
X-Received: by 2002:a05:6102:b0f:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79b5d8a21afmr1616315137.6.1789394290927;
        Mon, 14 Sep 2026 06:58:10 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79b5d8a21afmr1616260137.6.1789394290407;
        Mon, 14 Sep 2026 06:58:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm26430717f8f.1.2026.09.14.06.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:58:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:58:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Message-ID: <adop4jfhmxuvlhuyei33vsq67fv2a47emmp4zyqrfi6i5lhrrk@3klirxgj7d5z>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yMuB3wsavwywuSJ-_EQgcnYC402JWJj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX0B4VcGSSV3az
 j4nHzvBhYOqV5J54rgHz0C6haxmHNP1Mchn/PFQ48uaFroaajgHlgxaA/+79s/2cP42yRWP4dNe
 s7TqUYfUx7jm7HLkSt/WUcLEyLUVRD4=
X-Proofpoint-GUID: yMuB3wsavwywuSJ-_EQgcnYC402JWJj3
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7fd73 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX8A+o5sUHJg2r
 IkqUXB9sFF26ZPk6wuIYBj7hNitanbjrHFBdDpw7tPNbVwjrlm/6SPHqSlAze4ogNfHPKTcNAIL
 JqutGMnhWkgN5HwfAA0lcAuXtWDtehPcz+8OmtYKzGTNQNqUIybmx2lzImmNj2ljTX92qQ9AQzg
 tlgGy1bcdy6oGf5QTwX2jkIrK0mnImlJGjNr2xALXZJOSKCQsTXqb8LC7HiQLMVFsTXuS+9Dvnm
 0SmkQafMTd4uA3jAcp7FR5BmK2zp9bLl1ERCnFOYx4ZtTg9+Ui1LhMw6uUmbCKCpOY2Z0uxoCUp
 xBBoN/WQi5qnvYfUJQ4MkB91xrF6T/hGgpPVMpa8VsdBTJcQm7VzQK0cJaSTawpEV90q4D8U06o
 qHQw1og33rNQWLnMaXX/eQEi5E0h1noZnUGDoDvPEIJwzFJwOOEv/dLtivwDagy1RzdNdGTyKQa
 L8UrzFTFnEGfj92qb0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140199

On 26-09-07 19:17:55, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Keep "qcom,rpm-stats" as fallback compatible.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
