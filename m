Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105895;
	b=imIbMrmcaYQmPNEWlvM7cPYCmbzSll1hdKIz1GMpxnBRVVyPcWrqD7uGJs/13cg8x395
	 fI3fcsaKHgJHxlg2SXjuu7bgYSXTlfSD2ojdwWOStXekvgpT13PPSv9RU8ImlotV7VZkz
	 QQ+LeNGEwCenow5Y9M3GdHgnxd+3aq6EKxmnX6X4+2fPZ24C5B7rJX3wwq5i3LhU0j94h
	 Ya+I+o/G7GiowpbxZlDupg3ZaSzZKwkK3MFTiiYG+FlDcY5m4Tk4Cmsd93Hnd5YOdZcJd
	 +V6pJ6dg2Q7QZxH/gVNZ4SPMGbcg/ci7cmODd9Bf/zH32cb6dT+iSIRRX1Rvb4QvNlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=;
	b=iV22eQTLNyIQ2I60GLiwjjK22M1jNPktb1pWH/ZYR2yIvLc7GucC0HDOeYgmqqXPUw04
	 sdiainlCbwvSkTWsJLFKnW+pCv3UwdK88lpr6tZVoM3ykPe5qViBA+1cd3hKu+Tk+Il8g
	 NgyJ28mKRsJAxRGRN/vSNwlrm6VQdni56RZmWKpW8+6rCYe6uYAsWVOPRkAM6FxNEVG8i
	 g3tmodgLGFMuMvAfU6RbkoJrGhvcZD4AkAygwpAz8dFz2SbsTk4vh0e9Uc9CtrZA9hdvm
	 4wmE2G2wNukdzjOH93o9OTf/745yTtqKqxN+TFOH6l/ifSDrIyzXyGSGA5Hr5ldNHng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P9MA/qYH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RejKr7b/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA12606A334
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA12606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9MA/qYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RejKr7b/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeB6K1936092
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=; b=P9MA/qYHtdMXZDJX
	2SkRFZE5EdlMNrjSVoyL7HutQg5yIGTeT713yDq7POMHkuaauvnKGJC1m5l6GSUt
	3RHN4ItWo5rO6CYTONryUnhLbyN0vUiSB/65jNRgfI8ijqDxIs+CSf/NFkDEFcYC
	F9Yvqasjh+Gy40+FB13Ryr4uqQfol1iaFuie9bLfppyWire0rcL6/TH99trXnlBX
	6XM8OFjHars1Fn1l6esJ6L837/QvxP9qOc/r811zJBo7t5mR22q+xcY8+0p+ZWuI
	y2FIjHY2GfHQvNIf0h+7moWT9UbkBRkKOkKfwG9at17J6/ipYSXbcvIW2VqgaDtR
	NDbypg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtwsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:58:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so53713285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105893; x=1793710693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=;
        b=RejKr7b/O74kcCFPNXjqHJ/bgExN6ISGoHydm5FJTbTaa/Hzhs9I0sxVyRqGCBqxG7
         sNktFscAnwTRkWyuJnFMYBHVBoOQJpw4ie5d3q1sEBQ6PnWadk1B77oFKxgMvUqd51B/
         4aLlONFASZneVpTTZdQowMjHVL7J6D6OkjuyIjiOiOeeSPoWJKFfmWEtX26gpjj1BeYW
         VocZwxG4FFFJGwbYyklNTlFNq0+Mfx52jQaF6+pRvZCB/TXLFPJtOyZIUCQ11gonNfV2
         LBr2EZDpgbO85dWUVJ5lYjvDo+qIbxoWfr07kj110btdmQ8voAVe00M6W3D/EN6yli2K
         3rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105893; x=1793710693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgqucWhpJP1U0EP6bRbCaCxJwMlu84RXvHdaDNKwGUI=;
        b=teqeg6WcjP1eCEI5x7itoS9JfR3U6CKaxmXo7JsMnUCTdWZBoVzizx2f2xzAi01BW7
         EStdR3GfIrFRur+8ekQ9dUfUiQ4V9oe9XgjNgYF0mnSGumMEJ1eIIgIKcvIUeLRxLSMQ
         /R2cbLeur244iXwwGhrDin/S8piJY/0x9+nWG2U83uxvmrPZZlJ0hu5h2QYTz8kDUcsb
         CjB2NNSCHv2Up7A5Q+ziB0FjWZZzOEpgLKtanp7QssfDHfEIfANpqiwV5+3JOXuKfSbN
         CurIVZzEvi2HCdGoAQZ1BV8YCRZnfNSGT6FKFuAf/5vQohEI6unnu5nxRI/QiKpecJdt
         9LMQ==
X-Forwarded-Encrypted: i=1; AKwUvByrmjQKFY2uh0UHd6PlahjFeVZzmDKDL7OpumJNvW+cF0hJS4fSUpLTDDW/Y/lX4DUPgHyJWg0ZnpOUWTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/n/Mx9/5hkO+fqkVxkUkTxDubtsVrKqDg+iKEXbN6YkAWOcPd
	UUedVyH2xr4xV8Mki4b0S/+dLEimoo3KQ6XVrAlzdomxXsVq3KKkbe9sYUuQ3P6PWJaQAepcxDp
	6ONlcgfpJj5p7MCt1LBlZoRkebkL9NGm1qFOiy/pOaDYEkP/lpL18ovQPMODuRCmCyNI=
X-Gm-Gg: AYBFou0X4cX5jMWKQxkvlqRWpTlxIUYpkGRNpeB7GiG54zQZSlZfrB6t1tYaIW8uK3x
	ea0cYpoCasLebb8f5VxD+1L5X9K7o02BUUEIu6fYwk5bFloPKj7XYWj16XvnB7O1iXkElDagso6
	0T6LGBpKe7VydYc5fosPbekTkwJlrBLkQ3kb7fI7KF26sxj/5HhtGOylKYMhlpwNmIiWLqfGrgA
	jlc2Ou1DgMmAWIsLN/OF5KRqpOWaW/ePMoYgVoqAQW16+gPBt/TZh7Livq6p3VeLAalNNB/jfLr
	exEemBRP5T4QDiRN4fJj9WGSleX0pmk6cYAvgu3DexDI0n2P+kqBmP7MrMVo+f+bP0vUcJVQz1m
	EbARQIsFutFmeOFMHR/5TNQ==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1501400185a.0.1793105892989;
        Tue, 27 Oct 2026 05:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1501395585a.0.1793105892437;
        Tue, 27 Oct 2026 05:58:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm448250266b.64.2026.10.27.05.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:58:11 -0700 (PDT)
Message-ID: <5b229052-ebe5-496b-a21b-974d7bf3c5f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:58:09 +0100
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
Subject: Re: [PATCH v4 3/4] soc: qcom: smem: validate private item payloads
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-3-b0baf39c6e01@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-port-smem-v4-3-b0baf39c6e01@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nVvi1cRSNotJHcE7LzLHB7_akt5fdszp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX6gJPPwwoM5xC
 TDlc5++1V70a/e23vWEVk/4BqSaHra0NwC1pg6iOmg3FlSJ9ukV48Sk++hcz9fw/Yykx+yn2U/c
 9Qy/SmXaWdxerbRVcFpU6+UNK7fsYOo=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae09fe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jyy8ADtZjKfwQqIx334A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nVvi1cRSNotJHcE7LzLHB7_akt5fdszp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXyVRqYvKFokww
 40JUgDxFNN6jO7OqwqtEOvegzQGlMkQhnlvSPBFaUIdqPIOjAM8ES1bTsXQSNdLXbAKWrlN/xBh
 +0Dek8b91otOJtD5bK0QqMfc1HyxAHQC1xRBqsWWIQRCZX4J7bEvkToi7WCKthiyVeD5KeUOOpK
 ISPrRrs1i/NRVhlScAo2ue8ZKOxbz1bmpFG63t5hHi35TJ71n12ErfYUUjjosy4myCLXOYc/1VC
 9xguU2zCQklqb6E+p2VqR01zOzMCYtLm/yjk/sK42aoPUtRYR8A38E8HeXW7OPWJM3NFrbkXs//
 lMDraZtJwACbC2fr6oMtRlZWh8BjypwQLM8T7uTgLP9W5yubp4gZJ4VUYcZoM26JAqL77k/KkCH
 x+PSS8gKdIYRgcodSNA/rfOGghILwVc4t84JkP8M6PLgdHRwW7fHHCxXGjLAVY3LD2VZ8OzzYXB
 g9fBb6G7vxkzGSpZohA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270051

On 10/22/26 11:47 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Validate a matching entry's size and padding even when the caller does
> not request the length, and check that the payload stays inside the
> same region as the header.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

The commit message should probably mention that zero-length
payloads are now considered invalid (but I think there aren't
any valid ZLPs). I think we can also keep the WARN_ON() for the
bad padding_data

Konrad
