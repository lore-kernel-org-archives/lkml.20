Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914848;
	b=n8X0RW1nyWnl+EBAgSLaZdjdZfxOWD7vh05eC+RrZaG5Zoae/o/RhGmtCFUQsMy66p9w
	 OQaliulproXJb+RzU0vH++iGkkgrOgPcaKD0DPQdA2oN4/6OgZTzeOubXpk/q+1AbmVGY
	 gxpvulnR/HOG8KoxnGez9fvMD2KPg7UqOLsyXrjl4S0pwBCK4DDIjZGLIzLYNpsjyxnw6
	 dGXIjRzMXQjBpikJcQLLYHC5aNdqReL3suJE6wxOB85rXtistqmQmv5g75zOilOCxfpUw
	 8Y0quyqL0JkZCA6FRnHnnjzsgXRXsKSJuwanYIqywrYnluthVQyVIJlANU9CpDMyHCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TiL2IkZn0wEC7iD+jl10xXWMOQDsgAhBHuaMbQTkHAI=;
	b=CAurTXhEuQWGDF5mF2d+V3+8l9VrvIq5OP9hRmq4ykJqJ/8KINOpCJtp61LWopi+6sVM
	 Jm4jVVrOoCMlChIJHyGtuGaoK5vx6XNYqcBkSBd9+c/Z/Y9kRLPvEvypcwI+DlnKo+XFP
	 SUyr5X0vsdgGeuyPtSI33BeeU4hbTwiv8K4J1SDm/p8jefQeCdNRnBbCLYwUDQVT5K2ur
	 LJdxyDjhj7w3WlDE7m373UUE0CgfG1W0dtEOvM/XZll+xfIgib2Fpb8SBirHxA/ErOXsN
	 c3s2R2V9Ye10Q0m/mGHz2R52fjNwIvHK99a1eoHkM07cnFAMue2tXu7nF2tOtFa8ihg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=gSEe04W0;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ixdOxXeu;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A84606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A84606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=gSEe04W0;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ixdOxXeu
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5LY7UK314382
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TiL2
	IkZn0wEC7iD+jl10xXWMOQDsgAhBHuaMbQTkHAI=; b=gSEe04W09Z+Nh8ZHcttV
	bnd4AF4WkzrRlwZafrX5JoEzr5CxThBeF3xKEZOIBcZf19OnJMHqvzml/CUUpRp7
	hIctJ0EZsgo+t93Nfw/HGZ7RF6zupDHhTHC7r7lBTWanUitvkGm/v6aK5dPekwsV
	8g4hY5qW70hw3BqJb+UcrTZIkWQfrbdqFYu0SgROjPeKsQKMlzvhzPn3pw3aCFS6
	qH+ubESFeDDgm5P8F1wFuYtYRe7NKtOchPSI/8U8xHRLTOwgr/bZ/tdVpFpQueX8
	Mmemd7/RyEzyyUvD7mLL4SXRSAq11zfPe0tCuhterVH5lvwXtNwemmeYxToFA+if
	ow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hrw6ek2pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:40:45 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso495080685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793914845; x=1794519645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiL2IkZn0wEC7iD+jl10xXWMOQDsgAhBHuaMbQTkHAI=;
        b=ixdOxXeuQ6bjUfzLRCLvJWlLpU0w6m+xj6I4VCuvdLxTkTF1Jf09PtGGgxU006mWFg
         Fi/aIMVS8sEwnPoRnT9cJbuyb+3FzijAceFvzpexP6ikZllK81NbYC5JFeEEQrU3zkCb
         V5VcOmMDn9NRMGN/yVCtte7ASePnpZbRs9VtClQ21jDkDZ7qe0aRtFmwOEpmGqVfi9CI
         bp04iUjc4qxOt9FJA/N2QO9fbwxoZAm4EwEz076r1dG1NeGMHR9I2i0QLlTgFW90qhbz
         0cY9cWaFjuSedMDSuvXnpPVEmLxnQQHUUlRHND7522mfiR4P/gQPr+FnqWrU5jn1IqN1
         F+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914845; x=1794519645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiL2IkZn0wEC7iD+jl10xXWMOQDsgAhBHuaMbQTkHAI=;
        b=z6Pq5JVQeLk6fEeiz4FHgqVz5h2bpVOFouWN9RMrbASrhRot9gWShzZrihDHV5cCyy
         NTa7x/9UH3sJV1Z07DlJ+ossw2HfHIIOCRRK/itvtuw9H//+wlhnfT/bgUEaqgDIgNgQ
         9QbpSq0z0Ag0aAzXfv9OliKKU2VHAQTaTRBOV4u9S3LH0ju5ncs5E7GBv82DJoWYK84P
         pzAE5Dfby6iQtOZBFWt+Lm3YCXbxDJw//Jx2bUEagrzsbiLFBeSaVAs+4qbo9msrblPY
         CreELBiUbcBkiZixacRJ2c/t8I8xvuYkgjBXwp3bPzL7MWQD1e2xOD8FoWeG6c1OFMWp
         MoSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkJTfCaE6WByHd/JBzPF3HlX63caMDFFAE74YQCq6zfcCx8ythMMm9DJwLHxl4I5irB7tXXDFjl43Nip4=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ytoztkeS8P7fnnapJT+DJgMRTGkTL/uLYk0oE/FXXMEdzPEl
	hYUTNUlcrXjhx+r74yPmw17TR9qIK7nEVU1dm58sIRVoeq5vwxo5yvELR00qc4S2Rv/Q7YjMQdk
	6GxRGThLYVK70/9Zxpl3R9QMBlcyRDYp3Fq21j73RNM8GYcFvVBzWBk0PRJ9BlQ==
X-Gm-Gg: AYBFou17qPExumw1E1/MdPVWMbbmdPWRwv+na+qnoPINKg4yqDJ/AlWbs/odnIZvQc2
	myg1ykHiFF1UZG3zreh6TbIxBI3mHtqqz+xCe4qiUnK5GbdGYeg6UX12ztvIxrku8v+LIMohKbT
	kwevEdGi4RN3hfrh4COYCuBsPBmmDGy92gGDTip9FOESaKmIX3QFmgAT5GnJDyGmCyOUVARITk6
	bP+0Ev09xy+Phpwtom+tBlDtxr1hkDp6Z6/uHgnNMVfZsEnWSnrT+eRgmi198WKcnqaFggQcJce
	dMfk0LFPx+zecUiWZBanc3PLaUfw6LLud/HqDChUEznr8T5+zzegXODxLoNwgxWuHkHAKVzDzLR
	r6ZZT4cJybwUiPIdDtqMIfA34caFiHblxhAMTO/RwXgeK0qc1q0FandJ/MYQq81omiywWdh8wgr
	C3tyuOjfPw/+wHZ+8gTJ3gj5VU9D8nOBessDYwvC6DElRrJ5ej7OOspc6meOq6gVoewvWpBvdsX
	24XDaG/Vk3jrTHo8t9SBbjdxIlLZGnRjrsFQd5bL6dY/LSKHpn4Zesp6c2kxyDv
X-Received: by 2002:a05:620a:1d05:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-945f3632eb7mr58662285a.79.1793914845061;
        Thu, 05 Nov 2026 13:40:45 -0800 (PST)
X-Received: by 2002:a05:620a:1d05:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-945f3632eb7mr58658785a.79.1793914844728;
        Thu, 05 Nov 2026 13:40:44 -0800 (PST)
Received: from [10.206.221.57] ([129.236.229.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48577ebsm547093585a.33.2026.11.05.13.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:40:44 -0800 (PST)
Message-ID: <74882357-55f7-4569-8aae-789a464748da@columbia.edu>
Date: Thu, 5 Nov 2026 16:40:43 -0500
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
Subject: Re: [PATCH net] net: cancel napi->timer after the grace period in
 netif_napi_del()
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Martin Karsten <mkarsten@uwaterloo.ca>, Joe Damato <joe@dama.to>,
        Dragos Tatulea <dtatulea@nvidia.com>,
        Kuniyuki Iwashima <kuniyu@google.com>,
        Stanislav Fomichev <sdf.kernel@gmail.com>,
        Sridhar Samudrala <sridhar.samudrala@intel.com>,
        Cosmin Ratiu <cratiu@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
        Wang Zhan <wang.zhan@smartx.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu
References: <20261103-napi-timer-cancel-v1-1-55c631ad5286@columbia.edu>
 <CAL4WiioJuY1L5ji7tVXggp=FDm3eidwekpxqAMdnxWUyiTR3fg@mail.gmail.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <CAL4WiioJuY1L5ji7tVXggp=FDm3eidwekpxqAMdnxWUyiTR3fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX/F6x6sV1PnNG
 eFPS5XMDth7MLNwzZ6O21Bt2Xp2FI5m898ImYCBThadqqPPFtrWlkOP4Nw7Z6jHBx0l73/mXH7e
 7FdYqBTjEjagb1to8uQIu3qn4G1QIBHgE3BIXJpaQ4+yEDLawLibvdVTu8Bz1Var+93VvAcks2L
 7MEDdBlfT9UXydbhn8ZNydv//V7IYArGmKUt8BVKN97r/5UBnqSDW1GeDLCsEfle4Rqjn1ku0w5
 5Gf5IX1xModQzKJZ3V32RceZaWFKSKTEsJVb9DFQO8bzMpmTN7dRbVmmPu1sygX3KAJ4or2WkAX
 oMOl/wUzRaHzUcbbDpBp0jtz7sTNdFrMkQq8s3rJkskUsxJ7IELt9OWwQX0B0+OuSsvzlslf8zg
 t6pFkYfDKzGXJ0jfwI3qHNZSWvPwY3+Kt7l59ldTCIAVl2PHLUtq04BR8hT9dO10HgU3z3TTAU3
 M19g566R5OXQV15LXUw==
X-Proofpoint-GUID: tES70heNpvEDfvyiZQKjLblaYJgPBWoW
X-Proofpoint-ORIG-GUID: tES70heNpvEDfvyiZQKjLblaYJgPBWoW
X-Authority-Analysis: v=2.4 cv=epdKXYpX c=1 sm=1 tr=0 ts=6aecf7dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=JerxfvFqMz+qeRdZ4jtV1Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=0-2_M6cSbhsvEd0Ws-sA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX2tuFUPEVGMcl
 lkRPeqDist0mvIdLGeIIjoB2diyaiF2ZosVdtA4uggKqZM75dhvczIhdvqFE+5rrAX0Hs0V9HiO
 H4ijFw5O+KmxTgKF8vN6/LppAQifn1ZiM2wmV8wK9Hna+1cmS72C
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 adultscore=0 impostorscore=10 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050085

On 11/3/26 1:37 PM, Eric Dumazet wrote:
>                  hrtimer_try_to_cancel(&n->timer);


One case I'm not sure about.  If napi_watchdog() is running when
hrtimer_start() is called, the timer is queued again and
hrtimer_try_to_cancel() returns -1 without dequeuing it.  With
preemptible RCU two napi_suspend_irqs() callers could both end up there
after the delete.  None of the callers run in hard irq or from
napi_watchdog() so would hrtimer_cancel() be ok there?

> Can you give this a try with your reproducer ?
> 


Yes, it works.

I'll send v2 with your approach.


Thanks!
Mani
