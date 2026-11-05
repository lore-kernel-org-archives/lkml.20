Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892745;
	b=cEkEgYJQ6hyzSYLssMpNt+SjjW1EdwnoeBOR4NVO2IkDvLZZRNiC4dny01lchTus00uC
	 LKVjAs1/fiO4U5XOUxzcF/bTvh8YHSeFl9jpwYSCaILsIY/wiGFR3/i1siH976k0xppxC
	 Rq4tJXn48FjKn/FzC16veodIrj7yzKX+dcdJgw3hdpE4GkyvNaDLvx0F4+o9BMeC1EYhq
	 M7F+D0+wH0IG7N+w8Lc5fxod70VGh7+13Pft5wXbbgaYzmeZzLslox/VUjsQEuwfBWNlh
	 Jc6K7f9lc6ZuqLaGn8+MTyCFE46gptsZHpUN31T5iZJwpjemKk4wUdi+SYsmrNez+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
	b=V3Z56MXUu390DksqnoBSlvMx0+TPeELlzQZtxU0vj6KzOQR4/Bypu6RQ1oBkETDDqA3y
	 P0fpUScHvlG7xpAG3RDNHK9mG4pkgtEvb0R7rBXJly4zok2Af0aWAdNWoXAnAVFOurhto
	 1CC5GNILGa4Y2WMiZNXC8rh8rqYW7/aaG3qM7FKJqcYW+xEFpmJ60Wv185e25fo3hD+25
	 pAlvJLBZZdmHoSGU7UcMNScefzx5bCFtr8XZuxM5ge1TZVmRMuhxN0OWz3SF1i9vG5730
	 snnQJkZd6m5SofbvSv16qgpnguk8GYO/Wk+MpAwhl+XqBnCRksagsQpIdjGcBcCaeGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1ILuSim;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUsEEJqA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55742606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55742606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1ILuSim;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUsEEJqA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ7fh4133965
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=; b=p1ILuSim5deoO8ja
	3wphI/7Nsrgrqxx/+9uzSfHc6ihiO0isa17zG0dIcmjBGWCIGX3RU5A3vPW0Of+Z
	zSGCJNAB4ydNwylGt4IqRlyIdK772pN6VFyPJf+TIvRvvzawMEqD48Zufsy500lU
	VubhVlKSarv8F6EkCPH872vYZ3cSJoY89UoYVSApubdcnd6RDJO2UnKeGFvYYICp
	CuKFeG0Ccl/lQpZv6Fm8y6DNZpuRQfpmwRav889WXfIwZFdWPmmFg7moo53X1wDB
	OTdiorrPAVhsTwtpr+ft+Tf/Jg4bdcg9+1ooCmuyqK2aaebKn8G69z80h1MuY+9P
	Sgg0Gw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqadd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:32:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac41ff334so1920426e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892744; x=1794497544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
        b=iUsEEJqAEQ/1hYUc1sK1t45AlgNgX4bjkphvJjO01DQCT6acITHmMj0md6xEKoCZas
         uK7NDeTE2VIcycrkpkj5meWzPhLKE4SPp53B/gCvWovvqwUpOo4/ZJP15skC6tUY0mmR
         cjuIvYXg3LrCXWFRncgriN9gaOhy0gKCKCMf6jGW8rDR7jIKUpZHZQLwv+i/N+r51FOD
         kK9gfTKhoxPrMhQC3mQ+XlXshbAgCF5xFmXqAXc4QvCSKj+xkDcwAIbnmCx3lIieu0/t
         zMeAXMH7KHCUXam/0rSxx/3wn6On+YlSQdhdoQ6EhTON1VTF8ZUgDjim2SZQafAEpkTc
         NwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892744; x=1794497544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
        b=2qL7dOJc/lv4Ce7ijt6EykQbmGEQtX/TH2S/mcyMibgbGsfSwqw5cPba/axcLiyvVa
         zgW3AU6YhorJdVlCg2esc6fyYt3z2a2eHNvPKZZrvEdEYKmAHoiPtfogjtaxeaiMYKox
         GPPYJw3iUIQ4KKXBsSXtiug58k8nkUWxJLXgZ7ehLHGZ7xaXwxSZ7l2BsVmkU1RWKZtX
         elti4rkWKjNzgMeik1l/FJHX4h19LSGkq4DXP2hyJQkOd20eAi14B0iT51VvdjZFVpga
         z68qnBxz+jdzqUvpDnLqKFfVr5pxZT1e/TbhQIJU714CWk+l7uuDn8D0iOSI0z6v9GeP
         HhwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyaA306tlIUkVvQoYRkGGy4vGUwp57c+dhk+d/bwi+50G3fRrJae11RPYH7TI8LruCI9lOFrTmJZy1gV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ODosg3ENFE/O02ujxsRNlTb9uQZ/vCMOst0NuUe5+Wq7Z3B64
	Ma23fmHdsx2EJckRhe+7ug6G0onnCd73aTxdQ4juTZjPm6y38Znx4POUr6iHFk8/tpfEPZyPNv1
	rNqxsVwAZLoYgvedXqu759OjVH70CaTAA5g6xaXLvL9lkgJHv4FnI1RdlMuRR97hUwC0=
X-Gm-Gg: AYBFou1LqtGSUKXv+VDUCFbsI2a24SnW+RDIX6lYmLvHfWh+Ds9QDtbsfkVM9QZiIob
	HMRgu+bVHxjwEImPdZ7uQSoYd8eU8dQRqZ75iidoumC5CTbIoGtRyJprjtnZaMAIjMcuDw55WdM
	ND4v/Jres+vuzeroREySOJ4htZlYSIQkfRzIBxgBoiQ9tjp/Z5+TitpAly/dQ4Zhh6doObhS9Y3
	xLZSf0ND9zhtozyZjTjow6/F97DyOJ/B5XlskomCUSaVBRbcWbsiGMC9r4qoAczfk/261lhXnQ/
	JUcJ/j+POazOLC6BCgigRVt90FKEpDoLpNAqmT+gvSbkVhqkopCPDNmEUIEHr/d2tW3okdD0qzI
	42RRPYpP88Ug6NqIDx7kanfkVUS/H9QL7mAQCtow4keCWVEHge9kc0cUrl3yviF8OjPpIfNXFpa
	i+6MT6pawiBSDUKwUt
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr9780602e0c.3.1793892743673;
        Thu, 05 Nov 2026 07:32:23 -0800 (PST)
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr9780528e0c.3.1793892743105;
        Thu, 05 Nov 2026 07:32:23 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm70424915e9.1.2026.11.05.07.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:32:22 -0800 (PST)
Message-ID: <6740e6e8-6b77-47dc-8b9a-b81efb557664@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:32:17 +0100
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
Subject: Re: [PATCH v5 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <d33ddfe789ee42a00d3ff3df55e0c4011e69debc.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <f018a2c1-2618-458d-a95f-a0cfdef9ac39@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <f018a2c1-2618-458d-a95f-a0cfdef9ac39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX22Xibt6X4rZN
 qWGBICqTMbymo9Z4x6z46p3ivzQGL2/tLLQhjNnOgd6A1H5hl12ChHQVx2avVmRZ6RLtBSed/10
 NGQoQW20sdobWA0M4ft8vSKZamu1qpAh/+bzatznBaAxtzDCSzSMuIQHUpwAMkUA/SyFtEQ/zBi
 QGAI6KiJq85S3EikeY/ndjNZLwh9kzmnjM9II4uvPW/Ix6MM8UxrOW3ZcY0RSJI8Ea3wOJGy6Tk
 gQrA/7u7wRMaa6pMRuUvDFIwLTX1gvWZf7/l8QEb7R/lX4sMUDOcSxCdNtYdZI/zVoAE3iNCrIh
 nNIQDDztSYKzXY2fnMO2RiOZCk7EN9rt7A+XylRyGLA9ok1JTsxouVcQAeDktOtYGg8mILE+CS4
 rJqJSWACMKFqiG35C4Fir4u/BK3gWfTegGcHFfTjH0rqfjl6YeoQKQJxKuQ4OPtBPuZgOZFXaB4
 FSnPoarXf9ckGBJeKuQ==
X-Proofpoint-ORIG-GUID: 1cv_Ap0QEehEwXwbz12YK31kiIXWYp7M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX8CC7F8qeQxD+
 LrLrjhOyCOdIwEXL/EohkwZ07XxtYdO3QOre+GT4Z3M1chif7SGKTdsa43eVskQg/xFSo41AqiO
 kCjihDP3I98qO5iegHvjg2nFR1jOkkw=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aeca188 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=49fcMjTkyU320Q8Jtn8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 1cv_Ap0QEehEwXwbz12YK31kiIXWYp7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050061


Hi Manaf,


On 11/5/26 10:35, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Daniel,
> 
> 
> On 11/3/2026 10:18 AM, Daniel Lezcano wrote:

[ ... ]

>>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>>   2 files changed, 409 insertions(+)
> 
> I rebased my Qualcomm SPEL powercap driver series on top of this series 
> and migrated the series without any issues.
> 
> Tested-by: Manaf Meethalavalappu Pallikunhi 
> <manaf.pallikunhi@oss.qualcomm.com>

Thanks for testing !


