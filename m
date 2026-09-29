Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AC651EDFE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692434; cv=none; b=Uo848edl+7+pWNgvKrSC1VE49/ZVra3Nk+Jp3fQH6gZJgSiumIY4sp0/kduSC6FrdyqGgaI5fyTeDdHGKhMjBcmZYbKsGGKQclP3ZFtUtHq+iVi/685l31YO2acZrSLpqZYSAInABfGbxhH1a6yR/4PqCVF+noXtWE97t1UGJt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692434; c=relaxed/simple;
	bh=Ictfo6ayTgeVzDX16BAuhDJZt7+ZVbpOljn2/hm1F4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyttQg49y2DArU8xpjO+Ks5YqTKiuWyUGJoJjtNUWaoZ4TiDAh5KtTquxzLNdKUeVw2O7YtWDCx2KZq7dBpCLkm/3JXn8At77EvPjynhK1Rx9h7pcQU7Js4cYEy2yav/0YfeBlrQsFuAZWsRxxn/7QowrkBB60m13is44OPVsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqqqOADG; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqqqOADG"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1840431a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692433; x=1791297233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43/3dmeDG8ZHEWDYTwQfHePyNi6D0sJRBJ/5pN8ksjc=;
        b=VqqqOADGK6buDD9+YdT2fixb8lVGHvp3cKk7QAzHyXYdA8vECGq3PGXJYbV8TuPLiE
         bql1PUi3LBcRrpJgVxElHsQu9EZKzFyPt1RXXJ2/On/2OC5N5GFvvRub+gc2q8u/KpPr
         q/uBw5f++mbV3baaqeWv2dGapSDGOdByBbE/E96XOB8x7ypOI5qvrH14aH8X9e6wvrG/
         TPMQA3IjGZ+AHIXeBOMMw9lS5PWRKqaYfbsTi8RIj4A5R4blk8EWg3ozH44hRZ+QZuev
         PXZcrLMqDGfDCEfqndU0xo4plN/R5W7rYfcpLa4kztm7oIqK673+V+SCfO+VJqlylPrW
         MVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692433; x=1791297233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43/3dmeDG8ZHEWDYTwQfHePyNi6D0sJRBJ/5pN8ksjc=;
        b=ehjqfSoofiviQdwo3uMZK5Sbro18QfdaQYMkkEvatUDEg3SkwIXS0qgm+hVcilvIZc
         TCI08aZbL9UUF115sd2ftPWHZ1BMTEOyteGkDIKs2eTyCMJmdEO4DPj9yAg4DZa+X6k0
         yyBHEYxiL/RlZIxekFiMiIuLA4PTuvXhx0LhB9jt+vosA0gJZEFxqIxojrrbaMuzExkA
         6KN/4dRO0rqTYWR/X7B0Lvxyl9iZrrWNj5DFKvnfNSXQ6XcRCryDlaM/FCzT9zx+7XF/
         Y0M8NgPWgofXqwecM+4ewAA9DBqAEEQ7jeAFl5PoDjAkJ+9918C3e4u1kyL/PIbUxyK0
         Co0Q==
X-Forwarded-Encrypted: i=1; AKwUvByc51DmXCbRojzbaLLXt8GBVAA+vMlvfGbkBCuc20ZdUlksmnuOiJ/FlD4SLwcr+sktOSkqr/yXseYlFHw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMfY4nDvUFdltEC+tTL6SRZFTNpPSwPjKPKmpy+O3EFgu/tDHO
	DmQ7zl2O7kzPuxQIc2sF6g1tx7u9n3HdQ+WxQIau8570FKz3Qbu17wkxZ7I5Nw==
X-Gm-Gg: AYBFou2LCJi4bO+aTY1QIsb8xIf3R8abB/rHjxUw6+Zb/Di473qraZYXA5eTBreY07T
	M5CHBiTWvl1dEWzuVIzW/KDVZT7ZoDb2pHxeMMjzbuivJJ1O4cwh76IEu4KQ7qULGbSuoBE5VIg
	HFBotqNnF+snGDPae4EQ1qSD74diqbfVhjdWmqCRme+awyT86ayKcE/WcceTv+mo44TwySeTXTC
	qqGmFJe/5kyVrQtHTLEHG2JkvSdtyu7FDj4QiM4Gpu0F3DWC36CBW+TL6nwuRDlUy88e7t0i3Uj
	I88P9ZoBpN1HKnFquZ1KmetkCLZIx0hRJpFso/LEF0pBYneXvYum9K3UazhWphZqJiL14MVkCpe
	cytNRrwQGu29qvSc/B5HchShSpW2mcV+CQbV/IWv0VOFVFp9+yUmKjFqCfYXUMQ4ZjdnIS0XYHk
	DM8bnNvtScCyn6bQBOm0E/yNVhOlt7JxiyaDuiSpc4ceKUzwm02l2pEwj0coiBXb59rCWdw2A=
X-Received: by 2002:a05:6a21:6089:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3de0e6f07edmr15049574637.3.1790692432560;
        Tue, 29 Sep 2026 07:33:52 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3bb2d5asm4339524a12.17.2026.09.29.07.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:33:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:33:46 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, ast@kernel.org,
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com,
	andrii@kernel.org, gerg@linux-m68k.org, rdunlap@infradead.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, eleanor15x@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH v6] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <arvMSjbC23bPf3l-@google.com>
References: <20260927205501.672807-1-visitorckw@gmail.com>
 <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>

Hi Geert,

On Mon, Sep 28, 2026 at 02:15:43PM +0200, Geert Uytterhoeven wrote:
> Hi Kuwan-Wei,
> 
> On Sun, 27 Sept 2026 at 22:55, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> >
> > The JIT generates m68k machine code targeting m68020+ processors and
> > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > and non-mmu coldfire processors, as it relies on 32-bit branch
> > displacements (b<cc>.l) to handle large bpf programs.
> >
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >
> > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> > Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Changes in v6:
> > - Fix kconfig sort order for HAVE_EBPF_JIT.
> > - Update eBPF-JIT/arch-support.txt
> 
> Thanks for the update!
> 
> Are any of the issues raised by the bpf-ci bot valid?
> Thanks!
> 
Yeah, I'll address those and send out v7 shortly.

Regards,
Kuan-Wei
