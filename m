Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483698;
	b=UCD065LXsm46mfHD/GXdKhy3LnUQ5JoYhQXAfDbhlGZGO7UFAhWFMQQf8hG1rOa8/6VR
	 MaEVUdeNtx1Eboq8tMkZWzfWhGWTrgyjgTeMPcgpmtPNEA84zrwdQ8sGaUT9+abDsW1Sf
	 tGrem8uOyuHXABpYOJAjQ5fS2nB2dB3Yr0nI9oFuKA+Gwy9wyuq2Hxkhqqy2mG9YkrwEF
	 J6emlUrfPGb5rdPsvZPNnfmOKyPxV2xfSg+FL3j/0IMFjKaVBui1UAqFHRvONdg39FFu7
	 wdHshr1YOq3MWdZrXXxfF/knYlInikfxJmcGuQZbtHmAHm6iXrvqmcCHQXTaRnbdWqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
	b=3FBDGozQh1ggseGu5zqwkVNjURu6VtuIjmdrnuKXS/Pgf9NymY+Zg/Ylp+3s9NxBO76d
	 vSumu8LOgSvSVcRNBA4D+YBsCtwrdzqLjd1TPm+96WlUfic6YvHsWD+NLAD9k2FqmeBIE
	 Z6SR6Q5CP3dqxeraXAi/Zex12RX5/yWutGO+y5LcYHHHe2+xbylepeKUntV20CqoknBVG
	 TQHdHLRINCVMSfW5bc5ohRn1HXDMSHVYgLeQljIMxHCDKpVYd8wGozrdg3h6+Bq7vr8o+
	 ot6W51/cvFOp7bVbBxS1m656q1LuefU6NSehCfEQwSLL79dsT3KtQMOAkXbY+SrNbMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aerPNKxw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VwoaBQYg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD87606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aerPNKxw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VwoaBQYg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tXKM620620
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=; b=aerPNKxw7wfJFNAV
	P3+wHI8AApAAaTn2kvTr+XjMwXuoiqR/q7BSsxWyH14IzW6s+TMKZ3r36sGdqYmC
	8cYgSiGmhDjgzrmbJ0zViuG1KO6mWlEI8uesD1ljK5CQZ6JqaW1PvrLWbyXsErGy
	GMkYwxlINToMyV44lO3TuhtgCBPZ4pcsiT225fh5ID+idm4J0NRtWRtO9oBcU8Fr
	8GgXSBQihHC55w+aSZIhd1BywnacLPnBX2vuCasZ+6zR83EzqTlzrLKemx0cLhGG
	r9TRXUCETf95XI0AgdQIGeoYbDqmlCFbkVhW5Zc4lKIwHwe88FrEsq4zzkSJ8SFn
	q/21oQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsg3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:08:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so43857785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483691; x=1793088491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
        b=VwoaBQYg8Q1FQ10w3mo8q2PgWg0tnJqatXLPx4DF9j0Ch4HCe5KCIhQ8EfTBGkKOcg
         Ljg4/ISt8iC2pfLcIAj9CvpaA5R/Q1VLTHxgSseUHKwElyZg9cZw6PHaO6OhLzfVeJAE
         yKnX0Z1dkEW/MQvATkNjoHT4eMla6GoGQ6cS22X2ZaR3Vu4rNfOy36dG0wI6gkU0av/N
         8+BMFVgnVUe52xz8Yqlch1UcpX3EzKVGoW/7WxgTF09/tBWuyNOOd1WALop4CM8BT6L6
         HAyy9jGNni+8DBlUmgzf4AXvOEEirROLfynoCdeofnyYsN5fId0o1rleUsHBwHOcQ1nm
         8mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483691; x=1793088491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
        b=pxCTpQc45X0C5Wb/w5TfwrtJI8fiP7EPX8HLWUt1xPBAXYPn47JFJKVzhfQCe2hATK
         4Rh9oxhP9S3RUQdaJ3HPH6oCvVpjhPEtx1tVmpY4GNzhh8dPfuZqMXPPq2ib4UYj6DiR
         VSZCsR/95lkkqqg04AJ5aA7lOcWeciwMeJdfAsCVSqHnbnG8YKteGMzrUSZrojfIt8vP
         c/BQP3eK1c/3XcPCYuzdBIa1ElImT2Dl7leNEydrTBKIJoFYqsVQ0TanD5LEJlBoND2y
         vg+vReXbwyNXBmMVnVjGghRYaWa3uN+HAxZvpM+6JtUFt4baU+8aTxYK9VEYWnShTEoJ
         JqAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwlOyuta+7CaB0SSp838gKVN7mw6J6WQj3250UjXE4/2xBQ3q4g+SPV+wuiT0hkzYjNIKdvNGuoc/J7Co=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsclYCzEnKP86mTNgFq6L8jytu3Wg2ip1CazfgYnUT3GMhOSYv
	OvwqrJnae4inxhWGAF7Iu+XqMmHDpPhTY7hmepXjHt1w4f3TqA61xB0YU05g8W1v7IgjDdpTl0J
	rD+e1a/svi7/+1KiBmFi4j5t+vOHCLXUc9zXOkOzOXlzMn7yIbvbyaucrns1YXmTQyC4=
X-Gm-Gg: AYBFou1PHPCXufUYXmylgAFpbrZjsnn3wNzjzAHiUTkQuhZbIfy7eC6zUSlxSFgj4hQ
	+qLQ9bC5GOUf6RmzlwshkKcFLNhvrK/E2Jxd5DR+EyyYj85VcrNMtjr8MwrguM9wz8MtzOHhWO3
	NOGVdKzY8RSeghOz9MKa2JFLi64vT/D+9Kg/6PqGDxU/zH+GDVvL1WJUqobd9VaTZ4nmUKgiZvW
	LI0Lt4aBGUkiVwn95x+4kc1gPg3aN4y+3xfj+1W3LwSdqS/6okLyiuB2+NsbWj3w1IEFEOpKgQF
	ODc4lR/uXLsIeAoZcADz8LWpEM7yYCcP08QyA9vzCBcZoAQ1O/EjWOx+g5J2Vf6mQcNs1Ztbl5g
	u1sprk5xY7rTOeRbbphbSCg==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1910500685a.0.1792483691113;
        Tue, 20 Oct 2026 01:08:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1910498485a.0.1792483690600;
        Tue, 20 Oct 2026 01:08:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3af8e926fsm3811663a12.0.2026.10.20.01.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:08:08 -0700 (PDT)
Message-ID: <639549d7-9e63-41d1-961d-edf38f6e5e76@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:08:05 +0200
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
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: add
 notification led
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX5lfDvOX74Nw5
 +nnNWOws4T6kiX5dO+xAeB5q5RZhoS43HGkQvK2nqoCVMAdVxr8fBusdx+zUp+zR0+Kekxvp+ab
 TbxkaHMOTlg/4WkYzierB+jgi3CmwNs=
X-Proofpoint-GUID: 1EQqS8tf_Ear2hotW47IpnUNYJ_pumhy
X-Proofpoint-ORIG-GUID: 1EQqS8tf_Ear2hotW47IpnUNYJ_pumhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX1qEZcgPWj1G9
 sl/IgryH4BP3pTy2KyshCjogUqSpTdujrW267QxdSey22ywMEIV0TDJSDcmtrwzCixIVvJ+sGb7
 zfgqvqinuevzn7uYRpxaTkuVJtn57K55UAWvI/L+vzIoSf68xkW/xN8sq6pwp4XIlDG8ykKmcNI
 dOn5kAeqj8xikQ+S5FphptTM1FiwUSNKPQ5uS34/kPYaeUH2mreOrb2P5E2HXNXcXQy01eQNPmj
 ovGug3/ku/HCj5A2GUStWfdokIr+04IAWvss06zTBXTDDjRQfTVAD5O0B6vhobYdq/1ZWWbOSl+
 d6PU1FhhLwDNx/Q85KHctIwjJsT3BFfK9uTOiSF1+1TNQWM6qV5np8zDHlyDqS1qEKDlkkN8I7P
 Ge+Egr2ASgAc2hnvoHuQgAFX/HmG14cMuFBHbbZ1nPBbmbU2chEIYAsGqKD7tMi59M41lBAWlVS
 ftsOPf9GlDAPOTsGh6g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7216b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=C96mxyFFfAi5t3y68eUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Add the aw2013 led-controller node for controlling the notification LED.

But it's already present!

[...]

> +&blsp1_i2c2 {
> +	aw2013: led-controller@45 {
> +		compatible = "awinic,aw2013";
> +		reg = <0x45>;
> +		vcc-supply = <&pm8937_l10>;
> +		vio-supply = <&pm8937_l5>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "disabled";
> +	};

This feels a little sloppy. Either disabling it where necessary
(presumably a small subset) or moving the definition to the places
that use it (if *that* is a smaller subset) sounds cleaner

Konrad
