Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831522;
	b=IOWxUWxN+MBFjx89y26WGTi9t3jwAQK90VkOJU4V9syWm7RMd9YYRMXojXQ9wPT3CWnJ
	 7wo/BiJZS6ZgtvgapbFcJoExTs/OA072W3H9EQvInOCO4yS5fe/jeUhcUAlbkoaZpEfX7
	 7uUIf1PA5WRfT6Qs+EQFbyFfPc7j9NncV3MtUFgbkxKNxBo0xTxKckaOuTHkSzkxshevf
	 zon41aFMrtXptk3f02hF483pO0V716RM1WRC9mL1HTnq3BrMjH3hMqkfzx/P3SWaDZyA+
	 P+cVQCl+z5J0qEDP2tjT1W/+eTS6JfTpeUZQNIJvecDtlPlL/ctnpcHJXCdcg4d+7xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
	b=MrLe0TF7/7TlXZsMt4zXIHGbbka2r4Ou0EGHGCkb1a4squhZqfdKuGuSRrWRClzB8dCt
	 8OaXrIR5IsNUW/0szPtkhux2vTJeeo4jQCLF6CIEx2982DPCkuQczEH1xd/kPw91z5buD
	 kE0Au8NSzql1xE5h+7stQsIxX7plLb/mInk6XI7G/9fFh1D1V5vtprOvsWlgFQjRD6xnX
	 +agyhz+GGk5l3SlOXvhMyZz7gID1PD1fGcjzvwTeGk0yBSuAfZkO5id5vSO7GcOW2H8+2
	 VrTHdGuSFRe3t9gzIUcTTCrR6MC+W7mmRXQA2WjDkvPrQrWGtd9x/2xDgFbNKo3PZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F124606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F124606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0mLr2212650
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=; b=d1YGkDnE2B1uZO6w
	EfxsjoYCvgCpxAiSilzt1FrP1sxMxee9mD5Ol3p/idGp4kiwr9VRukK2L/212BVq
	rEE+CvtXqzkRC7gWezH6YRTQl9LpBWs5ugXCOSSMxIKGd3T9UkkGQ+EQuITFChQK
	w86O5wQlmq5jjlCACS1Oz5TiwUTE0HQQn3KZe2fsnLx20bFPAhgWnHfdZsCeU0U4
	9/P5Yt1D4+k4X6NjNtRoAS/tXbehhQjbpQ011jgwYHz4XDTzYwgc+8fiZyT896yE
	Csaw+LBfxwClsI8yeBz08ON25eBpWefHH357eu3ywc+yMqinmOW/y3XPfdBU0ji2
	S+kuxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfg86w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:18:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so1878896a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794831512; x=1795436312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=gY1g7Dmz5fKSyoy7NTCR+hLfEyCJ+wzFervI2HnNSk0NFkPtqkzYt1RJxfwy0pyzYb
         jvkh7mbeZMSd8udsgLby4dA8U0UVQBYvSMneDudq35DzLCcJqt1xCPpc+1WgxvBlNoSF
         HaBrIuY0yIYABIRzDWLjVZqjhDnsuaC2Ct+kbC2Oxb5gYz1g21UNR8dUeC3/huGe0azF
         4n9/3v+ATcKWcVy7LHhLw+NbVJXcD56XPxvxiVKWAt2fBIxLYDRLJyqTGzJmqIcfbp2B
         OrKwDiuGgLi1FH0czB3nqJsIU0fi1/cXtzve1ZbbU8zvp5ipvtonKYqrj+0e1BR4lLI6
         RJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831512; x=1795436312;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=U1lJTV43HbM8Wf0Js1qx4r63xvxdJPgR7nJsY2afpZFPsm5ty4ncS8RHdmty3pEUjl
         gLCuE43Ft8rzqh8uluoDgyp9+bRGZbyYwzqSuo3zS1y9LZc2qqCK8rdgvgf8MspgjsbC
         ZBbqS0heb5w2RVo7ZeOAkwKX+91wvm566aH1TcHrL/qsA8Nj4fRKfM3GaWJvHS4Y4tYk
         j2FEoWYYoDBa31UiwoqTpoqIJhafE/S+Mt21ajF2pXQxjSjqV0XBVITUr2ShviL17bbf
         LMihsRONaZvq+6RHHxKpfcywxo6QRTqIbox18NOcFymg5q1rsD/L4uODjF/3s8KhJLfB
         vnXw==
X-Forwarded-Encrypted: i=1; AL+hErFjQw5iEJcGTgJ9UR+LGI46crd/Rux2vHaJOkYzhE7S8UJXPczdbeaJmac+bGAEaq3FlKkrg+tnnHZ3c60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZcV1IDusW+y2w14eKdEeZR8kkd1T4+JuA2IIy5KS0kgfNMPvE
	Oo41GLJNa7oGq0GV49rpHf3j5YUR4evDafnBw0IsI4mZ78SvUZvjkAkbYESZx/hOUfhLJ9bjl7H
	9XLEx/bralyrSr+LvZAcxOUqUPdmKMI1A7wHz4Szb5sT3397i5Zx1tY1GQet7jJ/UJyQ=
X-Gm-Gg: AYBFou33AJ+0O/XNWcaDz3bJB4NO2ajszoc0h/Er8V6Wy4xuq5SiySzU4H5maJL/xEb
	gaWzRcbfTMCC45lpQ6doJxPKfr1tJpQayDYWTv9Z4pMGaVXwf7rjBTgBjt9kk/juLJD6ROHwnf7
	cjWthfJCSvVfJWihV4AY300D+4w6246gi0tHxxot509a3UW4Vm0oCFBWdEkMWvoeuOeDhpzTFB+
	5+pty3LLEqovpuXQjRnO6MLMZ1jFMUBaFrXVUtVatKMyKqI66XR+4iLVXr526fQgft1EIgrdUvm
	vW9fLKVCHdrrOeyNvhxoSMMO8CLXRWsksg/C/ZSPeAB2J8yaX02GHHrOlC2Bb7XqsCZ/5cAsH9c
	km9fTqYH0M04JtCKJgxn0CrucdNKKiQ2MwhTyzrNtAqqnalauBkQd0dmlGcqXloEUg5oL3iXbEB
	Joxw==
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268495637.6.1794831512204;
        Mon, 16 Nov 2026 04:18:32 -0800 (PST)
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268463637.6.1794831511749;
        Mon, 16 Nov 2026 04:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1898afbsm4145008a12.19.2026.11.16.04.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:18:30 -0800 (PST)
Message-ID: <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:48:24 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Language: en-US
In-Reply-To: <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afaf4a0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LbPuwnihYiX5_xJIcoMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXwLsnSmnYYMOD
 HIv9qsDNoBCtcyqTaG0xsTUNlWoCRLeWsKwDB2gN0sYiglDeoRif5YGrEpXVokGdMEDrarvBX1t
 rWtJZ32EccTFh4aeOLHUt6R5HnbBWN4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX2jloF2cwAb3A
 ycspNS/IGkeyc4VYg8eoRU1CtGaYTQOyOJZTtPrIvNDqq9Rv/zDM7iVSMIP+eT6UZ4ZTHr8wE+h
 rS8OKJxKWuJe+o91/iSM/VUj8W/EEjyY8nJdqmndjTMeIuis/Zy6+KqjauNNUSEeQ3QE9p+EJKC
 wjdKbRnUlBy4uCs2cc2LDPV0zAMwglPG74eirsvZKyRp/o9wp6Fo+CMfnsARo21dN7qSC51nXqi
 yiBd8TrInhO3JW9LrT18exuINstsTkptrIkSEGYh4kaKbrctNrmf9pcfzOMWP9wdTUEoNENNIK/
 bNOAp6jw+tqlqTZ/xR4GB2W3zGFnDtRA97/BjzkbaMY72qeBG1IJBhvftPyb5uctLxlv7V+l+iO
 OQ6cMyIuvPf6RX0Bb7uFAm+dhMbdiKoo4dDBUM7cLbmGT2IPB1NLG0yz8PYE2PhnWI2gnaghr4C
 Z1MsCerI3vclvbc1g/g==
X-Proofpoint-ORIG-GUID: mwyc0twPbooaE9AV8zu0KWaHOT1oIk-S
X-Proofpoint-GUID: mwyc0twPbooaE9AV8zu0KWaHOT1oIk-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048



On 16-11-2026 17:39, Krzysztof Kozlowski wrote:
>> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
>> binding.
> ... so this was never working? Or was working but you change something?

It was not used in-tree yet. The existing example was wrong; this patch
fixes it before adding the Glymur DTS.

Glymur has three CSI2 PHY connections, so the logical CAMSS input ports
are 0, 1 and 2.

-- 
Regards,
Nihal Kumar Gupta

