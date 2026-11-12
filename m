Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501203;
	b=gJKwukM6m0YXlo8o1z10BIV4xlbvuIeXMou2V/A59v9xRQZ6CiXWNUn7nO3QGFg3CK5y
	 xl9Fyf39kUJeNA3tTzZXFp7e1a7C/SSAnONVEBqD5b4h4UpaQ5ZpWHjmhTtQ/zUaccTeG
	 R94n8H6wif4aczLqHZYPM8pOMf/CitVIa88AlOu9uFqLqztwa2XaioUSTCgzNA6slMRjS
	 8GZ3LdSu+sccG3u8r4wtE+1s26LfCRMJJcY6H93AFq0d9A5mUGHQbVyDJH2uCLxqHWPH5
	 M0SFvwrO1nSl/mavSySfCR15LBmY95wdqmGvHStpTxnKyrj5L5sf7gg2At6dcYJ9b/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dmjuPZ8BQZpeLS5NHfXu6uyM92RYmwsffX2PFFxEaPU=;
	b=482LkOiIwt+KI86CjMvYqnNSkYB3fpb/JEdf5bbM+S8I/QEYINsXCJOV5UroH9j/oAzB
	 YNCecRmpbDTW9uXIJeK6W7J656G9egFJutG65du0hnQWL5KdkGAhtmCdS2+yNzFHTcMtz
	 47Yt8gxgJl7tPXLGtk2Jog2UowoapwQUXMjO8A3T7myHvjBGOGwvIikbmPe6y6q6mjjev
	 Wlu5aDlR0jawzTzbiAI4Zd2u147E83TnjXCV2Cm/7RDg3qStj4q0ypFmE8pdA/FkxIUYd
	 XC9LpA30W03PJmp8RE18ehxEAfhY+dJ0wGonwKxbZTRSoy9BsvRj4LFOm6fQidIkW3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJdEDNt8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0816E606A8B2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0816E606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJdEDNt8
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67a5c8ffa1dso263288d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501202; cv=none;
        d=google.com; s=arc-20260327;
        b=fiWZDTmnA0lsTNZwX87vdVrzMmXn4bQPkmc9ciRBxid41SNZI5UJ7hBE0r0yBktquE
         BBrE0Our6B/3VRoaVkivCljT3oz5Sgq3f3sAwY5+m/Ojoz3Nk5oAkSfR90QnoKu118U1
         fhLCXq9SiaPcbOwb9B4ojOLfTvRoWjinI/Wscf+CyzCv8HwKSCnC2URWPnvYRIrh4VzW
         yJhO6fjFctR7mCgx9mmqqUzdVW9JSrOVv/40tWsxNIg73vAWURsIdzFSBY5cfVxJ549g
         a7lZzwOCDJFjje9/8RO1eV+ibOLHRMyDSwAwz0jE9bQPQtaPvBglFl1YNJZxVeaylhjj
         pLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dmjuPZ8BQZpeLS5NHfXu6uyM92RYmwsffX2PFFxEaPU=;
        fh=GUPeXUEs7PVeL4akG+XA6pJUW9JkO3/HIq6WcU+Ex+E=;
        b=q442V/QFY98IdqoZ6eSYOUs/q5ELedwr0+m6An2qwWyG3u+dJuWzGdNOIlbVgkgO7D
         YVB0wcFiAqQShD5MksPYuZ0acCt1ioq5Bl5qa0jw6yI28TMy/01+cRrcEh03kQmG7Fs0
         Q5PHXZr4pSsc4UGyJS3rJcaHuHdvyNDrOkhf55OHaL0nbTfTJ+Co/zBaymMfOxuyboUS
         0hS5AEhDWyJ2EQYXoUyGrALV7ividl2NMOD32R4fbzQU1PK34U5MNWOO0tP82QRud1eq
         ygVfDoHmzXk2wHxKrr9jAtAVHKZZkf9+FWhZCwQr/8B2M7CrIR2AYH4vwyker81D5Hig
         42hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501202; x=1795106002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmjuPZ8BQZpeLS5NHfXu6uyM92RYmwsffX2PFFxEaPU=;
        b=wJdEDNt8Hsp1p1oDqKGXQ/xWBS4RmuVhcH8IwWKBGYwfstVbCmaEHw/gUhTjlUcS1z
         QfNGsvv4wl9Mj00diukU5WNnS8XMEwuNRvknOeZC+EUZ+j8bsQ+C7QHOvyNTRv7/tGzU
         vFyx6qQczBYdmwuZ1Dycs7S4ReKVW/aO+9uXl7GYjhXDTQcNF5JAwAiQzm9d4e8vFCQ1
         /Bs9DKK1LyHrBy7LAoXtLwPdT3CKwTkCVZRJ+kAWdDY/u0w3ZRFIoNfokKwf/z9v5EEa
         TH6posaVTGPD0cAd5H+cXmpBkbqvf2IK4iMMT9mvTFiKiReycR8MpH3u5A7cRI7UMkgc
         7KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501202; x=1795106002;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmjuPZ8BQZpeLS5NHfXu6uyM92RYmwsffX2PFFxEaPU=;
        b=BowTIKqQR1+IuZTy2qxZx8ghotGF4vxkxwKfxzKeRu2nj61x+C0iEMh12wD3uBNn+Q
         N6ozHFWTuey655keVoA/h+rE3fUyQQvkwK2yD3m44NjyWMytP3sMnboVD6tNQFO8l2T2
         43gQuNPUvcklRIR+IO0nK8pQKtqgH/pw5ADgiGeFNH9tqFskYjq54Tz41dHLutoy/b3P
         VM8UJAWTUQ+xheCszARMMIS+CIx9vzhCgl+3iD/7KvmS8SHooEjeI1wcymN+P2or3bD+
         AM0Dgbk19a0/bZ5b5SSkT+uVTeVXKiosRS6SlzPx2LZ66ScLQRl34qm00YrzkYNE9DTe
         FccQ==
X-Forwarded-Encrypted: i=1; AL+hErHHxhTOK/5MAqB9bQy8zFJvhEcpfPRPQxkrhUpGv03u9DNjKPF6WNlZ6dmXBebypGQ8BywCsJabR4CsW7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3CfPyBUO5muwy8AF1p1/3ZoBs6M/hbf5710bRC58ld28Evxgy
	hYpCOM50lPcmaqDZ/Uajla8UV1VhzHwtJ3/MIak9wE5AtuB0qeFCVIiyT4MI+2wOaRKcOynJZa4
	PGAQ6zaYy+qOjj+08Yi/O0Q/mRE7gNA8=
X-Gm-Gg: AYBFou3fiUsHInvHO7BLMue1Jx5WkLiNPJvn/aR3Yr/sdE9OCNZd2RuMACcZewjXV4+
	B8CkCdKDSbpHY4263wqE+5lh2kC3G09u0avHxeYmo75iDDDMzq6FhgdiuhV7RJ/hnLyd+jmkebj
	appG+Nm1GZmXrHvRtS2n9n/Ww76xUDJTlxsYehp8A4q8MJ7bas9VlJ4RLOHAIt7X7oifd9nw7WA
	4+nr6OUofxpQIVh1bJKJz9RQWzzHPO+mOjhInEsSgAUsQO0bgboPS1NaiRrU2VU9yuDwmdnN1QX
	J80cRI8roa6ExXRYnmQOxwKLLI/6WAG7xrG0VBo66CK/Qf1ijH68pt6kJsa/MIpcXouPbj9L2cB
	Nj1ETML/8Wg2N75aeraBg6xIBtGsWO5Yw/0s=
X-Received: by 2002:a05:690e:4002:b0:67c:f0d:82e1 with SMTP id
 956f58d0204a3-67d893bd8bdmr525d50.2.1794501201888; Thu, 12 Nov 2026 08:33:21
 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 12 Nov 2026 08:33:20 -0800
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261109000243.3936824-5-joelagnelf@nvidia.com>
References: <20261109000243.3936824-1-joelagnelf@nvidia.com> <20261109000243.3936824-5-joelagnelf@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 08:33:20 -0800
X-Gm-Features: AclHuK_FGWOWv4UbRIgbbmYPPnmJDJ_Hf17GfXM7QfUltDyC3SKn9TnbpoYkG1w
Message-ID: <CAPAsAGxPCJ87akRFmcKWLW9qQ=zMYim+F6wnLeYmSP7CuEgMLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] kasan: Avoid an unrelated RCU warning in the
 callback test
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	"Paul E . McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: rcu@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Joel Fernandes <joelagnelf@nvidia.com> writes:

> rcu_uaf() passes a false protection condition to
> rcu_dereference_protected(), which produces a suspicious-RCU-usage
> warning before the intended KASAN failure occurs.
>
> The pointer refers to a fresh allocation that has not been published to
> readers. State that protection condition explicitly, leaving the intended
> tests intact.
>
> Test:
> Built with CONFIG_KASAN_KUNIT_TEST=m
> Booted Qemu guest (8 CPUs), ran modprobe kasan_test filtered to kasan.*rcu_uaf*
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
