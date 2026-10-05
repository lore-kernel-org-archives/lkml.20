Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA5747143D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193836; cv=none; b=SnqH3DTbGB5egBhIc/lKKysTwZh3Bpa4It8ZZhcZ8tigwo8BUwMxv36y45OsUeIadaU7ykHwF5JgHo5w+/vx/s+dkJVguVEAqJ9BgxVFSeLiAWsKnHiSRTRDNjt3mid5wVao8AZH5DSsZPGUPmlL2WpTPa0eEx3so+aZZBBofjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193836; c=relaxed/simple;
	bh=JbK2XciOCAGYGhh2WwFKNXGA0zTsF0JZw6rU+WHZCk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mERVEmBFCXOKSqLBXxVzZouNY7h88AIBnCpd3E/OYv2kly4lquzLvIzDgFsfXnrGlwGlrYAs2xhuRxQgYOqsLJm3MoNRefCEi0c/4ehRPRwH6nML6no+zncyeI4dNGJRLPIOii4G31nLQAXiO2gY4P2HlOzeaUypLsMurFG69Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3iitKEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzSgbiGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3iitKEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzSgbiGu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xRfQ1102602
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=; b=m3iitKEdTX/pVTGo
	uUcpOEJe3bY/VPfBt3uSLAm6zg1kRHO0AHLTCTXe8J8r73ynnZBJtzJrM6E0JgsP
	495uwzdnV4ycOpbJ3hVKWubpo2IT5/VTtTWPJEiKVOSg5wvm1AZQLYIFu3DI3l4F
	PngAUyq1zI9G3o2TLAMj7f2BOPfsPcLUDI3fbjTwO7EAHnG0vK0KNTOXPRLYteQX
	4pVIRx48Xco+TxfpBkYtPpBh+tMcAAr1vBkl2h2H928ukwMv3HwTnpoRABxyuE53
	ALN7AvhW+pGP72JhAWi63OueSIAWGwb5o5dqiCrb+c0N6ctL0jCaI+K24aqaBwhA
	uSknxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu5abe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:50:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so1318074a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193832; x=1791798632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=;
        b=AzSgbiGukSsAgKxhD4Y1q1+pxxDxBQIucb0IAKIFQYQilJt8CpSZGxnFP4F8TuGp6j
         yFAtOGJHKbsGqlpj5fi1gtweb9QuA5YIzxGEkDxSAJFw7+sV7rChvqoh8rOSh832TE9+
         Y1t9r6nnbgab9avCUV/pe7iTXqeDXbxbkD5uOss6Vc8uPqTi7xzyfx4vKmxEyVsgwPDG
         kmXbXYFvS1uJtw4xzKVQ86JdN6eSSb9D0yEAVg1kUqtLbYRVcKDb5Vi64LCS4mJ69QAA
         cS9GJsij1xvT15qPJL3J3QDqTfTk3QTT9M0e6RWO4FuVR5bVmgdFXirlErSTufY+xXns
         JBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193832; x=1791798632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=;
        b=yDdPFL/M/7vEdB3pEKhxclGvPDFNAUICoEbgEb//0Sh1+SJ9vp8w5IISNTA8rCol5v
         wD7MMImeNyOPDwEBCwCakiURqZOn9QvRaxREpAxfwj1265kQ1yAR1wyhOqkv/woTEGV1
         Zrx7ILOyPgXSPPF2Cl0atZ+VWanGKb6ytn8lxuY1VWxN8wbGIXUBGvC60EB9tReWS6G/
         0acnRJn0mAZJJnQEfBp7bgs49FJcoZ7+rnAY3XZFUqxRR/lLqP79rGjNNLKReZFibLQ7
         iBGB0e6UdxbRaJsYF9PIVaiqeJYbgVy33b2dYJ3T3DVdc0W11OP2DISVCLjDmxK69Okd
         TXDA==
X-Forwarded-Encrypted: i=1; AKwUvByvqw+ruooYiiLx17eZdod80yYT3/sRTDdypT4L6mFHqPL3KqgWp65bDu3on6DLU/niDVTpaq9lpwoiM8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYINxs2/JtAff4dlWVR2WuHI+7Nvv1WnU6f50gu1Rk6ilzNDTvzc
	McIRpYK/0Z9RyzQqMoQBqs6kQE/S5Q0MDEp2dWHkbm6JEWI2XTEhVJRdg8k+sv92qqQJDZC5c7m
	DMz+Xr+k1KGqYelbPX7IiaQCrVOGt3jX58/VBfTFrUQMnIET1oPNEoXrVlnzt0gCRtps=
X-Gm-Gg: AYBFou0aajx5j2YH5eNuUZFzcnFU+3u3bEilv7k994CETIeIhvysRxcdE0YkdZRQFEt
	R1o0tji4XwROOvGnvg20gr21amGfyNRdeHO3sFcVz2zpLo5qHwJD28UNiUUwEP8/EqPeL7Wo63w
	foJN3xtDqDKL9xGUJWGgKenED1UBlcYT7qTRkoXm98H8FBywE317ejXb49MfpNKdOlG48t7ZDIC
	PfaF88F4p6VZqpJS5OZnnam36jMqEUyQZo1LMnHR+iYpTKyisRx0hIHBDM0F/o4YIY7rxmrSjYf
	ejvCgIa7OGoUEwcojh2Jerjh0SgUeTEiL0eimxQiWiXVzMg3atN/DpEfzLwtMjn2FJOeMeirPKk
	lKn4/aKeponPVUOgQ3i7kqWXoIgs=
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr3933988a91.23.1791193832027;
        Mon, 05 Oct 2026 02:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr3933979a91.23.1791193831490;
        Mon, 05 Oct 2026 02:50:31 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4a1bfesm11565317a91.12.2026.10.05.02.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:50:31 -0700 (PDT)
Message-ID: <9f049a54-96cc-485d-85c1-58ee3c1cbd2a@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Relax PAS iommus
 item limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
 <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>
 <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX3DDUjTUMHFq1
 +EmtdH8glibf8ZFWaD7V5LX+U288KApZAVrKvgbV07G9TBHE8iLhFKMVQrTnw63++Sm2UUAHtal
 YVZT4B+66hvyGMFkNevL0pBjd5uMOLOeXvJnQekPVcHCms2ZNyTbOYYwJLc+cjZ8NyXXP1SAjc/
 HLiUEsJincsikdXHI6jb7RsqZThYxq4WmZNbTmnBus2BZs11k0ZWgQ08yVD//oFGCbiAsAY2BGT
 xRgeFKmDv+vzigSl1dniQxb9wG9OXj/O5SSwtp2LY01LneCh+MCh3kaffi9Xi2bxWC76BUs/ieZ
 nXcrBB1tzD1203WAQet5X+ieThjlwgV0g5/3Ctr0vTHhPHy4IzZjH2snD13uMXKphGJxC4uia35
 2nRXYSC6chVALYmzxyYbTJ64U5LyfunHdqBoZRqLPS3l4anYoU+3D/mltkjo9AyyzRPsWAQWxes
 ZOOx/oGGOtJDPwFUDiQ==
X-Proofpoint-ORIG-GUID: PXUmcRPoBT-MDxmDDeSe9MftFzJOq9MX
X-Proofpoint-GUID: PXUmcRPoBT-MDxmDDeSe9MftFzJOq9MX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfXyJwDWNCy1+Mt
 Wn+9GiMbXUG2d+uGLjKOK6plWcqND6O4DKnhx6mAGwfRMFwcD6kMrfOsZ+EQdyqCno2EaLez9f2
 DBp2xlUNcGztvgDePzbL1cVYRQI/UK4=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac372e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CHHwcf0ky9qZlHHGEQsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039

On 10/1/2026 2:03 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 05:19:03PM +0530, Komal Bajaj wrote:
>> Some PAS users require more than one IOMMU mapping. Update
>> qcom,pas-common.yaml to allow up to three iommus entries so
>> PAS bindings can represent multi-stream mappings used by
>> platform device trees and avoid dt-schema array length failures.
> This is incomplete. You just added two more iommus to all devices. You
> need constraints and proper user of this.

I see your point. This change relaxes constraint for all targets, which 
is broader than intended.
I will rework this and add required Shikra specific constraints in next 
revision.

Thanks
Komal

>
> Best regards,
> Krzysztof
>

