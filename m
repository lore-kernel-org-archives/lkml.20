Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A809C3876DE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564404; cv=none; b=KJwkFnJTqPAn6YEk+z2k2ds3B/o1QzV5mdHz1+phs9fLAxPB15+LNxxQh0fwNGJ6RLiPvRf3pXgiFJP04/g8qgSVk59wJbtju88Gy9cwg4hA9+peHlP3rPiuYTWrRHhsZ1aA2Ku6J5jRIm9DfE3cIgLN3I3Ug/XBytmI2D8N8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564404; c=relaxed/simple;
	bh=osFV4H4Xp1IQxqh9nwvcTfghZU179nh6yClXetbmNpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbW/RjnYl6TQgFIeKISZy103vdZ/oEDUHiQsPCuasWGxJXhpftfXtzY8Jc66C+akFQJ6i6fjv5rFgfpQn+1w5j58VkvAwm4Inzi9yvZQ44tNWG51B8oWd64bco0feElPWnqVlm3tz309nLYCYlxyuARjllkvIfVTUwyiR8Md4ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9wzBeC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH/fXL0L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9wzBeC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH/fXL0L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbhrP3458994
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 16:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0c+hPPuZJMciduKCB+7u2OKS+iRv4VIoibS22JskZXM=; b=J9wzBeC1RRMLly+H
	ufr1dAWohSFu8SZQAvpumsEcAYTzglrz05mRQLXFT+dCeoTEPVtsGKMM3fQ5EGc3
	Mk91YJFGvPD4JEZi0WAjjjOXJt7JLTlL7xYEXFWXjSS6mo9pFivMiGtKy94I6d/t
	tuP+BzDWLpArCckKU/CTq0iiES+pyztqFbAKWfv56dHrS0x0J4afT+WUwi7BLEQL
	qLhDb1eL5Mw0XRBRzuYGtlsPR36U4DX//eX9V2Bu02vohlEPBboMExgoSpc0vHnY
	2dn79eOwOwzkSSGpGbjKfyg5f5kDV920HCzL0dc8rYM2m7u6+vLX428g1f/hjTGL
	ZpFlxQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwchmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:46:42 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8210034ccc0so10647a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791564402; x=1792169202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0c+hPPuZJMciduKCB+7u2OKS+iRv4VIoibS22JskZXM=;
        b=LH/fXL0LRdJyuDm+f93G8vZcjScJFamVMtgIXbZCI/2P3xcXQwd57d7AKyNNOSHiVp
         zIjoowYqdlt/KT2pJP+w+8VKmR+q5LqqD55toV0ATEEB+doRf6CfrJ3+p699Cl62k7NX
         mr0sr+XzagzkXCUfgRNXB3So22C1l5ri/+tHGUZYcUtaDVnExAvlQMIswgHRV4qujSkw
         iV9GdyshkxvNqLlic20q+P3MZ1Abfhfq0DJAVBln7/koEGpTeGrLZpGx1mnrAcuN5O7p
         aE/BA13AyW6jhTh29T+tw5BUfvcWnJ+ZWTUm1ZCpYd1kx8Xh5IcQ/Gw5YMGa66PBwY4F
         Yc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564402; x=1792169202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0c+hPPuZJMciduKCB+7u2OKS+iRv4VIoibS22JskZXM=;
        b=drFnUefPfgNX/ob2ASutxTRDJebzjY3X519V3Z8jPYdsDkDJZLGolWFKxqoR5YFx7i
         tqqlWF6XZdKvpFTitt8FQ9RTnNnzN7BOrbNCuW/4FT9oloqsI7xKhIjTRMiRie/HKQWr
         5muqyHA8V0FpIF/k4ZL0EN8a3pu3fNXv5Ts0eGkW64IVQvaxHvGGysaj3jxJGSmuBR7I
         Fr1EH7vhHcHRH77rOpViQOj85ueQZBsNM6cQuNMbbhTrXPRg3qPL2I6gPpkVLgazG/GS
         sqkqN2ot8BJsQux8xrPDIBggdHQHsc55aN5CwkHqttEPx3NZzZlTc6NshMeVeDOtMrjU
         CpXw==
X-Forwarded-Encrypted: i=1; AKwUvBzkF5r/OdNcEG7sd8myZwdnYkXCwIbUrquMmeAPF61+raItHJKvGEsMI/3fkU7J2jqfuRX6XFY1PovcBTg=@vger.kernel.org
X-Gm-Message-State: AFuF++m2OtUzIKEMPeeAORtaolelezJZvz6i2PrV47E5weGp6gxBsm4T
	d/RcqS8ccRnFxnje9QSh8deT6y7Siq5mtZOJdjgZy0L5ufFndyUO62BjdKOGpbWjfkUaOW9pn8P
	Q099STeydCgE57pMZnYMUEHiJba76FCQuat2p1TPHQxaTtm1DZ3SxLLyuGtXOouRJfFwci8oWT4
	s=
X-Gm-Gg: AYBFou2ZfUnUnkZcFZsOsBfAcKQFRfGEwBg3EIH8Ov+KOYaxuKS413jYMhQ74he70NY
	/EJMg2sbIulF7X4L5uHsha/GktRbpkhPejGA8tpIWAMJUXfVdoPyZocv0m9YC8lZRyLlAS2x16o
	8Yx991RaepQAH58iHMnIKsvSaRJxBxNS/FmuSiKz9FACi8iqdV42Q1yOKfGFa9KbKg7KxcxTR1g
	9C+EIXL1vLYuXinE3lqgnzBJYsVD+ATAsW8n9S0S5UNyXkg8BCcMRmLCzFB60aQ1e1zxFNJS0EG
	c/AhCIksN4Nbc13wRqrOhSmUSkEjeoI1p+vYnIHptCCjFd0UWFFPoYYHSb3XIGTyvBAX/OwYcr6
	kPfcZTkkwmx4H1IB8KIFYJabWX4gHeFN6HFzTKseRVMzCXIMX2A==
X-Received: by 2002:a05:6830:6219:b0:821:cee2:489e with SMTP id 46e09a7af769-83090e18eaamr2107668a34.2.1791564401577;
        Fri, 09 Oct 2026 09:46:41 -0700 (PDT)
X-Received: by 2002:a05:6830:6219:b0:821:cee2:489e with SMTP id 46e09a7af769-83090e18eaamr2107654a34.2.1791564401109;
        Fri, 09 Oct 2026 09:46:41 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-830385b9c4asm2166210a34.9.2026.10.09.09.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:46:40 -0700 (PDT)
Message-ID: <1d263f18-c99b-411c-84eb-0ee5c7b76d36@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 10:46:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] accel/rocket: Use an unsigned index to copy the
 job's tasks
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261004164727.466164-1-sidong.yang@furiosa.ai>
 <20261004164727.466164-3-sidong.yang@furiosa.ai>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261004164727.466164-3-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfX/4kRNj2PQ1z1
 jR6RelV9JyLJD47qkjd5V21MJ2QxM256EsuAGBkEi6CDoyi448z86T79BiL8mZKRbDWthlE5Vhq
 TCVY3WJFuz1mq/7qyTn6Xx7t9N0AzORzXG9+JJ040zWb8ebzqxoXw7eOP6PyWv6lb6qWqT/ZumJ
 ludFlcztbqgqi8IittUAaBAj1cACGnAN86yCYYlA7a0VERPbrusCKqCaFGDqDnFCLzOz2pLtdli
 jsxQ5hqbVqSIo2+yKqSrLIjwDfGOfZbAgzFthLQOhM6XqEBlFM3b+Gf2+fX8Fd/vyTVo+6SZG/P
 e0TM0KKo+Paixp7DNk091FlpkwuuSSDk9xCHBYc0YdhPB52ue9/W/J2F39dfBrndPPzjmF2sQGc
 s3rSM+pvCQ9W+13tC63BxtUPugEDnrYS6qVvBoGWrkab3YVs43jBkO8g7e1Os77cgxLUue3nKRl
 ID1QXe94L7le/bWt2Vw==
X-Proofpoint-GUID: tfyHZ0gIECnawfuELHSuvveuWnbDLaFl
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac91a72 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lwc0v0yrVDlXq8EuFrQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfXwxGocl34Es2l
 xTjTJTpc4ohuZkk4kfd1MjRPNbrdgC3WY6GBpo2FyMXnxVxH4d+FoaOBLsBjrY/EgI2zwZsu70U
 Kbe5VoSJwfT+wYcKM2U8qk+lPOMrh1Q=
X-Proofpoint-ORIG-GUID: tfyHZ0gIECnawfuELHSuvveuWnbDLaFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090066

On 10/4/2026 10:47 AM, Sidong Yang wrote:
> task_count is a u32 from userspace, but rocket_copy_tasks() walks it
> with an int index, which would overflow for counts above INT_MAX. That
> is not reachable today, since kvmalloc_objs() rejects any count above
> INT_MAX / 16, but use an unsigned index to match the type.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260711063638.61B411F000E9@smtp.kernel.org/
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
