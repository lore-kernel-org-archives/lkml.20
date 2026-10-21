Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586676;
	b=m9Sxg1kLzUFf8c+8vjW8oYsU/2T5gjZqnICpaXX+K+KuDXwD9uROnLjMCnNkfQtoaRmy
	 XmxTorsVbbjlHdgedC9OcXDtPUQw6HrmU32t7HAoSCwqzb+w+6WSIi6i6xbIV84GKrn5g
	 qO67yJWGS5YXoy94krelxv3FiHh7Q6P4s0GNmPGQHbehPiJG8Rei+Pt5aBvEBssWZrb2z
	 ebju9pt2KSklJW1fDc2W18NCZmvHKm6RKALPRXnYgguJeqyVmwKIJuLpfrVe2wq2OqGpo
	 qgv9XxY/Pn8sY83XRZgK6XVMZ+jB/Y0rIjmr00D7CKMlp8A0VFAc60oZGwys4Zfs9dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
	b=JSdDb5WMyPP62MHUalBDHXjNrllO+jX8Sm9M04woR0J2FGgq0SnDMv42Pfd2+dAfkB5n
	 YNgsEHZKsbVxBeErIXFO8y5QDxiOqioeVQndcf6VHV0GFsw5pR7NIhF9Z7Oj9WdL/hRgn
	 5vnPvpPW0gkugawgJvdXb06j9Ueh7iQkbNZbief0FlVEWTG6/7QmoitCsSYTMjkt5MwPo
	 0dvYVcTaW1mq4yJn6NjgKt/l0YsrPbGq3cnTOFCyY0Mhha0czZl4wpF/nEeXatFdWw9lX
	 LimE2UdIpDibU/2eP7jZ0FlpmpKjfMr83eApAzQY16gGh/mO5tsSEA/rIay129tfI6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzTqa85I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67540606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67540606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzTqa85I
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfwER3224737
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=; b=HvFTPjd+5tzhkrlG
	7tXsJCR2/O3mAWZ7h2hp6jn+zv0W6eCR3Vu16YG5UzuVCo/JRDpLLRIKQh0YaEMf
	XnsRkcglg9E3595WkeW3fm4sqG58CHHn3Ocq86Th+SalS0XWHTov8xxxYqDupQBO
	Z37QIg840FeaH1GbhlKM67zscIkfuc+8q0gOxCha91031OHGXcpcdCD1su6oiPn2
	80Bi7guepb7MDwMxrqU78fLUhDsbqn6w3kXrYF2OhFApvfmPtKSiV2KFIiCobVWo
	RwOxobMGx1bXOHN7v3TuB3USZGqgKfUCF3oMRNgD8hTbcbggp2zGoeTVlc4FEMTR
	BzV7TQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy791rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:44:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso19431385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586669; x=1793191469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=bzTqa85IVoO2wio+sWS6v/bQ9I7MsqyGxpIDdpWXpgkfzzgA5fAh++81ELSrL1GcuX
         14c7EQMGfHlYKUdr2dpLr3PQeHZjja9OM1XdfL2nn1M22GLYQrQQ1QfIyXigaZVAx36z
         sgjBwK9EHXN+Eh9PGsu/Lb6yny3326jSm7pAI5o2dX8CizrewWUIZGkR2p1qEz2MK1gi
         DPA7MgFQhvF10Xh6sAUqJh6E6SV9KfCQ7IApvs8Rc+k2CWQucx92N+AGHB96o5Vl7F6A
         uSTjmNMxNxmfj2iXYanuI87+3USg2akwBiVKVxZQ+U+6P9V2SEqVGmCH+8L/PSftZXbN
         qRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586669; x=1793191469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=n2AUkTYzWvhBOPuZfEnhLzU+jf4FSNCxmKscAv0ssV/IbdOcQTJ1ijgnnEt9Jzu405
         NzcWdzr0LubGQURkEzBv5vR+E7EEM/Tg7ORRpsFArCW4sdDVF0uQmeYrQo2lsrQmaSUO
         8utxB49WpD1GKTdrONBdjamUV4O2GImEPlTEU5H97jF6j3a5I83bh6rZZK1/qTDocZFv
         JjRD2XJ7cJLLB1DmaVrshNZifJg6HFKqwJl0dn6VXIy/mmajUNJRAXnu+xSPAI3iVn19
         16ajkF9rhozJO9UuDcO+Mtq2rzkLSNiZ9KsWYZnNEmG0i+wVD9UxAoN/prKJkra0oNgG
         vu7g==
X-Forwarded-Encrypted: i=1; AKwUvBzc2yTTFfiNJoeBIdXSdmr5/3g22N5eztq3ezKJM1lPGGx9IrCvSImW1xhKl+Jz/qRqO1v+Y9ONL8yeap0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtSEgAVRPXZIUUAVkgcWLEDMChPwfr0ecbp2IMHMP24kFoWCj3
	Zi0aQSORuHWcICI+yWZJ2hQ0/3S7VewnMmySJ344cBlL18HYMgfQ4GeKl50HqVN/eQbK5CEwz26
	701A2jivKDZFMts+WKdnrXctBu/fGwaXr+rlxmSFjIyjyuUu1LGJIRDfnXkViJn1+Liw=
X-Gm-Gg: AYBFou3tqJz1Izy3tTYyTpPssyWjtMkXHD1tPoQXO+j5Yvqgv8KW4/FsmUC7tJ8DWz0
	K4pXd4N8CyZK0qB+du00YfeT5KzaFnsCkKutAjEIT67uZXdIWrFnw+BdhQuZ4zxjnKtf7MG5UGC
	1OCGL7qoysxN2GXXrWdRah9zmYF1avNGLp3Wlk0yV5eIbW//wOSm6pLteKjmlD07XOmgH/nLgrO
	9KvRj1jweRNmYCUtMasBEeA+4my1f0WTrgZu9lhbk6Sk/4HNG/ljUfTEyPA1wfKEvp8PdsWcCi2
	tFuX0uJMVvu7S1D81PGOK6KGpzMYi7WPv8QBXsmvsXN40mEGzpwDrIdIZqTh7V1Fh47ztZtS0U4
	dI4SkiSzGDnUIOCko4oa40Q==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466829585a.2.1792586669536;
        Wed, 21 Oct 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466824785a.2.1792586668992;
        Wed, 21 Oct 2026 05:44:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78660sm72328066b.17.2026.10.21.05.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:44:27 -0700 (PDT)
Message-ID: <bd062ae7-74c2-486e-9413-15ca8c943055@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:44:25 +0200
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1791110510.git.me@andrei-z.com>
 <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MV9sYoPYcguWsOPklh20q0kIciYe2T-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX05j9mhoFkIOS
 ETYGa1NidYj1TqQ4e+UMuLjZ5R3k9D9aOZYxOvGnIMvrESLyz2ejzjJfdOKDLREy9kSyuY2yMKU
 XFs2gxel/SbzsnAc/clTLS5/20y4UddLOCW+v0vPU038BRCO5pj7zJmS8yRkwqHtVuA0MgjTyW8
 rltOpcGRqGgaXOOJwI1dIEBI4yw69Z3zu9TFIu+pbg+nw2Oys1GjR28v3B6RRVkihAuv/On7mXk
 Aq/hxLND0nN0G4KcE+9+bBvQPOOGzkAGpDi3Pdte1LWGL6rtF2jtJVqNWpJHOj6Wh0LV+K3umq9
 hedumAfkIM7g8/Hqt+XbKI/j4S2D87ZXWBaoytccN4Rw0CkVrs9X15208D1ePzz6psivDdK1odk
 TLhb3XA9CtZBWll6K2Vrc6zJ9lbXxK78OWT+mzXIH1P/Fj2IsbIzCQ1aeAbGLFhK2+gYDv07loX
 ryXt/I7zEnHAFIPI5cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfXwy4b+Akq2Wa3
 WMtyyL34X7/JHCu89UMaFfIW5geFVK9s1+S6wpHfC1lfkJyikkBMBdUaqx6PjKENkv2KV+tj5IV
 tsl7DS/Kd6ezgZjWiO+fttNviRPK8h4=
X-Proofpoint-ORIG-GUID: MV9sYoPYcguWsOPklh20q0kIciYe2T-7
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8b3ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TO4f5atleJ8-af2fB8MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050

On 10/4/26 1:10 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:

[...]

> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&button_pins>;
> +		pinctrl-names = "default";
> +
> +		button-reset {
> +			label = "reset";

Normally we do sentence case here, i.e. "Reset"

> +			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +		};
> +	};
> +};
> +
> +&blsp1_i2c3 {
> +	pinctrl-0 = <&i2c_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a \n before 'status', file-wide for consistency

[...]

> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;

No wake-gpios?


> +
> +	wifi@0,0 {
> +		compatible = "pci17cb,1104";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-5G";

Does the same calibration work for both radios?

[...]

> +&prng {
> +	status = "okay";
> +};

Please add a preceding patch to enable it in the SoC DTSI, this should
never really need to be disabled

Konrad
