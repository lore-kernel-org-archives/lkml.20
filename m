Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100969;
	b=ANr8vCxHlDAYCAIpXn2DPdvuosbwNxnQkG2Im2oanb0KyoO6QhOy/Qk3qbuHbA3OKEMj
	 tdMOAdO20Kpe2kdTNsbwbFqcfzCRMUjmEbDvhHwmTKWLKjuM7l/pqpy3/aB30niEytsmp
	 Cwj482SSGk7iLCWmHMML2ufmTf0k+3TIwoe4HYoqljfMVbTlyAygKD3TWjK7dKdJJGWV6
	 bpGBkt3qb8BXsx81lJw2UVN3+5T/Omp372RO+V9P6u3OgFOKK/3MyvsPspVCRLT+ytHvF
	 URDFx0e1614R8ZnCcJokf+bdnfSQi2GM/xgZRgy+B3QFn0B38KZQHkqqWV1G99/6+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
	b=zCn+CM4mwsDcohoaqI1KBksZDa461gmZjn4pW+ZBW/DtwHCgO7GzUsWT7DVb9mZ2yY1A
	 rrjeajq2t68gCFRNcGPOaD8/oyQmEd4QBB/JuMQdkke99N87AqKG0nfUlZhLqbQvhU0eY
	 mZj1d3xpP9oECb8D5oKhuR+wpE/Z73UOCPBH8gy+2uQXfOtTbszqPwzejIb6qxZNl41r7
	 Kfb6QwEfZ5O5svgH5P36M/1J3d/sKOr5NyGtUZobovJAnhAIXMmsoJgLZjgicvhwTs6IN
	 QG0iR3xcl7+21c5MpZn8QjjZ+hSaHErMw4wApcO0M4dvXcvWKRTfxt8io05si/j3BBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m5Of/TFa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6tmjqWW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB99606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m5Of/TFa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6tmjqWW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAds7w1921592
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=; b=m5Of/TFaHjpV/k/i
	sBMq7iQgK/8z5bGBKhxSYwsasXHfk84q5EBP/I7QjG4mM+PMz3hC2cNklSa8/YsF
	A90UqhCcVvcuLHP10dlzLfsPPrtc448UI/33qk5WGQAXtWxTMyOvvBDBgQdUEBCZ
	mv061gbRpFJQ+ZbH0CSYZfmY9reYEhLM/EJDT60frngj7YmHuNmr095TyLNei7u1
	8GJwVxSngHBESXq1wZDN078KvE2PMczT7NB+I3iiMzZLAIQN1MrSHdqAFPG78GSw
	f9y6ftPApYrrnwtw1xMjmroQu0dth4Hp4UOU5jx/jJ1odyI4PgKm/Vun+1wetoC+
	K+qeLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68nbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:36:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso103422085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100967; x=1793705767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
        b=C6tmjqWW+H2999aoEoJ5EmAh8uz5UY+6SaVBGDDNLza2Hlwa61VGwFq0pXUuwHwyd+
         QuJ7rVyXxM6jlcDcA/eZI1S9pDlYnhKVCKOm3Rq8uMXO73JE6rPK8o/P2gG0bg7uCyqy
         SUvXAswdG9Z0DgN2xqn2IBdfaKI/MW3IMuZElJSKwfMWydIwC90E6f7qHQcTZOMAxnt5
         Ii7Q/01lnIWMbQNKqjCybOH0vA9rlpMYY7rsZ7B75rLJQ09ztaeR2FVv4fTPMoL/W96N
         Ysz9mbBkVyplGd81JFqxqTBlSVNv/UaRSCLZ+xmRU0IWkZKxbI69UlotchpdyAXcvifQ
         J7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100967; x=1793705767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
        b=ahydQBv2IhG3KGS2iZP5yKPXJ7/sDrHcNGkTigM2qq56YAQxqPts7SYUBCmgcq1eWR
         4wx6vOpn3KTnF/UCinT42VZyegryH9cwC5t0ggCkkFstGs0sd/xaWCgQIP2EYWWS359F
         ofHYeYt5q5WaVV6TAXD7wNNJ1buQpLLAmWZykwi0gv6U9Z0U2jKoR+uEHgy0/nHRiudI
         Wb2tT9XZBWuK0M0R5xk0tthirlewGlE+sBFUcV2sotd7gpsur8YTXod9U4YH4iI0Pb/W
         Z0KH+RjflIfoioWTpQ2Ml4tbI/mza8dBFxM2CEtZPZW+6ij/js085AXFxGHHplqo6KvM
         s/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6voRGkLE0i6nsGkEyYVBevXXYLcHN985kmnHQuramRiAO8q0rqNuk67pS9rlMFWPLgIvTSDtcMnQ3vxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5twfvTU+djABBSsKQwrJxJCSUn8izJUtaIKSiXaLEbzMakKKU
	jqTACZaXYGx9GXfH0kkxtX7ThLkE7g0NwzENWfkyeqbISizdaFjHT7pPTA2PSLBbpUIaIoCqSK/
	jcwRY8WwAZrA3eLIGjC7GQgj+b1L/5TXefCp2Ea4naZA0V3JIGChUgkyZJAZeU7NC084=
X-Gm-Gg: AYBFou3MB6Tb3fnOJMsR7+QXYRyS62H5iB/riDi/AFEy8jCKFiY1qQfX+Z5d1Ia/Ush
	5TG4R/wSvHe5Ei1uywyq+dPQxN1gtW2TyuoTRl9YBoGUavXtfOgANQ9uR1u8Yk3C6XpojHqbZLx
	aLlWRvZE6FQfedy87JaIBrL4o68faPpKR5oppVvOpD/EpTTjZokajv27MSCf2gLdNAMNqW7ao/z
	7F5UjRwhSh0IMLFIX2QDW+u+T1M0Qp+9V96HtrVs9Ad+Qo5PNZw6biNxfS+29jSgWg8yduwBukP
	MAk41iJOH4ga7WkFfzxlyFIeAPxzw05N9ugpVpJUXsEEl8DcntqP61QCWOvHoyoTEGN1Ku/VSkM
	TIA/qNOpsmXP9mMzGWd82Yg==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1747738985a.4.1793100966893;
        Tue, 27 Oct 2026 04:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1747735385a.4.1793100966390;
        Tue, 27 Oct 2026 04:36:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm4956195a12.11.2026.10.27.04.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:36:04 -0700 (PDT)
Message-ID: <8d14b8ac-3f7a-43b9-9f7b-c37ad55c413c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:36:03 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08ca7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sVb_W7Lfct-HfA-dzYgRfz9XFXWNnqOu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX54aBuiMMjlaZ
 CC4zxKZ88NeoKxZE/4tnXSMA0HZJ6U6xfkNfn6qJv/pFQ18E5g+sB6mRYeZQUwdwU5/oqZKdq1c
 6SkGYh0ehcfnqz13lOVHTu7VJBi57J8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX2lO/po20/tfY
 UcbqrBmuu8ox7/RG7SkIzbu3dczF+1AhFDybhJSrpCKwhFUCRiwFEfeAeSkOIyLuQ+AAs1IBqag
 TCL188SNIapZM96IkalqRKFcWiXTO1/BwaA47HpOu+BYhKOxfBSVpoSHj1pL51KLAdizkeOP69K
 wBwVRPJGeZ5ExOMyFq2YODWD/dAYrPYe0ChFEeA7YLa+1lCUXpJM9v8f4LP+MarALBJ7Ul9oRmp
 t0MXsVZJL9pM2OrtrkaOAWO0CXgCzRpBkdznINwBzhVFROxveFIBa8HJdyyWWShk3J670uCqR+A
 7H1qqS6PlTx7XqpTOyrQGQjme273KYYo83QXzAFEi4ExpShzJTaO1i04jVoPwbKmH2Y4q/yXFY/
 rQBmutlKYblnkmaLCrsoHHXCa/HuN1h+cgsF24RtCQ+6peXIREApvxWt0pXm4o6NmHpILcjg2sB
 UcVHN2uAEaEKBz39uew==
X-Proofpoint-ORIG-GUID: sVb_W7Lfct-HfA-dzYgRfz9XFXWNnqOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On 10/22/26 1:57 PM, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
