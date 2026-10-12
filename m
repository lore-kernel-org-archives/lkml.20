Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8449A3D8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818917; cv=none; b=eumK7mXOm8MWPFq00IeZgEfLR+YO1wXM8SYiujRIOqofvSqd+PDmTiV3YaHyyaRXiKWC4OjtU6RyP9Yeu1oCqN8F7rclRQK0t7fV/PTc1tOiU5hgf+ZNUxqlHckpkzfphnaSL4zmIMBNa13KjpFg6hFkfB1XLz7ZN/mwtv3A7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818917; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRuVSsXdt6JIznZL9uNFb+ChdrZ/DuAGBok/Ilw+IP5dPNSghp921aHwP0FzQVBUCHWH05Rm2yVqBJ/8pwpF2o8KEHS1woQ5B78ZT1qN2MMifqyWHFNxF9u0rKFFh2k7EigMbDjVa9izyG7ag2m1Of4qNOKInsJ6mOlV0KrS4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxi0cwqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPiBgaPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxi0cwqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPiBgaPC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09BU3292338
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=Wxi0cwqHkAgKc/8H
	47z7krdHcKVLZp9+6FREziNJLMk0AzO382/usxOMx/yTSjtbPjpCZsbpc0oY8PEp
	0ZommoQuB3V2CvFWrYDmy/3pekK7bbsVRMoLamWDHFO2J6nhgfz7AJdFeuPse9X4
	RSbuIvV4OOkZCg1/x8Y8xEsylH3Fucd5NGkTF9er5pJcr4NOA7JClvK6yYAP9hlb
	kCCY/zo1QCXjd/6WQXyw7P6XRo5PE2lNs6nVXfcPIfQtytKhmfn39Pnkx7EttP9/
	YNspKQj2E483gkIUCSflf4j2gHr+L0Ppq3GhDwsYiYIMlh4Us1JmXC+GXOookB6L
	dlVMTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j281-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:28:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so12481185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818914; x=1792423714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=JPiBgaPCS8uN7GBLwuJEJQjPJdIUAEZbhAEIfDErVRRmh1fBS2wZO3QRdMXUNckbCX
         BGI9NAukeKxOVz70hegrRIyZ2x3qBTjf5aO3XnVQUAUWXCnA9HgIdnFtX2gjcebAgAkL
         2qpdPGYeI6DV2tznV95/EzPSCJ0InzE5JLx9Kfwihlqr/XLJPEVTxpnFpYFNnxUr9C06
         /h+m0BPsUfTfOjQx5N4AHVOcTsfJRKXgnnarnHZM3kOSLj9TImJ2oGoLamO3+Tq4xW1U
         I6gjyrsVPsHpwKBI6QEpX1pmvNtI4kX2f1XnCno4VOfrTUuwB7tafeR8QR4vXWtCBHMq
         ATIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818914; x=1792423714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=nAt+LBUF3xQOnYyslIa/aGJh1n4OJzyBD99MCq9qzVvsqAuahPEQskMB6HZ7QPBsdp
         g5YyDnLh+m8GZyQfEN3QFpBDWJIBBvYDfXSJdj8TiXU61JPdUuv6LetdOqTnGVUlVbb6
         UI9OboqjXFaz0MK56OHxQW8XxLhCzvY4tT3LihGNky5s27gEOa1GaVvae8QrGpf95JA5
         vuFq/gJ3GPt1BpuxoXWx8rBQscd8B5gLd0MILL/MCY9OkQpU/UfWpgpl2MfIEBZG293H
         SQpSedvcdMuAa25l3IczgyE2dKOJjAGxs1wTJU66Bx9FlM3felyaFSYR58c5NWYsZ/9g
         i+zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxGID5DMfGlJUOL4DuK9xBWk7tysMLZHiBPKxJPbzgcHJHZ4/Qx7SVfCC8+ZRf03xTep3toDQgV+cQFwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIku09QjynsNCwNzZcslwrasj76nT3BJ0pOQeYwV1tm4TwS7l8w
	MS4MoCCQ4SRf6FtgRdGAwyLEQ7z0SICYRamfUH99F8nYqC2I3WCcRkGtQcTfuRjzikO+EZHgc/X
	XEt4o6uc+hz8XEDyMI40bCv11VCeQFRWhDrBvdTXtZOQ3wrhdINNk0tYtc1OAQQu1BYA=
X-Gm-Gg: AYBFou1CM6Qs+q3e7LMQjI9T8CZjwvssYH9UsjGxF+GIWKcq4GFjg0pjgWPLccmP0IH
	FnxNITXyBUs/FKfU1j6zgOYGlh+btONaEoTpwT0B3Yvhiy9eqr0NYLDbJFlxWHgGYpoZbbMDnxq
	kib+V8XoWWB7A76dRgKcqajJjFlANB0M0LfVHTOD8AgGjhtfX0mgLL9y9KRhYrGTRY9ReJHgHSl
	3EEceA1Ft7gvhzZ0SBdkkVjnTGXq0yFy/87xxhSABRrSDJcguYsdRxOzeLu+DUnoRMMGuI+CGwl
	WLxkh/s+gj4Df9+Lsn0tuTkusrs4Lf/yrqmcFlfE0JCbxBy3R2BqrRi2IV/bsnkdpvdxq91rEA3
	V5mH8YUvdzTdy9YDpkRqqoA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1710088085a.0.1791818913854;
        Mon, 12 Oct 2026 08:28:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1710083285a.0.1791818913355;
        Mon, 12 Oct 2026 08:28:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:32 -0700 (PDT)
Message-ID: <2caed75e-ae69-4065-ae31-12d229de4b7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/38] arm: dts: qcom: ipq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2deLyBkYc1HI
 Eei+ccXsWXUzCi0pib/UURQ/8yhfvmIdM7dTBBBeqXj1B46HjifVYsMlH0vH751rfBr5bNJPGhQ
 mrj320n40JAidRGIRU9O/AibvquqwYAu5j3gRBt1F32YOyml2ApQBIHNkm1V1+2pfZaS3hPvHID
 uqhqXReptofOID5BzRUOd394EPMBHb5/xdWX0dzenUSFcGEdoYgKQu+MAkSvV6x+TJDTO5D3sPh
 bsFgzWT/GKPHNWoDOTK1hloxnh0kzxfpDFzFm7h8Nr9C4ErTd7FVRx6cBAUMPwTfVhjBMLid5dj
 heZDrGXfyzRFrPSUxOkfV5Q5bq0LVqv362n6EfsuPGs42RWWRIbIiAQUj5NJez9WzbYJiKtby5I
 1G4CmUpf2MppHbG8ubzQyvXLifgIYie5uEh182OlsfOU2cCJMyTS/+sdMyB72MPaF3lL0dUj7SW
 MI4A6Hk0C2zJXrc5Mqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4bghcCthuFHA
 VyF5wL8f+Rw55r/M1e+k+3Rq8s+Uc6e82PS8w3RCIyJOMFakjkv6ahkVmis3MK4wbImPtuckKB7
 nNqVyP+qXTPNa4IVcg7IDMN4HtyQccg=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfca2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: UG_Oc8c092eSinIBUdvbdwGNAt4O1mNg
X-Proofpoint-GUID: UG_Oc8c092eSinIBUdvbdwGNAt4O1mNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
