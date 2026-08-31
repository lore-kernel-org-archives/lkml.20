Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE6B3E16AE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218395; cv=pass; b=qbk/82I+zhr6F9MUTbsQ1pEZuYy5xi8/9IsI6nNrPGYhBgNngfRYUePFA64+GB75L7KsKPhVFj54A/I+LTqf3HqKODu6L27HYm5Sl3EB2H2PVmVH99iGdUAKspVjTIDuP/f2JAipGT1rmSUZuzluX98H1aPar9bbcrOeAGIVJyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218395; c=relaxed/simple;
	bh=FFESqevb09AMNF3WZSLfXKBb/pgBxiHfa4nhv+G8hgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXOiVZ4AHYF2Kwo+ldUUlA4VcL0LOojcOfilnqESt0PXXDRDRCDATw6qvykh5qS76n67EX7Vrmm14NDwFRx66hi27dBiekDosEAiGWpsrN5bb5Ot1zoDh/mPCD7bdBIWizhnqizY+ktePH9Qs/okiV0ahQx97e+iKWPwKLbwrkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VDz0mQ3W; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VDz0mQ3W"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52fac937235so40031cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788218393; cv=none;
        d=google.com; s=arc-20260327;
        b=OPiS4HrwnypukXpKshGerOI8vDhv8Q9ZxU0djKKUowIkYz9lwfaFs5AKAJKLFTjOQt
         qiaR/wMddMDM2MEo4Oj0qdfsy5AZtSdEj48xA/EisQvMLzNiF6lxn5wrxxGX+5Qgu8Xj
         O/nVUZnHEzv+N3cjZanh3f6UVii/gtK0Apf4gfqavGGBbE4rz1WSabNAXliwnJdSfATW
         ac0j4Fomi9DRpkhjTL/u0oalD6E5ne9o1BVw5YXRdtBcjusYgaQiggD0vZDkqAYoy8Qv
         g0Xrv/l1oTOF9a/2fGNMOMnwiWrl62p1pGv3QWu0azUHA5BslMNhKQ5fyYYNCWTEGQJ0
         odkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zpVrf/9Ez6YwuJe0EFUGtSCTl6wqdMBrnuTW7EDRsDI=;
        fh=UNMjof/jUIs0dfuY+gNKc7LoHfCouCABK9QUdMz22j0=;
        b=BIitZ0J4d8VXRsgVVkArGR9Bap4hg/e8HLK2dqCfD6mkGC+pM9iWhtNfydhALW3UjK
         gHFlR6+Ki0NavcPk++2tcLosTFeI+BK1j8gmBCb6cPmi1YBjOzBhDb3hPS0Yln3MDoiK
         00ymJE3ZgmND591tnwSnY/oAlVJtzNrtdFLuFXKrkKF+wMLCwSAQiqVHBWzbs6UuHmw9
         Y33GBhzOPPntVxJ4vh8H2hVtL3qcGHLc6qzTLnSZcsPztAbtJkcGxjtI19SuZHkKDwLX
         EcVOi12m2CbJcFucTpEC2R99EPsT/3n865TMcKlawjR+6QKU6DynOLOfhx1Nm2ObeKoA
         6RBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788218393; x=1788823193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zpVrf/9Ez6YwuJe0EFUGtSCTl6wqdMBrnuTW7EDRsDI=;
        b=VDz0mQ3W0gvloVyuHm5azLvkYyvem6k/L774iVk3sOe990pfPfsUgPPu/UuwbbktaN
         4STJw/fCxguRSQCC5OD1y5HIHpKhHdqhvNIbA0+OEjYDDBadiuD3SNfCgC7S9CB4MqSr
         Rx8UrMnJwsR7topD4WsmAXMUf6b3D0PefsTwgw0/tpPRweJyNBU6w2KY0DwAJUWgsfRs
         AW1KuUOZvIpxPNMvD1H1rRLPJiopuci4HnR1iwTmOYUvx8pYTHiYRRRrXQp3infyJtfd
         BE8OcwMHyr/iGN2Yo1JQTBGY6y65ghhEptZSA7Hm2YP/9QpLCuOT5bfi/o9emfUam7JI
         B33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218393; x=1788823193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpVrf/9Ez6YwuJe0EFUGtSCTl6wqdMBrnuTW7EDRsDI=;
        b=qRUc2ex84USR+4hgr3aQes3iBKTPoTNd8JlgUKs4MQjbthfcRhe6ycOf0WZzGADkmV
         JZatYxCj478YzS9wau4OKppeHiVibMUB/BksMP3KL2Dq+SYwM3G5ikbMPYdvv05bg5H2
         s43xzax1+3X5lSqp4QcRD4zXaqmd5Qtfe9Ym48U/nJQh68R8dgFYRQD4phEMpTOZXfFd
         blqSLHqromZuh3Wh3/3g/u9UbfzYv09aahaGJ9luMAzwPw9xTE0LaGS5zR9TyLAzUplp
         mX9FCdBL/DNuyYl6rxguOzlvIbKJFwqO+9gSjKEsp0O4RMgxgqWB5mQvqtX6IYVM4oNY
         4w+w==
X-Forwarded-Encrypted: i=1; AHgh+RqWi763GQgokkhuf2aPlysnw9Q/ofNZBohiHWqzMe0J/N2QD1p5FCNnXuGA3r5CZmQIvAXvIvX612xXHa8=@vger.kernel.org
X-Gm-Message-State: AFuF++meFUaRaa6jZSHm79X6lmeopiMNEH/j93m+2uGyXvf2InSE7ntR
	oVWYFqLmMM3enUylnm11JNiG/70zf+y1UNw0JDM0QfUzoQvZdLBCC6DfFujf75LF2AvY1udkitD
	eXcYPh3O5R1Bqjfbongdx39YQPyvo0TonAIPDPj6o
X-Gm-Gg: AR+sD11fxy+2lpVzjU5vZlS22x086yEdbCsHfqW3Olq/qKczUWZpRiAMl9+Aw0jUUjb
	N4tqpdT9+Q9Z6lI2k+zeFCutzJqQ4Rcoc5OBx3w4/4lWcirUOQgcrQLUQCPPbIArglzMXHuhDf1
	RHRR44adNFbA/uy1zgKyqv5kCCziWqSgu/BH7cCkVdRdV9/1lkXAkJboyJJq49I0f5ShWP5iYyQ
	WxJDPzNyZCoIqemO3O2k6XUtodrUilHFsoM94S+9WwJZYrF9KdEBKivdZmQ/DN4ZgVXUHa6P9Ki
	wLqf98i/mdCVXp58mV8nLiWFn5FTfO0MwCL2TVzb0RA=
X-Received: by 2002:a05:622a:1a8f:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-53024b7b7d5mr6356891cf.0.1788218391797; Mon, 31 Aug 2026
 16:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813193433.3318288-1-surenb@google.com> <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
 <apVhzM2501wSiGGg@google.com> <apX_r59k4e-XiI-C@google.com>
In-Reply-To: <apX_r59k4e-XiI-C@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 31 Aug 2026 16:19:39 -0700
X-Gm-Features: AcwNN1WbsxWd5RxMUU7qZ6W1DDnViTQR6rdiBhuB5saanYC5DOsOmY_bHcB3Ii0
Message-ID: <CAJuCfpEDgdC=N8__Ye1xP8rZtUwWrGhKhJ9Qnn0hdV+u5r+hJA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] mm: Unconditional per-VMA locks and cleanups
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	dave.hansen@linux.intel.com, Liam.Howlett@oracle.com, ljs@kernel.org, 
	david@redhat.com, willy@infradead.org, shakeel.butt@linux.dev, 
	vbabka@kernel.org, jannh@google.com, arve@android.com, christian@brauner.io, 
	tkjos@android.com, dsahern@kernel.org, davem@davemloft.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:27=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Mon, Aug 31, 2026 at 11:13:16AM +0000, Alice Ryhl wrote:
> > On Sat, Aug 29, 2026 at 06:56:25PM -0700, Andrew Morton wrote:
> > > On Thu, 13 Aug 2026 12:34:28 -0700 Suren Baghdasaryan <surenb@google.=
com> wrote:
> > >
> > > > v2 version of this patchset [1] was written by Dave Hansen and per =
his
> > > > request, I'm taking over this series.
> > > >
> > > > tl;dr: Make per-VMA locks available in all configs. Simplify some
> > > > of the per-VMA lock users now that they can rely on them being
> > > > always available.
> > >
> > > It's been 2+ weeks so perhaps a refresh-and-remind would be helpful.
> > >
> > > But it applies well enough and is adequately reviewed so I put it in
> > > there for testing, thanks.
> > >
> > > AI review might have found a couple of pre-existing binder bugs:
> > >
> > >     https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@go=
ogle.com
> > >
> > > and a small rusty thing which you might wish to attend to.
> >
> > The binder bug is not actually a bug. When using VM_MIXEDMAP and
> > vm_insert_page(), the vma takes a refcount on the page, so there is no
> > use-after-free even if free_page() is invoked without removing it from
> > the vma.
>
> Exactly! I agree the refcount on the page would prevent the UAF.
>
> However, we should still reject mremap() because this leaves the page in
> limbo since it is not given back to the shrinker and also binder can't
> make use of it anymore. I'll send out a patch to fix this.

Ok. Should that block this series or it will apply over it?

>
> Thanks,
> --
> Carlos Llamas
