Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626825;
	b=uwndqwuZvld1HAdbA2RA+iXqM7GM/kPRQxxHSwSS0Dh6OhpKuIc8tL+N47g1er4iU826
	 47cR8UPob1uqB53BD4YXl71HU8nCle+0KwuP5qDEna9fE0gKE0yKPNEQdNXL1XplNKujU
	 cGHOZ/vZ9rTK9muxF/YWQlT5jPNf6aL2Ajc0aaq/y0IgM4Crv1ll+sM4Twf3nHdzFSAsf
	 S65ej/UCRgMiR7IsbCiDVPMc1YvdjKrLHGPu/h1VeoFagCBKQOlr/AyJR95gsd96EwfxF
	 tTpgnJm8u0UW3gYQOpuVAoBeIa7ZiQkrUkNkx0guIW4yKxW5yaFBEUAnrrtYxu4VthQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MnaUQhO5JAaxIur7GOA2e889cogxOhGTawaHy/i7Vc8=;
	b=33bExJLzS8sOPsWiZ8cHfukM4pRUBjB7RbZQTBfFspdnIKWp5BAOfjdKoz/5cUGZyvlL
	 6vT/EHucs4PhWpLSUPteYbQygs1lExipWodyv64QSqkyhevm/mtsn29n31Zxo1plzFg/h
	 PcEk0/TYKphnigSjb4i4bAhGZSE5pbKE50I+sgZElez28CShIv33ooDVlS8o/dqYQaxJJ
	 9zcouLROr/34o+bAgKGOxvYG4JmMVmzXsj4Clb/AJyvOWPr+BoZ57I3CMi/QwAPWdaOcI
	 6xLFxDFTulLGcLwuPdOOHa7lyMZ/lZtG50DXCJfpehl7jmr7hl46NNg0X+8LiYCQkAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ler+eN+Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QWOULsY/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09926606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09926606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ler+eN+Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWOULsY/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DANGY756970
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnaUQhO5JAaxIur7GOA2e889cogxOhGTawaHy/i7Vc8=; b=Ler+eN+YjCkhQLwC
	Jx4aCWfAFgFnHH6dJ5om1/Bfmw9AjlGHN0WjjTW2UYKAr4QtEHZJfQ3T+6wE3Bxq
	wulHzpI+Lysjpvl3fap7jO1YucjCj2omV/QnKh2LjONg22oiARa/GHBoF9xsrA58
	ttw7CeFYYrv1GbrxE6T4ys4xTrNl6WSuftmClwMc7IVVIp+Tmr3XFaIyoPMP/eRp
	aZ8/Cz86g16dMSOFIeyN7YAAf2qCkf6bs4Rgisy+41VcNizelowS75Og4rH9kl9v
	V3Nk1CvWJsQZQp3sMaHvAbmC/eRYpl2b7JAScRvKH3ANeeq01UfT5QEfSV7y0Ir4
	JMW7xQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1su91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:40:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9821ca96fso49383835ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626824; x=1794231624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MnaUQhO5JAaxIur7GOA2e889cogxOhGTawaHy/i7Vc8=;
        b=QWOULsY/ZfdipyCdBjx2vVJgyugroODxykA91ndELidHMj1TYOrHvaUbiNHUtU4TfL
         BD4VdzDWbMcfn3IxASFFM9z2L5eRXX+NOZlVauKlTnm9+olnJ9FBOGx09n56ZVmk18om
         EUFh9XfV5VkWdM9V5L9cD5lWvsXj+TZL0ZTklDdMHc+b7kdlDUaYG15UVEbKB71b14ZH
         Qk6aG20dnrmg99GTQamoKG5ixJpBoLyW4M8J0GuBwJ1f0+4szTat9LvhH1hrLo9pcX0R
         TJnOKmR3BgmN0s7fL60ZtOOT3qNxcwdMUAFLOWDW4ltBpPJqZvUmGRD9XqZQpUwz15bt
         /l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626824; x=1794231624;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MnaUQhO5JAaxIur7GOA2e889cogxOhGTawaHy/i7Vc8=;
        b=q6FfFEA6Q22MbQAlNfO81dnyFWsd5XlUeD51XQLodVGWZmK1xo5qk3mGxxAsY/gOxM
         JeQbKFHiTxP7TaCuyuGSMV0lpnIAo0+XmROHYqLtUwCHS9KgBhC52HrFAAXApOqlrcO5
         gYViLrD+ts1V+ugmqdYZZPpOmMapqnEbWZgiqvv+vECW2K7U1YjJSrFw+YSudSox/jJv
         dRUexhxakN52m7aF8q4Y+IW8Fu8IhnWNTaNmzGixLCnwb3T1vKTuupbZCmLsFZTpuxmn
         R2EiVTBRNyi51FYqQJeMY5MfUA7M7xFHR1gxWaE98tsST9ocLSg5E4HRw02mJv9l0OEm
         S8cA==
X-Forwarded-Encrypted: i=1; AKwUvBxlL3kmCK+hwVPwJCNvYXpat+Z0PLGNHjbN9xvIen4+0X3E3BVYbOndHEIG+5f40skthzb8XnzORlCFUkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lar/b5JdxCcq01gpixDr3Fk8eCwBPNfthlgOxSxfzTTu5u7KR
	AAFZAcBRqYasKYA4LNXGu++UoRCaacfvAfgW7Fk3Ietjmi8jZ8+pC2PC9VIupadCZQrTLjHIGkb
	cfp8VrH2QxyzeNb/kD9cv5XeymvnbM2vF/yInWAx96OADO2q+V+yqKgprHRXjI6f6rhw=
X-Gm-Gg: AYBFou2OvU3i/tvXXkc0Uxiud4X63a44/AAZ8bo+DFw3gYrG79UVZGjBLJYnsbWo0RB
	MgICWuHORN1A7dDrW8LhLos8q/v8/WBiDXcsDihWGC3Cd/ADpVRXYTpdW/0AcqZ8f1UW3f7FiWj
	3tiA+0XQlVjnRmyG4gBe6s7njoGpv/FPKHio0XC4+oZshsjXZLh7kGzjqPeXOKC/FC9d8JHw9kK
	xvG7gue7IupHkuPYm6Q6XdQZa6epNz9nhEb9kaxe/Zv7oysxeJFa1P5jFub9WyITFmezdpIiV8T
	LLqI1wITx6S8eHIkhzTiJCJEzyxrha+2ery92ADpIkzXZN09snD9Dxjre6bs6Fh7OP4FAya7BNt
	i3XoMEW/dluJ2bHVvUeyZn03fY9AjPDxqywVuBNfO7d0CPnLjdLbFJcKosDBwUroBqlZeq+E2kw
	==
X-Received: by 2002:a17:903:3c27:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2eb36450a4fmr93246865ad.32.1793626823579;
        Mon, 02 Nov 2026 05:40:23 -0800 (PST)
X-Received: by 2002:a17:903:3c27:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2eb36450a4fmr93246615ad.32.1793626823102;
        Mon, 02 Nov 2026 05:40:23 -0800 (PST)
Received: from [10.92.207.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm27952085ad.62.2026.11.02.05.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:40:22 -0800 (PST)
Message-ID: <0f3572e3-e318-4f4b-894a-d2c16d8429c7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:10:16 +0530
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
Subject: Re: [PATCH v5 2/7] tee: Add kernel client object invoke helper
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
 <5d260732-c586-42b6-b7a1-e8eca9c41229@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <5d260732-c586-42b6-b7a1-e8eca9c41229@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 32C30Z6Gc4iOWKYBU6jOW1npdBtyZRko
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae892c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KkQ6sNVK5zAhvL3FsXYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX5jwxBXVxgekf
 YwLl2tkKQ/edcrESGhhIlbxF6WPiQCyF9LH+8KuZf2s5/IafGqArSpG4/+YafgNgEhcHdB+bs2A
 kv3wrcz99BpmIHVd+Xf34U8TXO0yiL5hjAq2K2itn08e89/j5wKW+bdVPra2OOZUJPvV0GMHqE9
 nLfWeYkmDMk3gmjx3nMtDMiCeMJCp9jgQVxu0ScZVIcaOKs1xLwd0+SqPVssiQ7ElrCvETa7d8L
 B0EJA5oZ9dlQ08IS1k7QkkntV5uwa1PWbWFeLlJjPlZ3GnjPNtXDtvvlp422/KQ0wSZXjDOX4Gk
 XLonO60B270VzB4F78cNFBuxwKiAtpVvfLnfdsA5wWyqxwn4djQJ5t4gDMpX8uwoLkACaeZ/idd
 6RAWegjcuVS3HyqPaIFYWo0gt53/9cPCqHKCxYXIRFdAST7sthxVnzptYrL1liNJLRethvz76ty
 WUImPttXScvcvwSnlQQ==
X-Proofpoint-GUID: 32C30Z6Gc4iOWKYBU6jOW1npdBtyZRko
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX/jxG87lRWAmG
 G/M691thDhdMSnBzZ8HAP9t6Ts7Cdaxiu93F7g72FR/SWpWBXVnCMHU6M6K0OaTZD30yTheebfl
 ZOaqRvHYS4fGM2Qc2ahsOlI5wxYbU2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

Hi Amir,

On 26-10-2026 08:39 am, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> Kernel clients can open a TEE context and invoke regular TA commands
>> through tee_client_invoke_func(). However, there is currently no
>> equivalent helper for invoking TEE objects.
>>
>> Add tee_client_object_invoke_func() as a kernel client API for issuing
>> object invocation requests. The helper checks that the backend provides
>> object_invoke_func() before forwarding the request by setting the origin
>> as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
>> privileged object-based calls from the kernel-space.
>>
>> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> I did not notice this patch has my signed-off tag already.
> You can drop my Reviewed-by tag.
>

Makes sense, I did not notice this because b4 applied it automatically.

Ack.

Regards,
Harshal

> - Amir
> 
