Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794484556;
	b=Fk93KC7NAoSOKIM6o9BoAhjA8ct2wZ7QIla4RjD5F3MAyxKRBt/RyJ/C0Zqf4/Dv6Akf
	 9EshHJwaSKcBQHpvXkhiTofiC19Y07n1g9x9/ryEiA9segGqJXwZBi0BeJpC9snRTQfq+
	 6xa8A+SJmfGPyt3tO6TehA/ZDeB2hjzie1ZuSh4JamoufOnXfhnmOZS3/LZynYpxhYI47
	 GyEwrKsKUi7sOhDw9WSct3pnSaXq5tAuUHRr1sVjS9nGh4GC2Pnv7qmTp4BEqe4V6JdO2
	 LQn+fGo/79EDNSv1w9qq+jcxKdbK6yL9hPeea9oAYYXf1hN2BiJklA6vk27ddxuBK1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H9NIZBLJNCk3VF8bguUf3mZiur03yP583DFsDhIKC8I=;
	b=RS/fke/hfp9zkUOwumPUGNKGzZjHpWaqYzsVGvzJm4Q0i38138WDpq2EpJmyITPXpNhq
	 tkZ1+4S7OR7zY5hdUvWr532KcdcaFpH9F5eQmRT3gJXElLE6Zb8KAL1yvSc+/B5aSRmLy
	 nRLdZm3OCbS+J1j4yF2JVYZm7AxdsRL9BpI06OSFiRcbxNy2maZxG6ZJz/WavnDnlOkuu
	 Uyi1LVzNTx+o9s8wLtCJ4+HsxNgblh8Nl0S4/SaRu5MwWNGL5ZroBC4R1Q8VGznpm+2Gv
	 WnNkZmdUxAHTC+Kl5stA8yfKRVfpm9SPFYYLLpx7dvt2v7Zh+eFkIf94d0qxkXkYPeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IC0NlgPK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AA6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IC0NlgPK
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-679334baa1fso5631374d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794484555; cv=none;
        d=google.com; s=arc-20260327;
        b=WXOoRVYHEtOyC8Dk5JZoux7ud7D/HlYdcPYzYRshtfZE6XWbFAffmPRMn/zLMlShtT
         JQXi0F2Xnz9qQ35VCPSfdTOK0ZKJHJU56aLUsupazexB4O5edViDYvNSbUXUcV+3S2bQ
         R8IcUPomWdCGT0gqFd67B7mSl/8nCZ0X0dWeQPBo1Af4jVmHM1lxlEa3ecmO3aPej2dD
         bmvIfF7pGHXzE2MAsUpt0t5usMY+VZDD52qYFsshBGFsKtg/O19hEeQoT24Cq90xg/Su
         hwVYpnJCYZc+i600X+zNmqYWS3sphq6o/2dtrMFzZxyrpcffrl7huP0kvgsPRFNzNbys
         JyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H9NIZBLJNCk3VF8bguUf3mZiur03yP583DFsDhIKC8I=;
        fh=eRDZtMHam77Z+fbIW9xit1zT/LMBAIkszePubEXEWEw=;
        b=R4yunsmOhSL4z/dSiB7rziE9yT4Qr1vR45jda3FbmbGi6/Gzcm7aIUpsR/L/JrVybX
         JRNSKYAhSkCcXYTY8i27bimiUafaXD8OQUd28zxgZDS68Krkzgn29qZ0yw+9eWuNP7ah
         7Ooehh33j17XSVF4Ofn/r+CX3hYPIu5Jecy1q2jtEnuLrdzDwzfr3W72vxRs2LFdbHOS
         LqTdx6eqgEv+r4li2CsYYB7c+DNO0904pZz1otxnWbJo1X3T1XN88aHyeAvhSq2FcnRF
         1tFuhl98vXpoLWtkWCtu8PjbfrYKD8o+Mh+e4GnAHKRzIN9jA00rVZBHB1ITwPj576a2
         8zxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484555; x=1795089355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9NIZBLJNCk3VF8bguUf3mZiur03yP583DFsDhIKC8I=;
        b=IC0NlgPKpvkf0lwA4TKjI3IqNZVxUXnlcdFfmdT9eUIEfpssNU4lAby4Z+c12Xu0Wv
         Ae7DwZl2GoZlqUFR+YDpnTkvnCvU+2v933AKeweNQOsB/bQUQPoZfBgcVjRCMVYyqm1o
         AbCI4ovbRTHG0zmzRmxvfvvHcLG7GP3hZpqSxWsGDFCQpceE0Gbu4qezSLKeH2IGpMXp
         nhxY4K44tCHBO4soJCjvAWfYYHOVjAw017OTBceFYu0FV8Rkd8nrHSLB5VIijmCiwDRE
         hn3/HC9Cg87C79kiqkCOFh0fUVllLsMqEqqPKXPYRGmKzOduTiBTgdchK2WoBiqZhEZA
         ph0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484555; x=1795089355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9NIZBLJNCk3VF8bguUf3mZiur03yP583DFsDhIKC8I=;
        b=dmAyr+YcbhmWvBIqBtpz6JkOaPV2C+FYptveFJB0zaINSomqRY5AleQ551yx1Dj3l4
         026/Es2UAxE+UTNSdNTLD6bCFbewbhBKb2wQ6TZ6SBa/5iD6tM9+PmM8s1++rATBgPuW
         oXz8s3Cf4LHJ5VqIhc7IS08yUy+9Cl8k9he6O3kmaKVAknR8S4e0yQzWhyrFvgT4o8H1
         IiVLaZAXFQiKvkNPNViJi+htRWgzeQj34GH4ti4tk2rxHpC3Ih3vA7YPKPNJ0/WGDfsy
         PYZ3sge36Ap1aEVLLafUobO67vaXayHn1Pal/oRHLcDc+Z+Qwlhn5NcFBHWs7IYSh4R3
         Qb4w==
X-Forwarded-Encrypted: i=1; AL+hErHs2BSaRrkePhQrNj1UhWlWC8S9dnHd6HUX9A8QrIpozE67fwNcSc2OGYwpQrPqJXyflJT93ldyvd/H4js=@vger.kernel.org
X-Gm-Message-State: APuU4Z89hk69HC6pzr8PdQNgVUL9DFGeAQy0v314PP0V7a+rZOAjMM90
	lhTGsZwNAh7DJhXppg5wEtN9ABXflX86cRkiFLsSYwctRiGmhIQrL9RI9F439TVFYOzDPzzVXgW
	lkB85rCHxvfsqLYrxs9gxiyf5847MFb5nHt6N
X-Gm-Gg: AYBFou0IAYALG3C3wSs7aOh6yaQ+jd/L8yRBzcZlpAibhH/E8LXHGycvvcQ7ZpzptJo
	Vl+Ui5kiiLkZJwmzWjPo+HwebK2+6VFz03VQ+n4XraVNtydp3uo6vO7+4X9UK2P8qGNqWj3uCB/
	V9btcZYzGwuw90rHA2QOWEXYIUW0Jrq8A0LmwsHZmffRB59GEhfzUUjCo2uhIrY+n6V37DftbQU
	Gioee8kp+5ZMma1zzyCx9FwcX1JOgFchX9EjcRo994xwmRe38FsbJVQqe/cuSB+WyeXx1qu45WE
	Z5JDx0ldHC5OqF/ydrzWNoGHbhpb72YgSciEouNfnRBzLk80n05KOfmEGUaXzFe1I9243FfoRSe
	OMCJCsutNpep87Xy8uAy+B3LBo/2ABJ53trg4p46Cy75fy673cixlzYHQdpaNC14jEg==
X-Received: by 2002:a05:690e:1381:b0:67b:fa48:40c6 with SMTP id
 956f58d0204a3-67c680512c2mr3277682d50.89.1794484555468; Thu, 12 Nov 2026
 03:55:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918165601.1014666-1-ekffu200098@gmail.com>
In-Reply-To: <20260918165601.1014666-1-ekffu200098@gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 12 Nov 2026 20:55:42 +0900
X-Gm-Features: AclHuK9PmUV8BrYAjnqEoTS4EvgydQ1Uyiy02kEKk-TSeQV6BgCr13vlHCGtulw
Message-ID: <CABFDxMEW7a1yxZJ5TOdP244gbMebCzHBFsF7w7qJhxfxJUZRyg@mail.gmail.com>
Subject: Re: [PATCH 0/2] memcg: remove unused page-based helpers
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 19=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 1:56, S=
ang-Heon Jeon <ekffu200098@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hello,
>
> While reading memcontrol.h, I found two page-based helpers that have
> no callers.
>
> No functional change.
>
> Sang-Heon Jeon (2):
>   memcg: remove unused page_memcg_check()
>   memcg: remove unused mod_memcg_page_state()
>
>  include/linux/memcontrol.h | 32 --------------------------------
>  1 file changed, 32 deletions(-)
>
> --
> 2.43.0
>

While clean-up my mailbox, It looks like a later series with the same
change has been applied instead [1].
Either way, we succeeded in removing unused helpers :)

[1] https://lore.kernel.org/all/20261014-memcg-unused-page-helpers-v1-0-240=
b37c53831@columbia.edu/
