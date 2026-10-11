Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9872E1746
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745916; cv=pass; b=TqyIkwmzGCG7aUVU22OGZBgX3/DXy+/EYROLQx9geAdub3lHeRyhIaVL4vVN6AXiiJH7unS5TAYaMd+2g+oUBkwhucQeiggvhEi0gM6tMrTqlR3kNCM3t2To/7td+SjzbT75QW06P0S9m3966zM92jnyIppAosZPyA5UXW1rRWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745916; c=relaxed/simple;
	bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uz7NcXKiJyoBQF8kb1Iw6nctuvja5o5wLEHTeGm3PC4gnN7yNxxxJmmJ1SuyPlmzsXMGqMtnYiqNLC15c6Pc0lukFroKq3AM7QUQhij+AEV1r2sD+KewdktiicMxYkf1U+FsacR9p7YTPFZEon/sTKqF0i3XnhgfLfLS8TjsdDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI/aSWYu; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI/aSWYu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c29c6a3930bso156899066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791745913; cv=none;
        d=google.com; s=arc-20260327;
        b=GmMaMB9Uu5OJZr2gCHE5yw/R7ObwIaRzkcjzkgVgJ1HsmXb97voGpenvhUFzJl1P1t
         b92QJNYQOQ7Tdft2KWAwSue9mLdl8gBnwIlLGsUhgWq0rAUV1T6HWG6KHJGoiuXWmUqf
         1gftPxH+WYcDXRDaCm/MnNh3MGURMW+erZzdJp4H0jXw/oR8LsAVPFXpMC6t9hlz4XQa
         6d/YQUb9E5l4ToR5ovAmS0MSsTKbEytnR/W8hGQ+LOkBAUevdCqiAsNAs5rPotce9RVH
         EUDwWhgTTAzNbRRDdAoCKs0XRhmGZgFW+QSIYHLlO+HKFqwLzbd5HREka00Ns5F7U2aW
         KeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
        fh=8ltN1WYoqAAz40/N8GG+j9yzoAli9OrCccL5j9lTzH4=;
        b=VTbW2vtgelj+Uzd0l/0J0jjLx8e0WslWKbt0jrIil9c2NqvYwPoBxjieSoWw1EGG45
         XC5reAQlIYCHGinmRww4Gxs6N1DQsXCQVQtiVfB1aHhkcgcQrNMlMTdtNRxT8mqxhhhc
         uhVnInY9iBZuw++gsmwR3nVcBtO5689aDtoGScTvYrncH5w6fZCTPwCDtIfPUud3USm2
         X4eG7dmD+yLbSvPHXsWB1Rfs4fKOUwfE/MOTcbKRlI0cf3eVA/Bw1DeveI0crlb6P3Tv
         I3JZ4/FtsOlm86VSJ5JXQCod3syig7VxaL0M7itwn/QhhGwtDGJWxDi9Vy4x8UoVd/qv
         DN4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745913; x=1792350713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
        b=VI/aSWYuCmBTpN1oBI8uRoWhn4JptOFIAoAZlwq2feh95SgeabhOjZDhEzyahZcH7I
         vE9VaasWAUHVaXB5DnyrU85/CF3Mf5EdhPT67MGt/lLI3VNcr3Bptwwo7wVwSRYlBVxY
         +mLdDuG3mR/CV8sKahHX1vfi/qnv+wMGn6/u4d3Wd2r9/ybt3N+CwE6xKrP9+wab6+bg
         rta4e0orn/XLlzoJgXdEUX7XhWXDDTPx6ZqVTrri8gupLZ8YupZ9TmQvFjqZmtLlPkXj
         ml40mNL7WYyiWJ9Gy3wQfBdY9cpKZP8Mk7yCT6q7Xy4eJhRf6GPQ2f5TBYJbs28eKBQ6
         pn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745913; x=1792350713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYKNRj3ug9vkm1jPoqZcluGlMhpP5490svS78Zjq5o=;
        b=d45Rdgx8vGDgu/FBcFY/oIcjFe9H9T5sHeS3TIw53di6sb70pe+1A75gDojkRCFuOw
         mPcOp2ZSgJYANALpsDASmDdYiadwQtYECcLFS6/SpfNTW7rApWi5Fo4jLYnBR55Pb1TJ
         UIntW3PeQ4L/eASPq3wY2NdP5eRUXLnkSf0y++kCBvLRSOEkBGWEwjVjlQomg1nE5j3z
         nROyRHA8bXU+UtCUn6kI9xdPP/NUcf3EGjR8couPEMHR3CyMPCVE+mjPWjzIdpUQQ2bO
         3/+c6+sXeKHOBbAZkcEs5+1Iyrlk52qNtV27VvoKANUIsPzN+YhBeQUeeyC3hr/HPGv1
         uryw==
X-Forwarded-Encrypted: i=1; AKwUvByYB3zA1mRx0jId9oNWbpArKFQ3V+rFOWPArtTiGeoBsws8Q7ViexULOlnWXkyr+1gMAjm/KiJylXFhkwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwmbvaMOmtjw57Y3lpsoLEyD4oIMkO9RtXYYosRm3I6D2DS3xk
	hoJx1+YBuMFiCzPj/NZ4+DMBluY7B5FHFGqZZUPyfkLVAOJSngEnYC3ZaT1WtXVvypw+LeAHg/5
	49qtTSrAd5/FXaY5m6nrxzztMMfygiLc=
X-Gm-Gg: AYBFou1nNsB+GYVfPXQKgYtpmCNMR9VLJZkGSSWdw+eFMedkJo96MlSB7NcVkKjw4F6
	sWMnHc7BtXkRXyrTPhnShpF8O9bb7e53hrKGtgCno81yt9uY6ZZmwtNZOCnDn0KhgrTULd/97P4
	dCIrsz3WD90GYhGUXOS/STFhHf2hxUxNhjvQEk7otDw+EgP3h1P1JP0qFRG9AhzsvjaV1YJvEyq
	IVwea702t+rfvt/iw/wyYi0E9mqIaNKbnvTDUL7HSPf78BRVaxBhvTbVf/hbmRTG4/mmnruwUNj
	zUzMeNq3Kg9cjMubS0ee1OgPDTlK+ufTECy5yyjPf/aYPp6LHUrwgrH2HhbTndNJ4By6koebrCR
	uCT98o4l/w95aUeZvc5syhPJBpjzJdq2PCBkR/49KsQ==
X-Received: by 2002:a17:907:3da7:b0:c26:2fc8:4e91 with SMTP id
 a640c23a62f3a-c31a9d579d8mr750287366b.29.1791745912785; Sun, 11 Oct 2026
 12:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-6-linmag7@gmail.com>
 <CAEdQ38EGE3sq07jLUv4C0q2-wbc3xAFj4JOkVWiU3G0FgUW-Kw@mail.gmail.com>
In-Reply-To: <CAEdQ38EGE3sq07jLUv4C0q2-wbc3xAFj4JOkVWiU3G0FgUW-Kw@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 21:11:41 +0200
X-Gm-Features: AclHuK-dUbRkuwk_AXsSuyEHFuI0dJIZDATgrqCDTIMSaLJvGfEFJO26tVyLUDk
Message-ID: <CA+=Fv5TbVBGq-z-CTiYf9=Hi-ZKvpCzi2fH=dSopg+xwDrMpnQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] alpha: decode Clipper environmental events and
 retain Tsunami console logs
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 10, 2026 at 3:40=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> > +static const char * const CLIPPER_EnvQW5DOOR[] =3D {
> > + "",
> > + "Set =3D System CPU door is open",
> > + "Set =3D System Fan door is open",
> > + "Set =3D System PCI door is open",
>
> The "Set =3D " looks like it came along from the table in the manual.
> "System CPU door is open" reads better in a log.
>
Agreed, removed in v6.

> > + if (!(status & MCHK_DISPOSITION_REPORT))
> > + return MCHK_DISPOSITION_DISMISS;
>
> An event with no fault bit set is dropped, so a recovery (door closed,
> supply back) is silent unless some other fault bit is still set. If I
> read your cover letter right, the "enabled again" report in the PSU test
> was only printed because SMIR bit 0 stayed set. Is that intended? I
> think I would want to see the recovery.
>

You're right. The fault-only filter also suppressed notifications that coul=
d
describe recovery. V6 reports valid notifications even without recognized
fault bits, together with the status context.

I've booted v6 on the ES40 and repeated the PSU cable test. The individual
PSU failure indication cleared after reconnection and its enabled
indication returned.
SMIR bit 0 stayed set throughout, so this still doesn't exercise the
all-fault-bits-clear
path; that currently has synthetic coverage only.

> > +void __init
> > +tsunami_init_pci(void)
> > +{
> > + size_t i;
> > +
> > + for (i =3D 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
> > + cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
> > + cdl_register_subpacket_handler(&tsunami_subpacket_handler);
> > + ev6_register_error_handlers();
> > + cdl_check_console_data_log();
> > + common_init_pci();
> > +}
>
> Two things here.
>
> cdl_check_console_data_log() follows console_data_log_pa from the HWRPB
> on every Tsunami board now, and this has run on an ES40 only. It is fine
> on QEMU's clipper, which I booted, but there the log is empty. I do not
> know what older DS10, DS20 or XP1000 firmware leaves in that field, and
> a bad pointer would mean a crash during boot. Can anyone on the list try
> it on one of those?
>
> It is also odd to have the PCI init hook in the error file. Titan has
> titan_register_error_handlers() in err_titan.c and leaves the init_pci
> hook in sys_titan.c, which calls cdl_check_console_data_log() itself.
> The same split would work here.
>
Agreed. V6 follows the Titan split: error-handler registration stays in the
error file, with PCI initialization and the console-log call in sys_dp264.c=
.

> The table sizes all match their masks, and the subpacket length checks
> look right to me.

Thanks for the feedback

Magnus
