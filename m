Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFCF79DA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149856; cv=pass; b=t77LGnXRf/1ATSZK+bXi3HnxntB6ezkaRqa+bJ+2aPVTrYZCYOkcAVZEfeGv/tz0KyUYPEyE4eiQbUsUvlIkNPXcfhnEqBn+tqx3fRS9Ljqj+cz7TiX3X9/vboIFq3AoEDJplQdubJ/WaeGoCZEpUFrhbxpABnEMI80yBUQr4HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149856; c=relaxed/simple;
	bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3Wu0UcTrpEeoPn2SYW9bKOP5ersPnNgV+oxtnyBeX2zpl1fUZY+Yc0SG4j86JBpgzmptL2HlqCCbNL8OabTwc6sZz6NFqfI/WwCvF5PuksH+YLLPlX0+PmwXFm56CPIIS66jp8uzmQBw1m4CIDCVtKQRZJBjq1YLGGOOQzCw48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXDF2u02; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXDF2u02"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ebso31866d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789149853; cv=none;
        d=google.com; s=arc-20260327;
        b=K/SkqmPtt9RmzlL+DDlaWJ0uCI0G3S9COwavy6ZWh9q9Oonof1Cfiqxhd1bXsLrKvn
         5gJe4aLQP6YJBvSJlFVZ3RJfMfF49G4JFU9DKUqPkpfn9vJWCD5iIf5MqV+PDFXVutHf
         iHLYNuVxMrLPHJvVFR8DrHOQuEyLkwxPmOejLyPd/HhVitaaPkkSP2RUiM4vg5hnWkZy
         HAgmqjOe5kEW5tilcrDqAeLlZeaBqroGNrEeRRmr7wSWibkBc1lthdkexlYuR8/vkdrT
         jv7ojTRREjFWC4IJltYQNhbiCeXFHIdNUPT6hACLf0ZRbEpbZmuVTIGffaHaZYxuoDQ5
         SWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
        fh=YocT6zUG9v6xy20H/AN2X/Qiw8xH2MwS0IvS4CFuWUg=;
        b=qzU2BL8M3UvFDYuFflq/ECzyDjGvsw/aWHptIccFbcgtfqM5H0r3qauN7eBcFexa8H
         uMB9Cj2Y9HZGCdXGlxY3ErFKc1riHcGKSX16tcs97hW1QSuQFZWIcn8S4J1dDt+oQ3Mk
         HY5ix+oMvPLO3BsnW5xo4ArW+hWB8MLHCT215AygU4QAyBNjaVMmRqEX2/lJa4paqJZr
         qK/4cNutCoK7zUqE1ca9x42CItyPcqtH3sKq5o17bQ+pFRN5mgblPrW4ze7I4B5v4RXM
         ecrcwdWIEQU7vfi4uasA9WknfaCe7igcpQBrv1KXATwN5OicpR8nGcDevSSps8C4xTky
         ASVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789149853; x=1789754653; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
        b=dXDF2u02pkdyVXQl/e2UBZ9omqn+BdwSRJQw54GV3TUwZNyD960Mi1kmkgYnXKO8ic
         A0yHl3FZBlJETN5hwpIqOAXZSkLDbAsHjf3Ee1oeXLjqO58lEEO3c+fhguVZbo34D2Kr
         idBSrZdIqYtnv90Knkv3t5tFQNckYgp+QTkY4ECxzV0nt9b5zOFAr16LMuVE+eSsBpn9
         Bel/Gsx3ulNWzyRNOuvGs9y462IcmPTOuI0SZdULWYdBrLag0NwYb4iTREZbh3RMrlco
         DCq2nPcJcYHUr5giB49nvvSn6MRkW7lUwGTJE4DQtgOZwcwEn+PGn4XEUhMwChH4ZM4x
         bdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149853; x=1789754653;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
        b=MQvcLp1eigedmDqIcKEkU34TQy6iwwbqFIL8xYyTA0dtiHh++YRM1dCjAfRf7gU4+p
         wnjvcZpk3SPeiJoR7valoZa/8vrduwQBMbpFBZVjCPPVxAPkYAF3YZ9Vdxe3cIvU2Mhi
         UBjdKtgRBlWM3QrRXrzn8JqpXsNloMjaR67qxqNQFUs+zBYp6SnewZaguA++iyppHwtH
         BqehmUngfpxi18eOwx0aqXau65qVAM6MiY1KpM4b5zydhr5XjcWuumWdgSwqumXU35TI
         ooRCFXWN0N3zO7aV9THV9wZyVS/2QKXpjqkF+OdUiDeJgilqJ6zpI+YSMSsvqr9SWp9z
         rg3Q==
X-Forwarded-Encrypted: i=1; AKwUvByoBk9DxMxjpUE4hKzMAsFzdce7+FXrer7z1RBrY27mcwNkARWIWestR93YPvbGFqIBICcyjq6jST78Aag=@vger.kernel.org
X-Gm-Message-State: AFuF++laLZgXfDiLksJo0oN7/VS+sKOmHQYP1dQXUAxEVI4FJYuiH4uo
	Ej4/pW7tuLGlPrSIKTmd7B19rAhuwwrWQ46pEvZxJMhZkIbXBDneov89a4G4D/f+EVWFXxs+X33
	rRWhA797ghxtS2nmLmJXjWO+7hAngGZcSYm+4WAtsjwwniych0JyXwzK8
X-Gm-Gg: AYBFou3xL+T+MW2KqkXy30+BlcFBKQ4QGDSTQ7iRT6zOl4791UgNzyn7llhOL9f/9uC
	IaGLLmt+4uFX2bMSJlJYaswfejXftsGy1iNOsdQnISds1hM4npYPeG4iojWDAOnBiL7WryYjO/T
	f7f3m08j8cMxhbZ7h3r8fjzcU/QybIVtAB3yxZX/h6CSoTTFBVmQlpPjR6Jue8i2t3X8zcNRCE2
	r96b043HBPfjXkgKD6Fnp/ajP1C9usUrRfa60yUrM8UFdeUypF0wc2h+S+YMMNV1xeyfnxqQVNY
	cAN0Uie75ZAgUepcZsSKNZ6Kx0jg0fz6C20C4YNz0GP5BZxo0BnwSrxyQrxFrafIFTxKcytSrr9
	U+iM+cg5iJQyyJtMC066faRID1Kd/+ZOZUk1f/lYsPA==
X-Received: by 2002:a05:690e:1341:b0:66f:c1bc:87eb with SMTP id
 956f58d0204a3-671249f425bmr1974723d50.68.1789149852145; Fri, 11 Sep 2026
 11:04:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 11:04:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 11:04:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
References: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 11:04:11 -0700
X-Gm-Features: AcwNN1VDqbMSWzZBtW5WvtCjBXts_71wkcwIE-pv_51Ep9lT2w25BfsfGqo2_lU
Message-ID: <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
To: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

David Matlack <dmatlack@google.com> writes:

> This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
> UAPI to enable preserved files to be restored into a userspace-provided
> file instead of a kernel-allocated file, and uses this to support
> preserving tmpfs files in-place without any changes to the LUO ABI.
>

I'm interested in the idea of retrieving folios into an fd for a
different reason, I'm exploring handling over ownership physical memory
to a guest_memfd.

> The Live Update Orchestrator (LUO) API currently explicitly returns a
> new struct file for every preserved file during retrieve() (e.g. via
> memfd_alloc_file()). This then forces userspace to use anonymous memfds
> for all in-memory files it wants to preserve. This works reasonably well
> for VM guest memory but does not work well for other types of files that
> userspace may want to preserve (e.g. in-memory logs, binaries,
> configuration files, etc.).
>

Does this assume that VM guest memory is usually provided using
anonymous memfds?

More generally, is the problem that there isn't a simple way to
implement retrieval into anything other than anonymous memfds?

> Preserving entire tmpfs mounts in-place would require a large amount of
> kernel support and would effectively make tmpfs an ABI, which is a
> non-starter (or so I hear). Instead, we can delegate the reconstruction
> of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
> to userspace. The kernel just needs to preserve the contents of tmpfs
> files and provide userspace a mechanism to restore those contents back
> into a specific file on the filesystem after the kexec. Hence,
> LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
>

Suppose pre-kexec, the data was in a tmpfs file (and fd), how would the
preservation work? Would the user have to

1. Transfer the data from tmpfs fd -> anonymous fd
2. Preserve from anonymous fd
3. kexec
4. Set up the tmpfs fd
5. Retrieve into the tmpfs fd

> An alternative approach to restoring data to a named file would be
> supporting a zero-copy sendfile() that can be used to convert named
> tmpfs files to/from memfds across the kexec. But this poses significant
> challenges on the *preserve* side since the preserved file might still
> be actively in use. The benefit of the retrieve-into approach introduced
> in this series is that it does not require dealing with two different
> files. There is only ever one file that owns the preserved memory.
>

Would it be more symmetric if the process is

1. Transfer the data from tmpfs fd -> anonymous fd
2. Preserve from anonymous fd
3. kexec
4. Retrieve into anonymous fd
5. Transfer the data from anonymous fd -> tmpfs fd

As to the exact details of "transfer", I think the best we could do
would be some kind of move from one fd's page cache to the other fd's
page cache?

Is the goal of the transfer to avoid any memcpy and fully transfer
ownership (so, not just by increasing folio refcounts?)

> By leaving file and metadata allocation purely in the purview of
> userspace, programs can create the target files where they want, with
> the names and security permissions they desire, before directing the
> kernel to restore the preserved folios into them.
>
> Currently, only tmpfs shmem files are allowed as valid target receptors.
> Attempting to target populated files, or anything other than an empty
> shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
> the future.
>

Is this basically that at some point, all in-memory filesystems' fds can
support transfers?

>
> [...snip...]
>
