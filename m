Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626189;
	b=IrZSpDeKdtPwWVcL/7QwFcF2btH/QsJn8+Khhrm2vioi01SACkkQpdHD6V1rVrHqAZ6e
	 0rFtvfT1izT20beYQVhvqpBw7AfaVpfsU0s7tJ42udxRPdhXf00JfWrOhh3Wqu/fAtNtR
	 JVlQKjJaXYYk1J3NpZqWv+fZWjeDZ/N0nwC8Au6/VPrSIKpycqAYi59+LIbVzpoYz8lzI
	 VtuvTsP/ys3MusULRYO69Mh/6OfcCQOYYT/OcnaHa97KjhvV/krZvISEPcn/fp9Stlf9O
	 erLIUrYMUtCdPITqAoYQYzv92wan7W3sCkVFfPOP3VCSnMCyzaE2FsZx5kb/CNAvKOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MaHSdSC68YCgPi3lz8iuASH0f6ZOoGx8qQJK3v92RQY=;
	b=Kruycr0dh9yu+2cxxMdY4DZ3EHUW5jyxKxlIFGVRq8PxusltraN5WRbumKWDD63+uio9
	 3hF06eyTppqctmrwDt+SQ1jt0p1s76/+D1pLjyZ+GAt2O6hbLMnGmDmgQa64miUHAUaHh
	 d0UcXyPBIRwyeZPtoZ2SQKCpn0LA13vxKqcH9NeWjtfvBYtT/T0IAy8WxlB6D5c21gO4v
	 7P8nA2icY6JPEOPxvaNErLy1G/HUG3+cLbLKIKAMu/12mQ7APXZJP5Q9vRZpk/LfTil3E
	 wF9GEYMqGVGc2GmdcdjLpC0SRD/zLC1QpGyLRnmQp80FfTr0lSPQlyFMny+7sl9glTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZutqRrGj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF3VqCj7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A6606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A4A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZutqRrGj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF3VqCj7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAOir804756
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MaHSdSC68YCgPi3lz8iuASH0
	f6ZOoGx8qQJK3v92RQY=; b=ZutqRrGj9Qy7ij4ckTkadu5YKgyRayrkWPiVgddp
	TrmgYQVhehE4pI8aHMq9UfhDc0LNhNLjZdcD8Sd+I5ltaJF+gPj74JhqOWGvrk52
	NPGe/HEcu02bQxGOS3pksJ7JXFNNhcd+ewnxudTifFrlYLih5FnUnWvsJe5J6Siy
	Pj+aVjwow/37215QXQhfgZMa2nmZOGjZetepgLzfFMx42tTtjmfeM6/OkCBjZ9QP
	v/R2xZwpWvu/PxmGIudZWZfKkLEIGkjPOpWyEmdV1YVHGVmLzG7dlGs/aiRPsCiS
	4HciFR09ADNU+5Mq+7bhky/t/GfbRkE43fa8PY4IK3miKA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvryw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:29:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9913f410ba2so573210241.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626187; x=1794230987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaHSdSC68YCgPi3lz8iuASH0f6ZOoGx8qQJK3v92RQY=;
        b=FF3VqCj7/p782XIzRyJTXW9i8Pt808MrlF7U9B0/BrjVwU7KJ4yPmHdkbkDNN+7LS4
         qnwkgh4ivqGk2Usqcj/xQkT0fIQcap0xhBvBSEJvLsj5GgIfk833hcwaKa9ffUSUUBQS
         8Ts2z79Hpp4doEhaPtmBicILLG1p1vnGtK4InDxQH7PXVLXRjrUZLmW5Ae10ntKbDwuJ
         +eysul4BuMFAPxGffAr3y3MvCfLEkumnlj2arb7FmqrWSZmM81BsxL1dr4aS+LR9rOzs
         aUmhCrju5yNJGSeaKTp/0n1WLSR8/FPoOFvhISt8BpIFRYizmpCxEV9+UddZAU34WHNp
         ki4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626187; x=1794230987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaHSdSC68YCgPi3lz8iuASH0f6ZOoGx8qQJK3v92RQY=;
        b=yslckuN07xcKvATQedXhTimgZj93+D3Ut2NL9caq7V34NFpS9IehrpmTr3IWzPqe+8
         uXSjvxCHV78dYrklZV8Oq1oldXsiTEUANFw0Th4m2Gnhg3mwXOtPsRsR+tyV92npAND2
         o5n/9+avoGa6S1JlAC7KsXbMi6ZJO0Lua+iVT3ZirrC+OwAKo1llTaYop4YYaFx2i8uc
         CB8X3RVNt3ag4WA7Qhgx8czHiFlIm8Gg+FdW6oYfVtnXRey0kZQ7cQvCZwSrZUkXopfh
         tCNzb3kqL9djdVsx5oOdhfrBUdiZstvElyfyPWIOY2IQQsfgYSRlUGyUUToIm2N/yGKr
         BiBw==
X-Forwarded-Encrypted: i=1; AKwUvBxc0vL+e0fXUkUD/BtWXRITuN7dnleeUtpRO6Eqst13y8M8uPiTy/jU+YngTA/iKHJZOsucArrb4E9X2Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F0abSVFCJqTTyd7HQF8pR3JUyTd3hWXXVKzJsXBOKWcOpKWoq
	Oc1CxIr9k55aTm8KHlwudsfa6glXq4WMEQGv2rKL/+97UDckfwpQLkTqenTGGPrcYoZ64s1/2iC
	R2v5uLwzxoYAciKIWRv7M4irqj8z5KyKVygk8UHWz9+3RD+4+fbkdYmMsT5ih+cSxuORanzA+yc
	EDbQ==
X-Gm-Gg: AYBFou0e3UK1m8kYF1UA1tnHq0NzI7wl78yXFHppdmsbQQcdyRlqFmUxHuvM6ktS9m6
	EoXEwUwRMgjBGS5SkwUBv2z8rigK4l99VS1NJIw9/bOwXLRBHelZDuheZdxAqygFAe9F4+knjT3
	xNkETjwvFOOIcaASVkR309ETDNurH7MGWQDX9oIoz7P40m5t3fYvSMjQe0iLul/UfPEDZymbaip
	168QLMA4HkH9w/upuu66xrrlkSAjF4Xrt6JznvXogg9eo1AyaV4zXtu+8n+He70sdueDyxgCJgw
	07bzPHx2DiVXhmtqHaF6wchYSnupy/xkQ5llPwt0RAy2zwGGJUE2+odTUDXoIEd98txghei93xa
	LDXC1KWzzDTx2REz3PqKisnwzTrlWuzd3SJAHS12izwiXeV/8WyfODze9xMDrLoc=
X-Received: by 2002:a05:6102:5486:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d0728c1b0amr3490570137.34.1793626187277;
        Mon, 02 Nov 2026 05:29:47 -0800 (PST)
X-Received: by 2002:a05:6102:5486:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d0728c1b0amr3490562137.34.1793626186628;
        Mon, 02 Nov 2026 05:29:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm21455580f8f.32.2026.11.02.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:29:45 -0800 (PST)
Date: Mon, 2 Nov 2026 15:29:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] powercap: dtpm: Constify some structures
Message-ID: <ujl42bbqnsbakun4wffbtgtytojsntebdyt65vlpgxbz6mr2s7@cjqsl5j2kbm2>
References: <a4737f7c69e044d35348c1e9c7f69f229070d29b.1793524483.git.christophe.jaillet@wanadoo.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4737f7c69e044d35348c1e9c7f69f229070d29b.1793524483.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8904c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5Yrv_TkWLuZ8LgkGlGMA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: xSJ_PVyJivkug91BbyJv1p-JpczJoVX_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX85qhRN9AC8+9
 G1Bff4mtAFJz6O9/jXp7fFTNCHBkjhGyJ0WR4ZOHTKfdZhle9P2sF/tGh18zZmAQ58YrWikM+BX
 Lq1ZomW2CEugC/cSdBDRz9OaEIB4UfU=
X-Proofpoint-ORIG-GUID: xSJ_PVyJivkug91BbyJv1p-JpczJoVX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX7sY4mEBRTjaz
 RrrPYKvP2ltte1Q0wPMCmY5lpgKIGxEKSD0VBm625D/JA8E3Nb02/BFhbIW12c5S6FOjG4fxUmp
 BFr/WyJHQWIkhmi2lO6ggUYcCJlzuKqmQa1qm0MYzabclwmPNddxgfNKGty2P86XNMof/SKQpOf
 J33yE+f/dCtB2i1pikUvUyLbHnKDfHNzeBQ4v7vx5ZPZw+/mu/cPh/tvKCmy6nj8m8vQDQrRmoV
 RCenO1xuQneFFdB2nZ6/N/nGNFofyWL8RWceXi19H1hdncwj407Z3org4pU1SjZ//p8xEP5bvX6
 oHY12KUujDPOoGcJjuZvf3syaiAOJM/4QgRFyGtsrfnjKQRKX9s+FVAf7VPUqF7Hw9Xi6SxGWIV
 8KPrJ5lwZl/3fvYZUHx8lk10PedkaQpOrF/G53B9/596+txPfsjG1XtX6QvEv3mUbtwnzEcT2lL
 dMQpHMuILifugDoNfag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-11-01 10:15:06, Christophe JAILLET wrote:
> 'struct powercap_zone_constraint_ops', 'struct powercap_zone_ops' and the
> 'dtpm_node_callback_t' array are not modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   22049	   7736	    128	  29913	   74d9	drivers/powercap/dtpm.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   22273	   7512	    128	  29913	   74d9	drivers/powercap/dtpm.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seems straightforward enough for me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
