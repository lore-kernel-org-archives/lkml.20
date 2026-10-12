Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900149D5A0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818902; cv=none; b=QcGrEnajOYj7++Im77Zxn4M25UONdtJ/4AVo6U1AXjMvTTEOwS9MY+8zWF17o5EZ9hM2fRy4NB1K3o0/NiWvDD/B3jfGjTnJmoxsfO/8JEHees11SD+t0fyuaai9+5qklEH9/PMoTb4KfVk8sNKjDIulpSZ8mpAlUooSOTPBrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818902; c=relaxed/simple;
	bh=fg46lxFa5YP6/BSzHdXma1atl9i26QcNJhb/fT/I7oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQA65Ax/9bkNg5nEYld1STOWTmUQE8RY+/smAa7DMPPoO8CVGMFGQ9lpCoIFniJN+/SSdeeyMNlnIqefMTNSISDLA5dlWdDVzP4Yz04SPzirr4vzEnB7M8EYLgwIJMhRH2EvXPA99wgmfXbt8i16seEV4+0zNNNkMEoOjOs7qVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZvhR4hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8SqNNgq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZvhR4hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8SqNNgq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03mL801999
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=; b=lZvhR4hme2f3qf3I
	yw92ewGL7tKkzb12W7vHDzrjibe+F9nd0ZROKARrswoB2e0I2ZflwCnWL6HuwneI
	3XNhynkFbnerdRFNl1pIyG+tqwEXUNzS+kKTJpeuzvwJ/AOJ5k/q/3BovjJFSVkH
	7VXL6nFpGzWTbqBdxbSNzxC2SJTf4Utjnc0wyTx0e8fGvDhHndLwzrmwd2Kz6F1n
	RbrQG30VSOxZhX7yzZyn21BGgPQpQV1qVi7UIzZRp7kZxR7Km8abSLVP8f8RdChl
	7X+KoFmyEchss8DV/nyUXytxpqFB0Vj028CA0ri6L+XvP3y8GjdQHWXp0vTBD4D/
	o/FzTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsdkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so7632661cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818899; x=1792423699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=;
        b=g8SqNNgq3y+DmKIEnBbzf0HTraCx0J/cXGq95QXoz7F8XkBFx63ThotZKMXzQnsCI8
         v63bdUbEe89moWLldiS63D6Gj9wXeEKpM4m7LXR5AJdtzaJ4ubQe//eA3D+ffyva293P
         xKPdYxeVl5IqL8wksDsvSJ43PvP/umztVQ2tM2LGW9OfrxnbF+DAk+lKMR9ttiXxMKf4
         tbRpc21ObrIr/6L3ogiQW6cS6MA1c6b/rUQVa+5AYcetatWF/ZtwtlOKp84SWy3sz9VQ
         p8/bId8VnODP+pecOZXKC/xpb4J+YNVTRYqN0JXlIdPAoCLyx0UV5mCGmUbt8oSDPX7B
         0CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818899; x=1792423699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=;
        b=M/cY8Puyf4RXGPhKn47TprYvL42Es29R0dKJzbAg6oY9r7Xgj7E9WAfq18L4j12Zww
         /N8SvBqvIlkRC6fr/LxCOg+dAapiD8v8qOB2BHJP7BX3prySS8I1aWxrxEVusu+2ZNhz
         omB1faDBr4p/y8VoPTxAWlhXTb8ZZcfwZP2nsYyLImwmkviVBi6F2AmYkDN1tlaD3XXh
         Yc+8tHgPYIYiz/Y01G0EGZLrp/NXfBbpJdhtYfgnjsWYPH8sO7jFRN9GdfXX/mNlB2R8
         EVeDS91oyeMW0lewLMgRtbeoDtWEtGImOnmvG5zwvWmTEaSw0E4d1VJNNBN4nt6HJVJX
         ey3w==
X-Forwarded-Encrypted: i=1; AKwUvBwHZaDyyx9aqCaIQ3D8j1Ba3H78VLkV7+kwXhykcjpFzXuOIvf6KHa5AkaXNKTHeTQomgttCg7HGfEI6DE=@vger.kernel.org
X-Gm-Message-State: AFq9FYImHEBtZjfMKtQZyRFVRWkqpDtgOaaXlrQPpJ/D81XUpPWo+J1d
	vzF0o7BiznnLSi9nZbLCKBzqe43I+vqR4yUgGvLpNb1oCtqiCW+WJ6lP5horb+2q1S8vnaOerAx
	bSW2yDUpU/AM4uydOEoNy1ohN57pQ8xZh73kKukGfxSG8JjWh3OYrZNoyGQXawjTRYpo=
X-Gm-Gg: AYBFou1WSDCIzR8t4r3FYwjtfkrak6y6fexgyvWcaDXGrWIe39nLZVVagVIZYzhLMrE
	JiRs3mpQVkEEADST46YYH6QptJq5j75oLAsTFmfoz4U8LJ1Mk3XNe5zbKXQntKGwU9Ucxt/hGO0
	0x2JJGXs+MEYGnEj1WWIxjUq37wvnlB5G7ftht+pgT63L6Llg0T/UvrNZ9kR6zBcdQWOTnFbIfW
	25GyQfqVkj1BqWm7hg+HmM6uzCG81PffJIVjDf817g5XZPrulqMeGZZzxBmViWGsml1UhUo0QHW
	oeOFqnzm0PiJpuNqQoz4g+z9l6RMPPfkqN/R44N+u2xPCGFo5lQe8KTcQ2EjVcDdKUVKexsPMuP
	fZy3EkDkgpa/v6NlZb+mAMA==
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr1837694085a.6.1791818898941;
        Mon, 12 Oct 2026 08:28:18 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr1837686385a.6.1791818898196;
        Mon, 12 Oct 2026 08:28:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm5067040a12.36.2026.10.12.08.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:17 -0700 (PDT)
Message-ID: <04f35f53-8297-4635-9bf4-5f7250a11d61@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/38] arm: dts: qcom: Format with dtfmt
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XtBu33CH42koqXKOJvOsG-Yh9auXcORN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8d0mKRvqzqot
 KGiaaoBTijMda8hT9dYZt7kjCLudhSircv6ZmpH5F1yycfVEeKLn38zx+WgKdICdfT8xESBppWs
 pufGL98qWTuM/3LnPvr1zUsXTPGKVJ8=
X-Proofpoint-ORIG-GUID: XtBu33CH42koqXKOJvOsG-Yh9auXcORN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8gzkK4xTwZ8p
 xZwi4hzeVDDwrxBeTOAoR8kfezz4OD2jVfVhymgCTu3lcww6eUHHh7efxw+EMQs5E2ASBfFoRUc
 G3x5WmcPl9L7yi3lWwy6+GJ7ElBcX7/0zZrPMSuUxXcW0PEEku0iWX65X7txYwLSZ3qipT0UA3l
 mVLIWgRVDxdeL8AhnMGDFl1CdoiWJ7P5l6JMkJr490G8xK2NsNVNe93VT0ajYXUj08Q3jUOIDfE
 OVDpyOchqYovkm9TL5P3JbdyFhFeE58TcZyTLYO5p8/VUon4Oxr200dBMfHeljLHmUhdUxuR/xg
 5FJPhQyy/rSlsFTmxNi2HMF2gY9O/+Nc7o7BM9Pzur4MmIK2jS/tdqps4AdyP8AIQzfCugTOt8D
 agqbaXe+2QisXOyGbNEJy8pPD5sumgkpTXPYfcqaTlIAb7+rY/bmZhbT5eeHIMQZdOpkVD6oUUc
 rcmaiDT5/yUbSsP7tYA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accfc94 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gnF1rBiOnwiRTV_mejAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> I was looking through the notes for the last Devicetree microconference
> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
> working on might be of interest here: dtfmt - a Devicetree Source
> formatter [2].
> 
> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
> from the actual Device Tree Compiler's (dtc) lexer/parser, also
> (hand)written by me [3]. It is primarily designed for the Linux kernel
> and currently parses all 6872 devicetree files in the tree successfully
> (found with `find . -iregex ".+\.dts[io]?$"`).
> 
> This tool was developed out of frustration when reviewing devicetree
> patches internally at my company Axis. I would have published it earlier
> if I was aware of the on-going discussions at LPC 2025. It only caught
> my attention since I'm planning to attend LPC this year (especially the
> Devicetree microconference and would therefore love to discuss this more
> in-person!).
> 
> This patch series is only a small demonstration of dtfmt, primarily to
> get Konrad Dybcio in the "To:"-field (who did the presentation on LPC
> 2025). Obviously one can run dtfmt for all files and generate a much
> bigger diff. There have been patches sent for
> `arch/arm64/boot/dts/exynos/` previously [4].

Incredible work, thank you once again!

For some fun trivia, this is the tool you might have heard of as we
walked around one of the LPC 2026 evening events and kept poking the
various soc maintainers!

Konrad
