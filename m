Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76F13A4267
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461825; cv=none; b=p31/2zExaFQLqg8HrWH7i0ZBEFzUPxbgiwCBSa+NtPJdtBd9/k5+VtwCzKonTjKDSyjDpJYnH/Dc6r5QLveZ3NiRZ0C9gqmXHFsfrPi02JpDwvn5lI5axNeHLvX1qs+SikTlfTKpDtOa8T/rxHEQYj8Pjqz92/H5ZrMVs/JkKkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461825; c=relaxed/simple;
	bh=uOHdaAAAdef5xA1yWLHev+qocyt5vFuJFROQZrUtmiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EeZ0hKMF1vMbhGl2NMhq7T+AGCVAxUJdILe+sndGV1ov0dZakldaHRoiPKdwkoaA/R18xEchMyPxtTF4LqBv10VkQXxPRsp1wvBjF1HpXSmiDrFDStlAQG/+4zTlbUuDxxlXusGYp7L/fGt8Mn4yCcVJ0Rv5s0Ii9YH/w3Gjzws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skxKAqM6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skxKAqM6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so13527135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461822; x=1790066622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wn/lyeTbbPBDsoxu3rQlBRh1hn3vc28DqPKEKt99NCc=;
        b=skxKAqM6/FSn5aZ7nFpF2kTWs9SK9r6EveNb7mZ7dT1Lw4aP1+9N8z0zKSkfPw5W0H
         kIERoE6UXET6R8srRJJ5XX10hE8o83nBWA8CicdJ3tDck8RWqrlVX0/rLfUvrLtm0UlO
         A8Ofr+nM/2U8nJozYzktEqOU1FlO4N2k9wOsOE2U26PPFT+9SiaBEemeInm00cAs1y3I
         fA3oEdMIbZiaY1c5ljJZ19cN7qsOjL3kdYK5AsH6IEsCy0P1zcRlmUm3oRRRNJ37BekZ
         hg+lZ4j3EfYEaDIMuI1OP0Y2BIHXZG5L7RJRTvLNMH6MAt9t7H5Z1RH0HGd9HeTIc7j6
         yljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461822; x=1790066622;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wn/lyeTbbPBDsoxu3rQlBRh1hn3vc28DqPKEKt99NCc=;
        b=RLDkJ58nQzyvIeq31R1/nIyZkB9RCbRJipOadZlIxSVEBnCZGhiqf88Sud8L/xMjQT
         qdHnWXIIFQK3NGndVPvj8dlXxmRgKHunl9awKEucmzbZjB15QlFyp7rSJZDo6kKG8UCY
         h0hxgSdh3++YTk4IHLt8oizl11tOyUY9tKM59JbSHBYsLitm1NxKFYjkdzf+IiUaN6Ie
         u98VF6Jn6QYaVnJ7TVkOLnSI/eWsAukoQyYPyd9u11S9CumNoI09bJ8jiCCrmkEtK8ho
         f7VQ3I7Hhf8BhXJS14QG8lq/GWsQs1RgvxnTg15o4UnSXYAgeTn1Zu0V8CaLRc2kbB13
         uzLw==
X-Forwarded-Encrypted: i=1; AKwUvByZamLmg94AOMKZLLo///3vw2lMq9pv+OqCooPoON9b+76z/5k/eUb+i6h8jF1Sti059mjZjs7wT0k482o=@vger.kernel.org
X-Gm-Message-State: AFuF++k+3qEx1jVXe6BJmBT5VgnJGGxleW8a4NAczqxa61x3jcRnOutL
	VbWpy0DFm5JtRYWDc/pE2tz6Epm31goJ50s0ETGGSILrctRYWb6zh/1R
X-Gm-Gg: AYBFou2/HDAo0Yvo2kYWof+XZxsEmG1tmrHhNVCol5+1lkYC12yWl2lIDHh6FbFDSHj
	C+lmcCKrLNMd5z/Q3uyReKqDgrn8SUt7xXJruIBNmswuZmO5zyiQ3ksdjkb0G+L4sEUfJZgnztF
	fuepO7ounK8E7PdjvQtmPiVAGYhHjrdj9IrmYrWv4zO7TS4si0kOeH/f7rmqEgU9PGQFN05tFeC
	WpAqNSJG1Wsz6PrC7NWI6VNJW3Tt6ex9V69JX1c1tMdz+wYN1+nG33yToHOhjEmm+pDi2CLoTVX
	pcMBOdrXWZib5csOpqiGIawBk1ny67DYdTKQJ/Du+5w9Sh9WmjpFFU6ED8ojxM0RfClx5QBFgqC
	lyrUxpz/5DEKchQ2FOKy8yNgRxejW2LWUubPvJndGT6ZILwXm8gtliiBQo6ZZpGKkGdWo0SZl4P
	1aEfPAeT35IQDTzIShQp30xmqargKrbCGUdEBVRQuY+mHh3gQFrUbMs4szVSISVKN9rQ1ru36Sf
	k41Paxw15BeDQx4f3VuXxesiyyryM91aJrH
X-Received: by 2002:a05:600c:3593:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49e7a5edc17mr72558105e9.0.1789461821804;
        Tue, 15 Sep 2026 01:43:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef24be2sm30342585e9.0.2026.09.15.01.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:43:41 -0700 (PDT)
Date: Tue, 15 Sep 2026 09:43:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260915094339.39a83b54@pumpkin>
In-Reply-To: <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
	<20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
	<6113f06c790cfe1141d2dc09b68937b6@igalia.com>
	<20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 22:11:55 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Sep 14, 2026 at 08:22:08AM -0300, Mauricio Faria de Oliveira wrote:
> > In the review of the original patchset (fixed by this series) it is
> > mentioned that a compiler might turn it into a memcmp() [1] -- and thus
> > revert back to the same issue.
> > 
> > [1] https://lore.kernel.org/all/877ccz12ab.ffs@tglx/  
> 
> Hmm, never heard that before but that doesn't mean anything. Probably should
> mention it in one of the commit messages so that we know for the future...
> 

It definitely has a habit of converting copy loops to memcpy().
Annoying when they are short.

But usually easily avoidable by sprinkling 'volatile' or barrier() in the
right places.

David
