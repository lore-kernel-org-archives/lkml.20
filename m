Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3604848A5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100624; cv=none; b=I5pEv+WK6LbF1uQfZuj1QpHNvNYh18mrP9pxcC6x6X3D+V/KTN5LAIDHCK/aInrxdfEm20i2Si+zRn5687AEGx9mf6fyku980FbaBwveix2iXBL0GjvE3kwxUoOw/b73qB2ZzZGv0q/g/av7zyBZhIOJYUiku1N/3LzxPN4E2Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100624; c=relaxed/simple;
	bh=Lhqa5FPuJI/7ZwHwFoc5BJR+w4pkCdSYjJUWN29IEeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=na8VXiHxpSzA2LKklKa/3VT+Xg9Qu6gMsMMfmVuq0b/0el4FNn9sjY9eHs8tBEipb6HQONHCjFH66qX56B7hQ+/T6o45cEmExD90ZyvvZb9SpaRnAIxMdwlwI2oVAooVoCFBQWv2L8kC7XY7Vt/c8lyw/sBh+B1wZkvYGMBYWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFYlyaf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTepgQyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFYlyaf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTepgQyr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76TT2033340
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=; b=XFYlyaf717HVkhsH
	x/3xzhnZ591xx/EVvHKtXKpI9L+0t46d6c21gZ1K5QucT95MNcJ5cRR746X8XctU
	Mok2bflXxqBsMLYrE0lw88JSiGXhL1pyPEzYYjrUAoU3tZTqfwHxW6SfYdgBc3zP
	pbGSUU/zsY7Nkw/z2Rsv8Go65VUw0Pguxo2Ee+Tq1bzpAQp13ta+ERJQXMoNWZEP
	h/RlRcUUQyugbTiZVvam6M237EXum+CzYK7RY0rsI4HOjPALDl5Lh4N3srgj8e9P
	v1ZqcYJNNTuSpIftuVrJctUBrmi12inSokzidqbIJP2FNGrZPSao6ZU5cDkxCIDO
	FdGuLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c05yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-333543ac378so66017eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100622; x=1790705422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=;
        b=PTepgQyrT+shAKZtW7HfZLAQgQeQyqvhRxK303mFDvKJ8w94rL3JeEEbb/TsGbysRK
         MXD9vkJaazIA5p3+SOQkh1XdOraAkIpVoV0womJ35tN6ZbP3QOudvrLzcdHqiVY4Dgbb
         r82RJPPV5dDPmvnHa7W//QxwwrE4sfxo+0ImElb6Mn62nN74d7oC9Rm913NcCmxMP9T2
         VQHv8enEAsSW2KDk+oQiBjhRvVUwIA85FoMX4iJXjusrnLVdMokoO9yGMc+GlGQmzP90
         WLJIVApfHmDuNsNszqYTHgSt4QeSjZ09H6RejES0AU7Y3yad8YXajkshljVX8OXuD8dL
         Lv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100622; x=1790705422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=;
        b=oEOmjiOKcJTp8z6s75amtwJu7LWcQo51IRIHc2/SfzfgzZYl+C4jQ+kM64ymVi6LE8
         J0xTVVE+xbkoaUy/4VpBga9mRXhIpXtMPfqNZKwrhmIWJRJ/x90xoXbJxKG7yNN0R3rP
         DhCyk6J8WES62s4wF2tPT/EUmMVDTpuvmjKvBr/LJmVBCGuE7KARDZ4oXEJAFtLpvb/K
         fPf87pXWJXCX4wzx7+AgG0VvycE9fO+hhKB619H9kIAw8nPLBys9CwXtJJahTAQ/zmz1
         l7JGnS4DomzTvQATVhli55NnywhRdFwjpbQOrsiPH6TWdUTHHmjP5Il0JgZsDK8FVVQZ
         KctA==
X-Forwarded-Encrypted: i=1; AKwUvBwCCV0NJSNN3Vgh3BqKTDOMXJcC7Q8DQVxr0RSUyF9Duy0Q+6etbQF3C453e0YLp8+BaTnapD96/3FLvB0=@vger.kernel.org
X-Gm-Message-State: AFuF++mX7mmgEVs6kz7+e8wycm+CEnw0BMhOboT2fCyA7ww2ipYmbC3v
	x8U0BrU/Irc6Rtz9Hfp/u53g0rtYczKhsTb9AOMFi5Yn3iNWwA/U8jfW4KCvjfs0sgGM7BK+KnB
	gNcLTrtIh7X915hZX9wFav9NfX0y30SkXFttlisGuCoijXws3VpkGsoy8qAfocmLzh0I=
X-Gm-Gg: AYBFou3cGWctEjUKgrt0qQT6Stm61zWMPSLaspUI0y2czk6TLnrrAaQS2w6cVkGYmb8
	r2IszFLfmxepZPSPHz/sBRGymRQYLPXGZgDP1lAnTxxH3mKMjVV8Q1DOr0h68PHZgXPh8VRBik5
	9QKN8trhWnmzi3E2VWw45Lrg8rtR4sDATqwO0SZHflqgDSTeJfGJc7172VBY+eRHoaERNmd8taB
	+kivtktwkDeFFYNv9M3ZQNnvTmO86fL5fZ/ixi+B+UghI8y5f7NQWQUy7Ool8dUgdnC0Ix2ueTo
	UASTLRpLrc+fXcb2P0uJZBqP2OUYdx2tHlzlBcSTzVXdbLMYgg8TN3CGJ5Vls/AEa6q7kF7kYgX
	SGI737ca2zTHNowXoTF6WXFH8aKxlJydPrg==
X-Received: by 2002:a05:693c:60cd:b0:334:6c90:61bb with SMTP id 5a478bee46e88-33e8e1b1b66mr132189eec.28.1790100621404;
        Tue, 22 Sep 2026 11:10:21 -0700 (PDT)
X-Received: by 2002:a05:693c:60cd:b0:334:6c90:61bb with SMTP id 5a478bee46e88-33e8e1b1b66mr132120eec.28.1790100620512;
        Tue, 22 Sep 2026 11:10:20 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm12881eec.10.2026.09.22.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:10:20 -0700 (PDT)
Message-ID: <3e4dbdc6-692d-4caa-8f60-f0d82e894141@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:40:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/9] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX+OD92QQZSr7C
 qsMojjnlFqAgj6ktuLr0UBmQhzhWfXvD5CKVwDkgPiUVlBg8XP1/2AtBUybgGm4eVPqqIPc1M+z
 DZgDyMUhfyppIOh0um/f8qEbLbG5n8q2FcdM/2cszOI/ZqVDnqZQIf8QreHJZlynG2DkVDlnBhp
 h9sNcsqEgRk+A5KvQgPDRbP09ZcTyzdgND5Rg5f0v6MtlMcnmtWk6hmrGewmDiLOL5itV9r60Po
 m+T/65k++1oga8rnlx0p7dDBKCBfrPgtEugtj4fI5oILoQvS+G6hJFheLgwnf6wNlQ3TQTQDWXT
 xQUe/S/8gIqZmIiwnWvwn8q1haAtjr6prLkNrjPTjJG1My7NA+FdZIdQg8lXiRqIOfpdEa/qMwd
 JqYJHvUteltqHLv3Bqa8ilwXcVx8zghlSLtgXDp0DCV/qJJiRU1fspO4VGTVWyvfMsflB6Jn7Sd
 ZwGa6ubiK4r6o1okNgQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2c48e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bJ2oX7-cLgL2xx1Iw9EA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 0nX3NCKR_l9dGoE35_EQlGSeB0kZxaVu
X-Proofpoint-GUID: 0nX3NCKR_l9dGoE35_EQlGSeB0kZxaVu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX3QPEwNKaqwbd
 M/s+LWNBdF+wT2liSxm+d5bCXSRu0DRoqZN0+Y2I1xq9O6zQrTJdcIbIvj2zUmZjOt6pnsVQFks
 x0TrcJBU027DvMk3JzeoAzawZboreUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265


On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
> to determine the VM count and increments it by 1. Writing the default 0x1
> causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
> CPU_CS_SCIACMDARG3 as a Glymur platform specific.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

