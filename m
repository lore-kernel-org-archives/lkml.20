Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508422;
	b=p/M/hauG+dkezfbEMwZTD1sB3DpAsNjpCahbwpjfG0RiKyRejPj3FNLsEk/8PG29U3yP
	 wwQq65EWhf+1aJtcA/Eu1mdyc9hkJma/C0YvhfPr50fWSn+7kutfdfNkBUVb0NsUQ6D6a
	 fbMIWrbLocxXHLMbB1bWcI6wFY7QhkIoTG255yvnjFscM0sRPcgFXetpGNHS0dxS43pFL
	 YqqdUgfTbu/K0thhQePtxM9Qpz1DlaIp1fCFw2JGehcQKhj/zQqv3rPJ+FPLasDLgeOyJ
	 n+JY9rCUWoupJgqD88mcmZIn5crbA+TMCi02PugVvRJ0VEDaHVtk1Rg2srFpU/mzPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DNGGwn1SK0IengpfAdulGXi2EREsmRQVRNzPVdbrwBU=;
	b=1g0KrKlFvopHd6yyAOeuMozyCEOceKciDKj2UTwD3o4cyoUmEzTY58N5te/VgkyQABw3
	 lgwByp95NniQr+enLtg091WL6XQ4bXXfPqryqDotzA5T2X8KYShSWCa8DD4bEAH1DG9is
	 IIjh3VMUkUYcb6oOu6t6BbJkKTgho6dt9+1D4e6AL3jMLNNjWvohRPTrk1kbNp50E3x/J
	 JqyDN+vRuZLkJtW69loBJTEf6at60bLJomBBhnodwOkS4Jke5jUAmTqqNuiV4zphoAUoc
	 T/cKRisd9OiWuX9wb822EUU4PSfV/0geHP/s7L37rumSSy3oQ2F1h9nqOWnTIfh5RDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lf1JKZNb;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B460A2638
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317B460A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lf1JKZNb
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d473cfff6so7427766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794508421; x=1795113221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNGGwn1SK0IengpfAdulGXi2EREsmRQVRNzPVdbrwBU=;
        b=Lf1JKZNbNbgUdMM2i2KIGIbtGN+MfqkwJ0BEbEAtwCtfxBUZOVH7reJ2S/aMnwpOHD
         t6ZIFrykOHl7gg2biAw87iqG5ymmiq5LRXRC/yiMl7ci6ZyYM07zEiDrNLUPVybHx+G8
         jR1P0st04yQMJU7CTIGAxQZYeJYA0Y8+IQjFUafrMgZ2Uz3+pXRVO78f3Nt1eSViDuCd
         7Fi8zK2myMJvHtIwPXUG1lDcf+s3BohEwCwYiqmKk9B4YxLHgBv0zcwvJWieh4xupz8R
         HxHCdtxbDr53eFZceqn4Qc4XXrpE9b7aTT8o3NfOxXwi1hyLhLcoBcoar/CocEGbaeMD
         I1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508421; x=1795113221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNGGwn1SK0IengpfAdulGXi2EREsmRQVRNzPVdbrwBU=;
        b=J2eHXVGYE1HXimb98T8Gea33OUvLuiCW+B9ZLfLFN1eLNwhbIWfXLkz/vt/BvrISKw
         2cD0QMwl8E0ive1V6uAE4k/ZC59XahmTyjrT+TT+nE3eNOpHBiBwYBQTokvjrZQMd7Ck
         N+aI/ltIeLbkbtoLteFrfbN5q61YWJg5vkohhOI2kyH7SkYwr0Nx6PeNs7MTwoS30TxZ
         uvLn3eHldVmJmf3OTq5DoSSu/+fjXnR4mvsEDrU+/RaiERktmWRaQ0eC4KtNFQfOJUFU
         GEA9i4WTPMCwhHtjFn/dpSWZmRKnnT/0FFYmoeFqW/ZB3FyqcuULMhDUjUekL6Q+jWp/
         /8zg==
X-Forwarded-Encrypted: i=1; AL+hErF+zITvZm96fGqJnxWstN/X8v4jaKT2xiCq7g/7oR4Yygz80/I1VvjMKNPy1hJliXNxGne0QCfZpVuR6uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8By2b1pMr+BLJTvuJkokIEglTew8EL3i8TDBBUOogoQikFynIc
	MSw15PERkHaqfhYntgd4Dn7ytjgcCoNwDu9F/VZfzTEk1j5zkRwYr2c4
X-Gm-Gg: AYBFou0w3bUc0/5ObZ0ct66cFlH6PaaOU6+ab/jnthOI9pwGP/ZDaiyeyXTdYwgmz8y
	JFZdgtu+Zm8j9+SEW/x48kz8WIvEZJAWNupN1ZBQ4WsrlkuPsOQ9D3gOeS04/uiyq1rRBWctYfl
	3KKJedFpHd8/SRseyjxfyJS9iERSFmiEXtEPp1/JwrLC99gFkW79dth9pvKXZnMLh1zaSkF76oR
	D+z2IoFo8hIXKVz3nUaFx5fyc4leIRyDIq3bTZ6ILj2zQpndXYovvV8u4EFwHNVhJYeLp6WhhOP
	JRYCTmN5BxVQJsuYEWqXTL2TFQzjJ3C5c47xOfWFUUS5a40ImKVvNcfHDSvaW+rEtkPCgb5gvj8
	gc1VEVWxSs31EIN5sswFkddDwDRuI/04TCC2CGEH69WsYNbHb47EecKG3KbYMeBnZiA9pSEOkW0
	ESUeSrDYDQ3n2JAcgVfez/mvvaQTyCaaYLRL5eVHq4sXmmUV89pcW50nudZKzBgUUAkoGF5IQ//
	7U95DZuV10zqJ+k30nuL7+xmNvEHpCb4aph6ysJmHuW6543SDf4fssAS5kiKCNvacrw/BP40CH9
	uEpmrJbYHKaYmSSt
X-Received: by 2002:a17:907:72c8:b0:c50:73bd:ed25 with SMTP id a640c23a62f3a-c50964287eemr9546666b.49.1794508420573;
        Thu, 12 Nov 2026 10:33:40 -0800 (PST)
Received: from krava ([173.38.220.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40918sm6171366b.39.2026.11.12.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:33:39 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 12 Nov 2026 19:33:37 +0100
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Alan Maguire <almagui@kernel.org>,
	x86@kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 02/13] jump_label: Index text reservation lookups
Message-ID: <avYGgU3bp5KEF0ql@krava>
References: <20261109194916.1089703-1-jolsa@kernel.org>
 <20261109194916.1089703-3-jolsa@kernel.org>
 <20261112083305.GD2668804@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112083305.GD2668804@noisy.programming.kicks-ass.net>

On Thu, Nov 12, 2026 at 09:33:05AM +0100, Peter Zijlstra wrote:
> On Mon, Nov 09, 2026 at 08:49:05PM +0100, Jiri Olsa wrote:
> > Text reservation checks scan every jump entry. Build an index sorted by
> > code address for core entries and use binary search to find the starting
> > point near the requested range. Keep the original table sorted by
> > static-key address for updates.
> > 
> > Module reservation checks continue to use a linear scan, avoiding
> > per-module index allocation and teardown complexity.
> > 
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> 
> This is the *exact* same code as the last patch; seriously? You
> couldn't share?

I think we could share the search for the lower bound,
but then the overlap check is different

perhaps if we keep the index generic we could share the
allocation and setup, I'll check

jirka
