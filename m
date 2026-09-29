Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5811A0BD0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640774; cv=pass; b=rhsS1IXDMxSCRJ9e+aKqETwMsjwns9kB60GITmiIbENmqFLKVEEu94nxTMIVUU8GywznpHi+aBGaaBUrNdsl116H+oHtmqt1Iz3QBdW8ZSwhdtAR+Fe9/0USXIB/0Xacst4NIhmvBhrkRl/LTr5oS6UMLPuqdseD8OLO8XhZfM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640774; c=relaxed/simple;
	bh=WCpEwYm2pg45X09DYVeAAYbJ6niAepsozXrMLCbrTfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKYcsILDs1pCjZ2n+JQw69Th/0/OBPlK8SpQjTMECTD2NfrF/lLJWbyeCqNVYy61yU7NsPHIhPS9T+sXNCYwWI/1xJ/uXjreqsE3hBrOBr6JPvoxwFbiE+66S2KLtoPIKJaPPLm37oSK7Xi3aY/XdX1T51TbakAN/X2fueaKaLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=R9MTlx+R; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="R9MTlx+R"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-67559a09ec2so847145d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790640772; cv=none;
        d=google.com; s=arc-20260327;
        b=W6znUbbcr2wS+nVUfYvJnVDmyPtzt2wNBL0Ht1QmDpNXeDqKbWEsSKlmWu/4gZNBn7
         wrKeQH+nR1ck5ZBVvAYBzms9cgHA8Ozd950EOssmmhGOekcrOl/ll6emDFbq33HS1bvb
         tSJ413z07WvZehS8hkZezrY0piN55kKP8fKQd//N1kqLP5hcybgRwCChoxF+8+FTd4rr
         HIcA88DP24jGTwJYulWKNW7qC6DfIOQZod6yT2u9FpVjXjvUTpkllA2XFKngI0Qa7Lbw
         7G6dTrhOkoqQdL23POyrmpTjv3mXrDvxuVgy6GcQk9le6lNz8ZtI5vEIicdoQRMQkCPQ
         xoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sy5nnA4WXY2yLs1s40a3tAQdL7ZO3e0dbOF3g9DpCc0=;
        fh=qCaeiFiiksb9buVMozB4Tv0hP4nYaNEW+kAjzG5WNCQ=;
        b=JmBblaYI6RSRNlWWI1JjIve/Vwjc3J1Q1EpQaFp5wAgq10ghBfRV+RGDn4xbPHxUtM
         t5q4kM+6pCnFL39spaK8JZtaLufdZ6PyjrwKIPl0KCwYkCcRG2uS+apvL3EiHbpuTogB
         8//8sQPMiVsfMoh6oBLec+IK+E0qGxgxmcM6JkGZjjy4/KffG9P7YqytPz3TkvstminA
         TgCvuro4uJ432TddBLt3F603/v3S6VgaVDjDeo+DiFeIqmFpJAHpEv3xkDXU/EttFQ4H
         +Yu4p1jUVu/3sVb51yauSnaUJptd+caEnBjp0yR7tQToOvdYwJT/JFy6Bk4QcZ7im6jh
         zt8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790640772; x=1791245572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sy5nnA4WXY2yLs1s40a3tAQdL7ZO3e0dbOF3g9DpCc0=;
        b=R9MTlx+REOvfDxlIKDkAkJpGlX1CxGpmAydaEhVOXoALAKaXrDKbF6zdgRa2DsDbgZ
         mSPAe1SptBMiMZZ5i6llfF3QgjweS+5btwZpe1AXhO5Svk+H4Sb2TPRWJszJvyHVnGSv
         MKMibcoojejmh+YQUAbfIAGfK0gLP27Jz1Oeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640772; x=1791245572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sy5nnA4WXY2yLs1s40a3tAQdL7ZO3e0dbOF3g9DpCc0=;
        b=xENUC2vbrYFZUkSYeDuHqSiA3LhicElnrO2iVlGieh/y+943Bh/OIpVI2ZDJXD7zvC
         jGzd+griEGYtG9bjTdOtj+L/6rk9T1qJ0F8vVeBw0hMboucZ9B0+erYiri9892QCiEH4
         TQWzboxMdf34K84BUP9w6V1z+jsdpYrflejl2e8xv/fk4L/JPNye9QAn4dnwd+CS+0sj
         DdsEm6p8FNqMP6aYntpSSB7KNZaFCY7VZOC23AJblN2YpUkrPY4EK0viGc/B0fsFaHuh
         Rkvc9TZ42kHqIVUpOAiL47Wqi4g+pdrRwBJsVNMrPNUBTc9pH/4vsd6BwPzI4m4YPubx
         K+xA==
X-Forwarded-Encrypted: i=1; AKwUvBwsn2PLFIEIGPAZfblmgh7NsVsY3h6EbYCHeB4xfOWWL4UcCJBweRRvKOXqw4cd1tdAjct1ovEzExDLeiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItyHVjuanbIeH3nZd6kWAQRjY2gHZxVtmrU3++sQy+B0a43t8D
	D9awIZmjy3dA5StRqDiGZ5JQbI088VS3lLaU1WDTks1hWP0Nk8rv5E4pVCCVhNY5Nafq3Ki1ptR
	q6JuLkat/scnykAsPh5kx9VM2Y88Dm1+7nBDQK81XFg==
X-Gm-Gg: AYBFou1fhvdRDhk87mR4bzPQjMD0Xa7QbHxDUTnuYcD3vrysjLqJvYDoMecCNYwyms4
	1n1TrvCHEzzD4mMrDck/zjEchVuP3/rFhX6zhzzPvU3OqE2k5lirLrCPrd7tCl/EkeTaCxqHV+L
	VsljWohEvdOT33Ety9NiCpcvRRCYvR/A6xRzpKk13moL2AEf4W9qk0uY9NljUfJcqAlde/qvW1I
	6LUguOOVxDBazfG2bOTsQB/iOCSJ8WkMBRUVjLsHzVr0ayAxQdgn0bv/8MIreLxuPwNZT9eBTKn
	cfvTfDMBqHemN79qc+iUeyoUPtrwm1iRmUSKeACeVmEk8NyxLH0+2yvY4zoEv/dZls5FiVSqwJJ
	F1G6TTEbsKCU=
X-Received: by 2002:a05:690e:1487:b0:672:e7e1:f3de with SMTP id
 956f58d0204a3-672ed46d694mr5866366d50.73.1790640771260; Mon, 28 Sep 2026
 17:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <CA+w=M=R7vMK9-YZufh1ZW7efsVh=vCVkeh2_4rPSAsN=SH8MuQ@mail.gmail.com>
 <CAP-5=fUFWGxNSS+TW4iHqeWu+24-R2rq63oBX19VxkTXnqo+4A@mail.gmail.com>
 <arrhc_7jvX_W2uXS@google.com> <CAP-5=fUuwXTN6kjDrSqygN-Dy3OFuWMH705_tsCXX=dbG747QA@mail.gmail.com>
In-Reply-To: <CAP-5=fUuwXTN6kjDrSqygN-Dy3OFuWMH705_tsCXX=dbG747QA@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Mon, 28 Sep 2026 17:12:35 -0700
X-Gm-Features: AclHuK_Gi0q6KGkG-TKV-EY-cBXKPRFfaW4yfy4rNdbodkBmzTyCOdxEyH18vSo
Message-ID: <CA+w=M=S3USeLyFNaHSjHL+cmzssWk2Bygahetzr0dNU55TZEMw@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf symbol: Reference counting, flat array
 storage, and LRU shrinking
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:05=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> > I think many of this memory overhead come from the symbol string.
> > Probably we don't use most of them.  Then would it be nice if we can
> > lazy-load the strings?

Namhyung, your guess is right. I counted live symbol allocations in eager m=
ode
on the sample fixture. At the peak, 986,688 symbols take 258 MiB:

   names (demangled, avg 210 bytes)   197 MiB   77%
   struct symbol (48 bytes each,       45 MiB   18%
     24 of them the rb_node)
   malloc overhead                     15 MiB    6%

That is most of the 335 MiB max RSS. With --lazy-load-symbols, only
2,928 symbols are created (0.5 MiB), with identical output, and max
RSS is 108 MiB.

> > Without the string (and the priv part), now it has a fixed size so it
> > should be saved in an array directly.

That is close to what patch 5/6 of my v3 does. Its index is a sorted
array of fixed-size entries:

   struct sym_idx {
           u64     start;
           u64     end;
           u32     name_off;
           u8      binding;
           u8      type;
           u8      flags;
   };

That is 24 bytes per symbol. The name is read from the string table
and demangled only when a sample lands in the symbol. The difference
from your description is that v3 then creates a regular struct symbol
for the hit and inserts it in the rb-tree, because the rest of perf
holds struct symbol pointers. If the entry itself were the symbol,
with the name as a pointer/offset union, that extra step would go
away. Ian's patch 1 would help: once every name access goes through
symbol__name(), that accessor is the only place that has to resolve
an offset.

> > Probably we can add a limit there
> > and print it with offset when it doesn't have the name.

Agreed, that is better than [unknown]. The symbol boundaries are still
known, so the frame can be printed as an offset and resolved offline.
I can do the same for the byte cap in v4.

>
> We load all symbols instead of lazily because we need the end of a
> symbol, which we can only determine by processing the entire symbol
> table as the end of one symbol is the start of the next.
>

Ian, I think most symbols don't need the next one for their end. ELF
symbols have st_size, so the end is start + st_size. Only zero-size
symbols take the next symbol's start. The whole table still has to be
scanned to find the symbol for an address, because .symtab isn't
sorted by address, so an address window would scan it again each time
it grows. The v3 index scans it once, sorts the entries and fixes up
the ends there, but keeps only the 24-byte entries, not the names.

On which kernel symbol is right in the nf_tables example: the sample
is at 0xffffffffc0c4b280, and /proc/kallsyms has nft_do_chain at
0xffffffffc0c4b0b0 and the next nf_tables symbol at
0xffffffffc0c4b4e0, so your series is right. The last dca symbol
starts at 0xffffffffc0c4aa50, and symbols__fixup_end() extends it to
0xffffffffc0c4c000, over the first page of nf_tables. I've sent the
fix separately:
https://lore.kernel.org/all/20260928-haghdoost-perf-symbols-fixup-module-en=
d-v1-1-0a70d1edd401@uber.com/

Thanks
Alireza
