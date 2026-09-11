Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10CD43F4BB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160354; cv=pass; b=fGMeuKKZQaOKEJx1x7CloVbvAixFZyZo/iYxC1E5ekVO5cAf7LUeo6zMNoMFoyeR9v0Hl8b4256tpOOk/654e6nbw2aLbUW0bvXpaRZ/0hus92J5JY/KX4UobuVII6siukfzp79N64xlBl7OaM/syjIc8dbZOMRR/jrYPMPpquY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160354; c=relaxed/simple;
	bh=mKPHrWNmrKgczw222t5+R7j7QSjX3I+NtdJQy79SCIs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6dBTwcRi+dgE+5RWHJsLf+A8mZdfmoY6BM2NXOUQ9FkcwWwplY9D7y5SV8AYR1mVfqIbjfoJglUDF6VQNKUq2x7qR/WZeGly9mMhr7TtTEqAm2kkOPGt+s8toW+QHSiVZV6J2+8DUkar6LfllEfnyp+HewAPcKWjWuLGaiCRpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DSVE7VfQ; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DSVE7VfQ"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9106f4c3a4dso14884306d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789160352; cv=none;
        d=google.com; s=arc-20260327;
        b=eWedzNYF9qNO0HMh2a6WBmA84jJhMpVKvLTZntgQ3Frf1Ttm7+alKekuD9p1exl0iv
         ht7G6Pv5KCp3lu0xGLI4yVaxDTp2G2pk0JByk/7jGw5yK6TsZiT7pZC8N8dGMwF48T+U
         0AG2ON8rxaZIT9r+0s0RzOGR3nAbnmb2AS6ZmCDVs42ZrymAhekASewUsaIzDctxe5k6
         d3QXpSG8+UnixXfSEC8D/Lfpxn6hX9XO1M1aqlkNnzMYe7JklSlnQjXBdH4+wnx7w5MH
         I2JHus6D3enWmvmAQlRabUfIa5QVtZ83kJd2BpRELb5vmJ2p8k7uYkkUOV1y5v+J0ec1
         D0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9mIQ6jM8juF2PvO8eUkaKKIYpJrRvH5Gc2fB112shtA=;
        fh=0fPGSLa8/YLFMVd8i/YjeNNiiwdCTqmIKQBiAdRSUyM=;
        b=ANGi+bNolsPKYuOXN1HzJ67ETE50o2X0XoMurczxDp3Fm4I/kMllYX+lsH/jjHU5aO
         tPAVJN0dzfNUsoeGlMUmZZb1qQzrKymVGRgknS7XiInCncLim9V6I8aBm7vlRIsiRzAs
         /HKAI/zA2LHctMyaqwH7ZNna/1bXwbDMRAFV4t2qiChgbQSZgtzYA7I1RLv5DSK0ZOd9
         58bkxpHhe2hUQbG5DItYbuWunVmN2BH1Xe/9W/2BXTlIiUFSSOs5p+rSF0e2z39aOfy1
         BvxAbYbFiqTZwXHS7GxhU/4p+em1ILai0A+0R8IfISqRXAKP/O57rlnCuxCvB0PbGwQy
         BNNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789160352; x=1789765152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mIQ6jM8juF2PvO8eUkaKKIYpJrRvH5Gc2fB112shtA=;
        b=DSVE7VfQ2Eng2yDVZY3OW0D/7ApjNQx5AFMsIrUtYoosIuk5GDWX/+7PrpTKvfoFvA
         JGkZl80lmw79DsCv9lt2neWpHGmnaUmpkWfnvUXRzi4MiwRI85LyYJC/gTOWgLyGRJFx
         5abHi+whgYFDVJGxB0kjBW09WaGFGOp+Dd3Kalj0nayVUNenUVmh0N/PEWhzBRRUL4uf
         v17tXEmDjGLCESsUeTXBr+JwZcnWqR3hHXzphggPFDvDp5KImn+GM9ht+j0gvjaVZiAQ
         KoA0X/Tw2Djio7poRMdqW9UUrQ0RPKptwLjTO2o6nevXObMubepr4MRqIusmSmR3DD7k
         StDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160352; x=1789765152;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mIQ6jM8juF2PvO8eUkaKKIYpJrRvH5Gc2fB112shtA=;
        b=NV5nHSeaA9kNGlgkGxKxAXo4nENwcT4kvf+ZST3sddo0pflTfQAP/jkwan/FV3vVpV
         FhIsk32NDm9NONQSx3bDPwkGZEVFv9FcqEKQZPOti3RxkQ2Ab9BDqtNMInN/Y+i0lE87
         bkL45onPeJ72kmTpwkEFTiyU1MPO8MQFtftSy96dOOYmHBXyJ6QW7m+8w4RknsnP8A2f
         ZJHnoRWRuMyaRCEXsUMGibFSuzC5cUW72jWIrtjihMusDgGGKaUVSVR76rZYC5mvNrcZ
         pgvc2f0JiDlH+kBO0Mbmu15lpf3HVHIL/8XqQX7hFFFIXlZ+/QvsQGrjleel0+6GrKw3
         8JFg==
X-Forwarded-Encrypted: i=1; AKwUvBxdF07dqsA+ghU164OiYbjCCBu6fVBnw9M7irdVS54USXCYYNCn9GCqnmgGIa0FBHXHTG2gqIYM/HDbxqM=@vger.kernel.org
X-Gm-Message-State: AFuF++nLu2MjFa5OqzYZDh/nsWC7nV7Y6/IojPSoFPX5lWM8aB38vVgf
	0JtQAeJZRqB2Lws+bXMenys41oMdiSvzmm9ORWS+fhecHjGT2trDRDcxy7hxMAsfVohFzWTx6TQ
	uH419AAzUBofZD7xZucYnfnt1YpIytcelxeLEfoJv
X-Gm-Gg: AYBFou21e7wTjCWyofbl2xDpaTXE+2emtVTTPPbF4cQNVQ1rAwrHSkJimIJ95qy+G4R
	kcqRV1i6VKzHOYW3PL5hnSvJgNCsDBu6N3M1Cj/ROg3mLGs4b5DvgtNX3z4r09t3rYEOAIUnhMr
	qCmVBmEZZ9NIuqFr4heZyIFiczk4+QVoRE6z2f4p94bmuqg6ZQb00bMHva0xthDT5NkKNiOLT5H
	4JfOheaYp2bIUj9J+BPCIICFiuYXUI26HcFdeMwSEggq+WjtSNIqU7Ed8BvKW4CwEsenTMJjltm
	3DLQDEykb8rGyYEjuOGPhOdKarthut2Tg0dB49NIKZ4PBpNpg2JN8A1GKJKeDexKWXfcnVOfyky
	jSuLgLsxJM7rLakISMrG9qLwShPDqNbhzeLwvedCO0g==
X-Received: by 2002:ad4:5f8f:0:b0:910:4c56:76d8 with SMTP id
 6a1803df08f44-9121207d6d2mr79542346d6.1.1789160350811; Fri, 11 Sep 2026
 13:59:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 13:59:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 13:59:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aqRFSiicubfsw3N6@google.com>
References: <20260901180713.4185641-1-dmatlack@google.com> <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
 <aqRFSiicubfsw3N6@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 13:59:09 -0700
X-Gm-Features: AcwNN1VXiGYQy4JW0rBuiz4KjYly49Wx8Xl5G5ezJF-9TY2IawBLiOKUcfGow4s
Message-ID: <CAEvNRgFCrcyk6F0vJ11pgj2EDSUAXj6Zw-oEdZpfj2SrH1Cv9g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

David Matlack <dmatlack@google.com> writes:

> On 2026-09-11 11:04 AM, Ackerley Tng wrote:
>> David Matlack <dmatlack@google.com> writes:
>>
>> > This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
>> > UAPI to enable preserved files to be restored into a userspace-provided
>> > file instead of a kernel-allocated file, and uses this to support
>> > preserving tmpfs files in-place without any changes to the LUO ABI.
>> >
>>
>> I'm interested in the idea of retrieving folios into an fd for a
>> different reason, I'm exploring handling over ownership physical memory
>> to a guest_memfd.
>>
>> > The Live Update Orchestrator (LUO) API currently explicitly returns a
>> > new struct file for every preserved file during retrieve() (e.g. via
>> > memfd_alloc_file()). This then forces userspace to use anonymous memfds
>> > for all in-memory files it wants to preserve. This works reasonably well
>> > for VM guest memory but does not work well for other types of files that
>> > userspace may want to preserve (e.g. in-memory logs, binaries,
>> > configuration files, etc.).
>> >
>>
>> Does this assume that VM guest memory is usually provided using
>> anonymous memfds?
>>
>> More generally, is the problem that there isn't a simple way to
>> implement retrieval into anything other than anonymous memfds?
>
> Roughly, yes.
>
>> > Preserving entire tmpfs mounts in-place would require a large amount of
>> > kernel support and would effectively make tmpfs an ABI, which is a
>> > non-starter (or so I hear). Instead, we can delegate the reconstruction
>> > of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
>> > to userspace. The kernel just needs to preserve the contents of tmpfs
>> > files and provide userspace a mechanism to restore those contents back
>> > into a specific file on the filesystem after the kexec. Hence,
>> > LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
>> >
>>
>> Suppose pre-kexec, the data was in a tmpfs file (and fd), how would the
>> preservation work? Would the user have to
>>
>> 1. Transfer the data from tmpfs fd -> anonymous fd
>> 2. Preserve from anonymous fd
>> 3. kexec
>> 4. Set up the tmpfs fd
>> 5. Retrieve into the tmpfs fd
>
> No, the proposal in this series is to support:
>
> 1. ioctl(LIVEUPDATE_SESSION_PRESERVE_FD, {TOKEN, tmpfs_fd})
> 2. kexec
> 3. tmpfs_fd = open(..., O_CREAT)
> 4. ioctl(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, {TOKEN, tmpfs_fd})
>
> No transfering to or from an anonymous fd is required.
>

Cool that preserving a tmpfs_fd is supported. How is that done without
preserving the rest of the tmpfs stuff?

Why is it possible to preserve the fd without the rest of the tmpfs
stuff but not retrieve without the rest of the tmpfs stuff?

Is retrieving into an fd a bit too much of a shortcut? Would preserving
the rest of the tmpfs eventually be required, and hence retrieval of the
rest of tmpfs should also be eventually supported symmetrically?

>> > An alternative approach to restoring data to a named file would be
>> > supporting a zero-copy sendfile() that can be used to convert named
>> > tmpfs files to/from memfds across the kexec. But this poses significant
>> > challenges on the *preserve* side since the preserved file might still
>> > be actively in use. The benefit of the retrieve-into approach introduced
>> > in this series is that it does not require dealing with two different
>> > files. There is only ever one file that owns the preserved memory.
>> >
>>
>> Would it be more symmetric if the process is
>>
>> 1. Transfer the data from tmpfs fd -> anonymous fd
>> 2. Preserve from anonymous fd
>> 3. kexec
>> 4. Retrieve into anonymous fd
>> 5. Transfer the data from anonymous fd -> tmpfs fd
>>
>> As to the exact details of "transfer", I think the best we could do
>> would be some kind of move from one fd's page cache to the other fd's
>> page cache?
>>
>> Is the goal of the transfer to avoid any memcpy and fully transfer
>> ownership (so, not just by increasing folio refcounts?)
>
> Yes this is the alternative proposal that has been proposed and
> discussed a little bit off list, with sendfile() and copy_file_range()
> being the possible mechanisms to do the "transfer". I think there are a
> few fundamental problems with that approach on the pre-kexec side.
>
>  1. iommufd requires that fds mapped into it are preserved. If the file
>     mapped into iommufd is tmpfs, but then we transfer that file to memfd
>     for preservation, iommufd will fail to preserve because the tmpfs file
>     is not preserved.
>
>  2. Even if you only use this feature for files not mapped into an
>     iommufd, transfering the contents in a zero-copy way seems
>     challenging. What do you do if the tmpfs file is still in use when
>     you want to transfer it?
>

When you say in-use, I suppose you mean folio is in-use by some IO and
is mapped in IO page tables, and that the IO must continue while the
folio is transferred?

Are you expecting guests (as in stage 2 mappings) to continue to be
functional while the folio is transferred?

I'll have to think a bit more, I was initially thinking of just
transferring folios where I could unmap from everywhere (processes,
stage 2, IO page tables) for the transfer.

>> > By leaving file and metadata allocation purely in the purview of
>> > userspace, programs can create the target files where they want, with
>> > the names and security permissions they desire, before directing the
>> > kernel to restore the preserved folios into them.
>> >
>> > Currently, only tmpfs shmem files are allowed as valid target receptors.
>> > Attempting to target populated files, or anything other than an empty
>> > shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
>> > the future.
>> >
>>
>> Is this basically that at some point, all in-memory filesystems' fds can
>> support transfers?
>
> Yes, theoretically.
>
>>
>> >
>> > [...snip...]
>> >
