Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992727;
	b=4Ml1tTcF1MASu0apqk0XGG4VUc91KFwq/A4toXcMqAvfGwHUJoArchOFqaWxv3FCtQs7
	 bdd32ljjKK867ybGV5ag5jAFiKfmStbjwYVQIeBism93GJQmj0445UVqofdOCkIPUiVpR
	 4W29j47hI9c9Elh6ZEYoCZHbiGMviXSyes+PbBV2YOXG0cUa1p/d3+IuB9JMYNpJFq5Fd
	 X9YxelDLFq8PMfkVFbETt77relhtQYXa4eJXrOqIPj8SFXx6rUZ/jLXBK2jmTbXfOvbxR
	 1kUv2V3hPJ5JTkogGmU7XV9SAqdvo4NwGNaAWel/YFL8jMpUsdW/ojsUQN+InN/f/JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=;
	b=fcqxyTR8R8hIqVVhvqN8ZcIaUeIMFpreifjJchmwgDdkvcOopjsGfRb9jTUxtOBlg+RP
	 prpY74tx+LvgqvJC+IJxL29aJRVoVjOUef+AdgwqigOx4xiPwZdYmhPyQ8Ts5EM/rqSgh
	 Nbwt/AJEGYiyjYpNKLs8Y02ZbJiIjgUoH0xMJ79oZw2WjcPYDuQjZwrUa5mj3ciKswh1i
	 7HmT8VVizHZ322E5fQ9r704quF0a+4fzG7mqcklkRM+DAKtF7xVbbMkxAz/vyR4qX9OEh
	 UTR5GSitnnAYSTDg5FJnLss99JRMC4bm/1htyk2BXTUL+NgdY65gqdBFnCk+e8q/YJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjmq54yV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnd9b3gr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB50606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB50606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjmq54yV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnd9b3gr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4fp2806445
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=; b=pjmq54yVpPurVyB1
	3dDQuNvDNwsRIAzCPtq+eS1bIKHv9qdfPTBCDZ9SYpmaYPNosDzHjw6kBn4VcrVG
	6eLUEJzA+ZHxSBHnaqXeArZSLPO0lkWfIU54HU6KkDaWWFepRO0pBLKyQNXuY9Kk
	bJuZCwbbsDBeC/ZQ4tGkwP9+PPqz2Te1Qppl+izvLhat3cO3AiX0aBDvgOoMj0Ew
	E68yXAiwV4R4OV4sLaizjjozKWw7Yfy3QtiaeQ/0Z6RmZlMZORDpfzxgXyrMw/mc
	xvkLYQJ5rZzZTkHRa4RqGq+tqJ6fNUraHbA+32eRPUHkHR/i2H/Fc0vnJpgD1ZnJ
	7oQDAg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xmyax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:32:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so3045427c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992725; x=1793597525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=;
        b=bnd9b3gr6DoMnossatN68Cx9wMSwzCvXfgakBJbRMV/tCjnWcev6dTR/9MDoCbTrko
         wfy/mg068k0hEMEipJeeUxIq31yHZlggcR2c53liX5zgEO1uIShnuVvgFjMJ4SmI1j1h
         QLS4nVcCuE2KHs4Cc5XLE4W56qhlrLxH69rJkzyJ6O9HL36DaKbGu9XJRD0iWjHpJk2s
         uh3VNEKPbcy5HnjcRP4j4UgHF5Q1x4gWHNzIYMwzZ6sfDrdBQ08Asx2R8TAFufPjP5NE
         WaJIT4f8OvmOhNYeigJG5IsnSdFF11e5h3hKgewX2Ttki6ivHlc4FQ02jujVxuzRK1H0
         dw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992725; x=1793597525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=;
        b=GFA3vBtkEvt1w+ZtPRhMryAy3d/AUiBl7Lf+gTmZnU9a5Zbqnv7SfSng9Dfb2vwN0K
         tWuRxc5j8Yw/En7cCEzzK1ug7AEsX0qb358PJt6F9KBXhsWtryierUZDXyJjcI0+v+Xm
         fJzx0tT6ITakTtmpl5GUlrtGV+HHvizx78NqGKpBl3WH8eZE5o1uIlL7Nmo3oX0cHobs
         /JaXsBcYMkZ3ymK+264D+zetusyfOCvWkA3h8OS2vkO6s823mblhOOb7V5vWNjq+Ld3y
         LChPP5KT4p3F2m3lhHrymjfIGptC5WvYo1MCrNUSu12KJeb27LxB4so3HQ/1xIslMf9D
         phSQ==
X-Forwarded-Encrypted: i=1; AKwUvByY3tMej9hcmDtnOV6nw8jPoPh7AprzsuB8ET9voZvBlK/f+hkP7gcTrJ2RLwnMnVSubHGjhl1nO4qAaD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1NMDiwpYcv1aXSqdY51voyrkBjUFDQ7w8a37t3BEuNBkTkcX0
	8YpDx8Yk9DocjUVEYX0QBecXuhpVC2hmRiulUxNpukCJVxhkoROW2pH3PJzs1h54/StqIu3PP2u
	4x/PIleJD9SYLX57DA1IL4eupluPQXSBnBNiciu6Zn0i2Pe8TwTSfPvknParUaAhgxqtK3WqNKN
	zpYA==
X-Gm-Gg: AYBFou2FrOM4rxe+XP2rKuMf9fOMx/KO+Z0icdVkjjawUyo76tyPreOgE6xdN26KcKc
	nDBoxZOtjEJvu2HsViDeCpwX6b6d7Z8MyCyaeKFEM5DDxrAO7TZcBaWo5aIZaaJICZJDrJBt6mR
	qjEFzq1wrX540bQYBQM8WNGbMps8AB+zdTW3IuyN0RTWORph0Lkf+S22CRR9S8tFzwuPr5Xg3ue
	58TbZodDB7MnWk7WpVJf9Y1WyM2+RKr8rEIMzxy0Sf3+Cuvz/WHpi4zbaEvJ8kaemOlDkeFRHBm
	VMSh5z0zFUe7RkD86Tf4Ag6S48Ha0QX3ZFoqIgvYoncU4BS56GvwwlIlpMtkSPUJ6SVRslRSkCV
	wwKHJtBEdy/6SxMCuuF2KW5F+iUaZ
X-Received: by 2002:a05:7022:e888:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1993505df58mr9283570c88.16.1792992724883;
        Sun, 25 Oct 2026 22:32:04 -0700 (PDT)
X-Received: by 2002:a05:7022:e888:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1993505df58mr9283530c88.16.1792992724312;
        Sun, 25 Oct 2026 22:32:04 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm1838859eec.2.2026.10.25.22.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:32:03 -0700 (PDT)
Message-ID: <d0f317a5-430e-47e7-bb14-b8d24678eddf@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:59 +0530
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm660: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lD7eJioNyABwqbasfER3lNOiLCKUp4r6
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adee5d5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fi4xyBuKck7nv7155uYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX7GHRmu3xj3NM
 e78jTP18YtLLTIKwSl0gwPP4/lbO9iYrY3KGBxhCzPKkDRCwzQQychHasY5AHVb5TCAvEB/TlFy
 8X6i25eqZppjxS9iEF8Lnyr9ET8P2ls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX6jEnjjHi1tdC
 2H5qMkIxfxXtLNgf79IMMZUM+bwKwaOq3E3ettLiKp+/iJLJZLUUIEAigVxHlwyk0queu/3dvWU
 pqHvimwoGABml9vu53BOStZg16SfIToRyGZ2mDYsWpiBO8WmrVmhLMM/etwMZpsCNJ24+xX/23Z
 q105LgopFqMeJdt5oJCvZTdf0n/kOS5dlbc59uWQlFDH564UGQjxwVicUmn4XGiFcVQcDEMu8Pg
 7FGLzaqZ2fKlvccGn3oicmwjRMooP3v+T0HtiuZXKCuJzEHSI7cb/Q0euFCEP3yfAwT6DopMSQX
 9teE2eKq7ifbpHAtGAGQ51KwziyvRM693xRigl1YTjFlaSd9ZLUTLWJ8jyUk/WiYnBmZGcaJInP
 MefrAoiDSfODVDwyX41ynDnN8wIj+7uB+1WzWPYmq+PkqUPPVObhCukCwq0rna33QANFP++9yie
 +VSRsFU9LASZ+XNKJ1Q==
X-Proofpoint-ORIG-GUID: lD7eJioNyABwqbasfER3lNOiLCKUp4r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm660 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 708ab9d3bc5b ("arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
