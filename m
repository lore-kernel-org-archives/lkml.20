Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E573FDBE8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433335; cv=none; b=ezT9eCEvFtBJfJKcqHmdiyMd7YjciKHRUE5q2bVqOmgCw8JUada6lmWvyd+KJ2J/J90eX4KY5R0V2KKPG+vki5EXlKdSwzxwEXAfx4L5zsLAFBWM9lH4QZJBslu8j3tXajD9655vP558Siubp7k2IrU4pY2stq6t4+b2Najp6ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433335; c=relaxed/simple;
	bh=YDZo9ZYZE772bcwSFVYQA0GZbNjBirUfMskrV/SyAes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeYvOWoXLLkJ6U571GaX6N+ZwXYu7mUwFzjI9Gtb2TxGoOrCDHSjzNNvOl0efG/G4eon4uoJkrA0u7RysKoicS1a1+qFUwZqxu/4mwESg27miTzvDn/fv7OOYQq8Z8LSKIyM8RQNjuPYDtz04Kr7PoVK7Vxj0j8B5u13mrW2qPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwGhCqL8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESKBF4GU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwGhCqL8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESKBF4GU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHCv83204013
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVNPU6fgZysvc0v3TCWPIkZk
	yK6aKEYh3Zspk9Nl3dA=; b=FwGhCqL8gDoy3nnOW3pYn7MpEvH9cdUpcuicy9W4
	yu2ddue2Rl0BAB71QMNtpNLXEODgyI+KcDxPy67+wDO2laZ3NoeHmyM3PMtU0iBU
	dWWNZTfh46Tpm/NRKn490LONcWCLIhJeeGg7vVZSoCxzSZyxXMb81Wto2XLGMJJx
	ut9e+Uv4jEs4W/0c+iIETEXC1h/1fiHe+Uu14XJSG2+euq+L6QQfC7cRmsB/v+/j
	JWVoB4tkCgFCkvkUY4gyEOmDlJ1MHBh3rxy7dsTTjvWoy+6JPCkVkzPgbeenyy7M
	QS4lvlaOB422yRglPd85NZxs64uc1X/eSmQ/oOWscfTInw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d10k8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:02:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso495652885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433332; x=1789038132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVNPU6fgZysvc0v3TCWPIkZkyK6aKEYh3Zspk9Nl3dA=;
        b=ESKBF4GURWrcnr6D3PbT4qg7C2Ff+eNUYV9QGE2kp62znYJFRdMrnhdJifxle/y15C
         mBtsxH68soBGdbZy6JtMzxQ4njQuB1D8e/2KQmxRcaYCeJHARpRjf5hBB/zNPKBY+U/2
         aXNVS2bF1N2WcSJfQoevHbUgY8ipmuHdKR6cgQeDtOYgT+YL2eF3S0ygkIcHcX+Ghnbx
         Hv+mdFEk0lVPt1Yx3OfN7ULW4JZjAoUBsjpFza5scdNRVmIb9IbgrGjsQuIhliYTMCLI
         5DGJgfVe7eut1zRRLWIOo/EoWnx3vn5cKlkBAXSiHwbd7yXu9UVbE6Vqu/IrW7UxoFid
         764g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433332; x=1789038132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVNPU6fgZysvc0v3TCWPIkZkyK6aKEYh3Zspk9Nl3dA=;
        b=Ytyz5WpXdC+zorYIg8aJ12xkPPY/JOxSNcvCnKTRPM/wv5rQfZYsp6DaAW44mX/hJi
         nZEeL2kB2aFZldcSHr42uQtMvv/dt/MM2CTlAu7cJhHw/RDaLobF5e3UDphi/m0jZuhi
         956GDQwmrHYDamldwhbZ+9Zj4fR4TnSWUbyP3bC0TuhYg7+5KWAQwlwIJoelJNbK0XPb
         6YkjR+CP0rxla64cfvm772f3cf+USf2sX3tEXuguXyVfzLLCuwnR1gCLGXWrakaom5iV
         oz95tjy4nfyUvcHEXTc/fWDoyS6ivIDsUkN8/n5c/u4EQBx/AJxNuHkkH0PCRQ2W+esB
         xm/A==
X-Forwarded-Encrypted: i=1; AKwUvBzAhbnugS8hsTmG+6AOPRyD+qgvrb7PIpdwKgPgNm455S2TruzM5QSU9246rXCnPAc+sKI0lqyLkYCt1to=@vger.kernel.org
X-Gm-Message-State: AFuF++nl7WvIKkxQI0b1280flb1W15UFYQ4ICDW8A+1LcoNcOjsjK45b
	WkKrEGhTthCvUBsCrB9CcIwdjsbPrcBuWsW4Gsn161Q17WxyovjkZZ0Mi7/FmpjTHoJ41pHUbrZ
	AwQwEcBsiBJDx1cXO9hq9t8yQbbi0Er744UFr5w6wLs8Xm++GpF6jSDZScLCZ0Rq36VU=
X-Gm-Gg: AYBFou3sM+Sd+Pq7R+PyePg6Ey4muZLq6zlF55h+2mKHPRT2SM7Ueu7fABb++Y8FpK4
	AYlY4kNnfH7aODtQhTSig9HP6I3lFMRrhvg2DJ75WK+QKt72+bYlBIEDXAiVbxc0NHbbtu0mHMF
	wMyICiTfQb8OLOSY/KL0B7PM3YqihEQd9GrmYLfQvljv2RZ50k4m7MWi5r43IP0Qs9YFC6Ssvfm
	3BmOho6GLm25UpWbnvoA//U2AIAUkn05dtB3vqLVAcMhk5Wd045SJ4RUqZSKA9i1+eMITTL9eDX
	QTQhg+YmRX/Vd6Dz4KidE6K6uSZPE/cuGeh/fKEWxn0plZJurt/RhgOsBPScBQH8VQ1SADmwP6B
	9fafP97mmyfA3
X-Received: by 2002:a05:620a:6f9b:20b0:939:124c:b7d1 with SMTP id af79cd13be357-93960f85fafmr1094908085a.30.1788433332507;
        Thu, 03 Sep 2026 04:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6f9b:20b0:939:124c:b7d1 with SMTP id af79cd13be357-93960f85fafmr1094899285a.30.1788433331910;
        Thu, 03 Sep 2026 04:02:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm72432615e9.9.2026.09.03.04.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:02:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:02:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
Message-ID: <ebhtzlovapjnznxk5qckfk2uoj3qqilm3rqq66skifm4tiep3q@euzv5r64kcky>
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
 <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
 <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfXx6AZ8DYpW76R
 vu0r34pij/7lxgQMzbgjqWd/LdaBgP4APyfzf4wAnjpDSiHtGx2C4AktiSVwuqoKeDk9/hX6hFY
 6dPcBGrHO8AtGMdBoHbFQkjDBv3LUFpC1JC8Il4GGTXHaS+ovS0Jzl2necT7rQbA2r7PFH/2ZlM
 hRZhPRt9pHqP8mti7glIpirPUf0vg77UMkuG0ZOBWnZ64iLGT8l1KlBMN3L5NPj9rCtQj1UCI7l
 FyVlo6luyj2On01FSsTGtvXaDw4I3g2v6aCjcjyDrMxSOwmTDhOzWTnsIcTpdsrMbxcJabYYD1X
 PS0Hkxmk9Xj3edtqjQsTGUFpLPgDRLGG+5PSw3HayRka76UWQ5PIjQW03Wt1E/8NnEscW1KJhTd
 nxByP4HCHx00KP7yLg1gKhTrgaihJEkrApWwvl+BqdW6kkZbi9b6NBOkW1/zAu0lZxNlTowzp1h
 SLkr0AUmeyFj5jR/QAw==
X-Proofpoint-ORIG-GUID: 2SOTdp8EhTP2Hur7Z85QFhiwwuaqCGhD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX6WJDB6MwSxtI
 rnXDYvRQZlnfBH3EYN4TTl3Nqam9uGmjjLE55WnRqXcljPcGf/vmrxsflRKquRT81EVzErIPtPO
 CwDPcfI66GrLcaq13uNa8QPjEkoVgl4=
X-Proofpoint-GUID: 2SOTdp8EhTP2Hur7Z85QFhiwwuaqCGhD
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a9953b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dILcdvjvUJ3AZP_D2AkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 26-09-03 09:26:29, Konrad Dybcio wrote:
> On 9/2/26 10:52 AM, Abel Vesa wrote:
> > On 26-09-02 10:30:38, Konrad Dybcio wrote:
> >> On 8/24/26 3:45 PM, Abel Vesa wrote:
> >>> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
> >>> and Volume Up.
> >>>
> >>> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> >>> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> Can this go to eliza-evk.dtsi instead?
> > 
> > They can, but what happens if the CQM variant remaps them to some
> > different gpio? I don't know what CQM looks like.
> 
> Can you find out?

Just discussed it with the HW engineer. It is the same on CQM.

So I'll move it to eliza-evk.dtsi instead.

Thanks for reviewing.

Abel
