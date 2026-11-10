Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303177;
	b=DKSZsxTpj1ChKK9rbpvby+XyPRs/4vf7olnWHaTcKDTC7MdHIDcJZ16HFFaCRliQaamL
	 QdE6IFoe/3PXY3JBN+X/ChF9wOtbrA6yi/5glKYDXzuHJ9nxp8YFj0+LTxI5nx9vDLfwl
	 W5fgNotc3ndAr7oD1ALB/lQCJwopSH5mPPyqGJh5av0Cwv16vlvSvkj4APC8lHXA+L6mS
	 qtip8D98xz7qbqMyWWTX98+IppTAsuvld74NC2dskSFzUJBRBzBHgNLlJy4aHfCU95DWB
	 rkSNX1SO2X7+sXbWKiArd7lyR1832hnx+KgZzJXAMpliC7uQeAh5/+9fjL7eBTq5vEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AIwdvfv8rFnWmQAXW0+2gaUQ37WcaFzgr/rRJaHU/2g=;
	b=yEXO3Feo/naokSkZ5eYP+Q1BgLmBlFrpObmiHM+u2gkkoQQdeAXd5SX2c8PTxRTZ6956
	 MUDr4gqF7ysuIHlq/oNQuEkZ3nvb0W5ciuAqA786s0QbR+uMWNn4y7Q77KT8i0ka7VEYE
	 qx3Z5SwpAmU2BU+L0NUvSF239SnlyEMfVgt0HTAYEvWrnahXVZKGhsaOtOsi6saiPiDQC
	 fSl8RcVuFe5U2WLcjCnAHjPE6mxRTJwj7OJXf8UeQK3fvPtC6Kc728u8vBP781S9aLs+Y
	 QzsHuOlaY7EWKJLQzKQt8HyqcNDDTlKzPP6XOX4Bhq8rVYrC3e03BOa+yUZ4ZoJzcQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocvGGT34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QP2/DHDT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0CB606BF05
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0CB606BF05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocvGGT34;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QP2/DHDT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8Z63H3849692
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AIwdvfv8rFnWmQAXW0+2gaUQ
	37WcaFzgr/rRJaHU/2g=; b=ocvGGT34bn4M4P/HbamvVoCfqY7boa9w9lNhDKJ9
	54A4Dbex1DfOFeIavx/5e/bw7YDfuzfvGoUSuO9EHg5jiFQA4bQ/8tx4QDp/YimO
	fDi1e+65kHQkyYO/yGKepEJSAkfmmveiBIdrAui0fFqk0Di0+qi2IyjLG8cjWyzb
	wLYKfC942YOPUVv/4S55K/Hw/AFv65GDAdhQ4GrU/GaLimfbrXPK3T7rh4y5ENGf
	+RRgPI8Rn+9Ooz2QoJoaeo9H37O54uNVpT9Pl8y3eXQLLxl8hN34do/BO4Jw2VVe
	PAfG6iETnEcDepIahtJovPXFPV3lEOhR/Uo0N5a5yX+eJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwg76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:32:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so345581885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303175; x=1794907975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIwdvfv8rFnWmQAXW0+2gaUQ37WcaFzgr/rRJaHU/2g=;
        b=QP2/DHDTYacyWTjYhaPQQc0EfWB0xG0UlhRUyi4agR+VmrAaWgrwV7DPmiYhu7kUBD
         9LJQ1OhFpdeAST7wCBguUogFxKbpYLXtBrNvI+x0dB06YFx32vcj9bsz3SZ5pqPlxiRl
         HU5I6/LbqoEll8gPMJncL6b+uuUiYOiNFSEW8dRUFVgl1wZ8GX5HP9c4eHXyS4MqaWio
         WUMhVlbZ7nVDbRD7IMn1vO+xlkuXbyXzl9/xrYOa7TdzgKx4zuhYD9LFMbbXdYZeNY1P
         VkcTrdoJL/fAzLb8lcZe149tcqKiF7CneX2qauck5wrtM0RQlFgy3TJhui3L8hdsDOF3
         CAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303175; x=1794907975;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIwdvfv8rFnWmQAXW0+2gaUQ37WcaFzgr/rRJaHU/2g=;
        b=a0d0sVM1klBHWX1dl/qjlWC1YejjVB9Zaevow+fmAS96NJD5WEfa++5IL1Iovab/7b
         E2wqsAqLjoB9AvrjlLQ8Xqrgcn2gr4oGHfKtB5zzlpZqCax+T4RtkdRgTDhpfLvj906f
         xZy9VI1VsxsbjANgXna4kaOCG/KyQPD5bWIYbssTM0wm7Ex9onevOBuw0Q73k52X+CN9
         kQvSKAHMJiGQZi6uDWH1w1o3X7WNMrkvwAejoc8gbcQkXIJpQU6UcS+GWQuQlk6+VFs6
         WR8bEJ6rkgz6JlE4EaNUcXU6A62KATg0h9DZc1v0s0o6k6ilvH8dEQuhq6mnDUTbUqfi
         CcBg==
X-Forwarded-Encrypted: i=1; AL+hErEDR+sPpw81Nx3VGejExDpvi+s3GCbVs2RT7qhqqRHwdMvBuAJn0r9UKbAcwYk5OZ/WrriGsmP31QYUqMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rLdR/tuUcKxtC6EIVcF8axVfJJMUVy+bDAeuhIxUmGHD08iL0
	xth0XTxomE3tEzPAwpiqls/yUWcC7JAnPTFay2UoBF6yAPKYBo82xu9glwpuAsMRYZMbXJNCod+
	1Y2ez1revqPS6QGbZcS7UKSmoGGp9fP/4SQNIHjDLA+BUCUZUuMlp0z1gTBulgprR09Q=
X-Gm-Gg: AYBFou2TMqNcLtlWGM4xekEwcgjwOZDuCL35poDJHzS/5VKBhtOpqC/sLGEwHzNuRD4
	mNyd/E4CohQ7+8DKve0f20KG1+17g2EX7FnRs8annSmtnjHx7TzV6ylSMCbpoi1MNeJ4cl4A6xl
	77HWIKn+ORGy3Th1nY6kLC4G24eehRLn4w3qXbZkDEmcLyCpngCeuP4jUk9Dib2R1cLhL3Q+B0F
	hxP3Kdlaegc3D5jDN5r+s5U/GvyBJgP9Oh5lknwTQiTSmwNC8OyWEHJjiB4PCfGPudz+i9v/p/c
	cKa9Mlam3y8tt33rUdDsVQUMC7KliIyStcjYmihbruVeGcVTa23V1oGLeGxAbeTidee46xQB0tP
	HBR7eQAh/KYjbcuRNJ1zFbGcZ+wui7WS89Ar/vwbgYx1Rq2uM55fapFzBRiwPXoy/
X-Received: by 2002:a05:620a:4546:b0:93f:24e6:403e with SMTP id af79cd13be357-9479f38fd92mr310072785a.54.1794303175025;
        Tue, 10 Nov 2026 01:32:55 -0800 (PST)
X-Received: by 2002:a05:620a:4546:b0:93f:24e6:403e with SMTP id af79cd13be357-9479f38fd92mr310070385a.54.1794303174440;
        Tue, 10 Nov 2026 01:32:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm4018684f8f.23.2026.11.10.01.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:32:53 -0800 (PST)
Date: Tue, 10 Nov 2026 11:32:51 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: socinfo: Add missing PMIC identifiers
Message-ID: <vzx4mrnkwpoimp62ztwjrgud46zxiwzho4mqqvzbpusj3cbk6s@m653kpegiigz>
References: <20261110-topic-socinfo_pmics-v2-1-14811aa728c2@oss.qualcomm.com>
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
In-Reply-To: <20261110-topic-socinfo_pmics-v2-1-14811aa728c2@oss.qualcomm.com>
X-Proofpoint-GUID: AAZ4H5Zt5KZBUoVe1Nj1GrnRHWgBs6lb
X-Proofpoint-ORIG-GUID: AAZ4H5Zt5KZBUoVe1Nj1GrnRHWgBs6lb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX8n1OqGhwEMCY
 F9NikkokYx5WQS3yq3b0RviQ3ALMB9EZ1+9G2nkkeM8svvEdwrH6W8lRUIqs/YL55Ts1jNOlLKd
 V+Ts/PonLikA6fCoSpNXKC5qNiG8xMM=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2e4c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Angy_Qz50ieVqVq4d4cA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX8aYFGylW7FlY
 +mFPcUhnGE1l0FN9G4UsyLORBy8RSMiYA9ITkzR9dEkfDFFzKSLjYxoHH/Jez9Ik/ou/xDv3ofr
 5eWaxtQ6uhG1mdTCkDNDxh8O1YOIhudh5meufbkhkNlsvESdmoikqgnRH9z4iMiv5wgDhG9tkYG
 HvWGFn15Q9KJ3DbzGY2qJddCG0eGeej5qablEfXx+Ic3dB5dDNsEJkEducx9jzDfT5x12Qy1XVp
 sltoL9cTqSFMXwPMIhtGWtc9/4Cuq4VYzZE74eTn1TV42ftambc4Wxuke4vLb2rUi0t1uHVwTDQ
 1cbrHCZbt5z58M2MQw975B1v26z0O5dWD7bpQ2uOQqkLdx2RPInFoI/b0XkZ2mxhosVBmzigREd
 LrwPIZOGhWRNa6YiqLkNocUv15NTSqlCNbwfxNw9XQE2oPqsdij+ppmZ9PjJO7k+my0UIJAxMTI
 fSImZq2tx5p+OCXgXvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

On 26-11-10 08:58:17, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Many indices within pmic_models[] were skipped. Fill out the ones I was
> able to confirm and leave comments for values which to the best of my
> knowledge are reserved.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Nice.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
