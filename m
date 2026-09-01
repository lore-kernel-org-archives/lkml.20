Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8880C32B102
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272984; cv=none; b=soaDm+pldKxyD2JN40L1ZXfd4gWMg/bhfctkkWv+mYr5Y7PlLaKCCjovxlBib79rWym3H3g0mm9zPu7mEAfS3xatgK5bZCTRA6NPz6wL3UaLZ5wftIg1+LBBDcOYsNh8mEeUq37tQR7m9Fqh3OVh5hMOuFUJW981OFmN5yWx4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272984; c=relaxed/simple;
	bh=woRkUj5tSZgylZeOSX8eCVRKozb+xeEgQblLO4kY6f4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqoOQjZXIB3DvuLugdyi+GVSzYPLc0fipX4IdCQChbe801mctFAqm6OZJ01sbidGJ/kEfAoiNOyZNXuVnB3qWgLVHKRadfXG4rp795iA18VuhCYk8BwNYT+UAiV0DdS5PPXWmUThpSUcnlRiCvBj5OuXZ4479SMQsHSMjWv+Ywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tH2gm4nT; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=wCIVkZ5W; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tH2gm4nT";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="wCIVkZ5W"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681ENNmQ1421364
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 10:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HvOt
	4XcqRa4ZBjSZBBs6iCTuthgQbep0Dh/wljdrLa4=; b=tH2gm4nTlpG2NR8ZjwVz
	3IJooSkOTzfHalbIw0MNM+iaAdQsE80Kvxf+ZYUwRaROXRsa7NYVivtA1tcGgZPD
	m2GVdKFUdJyVJbhBSc7Q/j3XXvtIItb0UW+eiO4h6ZqTpW1SjdWjJGjH3qPByl+H
	AInl7QytNwZQv1m860JCof8NysTImtYAdn96klvoZFdlTZ2Vv1gBGbFDq41yUy4N
	FGkt668u1YrBBh6TWp1G5ylyD+ZKbbOGfLYhwYej64zCsuxtShzzn4iI2UyL0mKL
	C2dckBfdjhxZlEL0RndCSgcgH7g7sAjvs5dBfkMPbIT3orBHfOIQmivdeLMJ1Esj
	iQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gdy0u0xw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:29:41 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93922c75037so118772785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788272981; x=1788877781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvOt4XcqRa4ZBjSZBBs6iCTuthgQbep0Dh/wljdrLa4=;
        b=wCIVkZ5WCIBf+0OTulQlCs/vLq7Ouo0oM3RBCFeYQq8/TywDD29w5qDjzaS3rW08nV
         XUcpd3pCyu/akwGHxnzRfTSPQzvcnVS7qK5YjF8MaDr13MuMBkI5TDmnwE92lrMbbUIZ
         sQF7IcgHOYBx+axrYQvevgIZSMngSM/ef79x4WboUarAs6imuHPBRlnfIhtViGS8nYae
         SH1vldXLun+0fw8h134sKkLBE7Dhc3gQ20Tx6TQIWoYeBdx03Ma8wxSL3HZcDR0scz8y
         bbvPIZXwShrfG+6eXInxLGnJjiReW1m+wB59Gu8aT9x1Di7DKXLzlYb50QWBeVb2/fD7
         GBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272981; x=1788877781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvOt4XcqRa4ZBjSZBBs6iCTuthgQbep0Dh/wljdrLa4=;
        b=seJ6FbH+Cz2zhHVEulfEyKyOZZrKWsv1D+6rZB4mzUgg3cxk4pLW/qNtF2JcW2N+I0
         vbkpwgabeXkB+Dv6RX6OqZOmC+NtMwVWMaXKBvWOin3EeRLCW76vr0a7kmEcljpJ6Mwc
         moJuMEAccujCCZ3dyQIrgp9/jUyYtVqIlfYW00qX36Q+deNBzhhiNCbyRwjNT8Peo0hu
         UdWRr2V64E1xYUqshNAkwlsJ/4e8Ki0JQjcHGpUlvVUhcy6iYbmn7HtSAYN2VOFeGiFm
         00LAyjjCCbHa9LfAYFZiRMaSZ4i8S1vYKrugRddDvXwU4OmsB4a7A0dbpUf3DI2vv+Ou
         aXSw==
X-Forwarded-Encrypted: i=1; AHgh+RoVJzSWrgsf0LbajavaHuwd4dnhEEixiMoNOujNTEgyEvCz492xMoN/kO2JIa7XLWRD29pLZys/wsGMnqA=@vger.kernel.org
X-Gm-Message-State: AFuF++lzmw4VA3a/i2CEMRbzxUK/AGBJJbfxTaGkhP+f8FXMwDyu8sSQ
	eGkpDmZe/nO1kbL4CyB8JLpxie0+x6xoJXA2h4N+xkehPyoUOOFunoFsCTI8+2ltCAj7MvO3cs2
	DCOlLMzNT9ojETmpFAS9Mz4UXwUcWgPJau0HKxWSwhPyQDOfQ2nCy8WOEL0ApeQ==
X-Gm-Gg: AR+sD1016Yi4cIZzvpFTcZOPryKyBk2c9ABlQ9dBkHya6SJ1FaUZW3PhNCRCL9QO4DB
	mUmly4Dt1AVqKWMv7fQwmKYJ/37lYZfn9vWHSNHQ38MYOWztU4Lr33n5vDEjopJd9EsZcmvI3Jz
	EAjor1qdiqt0xVlCiIV87nOXwEYG/8PzhD5aiDZVpRuC2sbMOBHKmXfmlslqoxqJQVY3z6Ekuh7
	dUlnn8JDRYbwz0EgyNe5gfGGZeF/yrvpj2D/GCbJMW7+Nf3ffj5UR4qeyvOo5B6wMegdYvxs9Y2
	hgNP23/gKlvX4mezlbPqR8V6ZcGRA2RTl65ozL0y8U7FEIivkobiR+RK0mEj9c0szLsj37iEDbd
	5EAAfcmWu60LX9v6dq83NkVCksXqAiKJW7tKqVro2RJkGlILX3Q==
X-Received: by 2002:ac8:5f95:0:b0:51c:555:7dea with SMTP id d75a77b69052e-52fb9690435mr397976341cf.30.1788272980603;
        Tue, 01 Sep 2026 07:29:40 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:51c:555:7dea with SMTP id d75a77b69052e-52fb9690435mr397975171cf.30.1788272979958;
        Tue, 01 Sep 2026 07:29:39 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe878f4esm96424981cf.31.2026.09.01.07.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:29:39 -0700 (PDT)
Message-ID: <3a494e29-fad1-48cb-8ac8-d9a20d97f020@columbia.edu>
Date: Tue, 1 Sep 2026 10:29:38 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        "Liam R. Howlett"
 <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
 <20260901-mm-remove-unused-helpers-v1-2-f092d086f7dc@columbia.edu>
 <apbbw0A0f98nlVol@gremlin>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <apbbw0A0f98nlVol@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfX6tvpWVzk48gC
 53dOaG2YpQ86yeRKvH5/69j2aVA6gQGpb2Wgb6AUqAA/CFmj+oKh3POIbMSm3bLJRP3rNRoQj8a
 xTmkX16QjUtg3zHxdJjJLI2nVDpBnN3VX6Z8MxLeIWKrqVg4JxC4
X-Proofpoint-GUID: pcQETVZ2Ce_TVyE6qz8amVXKaY7l69v0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfX+Iay3NMR/3p/
 7+XQSkCWwnUfAx0SE9bncie45D2IPJNwaDFyYfTMw3rN+FXXhGgFb0C2wBtTtd2TYRPgPVsmpXQ
 AqXZplNl3BWHwQT8VNboaw8PsgT8C1qoa6iogXQG7nhVC+JPHZSiSzvJxdf2S2ZxgY0jQkJxe6/
 Mr2DkdCprcS1haP+13UX37ck+qAavkmZ92KfD8yPvYC2x6cje+q7TUbyq/8UDkuCcrI+D9pcBDZ
 hQjiA9tmZJlNDGmMnGqtwWxfkr+PRXZFd5m9Ku/zXYfNBCwFoL2glq8LeivFxBY9P0t/JWwE8ix
 mvRop8GIRKHCqcL+aAUHk+Ke7VnscjpKkQsgZ/PjXDmJciq1U1EHAzfjJreWozDUEmw9+14Mf/N
 yQqhH2fR/DLqlYh5M9qAUztrPIMJXR+TZc3qCYJ3SYiZFuCrJBmjOCjJFIAKoR8uyn5EOJ6672C
 14USBh3JX7rMFwm2AZg==
X-Authority-Analysis: v=2.4 cv=HohG3UTS c=1 sm=1 tr=0 ts=6a96e155 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=VwQbUJbxAAAA:8 a=B0BthrHYGA8IgNGofVsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pcQETVZ2Ce_TVyE6qz8amVXKaY7l69v0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11893
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=10
 priorityscore=1501 clxscore=1015 impostorscore=10 phishscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010127

On 9/1/26 5:06 PM, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 08:59:20AM -0400, Tal Zussman wrote:
>> totalram_pages_inc() and totalram_pages_dec() have had no callers since
>> commit 7fbc5e26123e ("memblock: extract page freeing from
>> free_reserved_area() into a helper") and commit 287b89773d81
>> ("powerpc/pseries/cmm: Use adjust_managed_page_count() insted of
>> totalram_pages_*"), respectively. Remove them.
>>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> With additional change requested below addressed, LGTM and:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 

Thanks!

>> ---
>>  include/linux/mm.h | 10 ----------
>>  1 file changed, 10 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index e3736c42c4db..c105a3758915 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -57,16 +57,6 @@ static inline unsigned long totalram_pages(void)
>>  	return (unsigned long)atomic_long_read(&_totalram_pages);
>>  }
>>
>> -static inline void totalram_pages_inc(void)
>> -{
>> -	atomic_long_inc(&_totalram_pages);
>> -}
> 
> I also see totalram_pages_inc() in tools/include/linux/mm.h - could you remove
> it too to keep things consistent? Thanks!
> 

Yes, will do. For some reason I was under the impression that tools headers
are generally synced separately as needed, but that's clearly not the case...
Maybe I was thinking of the tools uapi headers.

>> -
>> -static inline void totalram_pages_dec(void)
>> -{
>> -	atomic_long_dec(&_totalram_pages);
>> -}
>> -
>>  static inline void totalram_pages_add(long count)
>>  {
>>  	atomic_long_add(count, &_totalram_pages);
>>
>> --
>> 2.39.5
>>
> 
> --
> Cheers, Lorenzo
> 

