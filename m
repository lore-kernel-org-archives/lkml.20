Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363889;
	b=lh+EvITNtiSthfoJ9oNvLNIpE7g1KgQA7jKgkN/SLf5xgtb4yULTkRtrM8wrHaLs/WE1
	 2j2TOREeDGDNzGVMB7ptd+uUa0WqRQc9WF3Cm1+19UmOsbSzFa+2zGrsBF11xlXc0XnNI
	 lkpG/ddJJY5nGP1JfDgqcF1vmbIer+ErkvGNgqaQTHQ5Sb+y/Z+RJ6/yvBiUfqwWw4gTT
	 baZ/Gu14zQmPT786Cn08XHO8yemodTW+VXTr0Was0ZycnPNo57jVE0fvBMZ6QsFdupaAQ
	 qDHZLOZNTpd0RNYLA2vv+8Z61tvu3j/fKS0Hkv3mbHqXU2A5m2dG1o9LTaQkZ0k79Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uGFCaWu/cIHZQz9+4uZRDLPq18hdGdfph6gHjcLracQ=;
	b=J+hFzRdch2s+twjV4VDPpdmJ1RhDxdPg8ufK5SEcVvVyyKUJAYHdJYkpA61xurVoyrFM
	 S5wlrpAw+104Kr/lusZ6iShuZ7OJtQmLS5rhRPHtJEboSM0uJfb+N5gML91aPneGnpQIj
	 NJcZ0IuSK55MhAFfKjNGW113RzNvc9ibpaQhA0G0G18gPF5T38PqgaRGtwxnIVrFvq8xM
	 SE41nM8ep4TfxQ4kicSIU8B7tI2E3PqeT+4598Vd7tj0MBOnSerkExGQboD+22ilcGveR
	 zAIUxpXROUwKjtH8U3WsPARb7VYKjyhSknuzuK81eUZs0EYZGi36en6A6Eg3c0OqzKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+isHm1r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGVcHtIO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6360606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6360606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+isHm1r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGVcHtIO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxA74143797
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGFCaWu/cIHZQz9+4uZRDLPq
	18hdGdfph6gHjcLracQ=; b=E+isHm1rIDJ2fbNNGR0Ajn9pTSvXxKdU/gtUi0Su
	j5Q5AR9/RTKhv21IrAqiwAr4m26FWltJ9yzums6i0dSH2jI0LktuDbDhekXcyhrX
	HujMkt5U5Ifj5Tni+lXwJ21KNzWR3sGfV+gYgjsm/ZBSKRW5EICteShk4qS9GwyU
	EVLY+BIAnSxfcCLs24Q8K6eEd+bIPHpLDuM2N4ePBuKdiOAUJiyjkesZPVQbEKo9
	GJgaeM7P/X8PMx+2F8N3CZ3bH7T+4A/DUiqYACN23j0LTcNkrz930v4YALe61hsV
	sHs1RqXUQiyUohOdUCbAOUmh+zm0cikjXye7JlrO3a27kA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7530vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:38:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc59bfe25aso17872137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363886; x=1793968686; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uGFCaWu/cIHZQz9+4uZRDLPq18hdGdfph6gHjcLracQ=;
        b=jGVcHtIOQETRokLjHIWZr3+yKlSngpnyC5p5Qf3lS7nqqOSpn6dIZzY64sOGotSZvS
         CGsaTqv/EYGSlHYK/pY52v3hfV7NCKGxpJMjvjdEKyKe73yTjEaN/txKRxx3ojfdF1Pq
         Clt4vlouXWcOYcx+7+/nO8WkD+LFpkPxUkCW6q24jo44nXGJUR+dFv3vtfQopFKg/JQ7
         pnJSTDVAApS98UjZBocowMKzt1viO23gkKc5jupxySfABTUW9mX3Oq3qsPvaLxiryMVK
         Az9HKgW432gcc0Gco1NWDDcKz4qq0YO11ikVNX6dJwUBwWuMdB6LR17UO9ikf/IkfDHv
         gzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363886; x=1793968686;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGFCaWu/cIHZQz9+4uZRDLPq18hdGdfph6gHjcLracQ=;
        b=YchAiUGeb+JwI4u03V+U3s/eJmXgVoIl0kouDvIV6e1gwd93gJdMX0YBM+NN8HzuuP
         2y6B0IikJoGcr8YH82eRx9puFeA8SujnVPLw3tiSjUgyXl6VnFq0HAP+hc2A/4SI5W2U
         7HEmNaaDFtVfgaJSoOLMhBOiQI671dvKcKSzYtfDLuKWfvrk8x30DmZ0IMKxSJobnOfN
         oT2PJPAqU0SFU4bWNbfxEV25sOyS2EjaS3PsaXWWYOctsZKPXBmy/lsp+n+7mv5BNI1o
         UfALCrH8fWEl66EvUBSnAOVOCNw3BWlHCBbVmHpSVi5etD7iqELJSZRKXm4cfprbqlWz
         jo4Q==
X-Forwarded-Encrypted: i=1; AKwUvByTU44ZLmRXYwWr/YQnbr1SKPtN3Vag3/ZCopnjIC20tTCcc5cVIVb1hgoQ1OudefmbHWYiGp7UvY2NFRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXdnDbOi2EgSSRL8YjZL32QoL/Jpr3fw8b4pev1ap0qvw3EESJ
	SNpQOLuzImoLadK4xe70Mh4nEvN8CTpo7iLiUKm5WBiJXV3ht89v1dX2UDrtPUaSdutUDXKUL/a
	qykc9o8CKJbZUYAMe/UEaa0nIvjCYsBs30ZfC+duJZNvgupBTy7vLEcU1rbW61K7PsCiZEV2bPt
	Q=
X-Gm-Gg: AYBFou2R+m3HvERUhxZO6llHnJM9BYVMLM6kxihk4qJMY7CtXHTVkH1WSwGnL/HA2er
	LjdV2c/aTfP3uejaAHJFr1AEOUPZ3NNuFqtQ77KrEMjXw1Q7pn0E9rSMAngaVDZmYEOSrZ2tIlN
	IAKa/85Uy8f9HnRntNND55Iid/WxrhXoHVciUbDl1cVYUhDrsBPPMfA9+GhPsvg8lY+XlMArrU6
	/jTIbuuAFPaWZYMmwGMNYxACrsOP4yxBMywzZJAzFaRK5uXqtYMDODWRHWlu/0lzPg9WHOtsYQO
	8N9URnV2FMMkkEhFMNZGc7H1B55LvqSwiISYzhaVeCQ6TavX+/C69LjRuN+DY+zoPElt7Rai3gL
	H0NFoF+s9HA1SKyxwjb4z/zFgAgyjNLQtHpreBKcWCSGt50OlGGCcP2RqjP5J6BXNazZS4Ro=
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr871445137.1.1793363886079;
        Fri, 30 Oct 2026 05:38:06 -0700 (PDT)
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr871435137.1.1793363885566;
        Fri, 30 Oct 2026 05:38:05 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b01b53sm580389a12.15.2026.10.30.05.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:38:03 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------50GfGCps3rCUy0MrQIbZw5d3"
Message-ID: <310594f7-fd4f-480c-a2f9-844e3da73b0a@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:38:00 +0100
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
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
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
 <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
 <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
 <991e6b64-8741-4669-9bbf-e31eed788f42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <991e6b64-8741-4669-9bbf-e31eed788f42@oss.qualcomm.com>
X-Proofpoint-GUID: WMkkpsCmtH256bApvV6sW1rfDBLsGTSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX1lReFTaDsbfh
 VJXV9YkjMqxwSnf6e64io27GyHbQinsaj/akbw3dUaFIEpMwaj0FAg8WcSwkED0Pfp44Xd0f5qZ
 RfpcQGxGr2Ic1fNA4xmywtK8orPXCWGoE+ASUkfYxA5wac5PytHUz2X7k3smUBAawiLKubuEXYE
 R6y/X2WPyc5CF2WD82SvymWjcviPdsihmbp2LRZzn+7gmMSPgJazOkIhZjnPo57/HTDjklXFvJc
 mZQ76K+iEp4zs8fjjCfqVrGHQVJO17CsPOV4XeXrtE1ypgQ6tVzbr9YiqeVThm3iUpbo5jotmUh
 Wz5H9q63j5zrcjJNb42PNMlvgoOR9FpoIrouglBbYJQaUt+y5CWxeCGyQ5TnsqkwQUrF62ZZKVC
 wcLEd7D9Myz3WeyVbp3mVKmVl6Sa/mEQxMzzLzljP8EEF+972hNfhVx3K6qPNUyd9KmIu3Hy8iD
 H4VvQfO6mdKa3IbrIpw==
X-Proofpoint-ORIG-GUID: WMkkpsCmtH256bApvV6sW1rfDBLsGTSO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfXzJIa41r2YZ8w
 ttGv5g8wyhplfSKSG0+M0QPXL7QoPkjHewyt90hy9YnYEcQ4rU9+WXCkyDkVxPPPGPAX4iSis6m
 3ah7Y2SR1W1sMJhyK4MjWuUC/adAPfs=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae48faf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=EUspDBNiAAAA:8 a=WEAxI33MgoOtBf6C8u8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DWDMQnGJAQtB516vxjgA:9 a=B2y7HmGcmWMA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

This is a multi-part message in MIME format.
--------------50GfGCps3rCUy0MrQIbZw5d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/26 1:59 PM, Gaurav Kohli wrote:
> 
> 
> On 10/26/2026 5:21 PM, Konrad Dybcio wrote:
>> On 10/23/26 12:01 PM, Gaurav Kohli wrote:
>>>
>>>
>>> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>>>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>>>
>>>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>>>> trip points by hardware version; wire tsens up to feed it.
>>>>
>>>> [...]
>>>>
>>>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>>>> +    const u32 hw_bin_std = 0x1;
>>>>> +    const u32 hw_bin_elevated = 0x2;
>>>>> +
>>>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>>>> +    const u32 tsens_chip_id0 = 0x197;
>>>>> +    const u32 tsens_chip_id1 = 0x198;
>>>>> +    const u32 tsens_chip_id2 = 0x20e;
>>>>> +    const u32 tsens_chip_id3 = 0x20f;
>>>>> +    const u8 tsens_feat_id2 = 0x2;
>>>>> +    const u8 tsens_feat_id3 = 0x3;
>>>>> +    const u8 tsens_feat_id4 = 0x4;
>>>>
>>>> Isn't that (also) exposed over SMEM?
>>>
>>> Thanks Konrad, for review.
>>>
>>> SMEM has related socinfo data, but there is no exported helper for the
>>> exact fields needed here, such as feat-id, which is also used as the bin
>>> value.
>>
>> Is that different to qcom_smem_get_feature_code()?
> 
> Thanks for review.
> I am checking internally and will update with the exact difference from
> feat-id. My understanding is that qcom_smem_get_feature_code() returns
> the SMEM socinfo feature_code, while this code needs the QFPROM feat-id
> field from the JTAG ID fuse word.

I traced down some code, only managed to find the sources for newer
SoCs. The JTAG ID is present in socinfo->raw_id. I have a Kodiak
(QCM6490) phone on my desk - the JTAG_ID part of the fuse reads as
0x197 and the socinfo data reads the same. I attached a patch for you.

The feature ID is not exposed via SMEM to the best of my knowledge so
it needs to stay as a fuse.

Konrad

> For this series, would prefer to keep the fuse-based path. The same
> binding is also used by the generic i-temp fuse bit for Hamoa/future
> targets, while the jtag-id/feat-id decoding remains only the
> Kodiak/QCM6490-specific callback. Please let me know if you are fine with this approach.
>>
>>> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
>>> thermal-bin mapping needs both values. Other/future targets are expected
>>> to use only the generic i-temp fuse bit, like Hamoa.
>>
>> So there are variants of kodiak that ""incorrectly"" set the feat_id?
> 
> No, Kodiak is not incorrectly setting it.
--------------50GfGCps3rCUy0MrQIbZw5d3
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-soc-qcom-socinfo-Export-JTAG-ID.patch"
Content-Disposition: attachment;
 filename="0001-soc-qcom-socinfo-Export-JTAG-ID.patch"
Content-Transfer-Encoding: base64

RnJvbSBiZThiYmExZTU4ZGMxNjkwNzk1NjdhNmQ1MDZiYTBmNDAxMGIyOWU1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMTM6MjI6NDYgKzAxMDAK
U3ViamVjdDogW1BBVENIXSBzb2M6IHFjb206IHNvY2luZm86IEV4cG9ydCBKVEFHIElECgpU
aGUgSlRBRyAoInJhdyIpIElEIG9mIHRoZSBTb0MgaXMgZGlmZmVyZW50IGZyb20gdGhlICJz
b2NpbmZvIElEIi4gU29tZQpjb25zdW1lcnMgbmVlZCB0byBjb25zdW1lIHRoZSBmb3JtZXIu
IEV4cG9ydCBpdCBpbiBkZWJ1Z2ZzIGFuZCB2aWEgYQpnZXR0ZXIuCgpTaWduZWQtb2ZmLWJ5
OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+Ci0tLQog
ZHJpdmVycy9zb2MvcWNvbS9zbWVtLmMgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL3NvYy9xY29tL3NvY2luZm8uYyAgICB8ICA2ICsrKysrLQogaW5jbHVk
ZS9saW51eC9zb2MvcWNvbS9zbWVtLmggfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9x
Y29tL3NtZW0uYyBiL2RyaXZlcnMvc29jL3Fjb20vc21lbS5jCmluZGV4IGI1ZTdiZDhjMTUx
Mi4uNjY1OWYxOTk2YjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvYy9xY29tL3NtZW0uYwor
KysgYi9kcml2ZXJzL3NvYy9xY29tL3NtZW0uYwpAQCAtODcwLDYgKzg3MCwyOCBAQCBpbnQg
cWNvbV9zbWVtX2dldF9mZWF0dXJlX2NvZGUodTMyICpjb2RlKQogfQogRVhQT1JUX1NZTUJP
TF9HUEwocWNvbV9zbWVtX2dldF9mZWF0dXJlX2NvZGUpOwogCisvKioKKyAqIHFjb21fc21l
bV9nZXRfanRhZ19pZCgpIC0gcmV0dXJuIHRoZSBKVEFHL3JhdyBJRAorICogQGlkOglPbiBz
dWNjZXNzLCB3ZSByZXR1cm4gdGhlIFNvQyBKVEFHIGhlcmUuCisgKgorICogTG9vayB1cCB0
aGUgSlRBRyBJRCBmcm9tIEhXL1NXIGJ1aWxkIElEIGFuZCByZXR1cm4gaXQuCisgKgorICog
UmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm5vIG9uIGZhaWx1cmUuCisgKi8K
K2ludCBxY29tX3NtZW1fZ2V0X2p0YWdfaWQodTMyICppZCkKK3sKKwlzdHJ1Y3Qgc29jaW5m
byAqaW5mbzsKKworCWluZm8gPSBxY29tX3NtZW1fZ2V0KFFDT01fU01FTV9IT1NUX0FOWSwg
U01FTV9IV19TV19CVUlMRF9JRCwgTlVMTCk7CisJaWYgKElTX0VSUihpbmZvKSkKKwkJcmV0
dXJuIFBUUl9FUlIoaW5mbyk7CisKKwkqaWQgPSBfX2xlMzJfdG9fY3B1KGluZm8tPnJhd19p
ZCk7CisKKwlyZXR1cm4gMDsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKHFjb21fc21lbV9nZXRf
anRhZ19pZCk7CisKIHN0YXRpYyBpbnQgcWNvbV9zbWVtX2dldF9zYmxfdmVyc2lvbihzdHJ1
Y3QgcWNvbV9zbWVtICpzbWVtKQogewogCXN0cnVjdCBzbWVtX2hlYWRlciAqaGVhZGVyOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcWNvbS9zb2NpbmZvLmMgYi9kcml2ZXJzL3NvYy9x
Y29tL3NvY2luZm8uYwppbmRleCAzOGVmYzVkYjdmYTguLmFlYWM3MTZmNjM5YSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zb2MvcWNvbS9zb2NpbmZvLmMKKysrIGIvZHJpdmVycy9zb2MvcWNv
bS9zb2NpbmZvLmMKQEAgLTIxMSw2ICsyMTEsNyBAQCBzdHJ1Y3Qgc29jaW5mb19wYXJhbXMg
ewogCXUzMiBjaGlwX2ZhbWlseTsKIAl1MzIgZm91bmRyeV9pZDsKIAl1MzIgcGxhdF92ZXI7
CisJdTMyIHJhd19pZDsKIAl1MzIgcmF3X3ZlcjsKIAl1MzIgaHdfcGxhdDsKIAl1MzIgZm10
OwpAQCAtODQ0LDggKzg0NSwxMSBAQCBzdGF0aWMgdm9pZCBzb2NpbmZvX2RlYnVnZnNfaW5p
dChzdHJ1Y3QgcWNvbV9zb2NpbmZvICpxY29tX3NvY2luZm8sCiAJCQkJICAgJnFjb21fc29j
aW5mby0+aW5mby5od19wbGF0KTsKIAkJZmFsbHRocm91Z2g7CiAJY2FzZSBTT0NJTkZPX1ZF
UlNJT04oMCwgMik6Ci0JCXFjb21fc29jaW5mby0+aW5mby5yYXdfdmVyICA9IF9fbGUzMl90
b19jcHUoaW5mby0+cmF3X3Zlcik7CisJCXFjb21fc29jaW5mby0+aW5mby5yYXdfaWQgID0g
X19sZTMyX3RvX2NwdShpbmZvLT5yYXdfaWQpOworCQlxY29tX3NvY2luZm8tPmluZm8ucmF3
X3ZlciA9IF9fbGUzMl90b19jcHUoaW5mby0+cmF3X3Zlcik7CiAKKwkJZGVidWdmc19jcmVh
dGVfdTMyKCJyYXdfaWQiLCAwNDQ0LCBxY29tX3NvY2luZm8tPmRiZ19yb290LAorCQkJCSAg
ICZxY29tX3NvY2luZm8tPmluZm8ucmF3X2lkKTsKIAkJZGVidWdmc19jcmVhdGVfdTMyKCJy
YXdfdmVyc2lvbiIsIDA0NDQsIHFjb21fc29jaW5mby0+ZGJnX3Jvb3QsCiAJCQkJICAgJnFj
b21fc29jaW5mby0+aW5mby5yYXdfdmVyKTsKIAkJZmFsbHRocm91Z2g7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3NvYy9xY29tL3NtZW0uaCBiL2luY2x1ZGUvbGludXgvc29jL3Fj
b20vc21lbS5oCmluZGV4IDMyNDljYmQyMDE2Yi4uNWQ3YTNjZmIyMDAwIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L3NvYy9xY29tL3NtZW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L3Nv
Yy9xY29tL3NtZW0uaApAQCAtMTQsNiArMTQsNyBAQCBwaHlzX2FkZHJfdCBxY29tX3NtZW1f
dmlydF90b19waHlzKHZvaWQgKnApOwogCiBpbnQgcWNvbV9zbWVtX2dldF9zb2NfaWQodTMy
ICppZCk7CiBpbnQgcWNvbV9zbWVtX2dldF9mZWF0dXJlX2NvZGUodTMyICpjb2RlKTsKK2lu
dCBxY29tX3NtZW1fZ2V0X2p0YWdfaWQodTMyICppZCk7CiAKIGludCBxY29tX3NtZW1fYnVz
dF9od3NwaW5fbG9ja19ieV9ob3N0KHVuc2lnbmVkIGludCBob3N0KTsKIAotLSAKMi41Ni4w
Cgo=

--------------50GfGCps3rCUy0MrQIbZw5d3--
