Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326254704E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722414; cv=none; b=IN9iv1S3FRQm53m4ZunUqZP7A4ya3/6IoH1J8BWB7/KL+NFYNqpQn1dTNUV9EIPLre0z4ea1gF3abf1GSYhVpKXQe8qUztz21PzmmOR32bA16QfEJsFNINn2uomYI/+iTjDkKmA9fnyHhCuJw5flITKkGad4sTt+DrYhJ0317S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722414; c=relaxed/simple;
	bh=NvyAVROrOefxr8HLu3QgE3TOubVk8y3z1riRnQQPMYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxFMry4TsnkEQLTKv07bsPBLNbb2WCGUamwBGT37ezv/a+3eyUc9UzcpdWcJSiJ1iIPaJca9XooyTMbSp5YZCbZd4aqIc/2BbGBBFE0Ab4Wwd5+buDUJnP0WYgq0nq6cUZ7WEU1MEOs3lZ1vp7aQlnP/T2DU7EN0FsXOhcO6iJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+PkJmu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGHx88n7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+PkJmu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGHx88n7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xwuu717002
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPjd73s24XN3Lhd60fpMGq4ueL3tteKhpMWhrIgQc7c=; b=b+PkJmu2PPx3leZ3
	sI1rZ+nWdXlx0PAH5Pb9L3dcIuXK4OMcbSM7Wq/eyNt8CNVJVtAHpj1C99wsVSA9
	QbS+oXji7IqhzjRyUaP/tl36x1uZsvbh4byaX2oErxGm2lLF6J4tAnEA16SEpbxx
	toGPJMV06MfD01Fv6SUN7FL5OvU9ZgjEfVphAKge2hBOS/dI0hm0PDtBfxqcnk2h
	oBmQhHjCivTEgLzNmSnuuBg6vw8dhcQzjO+VreoLsZzFA9JcW06Wy+POj5NFhSQ3
	N2aGdyyJclOePxqjOmL3RFv3WQCDy1iqo+L2Fa5ZdoV9NfCB8wmcNesP67cCpmzY
	huM6oA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg42cng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:06:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1bffc2eeso141302285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722411; x=1790327211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPjd73s24XN3Lhd60fpMGq4ueL3tteKhpMWhrIgQc7c=;
        b=dGHx88n7Uy3oAF0mVMqT4lxldtsmib4SyTT3pQgMNeTZDLihLaXcSeMU21xKvFLoh5
         WAYmn4+b514KSWH2eVfk82xDIqMXjD7mSJS3b4oXx+vog/SSrutfygY7JQSxAO+bMNFG
         rjJVqVNh1Pwgnhz4VcTAP9UG6EaZ3o2cc2rfadBV0TpsjjYdA9Sk0k2n+vj8u4sfeiyx
         GzRKSWRoZ0rTYRWGnuDGnBDrRzmMHSLYlEQKz9RkQB2+Kh44ANMNPWqFaRj61N1P3xOC
         ijxl1JXNgJGdpE0cU8k2F3rFrYLK//N+gGfVyGWAeWeL6AjHwsZgqcl/UWyZe0wb6Lxc
         qgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722411; x=1790327211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPjd73s24XN3Lhd60fpMGq4ueL3tteKhpMWhrIgQc7c=;
        b=aYOBwJ9OrQrFKW05t1KKXuZbjDCkcJvFYANhGMiCZmOMomXTHibF5nhYjA1fZNcUwx
         yfV4iJcUnhF0G5oaRsGsLiKf26NWqj2diGYQ0tdM3vBMKupbV9oBOwz5aZUBHAgZrKMw
         JdffKfVQU8hPk5xIYCw3zxyaLTOG1+0HM+jMTNY2sLbeyQtn2UH5pFRcdyjMSuF/YYxq
         KC1cgnEmREMo1dfu8IuVcUpYvHQnUy2iV7FpaFiCQQ7+tzV41SxMMnDqPiTHb5b8vObG
         RCHwQKRej/FUhrfSrDC0lJWWc8nFIqFWccko+EoxzyhDt1HUdnbFvp18xfhQi5S4/neD
         u+YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx2vABWs+kyRXuKPcGcAzyAQjE4NsqJuhY3nRg2Wlmf8NN0rsKcIno2y+tp82fR3teClljOlW6M1kc9e0=@vger.kernel.org
X-Gm-Message-State: AFuF++ljbTbO/r5wszppKnM/La1/qKns/PBx63mBZgU6wmymXoY9gRCz
	HUt5/IRjJobKAlGCCaqjwwjzaK8nL8QcE6lFoj0h5e3DwVTIkVv1lyuuFJLISht5edOi8QywKbh
	tnd1JAogfC2ptMIDQ7Answ3QvbowsqrQ9jQTqMpkg8niyIlcdrqccaUxUnGIMzt+8zuE=
X-Gm-Gg: AYBFou3aWolXRycHR5QIDOCPqB5OeFnHGTJ1gyFhB0MKWDs+rTPCIjvf3BSDCYO6unh
	y11xJbs5x0nSnIQClATKy0+lExFfABttb1GfZlxeysw0czmKxMBW+GWTU+6DYpoERnkdRzyELmx
	sljllw2yF+bFLe6iSRwY68WIkIFcIRGIYOO9A3glXzBmpwd8zgaj7EanpJQHb5pYgd5gkhYMpNb
	ExLk+1m0cM5NpvcAlTH4S5puA7OM8uXgMBmezl97jXyFkVcfDyuPKCqxCdls+Pz48ul7GVlj5V6
	K/P6z+we4HmPWPRO6GMyw461B4QYXzaMz4j7MTLt2jmZ+G1NicR6pC9xOEYSn3wPVTGGbVvrR+r
	+GKs2oyjiKmNsDUlSAQQoZwZ/CNiN/L2ntGhGiWkABEojVOtjZtvFfvox+hAhvnY=
X-Received: by 2002:a05:620a:4586:b0:939:acf1:dbc1 with SMTP id af79cd13be357-93bdc6e5b95mr252595685a.23.1789722411635;
        Fri, 18 Sep 2026 02:06:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:939:acf1:dbc1 with SMTP id af79cd13be357-93bdc6e5b95mr252592285a.23.1789722411208;
        Fri, 18 Sep 2026 02:06:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7ceb92asm37739405e9.6.2026.09.18.02.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:06:50 -0700 (PDT)
Message-ID: <7f2ab477-15c1-4ff6-a249-71ce07a2afe0@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:06:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/thermal: fix typo "binded" in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917080002.23952-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260917080002.23952-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XYxrLVAtWJXnVdBy6TkZUG-H5fDMnSVt
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aacff2c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8
 a=pGLkceISAAAA:8 a=rfXbHTV4jcTqxJDe2AQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: XYxrLVAtWJXnVdBy6TkZUG-H5fDMnSVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNSBTYWx0ZWRfXx5LMOizFXEkE
 PFTIzQOsDYfb7vN9DBQWeutkT9HLp0BgN+ziDukRt/ujuchAlboN5JQs0xWwRlwF7AJjXch9CID
 r65H2OtNauBYYO9PpRvbfUns129PSvUNTbHD+1FSv9hsATl1rb83KRpoj0O6Vh4q9myLB+txiQ+
 p+9qq6F0v2qKYJpErOUZbTvmu6RGJSWmmEShyYbMtGtDvOmggeBIoghDMC8LGgrphJYsu/pTy72
 1MQYP6RPffnV5ApJwwgIS+Wsz4o+IqC3Sxi9mfET43l+ACA2jbnLIvaQGXRyyAxcrSUMGnnIZv8
 n9oRdG7ZUg/qc73WxyZmaKvQHt4bZOX1Zr6T+BeO8ttRQxHcgZcaz/Y9/fTLDDJN2VIWulyFiWQ
 t+8s4/U8Vrrkz5d9//ox7MJ3lFlQGJKMVqpNoC+p+4T0jYC4/7A5R1Ykd0oiARLGPmuXnRswOt9
 Hnp/Cshyg1rTlJkg2ZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNSBTYWx0ZWRfX0+NSoMybgvwX
 fE7QNb4PuXdKwKI1sm8Zd4X57SSQeGSwTNtSpkbf9GjywsOZ1UjqjTIuVvyguyGcxYnrrdY//sl
 Bz1D9eeHvEFvW+npugHY8Wxgm8j7JEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180125

On 9/17/26 10:00, Hemanth Selam wrote:
> "binded" is not a word; the past participle of "bind" is "bound".
> 
> The tmon.h comment counts cooling devices, so the noun is plural there,
> matching the wording already used for MAX_NR_CDEV_TRIP.  The tui.c clause
> needs "is" to read as a sentence.
> 
> Only touches comments, no code changes.
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
Applied, thanks
