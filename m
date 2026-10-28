Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193636;
	b=3N/cqgaef2Mph3mRCnUcJt4zEWnjo3zJVhOll7rYbcuVFhWPvzpyOHYM1osqKmQqxcyM
	 B+lpGVbsTjzk1LgE4GzZerjPROtqL+BXcQ/767VaFWhASN3X8wYdHtAxIVjIfPuvvhcbv
	 q5wByoRL0n5XNM1QD/fmqUTb6XRrdDprRHUZIM6T2e/Amw5M+X5E4a+s76RfwQDzXODkp
	 oeiiedhWIqsBmwe17dXF4GrNihmSCcKHHJd5feb2ql8OlQo3GHkJZRXwMg3rbV6IaibuL
	 V417/zwpv/QoppKj8h2EpAeQn19/rTN3erlCQoAofWvKK8JYzRDcWg5aViUhQ/JH+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
	b=ZHKxWZH+c6LHMP281L5yK2eIybVpGexx825gJEPmg7SY8c+TBQ2atn9tEo2GkWXLkTrt
	 nKYtF/2iBz6b1rnLXQg+/bZQnnFzJiWFIDkZhq6Q7sZAZVJcPKWawxmu8IVBBNbhupmEh
	 9Ju7O1s9fU50oYGdT4p8OYUpAMZLEecYP7muYLSc9h6iR/pylDqP3uAQE9HRfjGFuqJB4
	 XWkcJI8fe8wP9UZLP1p1OLnfwhC9+ThSbFqvyz9jJX7/wrrGSa6TGZN3SDLDbXJYlMZfq
	 CEU9t5rdpsOksYy5spB8cQ4Ucmgbd59HJmQMOnF67KwU1jOeR2tji6coMUTzwVyhUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5BE0rI4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FngDofrG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4635606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4635606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5BE0rI4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FngDofrG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI5bh718077
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=; b=N5BE0rI44UcfV1FE
	Y1CPquxLO/iZMblydFhDbdqy6Wm+RDCjygga63UP6OZCRgXRklyhQfR+Jl0rpG1v
	veDMj0CRboY6Y88yCki3DoVpPBuskoL+s/jd/iJVokIBUvZ++DVzx3orDntZXFtJ
	MbpKmEsM+x+WuGzPRxMM2rx7irkpaAdqhJbv4Z6TWZaeUtFfZEWXALkuoXDZRtxV
	xUR5nHlMeJHpOVYO/Mxh+AP3lwkM/KHTbnNgGdE90Blu7IpDcjgiX+um9GpC/l+h
	BqEBo1PefKhrc0lpN5aMI4Bo/VrrWDfkrn2w2OLZYfUpg2f90DS5vIxGT9lKNHCt
	N0i6CA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjg0cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so72171e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193634; x=1793798434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
        b=FngDofrGM/Qt6TwFYzOFjkmc7Io4MWHX5NG55K7POqrcyzCaAupEt3IrlIzg0N3y2B
         K7b2oMB1AXYYsdZywg0uqcuNFFMSqmfs0J3R7/82H/eoeY7oRb9eNvRbMp3NgfCRRzVC
         6iEy1o4d95ITwj+OW99C9NJt2viL7+VKw9puyBvS9LcH9kaJBUzjiQuMU3/ozCaJQwUs
         QXSAXZgCFi6nvnQSLZHk8XmxBEYlElGa5K0RYouuVKhDC+m3UCn4oJ8dNJQXa2L/FIh7
         kwbLRk2L8fSVw2NZWgCokEmGjDW4R6KASKZF40UWyyXz3TEtZ25HN8jyNNsAELEZcPBW
         Ewow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193634; x=1793798434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
        b=PNubXclls9xssRPNguLGqI96HhUcST1aXPcSJ4oOziK+MFeAXy3k4rN3kdKt2g0mmh
         rTS0t477xYziiVIinJxZ2hKK/jKdjd1alplKeNTKPT8QV8DaOxPjES6tLrIkhRS9TTfh
         6/bIgoHjpHKyJaul348a8NBL8r3lCILhG0Odpzzf4KLxJjmQ+zh2V/UieqN1h8tc8qLl
         NENgCw7nPP6KWNI+XH9Q1ErrKSfUL4rB3R1PavcEVA7qiDC7LOCRxyCUJWzxVxtBWnNJ
         FTsXQVywXNAJmGT7CbXPeoefpH1eBYzwdVmK8aK46L91BSrx6HnimbOgtNnvMaDK7StY
         X1jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjjFUjOxDV3e4p4vIOh+xkO5JYN5xRwCYwJKvlxtxxc204TwWalweYmQ7GgKpekqYinRn7fgasuMmOwto=@vger.kernel.org
X-Gm-Message-State: AFq9FYICEjfE64zK1YyAtUgJFodT8yRoXMGRlQlOq1CfJZq40CXW5XWj
	DnPMiiHK7FmB2mGBS+m4CsVO5K8IXw19SwUcsTVeb2Ee7I+myqgNuVEAdux8oJ3RV9NtKhPjeaW
	IHAOtk1l4WX5HkAnHvnpWsU2ecR5yzE5yO2OUZ3upUrIZHJKGPFornmIAzkmBaGOBEbk=
X-Gm-Gg: AYBFou2z2fcoJgNsQHLgqJGczbi8bUtd9A0QLUj/wJ9wbdwgaNSe+5l/BWN3GT2XU70
	PdHkymS+Gm07Iic/6j9+k86SNQm28CDWyq0YVqDd665GYCE1DxwJe2S0+GbjI9WKwULpeEI/SbJ
	o3MhzCaB3EMR4g6esTwu3WMPjoErdF4qlpLRWQROkBApDN9A+vP5jgKgG9q87ze7+9MvJ4uXESR
	3orA299/zZTrX3xvIpPX3kYXjgxYHH3m18Cnbi6ZDO0Tk1PqIlDwcqJae4DjBtQ/qtd+PG+Ws/l
	VxTHA9XHpT+bYvWNsqfiajx3Sy0/ixNBoAkxTT0tvKLTkgY6EVxhQgZCHNbu2PV8RZ27+Uy+QvT
	YGAyxsalzzalZe8htCMprBSxqequvEpDCdGkogbcRxa6nSkcUD4s1hflk/G9UVZPbIb2Efds=
X-Received: by 2002:a05:6122:1a8a:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec4caa71bdmr805400e0c.1.1793193634013;
        Wed, 28 Oct 2026 06:20:34 -0700 (PDT)
X-Received: by 2002:a05:6122:1a8a:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec4caa71bdmr805377e0c.1.1793193633498;
        Wed, 28 Oct 2026 06:20:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca57dc11sm590055e87.33.2026.10.28.06.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:20:32 -0700 (PDT)
Message-ID: <fc444b2d-9bc6-43b0-9054-ba04c7820352@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:20:29 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX0SSJ4n/6SDN5
 YZoo4FL56ebg8sic71TEx3zL1i+HsaAM6nqwXaftj/gJfoctyf99gX7Pl8Rql3z4nEFmgv1iM7T
 lyxKTigk0nsX4W9N5DNreI9h+tK1Rgw+2G11tMT95rXWG7n2iIE5mYD5I0cWXzauWSYBacsqCy/
 FgEZUchxz89w9KkaY3uCR9bFraSHKI3nade98d6OWqQN8JL+0ySEuU/brJmX5NbtaTm6Z6BaGR1
 V9PsG9pHIivMtyw7++r7wJwz1LZbuY2miqgkxJBNvNWTDHALymP1hjp0V/N/58iMGuyHFNd5uSi
 0BB5IcUieqJTKnoY+TGiZYP2Ca/uDXdVwwV3dgtpXoKnzN9mOevd5FU+NISmv+Lpcy0wHj5rtYe
 ZtejvtKACHjp6Xr7KTMD1vC/ELQfwvIOhAPAIqYPiEp7OsQpV/yogdubiF1VOG6YSiVqE7SXKUx
 1pq2RGvL7qDdV6VuFZA==
X-Proofpoint-GUID: JH5I3efBX2568n145UKOziUlc2iHZ8zT
X-Proofpoint-ORIG-GUID: JH5I3efBX2568n145UKOziUlc2iHZ8zT
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae1f6a3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WKNOtjYE1B8OkmgEoC0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX/Dr3dR9+sQjf
 Siez2Q11JpN+gbP34uEKg0TLLK1yp1JSLiV4gX6xkC7U0yjmaQfWPWOjBzAX6ME/W4tIN7Lgb3N
 W3C/XRyZLVL1ksQt8n/pJUD+i5BVKdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/28/26 2:14 PM, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Fixes: 51fe74e44c69 ("arm64: dts: qcom: glymur-crd: Enable SD card")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
