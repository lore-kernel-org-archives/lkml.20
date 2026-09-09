Received: from mail-qk2-f2.google.com (mail-qk2-f2.google.com [74.125.230.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C957266A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965658; cv=pass; b=I7QvbStPhx13Iw/IYQGeZimHbzoWrBZW2KC2GTDLlDiY7X/3OHO7f0/CFYHdQIps2gSaAk+g7Wp8nIubLIjOu3m42HMgqS/lLJWfYookfi3UQyAcORzmS32vHqaXPhQDqfrl27BlNC858vi/bL2MHkU3ZqwcO3rBk0HO1R7siTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965658; c=relaxed/simple;
	bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYs+LkfVmQCuEy72CEA4o38QjIbDHJ+jMvgugYvIN9W0ITK3sQNHnz0nfPAv7U63g6kQ+T9PlQrkuS6Z3PuGzRuQBnU7BjQhcdeoDnUCJ2TlJEQedNx+qaOm7w9NxxQ6eYCq9SpnqTVM6UXwdE2gxy2xeJoR+e/4bb5H0ydvE9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCEVtZPF; arc=pass smtp.client-ip=74.125.230.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCEVtZPF"
Received: by mail-qk2-f2.google.com with SMTP id d75a77b69052e-51ca0db8779so24484171cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965655; cv=none;
        d=google.com; s=arc-20260327;
        b=k0kUVZ4tULSC1x838ONGbw2H1AZDVQF6mV/0mDdUJ8jjurwaBK7l2rvwg9V0elQHee
         Lush+AFvNoKJK7J6K2SLwW/L0qKigC8TkPGC2KrQQ7SU+gb3B3BYYp2zHxFVZSs+leR7
         A+Y3TUkD+VDGLYlhvQemam3c3vdFALqTY3sixAaPufiudXzbKcr90wlCC4Ez4ofF5kfm
         oOsw0//cOGAP2/WS+5gLZCIovp22zItPZyzlgaIID4GnnpLyan4Zo2iZPAYYIHGx6bqQ
         R1kJa0jHaJXzzwppJ6Nb44ITYazUBb3LQiGHTj1p6q6H/4vCOCgUOV86cL1BfTc4AgGH
         Afaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
        fh=l3KN3Gzjv+K6gGQ7e/AApEzlzwWBNd3awqC5wkpYYZw=;
        b=JKCoFjWiZ40qXCm/9Wvda5mDOLtXhsF8zeyDc961ULsfoMpX/KBwS1WTpsLN/sZmuB
         /P04lenCKQklCvoRWZ8gEm9IHPcSX8N4ACyGuAs9Ko3iKzSw4u26Pf6N04TKL1GQFEaB
         2fZX0by5ecZMHCHd9vLxAPIfwkd1CU/46B1EbVPkvF1hpAMTJl0TMKsosTd4h3hoFURV
         3aQW6SgSLM7wVBLUWyUN//PdRlMWDH1ihptqRNMwk/uebZUk8i78sBzvOusWd8F93yJ+
         BeGnimifHniXNLvApTAP32IeBkYxhTE5PbzMviaYj+Za+9cdAJaAdj5kouv0cvfgoiRQ
         jzdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965655; x=1789570455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
        b=NCEVtZPFmKTu7ez0Rj/2pnu2U+BR3aX0jk1QUjVFrwSksni29KJRIA+BYgqjWouY6P
         CCX/XK+3puMb3pCBJm4gEx2GsZ9c0PkZToPsYGFo8ZSxAsdDaa1SM3HWhDnYYedKZn9Z
         DD+0TmehblUuoCzcSK61TbevBtgGiLD8w7OeDaXPP4Z2WuXO9u4DKUfiMktKRujttXw2
         0pwXqmNJA5hdoGFB9svnyGAIgRlaHWyW18G5VDmE2/0hBng3bG6+MMUSdTil3h8BdgcV
         yl8fnG9pnkm7EIFll5MiW1Djn3mZf/jWAzkRxZR2/L6jxlFFBuSCBrAP/7tmGPwt44d+
         iY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965655; x=1789570455;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
        b=ehWkJlK8UM27G/WNxzR6y9nFmCvdLXrj+23dBplASGGFF3BOFBGm/PvCmT4gJMhUH7
         ygLXvSYIn0Doc5NV66gvR7kQLoBrNICvvn+sXThDvg+QaMPfDffF1nyabqzRW61jFQ24
         y+1XtHfQlm5n6YEKirQNSmLqOyQSxdP+ckxP3jptgi+XmXJDzCR1jei3hXkGTTxo6AWx
         41JPmp3jRY+0oXbjBS/T4sQLYiMmfLI69QKjMFpunatdX4YG9udwzkJ0mkVh7Ao0jS9m
         o6iwF66hkOYsRaPP7zYDujvnmM22PT7eYoUKTbOrqsQOaRt1bzEbxD5mOTPfYlIUK5qn
         M/8g==
X-Forwarded-Encrypted: i=1; AKwUvByblqaFzUC0+371G56iQjwuetkLJKju5wmnubtjKT9QIBivCcjPMKZzAn5Jm8yudnZ69LrvS1SgEz1pJCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lRhW4MFEbwt0i8SzB76PfUSCcPDumu3ue41v7/4Nhb/s3jbLrN
	pg1sZVF3jKZzfhOT2YdADaG1z+YCc/rIEjJedks6WD7TcqKEHC4afAG1mYyhAGhGwU4ClDJdUF9
	ISZENFhRPSHY4wcd4uEdhStEgwFYsntw=
X-Gm-Gg: AYBFou3zk86/lFxCL2HArhDLEKtJI8+Wzkkpm+AAlD44XQBLerfYDkQXXeYHYVN9LpK
	q7PctKrb6u1Um3Ch77zvuUfugwB+msoWJ/ZyQcg9SURY6qsMHdGZW69b4DhpesvmiXp2zbYnYa2
	UW7TipAjiweMP5aWx1NAPICTEKKuuoIRisRf5eJuMwRzvzlYZSURHUx2a+VajtI/bIg8VCTNGE0
	4s+zH99cGRc7zkKwUUKOGoWSQkLIBZ7MLbRKiqsLLymRw4ryvPaQeg/IFifvGib0xeA1I/Zf8rG
	EG+vYEEfK4DHOqA1obOl3HoVRMnKXa9hI8JnHfCin3YQJo1ZnsQUBpI=
X-Received: by 2002:a05:622a:a15:b0:52f:aa6c:bc7d with SMTP id
 d75a77b69052e-530a2d00ce3mr103821661cf.28.1788965655200; Wed, 09 Sep 2026
 07:54:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:14 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
References: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
Date: Wed, 9 Sep 2026 07:54:14 -0700
X-Gm-Features: AcwNN1V0ayDgefnocqAHfW58sB0HIvDNfLVwuHlJzZzj3we-9VRYfcaM2bKPUBQ
Message-ID: <CACGbirQQ7dZ+Jaiv218CpW38jWCCz5DUkoSAKUShstLy1GoYpA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] selftests/sched_ext: Validate select_cpu_and
 mask constraints
To: Tejun Heo <tj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, sched-ext@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

Following up on your review:
https://lore.kernel.org/r/53d04980eecb0e5f6eeea25a5cf0dcf5@kernel.org

My earlier v2 submission and reply were rejected for the kernel.org and
kernel mailing-list recipients, so I have resent v2 from this address at
the start of this thread. The code is unchanged, and for-7.4 has not moved.

V2 checks the selected CPU against p->cpus_mask and uses dynamically
allocated affinity masks, growing them when sched_getaffinity() returns
EINVAL. The masks are zeroed before use, and affinity restoration and
resource cleanup are handled on failure paths.

I reproduced the fixed-size mask failure in a guest with 2048 possible
CPUs and two online CPUs. V2 passes there, including with single-CPU
affinity. Testing with CONFIG_PREEMPT_RCU and injected failure paths
also passed.

Thanks,
Tianyi
