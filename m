Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56234EA371
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561658; cv=none; b=cqvoRXFakv5LKrXuqNgLDyYDEjCDltcue9lB9snQjL/XRpYG64/+mVOuK4cMIhzGG1cs68FAYX7hgg6tz4gL/KzzHuDOSiqCUgosJdFzjPVINycLdW0tmp76XFFesLvpv4HuG+KrJuZ1BCM8IvDIxwJmYi5BigLt9yb7pM0KSEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561658; c=relaxed/simple;
	bh=ZEcUcshear5LPgt8z8TEQgEtqWzLXrp6HEezPRLIBuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfDIEvEvcEYwHTBdB0Y5PNeQmaL4U08+2a1jqy4fXTPNGkNHfbqUz1T4B7GFo3FQthS9rD4yGSUuheNWZz5kzYfJd43GlDZ29lhle51EikECWM56Mg4LgI/0tdiwMGAqZ6UvlXEL0U4F/ShPciuy6EPaItEaSFHH6L93byIK89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZ/TR7gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPd8cpRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZ/TR7gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPd8cpRH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93Afc2658311
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=; b=RZ/TR7gl3V8/2b4K
	B89G+uiqpZFq3UIORmHAX33uLUsXXjjVni6syzLCOBk287w6Q+tivWOz4QyBNmIp
	YkR+LmDrN9DibPMb77FNxalS/7ixBu20i+RRyb/CHu7S0tTq1q0Zk5AW20qMEsTE
	WdVBXqrHN+5qi7MDOh1wl3/vLoqG6o9GnV3q9svVMkViNtS07OQplK2magHrdsGZ
	OpJlFEx5w/0VTqbEDaMe2pFWaCXD+7Ms3lNogxWO3nPE1KkN3EOwSICbUPU7zYHu
	wdpXGXzpcvXFyaRQCCLDDZEcPOSZDWaopqy8r9Gj7NX3XlakRIYhxT5FR4ub0lPB
	MJDgdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujsq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:27:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938fd633df7so97973685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561648; x=1790166448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=;
        b=fPd8cpRHvQndCsX8ORekkMFZGhvBYuCVn2SwFSWjivVEPaDF6hulVoLKYvoP6v110A
         fu6u6lInskMKjzkxdu7KpvczrKGwpVxepTLuA8weunxkgI8IuhnkS4RMot4fY2L5TfP9
         OQwy+8RjA53X3IzUBEd1jAwpL6x866Nfw5xNmxz43nGVCnIfgrExXdrxs1UHCHoQCydG
         LABDtdclW522TQEmDN2m7/CEZ3jquvayqHvYKXL7u67JjYp4i85Jqa6Kx/fwIekKLbsL
         nePsEPtLKYh7tmCmhdlCOEvZHMrZpCskJnWUfD8OryizrxtcYU+CwGwMs6S9I2zHqlFK
         K2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561648; x=1790166448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=;
        b=AHezYBM2+byD9S89usGpSTWuDqscw5SNfm5DjlpQTeTTKBiMKeUyhxtNEt2/62Kne5
         cGbzYAH/XfMJkNNc4shn4dvSxlpPj1aKv8vkb8VRQLzDZh1Px33tIEUAkG1Ua+LeNX7o
         4F3FP74Y6IqVWiGp1OSiSjCdE6VWTA81f7zvL8jND2KZlpgXGhCO1yS2JI9nrB5J1D6h
         XI97lwoMcEXJiWEXZLxpaIoa1IND+dVAepteKYtqCwSuqltrhQLLS0WTpsKXmOGAMnFd
         LNerD/D/pzslYMrtGLJ5XTuh+sh3PUcAK9cfc28tBqw2Hc5CcLaWnnVJXnSL0YtAlkd2
         TzNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFPDj+BBFmWAg9n+0dB9/DsxzuyDiQMEYwpG8cw0lSpSOGu/CqXw/ShliPpXks1h//ADhZx2zDd1bJZKk=@vger.kernel.org
X-Gm-Message-State: AFuF++npFj3a9wAUm0H80GW6d8qUGcDWPboU2YYiuKNf6Vz6ERuqFkQQ
	2p8vON6SwcOyE1cuCxXvUPPAn6J8xxRcdr0zlPOSG4thSlyjmwNTcZUEteR7YF0PcjNLgS54QM0
	LfCqpsIwZwR5NDWXz2Jr28407GrOY/rT3NMaWYXKQ4TAHgoiWum3+0x5TR99Pj5sDiz0=
X-Gm-Gg: AYBFou307NqByTSnyfEtsB1rzSgmm3oPLzl9JrxEpaH+YnOH9dLdBqsoGGBmI30jdh0
	eRhDa+0pq5y0Sgd/DyhwoeivRPF4gwylT4RR2r35aTVPGfAv3afPKSoW8Vct3hM6ekHjn3DRgcM
	6K+N6fkhGjXDA12oiopuLbXQiuWD31nPnG2hAVPhgtrRgEl1S8thtAVXfICjkHToyJD9f8b+87Y
	dW2BSumRuLW83psAmVGekT0sxmeS7tVemYSuW7Sr1w4Ea7qkZUinAVOsiY8mDjDOJrMyVjTAeW2
	Gga5AZFAR9abFEj63eOwSIivP3EMV+nJaiu0aWWkMOr+hOjkOb9JVPRXTmg39YAKtMQBTmd7Qc/
	mEnYItttbRWHnuVJEhACayw==
X-Received: by 2002:a05:620a:25c6:b0:939:48e9:51a1 with SMTP id af79cd13be357-93bb7738f0dmr300221685a.2.1789561647746;
        Wed, 16 Sep 2026 05:27:27 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:939:48e9:51a1 with SMTP id af79cd13be357-93bb7738f0dmr300217285a.2.1789561647302;
        Wed, 16 Sep 2026 05:27:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de082ac7sm124957166b.7.2026.09.16.05.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:27:26 -0700 (PDT)
Message-ID: <260ee81a-e900-4f84-a757-04747f990e21@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX29FuN43ZQ4l7
 jVXXe41euS0+s7pJ4txtTVbFq2HRZimGczTPkrjTKh0wxi9V2dk33g/UzxX5HyRxYX70WO5wM9s
 R00nKSPpF9sMAPt1RlQAT2/4YAk7eTl0sglJghZ/yiBz3U0BvCod0iaUubziPSEfgqqyv4B7oLA
 K4iCM90dMQXqwFDyOv+Iss93EIp7ClJheGt1g5v1WrifVoO4ztWbgEioI36rojM+/03Bo7G/KdA
 H0cHiK/0N3XDG68afa56d4B7nh1RRFDlRUFuQf+oIWtq4IM8Qi9cit8PJqM++tv+JO3JUihlDTS
 HoSDUISlxY+HrvXwCOoSP0PX8ohSsdPDAGT3SC4YtI5Rh8pqqC7WphueY34YnYBVFvxWLQRWznR
 iRewVQCwuxIVfR19OUwtXFCHDKTzEZI1Pmk+3RuUF+PeRk6SOc7n2Le3fociKI048viHFbzHRF1
 wRla6ehb2bgpO/5uAgQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa8b30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0ETrVkJFHnd_pK7WGEcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX5CtvPmUgkCun
 Z4WZg5wEGy5VSUskj1+w3ZvsqHAxYryl2vxJN2R5OloqYclI4R9geZUbyARPBw4pXIogVez+eMe
 Ki0loqVmQt/zeJf51VFwPLPF1vralaA=
X-Proofpoint-GUID: 28l1YLh-tRFECJOaF6Wtf1SGNO2Sk539
X-Proofpoint-ORIG-GUID: 28l1YLh-tRFECJOaF6Wtf1SGNO2Sk539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160165

On 9/16/26 12:01 PM, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
