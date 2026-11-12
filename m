Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506618;
	b=is1CJ36EC+Yi3f+61TS/Urnj61HG7Qxz8TjgPDiQBPQS87NaUOkZK6GOizaNiBr6VlM9
	 3jOh1A93YkcUktbHtZzQxqaUC4SipIUaerY9gLy908fCYKlYjQU3ujNteZwQjqO0U8wtT
	 MV6H055WK+owYp80Mum5uHqDjSRvxzDu9FCD5HR5YRFNUFIX0r4pZlOWsVKF9T74mOBE+
	 ad6K66aTio+gHV1JdxZoewF2E880tAbJGGpkQSe9Y+7dicHgrcm8ckNz2mfsTFvJB4k8N
	 QSIAdBzKV4SgiL8dduxW5Zcskz1tit2xTscL+b/jgHT4Hs564Ulkyzb464/KSrDIfFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=;
	b=A3pQ5T1RHb4dOZd40tHPqmmPq9L1cpJM3zU7TqIJz+oHq4/tnTuzhRK9UcnlWh+VW6Xl
	 Ox8o9RBX4EdfXATqn8///5/LVdAZIUFWaehIePdsOG7IwIytnRvtuuBPl9Un+3sU9PbO2
	 f5Z0i4iNgWvjdcShYx4Wa6nc+QZ+gmrxL7whF+HHdDeK0dVBN3h8O0Bsx0iSA31Wqj6TJ
	 f4PdC4eCghVPbmYcHMGKRjyZucArWRE5lvpzYulnYAqWhYQIRiRiX7HXur4HK5i+uLdpt
	 IkJdmX72i4i3eSDfofH2lRfD1sK35T7BgQNAa9zmVYCgtQO4miH7Jb5LQteL5T3XaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IpV8/bXk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ss8TDFcW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF55606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpV8/bXk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ss8TDFcW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZUd13841266
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=; b=IpV8/bXkpYXuHKVf
	kdWRRPY9OgvhYkjJ9MVBevP/Md7oek15QRAzpgkKf6CHE1OCUKr19RE/4q+x532M
	2Ic/9mkFsJWPZIKBqrbIP0w8fv5tkqveh/hZIyy2EtfZsa4+9Oas4kRJB164knVa
	MhJ6VK1S576kZjFjLSxjcfYD3ot+JTaY8Ojpjdhne7Oy4qaTjBKwU203HqTpXH53
	W4jdkp0kMzDJXwkt4Z/w2XTg+WzfskLVhG96XXTA8+1HBP56Bz6aOgO8YDD9iZkG
	NEOBRQIBENPXEKUZ7+6EfvuhZFhGPuTuO/EWfq8vvOL35D+V+RDButzh2h6Kaxom
	d7TN9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1aach-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so46384e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794506616; x=1795111416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=;
        b=Ss8TDFcWlia5yaF4YCZ0rMhiY84SrFXeb+C6j/TgIXjx7PF0pWhYdNE8eoZ+js5ATJ
         +QxpNgPr1g5Nn8PqB1qGwoejhLBrW18b7Y7A0tZHk8+CVquB+pqqjGORER1Kk6bur3L1
         dn5MP7+Y23jQbhIfbOYNcvCS78Ml2ehE2t/M9jiIrmdQVQ4quudNn9+QtDmptaVM8xlo
         zClv297K/+tcd+yt865PCAxvteqxhiWlFmc6DpBQW1lBJKvKUroHtyRvPSy6rKcqbQfo
         s3+5D5PYQhY+Dg0F05KosgjUBrqSe47iUIt9Z5RoWDyF6bjgZE/EXg+EMCoIZFGX5uC5
         9U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506616; x=1795111416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=;
        b=KFeLJQr7968K2H9ZfsvtpQz34hXnpv+jKFcvzk0hreSXLxTPbY3H5s0x6V6GRBLYE2
         bRtG5fYI2OhaUiywNmHCqlYD8Z17Gmzv7ejgTLyd736Lw18JomsuVWcynYU15VjBU3Ro
         9RI8VmcCZSozwDDwU3QYZ9wwAHQlIO7MyGIgaIhnt55KYzJY4q/LLQ2g5VQQqpUL9Iaq
         BLyOU/9pE5VjzbK/cSsA7P3xFdwr8giVPZLYxmq3z7UkjFfw4spWzPSyH0FppepqZTaF
         1eRFtbz16SeHxpYN26R3dL3fJ6ziF07LM23O2aun4VmfgWX0lQxpbHo//deMu3WzI/CE
         YGjg==
X-Forwarded-Encrypted: i=1; AL+hErE7g65VGFoiejTRSF5k7Pai2BOwI5OkEQZXiPz4XZuK/AumDq/YBZyT5K5nzRGEhIIZ3Wg3iz03plwZmw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D6y7hWh8Dd7HlXLghxcxhkW9PkSQZRaAWLJTSe6GE2n6mRvLi
	Oa/VxOIgHZFF/vonvspnQ9VBL2CuFOK6v4iW39E9rzMQhI3SyncfBJDRQ/AQZz84mhNM8Q8EBXB
	IsrrOjJcaJuqYBVzE2QJmMnvoL9MQAPx+Nw873e6NEiZS8LX5+UTdQTMKut+CRszHrkGlwGYYwE
	Nraw==
X-Gm-Gg: AYBFou16MfwPB69TYv0uxNb9T9ELRaoYEsqXJu4585TdGHG6iEq6iwTZHLZi3R4ffHF
	zfS0FRikDvvL4tuERDsNS1XaMOQr6zxhSbwU+Wj3HZoomXhoURcW7CWJPjLK+mReWuhxwxFGwis
	JTsGBFE7QrPMK56Vwp3EbCiu34M9AOGGcIkfov3TOtFfPbYFG7TvsLk3ox+0fyohzPd3qKhTsb+
	TUwPzbFbpqKZ+ei4qqzbvrQUk5jf3A0+gz6ClYdLRTUrsZ8p9ghxAa7XZgLiyqd804xOO1mq899
	vcypFz857rju5nY27fa0GS8KGrX4ubaZRfMOtVy6bO3tkVICFHA+4XJT57hGUB8Ltn0kgC1GdQc
	8wSJOeN+Xn6mFW5M+RtNRe+tGDL8dmeIZANbfe+irUCs9sJ82q64wDeyuEuacv0ld3xipnFJA/J
	/jlogGTDoPK2GiFpQKmel9GcFdYl6WQynKsrQ=
X-Received: by 2002:a05:6122:3d06:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee1c41a938mr2612959e0c.14.1794506615464;
        Thu, 12 Nov 2026 10:03:35 -0800 (PST)
X-Received: by 2002:a05:6122:3d06:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee1c41a938mr2612929e0c.14.1794506614860;
        Thu, 12 Nov 2026 10:03:34 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm80058415e9.14.2026.11.12.10.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:32 -0800 (PST)
Message-ID: <d30df23c-c1f4-4a7d-a56d-33c1f9e1a6f7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:03:31 +0100
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
Subject: Re: [PATCH 1/2] smpboot: Allow restricting per-CPU threads to a CPU
 mask
To: Thomas Gleixner <tglx@kernel.org>, akpm@linux-foundation.org,
        rafael@kernel.org, peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:CPU HOTPLUG" <linux-kernel@vger.kernel.org>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
 <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
 <87zeverlrs.ffs@fw13>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <87zeverlrs.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfXxrUw1/pmAb8c
 PWrKjaK57SY+NbpLMCRS1hgsXqG8qoz/sMu6N2E8VXPVkLuPSxQBjVjppxCZvhPI4sISnQij/mN
 W5dCkDDxVJFmp56mYkITCFfU+MUSKWHaH3bv1zKDrtyag6HFUMFFpTJ9UFUkXCM2NDRmn8TBqoE
 8pQXxFOmr8vsJipgbZIwAi1DDTDttldvOUF1Qm8XyACOpGk6pVwhQaqRuKcazQBDUoeyv6WI6Bn
 2CS0veM36+KnGo0x2pX65qyczrYymTESjFKMf9hrtJglBfrdyCRLPvznXJxuTmw+Jd8UqKlPcOV
 KUMr1PIIOYjoZEUvG4w8LRtCvO/GlmKgfxjJ2DTghUtHvjTJ5/0ktLGLoUw7DcxBqLYKz/K3z1Z
 lZZVQL5E8rq9qXWs6ovLWRInug/8+M5VEWYBlS+4rSAY5K580yoOIxIH4DGTzFNWzE225dVJt8d
 Y/t2nj/ZEqWEIjo1CFQ==
X-Proofpoint-GUID: Od603GS5u4kTAVQtz8WC2OD1i8YRSpMq
X-Proofpoint-ORIG-GUID: Od603GS5u4kTAVQtz8WC2OD1i8YRSpMq
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5ff78 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=A-cxFYNZenKyrZAO6n4A:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX6ECFcS+WqLpv
 SMRZL097NTunOph5Jp6dlG1BdRFA2683pp3dsG3hoN4iie6/174WUB/aG1hMufl0KA7Xw1t0WM5
 hqevSyboDeEnOnACcDixFufo5kOrLIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120071


Hi Thomas,

thanks for reviewing the patch

On 11/12/26 18:40, Thomas Gleixner wrote:
> On Tue, Nov 03 2026 at 00:09, Daniel Lezcano wrote:
>> smpboot_register_percpu_thread() creates a thread for every online CPU
>> and registers the descriptor for subsequent CPU hotplug operations.
>> There is currently no way to restrict these threads to a subset of
>> CPUs, even when the user only needs work performed on that subset.
>>
>> For example, an idle injection device targets a specific CPU mask.
>> Creating threads outside that mask consumes resources unnecessarily.
>> Supporting multiple such devices also requires each descriptor to
>> manage only the threads associated with its own CPUs.
>>
>> Add an optional CPU mask to struct smp_hotplug_thread and apply it
>> throughout the thread lifecycle. Registration creates threads only for
>> online CPUs in the mask. CPU bring-up creates threads for selected
>> CPUs that were offline at registration, while parking and unparking
>> are restricted to the same mask.
>>
>> Apply the restriction to thread destruction as well, both during
>> unregistration and registration failure cleanup. This is necessary
>> when descriptors with disjoint masks share the same per-CPU task
>> storage: tearing down one descriptor must not stop or clear threads
>> owned by another descriptor.
>>
>> The caller must keep the mask valid and unchanged until the descriptor
>> is unregistered. Callers sharing per-CPU task storage must ensure their
>> masks do not overlap and serialize ownership changes themselves.
> 
> This really wants a built-in check which prevents overlapping
> registrations for the same thread storage. It's easy enough to do:
> 
> smpboot_register_percpu_thread()
> 
> 	if (!pt->cpumask)
> 		pt->cpu_mask = cpu_possible_mask;
> 
> 	guard(cpus_read_lock)();
>          guard(mutex)(&smpboot_threads_lock);
>          list_for_each_entry(ht, &hotplug_threads, list) {
> 		if (ht->store != pt->store)
>                  	continue;
>                  if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, pt->cpumask)))
>                  	return -EBUSY;
>          }
>                  
> Hmm?
Yes, I agree it will prevent strange things happening

Thanks for the suggestion

   -- Daniel
