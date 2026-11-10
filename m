Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350109;
	b=2TFpYAgZUcypq0NdCu/DJMMJ9rDdLXlFfsKAskUNHOVDSxIdtjOtOfVbjVVVwLfhOhOh
	 swPVXE7bNNXACgIsxEdYOclUA+UbBIrKQGDVI7kJBDz6SSfTf1otRhyVJP5zIHwWYx7j4
	 /pK7oExgxmsZsidVS3b+0I0wh0Ahl+2VC++0qkUnnsOmDyDBQ4tbumq/f9lPlWQaFYfp/
	 cVI0gZ6m0uCj6dQXYQjJyoCqWcCUMLr+XUoA1H5f0DDIQkH15btvsY6+JQfxeR3lr+VfU
	 kVGCtpb5huy5bH6Oib5M59RjndThSbozwU5ngV/5pyI6ZWOgF4giYyLDJZqTI730kBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WO99KP6TeZ63noWVuo+46jXDM9/SFB2ObHzVYmTZyQ8=;
	b=ZGYWtVEEC8ETkAVA6FNHlT7HhoAs3mZq/cmTFb4OidjSTYIFCiMZi+Pdbs/4VEN4HKvw
	 UWklhmL8EZlDnjRWgLi3L7XAqpVMFa9G92cOT4h5Wo2ht01P8wncZ1Z8sttjkTd6mZhGt
	 o+qBjwxt/Hj0vVBhyfTZ0hA+sG+cIMvNVsFWkBb+syg3egpZupo7REDYMt4GwGPRSN+3N
	 Wbjae18bLah0XAOUi5YIbWl2eGMXFyWhslAbFN5KU6/ETXdN4dM6Uhb6dFbI5l74B4viJ
	 Md0qWyjDhEwqz94XcbdtO27Dd271R+Ug2l4g2fDL1zX459XtUba+XDAAsifb1otnfJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgZYJVuf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472F606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2472F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgZYJVuf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22196895e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794350107; x=1794954907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WO99KP6TeZ63noWVuo+46jXDM9/SFB2ObHzVYmTZyQ8=;
        b=EgZYJVufGZ39nE2a++JCdikOUoMACdEClIZJAeXu38fgfz/EACust6f8MXPH52tyTO
         0+g6zexkDNQ35bkoIUDjP+H58pRGElWeS+2TzzWMpzRKVSVGzK/XcN072DGXdsnaL1eG
         EErEzndhtCD9gSCjO5D6wxbxXmG6odEMcU2VDeT06jTTklIghIHQJXCJQ7pAg8fGqlYZ
         QBXz6p1HraVs4pLfMXWNy2b72MSSlbxhwVtEpV6necKI59zZqkXufpr5MzmQZ+IZQAWx
         8Jodfae0fXx/I93lGXgi5gFzfyPyjO5udNcB46ZFgGJQR0nr7t191IetE1IimnhP3wpp
         rI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350107; x=1794954907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WO99KP6TeZ63noWVuo+46jXDM9/SFB2ObHzVYmTZyQ8=;
        b=hAES4ZUGL+9FxXYDDBpGkUAhQMOSA0IJ/lHAGughgjVN/7G321gKGpH5WJwS+xYxyy
         S5hLw58/JSE8D+T0+XtMXIC271plLmgqw0jRGoW0zGSCfeHyPAE5PEDlEjw/436hVpBC
         3NCiO6MJnP2vbZoS6z+OQ2JXmDkDaF5OGw386jgjTamUKCUkEdUn7BCX9AEzrO8E4hhO
         z2A7y3HtpA963jnWRSIyjwjS4nRIIHaaAPWNyKRWft4l4wPMFQN1mcpDv1IwT1dNkgbF
         WqdYl07WulGJbRS0UeTrUzOlCyVL/L/ZMqLt+h0L8QcZiTipHBWL8AOUSYxNsPlh20zZ
         za3g==
X-Forwarded-Encrypted: i=1; AL+hErH23KvqgVoXAGalvsZq7CQTsLBjTo2VQn/kX0AxGf4tn5HDXFBMlDLCdFBuj32kt4aI/w0qvajukCf+UKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TLVXtMzJWO91nM+J5uMSg68uP7+rxaBLSNpP/ezfZoimW+f0C
	BIxNtUa6zd1xM3hmxa5q7dX4TnqvN9ePIpyux0A/kIuM1JzVv4Zua6oj
X-Gm-Gg: AYBFou1GQr4JR95YCsWxG/PvXmClDMMBPKO6MYHiUmqzlkwizFTzYJUw3F1HJceZc4c
	91gByz4AjuwMeZsnz+7Y/2BujajC5o6zmfaIPl17poYVO5EIVns7cy1cqS1O0pOkikzAEzgiJPu
	VR+FVq5OxK++RQiN/1QSg5wyfAbNfOLY7/9am2Nxm+PtUTM80xP3Upqy3FTqHbn2d+DZuKtvHIT
	RONkBn00cMaHFwPjF1kNXfIbDIYC273woJcWz28STLrI8CQtc/6G6vQb+aRVCFyPMNVALVFNXQi
	VwaH/8+eyIQnK3T0VWb17mLTDR6JMsP/IgvJn1i7lse7Rwbgnvx7kqjB8f2+NuG5tahTxM1Gk8v
	yvgK2c2YWK/wEJTvnIX10mpLbEjz2aqzon/ILVGn81qrhZ2sWljsUdp+INvGQY6r8piQBbdzEz/
	XFP5ZPpSM32ScLBsQfIITneUjAcAkyCiJZrDLuIemnchX4esIHFZdmmrjtAy7DRT1AkOM1y2bRU
	bDqO3tInIf/h6rGZxGhmu7LiZfXL4JM1s8mqfvbncJKpa3WCS5n3XxPJ+m3US8Qh91l0in+5s7H
	JdN3MzFgLYKEaxbxV9I/eZEOGFklxsLdxf1NwQ7Yf59aNDcpW7EukIDw0DWcqQsxiA==
X-Received: by 2002:a05:600c:3ca0:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ba0936c9f5mr7377235e9.8.1794350107347;
        Tue, 10 Nov 2026 14:35:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm7443602f8f.7.2026.11.10.14.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:35:07 -0800 (PST)
Date: Tue, 10 Nov 2026 22:35:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Usama Arif <usama.arif@linux.dev>,
 bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261110223505.160ad6a3@pumpkin>
In-Reply-To: <CAHk-=wjXc16n7ppqhuCDXj3WZMiACupW63+BQh0x0OQFTBpf-A@mail.gmail.com>
References: <20261104222806.1826508-1-usama.arif@linux.dev>
	<CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
	<719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com>
	<CAHk-=wjXc16n7ppqhuCDXj3WZMiACupW63+BQh0x0OQFTBpf-A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 12:59:02 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 10 Nov 2026 at 12:18, H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-foundation.org> wrote:  
> > >Let's not do that.
> > >
> > >Putting magic things like RET in alternatives is just a bad bad idea.
> > >
> > >               Linus  
> >
> > Why is that, *given that it is in assembly*?  
> 
> It's assembly, but it's assembly that potentially gets rewritten.
> objtool already knows about __x86_return_thunk being special (although
> I think it's the _target_, not the call site, it cares about).
> 
> I would like to not have magic in stuff that is in the alternatives
> section. We've had issues with relocations etc before.
> 
> That said, grepping a bit for this, it turns out we already seem to be
> doing that in memmove_64.S, although it was hidden from my first grep:
> 
>   #define CHECK_LEN     cmp $0x20, %rdx; jb 1f
>   #define MEMMOVE_BYTES movq %rdx, %rcx; rep movsb; RET
>   .Lmemmove_begin_forward:
>         ALTERNATIVE_2 __stringify(CHECK_LEN), \
>                       __stringify(CHECK_LEN; MEMMOVE_BYTES), X86_FEATURE_ERMS, \
>                       __stringify(MEMMOVE_BYTES), X86_FEATURE_FSRM
> 
> which is pretty disgusting. But I guess that train has passed..

Or no one has realised it ran straight through the buffers :-)
RET is likely to be a 5 byte jmp instruction.
One of the checks for letting it be replaced by 0xc3,(0xcc)*4 is (addr & 0x20).
That will be wrong for the alternatives (half the time) so a quarter
of the time the train will go straight through the buffers.

David

> 
>            Linus

