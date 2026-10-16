Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F03CFF65
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144396; cv=pass; b=o6X79ATE0bD+g2gGmGrjE5mEsWFoH2I6EwsZFbFATy2ziiFqgH0Xoualm5PyjEBYvHNSolTX9Rc1CGGPO06N6meQT5tJmkfeiWfO9qznS5OC/iHtDXQ7iUA8YmCeWSTJRBDaaVTGYPAqbCwNVREdx4jTNettZurU0rcsjl9b2tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144396; c=relaxed/simple;
	bh=xqN3pfb0UkR3DIFYcIuV6kM3FHfjO1La5ULm2s3cbLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfttKUBrd0MYcq5x3aWMIvXfjg5Bp1CFC1Dc5cZ3PFqyYPZ1MDgy87HH/cvzFIAv+MBT/m586+Luj5DX/FSDJUCQEa4lxORvmD/YxrBaVYeptCyUoXIP2CIS8onTEMHuLTQpv/Q167dF0wqn6ecHUzCjS6fpErYg18RLLMyGjgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jDLdGiMx; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jDLdGiMx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso1002804f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792144394; cv=none;
        d=google.com; s=arc-20260327;
        b=HerPaJRhI1rgDZs13Ypg5vW5815rs5z8ccsM71k9mapbEux8kvfnM6HfDgMBrh8iEM
         4wmUMrqiklyO3878uR2VYzdbEj794Wj7P5kxL9DuGWV+SYwK+/0TL0yYgvPHbEOEbwo9
         sVAogNXmMr1xo+NRmxaQxNuAjrnRGfqMWRQzVrBQu7AxeOjZC64Da8FVBiLIdEiUVHl0
         8UtNU/v5YAFSqm4z0yyYa6WOVofQv7zpdTjd7EfBNjncEy0V/5i0s1y/SUQvD8+v42yJ
         2HbhictVMVK+40kJ9k47JeEjwSP6iJsnoE4jQJu+5c8wMNoFvyHL46Qf0u9Fjttp7h8l
         ysdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xqN3pfb0UkR3DIFYcIuV6kM3FHfjO1La5ULm2s3cbLs=;
        fh=ZgugD4nzoKYPll9I1X8TqQP+SOK74d5Rq7vr2vzKyYE=;
        b=CxZi14ntEUn/vnXYEbY6BMtuGbt/Wv2bKte8DG3xlImtSkec/c6ZJkSJNtQ3+7pPN1
         6mkIysqEDHdmjCsYgJN2rIiA8Xe7m+wg3zb8cNQobg/s46GNL8QiOdLd4o3AHQVv5uVr
         8ontm/uZ1CBjE2am+B1uWjBh9yJExhgpK7DQ6fMglZfJgiYFXgRQIakppzfXSR/gV6k+
         S3iJ7C0J3GDx7Wirce+TSyQqhw/Nzthu43P4nZUWuW2m32VcR7iU+ZMXrTcLeMbGpHcQ
         m2sshzZqlhqICM4GwVr/lmyF2r3VAVaXYeScuufN4hTStcTduX7FfJWo25y4DwD62lal
         tfYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792144394; x=1792749194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xqN3pfb0UkR3DIFYcIuV6kM3FHfjO1La5ULm2s3cbLs=;
        b=jDLdGiMxcaIIYMRGh+/GvHB/GA2RtVlZ9FADMtj0vAbP1wEoVOK7yf3/RVrUvrDISp
         VX0yHYOzbdKZcvVJsyuWYoY4XZAv0gvp7jTfkw/ugOH9FabPwKKShjq+4zlue1ycatq9
         gRDJmIn2wGsrvvmrHrTaEoNjNB0Pkpt53izXaa2uy9tMrAyFIqxJgFT/jJfeTLyDdlaJ
         4DdblAtnRZRcaEarLArRz0AsacuUKRHccW8hBc9PDkygzNlKcBfTX2UPx9I1CLVKBpFK
         otx1NuO8dCubfeszmS42aeEKkZi2lRAw1PGcVypZUVBjrf3huKHaNd+mXA9wZ0zYANM6
         ESsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144394; x=1792749194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqN3pfb0UkR3DIFYcIuV6kM3FHfjO1La5ULm2s3cbLs=;
        b=ir3sEIofpbvv09VQZcayhF1zdnZ3UupHoLBVVOQ5XEsNn12I80V8Vx1lZePmIoMwrU
         KnZiZX7xzxUYIz7/O1vIcJS2i8nYwnv8EVKKjVM/AlPqICXlInh1La0JAEZduTMnL8OE
         YDoYlHfDaXSzhNZsQzWWPUIYTf+6W+6//uhB1z6Dh+Ptq9TkbWaK74E9m3Ic+WGvwf7w
         sCrNYvNFOO+8D/TVOLLhFjbcs7j0szIvcLlxJwOyUo0e3uvVx1Mywk/uZlWe04i5k+Dd
         b2db6ZbkxG4LjvPuwF0+fkZdGnAgLZz54Q3Ct7dM3VhNSM4tbaLfLg9Yy0ntaPMCLr8V
         RbWA==
X-Forwarded-Encrypted: i=1; AKwUvBwmcTyCJPgZ4bKUMJH5Zk5+dlQ3cJC1DO+w/Y0HnGjc0VcGLuJ/8Dq7IUXM/pVNwbTgpZVJ4XbD9df1tTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV20f3oCZYz1Pj8qx+e+6ZZseyirNKhS+PZ2ASl64BllGh9JMe
	/uGDBssRE1mxkSmnAowFm54qOUy6rzEKThewO6WxfG59Q8UWGH/sDVsZ0xm1nLbrRVfhgVqd/wr
	v+h7rwu+rH7zdsObdNMjO7XhEu9iEh8SwCUxeUD8H
X-Gm-Gg: AYBFou0jg+zqHFGZHQgsN6Zy4f2prDV4Mhsew5k+OYfuj1DEm19ypwL3zfaiPDyJdqS
	bwCjktlyyaxd5ti0aALFm4aSPizW3aspr8ApZ+j6Yq9sPM3roBoE9fdg4Ty8MNr4VbS59LN+rpC
	+HhFDo/vJsqaKaN5eKAfaJL1DjAZQz+tgIPtW7mNG3HsHFkOZsNdYJjBEiFLh7s86PJnd8sU1TT
	9bPDvUEd6MC+o16TmtjM1CbmXjVWCkLTMODcpRJRK4sJLJZ/js06CwKp+c2RzK5PFBgu8SD0Skp
	QPgHRtcJS3X9gAQkcpfU0g1zIWCk5/7OGVkMc6vQnGUdNu7pIEcUm5DjSlVk8aLRVhisXGfYubP
	uPAUfdYcc1oeC6UMdcDQjqbx9HYr60u17We0ps8pQlEJeSRdQ3DwB
X-Received: by 2002:adf:e64c:0:b0:485:8ee5:5ffa with SMTP id
 ffacd0b85a97d-48dba9de8f4mr35213414f8f.38.1792144393256; Fri, 16 Oct 2026
 02:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009140946.008206689@linuxfoundation.org> <20261011111313.27648-1-ojeda@kernel.org>
 <2026101124-rethink-craftily-cb25@gregkh> <CANiq72ndhLush3bugar1YGPnsein8min1k3_NucBxzFwCWe9Ug@mail.gmail.com>
 <2026101103-fling-stipulate-084f@gregkh> <CANiq72kjJ__OnsTjmsuQZH8+U-cRDCNnRpSuHU3PwYYT07Xf0Q@mail.gmail.com>
In-Reply-To: <CANiq72kjJ__OnsTjmsuQZH8+U-cRDCNnRpSuHU3PwYYT07Xf0Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Oct 2026 11:53:00 +0200
X-Gm-Features: AclHuK-KZrzl8buAxw5--JIrQ3Q2GlG4ZFRpXT7mWgEiCKlqaDvBAHdKaEgr_aM
Message-ID: <CAH5fLgjjPmL-hiQ7R5zFG9BwWbxm6j+GnahoC11AiNxM7iyGJQ@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, achill@achill.org, 
	akpm@linux-foundation.org, broonie@kernel.org, conor@kernel.org, 
	f.fainelli@gmail.com, hargar@microsoft.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	lkft-triage@lists.linaro.org, patches@kernelci.org, patches@lists.linux.dev, 
	pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, sr@sladewatkins.com, 
	stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 6:39=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Oct 11, 2026 at 4:17=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > If that works, can you, or someone else, send an updated version of tha=
t
> > commit for the next round of stable releases as I dropped it for this
> > one.
>
> Done (I didn't add vger).
>
> Alice: please double-check, thanks!

Thanks Miguel
