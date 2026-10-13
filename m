Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E44524AED
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910135; cv=none; b=h4qxfNUb2c0Oz1u+N9NaGWpLboNIJsH+Jl7IXCmF/+duKQI1+sFnkV21Nq6bnoXhihQ4J9sCGaogxElg1T/XguEcXp2KCoY6KZMkW4MJBVdZh906CnDW1zktF2GwEieEfHBligtEpZm2te6c626RwWtHQ6ZgoroOtnBjURZR5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910135; c=relaxed/simple;
	bh=wfXYcxBUcTdkEAfVqMYgLd40XfjKpjEq8JpUHlnvryQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ii5HDxU87bCjOuxvU16DEQN0q3Naq2a6CDOFA19W/Be+0y3CWtLWJM4sJSvz8vQSXXXm9/bq4MggiP7s7FzJejrqj/sA2O4+7RxwMFeiHGQz3O/tpiKI5R2wLC93IG6TUA4dEJXiAnXPDuzwlJDXPumibgnKt/aNwIIDufklAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hefqC7JP; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=FJ6hUTV7; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hefqC7JP";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="FJ6hUTV7"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGY7Xm3890161
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fqnh
	mGiFYREgWzQ661rb4bCN5SeACDTG22KgE4Jv5Dg=; b=hefqC7JPUhIOkuMn8GZl
	g7CaTNm3d7MgAuKshB7xEH4jUQL3Y5fYCovCEQ9QORRAyUUoShBXGLMwpqOWgkIx
	Skb8QKoNwr5qhqUhWAXR84qcmywPWPHFEgb0qDPquVpD9tSkMswBBs+lF1oTKm27
	OBeM9PyLx8/Z5JhtwVYBMHLhOz044kB1PxFDR3P6ZM2sfHQU8xLmnVp7w/O/wkqs
	hg3jrY0+LFGHoKNqpRyX65O2dWuEZLwVlwepSL1osBsw8xVk9RmuOUS+zZWHIDvJ
	X6upshbOxE4zvSUCuhGUOAgdFUm8kKJ4oZhwWOzNBYQnypjNZFAWxLogQauuobbf
	ow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h9q1c0xsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:48:52 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8306ba68so47746706d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791910132; x=1792514932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhmGiFYREgWzQ661rb4bCN5SeACDTG22KgE4Jv5Dg=;
        b=FJ6hUTV7tLNJsX1HVg0t3jS0TqCut299ilx9dBqHaVkH2X7LJC1/PBgLhY8ED5t14b
         miBsbFGViZuamLdch0dywaF7SPecEQg9VVuP5DTjhn1WIgnGC/yQH59CUiXc9PMGCFV/
         YNOp2wt1zx2LVTiliZrQNNS+CJJMVnbXfo7tjdHhS80k49ECVXb33lEOHjTv8GiKSswp
         OpHh4il5JyC16ccnk4uU9sjvmMJstMkCl2sfRJc9LtaYWetsoOv990aN2GI3kHmBuvue
         bjDBhYkbCVHOP+gGp0qRjMbhJ0jj+RFKTHo6llTeE13y31w19mdEIwBNpHlwVjE/qN/o
         r1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910132; x=1792514932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhmGiFYREgWzQ661rb4bCN5SeACDTG22KgE4Jv5Dg=;
        b=x/nSe6bmk/gTJ7FLulZML6Ci+a7SACDpkfrMFeGD91D3UIrjCfe5q/X099QFayalAK
         zsMXPyg7IOQ6hsRCfi2Jv/1OyXyB9v3DN4Em3pozxj55ZWs3PZbTv15zyffXZMYiKCHh
         hlId605Le1oy3MOZk1CZad7ZhLv22svWKC8lIW7ev1ycfykpaQQoQno1Wfw9Wflnwdwh
         3vqxKFWt16dTZ7ZmzOXArsbcr9LeehtnMjhIMWs2wC1F3lbw8D9UCpJ+1KHA8j2cnNot
         aMShKfHkpESKiKWKSmxAHg3iDFXqcqu/F3Q1DHBDz1vqFIQy3saIpWzJE2U/qKx7faLt
         /ZVA==
X-Forwarded-Encrypted: i=1; AKwUvByKbhes9a8RiDIinw8PuF1aVBUmrueSqIIN0+WvPTopwlJxd+a1UNh1DqwHdujroRLyJ8OgSvsy9/xPPm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxyikN3kQi9nSbmXSgeQgpiXFjlOL0qjqVGEFSr7S81rZNdO2G
	KR6rrzipunzkDLRU1Ih8+fkL5mfQyOdME1CrB8Tza19F4oNlCHZNWafrFrPWYP5pq8QfxE2udGl
	/gmq1yx0NZ5SrhjTRS5gXPQLDtQWRePbJLtsbaaS2cJeYti6ir2cPf/a1eTCnHg==
X-Gm-Gg: AYBFou24GOk7tWOc8hqCFTbRvhYTpOPSF8/3X5D+a3je0UsNBhuZDG9+yAWwX1tMnQq
	py5So0thKqWI17l3SDTbtoPipSdDsjjHqnwsC94xwXYWfY2zPPBUoFkURePFJ2ehGl8rqe3wn35
	F4ZfeVvrn2A6vkPP8FeJkMhuQPGTk/oiU+OxLUvL0VeoXnp1F3los2gsW47dxxIOGUpPXFdtnG9
	WWzX60PR8R6tSjW0WnCYU3mMLipxKvnIEKenvm6K29K6gp7FK4m4dNkxdS58mFAje4IbxcZgdZM
	PHi+MejoX2pJ/AUFztiAr6MyF2gdAOHOiVBnlWcAlVHKDZRQMBBYuEcwlk6UmqJvUwRTd+3l8Bf
	tTPflhcjMgqhg1Yu+I66SEEHmVB+v3C0v6ejEfW4rwwN1Bg==
X-Received: by 2002:a05:6214:4893:b0:91b:7601:342b with SMTP id 6a1803df08f44-91b76013458mr137818676d6.49.1791910132195;
        Tue, 13 Oct 2026 09:48:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4893:b0:91b:7601:342b with SMTP id 6a1803df08f44-91b76013458mr137818246d6.49.1791910131585;
        Tue, 13 Oct 2026 09:48:51 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b62240sm29626596d6.23.2026.10.13.09.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:48:51 -0700 (PDT)
Message-ID: <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
Date: Tue, 13 Oct 2026 12:48:50 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8GWitRX c=1 sm=1 tr=0 ts=6ace60f4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=k44reLmm0aztwNJzYC0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfXwJAnqxCPwkqE
 WwrhS4F0OJz3S6khyRw62TbhexVhZMYRjO1mRfbeT+ZFHwG4vyZW4TlqubvNXuBKm//L3Kg9gJF
 v04B0qHFCAOheiFAa73RdNfGw3/vHZzV3j5LhX8BnlPNplIbDUjp
X-Proofpoint-GUID: B1XKBwfNtWTFHqmId5osE6c_hGclX_My
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfXwhEQCFQQ7bmW
 aybRm/uf+mfHbF2Wo7zyUqMJkP8la+yw5yXUbGZT3VQzlBIbMxTRIChYpOg03PJPp+AAkneJiav
 CGAeMxNOIlxuXBLMnTMV3Hbk/tIr+a15Ews3LjeD6BZOTmasgIxJa9zZHIc6wKl5FXps/AapdUV
 95C3Ma8U+vjC8IIC5e+m6F8dTqF/BAW+o8CIo5pLTGObsLt7fnpIvqPucgbM48YpJJ20CM+ny+G
 5FL9lEEpZ94gyodBJOO1U4hRxGVowi6q0xkhih8Zp++3Tk4z9DojfRzlWemgRGQBH1wOEvyV28f
 0F2p9hDBgIFOfglhIpc3Bpfd+fVNlE6j6F1kqZL4AEDEPVR72J7MP466YVUixrzU1KsQvaJo2tO
 Vi+1HekTk+1OSK1/PMpJhB4bvZdk4qrian+Cg066GGGMUJDXEbJbmoyBrKLHiOaqNgNz97HHKbh
 pvk+iWbyMiThkXr6NMA==
X-Proofpoint-ORIG-GUID: B1XKBwfNtWTFHqmId5osE6c_hGclX_My
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=10
 bulkscore=10 lowpriorityscore=10 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130065

On 9/24/26 7:42 PM, Tal Zussman wrote:
> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
> removes the last caller of find_get_page_flags() and one of the last
> callers of find_lock_page().
> 
> Based on fuse/for-next.
> 

Hi,

Following up on this. It'd be great to get this in as it would allow us
to remove find_get_page_flags() and find_lock_page() next cycle.

Thanks,
Tal


> ---
> Tal Zussman (2):
>       fuse: convert fuse_add_dirent_to_cache() to use folios
>       fuse: convert fuse_readdir_cached() to use folios
> 
>  fs/fuse/readdir.c | 70 ++++++++++++++++++++++++++++---------------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
> ---
> base-commit: 10bd6b32965265688fa277d166ab224de8e86eb2
> change-id: 20260906-fuse-readdir-folio-009ae33a7854
> 
> Best regards,
> --  
> Tal Zussman <tz2294@columbia.edu>

