Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548490;
	b=hQ7N2atHTrk5/WrWZAvEIljo95c2l88xpJvuLRzh6bNtKnbaCXHhQgedSdyEf0M1xw+1
	 1UrrJiq+K+PmPtuRhKWPepQu6/mn7Q8dxW3N5YzvgJaob15wbIKgt2M6fc21H2GSEbHxy
	 8d3aQ3jIenbUBeUbRegVXSMtKhapSWQbjEaCVz10wi6kTIAIw89hp4G1NWIBImMEuIV5d
	 Yhz9fTKSd+Dvqc7vmHQrSPVbRjL0g2f7VcI+mpC1A7bNKlTFq3IKF/WG9vPGf7HFkW/Ii
	 k6v1eK/zx65R4iaPqBi122Td92/U1OWKirufVuJuX6XuuIsvhQ6/sre+ZIFNyqOggRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ESraT188hHqeA/eG2HAU4aWg3ncS/DlKucSFgZXYCzQ=;
	b=UiB/K60bwqT0ErF01VpmFH+WsBmZKJmusfMNR+e9CAatids386Ax1gO7/wFB7CtsfMkK
	 lj5QH+UlMIdYJ7/BVtoI6+eJvrGKZK2/RgqU8SR1o1jJwBnu+D8DD1/yh8NZLi7kJJ907
	 gakRHewqIa8zgJeIcDYOmhQwy1VLNGABXxnQA5zJQ5LJ5+eFhtUIbV2K/zKtRwZ6L1sBT
	 AkZaXBb/wuqOEzqhZzXN2Ia4KycuolWNjuxUmDmJe1EXHxlKH0sjzUIyeKhpq/OAhgIGJ
	 MTkugNqjwBV0sQNNHyJbJr+Y8JXW2SEpVENUULhfFZl70sRQn/tN4LlPDmUaU0lEfQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="P/K5G4Mq";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=uYDYlGG8;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE6606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFE6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=P/K5G4Mq;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=uYDYlGG8
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1Fg6HX3751800
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 10:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ESra
	T188hHqeA/eG2HAU4aWg3ncS/DlKucSFgZXYCzQ=; b=P/K5G4MqEuZj9+6+RC9s
	jnCwKpynXG5iiq0cGPCeDjgJ54gVhUu9AfrGHD3HwtbCoiAcHToOPbuUz6LWJFTD
	9FIjOEFgB1+fgFZtNSTc7RfNrR356rGOgHrSdZ5vT3vLxkmoIN4eS/27VThq0Rf6
	JEbNc+8tuvdUQaAUoabBGaZX4w46BM1trPb+2QQYS2fnJHoorpvX84dR2zD3OLIn
	l/KRnqYFddnkjJIrglo5U85zxeVyyANYOOiEaj+ILTcfJAqqNNkDRY6eqHecnujN
	nItLYO7BXQ/j3zV0DNPBftKyL8rj+nSO32tYdtaDouydEVQI6wJwko6Sm2dfMGbh
	Gw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hp89qg1fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:54:48 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5352436cd78so21066211cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793548488; x=1794153288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESraT188hHqeA/eG2HAU4aWg3ncS/DlKucSFgZXYCzQ=;
        b=uYDYlGG8d/0I6GlyEkyukBYsbOH6CXVC2ZY3iC3EnzdyNYjyc/+kuRT47u29ku7Rvs
         5ES6/SmPMC3MfNT2XKagvqkiBHwxvoov6x4nWXpvjLKonHVkSstt2qBGnZ5gzJGcDjyS
         3vw3LJS7s0qQ5zDC/0XMrjV49TfZu8QH7Doqd4R0hVQH+h7rGjdYxtSJn+T6pVISt+Ar
         tY9flTKjgbe4xgvYnH2p3RL7asolYnpTL4O1wsanqJHkf5SV59MoUSlgieSS154nFqtQ
         60H+aNH3j7rUj2Lc+IN5JdSj2uIkggM6XwK7ooymh7tyHsTK0sCE3eTPRytTYJswpnit
         suCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548488; x=1794153288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESraT188hHqeA/eG2HAU4aWg3ncS/DlKucSFgZXYCzQ=;
        b=g7tfJfNGX9vv9fp3BS8BgCrLngeGfq3oamvrappT1sLb07OS1yhz53gUUAP6NCmHue
         9WYqAzatkc9i99b0Y0fdVo2wHrZAIvDTvBpEmI4f8RPjgtEWfTQdPkWlzy1Nk4AN1ASV
         qjQvEKyBkvY37ZAATg5nWCtiZwlxZqeOWBzUdnNJVITqz1wID7345AH5T46O+F7fBG6J
         LUYAcrnwh7jnX0knCMRCltK/XiQq9HpDea0+cnOfciLnKTovB7pyMOLweL9jyHsn/gQf
         lv2ZRKaqOZY/ZZ4zUmUH0r35xKtG9qHnffQ2REzUiDXr9zg7YAVn3V1q8LI6F05UeDHr
         hmpw==
X-Forwarded-Encrypted: i=1; AKwUvBybylZ9I2t/Miu6/C6HZh/ncghZWz5YD/VA/UqxC2Ny7xtADLXTYRpHoSLdADPJj7O+yipo2HUaWHWxlMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5zgRCiR0wZsbCEbak7Nz3f0IZwcocmtm0rC9sCevCxjS3kebH
	w+T4XvacnWG9PyNRpt+w0QWOwGysUdyculI9wThC43iBpMtgP2IHf1qHjQba4gBSrye3gGKtbmf
	9BjK22EyOY9Jcrrx6e6i7BTfnZZRGN3ItX8xPE0TbraTSV/kDHw6OcVvZgiCxug==
X-Gm-Gg: AYBFou2rwGVT9JNGCOF/FV8+8EES6putm3AA8iTNA+XJNMZ/IiBUwvS6lDid6QwwIRQ
	38UARPHB5RozBg2YFV/IAK7FGDjCwEzbJot/0oJ0RJ0y7Pi610CzDub2PWOOLcUDrc241EbvS1p
	9Dp85nTQhwEvRshM1+a+U1JVI10Zc93AT70cFZKfWjQOrDit8pdsXlOnRYJQlyD3meJ9vbzJkx9
	P70emv2HGfViwpUjpsrLz9ig5q3CX0EI6vFXkb/pkWFLP9G0dtGp0LcLn0p3I4MG5sih9bMYOjI
	yrrFeN63rQGBxIBYXSgvjBRdSlbC3OHitZCMP2SuA2s+8fjYJ0UuFcnpfR2RQYWvpFimjnfnYY2
	Uw7sKGO6oSzk7ba6jSkYVv9RlT6Co9S0Jr3qZoSaAnGpg2Iryo9fnG9Voh3Uiwx62IJQvLXRg56
	cAlPKsu2a6FfEkuqhjJzMis7BOfaO66FWAanACxEjwAQbETDvA9+BcQXIplvmxAK8I52OFvavU8
	tXVJWKAAgdGtzVEN/XfJwnS4zknrq39Isq4AsK9+COTcxk2/G8quiLxCOQ9pVrL04NzIcd25/7u
	ky8k3SY5Md/RUrIh9Js=
X-Received: by 2002:a05:622a:649:b0:536:6946:748c with SMTP id d75a77b69052e-542b771ed82mr132792351cf.53.1793548487887;
        Sun, 01 Nov 2026 07:54:47 -0800 (PST)
X-Received: by 2002:a05:622a:649:b0:536:6946:748c with SMTP id d75a77b69052e-542b771ed82mr132791951cf.53.1793548487394;
        Sun, 01 Nov 2026 07:54:47 -0800 (PST)
Received: from [192.168.1.187] (ool-18e492e0.dyn.optonline.net. [24.228.146.224])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54311f75fd7sm63339941cf.11.2026.11.01.07.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 07:54:47 -0800 (PST)
Message-ID: <b12ae064-012d-44b9-9d27-461e4af83f3f@columbia.edu>
Date: Sun, 1 Nov 2026 10:54:46 -0500
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
Subject: Re: [PATCH] mm/swapfile: drop a large unmapped swap-in folio in
 unuse_pte()
To: Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
        Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
References: <20261030-swapin-large-unmapped-v1-1-41e4ae378e6c@columbia.edu>
 <20261030155419.b10056c8fb37bc784b0d2778@linux-foundation.org>
 <CAMgjq7AUvsHVKkHmLzL-KKf+MBed6e4TeVP7jcGMLM22xO+=5g@mail.gmail.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <CAMgjq7AUvsHVKkHmLzL-KKf+MBed6e4TeVP7jcGMLM22xO+=5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA2MyBTYWx0ZWRfXxQ6sSTIE8xVb
 j/wYneZvWNk23yp6rix3nXkaPl170iUReAOC5rLNtXEuSeKInv8DXzW44iw6K9imyY9AeXdcK6j
 4V4/4OhVUzYR/yxe/k+dhNyXxgYqjbdiuj3K0afhDDBi1FTLDDsHL9SQ3HcEu109pHEgV+U+tvO
 tnoKIY99O6HAtPOF5pjXYJZ//uTeW/HKDEii2vvarnHp8HwO5M5KBRwCblqCLAUkWd5/RJZ/71J
 r77qAmGmJNZwEAi5FAgBywUUKZX1csRGhGZTJ6nsfRw+zbqb4qk2CsQVrBNjeRy26pYPt6is0kG
 EfPyxV0RsCazoK84ufJZXZjU/1ZGWbyHA6ddi6Fjz0DkKxxqz2bPjej4jHlHMP5ASdo7MpxHKJE
 POhSCFEMws+xvebFZ4W1Wslu0PSL4PBTxRIIuoRP3Wm0q2vDl8kcOOAhMPEaxGfWC+RoImJj/5y
 1KvuokeqRmtG8C1w7tQ==
X-Authority-Analysis: v=2.4 cv=ML71C8Zl c=1 sm=1 tr=0 ts=6ae760c8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FE+fbgsriwsnvVT5CFHM3g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=Z4Rwk6OoAAAA:8 a=CbAtmpW2TtMjExKzJAEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA2MyBTYWx0ZWRfX9JwRKYY0GC8n
 vfY0tdOuvqR7t7EvZ27cW4bN2/ewxc3STI44OtA9G0wf+9Xio9gw/LQU/9n08k8TsxWaeVTUhXW
 frsUuh8itzQbuA0OXTOl+JL+3HOvcYaR98GZIH4XvipX/0oAAJ3J
X-Proofpoint-GUID: 8pa_KWtu8vfW5XyF1UVayx69zdajB-vC
X-Proofpoint-ORIG-GUID: 8pa_KWtu8vfW5XyF1UVayx69zdajB-vC
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=10 impostorscore=10 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=10 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010063

On 10/31/26 1:54 AM, Kairui Song wrote:
> On Sat, Oct 31, 2026 at 6:54 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>> Also, won't this change cause try_to_unuse() to keep spinning away until
>> someone kills it?  Might be better to return -EBUSY and fail the
>> swapoff?
> 
> It seems fine? The folio is removed from the swap cache, so the next pass
> will go on. But you're right about the dirty and WARN case, it spins, so
> maybe:
> 
>     if (unlikely(folio_test_large(folio) && !folio_test_anon(folio))) {
>        if (WARN_ON_ONCE(folio_test_dirty(folio)))
>           return -EBUSY;
>        swap_cache_del_folio(folio);
>        return 0;
>     }


Right, in the normal case the next pass of try_to_unuse() just swaps the
entry in as a small folio, so only the dirty case would spin.

David suggested a VM_WARN_ON_ONCE() since a dirty folio here would mean
a bug elsewhere, so for v2 I'm thinking of combining the two.  It'd be
a VM_WARN_ON_ONCE() for the dirty case, and the folio stays in the swap
cache with -EBUSY returned.

Thanks for taking a look!

Mani


