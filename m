Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311577;
	b=JI3B/0Z1rzptuhXylGJa+rnmdJY52PIR/Fdfadd7h3uUlNY40UFunNkisQum3jzJzSki
	 YqyyPMobyMOyW9+2YgUwzSt7yOg44ixUjYM3+qx2eUuQq7y4EtMcga79aNgN8wnJP0QFc
	 Ux+DrL040mXRMV/8YqMBBJu2rh5v6dGQol0A7fq6q3QKHDRz6LiN5bVxELnCT9xag6qTe
	 18Jp8Y+gvSY6xxiQ1xbFcXhB/ek4B/YR7on/RfzpeM85hqztU8rH1TwyepX5TMWexT5f7
	 coG7y553iRU4btTqRRddxtXaEdv2eayfiofR66rctO1QrAhBNevfd7mSdinweazI+IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
	b=aTEcyBSAc9pRhlQwkZrBksXSOel26zGe9ZRaK047py0//zfwYqJ9kVM88FPksRtOL2Dv
	 UkZHD10CuG1H43qEQtnNN/rr47+0wgOa0kZoLyabVn4HEE83dVAOpP5j07Q5/lIV+ueVM
	 IoYwIIzhm04pBX32RP8xfknfrDtJL8saq8MDuS0N+0LSBnGxJ8c6i0mw1MTvXnmirDAbo
	 KgSmXBz88xv3C9jDb4OD1bLoG47yQw6ispR7UU2ihjdxe3E8icaElr0Jn7IXRd2bMUjlO
	 kDJpj7yfU/WxY9bTh5TA7y1CUeEyb9BHBGBc5mdhZtU1j0OMZFL2Mb/FD7dA/W3sYxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMf7r9hS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHm0oXQs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMf7r9hS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHm0oXQs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLZcFl1005135
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=; b=aMf7r9hS+ZZLMfI9
	kMEUYytN/y66qnXyFTLQkKN7v+JEfgHh6ho6zFpTS+SSYxYf+IKnREgR0WwJboxf
	GX30XnbgTQQ/T+csTSzl8wEqiFXXnrxsNC2AeX1CE5HKI7M3QdnwpKPNCVDJ7Nxf
	h4n1HxnYbAu0gGJz+ge3TI+D/KHmT1LTX1iOC+DGuEO/W/uwp22SFr/+qwECKBx/
	sXi7wdbM26pd69eJzEKHmMpULtewTY0Tr9GADsjhpTebr+J02/7DIHuy9Uy+wEh3
	J4NuH2vPGRnMf6chJ2ZgUGQCVap1hxfeHPSZR9PXs3bOt8DvyUbmE9M9UShqsIFM
	GTZkWw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qg3ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98909a978b9so18196241.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793311575; x=1793916375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
        b=FHm0oXQsj7pQWu/27ijxd1ZqA3cjwGEixYTqW6u+fHNECCmnspq5JzxeNsG+EsGJiw
         zX5a4AOiKMHS0EzsTqmJIgLr/Umo+jIkGK3YApYcDYVluOD/McaUEfejjQHiNnw0rHJY
         uIA+VIhdDTzrvyaXCajZOrU6isiA1ZoSkJbHr7FTonMokkUwLadw936x92GkoVhuuAoZ
         BM738OUs1paVV4wfH4wT0hNXPv2qYsGvqLZxwEx0WScSdwOx2iZeMCNAYRyW2L9TvUH8
         7mEJ9hwZDDN7dAVzIHwUoTgZsrzRl2JOO1f3IB2l6TEVUyYN+fa4uZKnTyK/EnRtcGs7
         mTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311575; x=1793916375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
        b=SUhWnUZsnssWej+xL/S1bdn/m4wiHDK98oSuxX8ocrgubT1YcijMdPoMJj/eZgtSWQ
         sZpF6+CSkbbrArlXt5dFi0UWTiPxggQtSS1+Z+otJs4mMOCAqoz6d0vIdjHQ5bMuEavQ
         CdkxdI+25hkMnUjo8rl6SOUX+SQzbi6wO7/N+HTszyDei7sKh2Cfu80YlGpIbEZsDD9m
         wcPrQGND1UdzgJF6vQDhGY/tqB/jR+8zuhQDAUxoybuV9i3KeCp6jwFsaoGrqUYQAHNH
         bBrLKqeWURc6245xHXSF9IhPjR91qcIjRcMuiSi68CJtWYotj587wA8hJjvmNLX2w/SN
         dMXw==
X-Forwarded-Encrypted: i=1; AKwUvByYoHrMiVWGbgY3brE6VeZK067hT7CwYyN2Y8PSuu/qyUWVZkL6lSAhes6lCAjOD9vTQE86o6560cC8udk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6iq6KOI38tLd++1Cp8kgWUQvqa85JE9tF/BmrG3WSMpuYZaUU
	vETm7FKr2aWSZeY6pU8HfyKiNxb881zfy/lAxkT4cLY8/aMF93/q/7MDtGHEwXIoLl71J3Dgr+S
	mWHo01hwjyz6pWrPR2mmZvEDgBebKPF17ENBl9N+BDAI/86i1qBCWzsC/QTPRN4WvtLHCkVhtzY
	4=
X-Gm-Gg: AYBFou2CeBwbITC+B0MaljehmMhkMYksYXGsMFQpwYPkPhPyc5PSeeaqBDkyMYdow69
	TccyY2tINNrSwNyPddKt6l2irFcjKZlz+R1hkCI2FmtdLgp59G4uY5bvOd2qsf21qiInosL69cP
	+QQupQTj1zl23gVm94CDpi5tLfiWkMgMk/fOuOuqEltnOg2zISHJ0Ow2iFIQlpAK2/hRXqGTEy5
	4aAyx+GY8lURb6dsxQHTUh9hRd6gHcEqwa4RYpn6GaCiM02BUN6sUkDqPs+v59GDrAq62R18bPP
	1+GXeMPmkhhvrPCuQae8tk+s1lLgCJPx/qaEOSaWteoR1bXgQmXueDl+ySJ3KcwoY1NZvd9TA9A
	8jVGx5ITFAq9IuMSf3bHX07/zvlBIGh1g7FA2/Ozjr9ApP1+boMTd82zwBQKGsNJ/pIk5a4Yk9l
	/1ViJKX+wbAG4tzpP7LNHBbPJlOTTHGMlMS+s=
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr296182137.37.1793311575368;
        Thu, 29 Oct 2026 15:06:15 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr296170137.37.1793311574895;
        Thu, 29 Oct 2026 15:06:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e712cbf2csm9212f8f.34.2026.10.29.15.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:06:14 -0700 (PDT)
Message-ID: <542fea3d-c587-4077-bc75-28afdf3e543d@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 23:06:13 +0100
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
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202610290223.iOEGeDs2-lkp@intel.com>
 <20261028202400.GA835963@ax162>
 <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae3c358 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=aSKgorFW_ocjRd5Bht4A:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: bOk9n-lM0w8ulkviSrpIuFPXNUTzbzri
X-Proofpoint-GUID: bOk9n-lM0w8ulkviSrpIuFPXNUTzbzri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NyBTYWx0ZWRfX7dGm+wt0RcBO
 dWhNfbOmaDS5SEZl5HLYUXdrOtM6xVaxafxKXdurKK+klh4DRINcIf64bwlNtweOgkXxmoL2Wo7
 LwncoQnbde9Ke6nQjF7gA05t59wq4D+h3/lR/Gd4EarNBmw0nWlfftzeshPYnYAgnKvD1cAFmNH
 vxjODUml0SwP5yGhUZQ7HblHpy2QWNOp/f5Wo1LV6kJjlupm5V3RcgQjK7mgtBozNhQGlpDDp6v
 5mHGZtZBtb+lFP84UHY32gOWuB4hiHnj2j4wGX+GkJNxAP7Mrq3xo/4EavvDSCI2mv9wqcCytSJ
 wBZrQimrp0bd/NcEaur+e7Uoqlxgi4m4k+KJ7km1+/qMchec4UBmoQNcWBqbZo8NlZfnyMsPSJQ
 Q08Yg+EXAWxQpF+hTyZ/+to6gPxDG/6OZNaimgsU9c0BfgjMGj6/DncK6jF7nHDZTxNPRlby7R0
 f5/yybdxszqiCqEniqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NyBTYWx0ZWRfX8mK3Y+x67tZp
 gnAAj40CHBPEppEYvN7GBNcNToMdyadrxdW1EbLgnZQHbZtdBgHVv/VvoLMxY+aHLdi5N82yvrC
 fGvuDx2fWBICzNqVM5t1aP9SV2ZM9S8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290087


Hi Luca,

On 10/29/26 19:54, Luca Leonardo Scorcia wrote:
> Thank you Nathan for the analysis and suggested fix. I agree your
> patch would be useful even if the warning wasn't there, to make the
> device probe more robust.
> 
> Being a new contributor I'm not quite sure what the process is now -
> should I send out a patch with the correction, just as I did for the
> initial contribution? 

If you can send a fix that would be nice

> Or is it going to be fixed by the maintainers
> autonomously? (Obviously adding a Suggested-by tag with the rest of
> the bots' tags).
> 
> Thank you for your help

