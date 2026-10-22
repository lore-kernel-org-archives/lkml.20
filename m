Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637556;
	b=O++5hpQKEA0r7Xd74YSxJkp4QphPtImpnOkBrP+L6GCKXHVei8IEy6v9MWB8I8szB8if
	 7reJB6E1WHpkY/bh8qDM4NF2LJFMdo2YsvC7RembyDWT1vXNtgPvyhcLO5/M9bWl9QekA
	 NNs95UBm583lhaGDF/WW/W4qOLQ8eGKGQaev4JzSuXpC6ZiU9MCICzBjBx9BEzTk0HDCW
	 ya+0yUjlj4hstIyFg1un5tNM4mcpNnvqALVsdvJCaUsRFE6K3PZkbVObsg1iRB5z5d4c8
	 OdZBl7iLA9NDC9902glw5WlZizTtzYtKaiRkH1KcMHIS86B0lFtwpAnbudKc65yWD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
	b=noxpuoWm0OsQw+WaY3oujiCmGOY1tBMQNEZ3ggekTsrHix1DM5bb03CQwPBoAgnnjc/X
	 0WfSjmPDiGtSKDm1wDQYLnrtVe6dMgaW58mq5a03BTXB8ZYeYocqAyEAuUIlwac4wALx1
	 f6TQUa1P97oNlP4NIY0YpHk2fO6dj8y3hyh/OZqtJ58z/ULjlbVrNuxy/wRkW9cY/ugO0
	 /COxcodheWZ5mUfu1deeK09yswCXsOBEQZej7LTzAk1/PnuKRH0TJVUcdWuOoQG+NVhpd
	 p+mfqFb0cvQZvsD5+zfu/BV/aUd+mKNpFVg7u75h9kh5fI+/+OmbdWacHP0eumnZInw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3KslQfo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijlfmOWZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4959606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4959606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3KslQfo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijlfmOWZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M23pT32945823
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=; b=k3KslQfokLDwp3Uh
	M2ghKmiRaCWGXWwVVbF3171UCszgjCjlTY0vowF5YxiThjqY3g8YrSjOhS2TLUmh
	tkA5l9Jvx665feuuKW7ulrw8XszqJgqCCPex57j6G9/QMBa0bVlignmCB7uj4S/s
	C+q77C8qQ63c81OD0D8ArlNf+D2kzPKB9T+7dVug3tlboz1JRT9LhbR01wI26kVY
	NRACKVC3xICyE1pD0vNi0GAcrQdGnHloQyP39SFTmRUKpTHryNVMWoradEAwhCgW
	qrH7FwIqoZpSRFMxSND4y68oYxNBJJ+ifTjI0tNeHR1rAj+L6PobGmEQd/62m0Ux
	REjCTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c8ac8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:52:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso1424490a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637553; x=1793242353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
        b=ijlfmOWZ0rwduIpE9l6SWhqeeRKlWRp+XmkaZyHRCm7e2/SehBAlosjKPvWMAS5n/f
         EdXxlbU2i/zSxRE0zpp48JhzxIdUOt+b6fEC6vnx2tEMhsfvEvLS5Xhy4IFwhp5Uc9HB
         WLq+HCrwUxJy6S7BnMPSCeRSEsbXdaycOnrUAvxKZy/j7ll6csGYFbZyagRjBQcQw9ER
         YVdY9XMhu5CaCRqAAh0QEHdPHe4Jtp/l3Dwp9ZFIM0QRJLssqR1c5Z/WtyIUsmN8yqzV
         T+V1yxG3EHfv2HydshelC8Dr40NhWJgJzkcb31dr5mIsPL0rp1Vt8T7pu3DCn3Xl30+/
         v1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637553; x=1793242353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
        b=dLeNVwYCWaUdHSt/o7HI+c6SjVbI9GYnqBXmAGz5AzRhKnyzeMJsdYu308LMm7mvgv
         NF+I3+CchHpFt3VR5gY7N2EQC9vdB/3rAkCXgDikOJlF1uttCoENy2fv18Aq4KMFM2cd
         wruGNKTWhHxjjFnFnMvyT7ZG7FLx7BYNoVEXs2w7vtiRjONvaKI0IqrgvEpUZSV/wrqN
         0G8JbupiOshe8ZQXcVrPhuHzhVa6ZBlPVLCTEwgcOCWILwc2GF4SXIQbQoMyGd2dHNBj
         +7rk4Mx9rXGVdP4X/zE3t3pj+SA87d29VclxbewZQSQmWQVhCIDnceotXbdhaVW5Z283
         VxGA==
X-Forwarded-Encrypted: i=1; AKwUvBwYjGb9/N7VO8ngQwl/tQSBxq3uTUeub42wl8J4dGaINdzpyo3cPDXK+izdO8jpjcCexaQCyZ1pz+jbJlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEYyElqK8fy1wFVMH5sfv1QaJ7jM45cEaM1u2krpxWGX9XjYcy
	aWCcGdnQYnGl0jkH7OFJ22czflM0tObAKuauXjiPcR8yriUL0bU5KfEy6afF7c5CcfAbHKk7NCy
	KXYYGHmH+fp2uyQgYUQEXTdQfq3fYxV500cA+IrbzD9LocxhOKb//1P4ZqHgHrl6P76U=
X-Gm-Gg: AYBFou0t/YPRBAyEg9msEHTBV/Dc5mGB5t3WNT+AqFMIeCvmBcASZQo2I0i2wsBBPsB
	M2w9Q9o4QdszEcGVOVQgV/uJz14UZto17Hq+NHPWUsm1TgY6ICNdumwAPsVhxcTxL9pr1yVDQF/
	3eftqFAzOw4x13qrM5j+rLTd1FumWktNMJL5Uq/73wKRQdvLW6kdk90gKFy4o++rjcdwOdssypd
	Q7POh47/OKb6otck2xInREJGaX6ILvUqvrmK2xRXSRFYm+T9dNjqpiPyVYb9CiTW3z/bEQz5zKq
	w4vHHmJBYJ/TXgXHPDFX0ntDAZt2SeOQllrfhfdIt7yDEZ1R15rBmeKFQGT60tnbRAKMP66+zD/
	hbbbVsAN6m7hzGEcux94Hd2gfMykBQldclvKcaZ/3cBQBbaCnudYbeLHAj8tV
X-Received: by 2002:a17:90b:2e42:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ad86afbdeemr2985644a91.2.1792637552615;
        Wed, 21 Oct 2026 19:52:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2e42:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ad86afbdeemr2985630a91.2.1792637552158;
        Wed, 21 Oct 2026 19:52:32 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890c56sm2048165a91.2.2026.10.21.19.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:52:31 -0700 (PDT)
Message-ID: <a661cd2c-debd-4444-ac38-531df07637d1@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:52:25 +0800
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX+zD4K04gkmg6
 Jzwc2r/qAdzYktPGNhuppnu+qyyhhR5tHFo+6ieNxp0f+IzqP9PV8tYEVAloxjjYjMs10sbSYGN
 PFw6Yy8lu2uIDYx7OdhkcrbzBG1D8F0=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad97a71 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-Nk8vmC4l4_uGId51r4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: sInXQC9e02ECanoeqhBKzj6Yd2jnm-t-
X-Proofpoint-ORIG-GUID: sInXQC9e02ECanoeqhBKzj6Yd2jnm-t-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX6AsH7FZe61Zd
 yPRQ5c/SUm0pSTSpb5oyvxOp2uu1VZqzJav4nv0bz/PqWIjbULLOFQnpXTwgfJcGvR/1VfZI3F2
 TCQSmo9GGF+lIPINoSMI+BEyBRiPMukSoPFWsGZE8qGs3ZKnryecN++Ie9ZuoeCkD9mhPlTHy8j
 aF7PHRqrY19aGgwoyxKgSW+nLWg2mYh0wkGun1I3hwRwJG5J+G7CjeGRwo+nf8d0Joa2bZVLRk7
 CWrMam4PXts3YtV8XGKlFheVyFC0gvVKOhru5WXU8ZVrW8z8rFksuEtNu3X8RmvpFZS5LWC39yE
 BCT82JYZb5Jy+mum1weTKz21m7P4LA2WS/vwfNrDNpRLN3KjBy9YjpvrawmCaUEIIxemjUQEJBO
 WMtv6Os92IWyTeTW/Z2q4WPtsWB0nZb6GdVMDZYJu8fsKIeealhg0aU7NIuxundiXhR1/SDtK+j
 Jgp7ENSyHja+O5ElfhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220011

On 10/21/2026 10:02 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
>>
>> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
>> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
>> lane mode on a rework camera module.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&camss_csiphy2_in_port {
>> +	camss_csiphy2_inep: endpoint {
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&csiphy2_out_ep>;
>> +	};
>> +};
> 
> Please define the endpoint in the SoC DTSI like the glymur submission:
> 
> https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345
> 
> [...]
> 
> 
>> +&csiphy2_in_port {
>> +	csiphy2_in_ep: endpoint {
>> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +		clock-lanes = <0>;
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&s5kjn5_out_ep>;
>> +	};
>> +};
>> +
>> +&csiphy2_out_port {
>> +	csiphy2_out_ep: endpoint {
>> +		remote-endpoint = <&camss_csiphy2_inep>;
>> +	};
>> +};
> 
> likewise for these two
> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Ack

---
Best Regards,
Hangxiang
