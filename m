Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C22DECBF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690601; cv=none; b=nn5S3uIaRVz0T1L9VRq2zEJ2k0yAsmPSYkFuVfDHp6JpQMvXXPZwt+qsMvkyH5x0OehDKlEviEsBltyuq7H4i6u7hfKhybBc88FOh2NraGZM4i8BAYYorOVL2oW+nJ0lvcOlZF+gUIfx6N42e9PriCHd/DQGyjEKEG371+zMHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690601; c=relaxed/simple;
	bh=1DpN0+D5ufXyFyAfy3uJmze4fn5FpngK55D6QJU13m0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=oKMp+AQ2qEcVHiOnFtw5S6BocSx+LLl5gTtp08qg2GKN1kxCBrRH7ZyR87NCZ6AlYF714bzOPBRhfl/JxTYSV2Q98JNREvusKnJyd/4AlXKf+5/vg/SPsyEqD2BKmEKxpM0hHu4+v1qjgCK+J47s243F5BihRH9VcWX08O+iBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqCnOtDD; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqCnOtDD"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so3401073eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791690599; x=1792295399; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FyjOs8U6Ak5u7Fn/oZM+fBDOPJMJH3TRgM8xKhmhhZ0=;
        b=jqCnOtDDd41ZdVtH5EgO4VmolRbB6ElsyY1gyO+uqnf2mj9hAwXglyb7C/nmFNqUQI
         NB6FYIHzZDzb+qyTzoZkB5G/qaF5abxbxRTaqbum/EOrrtdd1ayQsXKP6npWGbGD5g/M
         +BevaTG/SagDHO77Dct9vndImfm1ZW0/K1YkQPBQ5Uen2wOjojgXgSFLEdWXkfzRU6si
         EjEIMr7xlOE4gMybsEd4OFwS4XNrhu9rC4+44EJKmH/xHRgiRUAuvO5yEuYiriwYssqe
         FV1ZhVFF8msauHvJ4uCchSmLomF13ZFPGa2A7p0CtFcYRzwqXB1tHn8HhXJCAAmgQJBt
         1VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791690599; x=1792295399;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyjOs8U6Ak5u7Fn/oZM+fBDOPJMJH3TRgM8xKhmhhZ0=;
        b=eZwn14ZT/iJfg0agNWDhG4A26CAUzNNI9Uj7p/GeFikKTzLk0J2cZrHm6e3nTfTOLN
         D0ciCaZOZ3jR/mt+rsNURcpQuyxagtFZz/LOa0mKwx2i/x35ZZJRmgCyBxgWG+Bkjr5K
         DK5eNTYCmDD8w4O2k7meDuOW/foURLgVmTb/8NsJQJ9rgziQnBZPMAKEWImQb3UbMn7X
         95I1bmZpIaZ4pQa6t3PcBHizwr7QpRGgwzopjLtwptHDUvxxBUcdl6p/d4lWzaMvNigB
         zZbtxF6VP4Q2VSsW/OVZfgNO/0LpTCFe4Zl4JuNnm97a0dPOVPmN7JV8y3MSyC1uvIln
         8Ujg==
X-Forwarded-Encrypted: i=1; AKwUvBwLsVezTIJ6BsZy9D2UtenqmqsB7fjkuXlUARp2lMf5Ai6XrPlZKaEFuA7X9czO4f9pBU56/5wthHSBrTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqnAO3Z1iTyvBH5MF9ZG2205gQeO+AgXcsjP0g+KDcWKUjyB6h
	S8S4RxIKaVW3F8x4voUgiE2UYbhv3HFN7rPO41uddfoDP2u3Os2EJjmqLy/NCw==
X-Gm-Gg: AYBFou2iOMHbig4xCKUEwdzDx9n3abUsPYObXa07x6VSQDS2Io+DPzzGWLgmVEUGmER
	CE0Th+Zri6n+ovOJj5ZSOw/UYq4igfBnLW6uD/UYRyGgYVfdK9iayz8byFLK/qhB3KP9uOrWVmx
	IeIs68mb1gu2NYnvzPnMykhg2om9T2AlHrF+P3y4yoUd6SW4HhVEgPJefynPbdmrgKIXW5t/GhL
	Docz3TBf/v6FttT0ltMVKO4Hcx6+eoiKTUim91M1qeUqfAcVrm7ouVViGPcWlmyzpE/PWAcoy8h
	HQDh2PS+bn7iFwI9g4+M68COLi5A8ft1qm/OAJHhRfIzZ65KV4Iqe1MuJ2ZlcomBMlVJzfaCd4R
	2gZ4fhHQ5iVZeazhGjIAl0Yv/vypxa7UAZey+KBBmInl00cjEOvkfS1G9u2vZxBz1R4c7L8R+Tu
	VCytkypiYUaAHkPus/8XMaGeu7eYHgu+6ygPM87vBSTDaux0knY4s9XVMNAakHKA3PTjuS
X-Received: by 2002:a05:7300:2442:b0:351:39db:42db with SMTP id 5a478bee46e88-3537dfe388fmr8395787eec.20.1791690598985;
        Sat, 10 Oct 2026 20:49:58 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm7430579eec.31.2026.10.10.20.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:49:58 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, 
Cc: maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com, amachhiw@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] KVM: PPC: Book3S HV: Ensure that calls to idr_alloc are synchronized
In-Reply-To: <20261009123035.157770-2-gautam@linux.ibm.com>
Date: Sun, 11 Oct 2026 08:47:35 +0530
Message-ID: <zewlq628.ritesh.list@gmail.com>
References: <20261009123035.157770-1-gautam@linux.ibm.com> <20261009123035.157770-2-gautam@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Gautam Menghani <gautam@linux.ibm.com> writes:

> Calls to idr_alloc() in __prealloc_nested() are not currently synchronized.
> According to the documentation [1], the caller should provide their own
> locking to prevent concurrent modifications to the idr to prevent bugs.
>
> Wrap the call to __prealloc_nested() in	a spinlock to prevent concurrent
> modifications to idr.
>

This looks to be the leftover of previous implementation. IMO, the
commit msg needs fixing.

How about this?

Calls to idr_alloc() in __prealloc_nested() are not currently synchronized.
According to the documentation [1], the caller should provide their own
locking to prevent concurrent modifications to the idr to prevent bugs.

Now __prealloc_nested() calls idr_alloc() with GFP_KERNEL which can
sleep and mmu_lock is a spinlock. So idr_alloc() cannot be moved under
mmu_lock. In such cases the idr Documentation says:
    If you need to take a lock while allocating a new ID from the IDR,
    you may need to pass a restrictive set of GFP flags, which can lead
    to the IDR being unable to allocate memory.  To work around this,
    you can call idr_preload() before taking the lock, and then
    idr_preload_end() after the allocation.

Hence preload the idr memory with idr_preload() before taking mmu_lock,
which allows us to use idr_alloc(..., GFP_NOWAIT) under the spinlock.

This also allows to kill __prealloc_nested() and __add_nested(), as they
are not needed anymore with idr_preload().

[1]: lib/idr.c
<...>

> [1]: lib/idr.c
>
> Fixes: c0f00a18e2a8 ("KVM: PPC: Book3S HV Nested: Change nested guest lookup to use idr")
> Cc: stable@vger.kernel.org # 5.19+
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Otherwise LGTM. Thanks for taking it ahead and validating this.

-ritesh
