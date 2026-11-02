Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636163;
	b=ftCnbjrnvbBWePaSNRRq2nLwHssd0lHOnICneWvZKNVU0WdkpZ4aIWMaR8OFKt7H9iN9
	 R083vtRjtAAPHH/mDBuCFkJ6ucHuILvbsmZoYcrYaPkzPMAROh5Y9HEsPDJIv+IEiFHCL
	 0n663SaY/q2CINSAtyilqWBsr5H+8HZtleZP2vYTgTaIIkWPngQnYxBjEV4RFmUVxgJTl
	 o2SdLtu3JbHRR2ss3kVV7vOmANE4m6zwjfjGg/wRxnObQgFubhY19+0yvkaVhiSWhqMD1
	 nYY1GUlcUWh+np36uM97c7MLkggCR+jR3eLLaigtlb3yic0YCQWlS8pDaz+Yc+8LJ+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
	b=gK5tgO0U65rS9i86fwP3NX/xnQvJwpi4lahQ64qyN2YvQ+5kfEQSAZw9rHh1A9Ri3wjy
	 rNdqm8Co/tsupbbHnBP4ipvHaSmIu2HIm8NdOL5w4w3SFuc0PIgavPoJF574TXQkX0D5c
	 rD1cs+VxJjN7VHMik1l2W4KVCaXmvEFnYqaK2UhVFYi1qbkml/Ya+OP4YfqKOsaj6w07W
	 2qIh4TSrtiLOYyeiW6gz4k6anpZDraifr3AeZ7AmWHVt7//mHV5OD155tpNaQKljufy7O
	 obZjj0BBAbLdfeamrLzLrkYKo3ErajpVf9ghv9HOuXsp9AVJUAWBguc/mOSWDMERijA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I+YbaIDb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B936082BC4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B936082BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I+YbaIDb
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-54492d8a988so461911cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636162; cv=none;
        d=google.com; s=arc-20260327;
        b=JUX0S78MpI48b+LsTY7wgYhSsQvngYlCDOO4xqBZR+NTQgDjxZyHUkMOh88aTfJv5m
         FGWMNL5gHMsTTH9rvhwcGJxkI4XTExzgdwJ7gndTTQJEK5C1zSCp73brqsGnpp1aLdcC
         alq58m71Tz9iFUqb/B7xfYH6KLJ6twQHsvu2PCpvfW0m7HrzZ3QrMkYr3z161bVEJKTW
         HRYHOEaE0x9sj1DpTE9us7TopwasNeg+4vSqAa8K/qJfJn7tSRGnwOwZEBQB9o4ffwL5
         B963kIbQ2ZcVH7JnPo5iOuAnxy8UkTHLqZncx5vqTSSC+DGiB6r+MmZ0jxZVxyElFhqj
         avjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
        fh=o2QCW/C+Z1SFrB0s2EJySBus/kcAUB8Ysr2KpUXG5XU=;
        b=MiXCJafQo44sVDxfOl2qJBoS9i1L8M2lTG5Gz6aSbg8hNOWlSlyELZW6Z7awD+RQ/n
         Q/O+oe6c2uWjoNbV3IViLwobqOajhuUrAgrGu3eFXSctTFzo2DchFfA8wXxUr9pxKfYh
         4ltviBFt2InVRY8zTc98foEK7ZwJxHJ4MksnC+nEHpPxZ+e/V4ObNHsnh/RGZ0URv+FP
         3jjioj3azE+RWzcxxCpK4MluardeLBOZ08rNDdIJNCMXoZ2bvbo+vguGOFoMJFhHMkl8
         +I9thUihudOBDIarOP9qUnpVWypCsG4OHJnUDQ00hMmKECyptExx2yeP+9Ko4c1asOhM
         HD/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793636162; x=1794240962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
        b=I+YbaIDbOkC+1pgeeuMMjsgTWvq4ZMMQ0fPpD0BiaUjUiuqxfe/w2LKppvC3uhcbIE
         3Et2GKeDvE7V6SDUdJCP6HIL7+J47vLHkAtnK425i2JOD/brFliuvQU3WB6eYpI+zWUd
         hRerwS+OG57otnu+YEfwQjZR+OFKXBT/xQeVfOSMWtshygRwSIp0Uj4ZOKu9QKQxgRvz
         TC3tnq7bWk8ig0Hy4npMh3GGy17F2oNQvPyHtY+NfBuB1zzUO31Sr8+GodYnH9KXCOBZ
         mbHWEu0b4ryQZfTFmPpvLExMOh0FnaJLlhwtUNL+YkBeNDNtoIZ08LCbs97M9rIFLgKl
         nC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636162; x=1794240962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
        b=uVbxZHBaIyX/vwsaXitfsuPZBvPJoumejN4mqOH4Vj9ltNjB/oJ63crY6iMkbS0D9m
         A6ivMUl0Eehiht7OlkBCl4dQv5n5vbg+gy3Hw7rNWY4KTE44amXxbX3maoe9PCIyR+KL
         ly7RXqbQcwLhF1i42vFBd5DFtQ+18x5aQ98nKz+SO2SCSuFUU0UIAc5IrNESlpWOF4OB
         rbyfoDZlI1SZxg5WPoF81vcqFXoZAv+B72f4qgl+dDYYezlHKoAGUjiJufR244hAY0b/
         t9EcH17SXGJ40Fx7n4oyJohDqqifeUYA5wsP0QYiWQfLymZbwmcZKILFvWodtSnCbzTw
         smfA==
X-Forwarded-Encrypted: i=1; AKwUvBzpWKK+81rIOAei6GIuO0JiSAX2qmbm6ZRwcGDRHBsLUBElvgSHSUf6va0gDxjt1NtFhAFusw6MibNYPR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gYvzf0020usYBjVpuT5khsjL5hImOlic5VpK3RN4DRyzL+Ygz
	YiUp41yBA+KrVmTVltQAFawff/Rx+l8YV53yTyJUSJdweQ4HvI9UdVQbPAuhg670IU0+qzMze0E
	33sXhtx36WQNU8eIYzzNUi5CnpJ/vdw4F363mynT1
X-Gm-Gg: AYBFou32FXDxagCJcf3IT4CzyqAISp4mlPU/eAohN32oibDc3Qju3mFkJXKM79k+ke6
	85iIYV1KKadIivT4zgdPO2FkD58uPCTF/0b/DwbDEoFJ3SA2ffmfjc1uAjVBx7qUjaZlUyHnQox
	dnXazWE5WRysUC3C8c/GRhkXFcC7/IS4Upe34P3tqTIFh8XSl4e/Rb1cjntTt1NTNCx/Yn/D+Al
	yvmQwxC73OAJxGlWOs55IQKM6pmgWygT2jNtROl6n84HarwZ1uW1lgW8SkMsVJ0Rrc6YWn4frVB
	bAjG5pnL6+dTkXAkIKqVFIw7i2Pj+Mu+s8EvuK3lkKohfxJndiUsbOndWEW+Og2nrF1W5opqo58
	Uh1fwBpSJKSOr+t8mK4EoFKVptdZNOX9wJw8=
X-Received: by 2002:a05:622a:618b:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-5414efce383mr93070751cf.13.1793636161515; Mon, 02 Nov 2026
 08:16:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com>
 <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org> <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
In-Reply-To: <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 08:15:47 -0800
X-Gm-Features: AclHuK8MuiAKeGSAs36EP5lVhajY6U8SuusW-kgtsEu3w40nJ0gV00M_UO0Qj8E
Message-ID: <CAJuCfpGwZqGkOm25=BWAh2QgA8Y00OUmwxsDU+_qOsVsc+KHhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:11=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Nov 2, 2026 at 8:01=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Mon, 2 Nov 2026 07:43:17 -0800 Suren Baghdasaryan <surenb@google.com=
> wrote:
> >
> > > > :
> > > > : The patched userspace test passed all six cases on an existing
> > > > : x86-64 6.18.57 kernel, with a PID-namespace adjustment. That kern=
el
> > > > : predates ca5480fb53fa, so this checks selftest behavior, not the
> > > > : intended kernel's procfs changes. Separate syscall tests on that
> > > > : kernel confirmed the EXEC-merging and memlock failure cases.
> > >
> > > I'm guessing your bot was using personality() to make the tests fail.
> > > Again, I'm not sure we should handle such use case. Should we?
> >
> >
> > : The concern is pre-ARMv6 CPUs, where READ_IMPLIES_EXEC is set by
> > : default. Nobody needs to call personality() to encounter this there.
> > :
> > : We already addressed this in 0685630fdccb ("selftests/proc: make
> > : proc-maps-race work with READ_IMPLIES_EXEC"):
> > :
> > : https://lore.kernel.org/r/20260808200312.6326-1-kmehltretter@gmail.co=
m
> > :
> > : That fixed split_vma(). Alternating PROT_EXEC in setup introduces the
> > : same assumption elsewhere: RW and RWX both become RWX, allowing adjac=
ent
> > : mappings to merge. The parent then cannot find the expected three-pag=
e
> > : VMAs and the test fails during setup, before testing procfs tearing.
> > :
> > : Yes, the focused x86-64 check explicitly enabled READ_IMPLIES_EXEC to
> > : exercise this behavior. It wasn't tested on old ARM hardware. But I
> > : think we should preserve the existing support for those machines.
> > : Populating writable, then removing write permission from alternate
> > : mappings, preserves both RSS and the required VMA boundaries.
>
> Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
> complete fix looks fine. Perhaps we should mention this pre-ARMv6 CPU
> detail in the changelog of your fix to explain why READ_IMPLIES_EXEC
> is important here?

I guess I have to ask whether you want to post your fix as a followup
to mine or if I should fold them into one patch and post a v3. What's
your preference?

>
>
> >
