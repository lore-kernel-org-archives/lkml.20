Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660200;
	b=UaZ8bTGakTl3bmMJZehI4P/W7u9XrMfObvVGrT5VqnPSoFg7udwalSASmxxCNu8tGQYq
	 8hYs6kgp8yyyIDuobc+4NzFe2kmzd8wgJnDGIFsy5TTGyP7Y7kl7w0ignm4JRKjNelimi
	 xzVFmm1gd5x1xwL1a+ZjS+03ZDDNC7/n9NA3IDwrmZZoLnwFimUPtjRjCoY1fvuiiITLJ
	 Whd5b8dwJLFjsQ/RAqLt9kLJVa4TyHV4la07P1cLY5Tm8aJjQmgODZdY/puUXz3+ynkxs
	 MVK+EZzLlLjHW1IEcXsvrMcN5qWS23o83YWOlXr7sZVfsLUPu4vtS5wfvtfcToln0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
	b=p97tkryuUuPqPu3warlFlvTDhpaaX7cRKhkz7YNaG/qycrzf6J4wziciY7kahsXiXKhs
	 qEDqlXWGdVwtUNp9teZ/cqtztFwija4UUrw+dcF/aMmXRW2XqQmZqcGZHi97AlorZUMFa
	 lq2YR/k4yRevZrRPybv8bdL8Gi8PUGdhDWmvWpxLD90wsxQ4sm/EKdY3lklF4dA9u1XZ+
	 Cfu91mbilK3W0EzoABSKmeXTweWPzdhOccI4TNFyzlL4aUm9pibzClR83ZuOsv+cOvvAm
	 hwgawX9DZYWPQ0DKMLA3PHOh+TtCMQOYIMxKmVCnQGG/50ZA7i9oFYTbYy32TRsRMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cokJDPuq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RJCm/ytu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E49606A332
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E49606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cokJDPuq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJCm/ytu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xv3B1560116
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=; b=cokJDPuqF+Vy0B54
	oofPLXV1SNCp2af/gPNdNs16tsHZSPlzLzk5vR7WPz6H9IFjTpTID3B+LBfPvt01
	YB+iCNeeQYoywYV1hO08RgGendxYh698aDt3sXVqlOZhfcKx+TclNwxLk4GRY38L
	4bOvopEKuswG00Gm3ayQ8MIp8/si5626dbbV+dASRCQrPzPegiyKymUXKeiYb9wI
	hiN0SPAoojQo8BZk0tAsl3YVsMWMxxIRIxbHiC8vJci80SYPC9g7UKQ5N79gz73b
	qQdR3SIOS0oL4W7zbueaR9ArbM06lBh5dMEerFjQlyWMHzJQNwtcAVLa82L29A0I
	/jc80Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahn74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso28886085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660198; x=1793264998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
        b=RJCm/ytuCwgsjLgToibkZVvgT5eseFiQ9DtpCotzXIWhu0av5GyvP9yTE+ggQ7XL0D
         cX4pLiABHInNMJ3s1g/clL8ZfttxKURkTVoobzFieCeG9n9jNGd3tkweWSJ15ozCpcrV
         EaVZ/e+a8Zl+UWtg+ZXquAbNAHv+mF06f/x2LclgHHtIircb2oraiy2B2QTRjjkf0VNu
         KDgV2/Mdo5eVkMpa8fZuQLfImv0EeD/SWS6H8RxqApDR5EJIGgvLaGKy/EjA+dN8/oXx
         T3dGOZJyDHHJKdlznnaYn0YrxO9HCQrtt0rkdVJ4u538ulwVMs9WQ/xnel4EUOuOkI61
         7yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660198; x=1793264998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
        b=RCGZpZj4pezzme1Qr5qgum1SIARLAkRYqP3IBhMKPXnoVhxX7KSRPvphDWYILyPvtr
         SjZ5TmHTAYlISE85A530cGbXB4ASgjRNjqLWbhA50qajt92SpOl2z2PgpxHVYHJcowpm
         9c7qbIGh2285c57Lq9CRYIIStamcrM5gQiRTfzvMZrCusoC35Mk4Efq/NJH3Z+3DaJie
         5CnFSQglxkxzDs5Z2crnMqABZdmSmri40GwLzT/Y4hgHqPZw6ca9DbhMq2zdjUfJAHLv
         H4c4vGK8TJVnL077+XEGsroAa6a682SnwTNraBN976dHYeEYC4nUeP7urvZEbEZax9jM
         zm9w==
X-Forwarded-Encrypted: i=1; AKwUvBxyD/TwFyyFOUY7YPfe9AgPSL2HTI20bfqVWVzg2g7SNJbfc3SRfTGCEZjtgut2Vp5vUQYaD+7TFc3eIGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKBeG0fqwBt4IkH1Pw8vd+hpBdnRGZZQAirPwDV3LmxIfhxB0j
	4FmXjRytXsMFBIRN2ycNYIsWHGqbDX44OW3Y8yR0y/a1aLj7pLWCCxQOEBTLFk/cR+GosHS0AmP
	jFpFhtgPIp4eQOI4pcigtpOulOfUdcdvOPFvqp1VfYO/3DkXdqfcIoXFt8Lsv9docKNo=
X-Gm-Gg: AYBFou1XXLVhWQCQjIXNWYHWv2fy5QCK5058Klh19cYGitHBOWjBhFszYAR5+posPtL
	kkOYWJ5Tp9gKfEXhVgjgdrsNF9Fo4gaiSP4V05MDvdJYE2RY1e75u9sMpNbEMRCvSe1dOVZRiUH
	L2lUO0v6LoMsrHYM4EjsQq6dp3Y8SoTS0mOe5rOkhRu5rM+f+vCpv9R5+N6y0p0C5WnejBOlCOr
	MLFSIYdClYGvNGiWQ+jQ9OvGovPMaImivEr4scskvNR381wQWbRX7eu8Alx3xoqEpQPDHSKPwnL
	IgoJKSqHcrEQ+IakJYLCBaLMkXNnUKntAe0RTiMzjGnUumqVvo8SxGk7CidmT8Y5UuPhHvs0igX
	bew+YgISuZl5womauGTchOQ==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985407785a.3.1792660198038;
        Thu, 22 Oct 2026 02:09:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985403385a.3.1792660197581;
        Thu, 22 Oct 2026 02:09:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ccabsm82839466b.33.2026.10.22.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:09:56 -0700 (PDT)
Message-ID: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:09:53 +0200
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX5mBK/cqGGDxt
 tMYHeL/3cqtfkPbVktYfPkiQiDwW1eZ1S/ub66T42wPly18NBHLuN/Xkbg6zbjB3oY/4nqNzfHa
 BYiOpGvBTIG6auyL+DjmExrwRjSqQB0qzloe1x73xkX/2QSPuOF/NiVUgs47mis9MZIOr3v1xTT
 FBc6sVSUj5qlp6siHX18gHI1UhlxVS2aTAz0OcriUhpCywbKfCR1o9FpxdmLBFGVTe1tVdm02zP
 U+ZtBJEa6QMs/Hx9eOy4KgaEhcjwRz5GqwaeWTQfLQwqlJElE5m9QaxNyDOHW9qGF5gVQdHP8NE
 8fk2ZGgqDRKKJpVYdvWZMoGb8euWIt+J4JP7YDjFGOKxNdRiZwA9yu+fRaY82Mx9zK1Qj4bbSzt
 iSgHHFRWluvMq/pmJEz3PtIv8RhpB9Az+1gDw54Ri/Q0oGv64DV94UVPnCghtH1aIxwPZdiG5YO
 9E6lThOBKLPND5156qg==
X-Proofpoint-GUID: Juf-4_0tWqnE33g61HkMH_BUsyoyarkd
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d2e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pjWewQ9WiOT9jlYbxO0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Juf-4_0tWqnE33g61HkMH_BUsyoyarkd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9umtm8//56Vk
 0Xrq6lFPB8c4grTucfSaQxqeqR8s4PQ9hJGBrzl2pc7f76m+yPo4Yh/VEtpDwCQldCHlmL1jk9C
 Qs+LOCamdE/TwyaGaAF6dCQ7KzW0KXA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/2/26 12:47 PM, Gaurav Kohli wrote:
> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> 
> kodiak-based SoCs are binned at manufacturing time, with the bin
> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
> now reads these and feeds the resulting bin to the thermal core, which
> selects per-bin trip temperatures.
> 
> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
> the passive mitigation trip points from a fixed 95C to per-bin values
> (95C for bin 0x1, 105C for bin 0x2) using the new
> temperature-bin/thermal-hw-bin properties.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 347815e5983e..f3bb9cd8f393 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>  				reg = <0x1e9 0x2>;
>  				bits = <5 8>;
>  			};
> +			jtag_id: jtag-id@180 {
> +				reg = <0x180 0x4>;
> +				/* bits = <offset width>: 20 bits at offset 0 */
> +				bits = <0 20>;
> +			};
> +			feat_id: feat-id@180 {
> +				reg = <0x180 0x4>;
> +				/* bits = <offset width>: 8 bits at offset 20 */
> +				bits = <20 8>;
> +			};

Couple nits: please keep a \n between each subnode


[...]

>  				cpu0_alert1: trip-point1 {
> -					temperature = <95000>;
> +					temperature-bin = <95000 105000>;

Please do <foo>, <bar> instead of <foo bar>

Konrad
