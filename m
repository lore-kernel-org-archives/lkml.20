Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A835C4AD4A5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404050; cv=none; b=j+EGEuG6ei7Lo23zvdtHYUtDjdthIQg2sOQ0AJngK6EFYdyn5VEqMhGF7AFQh8R3e+1VGwLfUglX6BaGs20VFsLAj+rlIvxYUhcASyMGc4uwJPHzyagLSdk6/9bqLo96vmoHxKQCcF8ZyOQPBJBZD9wf/SZLYCj0PGM92qd+Clg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404050; c=relaxed/simple;
	bh=R70oW8LwphJ/NTsHnZ5ZKcGx+X10RwjkMGHl54tVw0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoXaLWm0euEvPpTjPZQO17fX5tMwKGhJWUOhcPkE8c13Z4q0Eb7aTYxoECxDzzKx48BmuPUYsRS9u1esN4PzImXcFGX5PKTGRbXFubykcWaTfDoRN5G0LPyhWc5mM4VarAN6CzyWXlhbGuYtp7vhvJ7B8rjuC2NqSUqv7qM9Xzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGh/M4oI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wr4xnlGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGh/M4oI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wr4xnlGf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ot4x3256621
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=; b=MGh/M4oIvCZ0mjOk
	TfZSJb3b4L/Su0I113ZdT499+I57TqD/QGvNtLzYywPwHc7zsBDRrj4KlRt6JOV/
	sIec8yTHi7DrZdGUpq2mBKPFdQN53ASkWeUuWM6/WR6A84ttl3d1Z4w47+BC2oIO
	2e1fNPD16VAAYN7I70WXXMgaV1OqtGZYDk2G74d4uoAbyJNrdxpePhCnHaTZvoRm
	L8AiPFy/by5pgDPtDaOoVvTeD6QLKs3LnTszOiK96521Bf9A2DFfleLOO8NX5MEz
	QPnfblTJcfyLzxFWy6j/wQGYxTGhy0gMRH7ipiWI4X4nXfPA2Rtqjqw58mge/AUb
	UaGHOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8gt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:00:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso69576085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792404048; x=1793008848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=;
        b=Wr4xnlGfUzUYAgtJ4vFb1CsSDKlZW6EB2pZPd6QXVLxB+Qv1wQCc3OCI6sKSb5VFnL
         UnoBuPfP4aQdkD3ZXQ68Y2Q7MSOQR4OPmmGH21j7Muj1Sehm9aPoOramBaH1gN30rCxm
         bZ+WRY/esJvsnPgJ8aeSIVXTuzPeSYVzSaz9f503sWCDT5thrSNT4cL745fhBnGguRWi
         FYWkslWGspHcKn1nihZ+F2gZ/HJ/84t7dTG2lmBSHs5YYz3uhH7JJx0/qDGGoYJyYq3d
         lG/leLjCgjs9oS4vIPhitVNnwcz7zS+N2mMi2h9ThXCE2221PzUIvjRvKSsN/7jOIyAB
         0zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404048; x=1793008848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6CDwyChsU7mTTcnFRr5rj7l7/nx8KuKNscWAipG89Q=;
        b=K1t7NFvnOY04/QOXa9XGapWCzBd8zTMJ97kpCC2/yeKY01zhJHodpOi+OHauxvq/ff
         vrdSgO/H682e7j3tGiMGp9pO/a5Gc+XRWzfTt3JE+uP5Wd9qdL5SEzoAC0pTT+CRAhec
         vmv7VuiTkZBk2lpfrMTzQMmbAhLg2cVUv1wSlqdjBazpa01z1nz7YHbpvXEI/4F+UWDd
         ern9pqgA/cf7cNZC2eeMuya3T4hQ+a/Xt6nnMRVWHZZW3vdt58qwEX/iNzddFte7Y0Nk
         yGlvOXS2bL6o9e8rA0ki5cVXnIs5iIcAEMkJOfnLMZVVdstheyMkMSNiDViePW5dSmDo
         oo4g==
X-Forwarded-Encrypted: i=1; AKwUvBzPAqJ6SFJUkcwEQyMo6WU7p4zo29fs+VlN4ReISLsuryMPqPjFTkxMG9pcSszEA81XvAWKEAuGLdE8tpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlV2ij8wFL2XgqxnvHIsF99lJvDglHRt1/EChZ1DuNXX4/1/2J
	Ch8ulBnQ1A1bXJ3urCptvN/bITEXtFl45Dbs+UYhU/p0gx/ytUqO1AL/KOOEH7U1GRfkxJ1LOm/
	2O/CuU4SNIi0AyBUb5Ey+UVm+P9cdNDxExyz/xAfbnWW1iAgEmZ6Fh5MDTmK/E/XTPvM=
X-Gm-Gg: AYBFou2q4DUWoBb2iuSRFfGIKWDolVcrV6xlp/z9I0gzJ9cI2TtG2Y3PLYepH6KvF9A
	pba8T8ymMQ9dgdmCkZ9WiTORDuBOGw0dA9ErSvILGocjPhRnufxEQYhb93Jx83kK0jpiaoKswSo
	A6N0cHw1DlKzPwALOg0TvQEPn9EFsLEQEVaqtCp+rspFcaLW6wvA9IP5ecdcxRDj0z3eUiMhbDn
	ILPIG4U9ziaEYRhuAobMJBIUBj2cQkDyoCu6Cy0VWXInlh1qBRhQtag/mLSNKO5U6Osd9xka3IX
	dNsq9nKLE402znq3TIDXJIQfKdnqOwsKdw2jXUCkolUBh/6gnRVUehFECG8mzKXy6zq/WTdFLkK
	rUhU8ZK7mqlAEhuxEiiFCGQ==
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1435658885a.1.1792404047011;
        Mon, 19 Oct 2026 03:00:47 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1435619285a.1.1792404044185;
        Mon, 19 Oct 2026 03:00:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm3556395a12.24.2026.10.19.03.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:00:41 -0700 (PDT)
Message-ID: <226826ef-0cf2-4147-9256-d257c8272883@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mXeT1CohCAUlBcWEgOBxLQyOV9mm5YIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOSBTYWx0ZWRfX2Ez5isgs19O4
 2X5y4NYepFWoavBsetrUY3mOAfCpZ1vxcCKFVBeCdHQSqPPrk+cNH7OKVy81M0WESLFcc+kzqsS
 tB2rMrARBIlWekVfevy/Kv92rReypJo3Q/EKYrh25Yn9UTU+gK092kAySAV15ldRFmkh46EpwSS
 HKXGiT8fMSTOHTuKDuyrDfTB5W+FAhq4zviSW+9dsgxeCmHOMRmDHDejTsJ/1uGcsbAfN9We1f4
 44GrCZ7BIQdW6kJoORsdaM2DMy4Bio1/VBDs4beXYq0Gfh4W13PObzT5XFtbn0XPtCDZPUpsM5K
 gktJ0a/TthdkMd0xJKM0ixaMrFDTQwboVPqglYemWbvqKqDAAzPDGRzjrDgzrzpxeBaWTEtKv74
 /foe+cUIfDoF5nRcA6CaPrranFq1sERj53UbTQGA/PcMF/9KVa/NetyvF2kNZGD4yHTaJdhNhht
 UlZGYHTu0J03pMffzlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOSBTYWx0ZWRfX2MmDMnCjBFWC
 PUjgQflDtt0X+8Z99oCoN9q5fcTdMleIIf7cxfUV0VhbCgLBF0+fM4oCA/+61rO9Glm49NEp5oi
 IVhmgwevwAfdwZXOpXuKbA+YNKNaZiM=
X-Proofpoint-GUID: mXeT1CohCAUlBcWEgOBxLQyOV9mm5YIQ
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5ea50 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r3KDiPLWR5a1ZHJE9ToA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190039

On 10/16/26 11:12 AM, Imran Shaik wrote:
> Add support for 10kHz and 100kHz GCC GP clock frequencies required for
> display backlight PWM functionality on Qualcomm QCS615 (Talos) SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
