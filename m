Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA0443312
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388716; cv=none; b=uSi+ewMhmKcnXzhnVwcMo3RZjpKBVd0B8vMxmcqtyqBQdF7HR2QChioQ7tNzVGTkg1EhxsOMKzTQSqvQLuzJXOSQfTOHSKiAmjR3dv8vQR3fOorigbKGU3FNfXX2fb+H0vOZIQuEf34WaZyp8rhSOYk1t33PN1Q+YM/dy/M8rWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388716; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYo7owqBerxWyuKD1ONzO1df80GU1+M10IsPLNv9d4Lp0/gzfD8XK9mFOO9MA8m8zfPNc1IQKVzds/C8HLOExGG8C0XCY5Nb5nIxxz9Rb3psIO0QikuJ0LAtdJWtzKiE3zNJcxDjw6VQhZshGNZu6ynY8DZkBZitAbrRLv1HJ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKBxH83T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuhF12NX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKBxH83T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuhF12NX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxed1460642
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=JKBxH83TjqRwSHXM
	Zte67Hw1iWwcYYHyXDYH4xhk+RPxPWXK3HBiOYk0WqpT9pF3oY7PjsVVDd8Iy97Y
	FY3HHiTU8EqynGWKt/1bkuThd0z3CbVm3FLqp1pxojjeytkl6Pm+Xkp9zLNQMGhU
	FV7zHKNWUUhH5wathlRMzX3IP3iJ3cSf4t4AY7h50VSe+I0zVEO+ztWqm2/YXoT0
	qrTTddIdEIzLVyBILQEL0vRtH6rZHd6cdiVkNznHR3F6N6SH9/5y7aAeadNb3dBx
	cduwB4USFMDkoWz3hnV81s6aer/Ybv1zGZgc5YoMfZWdrUPnwJ3YQCsNeg8Ai2uO
	3muDSQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8mqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82b318a06so37384e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388713; x=1789993513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=XuhF12NXXH+dc9Iehs5g5wZ+BTkfEl/oYpvHd0SrDHYoSt3mNCBxFQ4SO+2u9j4yVe
         XdpIaqFHN9s8NZ2qNouhu4RcPscr50P2gO7BIdjT3ebR1xmkgxFCXTwEz4vas+lLxRYV
         B684lUvfuCtvcH1iRzVfFnwpQ1FiexFKMPJP3HAF9313AhoSn/1/Uo6D+T5zJ5QUMX1R
         a4G/SoxSEn31mPiJMsZ46haUrDUYp1WLMXet1ryXiDBl1oQRr3Y5bN1W2VFM1lQ0d5Ua
         3mkyPth8gL4FEjKssue8NMTt9nchaZE/cJp+Wknqhddodl3pTn9i1V0Jf7jaaMgUYq4k
         izHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388713; x=1789993513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=H99biVTARVJcj4rW21pA/6wo/tX7lzhOgl/5kXjXDKTsBuqU37wo829GayxnAHoIgT
         zKc0llD4PHcC7VIEOIF7haUX9JNWOO0pNtCHJTBeh/IG5pon2FhAGmUs3Bu/E5eMiUzW
         s0oimlkvM7y7ozZex2aMXvQBCQGe4HrJ+4Apa2WdQ68hh2GVQ7l6kcHGPYMopGL1k1lm
         +fy+VlHHgFPHB7R3oHJ46TyK63PdHZSGfMbyVEIrvDYSgX45Fwg7aOp631JBlOVE6kR0
         SK6/FMyzmxeP9a2kTyW1lJQuqWog+gTOQWppRyI6Jxu2Or5fKuCgW2pJj/U6pWZDJUI4
         r8Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzhnoofM6F8RR+VTm5dJZ6+e02sJZE7wDdD4O2AQe55J0i3VtSBkesBgdCiaOfYOxL0F37/egKJvyf4AnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nMI7bq9NPtwyB4Cbdv0seKdj91Cj1gCuNzLbAzdeppZbpwn/vw
	SVkcbPLZHd8hr9M99ICQpr8cMVqwELEkqUtlsTw+8RqfHuzDPxs3lOUTNePEQoeuWTRfMcT6M0z
	nHpUl6zoXqeFDvUVhrDy5Y7dFUU7AX/a6Tl7ZaLEKba7TaIkHsG+p8LNyq8wePnATduk=
X-Gm-Gg: AYBFou2XWml82Q/tnI6kW84bgYlf50gaV4OTXZtqEduX7Ut+QyA+KWKEdjb3LnATS4p
	jlu/ooEt625jORjAnhzPQOQ2V1GUzWKV4B9j0zeKF2uQlcfikTJmhssxFDp28Ihms0To/9ARKWz
	P8DcvcmlyTzdEq/FMp4kiUM2OD8NaEJFTxLw6q11rqNRqs5PoQusA/fx8rsTolAqhLQq+avVi68
	vwChDhy0zms3396v33odNSPbWx8qW75Mnf9+nmIVX3cbkb/KGwlHlvjo2xu8F5MgIY93BG7e4Ws
	xoBahFscKWUm/TY7dQz9GLeik6DcwR0MZIYzHyl0ULn0Gc/jFvAd1Nm1dp0KHHuer1LmB7Mhm6X
	pzVn0wiuDoWxP2KkvdUajgw==
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr379207e0c.1.1789388713647;
        Mon, 14 Sep 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr379164e0c.1.1789388712971;
        Mon, 14 Sep 2026 05:25:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2440450e87.42.2026.09.14.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:12 -0700 (PDT)
Message-ID: <ccaad097-6bb9-4905-93e1-acd22aba0aa9@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX1tthZA7nQIti
 IwwprQoFAkGWxxX73rejX1HFpyXfWV7AR06VorYdwGjRLtrAzyOBg0dnpjfaerGdVaJ8youl/5c
 77ShcS5w5BHoAAIo1wWs37uESrhfqffdv+iz5aLa+nRm58/63800kRMNmXaS+bNdYVjV3lx/fvt
 HL7dzvesqoiUptdXQjE1un37uy98qF9VE13DWdFBQG1ZrXiibATOgHKd51zoKAYYJi7s4dJavhi
 p5j8M3QQJRki3bRxTX8bnNb5fVCR9mlPvfV0u2RFsmZrCuURSbInL82sjTrlyevjlw2NjlkkhLE
 FpR5UFG7uHqvmLZNwf37yLYSxEJ69t0/lshVili72TKotoBkS62lzfVdbhhwz5527qhXGYTH/2v
 p8b7jauM7RxGN+LrkzCHIM3VgzTZxoO3DXyQOxPbeIcix46PqZXBR6sW9sCZ2sgph/xr0jEi+rU
 xJhK5EeXwtx9l4V6q7g==
X-Proofpoint-GUID: K55J7RctoHvVUucUNn0UJmdt1dBcYRQT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxIFWxeTXCgQM
 vdjBxLNzxHyQkgqo6ylxv+kpWn2IZwEZiSsrB+jnA6UUFKGUyp8eWkSFx5Qpx6hgRiiEpSVCsGE
 irtVhk+I5TH2acp/gS8cOGdnMHOrFr4=
X-Proofpoint-ORIG-GUID: K55J7RctoHvVUucUNn0UJmdt1dBcYRQT
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e7aa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
