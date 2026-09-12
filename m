Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF98E81ACD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171509; cv=pass; b=e5tyRszKtPm1kA2SrQ7c0L+nU8Z5NZYXcQX8txWK8fowBx1gbnn8h1eH95112tej2RuJ7VDoFHlRZ9S5l5OF7yelPTNi2vdtlFLcSL/h8Yvr6LxPR9liNPZD8zOr5/gIt9eil+qQiFch0XM3UjXsR2AXDFp7SiOhpQTqj/JO1PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171509; c=relaxed/simple;
	bh=S9T+DmYc+qxQrzaKN9l3RbSiFsILLsDPZCDFtVs2ENQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtGxLRvb/KRpCdwH1UuKtfNKvzGOOszB5CFKj3zPTTpehNshlW/YMOjA3LZZzqXJBGydDI4Mo44YxFQLwMkiVvsGx3GuHLsIxDPJdvQ1ml/oQ1W5dYorxZvneG1IrkdFxO1qzr9CiEUmHXAKmrxMzol2B7WWY7rFPCnHm2l7Cqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kM9yNUhf; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kM9yNUhf"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so1705293a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789171507; cv=none;
        d=google.com; s=arc-20260327;
        b=qHIG6QNgQK7922ksSRJDfgQj+atJbWimMGSfDC7JDjQA1MfdbJTamggrLVXIGSKnK2
         t2DWmaHRALCNli5XaS1i7JoqShPkcStyVjUAZK+kbOsA7dGtEVoh/YS3pPS4Fd7tzjpC
         45VvtaPcOtcL2q37LqJ4jRaoGc7Oc0NMP1qbrweHR/o+wtDBGZv2OvwNrWmqCdPudcoa
         GF5uFaMddqzM05Rmz/B5O/lwgaszy7m/HQNcwcFbidycHL8+cFmOVroQ5VOJZmH+Kqf1
         RSrY6IaNEmt+ULcegIwWWn7mMqHggbWVitM9pDhkYc5N7MOzOGW6877cYHSyuiNvOXDr
         4TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S9T+DmYc+qxQrzaKN9l3RbSiFsILLsDPZCDFtVs2ENQ=;
        fh=fZZnex7Nca2vN9NI/fCDZyNc/WswpzCNcwTqZIeBAX8=;
        b=HAmmun13dWMs5+eY7t7RGHPAe1cykJv8H8kWhUU3E5+GWI97UPv+mMbbdd1MHjwwwu
         I8Dne4VQtNIK3Ww8/3LH5j5Ot2KqikvqwVYBkwhtMXe/G3ySiIvpP3Lgekw5XOgdgnn4
         zX7UaTYWdrorh398Uu2qOxCl2NURJvDEqEbcfuRJj5a4c+ifEUxBrJw5JcYwJpKc5a0F
         saN2rX6JiMsWa1+Liu38nDV7Djm9LNE17PDqzNXG9ApKSk1WtVLjvTXU5VrAdBQUS3m2
         O5EGwA1/Qu+10nZNSelck+gySnlEquTZN59XZG+vxxWIpbyF1GdG/bORfGv13dzz8sHy
         H4WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171507; x=1789776307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9T+DmYc+qxQrzaKN9l3RbSiFsILLsDPZCDFtVs2ENQ=;
        b=kM9yNUhfcUDWuGsAwweczxrbNmbJ8fy+/A2s2oRPRuSBdj4YYMO3WS5UMVpPZomzxv
         p0VPz16tioWSxbX55zlLSJGMcyp0pusorpIqWREPRwciK+t4dF1uqlql6ZQjHzBOLP+e
         A0CHk4dZjWXbqK76ghaihOXA6unGVqdWoAhc0SnVhPT2oVpDXikjsbrFrPiNmntYv61N
         eOfXyfF8aoyoteDCOiaP2T6X3GzW9w1fqCCYDNU0fGQaf/Yajw7vAio7DlWE4Uo4xBl+
         5YMNIfD3rr4CGI//vNJKp0jP1Tn6LLNPBN9oGEs/nSnt3a2c2mAyvbxUdKDQvmKeizCc
         l4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171507; x=1789776307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9T+DmYc+qxQrzaKN9l3RbSiFsILLsDPZCDFtVs2ENQ=;
        b=MR7hD8Wz1YdGy9iSjlq5+LCLzP84o4ChRy6I0+CzUUDlEsOc+SU+lKiPpXGNREBSAh
         6HRXhBnOtPzmp2I8Th9det07OPUC4ZrGz65+1EYsJfyk/zlyDiPH3JqYiv1/96+2xxVo
         VK8aeouOwsR5qVXB5OQLBEtihHBryLWNFbYBsy1trZA0AoSIiNxuqdMecRRXU8oXdd6C
         9lTGiXa3qgPziVCw0W8IIRcN0GmnSWJaCLrbl1GyyTBmDX1761PcT6zSIS78KdkGMGDF
         qFmLI7zIok4+WTcGe+kLZMgC+HadLPWW3oXTh/3r+xsyW45ZCaJMyDSS2USkWaDLOFDn
         0tig==
X-Forwarded-Encrypted: i=1; AKwUvBznDBHVSfXVaA6S0GQ5gp9OoxyGNTdxQ7aFfNqn6gU7PBgWJ6BjrFHeW34WMtw3ZB960Ch0pYEsu0lwemA=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ+texezPv/spMnY24JDHKao9Beb47IxL4mNmP+GOgVYDidj97
	UN/q4YxrNVDvIIXDzbIFOu2qo6/2qUhyGUmr0gZpxNPUb8XKUNgdvbkNKJ0SqwXYEwz05ShgOV2
	SIyi2l8QDB9Sfx/phKyOP9aWszi804nY=
X-Gm-Gg: AYBFou33NAT2+4dTRCfddDP11DfuC8stl0c7v2rt7JYjW4lLZh8tCf6/p4t2fR494yf
	EUe3a0LoFDdJQm6T63t0dVDNJcwftSATKWylcv+/Yl+QZM0HydP6b0xNg6Y5yjkYhWq1NjFFVph
	d+QoNS9t5QA/Kw6UuYDsuUh6Gq9hEzJdXRm0ylmRVtsPdBL+NSWsZ9AQ0vqf+K2YQKhHaPBzSib
	Hmf+POb+gE8KU/c6BtiBaQU6sD/1yrZW72Ol8LEoiGDlUpTGhN4fB8bzHF18YKdzCCApi+TkWjt
	AsELjbTjQaGMu6Lc6aosBUQ0xA0Sx3T9AKg3mv52L2IVGd13tH9kKB1+W/m5ezwKKyx7sYgndo9
	Y9YQULxRqzFlN8BR6R8jyMsa3w/iL1q9FjkBf
X-Received: by 2002:a17:90a:ec86:b0:38e:70d5:b12d with SMTP id
 98e67ed59e1d1-39d9bc67655mr11774219a91.6.1789171507258; Fri, 11 Sep 2026
 17:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815091819.3651099-1-gaoxiang17@xiaomi.com>
 <04f3ce2f-67f5-4829-9551-a69b9df29854@kernel.org> <CAEf4BzbwZkoacX-iP1j4+p8YNbWsq0pc3eTermh2uT5ir66zbw@mail.gmail.com>
 <8d2e20842c24460296e4c83e6dc0dde3@xiaomi.com> <CAEf4BzYQvhSVN=Hggg5FHzFdkRr4UNBD6yXaBsOaAwbsRpXpsw@mail.gmail.com>
 <aqSNkbhIuaB5D0H0@google.com>
In-Reply-To: <aqSNkbhIuaB5D0H0@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 11 Sep 2026 17:04:55 -0700
X-Gm-Features: AcwNN1UEr63Wxp7MKqMET22sJl2gNoghCd52hruir0AgkgtHxzDzVIaVqxthCq8
Message-ID: <CAEf4BzbAOgwQqsRQnY4yxvubLtioQNL_BBHer4ExvNF7Rvvu4w@mail.gmail.com>
Subject: Re: [External Mail]Re: [RFC] bpf: account ring buffer backing pages
 separately from Lost RAM
To: Isaac Manjarres <isaacmanjarres@google.com>
Cc: =?UTF-8?B?6auY57+U?= <gaoxiang17@xiaomi.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Xiang Gao <gxxa03070307@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?5Y2w6Zev?= <yinchuang1@xiaomi.com>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lorenzo Stoakes (Arm)" <ljs@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 4:24=E2=80=AFPM Isaac Manjarres
<isaacmanjarres@google.com> wrote:
>
> On Wed, Aug 19, 2026 at 10:24:28AM -0700, Andrii Nakryiko wrote:
> > On Tue, Aug 18, 2026 at 6:46=E2=80=AFAM =E9=AB=98=E7=BF=94 <gaoxiang17@=
xiaomi.com> wrote:
> > >
> > > Thanks for the pointer. Understood =E2=80=94 no new NR_* counter or
> > > /proc/meminfo entry.
> > >
> > >
> > > The remaining question is on the consumer side: Android's Lost RAM
> > > accounting would need to enumerate all live BPF ringbuf maps
> > > (BPF_MAP_GET_NEXT_ID) and read each map's fdinfo memlock to sum them.
> > >
> >
> > For BPF ringbufs specifically, you should be fine just iterating all
> > map with BPF_MAP_GET_NEXT_ID, getting its FD with
> > BPF_BTF_GET_FD_BY_ID, and then passing that fd to
> > BPF_OBJ_GET_INFO_BY_FD to get map's size.
> >
> Hi Andrii,
>
> Thanks for the suggestion on this! I did want to express a couple of
> concerns with this:
>
> Scalability
>
> I counted the number of maps on one of our devices, and there are 112
> maps, meaning that there will be between 224-336 syscalls with this
> approach. eBPF is becoming more popular, so I'm concerned about how well
> this will scale, if we have to invoke 2-3 syscalls per map.
>
> I had a test program that implemented your suggestion, and it took about
> 2 ms to identify 39/112 ringbufs. As the number of maps in the system
> grows, I'm concerned that the latency associated with computing the
> memory usage from ringbufs will become even more expensive. This is
> something we had an issue with before on Android, where we had to
> iterate through various sysfs files to gather wakeupsource metrics [1].
>
> To improve on this, I was wondering if we could expose the ringbuf
> memory usage and potentially other bpf stats through bpffs
> (/sys/fs/bpf/stats)? This counter could be a lightweight counter that is
> incremented/decremented on ringbuf allocation/freeing so that when it is
> read, there aren't any expensive computations.
>
> For this specific metric, we could just use a counter to track how much
> memory is being used by ringbufs and have userspace read that. That also
> brings me to my next point.
>

I just don't see a good enough reason to single out ringbuf maps
specifically. other map types also use memory, why would they be
excluded?

If you are worried about too many syscalls, look into map iterator
program types (grep for SEC("iter/bpf_map") in selftests). That will
be super fast and way more generic than what you propose. You can ping
such program in bpffs and that will be you custom /sys/fs/bpf/stats
implementation that you have full control and customizability of

> Correctness
>
> The max_entries value is the size of the data in the ringbufs.
> However, it doesn't capture the 3 metadata pages associated with each
> ringbuf, which leaves a gap of ~468 KB, and that gap can keep growing
> as the number of ringbufs increases. It's important to have as much
> information as to where memory is being allocated to, as there are
> devices with as little as 2 GB of memory that we need to be able to
> profile memory usage with.
>
> I think exposing the sum of ringbuf data + metadata pages through the
> node I proposed earlier would help achieve this.
>
> [1] https://lore.kernel.org/all/20260511174559.659782-1-wusamuel@google.c=
om/
>
> Thanks,
> Isaac
