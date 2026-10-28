Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179854;
	b=JCCye4mOybQENxebI0B3FDnqptvXWDUgWDLwgYQe60xn9pyV8rYuSRyGBKVRs5TEyPg8
	 j2etS8j3y1PGq3LebblgERaPcyhKeOx3rYQMM4S5tR2qXH/5fwDm2BT4FsaOrO5UPo/Pg
	 JbkpxwtMidxwlGldlXVi++1wPwyGd3lkGe/DspbCWXpvBwBOxvNmnQeI3O82ujGcIYOP+
	 5jS5rfPgJTr19GIj6DkJ5D+PFJ3sFO/kyg38N4x6FMjH5sM7+iLowWZTsuRDhjePyXzgK
	 4vIf8JKA4dSuNXsQg/pzMvPD6XxzjANmbShwCg3b6NDn6mZZMoulEYjd6DR4Gl8uWYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
	b=l8supcULvsfeCCXEklKHOXiJxDTETlS2QxW17ElcifzAH3WUJSx5EKB1hRCd5XcM+Z9Q
	 qE34e/dQnYFu8B9zgzFPUKkMqa49MGUby978oQPqrj1CHblPhAJus2mrBCZbbBDppx4tc
	 W99WFABqcXbMndCwBhwt+xLaSz+Kgf6emG4wA9LrUW43xM3RJfVhxCVGmKuEXh2WoPmdK
	 yiwp/UAw6WWLhkSmaHAmm3sixB0rQYRAL+b47nvdyWGgDfxkuCRnTA44yY3842+kisg7r
	 vMOu4ysMrc4haI8tl9WWbmwQPrUs7hYQMJ0LdC6m9qJ93YcJOYPU69L/VzPsoU3qFcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJjoPXSN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6heotuH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJjoPXSN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6heotuH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K98d253421
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=; b=VJjoPXSN9HaORW0B
	rdlqrIiuJJPmf+hFREacFInMjBSuffov0c+nPWdcB6GxYX9lzR0vMreJY31GbWm3
	TjgcDz9pCJKT9Wwcog9BhQL+9XV1fPyULxOYARs+hAbH01l7Nbb7yetYf186N3e6
	oSCWXrmjD5x0gl4Fhj286Rqpzu1t76Pl/Zsq+YGu83gpr0GqnYMxhY66OVJ5/wAL
	mQvb5c78yoyjhJA4B++5G8iP+wePlRuXFyGvh4MpGPNa2xE/ikt2YKIK1z/kfUlI
	YSVd3DFtOGN1BeQlbo1Ojz0cHEm9L8/JqqRxdxlIB5G88QeAGoAvJATC42dTyXJr
	4SvpbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1rxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:30:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so119801485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793179852; x=1793784652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
        b=H6heotuHGmwDbcJzpMgWwPXA9IW4DrSCQQb51DfZM2nM9fP4xs00c5D25Rh9Cp0uyd
         6vET29ZkXhZEG3zt1GdDjNcKX75t9YuS/fw1YW509ir8N95qVZF2sEiXUGTEK6eYY/KN
         iasadasbBnjSHc+Yg86gQeu9RQqczVcBDFROr5JuTiBgj3sGSZl8U9VGeka/Dmxi4pUZ
         eH53U7aA64eMUp7wLe2pOZ6wS1gytu1kMdA/cPUQZ3oYGar5f5VDAiDpIUkg/1uiXFRI
         249zLJsX3AWDBws+IpCwQ7jDHZVQRxFK8sZLgsbKtDLQ1FUxHzpWS9UYtD8AqGRaH63H
         Fh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179852; x=1793784652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9WSVSzQM3gxoBgbW5KOP7ComFae578ztsE1a3gy6yg=;
        b=KTCUKzofz+5rQ59AxCbDQ3NxO2eCsqaM0ahWip4vGKj8sCfV7HTS0+Ccd5Mp8e8QTO
         KVagR3Y1sy4rft57LpurI7eGArkjtLnrizQPxJK7rOOQskomtF/w/PtUC/EcU4RHL7LI
         B9/tchSQ0cvgCjZ8aQHST80FfOthHHcg5/MlLUOwrwhEugQ7xLL9s4yAVLFO0Y1rENtD
         fNkU7Y36xpXvQnNv3QRN4d7UcyQVzsQqZN4bdFRkCQ1BIUoTT8+0uFciNbZq5d23cJKm
         8bguTJ82CVCMXuWy7ApdgCkk0xEND1KgGO2lIdvF/n4qpbKdbOb7ABjMEY+L1H+fGjlv
         kQvA==
X-Forwarded-Encrypted: i=1; AKwUvBwyEhuLoGEtltaxjAYKHLUM2BaKcz/8G1NQHAFSZVp93LF5UTlroGNZ4bXnkvl91B3uMcgyb1ux0sD8h8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3SJdGrG3tHGxXk4hV1ObnVftLlRLF5XtO9YR30OTINDeZICVN
	auQdepUEtXzm4gfxjvr/TE18slgiyOx1hPq+5HJg2y34ya5cDjtn8sDZd90dV6LFtNqzrC2errZ
	2SgNlVud5gbbqnlbH3sbfHPQcdZ4T/4qvp1DkICB//bU+E3Zxl7XzmzwXGXhi27QDdg4=
X-Gm-Gg: AYBFou1AVg2mJuAwjXCWWhskPEJ9cSkkyV+GPrHvFKM6Ejlbdf3zUdclEMEZuHxLUD4
	9iEsL618Gr2jFmg8FKkT6tD8QUdu3n7kFVmsgR46sKt7Dyldt3WzCjhWKsZNTQIeeJEKkxVewHb
	5xDgIpogRx7k2MusFKgi+RrXE5qxv8sccPF3/lH9gMh/9HMNR6qWcimyPCp27zalKkJ/9OSYlA2
	4SdYjM0XxI16rQMTPG8JGE4kc4RNIJqQHG4z1Ak2EMwaTF76JUT3xKmViP3zm2d9vxrwJDElZeR
	HX9hJY+XBX+KAwjq45ToML2RnLnzePr+omci/uhTH4yTXcNPbhQxFJ47ExSADhuLJZ+77k5UEoW
	dpZZxl9TOBVV0qNh1oCcoRhgIFtwBb62vA+Id7QIGIxbMFrj24B5Qq+5LLwOmpezDdINHaXkqBw
	Es
X-Received: by 2002:a05:620a:1d03:b0:943:faab:aabe with SMTP id af79cd13be357-94408d43a71mr195777885a.62.1793179851940;
        Wed, 28 Oct 2026 02:30:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1d03:b0:943:faab:aabe with SMTP id af79cd13be357-94408d43a71mr195774285a.62.1793179851499;
        Wed, 28 Oct 2026 02:30:51 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e4be4b2sm21772175e9.2.2026.10.28.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:30:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        Cunhao Lu <1579567540@qq.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: rockchip: Fix debounce arithmetic for GPIO v2
Date: Wed, 28 Oct 2026 10:30:47 +0100
Message-ID: <179317955938.10111.11780019305484547923.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
References: <20261023-fix-rockchip-gpio-v2-debounce-v1-1-f1141bd5b58f@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FIZN5YX9-l2IadMYJzpnWFl0lhwuRABl
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1c0cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G63kk6RMYl0S_NIbZfoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX145WHIHr6PtM
 FqXI4w3hd2G9773/7L6Bh49uuRSV4qayH5UbJSQxiMsushAIeA3fy5JUS2h9IJhRrSjUkIqIL1/
 UBccyATg8mD2KNweqPC/QWsYOM1866E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX+2t92UcpwBaf
 49FMAez8CF0KAXFw9qigwDVdabjG7WW3BmZy7P+HGZEB5HtqcbHMsFyPxGyNyO9TjrGSQzY2qM9
 Jd/wqlhSpfFYRCMQE5dLo2IEicBIN3Md3q7mH6IyxZxooahMidAn5/jRdJ8zSxK0ILpX2ywj6/Q
 PVCJ7tjAltKlIS3tKDuISKSxqKAvpDoSg0bc5iBZEvYnFiEMECk9VuObFhkwUrf9qo9KOuJBklD
 RMlbpAaw8LMciZtXG0Xaa1zOvX5OGoTiq0t4hUeN7WOlKrXc+/2tOU5anY0XD94y0LLto0lBNTK
 nxQxL3XwR9GpwWqALaK/VWbD3s+dXKof5LprZ2w71xz6l1+2PhcWRE7zqqf4EOqgor/6CeUybQK
 B57V7EIl+BESNsJ/XDjlPX0NR2w8N9GNVqAiqEd+mXZF1NzdLuL+phxYu2LNsojk+Cog8J2ntud
 bR372OA2uiSzDgU2jgw==
X-Proofpoint-GUID: FIZN5YX9-l2IadMYJzpnWFl0lhwuRABl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280037


On Fri, 23 Oct 2026 16:21:05 +0800, Cunhao Lu wrote:
> The debounce interval calculations use unsigned long operands. On 32-bit
> systems, the numerator used to calculate the maximum interval overflows
> before division, while multiplying the requested interval by the clock
> rate overflows before it is assigned to a u64. A zero debounce clock rate
> also causes division by zero.
> 
> Use 64-bit arithmetic for both calculations and reject a zero clock rate
> before division.
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: Fix debounce arithmetic for GPIO v2
      https://git.kernel.org/brgl/c/13467fd6998f5da4f5b4f172f1af3d9c48d5de8f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
