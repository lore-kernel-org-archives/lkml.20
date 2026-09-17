Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F5376BC2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618138; cv=none; b=HWubXUjlHPvmRE46AMxQNaIC+CM5+EzH6zjdbPaCayq/7JsipAsdj+xDF+xKZDMEFQZInhxggkR0VwAJzvLisRHx4vU2Z3sa42/y5GiVcj7cbdirstisy5VfhdGbpfBezSyuHjKwH8Jf53dmoi8vi8+g9yjHQgsXKD+sKn+kurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618138; c=relaxed/simple;
	bh=90eSkqPcwTtZSl430/UWNYYptyYwyDsGB3QhMrAgVVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnZF+q13lUDX2VuNeaqbxPJvEQhICAEj/OM5vHHRyldByG3xpc03WW96fKZC2zit0qzW0bYCYKnXrRKkqllKnZS7ZwnaZKiN4XtFwHln0LmCFJTh5U53j9wjHGi7b/Gmx6Qm5c2/DzD8weidiPLDBVGDY8G2r07QNuy7pvK5gGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Fw9noaA1; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=iMeeEnoz; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Fw9noaA1";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="iMeeEnoz"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2Z1fp2150907
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4MsU
	G70Wxa0eAr2SAA/0CgdYUX3vDnkmNZ7zeQKTXH4=; b=Fw9noaA1FqS+6l/o3z9T
	84pZlR5APSrMrHKrJE/h0+J/6xSiUOm2+7iRX1mXOKGEHYw53tUbgkoJgrKD+Isl
	M3twCkSJbl1SAWEgj4Yh9EMNmnbsx1lMChS+Xi/NR2pT5hrSrhfEhbYSIb6TNqWA
	DvLWozlsidXH9G87qjEYEwue/rf9A4N1VGpJU9IvQAjjbMblo+KqYpv8ish0k3fp
	hkj0itOozslY979hiF1+f4N8n+kb4SOi/0s99Dn8t5mb7+4T3+N7OZqyu2GIYdT6
	VNo0wOrx9JKQgEYqTCMun/mKsus/yXPsaO3yHbxCKrQ2NuFU5qUPoGyNlWaLt5xK
	vQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr0kqbahw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:56 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532862dbdceso6124021cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789618135; x=1790222935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MsUG70Wxa0eAr2SAA/0CgdYUX3vDnkmNZ7zeQKTXH4=;
        b=iMeeEnozxC6qdwDazdYB8K6AKZTp1CSeCkHmGH5UJSi6PhVYv+rwGCmK86Vmcwlz7J
         UmD4LFTQCuVmho7qLNOwvr9PFqrAF3ruyUGVdnU+W+GmePqZyHcqNYzA7NYZLt4Xn+95
         nqt7wKZ8ayThw/IbXCZM2gAaH13rKK01aca203Jexvz4b60pbybwWYft4f6/dASum10e
         NQMLobtiqqM7pX9MBJYrYlb7TWQF4idXxNSQKxgAxrjxnsdTSGk3zvc272ErP8vcVnkv
         UNjJhifWIZvNu+v7rxwBh+hmv6blN6uYeznmQBAGgD5JN431blAcZYr3ZXsP+P+fkEzv
         xJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789618135; x=1790222935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MsUG70Wxa0eAr2SAA/0CgdYUX3vDnkmNZ7zeQKTXH4=;
        b=Jq/dzfUHjdMWPF53fg/SbgrgQR52vd4BInEW78L1M73wsbUP4PgW8ywk/HYGsyP9zu
         YZbJfKaTATvAA4fLMJ4hR1L3lNGOLPwh/jiYYPP72ulDzlb5644nNapX3Xg5BejRi2Fs
         hxYrX4dkoLLeHo3w89Eo9dfkzs1TDXnwpaCLSKGilrES5f6k9fIR5uLqF5uAi1TKTi++
         /sKWsYMPsK7Eypi2ULXYV+mQjPDhZ2GeCMBbK96mC0aSimuDdb9WnlTzpLQ4XGRgVeWO
         nKqTQvN6+sj4eRtSy99Hx2E1nDgYn4ubht3QgHOsZ6Y9ZnzJAlLugEGV51e6R3NAyx1q
         3vIA==
X-Forwarded-Encrypted: i=1; AKwUvBwq3k1LZ7blb86n4udcOsEC7fGDZvtXXcY0Euk8H/Pm+WLF2YrUh/mIyKbol5JtQEBE/EOwHDNSi6KzcDs=@vger.kernel.org
X-Gm-Message-State: AFuF++nj4iu0n+7i/IDibuyf8dv9TuS/LQ3wPEABoiWFXuFK9CUSlsAX
	o0Jnf8iDwkG650Cq5TevAmmrsImwP2TYFsfaBhNxiP1EbVrTYS4MfnLNjFKeuzPX+FyPVbyaj1i
	uikbS0mwM2nRhV0aKjYRokVEjViOfSTLbF3lMsVnXzlyVIyZUOGDPNr7hqf1mHw==
X-Gm-Gg: AYBFou2wrAC0EDZW2EbgFEB3iiDlsQrMJ/Xjdl3HC3tlKz90n/TwGdOQSiwRARSjoJV
	F7ZHBo10oBuNV0Y3L5yr6ZbuuOsYNLq2cP8bguaazDd2Spb4tfJXOlPTdRbOCCjYJbnLtU0pA3X
	qRRaycWFbpQEL6M0TdjrQ9ztDWvsexg6MZ/5taIdgKUSTcNtrkX1bR/JzMGUdVbIgUQUwkWvr7I
	xOWXevSIsPkpWraECDd31XIZSQ3b8zEIqxsV6A6WM//uBcQpRR+fcjQAo+XY5gxP26vVks7pbns
	wo3FhBJjbzZp1Mms/GnOe7UpHsXnFYblA+i72Hr4qpLILThjlR2SwoZMsBAGaxwsVxxunmfN30j
	BlS94vFeM/Dvw/vdA3eSUfVfxbWgfds1kDvTr4TO1Be0iZTxTDg==
X-Received: by 2002:ac8:7e86:0:b0:530:430e:8126 with SMTP id d75a77b69052e-5327ef48422mr75468421cf.47.1789618135145;
        Wed, 16 Sep 2026 21:08:55 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:530:430e:8126 with SMTP id d75a77b69052e-5327ef48422mr75468181cf.47.1789618134691;
        Wed, 16 Sep 2026 21:08:54 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532620d4cbbsm39536581cf.28.2026.09.16.21.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 21:08:54 -0700 (PDT)
Message-ID: <af7d1ac8-7ef2-4227-949b-21c3a9097158@columbia.edu>
Date: Thu, 17 Sep 2026 00:08:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] mm: memcontrol: constify the read side of the
 memcg API
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        "Liam R. Howlett"
 <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
        Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
 <20260916035222.GA19557@shakeel.butt@linux.dev> <aqrRewVuKfPk7y1U@lucifer>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <aqrRewVuKfPk7y1U@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0OCBTYWx0ZWRfXyFpBPY0afWhZ
 SbK9ply9+iR9m8rtKChyFmjPynZMXywIpcBcy1XYgteI86ATFmOpXIA1EHtF6On3VxZHvVRlrjX
 cSVs0R4sereA2SBnvpJNa4rhvhpLAX52pu0X4CO+xVJ6lS30HHBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0OCBTYWx0ZWRfX5B7pkpWR//TS
 jTC3HCuuBL0pPytlukwrU4AkMRWoF2UEGKVBPCZeDuyLdDC+U9P6TNtM4Xz/ufexX1KrzkSTXfz
 pQcty3qxM6GNM0u2JhNBS9uNWnsNDkjBf45YJ30sxTF9xOx1SbfLSqChLzqcfxKCZWf1o+xC1Yl
 951oLpmrJkNPhNUwr68o01RghNK+4wdAQCMFbWNG7cVBGpsz6koNEcpL2ZlliM5RmV3v7dvoF59
 +SUwPSICvnmtxg5hyFfEWbtTj5+32sYjYNt2hD9mf4JoaFw6G25x+gRpfg+ecvxGD/GwD+gJkUt
 JW4oLVWVoMCJApsZ83HxPIQpThw+JMdcvDyq6ELMzXyiIbz1bSVCvSvkkyDnm4Ugrvvtcui4yBg
 v4PMPzjstVdhpjXH0A0Eock1Dl5UalUnyh9Xfr9+hGXjvLjItxPJfo+oq6bw0IV8xLCN3VbCS/9
 CrXEJmSrtoONtM5U9Wg==
X-Proofpoint-GUID: ZvGTtlrWkxH_Bh_UOBZk6ueVOmoMdyuG
X-Authority-Analysis: v=2.4 cv=ZbqIpcVA c=1 sm=1 tr=0 ts=6aab67d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=65z7is_U1JLoJa5uI7QA:9 a=QEXdDO2ut3YA:10 a=QtEvL3ry9E0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZvGTtlrWkxH_Bh_UOBZk6ueVOmoMdyuG
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=10 malwarescore=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170048

On 9/16/26 1:28 PM, Lorenzo Stoakes (ARM) wrote:
> but obviously, equally so for v3 :) thanks for doing this!
> 
> For whole series:
> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 

Thanks Lorenzo, Shakeel, and Muchun for the reviews!

