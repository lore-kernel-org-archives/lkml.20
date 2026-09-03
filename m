Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4B3750BC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407578; cv=pass; b=dCKmEiEmM//+pOTL4V2tT/c6H/kkRKCa3YI7WQ5nOYp/ZHaWLiUsbCUjSe98tgKaedZ/hGBaRUOicwUYyiixPf240cAaqymbJlrQwZEVfn35g/sYhEq1oYgNhzx051FhLSx/mXl86LqwS3DO6e2fR3kms3xHwaRNSh2OeY72Kr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407578; c=relaxed/simple;
	bh=0nG8U1FR8wXCOSjXTDfBvYxce9r58Wp20V47CS4+oyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkEinJE7WlEBms6bC/9OVH5SshzXPwMMFmNT4RavH6iyqwXL78INFPNL3r1YR3QjbhifVgEzO7KKjm8Uhvd6uVMR3KQLTPFd6wSe4NCpTNfgUXz3x3fF/dzZjwWwZa1MMSk0U4XH6r83tczRz7rpVJseufa+6FXAs2ggOfxYrME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXXZaLSm; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXXZaLSm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso3363308a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788407573; cv=none;
        d=google.com; s=arc-20260327;
        b=sE4/TEEZWdNawr/fsX7WnLiP9r7j6vUAfhyTsTOtPCmTuO2fuYkfEPZ+z3PtvVMEuX
         2f68akADKjTaXIeF9E87GuufFAoGTKMWHNlVb/vFBWKNrihExXQJnMQxWPQGPVdksB0G
         78CoMYrk6cR29D09PLM02qvqok5pIEwxec2G5SLDJZLcJkM3VJw0XkJ2mfQWuUVtvkPH
         0oLAECmX0l2FWsFBCC3Y1Mmqn+LqnJmBrA/knp2f+d513GMlRa8OMAM9JCTb/dKadq8b
         lHFf6er4A78Dbs5mcyGnKXa1zg8ZKM0gl4JGZvm7CtcoA25nMrnU8mgt+ItVWJC80MrV
         nF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nG8U1FR8wXCOSjXTDfBvYxce9r58Wp20V47CS4+oyY=;
        fh=koETX9zJW6ANCc8dz/cJYaBj6/vbOwdpQnfRBenSJOg=;
        b=pmxeOaiplxGhkzCzdWjlK8gjApCASmo/Eft6YEkgaYISQOyWTkwzuq2QbDcWmOWgiE
         p1VtcvTVMWMr8sNGZ2m3cH0c2bXSUeOLtdkAyiXtUxWtjoRRzLg4yiJDHxIJqqBg9Udz
         7E0GaDbilH3sKay0ig2VgbuzPbAjE568waSxgYpJH/7cKx+wuvU4TSIFdNjmWxxLSy+g
         asVpr2Wto4VJAWtPJgdVqeoZweSu8WvxurP8kafQAV9b84p3qo6+BfqQy6drMq3Iqhse
         JzFcovHjoXF/HGjCEULa9qV+MvrBPUf8d4/C3vviP2BXhkzQy5kHLA9sipR+rF6jqxl7
         NR2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788407573; x=1789012373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nG8U1FR8wXCOSjXTDfBvYxce9r58Wp20V47CS4+oyY=;
        b=PXXZaLSmj/OemL6050Kt/u0PJbrDy5jiWhOAFwh5nbwWW0repPBhDdi0BME6hMP1EE
         3Mb0sIqcPXIwJ45k/66ssOZ3LtUahzJU8niHivcu7cTEAjiKxAYdCa0KiQqo5kxT1eQ5
         38DmyUMaJS0c5Q8wobyCLnUKs6EJy0X0+1saSWmWalCQMKTOjzOzmA2Q0QRNHmRLd9y7
         YJlmV2ydAdhPglCVjw3nOTsaI5mZ1VeyGNLT99eZaoqBc149BPZAfgUuKdW4crXyVnCt
         MSR9RTeBZIdPcqWzRLmY/gyAT0A5isbi5Mroo2VEsvaW8JouVGB18L0Ems61woKnTcEM
         P/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788407573; x=1789012373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nG8U1FR8wXCOSjXTDfBvYxce9r58Wp20V47CS4+oyY=;
        b=ZWicxXpaPAxBqjeT9HkdJvqt6uOSmFkthxALNDrxZRyerifZEnDaVePvTJ7vXaRTHD
         XD3/vwrMIwx3YnS7zu1blL/eCYHXlggNf+XYOQ6qXWj3TGZI79+fPNDYJwVc/m8VItu0
         D/c4gE1P/Rfc8Y4UC4qGvK906+CGVJybbuCcvbLWntyvSLXPi4GIrJgQNYGBC3Eqsa2S
         lVWmuyJHwzwvod+icXCyrIkDHcMlFKpMRv5oBk9eNRJNec8AlTyif6dqy0SopZGtsqeO
         +k0oFYNhqPneYRgqDVl1K2Vl26m+GJu/0xdWL5y3ZKVdmNeSfuE+q/bGKJMX2Coma5Wy
         hzLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvSfEQ1X/1Rb89jUoP2CViEijwhHxiuGDdaM02N5P4VZVj005wJjfxIlbraXsKxpJwqGIF4yrkATCVzWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mrjGjnh0/mDaVgB09VIv6anNaUsfIPTgM2c5aJXigLTZgUYSRq
	bY0u5UjTCVgPmvkK3+O1DpLtiBt4gJeZEK/kMECZXJlXBHn6RpcSv4+qp0/jQceVYikryshKZ4X
	ijO/kGnVV+/JnP4p05WsbVSdKRAlYSUQ=
X-Gm-Gg: AYBFou2hcKP90y/LTEtI+A24msgqQUEjGPVqxlrMp2t+wgB2zJMoIlzztUPUCek7VSl
	NKyYDdqkHEQLNw3r8ZYJ5teJYgIhm7UHUvLn8i1wzCyfiPkVjh3nl46kpkry0KOwPnF/K/Roast
	V++hh9hO6GjJ1nrtGgUxgBgtzWjY9P8TNLoM2Z1I46kkuZslPBiDv+ogWPZH6Kr5patFQgVwXRM
	WuAtZ7/kNT6AD/qv5U/2SQQrHOXeT8WqQVxQ5+UX4MXqnzTSqh3zsLQDvIzTJu5xy0q1tX5Cj3J
	R0qTC9lrLrPBTTCpFlJuWW8c3LoFOEcCda20J55GzXyzoGA//eAZNISB4817RZwPqd97fH3g/99
	JKe6gBjiPfvE5ra+WOmdYu6gsYF7dtLzs
X-Received: by 2002:a05:6402:388d:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a682af9bf4mr6070931a12.22.1788407573017; Wed, 02 Sep 2026
 20:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com> <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
 <CAMpTW2fxFRrpn1b5WGYBrtLLMfUo_fmx9s2D0b552GJp-sF5qg@mail.gmail.com>
 <8b7001c68c94491095f41d2a3dff45090c0a95cf.camel@linux.intel.com>
 <aoeUdfrPX+0ZnZMr@gsse-cloud1.jf.intel.com> <CAPM=9twBded3B553KYzwDtVd0NbhbAwbiVDGw_bdrmBnOKgtKA@mail.gmail.com>
 <CAMpTW2eXS9tBzppJvvfZ-FiwoJ5MKOAdB9sqYgCDPVQ_+___ZA@mail.gmail.com>
 <ao+acQG/wyZYNYfW@gsse-cloud1.jf.intel.com> <apfZcEF8IlDak/As@gsse-cloud1.jf.intel.com>
 <CAPM=9tw9dtxN+tZLrb4fvPGndUT+He7Y=o39ByMEva8wWyq56g@mail.gmail.com>
 <apflRScB/NTEiEzU@gsse-cloud1.jf.intel.com> <60f8132f-efc9-4dc1-bd02-b62391bf3fa0@amd.com>
In-Reply-To: <60f8132f-efc9-4dc1-bd02-b62391bf3fa0@amd.com>
From: Nathan Bourgeois <iridescentrosesfall@gmail.com>
Date: Wed, 2 Sep 2026 23:52:40 -0400
X-Gm-Features: AcwNN1XjM_3CDNM2RXbcW9bsYX8QLssOvGlmXwTLjeDvMA-uBLr1c2b3x6gwG1Y
Message-ID: <CAMpTW2d8Q0OXpw1G_9+cj0ohrYo9cONUPEBgC6kpLumosTxt+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@gmail.com>, 
	"Kuehling, Felix" <Felix.Kuehling@amd.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Matthew Auld <matthew.auld@intel.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Nathan - the conclusion is validate in Xe.

Understood; I will begin working on that patch.

On Wed, Sep 2, 2026 at 5:04=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 9/2/26 10:58, Matthew Brost wrote:
> > On Wed, Sep 02, 2026 at 06:54:55PM +1000, Dave Airlie wrote:
> >> On Wed, 2 Sept 2026 at 18:08, Matthew Brost <matthew.brost@intel.com> =
wrote:
> >>>
> >>> On Wed, Aug 26, 2026 at 07:01:21PM -0700, Matthew Brost wrote:
> >>>
> >>> Dave ping. Question below.
> >>>
> >>>> On Thu, Aug 20, 2026 at 10:34:49PM -0400, Nathan Bourgeois wrote:
> >>>>>> Shouldn't we just be calling xe_bo_validate() here instead of
> >>>>>> ttm_tt_populate? (With the correct xe_validation_guard() wrapping)=
.
> >>>>>
> >>>>>> Yes, this might be a better solution, making ttm_bo_setup_export()
> >>>>>> completely unnecessary.
> >>>>>
> >>>>> If ttm_bo_setup_export() is unnecessary, I'm happy to change the pa=
tch
> >>>>> or make a new patch. I will attempt to implement and test this loca=
lly.
> >>>>>
> >>>>>> This part looks good as different patch from what I'm assuming wil=
l be a
> >>>>>> TTM fix.
> >>>>>
> >>>>> Regarding this, what do you recommend I do, assuming the patch
> >>>>> remains local to drm/xe? I'm still learning the ropes of contributi=
ng.
> >>>>>
> >>>>
> >>>>
> >>>> For Xe I believe Thomas and I aligned a xe_bo_validate with a correc=
t
> >>>> xe_validation_guard is the Xe preferred solution in the existing
> >>>> design... But a question to Dave below before I commit to anything.
> >>>>
> >>>>> Nathan
> >>>>>
> >>>>> On Thu, Aug 20, 2026 at 9:08=E2=80=AFPM Dave Airlie <airlied@gmail.=
com> wrote:
> >>>>>>
> >>>>>>> Yes, this might be a better solution, making ttm_bo_setup_export(=
)
> >>>>>>> completely unnecessary.
> >>>>>>>
> >>>>>>> It's also a bit odd that, in flows where we don't have backing st=
orage
> >>>>>>> on export, we populate with pages and charge the system memory cg=
roup,
> >>>>>>> only to move the data to VRAM when the import attach is triggered=
,
> >>>>>>> resulting in a copy and a change in cgroup charging.
> >>>>>>>
> >>>>>>> I guess the question is why was ttm_bo_setup_export() introduced =
over
> >>>>>>> just a validation at export?
> >>>>>>>
> >>>>>>
> >>>>>> I'd like to think I had an answer for that, but I don't. Likely
> >>>>>> because I wasn't thinking about VRAM charging at all, and just
> >>>>>> worrying about making sure we had populated some pages for system
> >>>>>> memory ones, so the other side couldn't DoS us.
> >>>>>>
> >>>>
> >>>> Dave:
> >>>>
> >>>> We don't charge any cgroups yet, right? This would only come into pl=
ay
> >>>> once a version of [1] merges, correct?
> >>>>
> >>>> What would prevent the pages populated for a TTM BO from being
> >>>> immediately reclaimed and discarded? I'm fairly certain Xe's shrinke=
r
> >>>> could do exactly that, since we don't pin those pages. This seems to
> >>>> imply that we'd need to store the cgroup associated with the TTM BO =
at
> >>>> creation time and charge allocations to that cgroup, regardless of w=
hich
> >>>> task ultimately triggers the page allocation.
> >>
> >> This was actually to fix a non-cgroup bug with a possible priority
> >> inversion problems.
> >>
> >> i.e. a client could allocate a BO export it to a compositor, and then
> >> the compositor would populate it for the first time and get ENOMEM.
> >>
> >> This was to avoid that case by making sure a client had tried to
> >> allocate all the pages for the BO before exporting it, so it would get
> >> the failure at that time.
> >>
> >
> > Ah, this makes more sense.
>
> I was wondering why we did that as well, but yeah now I remember.
>
> >
> >> I don't believe xe should just be reclaiming and discarding these
> >> pages without swapping them to shmem first?
> >
> > Yes, the pages would be in shmem if swapped.
> >
> >>
> >> Validating is probably fine as well.
> >>
> >
> > Nathan - the conclusion is validate in Xe.
>
> I think we ran into a similar issue during some recent amdgpu work as wel=
l, so adding Felix on CC.
>
> Basically we sometimes need empty BO objects without resource nor TT obje=
ct to fill them with some resource object at a specific location.
>
> So far we just gave them a dummy system placement for the initial validat=
ion, but that is far from ideal.
>
> Any idea how to do that cleanly without breaking the compositor fix?
>
> Thanks,
> Christian.
>
> >
> > Matt
> >
> >> Dave.
>
