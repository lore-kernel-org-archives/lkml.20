Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377726;
	b=zkcVebnE2ok3ii8VJIPc5n+9d54QpT+caFxaKnpuFLZgy+IfN5BV4WH8u2+vCi2k2VaU
	 HJRvJLbs3dcR7aoGV38oIa3sV43mNoxTq4GJb7xCS6qs6p1Wza1eM0Ug+JGga3zyJmgms
	 fDrEFzjXJ3l8uW5QoHcSe5cNoMq5W1pgcnZTI8fNKJJSps60o5uEGejaddpSL9bC/MqPB
	 bJoUcNAXclLorBY1tVmVd+83qT8bNkPC5pMl1ncschOmRGx7vB6QguS+pLjOZynbG2Mfi
	 tQ86HhHuB2+t0wwznuBC4FvwksmUYkAKkLb/OuEl8XK1A0yPnUqDt2TDDM1c/5h0/PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DLx+e5jiB+XlRFntipKWj+k2m8RPFd/H+aBKjyl86WY=;
	b=zxQVPm2b7ul3k4ERhk8YPNWnPODzLaM3InMm7kTF/X2W9NbRlaPJkTPP8tBah7qSfsA9
	 cZttxH9aX6v4YyFFB+o0OC8QnMMPyqa+XTIfFChD3QK4jGNIq8LZiCmiROoZKkFuHniJk
	 CxBJdjn0fHIT6/e+NgxjdXI8CysyYIgXGmxRHzJ7xvDYG4HBa315n9qFmQajMyJjH4RIO
	 mbiC0Zt5CBelZsEAInixHE25q/3LJyoGG0JDeO95W/wnZ4aEEq/+PK88pvca6P0AgsFkN
	 4bZIWS03ZmMJqKoJ3t+sF1JW4/H+p2DXbp7cNJvzeFdGueP5GJu14csjp1fLTfYhgWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gY5UMDit;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2872E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gY5UMDit
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7632975e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377724; x=1793982524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DLx+e5jiB+XlRFntipKWj+k2m8RPFd/H+aBKjyl86WY=;
        b=gY5UMDit0YTOHZiymvn4A6DXJSkWyqD6hyHFgjCdutX+IcixbKUeoP2VHg+5ZU+I+J
         rtETPqhBfKzqz0dMatdBl1P7ssJY5rBQMSeaRCzslPu+NihwNm69+AyAO/pj0YPyG0D3
         14ToGN8j7Oq5WXz3IxKNjCbeeiyon606SYWzUD2eqqkoeh5XDMwRoqm8fIRmDculpHnQ
         Sk/ucQWuR62F59Jtu80A/pLQVanSshtkkbYzja3FLfLyTWpGFHfsavBBiIyA3mNjxWuo
         lxqgylXIKy3PwMgNjN/ZL0DFIFG4K65wMTfofusMSVU6fo7eF9XW2yaM08E0ueIB8yBN
         fgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377724; x=1793982524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLx+e5jiB+XlRFntipKWj+k2m8RPFd/H+aBKjyl86WY=;
        b=Rkwby7PwdXpg0lcTlevSasossNM5GuV9oDEMzT7OsLEXaC9+FYCzdI8SBcRgSpL46k
         x/AJqknqaREJQoxWztG+tvCIeGCGJrooG+4EoPYibY0ehM2/MCLGwSYLFpWEuxTWwVd4
         QZdYfWifs/T4WGpqeSFA7Ew+qt+GpklnMuOxJCduHNfKeGNYjKd2hOcSfcU8RK67h5d7
         JY7muTvBDFrJ22V9FkBj22diuHKTc+Hyp485dg3D5i6qGp8Bq/KjF9w9W7AX2xJiySZm
         1RTdN2g3SAoxZ0AgUxEBqNslI6oY2CXZhc9TPfc45xNblWXOM9vSxokYHaEFfuSbVcDA
         d0PA==
X-Forwarded-Encrypted: i=1; AKwUvBxFUuWuDg5LDD5mRBh6Rh39DXbqlqRT2umzNzcKYHYP7MXPO7Cylwqjte3E4v8gdIaMO2L9/rJJEevBSX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqwTVMk5Ez6ZxdSUpy5/NEo6zYZJ2JVlQiiDhysWRTrOxQoCGK
	YCph3sl2+HXX+2gKpixQoUVuUQZGzVEfz/2fGxtubPFrQBBwhRdhuRvYi0B9flMp
X-Gm-Gg: AYBFou3WGWhqbC7qUv/UL9eou3Zat/Rn0m6POg2Zn8omvQGbF677G2Frtt688EYfEmD
	7CUluxFMwx9foyizvk7f7k9e+ZbDrbeZI2xG13G333ag3OGkpSSmPm64F9fVpxoiAHYbNPUCJeb
	kRdcPtOMwNwHNNQ4wpp2Y/gpQqtzv5lZTcqmPDs0vTruDgXxkKea0yd7Fa27A+TUUIX2s7OkD5k
	QWu3jZibF2XeFxsw/UiYU6tjnk6lmgiwnZ0ksqfar8Xjxs7aFtdplC0pRF/ITW4HvGnzjFf3d3L
	hx3Tk6QWvXbNZfxhc00VVlSyQqZyKW6yB9EtkFhZX1t+NiqIg0uRFwGgK3urp9pMoKkiVCxZzgN
	lm6jiWGNK6wg+SvhToqZREkkXaY3agV8E0lChwbsea23VWTje27dxPPHsnftr+mcUXINAKPXr8s
	yo4R965ZxkY3TU++meDVOIpvflVT9UDSweDtw+azp03fQBH216hrysbDDE5SrqvRPYSC9BIHTD9
	M+1BpsPU3Pvc1CkMG2uwaR6jQE+TjlBYks3hJRgXIgLa3AWRKf2JMfvgyO+8N9Q/8S9HgfAn1Mr
	6J9bR0KwCh8F7pVm1dZURdICFdKsYJneSTFhUCBD97+iAaIxgTYC6D4vlB7ZPbS2Hg==
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr57557715e9.26.1793377724471;
        Fri, 30 Oct 2026 09:28:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm145233925e9.8.2026.10.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:28:43 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:28:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen
 <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, justin.ernst@hpe.com, kyle.meyer@hpe.com,
 dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, Matt Mullins
 <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261030162841.23ffeb6b@pumpkin>
In-Reply-To: <auNnKmfx_2Dp0IxH@swahl-home.5wahls.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
	<28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
	<20261028142625.GU2668564@noisy.programming.kicks-ass.net>
	<27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
	<auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
	<20261029105121.39a4c74f@pumpkin>
	<auNnKmfx_2Dp0IxH@swahl-home.5wahls.com>
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

On Thu, 29 Oct 2026 10:32:58 -0500
Steve Wahl <steve.wahl@hpe.com> wrote:

> On Thu, Oct 29, 2026 at 10:51:21AM +0000, David Laight wrote:
> > On Wed, 28 Oct 2026 14:58:12 -0500
> > Steve Wahl <steve.wahl@hpe.com> wrote:
> >   
> > > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:  
> > ...  
> > > 
> > > For an example, I recently used this method to discover that at
> > > least one version of Intel's MPI library likes to read up
> > > /proc/kallsyms from each of the processes it starts, and somewhere
> > > north of 1000's of processors the atomic increment on opening
> > > kallsyms, implemented with a compare-exchange, becomes a hot lock
> > > and initialization that takes little time on a smaller number of
> > > processors, suddenly balloons to half an hour.  
> > 
> > I'm guessing that was pre-ARMv8.1 ??  
> 
> x86, not arm.  And it was on a distro kernel, I didn't check the
> current community kernel because it was a situation where it was
> enough to understand what's going on in the distro kernel, and avoid
> the behavior in the application. 

x86 shouldn't have an exponential issue with cas.
Something else must have been going on.

David

> 
> > The LL/SC retry loops for atomics are completely broken for contended
> > operations.
> > The kernel needs to patch them to use the LSE (single instruction
> > atomics) for ARMv8.1 which guarantee that some progress is made.
> > A CAS loop can still get starved on a single CPU, but some CPU
> > do proceed.
> > You really don't want to use LL/LC on a system with hraair CPU.
> > 
> > One CPU (not arm) that implements LL/SC locks the cache line for a
> > few clocks after LL to give a reasonable chance of the associated SC
> > actually succeeding before the cache line is 'stolen' by another CPU
> > doing an LL.  
> 
> Thanks,
> 
> --> Steve  
> 

