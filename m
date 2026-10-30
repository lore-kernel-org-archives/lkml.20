Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356218;
	b=Y2uAKoVQO9F3pf28P4hacnIGtl/iu2QSFsk9E1phKIR1o4wgsd3I96NGeOYAMglXWa5m
	 Dis3HH6yK1vZKM6DJHrB00gYxfDO3w7D2gq53Fnlr0eAkIRMKajJTvCiz05e7z2e8qwRp
	 JQE5ru/N3450+PTxLNYodh73H87Vms3KI1HliDOxRfstpdzmYouiOLrnnCdxIhFaUhopV
	 riQULhYo2Q41WrxD87ZygxVaXSkQWZ8EdxI8U5FdlIAGMmtWfAqKki84YD4IhrEuw3O/t
	 cNvNwyBQFgYjEgClZnUiHMRkSKGfVbiz29e1v2h/2DBLePKcPz6FdspOhPU5VVbTfSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=;
	b=wA3lC7CerWjRsI76PuLgUdvjj4jWPQs+5OGKcTm21hwYfqRc+0dMVqjC43QEqY5t6LFi
	 YuwnWNfGMnUiTeFF65FUCHfkEptkhg07xdp53KwiD1Rgc9844mJYsoNVuTPN6moEwtcCT
	 L6kT3TNxR+RApbj0Dng2DLY/4Lpy7OowSn6r8b4dg0YLoFwPRCzaj6t+bFd2g1cWfX27a
	 2THHBI7tmy63jqhvpUjUtslRrB80iRq3PVBvA0uYf2yrmkdOulOsRgi9nmB7yoxSaflrw
	 wfgUirmW7AUBQWOsgRWupCvqIxgSG6J+PjesSxzYIXBhfmIHaaBPivQ9eeOp2HjWdGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JR1lxbQX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNQ83iO2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D2C606B80B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D2C606B80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JR1lxbQX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNQ83iO2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Et5o3737745
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=; b=JR1lxbQXZXrnhbxU
	57vkHtScLHNNopXxhzAvMGgM5QxXtvHX7fJ9Auf/AacaJONPPOSqEb8yyZT8zJ7j
	EXVKr0dGrkAZORafrv6HgrOrK5kwGoIwVsNiicOwDTh0uFwb3HB2ZjX6Cju6HJQW
	kt0dsP0uFT0J2FiZkpQCFiuqrt8Qc36j3MNgDylc6nE/PTUeBTmA2BIRB809GnNr
	/d7LE3Osqra/kV9QYosO9r0cMDxXfvabWUU26H9zNHUvsQVk7VXnpQx7FoMo4aRV
	krcNuIBmvulD/EK5S7i/tluHBRTjDRVFqkcJDdV3KP+lLnADE0Ap6tU9zf1+Otjv
	t8Imug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme752dwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:30:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so885515eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793356217; x=1793961017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=;
        b=dNQ83iO2wepkZRMsbin/+2j2QShJjOO15UYn6mcu0lGwwH5p5Mo0/h4lZr9Twt7Dcf
         g6Q0EXJOJwAP/f9XcOX5qJx39LZFbSkKUE5tkuoPeX+vdEKSn9AhktcuP8LGsTXfgWZp
         OE9GJBvdZdRF9+zKI9Wp6r+5d+wbbA0VfaEZNXU/afB+9n82+okY/IJafqayCXTOC4JF
         4O2rCuOA4ohh+sASihJ9pnHbkx0ju92tBCf3UZ7zu6PPJD6mS5W+P9eAPzS8Kpcl9jro
         hdYQ76zBI5DxhtbnAeCGrFSAU+Lo1pv5/6ShhEsXTl6Ht/F/G2z5sXQbvdMlYput+5Vi
         dbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356217; x=1793961017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=;
        b=sIlYRe/JXTXKX6A6KAjP6b3dn2cMi0acJh5m7xrLkqA+UWXfA2KmUN5Yo48qMRdrw8
         bpuVDEXsfA9C+NN1LE4Y0iT6EB2Sc5zJpiarvb69S5iuD4juCre3EAaysxSFP1uI2fpy
         SxqdXsLDpKdgR97q5508FHxvx9bz0vRLIcxx0iW76UGezHkPXGaFwwRhAd2Vtgle0Njd
         YGRUHQbyf6g5EItfmoKtnB9kKcgBA4C0U5aN2maeUUIsGHIbYZgswYLO2GxyflZYhGkZ
         vkUBDJwpMwjKzDgETuFWXW6wQ3EPevRn8j9lDIxgOzbZ3MGn75lLnu6vvsl4zneJxaSZ
         0fhg==
X-Forwarded-Encrypted: i=1; AKwUvBwsMvrptz3VlHp05kTraHdU9Pal/K0CF2mOUdkb3+L2FEDtnydw/T5S2QLq8Zb5Y+jZBXf2EDB2RLRbliM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3v3+vWYYREMfOgYk/8pWp9gd+P1yfg3eBaTh9UIcaGqSMsVZL
	N4zGMmTbH78q+Bwg9rbrg83az9h5e/IMl4ZXBSWKolKeAlVeJ65M4n04I3Q5uRhCICd4Jp75men
	t7VilNt4AXaP6OpOt/44PJ+dviPgmRy0k4v3Jx5Tv5FnViZkxevLpDTfmgxtStjQY3Us=
X-Gm-Gg: AYBFou08jfWEgJuUSceCekG21n9k1tOT55pkK+XP94qIilIyYn0DwV1obqwrQCpjHns
	dLIgO2ws5E82UISF7YDiudhW9ynJffiy7WzhzaJRlsWDZC6/mZ8IjNY7CHrYml7xEBTvXLZJhnO
	00xl0mYmk0hDuRIFkyyzdw7Mxq0scb4V1R4pTaWIRgRokCKc1QXTvPPgC88BTU9cbXWbP4bz6nF
	Oh2yPRjxPpuFc08Ed9Uk6kbPehz2fcjtstLVxMuwaUFBxppEYa9lfn8+pxu3Bmm7J3YzgKuvCkN
	io42dGvcuHA8uXWgsjbZq54c4N2pmYQXF5gy6FLlPbBLGgPKHn4Z7MVbHcaZ+DBY3Vi4BCnbbL8
	Tgb136KhBf9iuRO64u1t5UGejZeJsLD8Du6r1Q/ArGvYvA4M4NmVQo7rDBkswQMGu8dGGipRjWN
	mLSsg=
X-Received: by 2002:a05:7301:4290:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36a4238989dmr2829542eec.7.1793356216586;
        Fri, 30 Oct 2026 03:30:16 -0700 (PDT)
X-Received: by 2002:a05:7301:4290:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36a4238989dmr2829475eec.7.1793356215621;
        Fri, 30 Oct 2026 03:30:15 -0700 (PDT)
Received: from [10.216.63.119] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm7700599eec.2.2026.10.30.03.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:30:15 -0700 (PDT)
Message-ID: <abb9b242-be39-4368-bfca-98a69dc795d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:00:10 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@ti.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>
 <2026102912-iguana-purposely-496d@gregkh>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <2026102912-iguana-purposely-496d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CLMzmaIFm05lSUa0fctTC_m_lW7waTWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfXyl/QJrGOAlC8
 bTLsB/k4/lxiOa8LhRRJXVcS8XlvFPFuoDP/kWLZnbohOjgMxBfhcyL3As08J0xFfmz8hx53wIZ
 xuu4y90YhoZ5RoDOjLEzLf4GwugwkK8nUUqnKcHECnNb4TiyMNBBINmF7dDwbxxg4IuLvXriqcZ
 3tvvP2/iexImZ1qOKQWvdHVUHlczaB7bC2fwEJwnI+hRGB3gaXi6GtMVVOwUQxKUitznuNvqnSf
 aH0hHmMUgp1PxLYf5FHCeAY0LZLrcqXlsDVFknTVS29CFwhyyurcQC+FC/LlfbZBQO8TGtb3KJU
 8J2S6Hfv0qEKfZVFoIWDRyEPMYchZs3odfONLTp/xk8wln4+gkXPRwONPZc4PtwribWNhp06nqZ
 xV9bpuBRASg60oi6gkk4+6yKFrmnfZBCHkm0PvetKgOOMqO4gR4xAl1DEYNFLJxWcjPU2fZs3QD
 ciIlpUnV0WMM1CVQi9A==
X-Proofpoint-ORIG-GUID: CLMzmaIFm05lSUa0fctTC_m_lW7waTWm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX+EgVEwOSMGn9
 wMHA/6ks8A7LWa0JVO1GnVbs58r+L4mVOhSy6cbbBV3bLQffeOjzLkQLu0EC+mNRkkQGoPbXyim
 GsxFhu8mVO5DLs1lSahqqRElCniMZto=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae471b9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=bRw_O-wRVFlVsUPLYksA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300041

On 29-10-2026 03:25 pm, Greg Kroah-Hartman wrote:
> On Thu, Oct 29, 2026 at 12:40:06AM +0530, Faisal Hassan wrote:
>> Hi all,
>>
>> A gentle ping on this v2 when you get a chance.
>>
>> It addresses the sashiko review comments on v1: a linearized request is
>> now unmapped before its bounce buffer is freed, and an allocation
>> failure or a short SG list is returned from usb_ep_queue() instead of
>> leaving the request stuck on pending_list.
>>
>> Please let me know if you have any comments, or if you'd like me to
>> change anything.
> 
> You seem to have missed the review comments on this patch:
> 	https://lore.kernel.org/r/sashiko-outbox-162302@kernel.org

Hi Greg,

Sorry for the noise, and thank you for pointing me to the review. I
had read it but should have replied on the list before pinging.

Both comments look pre-existing to me:

1) The unmap/re-map leak of a request that is mapped but gets no TRB
    dates back to cdb55b39fab8 and 4a71fcb8ac5f and affects all
    requests. v2 only unmaps a linearized request before freeing its
    bounce buffer.

2) The isoc error return after the request is on pending_list comes
    from 25abad6a0584. v2 does not change it, as the new failure paths
    return before the request is queued.

I can fix 1) in a separate patch or as a first patch in a v3 series,
whichever you and Thinh prefer. For 2), please let me know if you want
it handled here.

Thanks for your patience, and sorry again for the extra mail.

Faisal
