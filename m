Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30061E7C23
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591396; cv=none; b=PaoCR+7bnRzVsN0ZXbIJuIUQD1Hbf2U3kICzOwl9aeeL1AZ4+eIdxpHTrDL2AF8PwDbqzMPt/rKf8VlXBbtn3WzdiQF+Y41owixZ5/P3XNb5Kw+/AcOl9Z6OORNHJvZgt8QR03Oq3MWLtQh2g5KK5JXpTR2ZSAUXNe3TxyIz6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591396; c=relaxed/simple;
	bh=5kCbcaTTTqgxxt8BaTH10ihf7QJwDiWdRV2+3PkCxNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1cPyXA8UWpB3+isMaHXUOkn18df8Hn6r8d5ikE5aZ59he0SYM8QAp1irGSJEy7YnyeAeG0RGmZOv2rZ9c941PM/Nt56VUrtQSXRyfu1fJDzIXagy10oyhGJFygRsN48RMSq1PgOsbLdEp+mdUrDb8whwb7qhgpF1U0lqE78J6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Kq0GhzJn; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=39QUCxuh; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Kq0GhzJn";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="39QUCxuh"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699MZfOW801429
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 20:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Oxe4
	FgcIrqZbXu5c8U3MHYqvLVmmx/Gg1O74bCce4C0=; b=Kq0GhzJnrSWzFX7TC8T+
	aas1DtcC24NtpQYuLxHodd81bapodk5H+a6MJKlNc0gNZmnPIJM5Pdc3nBQdgjk9
	lFZ2xidWLCgENj3xA8Zq7WzJK1pscsQorYQ8yILuqAcr9QeL7nJV1TiuHo4jR+P+
	yQOpXghlCRiDphIHjuY8D1j6TmwjlNuktZxHNAg5CjxzmcO6p+0SHJDAZvlt727d
	NBeRFE9+kHE0ocdJuybfSdv4BAJiw6QkZsvkhK0GTDQLGuZBiojKAbeNPgK1DIlt
	VG6VFiLD0ZniGFcK5Tm9ak9dV5F3vETBs/XiPu1JnpmfzdME0F9cryHhx8F459pp
	ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h74tdaks5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:16:32 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso5626906d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791591392; x=1792196192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxe4FgcIrqZbXu5c8U3MHYqvLVmmx/Gg1O74bCce4C0=;
        b=39QUCxuhUWqJOfh/Z4HVohNwufbFEjwOPHoRRbvTk6qrXpdAnDJPu0mkGQ7W8Mv38D
         AEJTS39kW8l+kjkV1TUFYUxfctau63uAX4AkAUSW/aZQV6+XD2IBmemQaO1pOjGLCAlb
         LCH61+6ANRMoBoLsBvxy50NM6dRai5k+FVU0wwE76K+jjk+1902ylIFBMEpzO+34YhZc
         Kf/7z6tHimzKULzbCA3Qg/sq7m7fPy5obR35ZKZdMg3usePgkKvmdqqpbd0H4nLkItJR
         JxRAyWaBTfXbPSWVmvG5glknMnX8kvBJu6TT/8C4F3unu4b/V5Hn95uMmka0lO4VElx8
         YawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791591392; x=1792196192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxe4FgcIrqZbXu5c8U3MHYqvLVmmx/Gg1O74bCce4C0=;
        b=UPBAP8HsMMekB4h8gm6wtc1D4u4ZfHSRH1u6IA7aceHnWlMEloAafBT4wR+4VIZTmn
         LGXSy7aVQzN42dlEUAlUEPqbt4wYqv1tFoSR5Gs5KzrWl/u9M9AUAoelZ4i+frvmaGya
         fpqRInGpI7ncT+Azs4I50dukzVB9LZS8tdYQHCHVAv+kkZ+4Bh7zoEdT6n/KhskDVHLg
         Y0MEyVeKO/FUCdLM4MJuv+RoW2CV0tVYu4nvJ0d1438fH0i8f+0M59sJ4cGtJZ4p0KqR
         u1NqYTv4KeklcLTVF3PQQh5XS6onWKc6OheHrRwwtKDNzMnvko7LfvXxovPlBjWYUuxe
         Pfmw==
X-Forwarded-Encrypted: i=1; AKwUvBxK0W14XiIOC/TKMQj6U/xiWv3y9YdsaIX4JQpDtKWlD/FzEZgzuVL/tRJOO0OvBAphCND1oJ++Slu3DUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7iOH+Fq7CxZwZPv+efDX5rWuPTqEtyNOnZvCk7CZrCT5ULa4M
	9/IR+z/hLKYriyJcmquv0v9pIZwJHJTd3oAuDKuK2w9tI6lWPVqIG4Z4/2UuliRdFEF2DNzunJc
	HzEWOCtgpWpV0U5dnuNo7eBsHuePa/o9ay5gQ/YmzFGZLRtVHfRrrJqjDDlw6FA==
X-Gm-Gg: AYBFou0B71W3JjG6K0KldYh3ny8/dXBa3kczPHlQHddb0yBJa8nOOOyj6bz5HNJRBFx
	siJJW39ulP/Wwpc6LdqGKtmxmGXap3o4HsqV8QEuhC88KaTB8jSFPGF0i/FozvKnFhFBlxuyAkO
	mW658Rv7C0LB9CG1G7XE5hS64+aNSkB2KlZ6LOoNTQQPGqAFoQq35qXiL/d9UhEsfOQHph5FfXE
	0E7WEQI8Oqy6bpN2Kl/nRHsKAU48hl5joxx4wOXrp4O//5kvDYIpq31/2smIDGnD2IUgSADh35L
	NGoruGwdvX8OpPZLiBPjr1Z8Mo9NcnOYzllawPOtbpn8sS+1CAfLeVpalYJNu2kgEFd2ZWGnoPS
	RJpi95aFNk7cKkFej9hVDpY627JAjfUyK3Y3beFl6lzsMpedu
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr593316185a.13.1791591391932;
        Fri, 09 Oct 2026 17:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr593311785a.13.1791591391404;
        Fri, 09 Oct 2026 17:16:31 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-178-194.net.columbia.edu. [128.59.178.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c350sm305668885a.22.2026.10.09.17.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 17:16:30 -0700 (PDT)
Message-ID: <35f4d048-c858-471f-bf9f-24a976094f73@columbia.edu>
Date: Fri, 9 Oct 2026 20:16:30 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] ceph: convert writeback path to folios
To: David Howells <dhowells@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>, ceph-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
 <1043695.1791475206@warthog.procyon.org.uk>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <1043695.1791475206@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0Evhar1kEtID9pMjJqdhaoKnvUJdQNZS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAwMCBTYWx0ZWRfX6n2FaNqcyURj
 MuNNHss7DkpwaU3ke8APtwz5hcjWHpzutFwcwsnF9phV15VrLd4WiybU+6Y9NroTvRz3uaX5QON
 HTxeRd+VwDrodljQi8YIa4zE7DZ2TYXVLzW9F/sPjvjBw4kENMh7
X-Authority-Analysis: v=2.4 cv=GrPXaU1C c=1 sm=1 tr=0 ts=6ac983e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=u0MKzLA9JmpizDwXU9Rxjg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=VwQbUJbxAAAA:8 a=D3aJNg95PxMWSXTfbh8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 0Evhar1kEtID9pMjJqdhaoKnvUJdQNZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAwMCBTYWx0ZWRfXxDbRMBZTsbUR
 SxpuzZSpYrNVvD2UnXF6A7YmBnBB341xsv0Knelc1NyRPQ3+FtHcw3KCykuwCfHjMEBAyw5LEJP
 J9XAPM8tRx/SfHtPM9P2OkpfMvtqGMYYt2bSYKOl2qHDI78cS/axOIv5u3aj6g97reLgrYomYb5
 +CDv8nbRTZc2h495vhuQ5gCg8jhQjsfHiOOsKfnUM4v9WhHyRW0cvh9lWaN5AMYjYnU5jb3/1UP
 2gZD2mrVBKIvfnIEUDKtYwK3ZJixar88UpodFQDA4ELFuKoYkzOE4c+jIzsP7wUcURrp7SHkzMm
 W85p+uYdjHqAQRYfa2iTwW6W0xsI0j/UnnLnUhxOb+budbULfC5oxase/KvfdXKPukayv9EiYfK
 j7i0D6cPBxboiQp7/hV7nX5nqLkNR9qubnnsNwcerdL+OfJ98/uAF2u1lWItFnFECMhOS9I1LEv
 MrWwCe1qw500FZ6KA4A==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11930
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 spamscore=0 lowpriorityscore=10
 clxscore=1015 bulkscore=10 malwarescore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100000

H

On 10/8/26 12:00 PM, David Howells wrote:
> Hi Tal,
> 
> Apologies for not reaching out to you before, but I keep getting diverted on
> to other thing - usually by AI patch reviews.
> 
> Just to note that I have patches in the works to convert ceph to use netfslib
> and thus strip out all the dealing with pages/folios as much as possible -
> even getting down into the protocol and replacing the five different page
> carrying types with the same structure as is at the core of netfslib (bvecq
> chains) and pass the bvecq chains all the way into sendmsg() for transmission.
> 
> This also lets me remove ceph's use of the PG_private_2 flag which the MM
> people would really like back.  That's then replaced - transparently inside of
> netfslib - by setting a special ->private value on folios read from the
> server, marking them dirty and then having writeback write them to the cache.
> 
> It's unfortunately stalled on getting some netfslib changes in, though there
> may be hope for making some progress in this merge window.
> 
> If you go to my tree here:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
> 
> The netfs-next[12345] branches are the prerequisite patches I'm trying to get
> in at the moment, divided into five batches.
> 
> On top of that is my netfs-crypt branch that has content crypto support
> 
> And then on top of that is my ceph-iter branch.  Note that it's not fully
> working as yet and I'm still testing and fixing bits of it.
> 

That's great, I see it removes the ceph pagelist and with it the last couple
callers of __page_cache_alloc(). I wasn't planning on sending additional ceph
patches in the near future, as they would all require getting into the
protocol, so it's great to hear you're working on this!

> If you want to push these patches first, I can always adapt my patches to take
> account of them.
> 

It'd be great to get this series in sooner rather than later. I think it's
ready to be merged and it would let us remove five page wrappers of folio
functions immediately. Hopefully since it's fairly small it won't cause you
too much trouble.

Thanks,
Tal
