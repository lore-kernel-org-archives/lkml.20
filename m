Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EF336B924
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150867; cv=pass; b=gZKgpCUaqzA7CrC1TbJtmkSDuVQ6CrFxm4SQT73nAhwXlTK4UMdZDEP5CTfsR42Big4uRX0pmMRDHP/EBf/6IYuEQJFLnkEv4HL5amYkiMUNCvaSQPYwOQKwds67ZjqGzjK4F0NhiOVwzC4mUt1ko82hnsPRdnICJo+SfKdfJNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150867; c=relaxed/simple;
	bh=ospiNi4mvJbHDyKvltQYpdK+X0l90zSr5sr0fKih89Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rD2jZmBpLzRInP2O0jWyHFhRPPSLrizF9ANL4SBSKCTUziJtB9cXdm9An/ddkEg4iALQJU2y4Tht+PV0QHWEXufnpYTE9jcAtUYjDaQxk/ffYIcuPCCfC4A0zLbNxCqADIqf6l3QTERi7TMpZpoMK6fvDN4nRIoI+Mo4Px6PMT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZy1O7nY; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZy1O7nY"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-671061b015eso1382043d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150865; cv=none;
        d=google.com; s=arc-20260327;
        b=M1pp2qI35YlJ88s8qQbNrHG89crLre9V6Umd5/enJYjQPxGwbl3808LGU/T8+JXHuP
         0BM4A3G9zyKII4thKLRHJKirEUhkx/F44VXbgBqB8rmyTjMtnAUqmoL+xIp5XhZxVLr8
         XYJM+DQ3xbWyzotMqegyRR+p7XeImugs0envAHZRD/lGaXKjsv44DlLhJxjDUSGcTeHL
         USldBNIVXbi1zNHenCL2K9pyILt+gOm8rFbbQxGQSgatlYVRXylSHAYbDW3xOISCPjHl
         mtG8Pitl8MbCeCratEzWZYbYrE8HYrtzhpeI2Fee88pmekzflUH0rWzrRXe7hdiTTSa5
         ICUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        fh=r5Qj5UsElPJKl4wB7gKeP2gaXMmcjkF3L/MtLmKl6R0=;
        b=oMh2FOu1pgTva4ha4GD07mctblWuMgQxrCwLEn+DDBxA84bUXUqOIHa3ZwS7MM01xW
         mZpQBtWcmc6yA4eOGwdH6j8VrQ+XQ7PDrv1QU3cz00duhHgHdCZ6KCa9aA7Za5Gn56Ye
         aUk9dgz875W+AtONv23AROVm7EpisbsfHhcpofmDIVFWToyXzVghqrMqjOX/76tL8g/x
         PRBzAtYwyQ8WNvmCxY9euUd3BWKhQtItE6N5tAkEnhdZQYjW5GBU8EiDnyNnPYJWDW0W
         ARHuL198iAPabSeYJlDg9nnpm/uHRBmh3foSRXssX4xJ+b3rNAlYFDSg5fBWq/G1zpqk
         3/PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150865; x=1789755665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        b=fZy1O7nYX4F8RpCBL719cejwO2JBZBHCsQ4M29xWe4J1TICgnhFF4vaFKW0LcVXdmJ
         7JdqsQw8HdHi3qOgLEDUvZWJMdsBhJvjcwAlk7s4SAP6Ge1bQDyq7QlkphqhoqP2sjxu
         hlvtKZOtj97s5AEkAIFBG6SfqtoFA9gozAIKE/u7v19trAtrqTj1kwsXEWMxfPpYViU1
         A6r7wP8ya52+HMgnFwqsiTQib+gLaQKrY4yT8f7y2bOXz5s2XRFZO4o9qvbLDU28U4sZ
         lUNz9mwfWNtI+Bz1r1H2qcuU/MZANI+qNPsIsj2VRtTm7dbTNkjPC+WsuM/oSxn58NcQ
         vk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150865; x=1789755665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        b=FHHCqCtEQSpRc9SZyWIr5kbWEaV7rASESjQzZQa0z8Z4RqGigYyQO4oOOZ1B4YLDLC
         NXx0PZop4oSPgS5uPXBZOsm15P4Y5tdv8DqzV6G9gjPxI6KCV0sDBcf+EMt1CWJZhj6i
         sTGLHb7OKZ3JNbtiD1Hdbf5wxuGDxGpXRdx0bx+UH9Mt8g4+ukFgryLu6AMlvJfMJvP3
         fh3kmOqPrAtXVRjaGU8bbiTZxGPLSqPPUdN2jTSlFMvdm1EhlvvpEE4TRQuDfN4dHL88
         gTcf0frZRqti9Lsh3gYz7RhMs34c1gjzWX8ksh0ACA2jj6PmhyrBVCzzzw9mwvXMgrA/
         jl7g==
X-Forwarded-Encrypted: i=1; AKwUvByjsrQxq3/ByD2NT4kRqr36tWFbJMGhbXpiv/RwylGB39YK9Z4BeDze44+r0LCdHfMcqR3ziY9/J1A09VE=@vger.kernel.org
X-Gm-Message-State: AFuF++mW1Vi8M3JxOmoZvu281SRNG8AbRa0orbbqHs9NbMVF0/5raFcZ
	93NhvPIG/C7+bj8fniU5ENFPAIIFFp4pMys5mB6r4lgXwNlf6OBKGi1HmPDjcJEUy43kJLuXXhE
	7LQTxB/y5qxKPVkF0M+10ecj4wmPWDcM=
X-Gm-Gg: AYBFou3UVbjMDCCSI3P+II+4K+TZjDLACDQfgvCqH711ZzzanOY/8lkIz5PNA+QuFuY
	bp9B3sPhRjoeZzAi6FexF9CBRKW5GR6gxbVOAIeqsvMmdMeKKj9yy5Hl+uLWbxF+oWAKl65FBED
	2X1pKLuFyUMOVOx32YvjSa1FtPFGggcAzovjWhzwb4CjRkpnbxHNtjp7H8hYXVoDfYJQy/KIWkx
	Jbfw16a1l65qpd3Y/VdFqHTDKAbEadaPJSSjJYtQ35ca/LVxgc9xSbG8aGpFCD1P9xWevtFfgRR
	kdzD4Ytc/zRLMIXsOz6vZ8mbMVH4bCEDdIe+TmUmyTARkeeR8iWh/sYxJOerM/KDHvRfIAPsgOx
	hXT6/5MSH1dA+f72Axi0i8nO2+LpQsh/JcA==
X-Received: by 2002:a05:690e:450f:20b0:66f:c1bc:c072 with SMTP id
 956f58d0204a3-671246c1531mr1637688d50.58.1789150864802; Fri, 11 Sep 2026
 11:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-dd-cmap-part2-clean-v9-0-3a3f621f4a10@gmail.com>
 <20260908-dd-cmap-part2-clean-v9-15-3a3f621f4a10@gmail.com> <20260909-primitive-nano-hound-8ee2aa@l-nschier-aarch64>
In-Reply-To: <20260909-primitive-nano-hound-8ee2aa@l-nschier-aarch64>
From: jim.cromie@gmail.com
Date: Fri, 11 Sep 2026 12:20:38 -0600
X-Gm-Features: AcwNN1UJu3AgSAwYav9ulJp2R_HPP-fzpsFCD13LL3sQevEBQ_irSbDy0UqSCw8
Message-ID: <CAJfuBxx0VFCS820JLqawLdcpb49Nj-=xnSYdg6ytOub6NidM4A@mail.gmail.com>
Subject: Re: [PATCH v9 15/39] kbuild, dyndbg: Clean up builtin module-name ambiguities
To: Nicolas Schier <n.schier@fritz.com>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:50=E2=80=AFAM Nicolas Schier <n.schier@fritz.com> =
wrote:
>
> On Tue, Sep 08, 2026 at 06:55:11PM -0600, Jim Cromie via B4 Relay wrote:
> [...]
>
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 9c2f096ed1d8..99bbae37d34e 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> [...]
> > @@ -161,17 +161,21 @@ file
> >       file kernel/freezer.c   # ie column 1 of control file
> >       file drivers/usb/*      # all callsites under it
> >       file inode.c:start_*    # parse :tail as a func (above)
> > -     file inode.c:1-100      # parse :tail as a line-range (above)
> > +     file inode.c:1-100      # parse :tail as a line-range (below)
> >
> >  module
> > -    The given string is compared against the module name
> > -    of each callsite.  The module name is the string as
> > -    seen in ``lsmod``, i.e. without the directory or the ``.ko``
> > -    suffix and with ``-`` changed to ``_``.  Examples::
> > -
> > -     module sunrpc
> > -     module nfsd
> > -     module drm*     # both drm, drm_kms_helper
> > +    The query string is compared against the subsystem module name of
> > +    each callsite, as shown in the control file, or its simple name.
> > +    The simple module name is the string as seen in ``lsmod``,
> > +    i.e. without the directory or the ``.ko`` suffix and with ``-``
> > +    changed to ``_``.
> > +    Examples::
> > +
> > +        module nfsd        # simple modname (as from lsmod)
> > +     module init/main   # subsystem modname (as in control file)
> > +     module */main      # any subsystem ending in main
> > +        module main     # simple modname, selects same as above
> > +     module drm*        # both drm, drm_kms_helper
>
> The five lines above have mixed indentation, please switch them all to
> one tab (no spaces).
>

thanks, will fix.

>
> [...]
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 0a4fdd8bd975..e129c4d10ed8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -23,6 +23,32 @@ modname_flags  =3D -DKBUILD_MODNAME=3D$(call name-fi=
x,$(modname)) \
> >                -D__KBUILD_MODNAME=3D$(call name-fix-token,$(modname))
> >  modfile_flags  =3D -DKBUILD_MODFILE=3D$(call stringify,$(modfile))
> >
> > +# Dynamic debug subsystem modname with clean heuristic and override su=
pport
> > +dd_modname_override =3D $(strip $(firstword $(DD_MODNAME_$(target-stem=
).o) \
> > +                                       $(DD_MODNAME)))
> > +dd_obj :=3D $(strip $(filter-out .,\
> > +             $(patsubst drivers/%,%,\
> > +             $(patsubst arch/$(SRCARCH)/%,%,\
> > +             $(patsubst arch/%/,%,$(obj))))))
>
> May it become problematic if there is a conflict with
>
>   arch/sh/drivers/dma/*
>   arch/sh/drivers/pci/*
>
> vs.
>
>   drivers/dma/*
>   drivers/pci/*
>
> ?

2 questions here really -
- what should happen ?   strip arch/sh/ and then also drivers ?
- what will happen - I will play with the expressions to find out.


>
>
> > +dd_modname_default =3D $(strip $(if $(filter $(notdir $(obj)),$(__modn=
ame)),\
> > +                      $(__modname),\
> > +                      $(if $(filter main core common util init snapsho=
t \
> > +                                    process,$(__modname)),\
> > +                          $(dd_obj),\
> > +                          $(if $(word 2,$(__modname)),\
> > +                              $(dd_obj),\
> > +                              $(if $(dd_obj),$(dd_obj),$(__modname))))=
))
>
> This looks quite complex.  I _think_ this should be equivalent, but
> perhaps a bit more simple to maintenance:
>
> dd_modname_default =3D \
>     $(or \
>         $(filter $(notdir obj), $(__modname)), \
>         $(filter-out main core common util init snapshot process, $(__mod=
name)), \
>         $(dd_obj)))
>
> (Removed $(strip) and the last $(__modname) fallback as both are already
> in definition of 'dd_modname'.)
>
> What do you think?

it does read better.  I will try it too.





> > +dd_modname =3D $(strip $(or $(dd_modname_override),\
> > +                       $(dd_modname_default),\
> > +                       $(__modname)))
> > +dd-name-subst =3D $(subst $(comma),_,$(subst -,_,$(strip $1)))
> > +dd-name-fix-token =3D $(subst $(space),_,$(call dd-name-subst,$1))
> > +dd_tok =3D $(call dd-name-fix-token,$(dd_modname))
> > +dd_modname_flags =3D $(if $(dd_modname),\
> > +     -DKBUILD_DD_MODNAME=3D$(call stringify,$(dd_tok)))
> > +
> > +modfile_flags +=3D $(dd_modname_flags)
>
> dd-name-subst and dd-name-fix-token are not needed, dd_modname_flags is
> used only once and can be folded:
>
>
> dd_tok =3D $(call name-fix,$(subst $(space),_,$(dd_modname)))
>
> modfile_flags +=3D $(if (dd_modname), -DKBUILD_DD_MODNAME=3D$(dd_tok))
>

yes, this all looks cleaner and more comprehensible. thanks.

>

>
>
> --
> Nicolas
