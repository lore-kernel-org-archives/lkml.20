Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7251476F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.231
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800882; cv=pass; b=DRXxnD1A5jMHCvfFVxqb35zZIhCoELGoP8K+S9VmI66yC9RmvOk2bHu5FbAZ/1df8BUHhVWUG5pspzWHhl76W3/vkvxVaeo7ykJi7OOsJ/nm7O0Rpy+I8tiSdcTvLeRxuNaGHPVv9AEBnPgnZ/iOjc8JV9WAYmXs/aZI0SbS1Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800882; c=relaxed/simple;
	bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igwxii6Saf8CklS6aRy14WTTLHYbBQFHSiYzP9IG7lZ9J2rUGk5MGe0lcQzGC24yUKUsGBC1wXAvdYdhDJM3hIZTaxLvC8OR3EP8QZyrlINHCDmlI3vfasKdXMt6lxD8LfilxeFw67yx1oENt9P7XHm+vPXk4rbMO2NFkvUq4jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/2M+WH9; arc=pass smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/2M+WH9"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-533312dfcdfso8767531cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790800880; cv=none;
        d=google.com; s=arc-20260327;
        b=H6LDsqJZTU5Aln/0IcE3VLeiu10QTLbshslBD+u2Mf4q+kVwibKYN0BQ3n329PFB/E
         AHXd0mwWY7esloZKGAk9BDS7kBzCgbBxG+AkxoJKLXrBNZ1CVEF39ulONP2+jbsMhCLB
         K5bXTDQ1BXhzrCOnr1SU/xOwzABCz+VhocM/p/Nt3JiyjSLxmaEwqxtWDtGTl0izeP60
         0HP6YmKVw7FVC17iucJpDksBAjOOsKEZvpCABfk/q/FN+DVqlaacM5/rmoV2o8GOp/eE
         PIaFguFubYnqs2jQnJBp1M5HeS9oirWLGTMnursQgmDqQL3pP3ay0CyRihu+rEcYAWyX
         fDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
        fh=QafxPgE1FMBTlyy9RvjivOmBVuwpbF/DaZM2Or2n+pQ=;
        b=AlgKQQrcbb+OcQ0c0AAGfpKDhxMFMtFcJO9HsXhvma8NCIhgJRYEzy8d3y33tvU/Nn
         O/Bp7CPTPl7sUQ3FCwbp4LV9uw9f3ZNunCSwSqzTlrmcMQ06f58VtO15+9iw1kNnb8UG
         dUGwlgeyt9151XucL8m57Hdu/xe+SQQxHrw0bAO6N0zM2MZM8hqtpsv1mjS8vxaRB42O
         1YdCaKyEI6gO+6rc0kmO1YeWKY4gEzd3z3/vy7cPW5bfQWQ8fhhSUlm9nG9ZuArXDy9C
         EzO5Gb7f1mdjjcDimeojqkYJ2AYAQPrS09C1Iou4V1AC8eDl4NzfqUtIbPd2WkSQBTmt
         Wtdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800880; x=1791405680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
        b=L/2M+WH9BPjv3gBD5XuIqtyyXziAr4FnWX7HFBXQkcgKBgza39T3xHpRgd45MH3Yho
         m0IJ0RrwHj6ce65/bHh/+gnj6kGSAqVY5UzfeSP90mguYnQPqxrgzpj4NuG/mkkguSfK
         GO20mK3/CfAVZC+agSrxGG954CwlKBllgMIfS5jdx4KuPpv/VtHD34Au88+wdYf6OMw5
         aDMSlHCwgEbKdeZTeiAhD4yXj0k4181yD7xQ2lapkug21sn1JRoi7Hy8etE+VbC48ZCv
         Lb6kqDzGt0FGySjuHzbMccaoEJgsmQmtPq+DYK2K5GZBJjAUQSBCuabsU/9gzs5PDyZk
         BNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800880; x=1791405680;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
        b=sdtHXiUKyMW8eNm1pJHrSieSWKNQ711yauQZvcVaoA338Hg2OkTqg1XNQiJbJVOp9e
         x5mkX6ITYZWucX8VsS5a1WqJFthAL6Z6I8uBUsjd3BsUgREHR3IU57BYtfADzr1SLBGu
         0HCphiPJwqVNRwDmXmsqbQGxHlNpt2fGVyAf/e4RoHM1GtiC60u6dyC5onsC9eGXTWsd
         Tmy72LvFAvRNlBuzxzHL1hn6PU3+nV+pTnFRJU46QmSr0wCksM96kPkl9M6k5p3reszm
         63CHrO4TMXrveSw+no/UYjsHidDd9miSgXeSWKnhalxfmbrKgRV8Bgcc7LSXtir4RzJd
         mHdw==
X-Forwarded-Encrypted: i=1; AKwUvBzUfbJJqg+0HawE4j10n5Al7vhdjOzlI4K5yzCON1nA8ejXzjjNOxX5+xpNc2KR3f4ZReKCc4zRJNyAotw=@vger.kernel.org
X-Gm-Message-State: AFuF++lYcUmiiKhqkWrk1NZ3RkgNdSj3Rleiqsd+j/S6Ue1jRilfWRWu
	m5aagY+GtQtlc3b1fyGLbGUOw3RkE00h6cEpZgG0kNiclaLvJg383+AAzQ/pMuPNqgGakqJsbEz
	LgVTDOcLJpgM+RTa7uFD1unnVlFSqtrM=
X-Gm-Gg: AYBFou2OKiemkmU/YTMEDGiLAVW0b0Bri4cacF3C2we/Ouc29X37lpiaagk2FjG20Cx
	vtPKkXXKzum1+k4/3UjBBKP+lNb3vr3MiA6Uy2KjfoRuzH+V/VWQLI07WdWJE66MLOUV9Be4/cG
	Q+MF84JMMbkDmlkMAtRnV1OxzepByszCYWJK+UyPG24/5bpkHPNbpx28P5+lRjaPIcetxKzgM5j
	6sodR749hC+GVw7V7mHR8larjVOGjuGXOFnOi0HoOSH4lYr+jU3ZSqndWSFGBj3o6dZdUjjTMot
	0X2xFKF8n6hXjkZySsXBSkz44mtAOwe+hQoxSdei5fP/FzBN+FwtGAV2AszXNtK1aSfhHn1/gqr
	YsKofJMT9ajwpbRT5DdGYu7HOhE81u+v4lrzwtene
X-Received: by 2002:ac8:7fd1:0:b0:52e:3991:84c8 with SMTP id
 d75a77b69052e-5337433c972mr47060651cf.2.1790800879485; Wed, 30 Sep 2026
 13:41:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 16:41:18 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 16:41:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aqfyj9saFPR2K8j2@ashevche-desk.local>
References: <20260913095111.2543502-1-miguelgarciaroman8@gmail.com> <aqfyj9saFPR2K8j2@ashevche-desk.local>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Wed, 30 Sep 2026 16:41:18 -0400
X-Gm-Features: AclHuK9Ie7lhPgTp1aQTn9gk8FsouNbrLOg2hwfGPxPNkd7QeiClVQ6hAoric8s
Message-ID: <CABKbRo+zGanUe4uJU1HC=Nwm6E4j6DUh55pEgvng3U3AmaOPQw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: device-id: document struct acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: rafael@kernel.org, u.kleine-koenig@baylibre.com, kmehltretter@gmail.com, 
	corbet@lwn.net, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Andy, agreed on both points. For v2, I'll use
ACPI_DEVICE_CLASS() in the commit message and move the drafting and
validation notes below the --- separator.

Miguel


On Mon, 14 Sep 2026 16:11:43 +0300, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, Sep 13, 2026 at 11:51:05AM +0200, Miguel Garcia wrote:
> > struct acpi_device_id lacks kernel-doc, so extracting documentation from
> > its header describes ACPI_DEVICE_CLASS but not the matching table entry.
>
> ACPI_DEVICE_CLASS()
>
> > Document the four members, ID and class-code matching, and the table
> > terminator. This complements the pending documentation header-split
> > update without changing its include directives.
>
> > An LLM drafted this comment and changelog after being asked to address
> > the missing documentation noted in the header-split discussion. The
> > field descriptions were checked against the ACPI matching code. The
> > extracted documentation passes kernel-doc and a focused Sphinx HTML
> > build with warnings treated as errors; checkpatch reports no warnings.
>
> This paragraph is more for the comment, no need to include as is into
> the commit message.
>
> ...
>
> > +/**
> > + * struct acpi_device_id - ACPI device matching table entry
> > + * @id: NUL-terminated hardware ID (_HID) or compatible ID (_CID) to match.
> > + * @driver_data: Data private to the driver.
>
> > + * @cls: PCI-defined class, subclass and programming interface code (_CLS).
> > + * @cls_msk: Mask selecting the class-code fields to match.
>
> Hmm... The only driver which uses this is AHCI. Yeah, that's fine, of course,
> but might be that in the future we can replace that with a traditional list of
> _HID:s, who knows...
>
> > + * Use @id for ID matching or ACPI_DEVICE_CLASS() for class-code matching.
> > + * Terminate the table with an entry whose @id is empty and @cls is zero.
> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
