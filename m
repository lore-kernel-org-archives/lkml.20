Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B33418A2D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376116; cv=none; b=jd28KIMIBNXjAfJTSNr6w1qUcRHVrLKS2oqHNLk0BDFtUQkkot8HDexWNA1A3NI7+YhRVSxW6oY7HxJP/IL6OfJKD8clMtuGMJ/f4GkYrXgaL+VEkfl4kkjcnKGSEMyNGAEwUng09AAMIK9rS/mrMw7yg49mYJTnDn9wakpJIRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376116; c=relaxed/simple;
	bh=mBwpmAlf8UOj7gLdgmuGOkNJK6FZ3SWwkbTLju9999M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzP4Z/3gXiIC4fPjD45le1YfVMVOa7vprVYMz7G0Bt12ASjUbMYS2wGpvqhXHA4G9cgj0NVC8VlQgL1lG3R5Yq0Yq7PZLV5B+aYtDKseCdWCI5rWFig3tpQd+cVRhttRPihkL5tB2mVNWeMcTTLs7X5LAhqN/o6S7voxPkJY9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Su2TlkVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOpKL87O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Su2TlkVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOpKL87O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0VI3901329
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=; b=Su2TlkVnunmo+PnW
	f0uDr/AI3EsrQIubw6Ud0xLUJ3BiwHJXAFO/T19rlUCukaNRCPEDNmWs2cvJwKdK
	62QDFHQ2KLTV7NqTY2CWX/meXZp3SPnCIDpAD4sZFewVH5hlvNZol2mJCo1BQhRr
	PeY6pvydp7k6B9lPQivYtZGMeRWmFHf2VOgKvNexgixOWkn+Rc4D4GrR4QGtJ171
	KOH05/6QX9PGtRUZj4wfwZI0Pj+afYjte1YHtYWLSZS3GJjw84x3gmOTzHFCm4Wz
	sByZMKsHhDrgtBcnowzxJigu9nzYPB8rX9UtHtt/cGyKfVztr9bK5gqzZDGHIHMK
	GpYQpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5tdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:55:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so49628585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376109; x=1789980909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=;
        b=DOpKL87OtoMCIRbPV1XqjJ/zTBM6UQ7ZwK2wOdmdKUCqPkOuGvz3YIkvyQFa4THBVe
         1bA9EWUqX5fkwyA4kSHyYH1Tyv4t9pl8LtP/Hs0euvgA5YzWv5VerkYiQH41zBAI8byw
         +ZQCQECCfP4xloPw9K8tuAarXMhmixQioIMiRyFWaYTivQOKZX35Yh4XuyPcJ8Evt4nr
         oPW75iJXK2+caccCkkKll/Xwqr4nh4xTjqwhd9BaMZvMWXv1SReIZDfHQm1qVho+rBbp
         zDUEZRLeTGLUwL+o1pcLQD2+K9vPS+2q6bPgsvrXw4JnyteWLkmPtp28r22VpxOF57+s
         vWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376109; x=1789980909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=;
        b=p5W8XJlo5fi/RNF4b/w3HM0dih8jsbbgOhvnB9diEdsVwrL99zDXU6EzRo6wqdhWFM
         dBNQTOtojEQ88Qnn0yqgq98iqBogTJHe1r9e6Qbl0G+TEg2mt5v08b3b3diljyd1g3Pi
         dloRiWfVbzVJ2b4yXyyQE1raWEckUaPR7oyDG7RQSxfvI2f2NfQ9Tqn28u2TYHNbZAh0
         7A3dWdmsW1vCdWk1AshNTbRLLT4ff6Z+igvy1qsvRgVBtKzfjmV5HxOCi0JtyMl6VHtr
         D9E6lKk46nEeK30B1lFidzi/NWq3L07AxImzwcqL927x5eGzWVMM9LYBMGQYECJLI9cx
         a8uA==
X-Forwarded-Encrypted: i=1; AKwUvBzlaei/VxPun0m3eAiHUGGdmQNrMbyiQQY/Qg/wf/Joiq1N5hnZvkOsMvzF7znf4KBmIW8a0hQeqnRBwWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lA7At7I3+SQjNG705GKGB6fAxIcFVeZjEFnC2wALFmLNe0N3Vq
	05Dtd4G1OgJTanFhZakJY/8Xp//wq9dfa8+0ZpTVvedLy/vE6YIAxaMWiKWNnwi4hnFwMKvv4Om
	sV3tG5yOJ2tdeyw2bSJE6McxexqybBfLrSzQ4NtX6Ew2gNlc4ClzrMsc8yXV/HG1Prjs=
X-Gm-Gg: AYBFou0dx2QaRJU1IuE1B135elXnITj7SqRRVLe4Y264xIwbJijmwMH9yNdoATm22Zk
	4Ik6cEnesmHZFcOO7uxlevxglljTzKgPLL8iwAkNLa900K3hBhLyrZs+oPCuLM9Vb2jQlNoZlvB
	OcUew5rS945n5hn93I0dRkFAhF4RtfbHJfXtIj7BfpxwTk7b292QwOhdLH9uMdD+eQk84ldC4SU
	CSGv15BkN3cCc5lB+9agOeeDoqmOz6CDE2XmlvAjVeTnCrZx1PvKCoAUztnTP86gv6L+InOAlOw
	IWzBLW0Zk34UR8pl3LYwUzmwo4VUBVHqJrunx4Q7US8qgkUeHHxYqY4aeoPfkoTfg5msOBCuPDz
	dS+cbK4WALU0bzhi7v3fylw==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr168691385a.4.1789376109057;
        Mon, 14 Sep 2026 01:55:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr168689685a.4.1789376108674;
        Mon, 14 Sep 2026 01:55:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5914700sm3691780a12.12.2026.09.14.01.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:55:07 -0700 (PDT)
Message-ID: <b97e6ed3-a5bd-4934-b2e1-4838a65c798d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX8o8Khl7Wi1Oj
 TVFYP6TgAjH3OiImArwU2LUXYnbHFtMQcEAqHJrLIJpDGNuQQem36mAGzIbAMnSvmaUF3j7ry+B
 WTTFVCPKYzBgYNQ3uaykbZf8RTl7Ek0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX0ZG2QTv0tzWO
 HWAdt9nSvdhrMg8tDMBgayucgNI7OceX/anwXT6uIeP2x6xptk/W/I1ixXzP3+EsjNJ5L99xLRf
 qXDuZS8IlTreiULKQo4AZEXA4cPjpo4ovla8LFXcBm8pPO2YCleyjzAL23GKYxvpXG9ACHF9dwp
 hIk7UdNECL+scvi1zseqy4ygpU7bnsEtWNIh2X1mg8lpSqwEOmFIZDETyTwWzBpNTavWATPJwar
 esQN/v/VmprZZQVLaliI3+NXPFr+U12gAdZbDu+34PaxnAnIXbj+YGBUBMfoBH9wLNpmpNTZVfu
 VnGtGy/nJSeMYSAXLYovLF9EMyaxjSd31oZb6c8GfO3o3RhL5XpAkiZHrGpEja67jeob261ZnpW
 e05jValGeXqxstN4dDOD8WOVCu5jtEiCYTIO88GyC2sxanQLh+T0Sa5xfXZP2mJAH5IDLsL8vww
 UrTrrcY5DEJPBWDwPqA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7b66e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VOFYJ2K-I5rkPCBY1ycA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2f0zUETHAGFaFp1znV2mYyhebwStPa2L
X-Proofpoint-GUID: 2f0zUETHAGFaFp1znV2mYyhebwStPa2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140126

On 9/11/26 4:20 PM, Shawn Guo wrote:
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.

[...]

> +	vreg_per_3p3: regulator-per-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_per_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};

Can this one be non-always-on?

> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb2_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Could this be wired up to a (presumably) usb-a-connector?

Konrad
