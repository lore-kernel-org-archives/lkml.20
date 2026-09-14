Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00134463B85
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388821; cv=none; b=PI2fZ28yRKWFpnsDaP8P8eW36hdcbFc4hbzlGBq/CzFWVQgRiaQ+KlOzy4/HAhtvbWWo6b3ZOauuKuhqzDRRz9sKcsB4xFFBWxBZFkrIsrKDsMqzh7cNxDFv7GHgVkd3yXLym3ExgoVcyVJhSuff1hP5CF/+15XBI6s1mo81uwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388821; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YyKCccVEqWungPDVmaxRhIop3QXIFxn2AMlhYn7vBeA+rF82Yaa/dMoAj1ByLQopAfBf9pDgGRi/qeiAu0uRBXY1PlBqrYqvgzzWt8PmM1LDyDS3Y7OVL674qzNfMPTyIKsIzkjJHcEqVyynBDuUjsB6LzgVdnqC2pddB4hMjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXLWQALI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSpOrZzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXLWQALI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSpOrZzd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4Xs1216187
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=KXLWQALI2kburQDd
	CvzSipFAaBJah5sgsg9w/zQqoqqqXeG/0sdVc91XvUvassRJ/6acCY3Qm2poGs9n
	cx2wECHn6TO2Y+l4DedUX8KOnimUgK95yAuUG5EvnLTB38eE6hJ4z3C37qNBc0qU
	EWlXA1ZTGduyi8uZqqzqOmaZhGEfnCk5KhzY9IYnaShCxQj4AYMrcSRL9WZhY2Wf
	kyyfQYQX2xz8KHYoErE6Byw8AqihLhFv/BZkWLI+r/Hh5U22jnIjtXydEn/mGAup
	dr5S2NAARua/JodwNBGUKzUwmYOLiGlmhgybg1LpgCbIClGoT+lfkPLypENo/g2H
	Akhi9w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0af8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79812f74f7dso23797137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388816; x=1789993616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=LSpOrZzdcbCXXAjN379gPmYTyu5YlYtGQNAmblshLoXIMxxf1diOHVWB1zG/c1rB0c
         y65r9gs8txfbggAN3ewQ9MdeG6l0KADCbdQ0Ps2H34e9XQSBWfp8KSwUFHtDW/X9uKv+
         vs1ket5siYWDb4hF410/fIx3eYaSeaqS/bAqYRmtbIhMQXpBfPESowXFTYBofFt0SX2g
         TsbHllYsjSzLNt3TuLj9LNI1leyfBd7EpSl5Gs9JXh6a4wJYLzWsJqp13uIK5vTQBws/
         KkYFAsfaPJAwI64+8YaABayKPlwXGXsLQWsm1YiBgJdgIcbhkOSQPpRGqFhT55YPa4a+
         h3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388816; x=1789993616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=NDKymCxbRQ/QPyHB39PRjNhYxaMqtVsDAbUoq0BjGBd0U9pmMPK6zsJa9xJwlDhguh
         dvOTbdqNy/Uu6pJjwjf0YYlFYr58SMKdEKY51r4J4HoAeYKWeifwvYmbsNrtuwgMTVpn
         n5OQe0CeT4b32kwh3X59D328KGRRPB/vCAt/1aP5o6T2splsg+UwLyNTOQTMzNJh4avW
         zsejOSHouWM2FKYTAG8aXuBVC4KGG7Z7OBJOvqBwXXy0sxVwMl3Xuuwseo1F1CjM42jA
         0oH+Jhp2CsE8cjPFfyIdhSmmOJRs/tkttCUde4DnwlM0T/03lflAExV1419Lmq29NdTI
         Ti4A==
X-Forwarded-Encrypted: i=1; AKwUvBzTcp9Mu6bjA0O70VuXq0pNeHdHt1r57mtHbqC8p2IKY0bneCBKVMvuvKURpzyRkhZsybw/4ZJQn8TMFxE=@vger.kernel.org
X-Gm-Message-State: AFuF++lz0FZLxJ6OvexVqBK8nYsVr64DDNLONc1E8PZvvxdteayVm5I7
	4lkU8gDEILcIT8/v4z44V8p2UEp6gvaavPmUDZXh5bqFd4xDxjikfYM6nz3FfS5qRoMDNKli0zX
	OuBoO4CyoZUiOA1CJOvc9BH32liuJxWQwuacVWFx62mXsiTy4ecSwHHSSn+XmyjuLJjY=
X-Gm-Gg: AYBFou3fjhp4aPaUAIAz91oc/tCIqbCjSCdu58Czxb4pqaXqbmEvn3j7hsNQwS1oyUY
	P0DvX8UzcvaFLLmrUTcPVVdatGxjDNP1RKZXw8zBq08qikYQ9v7m/Tn+JIv4ed5ofBR6PFn+EG9
	/GDVcH+1vrAddpZ5f9N7B4zoRrum/gXXYdMfxvIfC5eTTd6tplZO+CN6h7MZdguc2fRdVAeGedi
	JVY2DHx/FeuuHtxRDZ4GJvysT46TTXfSyouoW+vVjZeTBwJj8Vb9oYJPHjpQ7rKT2qwCs/tD/2+
	X68nJZ+sN3VmcxK64dK2p7qItRkEl9KJDFKUvnG/oasmAAHFCLvjZ7xAIG3ujdtzcAaG9BSn/N7
	v1acQ14W+XMi8xXYP/+IQPQ==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr375521137.0.1789388815753;
        Mon, 14 Sep 2026 05:26:55 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr375423137.0.1789388810548;
        Mon, 14 Sep 2026 05:26:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:49 -0700 (PDT)
Message-ID: <a8eba9f8-4f47-4d68-978e-8ffcaa837022@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXz6xdorHTVT42
 aROEfoe3x6Ofs4Iqu0v+VlS7nzNlMeEHjr7xP0FHB8Pea4Bml3VDdfFlvwvJlN2sRHrv1lSNoYu
 OfOApAlXzhOaiVCvJ673nLUlmhTrEWA=
X-Proofpoint-GUID: DFj0z14VjPTueO-0qQjsfBmSb-9NKjAB
X-Proofpoint-ORIG-GUID: DFj0z14VjPTueO-0qQjsfBmSb-9NKjAB
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7e810 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4NreKU7C0iPS
 DQTlzW4ySv2MsZHim+CyT6w9yUXIPnzl0PlTYoJ//7uEFSJR1WW6jIHv//S8qM7yhEn0DFcSE+V
 T2swOVneLbtOR0iR865xymTpkCLZRhIbRMqaF3FngEbM+OF7gP8BiGS1MRdM2pT8XxuRx9hrQpP
 nDQyfK5zvD0BZz4+mY9KlM8s6rX/6VyvPQuk2z7+O1xKU748dUPypwN+xM8WV4HNX+Jh3JTWWtN
 IEHjoes2eLpeobp4D8Gk6klEB3Fiku8mJPBejnFZZhCYSRWvY0YyqzdlN5Kej5oU1bLSDuRoxnr
 XJxLhHNXXfVWAq22XxPcQCujQuCBGYXrWyHY88i5u/W7kly3qs9D3xUsFzL3FTG4USf6SGi9EHE
 ZyhfkH6hsaiLdg23FC0bto2TXr4JwJP9tqbHzVFUFLVY+H/N2uL4Hch6IyTABbaPF12nXcwYbdW
 x8ApIw1KbVeLjV0Yeyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
