Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563071;
	b=fJd3NAHSK9IwlZ7Ws2HjmIq4RBn+Pq8dl+qjgjhvgzyPJ4C/xSNsWM49jrbIQw0iprYd
	 vn7zJ7L6a+Eyj9PInTJDsz1dNaJcahnCcZjRFFUrSTPVEwsF7U3zZxo6FKqzrf96GFI6B
	 Jw5cvezAu2htzXUcEIouwXL1KTOLt3K3IuthPb2AtMVEMWapjnXq0OcGfoxtqrCfuBD/0
	 p7bARO9ON/Qb5hAWgZ7a457qcn0bFa6vPvYrNCOZSA294VVYQMOxO5k844ofpWNrCkn0m
	 859oSDfvpKJwJIpmvJ6X2HuwbU1X4T3gctcWctXDyZpFMGCmFPvSgCDF1KXA+iHnGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RoigheuXlEgEVVeOm0wqZxiwY5/DXHnZexKpxuh+vtk=;
	b=CuYFzUNkez+uJK+KgvKd3XgUvVsdvFQXKZSHO8KDFHtAbqkVXKvrmhNC5QQ37LU1IWtc
	 H+6/4TGzgi9G9WU+YHFtyZaawwgB0LlzY+q1qX1XZkEgKEk+cUhWx8it9gJXRsSAv06Nj
	 z5CFU2ppC1LMgDAhrBQB3Ayv8GQSiDEIvqTRqa++4EgzR+CWraSHUoona8ulUdi90LHcs
	 RAYnvRQtmUTqoHtezeDkEUeqS5GVFg5rKs/1qdamc7l0vpf7qnIiiolS5fVMftSP6cNSr
	 3fIzEXRQOh7vE7fm4Ue4kRC3upyJNS/72rsR3aW6rPabEtQbSaU2MEY7nqT0iKSkQ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="KyAaAhH/";
	arc=none smtp.remote-ip=91.218.175.214
Received: from mta0.migadu.com (out-214.mta0.migadu.com [91.218.175.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KyAaAhH/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RoigheuXlEgEVVeOm0wqZxiwY5/DXHnZexKpxuh+vtk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792563069; v=1; x=1793167869;
 b=KyAaAhH/eYfv2EtlnJFOXQeqVG+6ADHWw8k6iQd17UIBgcsZIaW1WIf+o+/Q81kvO7aqjckN
 k9gsBbyAi4mn1MRj7Lgh/OA4smyfnFbNsOgKeACNDfbNnJViy7hw/dO6dgnysEK4hYW6c25EUpP
 Ur5IANeC4CF42e1c02Tz/W/U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 73700c2a578380af;
	Wed, 21 Oct 2026 06:11:08 +0000
X-Mizu-Trace-ID: 73700c2a578380af
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: pratyush@kernel.org
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org,
	ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v5 2/5] liveupdate: synchronize EFI KHO channel at execution
Date: Wed, 21 Oct 2026 14:11:05 +0800
Message-ID: <20261021061105.3697-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2vxz1pal5u64.fsf@kernel.org>
References: <2vxz1pal5u64.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Pratyush,

You are right about the text, and I am sorry. I used an LLM to help
write this series. I meant to check every commit message and comment
word by word myself before sending, but I made a mistake and sent v5
to the list before doing that check. That is my fault, and it cost you
time trying to read it.

For v6 I am rewriting the messages and checking every line myself before
sending.

On Tue, Sep 22 2026, Pratyush Yadav wrote:
> > The EFI KHO configuration table is a global channel. Updating it while
> > a candidate kexec image is still being loaded can leave the channel
> > pointing at the failed candidate even though the previous image remains
> > installed. Synchronize it instead from the image selected for execution.
>
> Huh? Sorry, I don't understand this is supposed to mean at all. What
> failed candidate?

Rewritten in v6.

> Why are you setting this at kexec time? Why not set it at load time like
> every other architecture?

Other architectures store the KHO addresses in the loaded image itself,
so each image has its own copy.

The EFI table is shared, but the normal and the crash image can both be
loaded, and they need different contents: the normal kernel needs the
KHO addresses, the crash kernel must find the table zeroed. Whatever is
written at load time is wrong for one of them. For example, after
"kexec -l" with KHO and then "kexec -p", a panic boots the crash kernel
with KHO addresses that were meant for the normal kernel.

kernel_kexec() and __crash_kexec() know which image is about to run, so
v6 writes the table there: filled from that image, or zeroed if it has
no KHO state.

> Also what's this "sync channel"? Use simpler words that _actually
> describe_ what they do.

Renamed to kho_update_efi_table() in v6.

> > Use the actual scratch payload size rather than its page-aligned segment
> > size, and propagate update failures before live-update serialization.
> > Keep clearing the channel for cold and crash images best-effort.
>
> Huh? This is word soup and I don't understand what any of this is
> supposed to mean.

Rewritten in v6.

Thanks,
George
