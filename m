Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377469;
	b=h4CKsFg/wT+7a7jqw2btD9u9xsEHIBrNqwtw7z8LrtF2stUzd4QkjK2rkPqKeye2I1QL
	 E65FWZXrbS7/iQ7KfpQs679dMiKvm5MLlJYULpb7Ak5/0z4HyHxb8gxvraKAvoaSvFEYw
	 L/aylDR0R4LQLfg5QPz7+MP3Lfdeld96s9URzCYkSXOpsKlwsM+pnQxgw8xfkAgL3PCTE
	 BsVw5j2mYEE6gmrhb0HaKC7EV2rpIT2z2XtjsJgQU84Xlo1d/QmXYWwW+v+Jb0VW90VQW
	 xDdQ5tVIN6zDwq9QLN3a6FSzDjxE8fRbE2ihMofhGmEsrQZgGLujh7CM3TzLCRusC5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
	b=ZJcg2vD0EySfWOLZkgQlK2NFlJRoSnkqVQDJ7j+cq21Mv3U9SeuUkEa0Ryr+JkG06aea
	 jO+CyTKDaOpXQVpxvs4Tx32QvRPRBBqm9OIPcGSTwIMOHjYqiBpRl0XQlQislBPzgDkCz
	 3eW6WMFHOgWRNOU3WPXU7fEvM/0CB07yDrqMfTBdd/jNtzMMKEfGGHWIBzmwNV8oKKDbU
	 fcRQSyTxcVu1Y9qczss8ncldT60MhMMogkTQd5/bt5CGMYyLAJObsiUDWGuRzmJRlwzWy
	 YtzK5uvhcYWbPTbJPzOWsV6r4TP/56rsP8FT5t5pDwfKd3g3+wT1tRmcA69apz4gWFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OggLu0l1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYObWsBT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F15606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F15606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OggLu0l1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYObWsBT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERDvr2494773
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=; b=OggLu0l19vB35JfI
	fw1RcPInZWESMKS9U5DKkhLEG8l1LF2tT7oPbrZqjqlxyoiUqe4SkHI4x/X4y+yb
	qQgvSaro1se3m2HPvBtmrEsPVbw6OOtH86KDauTo0IuaWxdOf246PhdSIBAU+AZE
	+2QsV2/wjAY/dLX8I3aXfpirf6dCWaLzxELZo3GoQVP8+qYPWaE3azP486Gl6oHg
	fK+Rbp4349jfPxRGwU4KfTdw55vTMP1YTyu4YG51gMwqQwXQsD2J9X/539n+/IXI
	6TVvflByLMzCF3rqDgYVinwsjPd4/KuiKC9EEPt25Wm1HfLXLTK0FaR2RFYWA/Pt
	AyHkEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p418d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso2708194eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377467; x=1793982267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
        b=MYObWsBT2rCngOHupw8onZpt3eWJgFKK3mnsMINO7YyAEcDDX9CummcyoerQm287MY
         NTePABRckivOolrEaPgB2eqgLlwjRyXPn9UVo1DmeZ0mpzgPx52e6tVGyPLKp2SEbrQT
         JE47pI6pc6GgldL2BLmxoy9hwBe5UfaEohWRGKbwh46mqtF8KjmDaKDIGWaZvPLtq4/I
         pY9L/fvH1JJ6Vp9L+DZ8OU+Z8CZfH8q002shk+zQLK6u2DPDzaTaIM3lhoPsiIBKIbaT
         HjcwPkVsJNmFAxkORd/eKefd9tPcDRsQgNg/qmukadQnV+4Hl1annFXPXn7YFFwU9X5r
         33mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377467; x=1793982267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
        b=lfx3d60Zk8RME5NSW7+dE8x4SnpcZY43tig11b61+EK87JJ4De2OPVgPW2BkFGfMNS
         no8neSTUMV4D9LeYlqLHD+EGZkKWUUhwZZJBXmmQlZUrmdSvUVBig66aEM6ZmsbuZkhp
         D0qdsaZAo/i4Qzjo7Nzx6awgStaNSqhNF7zK4PjDxn4M6zLHcOhAfmDUwn8WxambaDcF
         Fhh7n5ewVrGFeMSTwN2LMXSX7alr9s0ZleND6pcKqFOl3iffCHsemFWnQhbPMTn9vd3D
         AYK8BNWx7MJQ2Rjx5LqQCkbcaZkT5RyZTFVAOcxkaQ5LFwj0EeXH2eE0ekSXCyRjJtjf
         jT3w==
X-Forwarded-Encrypted: i=1; AKwUvBxb0SivLV3ynkv8G2eBPC5e2webXvI4Bb5vY83IJgvQnXistfVZuMKhxoa9x73vqp06zJHgFLIns4qeDx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFPt8ndFP6LCaa6A3NOHLbkqrgWUZO9Adv5Qn2hBp65trAWYmc
	swPoSsneZ4WRi0ILHeAXDhAlBpt7s0Z990IiDqOoam80qGScHm3qWyX+kEat3YnQ9RPuCZp+uRF
	3jkAj2swhcHjwvtR5iG+H2S8+YV8y3wYgA8DjmAPysHm8LL9apR/U6X/42CUi0RLwuWk=
X-Gm-Gg: AYBFou1b/p4bUYB2ZKGQASVox9YYHs+id9YYwGnTsn3DqbexKq6pkcKyWKGMcQnStMm
	QR3/S6tiiGLwyqLde2AyhBTTQu5QJ122qDAUOPpt3zeNJ8yxxRlC03w9rYwaJFs6wl6z6QhwU67
	B16bj8LPa/rDkkgTYZ9vm8AYloSQKgx7s1IDYqZtSJttt8k7b6KPDqCS7NmoMzCnf6NaF11HXJe
	l6QvwzwBxrQxRJD6P0rmv2O9YhJxIShAUqbhDdyBYFEsgI4Vv/Ot3Y8iuQZMXrw09gkDn+BQmCR
	qDOeI6letPrmzbv70lqBc+YlW3Yhgjtvrm/EOZQRi4m2xDe8Yifyb/CErgaDqdqwakL7uK1/2WV
	4BK2u4K/dWAHVai7REt2V+T7s+qtL9MtWdl6d/SrDdLHGRDc6UC2NOxYBAuoMwxWpaR8G0s5gMd
	0i76BlxVnzwdUyNFydxeUjfgs=
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr6857195c88.26.1793377466918;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr6857150c88.26.1793377466102;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm9468350eec.11.2026.10.30.09.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:24:25 -0700 (PDT)
Message-ID: <1cb4d497-73b7-4148-ae40-259c57bbda4b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:24:24 -0600
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
Subject: Re: [PATCH] bus: mhi: host: Shut down the health check timer on
 removal
To: Myeonghun Pak <mhun512@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
References: <20261011185134.1759331-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261011185134.1759331-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX1mdDP4bRkZYk
 ZD01NAKezOmEmGHM3TUXMbaBFTE+effEpROSxHK36aQ+ftYHsP+R79SMWWV81nfGF378Lrm0Vjk
 i8LnW+0ci/3Gx8Ol5LGw65of0Y6vvzhKif3Gx+H7ROjhByDNjkUq5uOVb9BPiwwe/JiXmPLRcLJ
 u3/ACayO39VsmSmJEgG9MWVjuYYZLDVNn7k8HoBo0Y7M3DpY9YB1j4coUp8RgjsklThz8pIqJLD
 F1NMkglM9jFAYS853wJ8hjwtrwMBOnI+kx8lK18VNu+jwED1gIFPR+A89oZNEa2F46sxfxKAgs5
 c6xM1CUVCPte4MlI8K3qT3Zcm29mjY6B4RZFRGFNoyLjY7/9mLAbnk78rCm/Gkwc5wuja89qWW/
 ZF8lb3bHVF3fcbzhyaWYpChvohF9mko+H1J8TmsG3fWtmqE93jXzwZzdr/ixa8vj1vXRc6Mvr14
 IuJ7nifEMtRlHVWaNNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX61bG6GfsXT7g
 uXdg5AUaARCkfGYviZXK2TYseusNpM5fUp+ueY5xPhk18c/Vw3aSkugRwDZLbM7ekrHIb35su+g
 XhWUlkBhc/UBz1sw3Edw5NK+TP26cOg=
X-Proofpoint-ORIG-GUID: KyK_rm1KelxCVd2dPh2nN2Cso2PVvDYY
X-Proofpoint-GUID: KyK_rm1KelxCVd2dPh2nN2Cso2PVvDYY
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4c4bc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JxfxcCzmXtKzj0Cw3IEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300065

On 10/11/2026 12:51 PM, Myeonghun Pak wrote:
> The recovery worker rearms health_check_timer after a successful device
> recovery. Deleting the timer before cancel_work_sync() does not prevent
> an already running recovery worker from adding it again while removal
> waits for that worker. The timer can then run after the controller and
> the managed mhi_pci_device have been released.
> 
> Use timer_shutdown_sync() before cancelling recovery_work. This waits for
> the timer callback and rejects subsequent rearming, including rearming
> by the worker being cancelled. Keep the reversible timer deletion used
> by suspend and reset paths.
> 
> This issue was found by static analysis.
> 
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
