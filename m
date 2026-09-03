Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718626B0A9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422271; cv=none; b=eeskfdlRzO1RD4ADHsy5Fhdy4Cv2VEEIQK5KIM6zYdID8GJS186LSnXZePUF87nL6LIDVW3NfRUpRt/BEejRr4gfuhB7TkHlbd+I8W+9hySVe12bEcBydrzt061IuTWUmp/g16AuDGlzk9G3Ds0LIH/6ZJCDSbXzAYZxG5M3VrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422271; c=relaxed/simple;
	bh=L/r7m7kDv0omebnD1y3qb2AQBcATiYqlgqTB+1Do+6A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jDZ+wRAugoT8TkrqGmmm0q4Qf9xJmEENNpxNfSWL0LiDgN5NZJsOUuK0F8J9J70iHmVmb9ohHQCGaxa605dEDx3vyPsGo5xqy5c34jKHjt/LJVARH69NRrJ/iYtxF339iP5EUFEqqtlnTJIXsj+/a3vKUZA3Qd75vwRZwo0qFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3SQ4yOk; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3SQ4yOk"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ccf17d3b0so12672145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788422268; x=1789027068; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vR1Q5C1h3ZhnEFmXm0MTEkgQW02wtj80tGssKs7CjOM=;
        b=Z3SQ4yOkkmXjtWozFUVfzGIYasJxwYZvD5s2E7jaJaJuxGMCZ6GyyyChyz8PKJ9oCJ
         rWRYPCJdnVitIyT4MuBFZCw5hwI36LBthrxrs27ateKZLinSQQ4RN467ZWT6QJw0RAYT
         Je1y015IlExYTJC7v2KK6xPt0SS6gj7KKpTfQ8mx8CWZ9PtQ3pxqdjF/rNU0fHxxVDIx
         wpuk+PusRDJGLBzdPo2TvWiwkdlpBx+PkNN0RqaFpdqz0Ayraen1VYCqBBBBP0lBWk8x
         6lJjoXiJzrqtMi6AkeVIfabPgAVicmLXi1vDcGcVMNPSSyehcwv89L+HsjZf/PVC3ADZ
         LfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422268; x=1789027068;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vR1Q5C1h3ZhnEFmXm0MTEkgQW02wtj80tGssKs7CjOM=;
        b=ev94lis6QR/hpSaihHnPyEjSyFgJh1irLWOHLYidMUJjuWWDJs6Iczx9hQ6wzLIJCz
         GFgk7pNg61VRYCtGdZ0bj28QDsKPJDM/H79hQZT7sicLxPIwjb1q3fxVdqlKP8BIAGM6
         gPD5lZBoSRAwQQcqdRPmLzwrCPS17nQfuGVMGZ5y7Pg1p1r8z9ml+aadUIeglEyhjkeo
         O1KSvxiX068QRl6RqWEsNQiuxp+ZeIRie8CmzsJj64XSYT6QjHdJd4M2FxsJhDjGohez
         0q5xBaVWCcBA1njAX8JsLyo537YdYwd4ddDqov2gO99l2BcSBO2emThWMGrwgSdv6uny
         uGpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCyYC5MB8ESVpADQwsUAXQ8artv2GdvvVPB2zxSAP1CkUorRI0wnX1Hh+FU8c1VtqnUhP7j3nZYKtinNc=@vger.kernel.org
X-Gm-Message-State: AFuF++n3Z45oVHBRvmZtzeGskfMpV4FaFd/UoOqM15coxghim9dEgSXC
	2ZrzAO5B0f/0xVEbGO9olTEscMTmWbn33p48N2PBuiS/XnMBKHRm0cdQ20H2TKZ+lfLsocIh8o5
	edQhHzwH8W9KMbUTxTA==
X-Received: from wmnl19.prod.google.com ([2002:a05:600c:16d3:b0:49c:d53d:56b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6209:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49ce582039fmr193039575e9.7.1788422268362;
 Thu, 03 Sep 2026 00:57:48 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:57:47 +0000
In-Reply-To: <aphOAx2CINlw3m6Y@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com> <20260901205250.1638304-6-cmllamas@google.com>
 <apgbjOsfn4oFMmAC@google.com> <aphOAx2CINlw3m6Y@google.com>
Message-ID: <apkoe-g5Cj9U8Kqt@google.com>
Subject: Re: [PATCH v4 5/7] binder: check vma->vm_start in binder_vma_close()
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 02, 2026 at 04:25:39PM +0000, Carlos Llamas wrote:
> On Wed, Sep 02, 2026 at 12:50:20PM +0000, Alice Ryhl wrote:
> > On Tue, Sep 01, 2026 at 08:52:45PM +0000, Carlos Llamas wrote:
> > > Certain operations like a failed mremap() might trigger vm_ops->close()
> > > on temporary mappings. To avoid tearing-down the main binder mapping on
> > > these, let's verify that the VMA matches the expected starting address.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
> > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas@google.com?part=1
> > > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> > > ---
> > >  drivers/android/binder.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > index 185128577829..3d359490436e 100644
> > > --- a/drivers/android/binder.c
> > > +++ b/drivers/android/binder.c
> > > @@ -6018,6 +6018,9 @@ static void binder_vma_close(struct vm_area_struct *vma)
> > >  {
> > >  	struct binder_proc *proc = vma->vm_private_data;
> > >  
> > > +	if (vma->vm_start != proc->alloc.vm_start)
> > > +		return;
> > 
> > So .. this does work in the case of mremap, but how about instead doing
> > this?
> > 
> > static int binder_mremap(struct vm_area_struct *vma)
> > {
> > 	vma->vm_private_data = NULL;
> > 	return -EINVAL;
> > }
> > 
> > and then check for NULL in binder_vma_close() instead? I think that
> > logic would be a bit easier to understand.
> 
> Yeah, I agree that is easier to read. However, not all exit paths that
> close a copied vma actually call op->mremap(). We would miss those and
> accidentally brick binder.

What about setting it to NULL in op->open(), then?

Alice

> Maybe I should add a comment to the check, so that is easier to read?
> 
> 	/* 
> 	 * Ignore temporary vma copies from aborted operations (e.g.
> 	 * mremap). Only tear-down the original VMA with the expected
> 	 * starting address.
> 	 */
> 	 if (vma->vm_start != proc->alloc.vm_start)
> 	 	return;
> 
> Would that work?


