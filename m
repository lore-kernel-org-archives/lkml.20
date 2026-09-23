Received: from mail-dy2-f16.google.com (mail-dy2-f16.google.com [74.125.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB3A47D950
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200659; cv=pass; b=JdyKCdmCd1uQUPSjeCqosVi/G03xI2jorwegziJB28blyDQas53GYIel7LwMpmn8YLP4+FqGWS+0s53DDS2f2QK4zWbcZB0Vd1M12rbTiE4hq83LxQX8p0gMhOWB2VI5W5nU+pjMgPhqOvqtCCQhryQXk0R6k5G+f0LjxOKL498=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200659; c=relaxed/simple;
	bh=9lmjTlgara3Ob1PGZGxjXTpEsubidhy6Ci0I81dgSKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLHNYwo+yEp74hFudiCWFyStLFdbFwx8ol4Evpehe7gcak2xHd0AShl+fWvQg/83+iuzqqWq4gdto32/H4J4S7YZJ4nn1vJq9lEgr5MYck9ZlBdrc2ehOizn4/ncSav1R6k0xaIfUJDqyZVB/5wxmqu0SfQ0VuW6Qr1N5BaAJbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMyBogo8; arc=pass smtp.client-ip=74.125.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMyBogo8"
Received: by mail-dy2-f16.google.com with SMTP id 5a478bee46e88-32836ad8746so70370eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790200657; cv=none;
        d=google.com; s=arc-20260327;
        b=Bm1n1MdpNLK1QcKT5lpQDAg2Ru1NVzh1GTpj5n8S6QmYfVa+W3WG/FKmrbBJuEAVVm
         bLgAPp6Tmyj3Wj7qDyHngBtM9QuH5hlI/dHWtgq0WaoBpHA8njzzr4AavxXDufBDGAbJ
         epqtO8CHsx6xR9TbtSEAzoS7u8qBOBKOgN14+mJ4HNCIZjnRgA8aryaUGMb2OrAV+TJl
         XyEYXMcTiAX0WUKZW+9T4rpGCO3b0aubl708PwoInh+NRlNVAiGhwkHQr9OYm1Jw7JhH
         4XS1UTFsxOnRFdeiK+me0oxdjsd4MQcR2MiiGKc1zyBkJTTEKMbH4g8j20jnIDuuCLgJ
         J6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
        fh=oO7EoCfFaVc0zAdD51lNVk8atEkQ2P0tVTFasw9jyCM=;
        b=UxjgbnLLzTXpDoAzvHS6ulo7cZgilxQ3h/se27MKa0sFTVmyTqV7DaL07+8e8VA+eP
         tHZGjwaWwjgR1lhTZtUo2LCmVW+n1zMFmE+Td1vB4ydIqhbPuEN2k2Gn8UUXnatpn5G+
         Bnb6Uz7rBPPBhM5mb5PkFM+h5+IcWWoVwRN7xKgqEaROR0oH9ITxbODgvqQ4skrt0tAM
         no6upezvqbP1G3J29GgGEsewjup5I7CuecTzF5tvUPU3YSMAVwx4l3gMzOOdVhmL+I7a
         Tdy/V4ibmMxMP+/8wouPsyb9JlZmqPlTZkjThrJZ3yo2S9Bx3gT/emXoU5xziCU5aR7S
         xZjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790200657; x=1790805457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
        b=fMyBogo8zqRkDE8O1NjcfKfGeykFFDKBj9/auFya7kA+X48KuDBwHf/Zd7IXrdajPK
         959NoKP24+BZ4okeXETlG3+Lj52nxG9ykR1PzUN2IFiN8fBhMubwXxlpIvU/KWMV01Dm
         9GRBeUOK66ZSVrDcal4BUoQVfFdwPPK695q2JpvWLwStSnM/TluSVbRyS8g28UjX2kx5
         hFHOWvX4OVEHa+krmeEcV2oRcQBvOBiWgk1U89Qf4gRoYfFY8miUijLFmHvY8L7F4vg5
         nz+zF9z48daIoaokOktLCRddUPdVIVn3g1H054A0fm7/kJm6Ds3BXDKHLxi1VQcxXYGc
         Icgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200657; x=1790805457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
        b=TeiCVoeLLXXVnG3djsTEP7cz4Fq5RVozXgGblyRDoDQzn2KPfCV2SKZywJDqQj+/iU
         XZO0SqZoZCGl7NOPBan8U6gbo/SmlwsbOOmWkvgBCFp19WqyG7vF3xE0CNopbwEZUSII
         0hpdLSYS2eUIUZRL7Gg7vYys4Cw7tccAp5MJW6ZFFaVQFfngbDo6Ne9Vf9D5GsTGvqP8
         qbDsDdRGPw4mrILRuifk259cN1dlZpKT5vsWcFmvhrQ1UFmNMrCN82mHP1O3Jy+OgbzR
         y8gn0JjVWv7r3668/HdbSdeyzG8keDypyhyL9ykLUz5ECQ7FtoHIWkQTDhccX7GJh7Zp
         96Pg==
X-Forwarded-Encrypted: i=1; AKwUvByARN4gLCMoWlxJnMfopBpCVhNIxc475kO8i3btSyfWLJHdyN0ooS/QhWF+6OeQ1j0Jte7K3cYGkmtVrkg=@vger.kernel.org
X-Gm-Message-State: AFuF++kY4G0Arvig4SdX8FGoQXJP1J8OXNgRwybUVj8KSEWCcvjZHhQS
	jtpMwdTCdKkR59XoeS82Qx1+SvFlSXDeryjS6cmQjuRUMfOhL9CSXx3BpUz4+RFgpvTOmGwdRNh
	6+kFnnRo8D+oZOHyzVCEv1tPmwX/PXrY=
X-Gm-Gg: AYBFou0x/u5zYoTMDVF7beTFLMSDVnW2d/OlUoWHqsIIc+iUx5g0KzhLbvedfuXH8EF
	USFcI3GGrzUHqQKiAAtaXrMmFIqsCLWRHfq9qpjJSFecO+s9FoJ5dhQ289En0KIa9AbV8eGgRCz
	8dlzujxVddzNaKGFmXfaY8rKcpuAIVLomgbk5CcUC337W8Amt3ufnM33/Te9a9jvhjOGf2CjG6B
	xqXRlKVhvH9WuS2dUSIuIC5IBwaTTeYFjHjhv2PjlApBZSTfT8SjpjL+KEzdhn4gU3jVQ+xAz6i
	98HtzAAYEJNuwAXy9g6f1Zk9WhgbP81NTW7t0DNwGZB+YC8xtkMUZqqOzDBBiM4n2kXVQ40wixe
	ORH5EX7iSkjP9IP8z/sgaHuCsbkxfN9yWcgOWozAVXQ==
X-Received: by 2002:a05:7300:7f28:b0:33c:68b:c4d2 with SMTP id
 5a478bee46e88-3400657428emr416140eec.2.1790200657406; Wed, 23 Sep 2026
 14:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
In-Reply-To: <arPhsTaiqXPgCqAU@sirena.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Sep 2026 17:57:24 -0400
X-Gm-Features: AclHuK_Sy6gy_cFQzs494m9ICFUjGa5KnK2eKmqxNuEJb4IKFn6VLWZL6MmQkaA
Message-ID: <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:27=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 09:45:38AM -0400, Alex Deucher wrote:
> > On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > neither of which have had any response at all.  It really seems like
> > > there is some room for improvement in your processes here, currently
> > > that's three drm trees all held out of -next with the same fairly sim=
ple
> > > build issue.  Can I suggest at least check to see if the code you are
> > > trying to merge is in -next, the drm merge was done after amdgpu had
> > > been held out of -next for several days.
>
> > I sent the PR out on Thursday and you reported the issue on Friday,
> > then the weekend happened.  It was investigated and fixed, however
>
> The actual merge still didn't happen until after I'd reported the issue,
> and then as ever things are now starting to propagate through the other
> drm trees.  It seems fairly obvious that there is room for improvement
> here, for example people could check that the code they're merging has
> at least made it into -next.
>
> > Dave reported a different stack frame warning yesterday so we are
> > trying to make sure that is resolved as well.  In addition we've been
> > trying to figure out why our clang builds did not catch it in the
> > first place.  All the patches should be available momentarily.
>
> OK, that sounds more promising than what had been visible to me.  It
> would be helpful if you could be more communicative regarding these
> issues, the drm trees and over the past couple of releases especially
> the amdgpu tree take substantially more of my time than the rest of
> -next.  Between the frequency of the issues, the length of time they
> persist, the way your process will obviously trigger such issues and the
> near total lack of response to my reports it really never feels like
> that time is valued.

Your reports are valuable and we always take them seriously even if I
don't reply as quickly as I should.  For the issues at hand they
should all be fixed with the following patches:
https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2
I'll push a new -next branch with those fixes later today.

Alex
