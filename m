Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCD3769EC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338039; cv=none; b=tt37uy02fXrOTQUjDtCD3QrI7wx94EtsrJeis/Lkfs9FDxwCacwhsxKR+WELdA/tN2g0BDUCf6B4mXXh0keR8tXGpr0QIxbMQMR+LVtyIldrM86+Z9IzRxAQLJtnOJdFTzuC6n0S8jXJ2OYlecyiejuihdcK22sDGMNI3xIBwHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338039; c=relaxed/simple;
	bh=N0rE1FZgzINX9VvnYmG8iB7MdF0qZuYvJayMj5ZMZTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q14F4H1S1/ny2TGCvz3N6NRNehvXOA0Q5WEu5ZbSYeT1bJxDlLNYezbyMOuBJrRGm42CGt/wYTANUjFWRgpwuRmf9ZJCMpI6ZvTkHXN+V4jW8EsIRm3mJzhS7MLVQ3TjoGUwUyj92+oX6ko7vyxTDGTtkc7j39yf0uv1BR+mUWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceEv4Axu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceEv4Axu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49557167508so7437255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338036; x=1788942836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCy9uizeEUcLaZCIpHKeiBs6su7LhtDrq+7wAuCLOHA=;
        b=ceEv4AxuOyoDwqTVYzy6lWb2xWdMGx1xX2sTWr3k7Sa0fShUcEGCioWgXDu2oVRi+Y
         2+yNj+0uUXOg/8kN8A7oDexhc/rZnFjV9wPykYKN2QIqg0oFAl1jDe0oEcKt3CnG5AEb
         tV0EsJ4vukAKKgBo6kzUXcxjykpHb8sNFgStf8FBIdYSlUusyALfh32ks1tuU6vCkQw0
         yIs7HAMJFpLN+JzKNMhH8QsfpPJSP2oCefks1co054xDaErJTWYMOyoX/A3UNgodkgij
         gnGjPaIo1XaIeCjQRMw4FScXmwqtqJrt5wF2Hx2jPDHSpTNeri3ZR2VjE4NGLq2sNtTc
         gUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338036; x=1788942836;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCy9uizeEUcLaZCIpHKeiBs6su7LhtDrq+7wAuCLOHA=;
        b=g5P9vRcMTSkWugGt6Z+l2p8XA9oBzt7ZoL9HNfExbS6TPCccxYG9kXIuI9x1B/Y01X
         ih6oX2uvVgOR1N5+theeIFcAroFXQ8WOUTgnR0ec3G+++Tf/6z1RxXc9GZlEzoAMp7Uo
         NZniij5s3R8OxHGTQU4EamqocJEjyFO7m45ejm+7H/fWWcF+Qj4ABZgaPcqarfuJlk8o
         hPnW0IQ71sp4W9MG+wNKmAheJcNIMC/7wmRcWvwyRY6x5KnltwNR8mYQsQgIr9tHPujA
         33HxSFyBGlAGeUHrwsV9gYtWlGMy0zpzNksITIFFvzteKwwFthVrZRWoct16zoLQ/dpt
         ccNw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5+QtgDTEwl1zJJaYV+PGVFjQlwJQsQVpt/nau+YXBJBC0ma1YKv79qgzjkYJFPJt3vSQIH2WQG9Ivq3E=@vger.kernel.org
X-Gm-Message-State: AFuF++keH8gya1pMCss3i2yWdbRGQEmGWRnHnzVwUGEajG3D8lTm6dEh
	bcEKK6Hx1IsN/M5ok41/EJBKBAFk1Q3i8YdnSWuZOzdJsc68r2o5u4m0
X-Gm-Gg: AR+sD12N7CVtgr4n3kqIzVI8KkcD2PI6IP/3ORPuMdZNGSUNBA4mwmg1BBspncFIC7p
	mJQ5Jbifd83i0r+hPPr2xcJ2YvmaslHmfZwrOJocUOdaGz08JBDQr1F9I6+MBx8pQLcWRFD0D3D
	IExJ+9sZd0RiYpXwM0Fon3rfyge2YAq3BCjPBqI3RLKThcld20jR2BBkes2CJbdvbZ+HdDrWkCh
	yQIoSDu0clT+1lNlAo7M95bxleJsIQwnpp7p1RZOLlFuMyO8g9g1JjpWmM8k6jfegDuIKpaMisN
	b9kMyiO+zpNJpNUi3UhpFLU5ajAoUuFx7Hl/njxTACo/lH2p2K8JgKqWwNe7FBKZtQDqiWrw/O4
	MRgpnJcDOFp37LTRJTD1kjKIYT3w2ZSllw4v5mp3qm+CWhWqe4tPpbExhBkiTTr5gBpaachg5Nw
	rrKVNG7/k8DMeTDnN5Es0ZMghRwvTaGIm7Gncwqsq/EI1pUnKnTKHgg95IFBc073fQ/0Hkchs/8
	y4yf8p89xcWmuIDXX8sNwmL2Q==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr44652095e9.10.1788338035485;
        Wed, 02 Sep 2026 01:33:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4642382sm54766395e9.3.2026.09.02.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:33:55 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:33:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260902093354.582c2f07@pumpkin>
In-Reply-To: <16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
	<16110ecc-fc0d-4b9d-a958-2a75ca60b69f@suse.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 15:16:58 +0200
Jan Beulich <jbeulich@suse.com> wrote:

> On 22.08.2026 20:33, Mauricio Faria de Oliveira wrote:
> > According to the GCC documentation, conditions in the flags register
> > (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
> > 
> > Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
> > 
> > Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
> > "=@ccnz" output operand.
> > 
> >     """
> >     6.11.2.4 Flag Output Operands
> > 
> >         On some targets, a special form of output operand exists by which
> >         conditions in the flags register may be outputs of the asm. [...]
> > 
> >     6.11.2.6 Clobbers and Scratch Registers
> > 
> >         While the compiler is aware of changes to entries listed in the
> >         output operands, [...]
> > 
> >         Clobber descriptions may not in any way overlap with an input or
> >         output operand. [...]
> >     """
> > 
> > Reported-by: "H. Peter Anvin" <hpa@zytor.com>
> > Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com/
> > Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test in memcmp()")
> > Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Flag-Output-Operands [1]
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Clobbers-and-Scratch-Registers-1 [2]  
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/arch/x86/boot/string.c
> > +++ b/arch/x86/boot/string.c
> > @@ -40,7 +40,7 @@ int memcmp(const void *s1, const void *s2, size_t len)
> >  	asm volatile("test %3, %3\n\t"
> >  		     "repe cmpsb"
> >  		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
> > -		     : : "cc", "memory");
> > +		     : : "memory");  
> 
> In fact I'm using a modified gcc which properly rejects such conflicting
> uses of output and clobber. ("cc" clobbers are redundant on x86 anyway.)

And, if "cc" clobber wasn't redundant, you'd need clobbers for the cc flags
that weren't being used as output values.

David

> 
> Jan
> 

