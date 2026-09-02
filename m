Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAB4A43EB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366289; cv=none; b=fYOnWxejq92VYFrxjCJuMx1tdpKRdQzpGLpj8/Yk2yS8rs4bjKMlSq4OzlkTrS6fuZPwSjp0NGOztUCikBHfpGsVF/urRpVLUamKCx8gPKb5G4FxmZeh7XFXZj14L9igAaupjCTDwFB18QK+lI1Axb36MqLM6seDeor4jUO7Oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366289; c=relaxed/simple;
	bh=94m/u68a/RZASpND+pjgfMX8ay3ZB6y2ddThk+0ad3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQO3zQzR0pPoNT5a8kbpnukKWqRAoxyDhW/uPnYrHM4oP2rCd1z87YsjRzS59t8wUOu0o0uocg2vSiHx62U/n6GsL8Etvke/ZAE3c3Q6sgBDMnusAGXmb7WiCtsaVuD8NnNdF7Bd7DqoqgWeEMdV3puZ4kL964RH6e5g3Tbyqns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmHN/oiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhI2AyxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmHN/oiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhI2AyxK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZFYD2670661
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 16:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=; b=GmHN/oiHM1xjEf+k
	QpbNXMORp7H6+LqmWT1YF1cyAWssb9ajawmNKVygvsRHcqegXWa8SBwfDwgjCWQI
	hA74CLC/MDV5O3VIOrFVvoWZpMmmr/XQPXyff2TtZa8CpJBFua1roUsJjyD2PgJZ
	K7FILWcewKR8MynIvcbWXGMgIyKcfQZ5e65F39uesvYSYeJi9xbPqWSeU8vp4bvc
	PgvxzC32GUZGRj66j410V3waODLqaFz/xDefEaZztLy5FNkF6vj5tBf2/LXR7TEO
	vSYfTOeNAnhnYrF8hhwDOJ5UqV0oE6vPMq3FtB+750V0hNyvlHxruZ015yunkhpt
	5EudPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2wdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:24:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso29544885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366286; x=1788971086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=;
        b=RhI2AyxKt/1wlVBgWVqhXD3WCEja0oOUTYWtdFkurpODfFiVuWmvx4TGtcr7EZdDFT
         ZEzwOLK2EOyFJKRf9AkmI8vUerjSNxG1qvC2IJgVq/zX8/c0uwptWHACIQDpyXq+v7EC
         QLOhT+sXqOLWzX+pH2DxG3LBvk3KwSpJdHe16OGrvLgVkIg8QwI0ypUEF24mGejktZ77
         trYI0RuZ+r2G6suQUdPTosJn+nwt8wvEmIwxs7kinjDzGMx7FVsAohF19On0kGGYKoYM
         L9ee4juE1w4PW/WJRlgaNERS5beblhsLkts8yYKqIDpH2cQmdvPqK5GeugV0yCTYAMhL
         olqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366286; x=1788971086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=;
        b=dyO0TgRq+4fn5CX/1ob/Y3HcWTO0JUS2wY7HaA1NI/PH6LIKDOeQGUCWXA7exYYKnO
         F/CuWLKlyQIt2vn+svaH6Yqux33YdDHE4Et/g+6p95emVRUtnmKmfX0K3t8qcyJFzD5P
         mmWHFN2vv+woEJQlXxmbHAfGhkwd5kfnQu+itrZztyTaxQ4cBbHQQGtothjXhx/P984q
         PksMqio8uDWrO9lekoody4hAemgWFB71lF1G+gOgcOPjzbVCTNuhaSnMudxamqhNFuOv
         lLUbtCGJ8YXhbJZ9mR8UGYvyzqrufo/vnPjkOwxk/a15c/41T+NPduV5/z+XTGraUKJv
         0pwA==
X-Forwarded-Encrypted: i=1; AHgh+RoX1VdaEkQmmIokILDmTp+ZTJH95NwjYNAa1CudYN3NIDuDHxG6ihlX4ZV3oIkoNDneB7/5+OJRrYzt4Zk=@vger.kernel.org
X-Gm-Message-State: AFuF++nbvcgrQ0I46l5IR3qzl1hWQh+wYhKkFlh34B2ozX4yEnTLR9gP
	1bsXux72l4R/jBihOSe0BZl6em/iH3S7tlmFbaETVU+a6oEuIog2eXgMIAvnJhAHVIRHaE/txnQ
	O/rzswhpvV/mSa+SH3mTyYvpZbmOgU7MOtbxmY4aXPSuEwrhoASViKSglEf7EFm7CDmg=
X-Gm-Gg: AR+sD12HL0nbaO1/1aN7tNABpX+M85jkNLF7DFk6bb3mMdXCKRcdoKMRMZ4Le/HWbyi
	JnMvbDSxoMkJ441scxSEAzw0KKrci4kgD9FjjIlym1OKxd+mV9dFWpziE0PPiUVY1t+2Y9QKe+H
	kdjIKJjFYNH0rwEL7w7rM0PR8ASx7xlMVv10NivmoFcbJ3tEb5vt2Pfx5x3E6SS3i7utZjTjhNj
	adpdqLpBeI5wmBujBspBxNcHV3fk6+Y47sP2UX4en9W4Hdd33b8BKW4oHUskLpE9F1kYOQlpNT7
	ZZZrxdj+xsZ0BnKMxJHZ0dpYaaSGpN35CozL2E7B8JUe2o9sPnJIdPLMOhO4dvv2VG0vQ6DDvGo
	fABWfY8MR3F8tyyhtvv62Ow==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr400249985a.1.1788366286491;
        Wed, 02 Sep 2026 09:24:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr400244785a.1.1788366285891;
        Wed, 02 Sep 2026 09:24:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03f4d39sm163008266b.47.2026.09.02.09.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:24:45 -0700 (PDT)
Message-ID: <364becf5-521f-43a3-91fb-011e10bec998@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
 <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
 <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kRRLn6EvP1-ArZYb5Y_xEt_EoNOVkmFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfXz5yF66brYwlS
 NOHrnwaPNZds8goGST1YgzvC4yxcCeFdPaJAuoarAoJW+k7f0FUneuIZ/L5RzUhTAsWAELmgBH3
 9R2+z83UU4MSIULCNgVGldB0eQN8yiv/bN+FfGTIST+QO+vcYDwQG5lUiM/jN6gLJ2lAnbYTfq7
 fcgL5I+STnQtoQ4u13zD93+rgJK/WbNhtZiBOOmSVyfo9Dp59vv1gfqxl+WxGGmyOE0GwRmko+z
 R8TDtUe1koVT5z5yQcw2xX8oMWbffi0cWvSHlq4GZUuVdPu7dhJxw7dGoS5CcO3NSvgmnUBQgG4
 RVbFzPJWz5fe2dUkHLhFqg8LfLpDlKxjVrPq0W7uHqPHKjaI55/hl3fk99yoBHKXd/EJv/oGL12
 5jYqUBD4HTJmcBOuKKxIu6m/KCIwHI4s7vt+Tha3TkdRjJeO6HPR4jtM6FIMmsIx7194Ft4kgWM
 3UePeAYbzU1VrFCMIcA==
X-Proofpoint-GUID: kRRLn6EvP1-ArZYb5Y_xEt_EoNOVkmFO
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a984dcf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEYaC59VNbqAa3wHJpAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX7kss5u2k+eYt
 /XlakGlEexVOMR/ISiAeni6qzF+NpzzOCPKC8TeQSl3uN/kxvrs1lHqwq/kimfOZlJhdIV5lTTu
 DtV+5TnPuNVXsX3viKBXPVY6UMP/P6I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020144

On 8/31/26 5:51 PM, Dale Whinham wrote:
> On Mon, 31 Aug 2026 at 08:13, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> Let's order the pin nodes by their gpio number
>>
>> otherwise:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> (Resending as plain text, apologies)
> 
> Thank you Konrad - how about the gpio-keys { } section, should we
> re-order them to:
> 
> key-vol-up   { pm8550 6 }
> key-vol-down { pm8850 8 }
> switch-lid   { tlmm 2 }

Generally if there's not a better criterion, nodes are supposed to be
ordered by their unit address (the number after '@' - none here) or
their name

via

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

Konrad
