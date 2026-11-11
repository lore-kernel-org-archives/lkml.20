Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378263;
	b=BWXXRZ8oRHGWHtc4tKAFrkTpw4WA05Q1hllhZf6IJ3U2ZwyHAMA5GvDs50gGGzLJ+Ibo
	 w0EUVMWaY/5oaS6XjSPhGCVTOlkMvDjzwbvuMg9p+F9SlOfSODah12uQF5BRil9mnXjMT
	 bRBEN4S89tIUiculkQ1lJN8YBjOVa9hzkp3PKg19D+CABq1JEelblyx2rpVhI6BGgtLKG
	 QcxgDrlvc6anouwwImn8SUoOrmoPJn5WqZqFIt8xZMhFtwWj2h6cM2GYEq7YSt0r1Xa/9
	 l2dQ6zDIlTd2V9lC27bbVEv9NW/AaCqfcSPo3UsjYq2U6VMF0X/o2zGNLJ7K8znSKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6HouB1SCrTpintJ3duVt8t2ME2e1zZRdM9Bn/lj3dBI=;
	b=h/XBSUVZ3KbEzHG4Dx6A2ohHtzIm/ihnHf0LdTDw/GxUlj6ZuFv6tjFZeZpDIsOm0CRV
	 P7QaU5N0mLC1K7cWBfZjc4/G9dK7cDnDgvO/eZuU9ne/jy/fGyYUXyp8OlF9cEbhPBPnW
	 YYLcBzAGYZayvM+yRxEARjAjzMubYBumRUOPyY9Z11SWdGTF6s1l8OIoRKgUsuPuu26YT
	 7YKEshqADY/HPlhy8dmyKfxm0UlbH2yvLZ2bZOHm+IUEdNvqVnF+8vlizLB5a7MDdVhXp
	 AIPbGQ/PrFb715vow86+W0Sfame1/wYdHRhGBnmCuBZ57W7QKIJUUmUzmdCsmcB3akQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1TYNHDg;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A604606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A604606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1TYNHDg
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37000e7234bso597584eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378262; x=1794983062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HouB1SCrTpintJ3duVt8t2ME2e1zZRdM9Bn/lj3dBI=;
        b=E1TYNHDgNnj3eSlxxyJwCyeIZozl+zYCaMqZorAESPXknkG1v98WkLJQBscE+NJOzy
         tnf/ITH1Tg9UJeusUMn2PJ9YoowqU/Ggw6ZCKTteao2+YJNpm1Yz1X2WDLp0DFGssq/M
         74EIMLt4WLl7ZufCN731JM99mH05TDmmIKOngpZcB6HxpUTTcl0X1LNG3kNuyWKqq/6i
         pwnJrOSYhRkconYLWLOdTvjmmz6rDJ1uEIJ/Ky5EYNuy0/8h/GeB1t2sTJWYQjhrbXN4
         OHClJUCthVYOH/Z2Wfqnc+N5Ez4FKbAf0wnYL47kyr1DY702uHfKezayBoiyl4f2SdcF
         RzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378262; x=1794983062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HouB1SCrTpintJ3duVt8t2ME2e1zZRdM9Bn/lj3dBI=;
        b=wZfW7CcAL7YobkvVAJkZuWnhmK9Xag6yU1NNnxwU1nVAnalmnfJIQIW2BdVrVwg1OG
         s0LmoIs1UrHnv9w7ENrvjAMbpvSrgCbVz6g3yYA8Wi4YeE0u8CUTl07S+fhVM5fQT+5d
         4MfRM1LGLolGRAgC8zPSio/CjUwzip9uJ1YNhiiSznsoiVVhGQ0ugDDW01fLngtUssEM
         allYoAUA7xqqTJkWUywfWRisZxyfJQ8AcE2mXuevdbsqtjnDmXcWRDJYQ22og9KC/gWJ
         L35EW1Gx9k5ygk5q2HaXK7To5Die7GhfEWrhPtVZ81N8AA6GA/kvdBCkQo630d6tZhb/
         7hOw==
X-Forwarded-Encrypted: i=1; AL+hErFfoh8ZzhWkmKWSNOBrhaPGTqY0PslWw4eIFu5UXWWzZINmNy3RWHPIMWupLqD8cV673lOp2k8Tqt2PLWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jVBTJsXu8KUUJrqYl/wZjuJazTSzzcAOH8VPMhS7R3+Q7MwvD
	EvDMIQEOMCCnxinwf0kkMTFA4K2sr47wOChot2ciZ8Wb8wh6UQdgy+WJ
X-Gm-Gg: AYBFou0+fcZ9fGylI63LLu+Kma1uJuc8/n9tFdfafDH2AlXEZ2bJ7KPVrL0ESkVfQ1c
	oFI0VZPNxjHIrh1yhZmXDeGmoDIsX3qaDoOdHYodRTdDtChoP0OJoglwpfr8Z9/Fcn1t98lC8Z2
	+sgMM9gJaRteicy1UXjj1geE3RR1mKHkHCRMHl7uKZO7JtYko9hpi/xVCBnmBUSIvNw6ZTSWD/u
	yqPA5OtWGFE1k0MDm1hU4BXzPF+3rE31kgbiQ/QROlx3V9ksUoU6HOa7u4f5cE4CGrGrznHWzf4
	6dgHKwzI305hJVrckY80jfjZyh6Th7lLVLZ9u9TzY1cEN+se4tIWFlgpxq8mrk4PEv+oYvM5Wba
	UwL+3RWq4YpKEGGhc9BgX7qDFg4GcFSg0PU0KduxnAjp9kLHFtuveLOFE8FZgHZi7nvTNzblhFe
	yLM6vbSS2GpyrvKqo9o9Eh6ezj9yvneM/z1DorMQEvsZBM4GSXK/t/FuhvEesFjsSmOOV5qQw5C
	Lnfiof6lbYoYHoDEtwo5LVpTXYWN4PvkkASeBWoCBqkrJ4CZRze+lm0rMPIsy/DGilkpE4/zjvk
	VxUKa+6YDsOdE8XEn56GWXmwzblL8XwFsUD/in7jJB6E
X-Received: by 2002:a05:693c:41ce:20b0:36a:2382:7dab with SMTP id 5a478bee46e88-37685d724f6mr2591547eec.6.1794378261543;
        Tue, 10 Nov 2026 22:24:21 -0800 (PST)
Received: from [192.168.25.219] ([115.108.41.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm23347969eec.18.2026.11.10.22.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:24:21 -0800 (PST)
Message-ID: <e12a9cd6-d61a-4e80-a459-954c4b26724f@gmail.com>
Date: Wed, 11 Nov 2026 11:54:18 +0530
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
Subject: Re: [ANNOUNCE] Git 2.56.1 and friends
To: Todd Zullinger <tmz@pobox.com>, Junio C Hamano <gitster@pobox.com>
Cc: Patrick Steinhardt <ps@pks.im>, git@vger.kernel.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <xmqqh5hosgw5.fsf@gitster.g>
 <20261110221253.DBFncUIG@teonanacatl.net>
Content-Language: en-US
From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
In-Reply-To: <20261110221253.DBFncUIG@teonanacatl.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Todd,

On 11/11/26 03:42, Todd Zullinger wrote:
> Junio C Hamano wrote:
>> Credit for organizing the set of these releases goes to Johannes
>> Schindelin.  Credit for finding the vulnerabilities goes to Luke
>> Martin and pwn2addr.  Credit for fixing them goes to Toon Claes,
>> Karthik Nayak, and Kaartic Sivaraam.  The xdiff hardening is based
>> on a patch by Jeff King, with help from Toon Claes and Christian
>> Couder.
> 
> Many thanks to all for the effort, including Junio.
>

Indeed. Thank you all for the efforts!
>> This addresses the security issues CVE-2026-111760, CVE-2026-113408,
>> CVE-2026-114466, CVE-2026-114467, CVE-2026-114469 and CVE-2026-105437.
>>
>>   * CVE-2026-113408:
>>
>>     It is possible for a server to advertise an unborn HEAD that contains
>>     path-traversal characters (e.g., `refs/heads/../../../TARGET`). With
>>     the files ref backend that can lead to ref-updating actions to write
>>     to unwanted files.
>>
>>     See <https://gitlab.com/gitlab-org/git/-/work_items/809> for details.
> 
> FWIW, this and the other GitLab work item links appear to be
> inaccessible to normal users.  I'm guessing that's not the
> intent.
> 
> I added Patrick to the Cc as one of the folks who may be
> able to poke the right folks at GitLab to open them up?
> 

Thank you for pointing it out. It was indeed not the intention. Those 
work items are accessible now.

-- 
Sivaraam

