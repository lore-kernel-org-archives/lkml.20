Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EF53F2116
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339311; cv=pass; b=Ob79p9vgQf4pGqyyd52MOjRRQqwt7ihBkaiNeF+WWKRpMJr9FAxq47kpFrKO0lkhvuuaO+V+Lhmy9V2yHp+JUia5OKmQOut2kGMdBcDMlUU6eXmLI4S5hfRhR1VVMtQhYxMMFnvRlPLVQa0oENtY0h90YQMIsG+PNOrU9pQDW6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339311; c=relaxed/simple;
	bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHEefHzHeUv3DyLFo4CmgLL34nFsph1gFRd42+mwysJB+Tj9sx99bzrVWuNfQI5BWGZs9waCQ7OBVnw8YOHSKF7anmRUuJZzw+bAtI26ZoPTcN309fZqI+SlTOdo+XpSgKSjvofpkPsdz9oEnSeeohUTCR5P1eJfi0e+XpFHfIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gad/6K6G; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gad/6K6G"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2a449c57so9222961cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788339308; cv=none;
        d=google.com; s=arc-20260327;
        b=UNbSq8QVXSNFxTg7X/5Uk/izLWgNrzXBDJqH0HIYidDEip/99RNPVjqA2le3GFq+5Z
         Gtrl+3n1iD394cE6G9qX6o58P1dEc+ca5mIKW8q+ST/18Nnf9QHJxv8gyiuOzL5DC2pd
         qI2Ujex8vcqi9Visk6koGoOMCNapy8sib4VHA1xV2dC88U0k4S7ln+ieHSStx2GYjakp
         gZ3Vm7XGS+HJTXj+gSr2MITXz1THzHZXt+pgSe0EXRGhB42JeV4cHi7haRTkMYsz/9G9
         5pHAZ/QRnmMI1Ognvd4xcelBU6p+UPsIlqiHBOnQyJeRdtPlwL7TOa8rYdYglx86mRJ0
         XqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
        fh=/qnPExEFToslgkXA8VCsfw7bqFX+IwywoTdl3QHSe+Q=;
        b=jShBDJuEORgfDhy+clnuIvNAKEEXFe2ymn7bdRNckZg4l2FPy+IPM7j/FqORggO3ME
         DIs8pla0YlFL44gy5ZtxybvTD47SRp8CiGUlCYbR+I5SMqYGxuDGAEXu10Rm4u5HHTHc
         rstWsZdRz+Oyh2mAHMQyckWzQgPpdkxyQVLeDHjeuA9h2p1KADQ1nbbKZwlIFzGg5mED
         jnp6wMIDYfijS4eeXsIRld73JHeF/7bqja7Xa79fQWdKTIudX05Zo76k2JWMvd+XDKFU
         ltGUqYZ6gVUEqs5z0L0+/4vOXHI6XiHZZKp5NnTry1PYuqcUai9H4zlxoA4KHTQlCfLU
         e2sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788339308; x=1788944108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
        b=Gad/6K6GNreB2Fp2WyjTEwiLUAEukBK3gK2L3zEwaHZhw5bn0hyVdJlVr2yXmXssP/
         CntegfukZCB3nsmWjYL2Qio/niRQV1xngTS5sCKNCt6AU69DsPxwmGAWoZGCAmY4cPjJ
         T8skRFPEVNttElFLo4GmXHQ0Wn4WMS7ibuVjxVhwBzhPUYjlIZmwmyeW+vfNjdar09U1
         fzyQyYaJD1NBMTMSESDsacHAGId2zsw4VEHBVzo7Ue28VtiGvDhj0yUJ3lzcsLSS9c2O
         bEwMgwRQI0FFTMeqOqapoguQkQdG4IMIPA5sNNmcePRbuXESWvETh7Czdf8K0NuhDFFa
         5C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339308; x=1788944108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
        b=SvTjJ7nLfdpBTPbnkk5+SdRE2erhz8h8iNcsAu5dE19QRMdA8n63UysHlZrH7HxrT1
         f1mk0UksjBywM7J6WvruRkj/6oY3UmSPV9c5J/novuONkqrxBcjEMohAMJdHt5NJu/Bw
         HIByVgtCmPiwpckz45QUJiXGcOKgXRLrVKrJcV9C5863NDX6xUirAhioB8W4Dklexi76
         0/Eda/Cz15y2REZ6Ohtdmr2ZT9efrMbGhEURIThkVSkgE6JFVnnPlOUdeZlWMLRE2eWq
         W4LC5iMwRcUhrKtU+p6bG2GA/sw7xIN1Jb95A04WPkr/uqwhHmcFfPSxpl3qi7pYIUXw
         ZiLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr82lPtCwZWYtH+Qivq3ttenRzX1zq/KfnB/YPgaU3GXmP0qLIVJSO+9KWTwNNSnAZ7c3ww4GsxRc960zA=@vger.kernel.org
X-Gm-Message-State: AFuF++mZcwnnaeQeb03hlQHcnbxRZo6RnARmPaLUFGp0zBeXSidKz+0Y
	ksZrrewORc3WBJvrp/hI8W42X5KfgN5NZKENefx1t1ugN+GktnoFQncqdvTRUGlfO6joXnjwsMN
	uX53JW9lBH5VaJGmSfOSrysNupqvVE9g=
X-Gm-Gg: AR+sD13yXjI2/ZJnR3Ex7QkFEve+FIBdisi+RQrhW217l8rxlN6Cij/rykmsHfZTORY
	KPJI/3t6YOHZjwWYr1tDAuv8ctgX4yIK6sVaP65VovrJZamkzDQwfRJIRsaXUCYvs0ukm5d/S0L
	AWwiam3cc8Zz4l8+H221UK8QwHkqVNvEERilJ7hqsedBCQHOl8hYza7ocbGZc9GGnBoeIxkU0Zj
	gqAG+ibvF56MSVE7dlmUfrHmCl8EAFA3ugZ0Z4TPK1/DIVb0YYeoO01LX0VSqn04PYnRq5kCLVV
	AfanCJGH2v2xUcJ4tvfqXF6PrUHsdnQ2973c8yshlWr0M5fEEqrH1OE+LKOi2Sz3AlQxhOslRqR
	AjS748VfhIrHMQoKQ7mR6CeEvPQBvFs4QcyTaTqbZ
X-Received: by 2002:a05:622a:4185:b0:52e:a11:571e with SMTP id
 d75a77b69052e-53036bb6af6mr33554901cf.11.1788339308272; Wed, 02 Sep 2026
 01:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
 <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com> <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
 <CAMpTW2fxFRrpn1b5WGYBrtLLMfUo_fmx9s2D0b552GJp-sF5qg@mail.gmail.com>
 <8b7001c68c94491095f41d2a3dff45090c0a95cf.camel@linux.intel.com>
 <aoeUdfrPX+0ZnZMr@gsse-cloud1.jf.intel.com> <CAPM=9twBded3B553KYzwDtVd0NbhbAwbiVDGw_bdrmBnOKgtKA@mail.gmail.com>
 <CAMpTW2eXS9tBzppJvvfZ-FiwoJ5MKOAdB9sqYgCDPVQ_+___ZA@mail.gmail.com>
 <ao+acQG/wyZYNYfW@gsse-cloud1.jf.intel.com> <apfZcEF8IlDak/As@gsse-cloud1.jf.intel.com>
In-Reply-To: <apfZcEF8IlDak/As@gsse-cloud1.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Sep 2026 18:54:55 +1000
X-Gm-Features: AcwNN1WILUlKuU0Lq9lIUugwcS75tHY73FPdHaQF0ZD-dcIRr3i6vZZ9zmPYrQw
Message-ID: <CAPM=9tw9dtxN+tZLrb4fvPGndUT+He7Y=o39ByMEva8wWyq56g@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
To: Matthew Brost <matthew.brost@intel.com>
Cc: Nathan Bourgeois <iridescentrosesfall@gmail.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Sept 2026 at 18:08, Matthew Brost <matthew.brost@intel.com> wrote=
:
>
> On Wed, Aug 26, 2026 at 07:01:21PM -0700, Matthew Brost wrote:
>
> Dave ping. Question below.
>
> > On Thu, Aug 20, 2026 at 10:34:49PM -0400, Nathan Bourgeois wrote:
> > > > Shouldn't we just be calling xe_bo_validate() here instead of
> > > > ttm_tt_populate? (With the correct xe_validation_guard() wrapping).
> > >
> > > > Yes, this might be a better solution, making ttm_bo_setup_export()
> > > > completely unnecessary.
> > >
> > > If ttm_bo_setup_export() is unnecessary, I'm happy to change the patc=
h
> > > or make a new patch. I will attempt to implement and test this locall=
y.
> > >
> > > > This part looks good as different patch from what I'm assuming will=
 be a
> > > > TTM fix.
> > >
> > > Regarding this, what do you recommend I do, assuming the patch
> > > remains local to drm/xe? I'm still learning the ropes of contributing=
.
> > >
> >
> >
> > For Xe I believe Thomas and I aligned a xe_bo_validate with a correct
> > xe_validation_guard is the Xe preferred solution in the existing
> > design... But a question to Dave below before I commit to anything.
> >
> > > Nathan
> > >
> > > On Thu, Aug 20, 2026 at 9:08=E2=80=AFPM Dave Airlie <airlied@gmail.co=
m> wrote:
> > > >
> > > > > Yes, this might be a better solution, making ttm_bo_setup_export(=
)
> > > > > completely unnecessary.
> > > > >
> > > > > It's also a bit odd that, in flows where we don't have backing st=
orage
> > > > > on export, we populate with pages and charge the system memory cg=
roup,
> > > > > only to move the data to VRAM when the import attach is triggered=
,
> > > > > resulting in a copy and a change in cgroup charging.
> > > > >
> > > > > I guess the question is why was ttm_bo_setup_export() introduced =
over
> > > > > just a validation at export?
> > > > >
> > > >
> > > > I'd like to think I had an answer for that, but I don't. Likely
> > > > because I wasn't thinking about VRAM charging at all, and just
> > > > worrying about making sure we had populated some pages for system
> > > > memory ones, so the other side couldn't DoS us.
> > > >
> >
> > Dave:
> >
> > We don't charge any cgroups yet, right? This would only come into play
> > once a version of [1] merges, correct?
> >
> > What would prevent the pages populated for a TTM BO from being
> > immediately reclaimed and discarded? I'm fairly certain Xe's shrinker
> > could do exactly that, since we don't pin those pages. This seems to
> > imply that we'd need to store the cgroup associated with the TTM BO at
> > creation time and charge allocations to that cgroup, regardless of whic=
h
> > task ultimately triggers the page allocation.

This was actually to fix a non-cgroup bug with a possible priority
inversion problems.

i.e. a client could allocate a BO export it to a compositor, and then
the compositor would populate it for the first time and get ENOMEM.

This was to avoid that case by making sure a client had tried to
allocate all the pages for the BO before exporting it, so it would get
the failure at that time.

I don't believe xe should just be reclaiming and discarding these
pages without swapping them to shmem first?

Validating is probably fine as well.

Dave.
