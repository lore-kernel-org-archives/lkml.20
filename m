Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD335B125
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748097; cv=pass; b=dt3YQVnf2MKRXIPOBtf8PIn5WLtoFYF39nzlLb4tGhG4HCEdx0j8xoTZ01b7axtqTnuluQ0zJKMuGRRfeMXy8ygPLSKF3ycw8Bgrd8Q3IBIEYTHktkK5vdwh5up+F25eR2fNZuIvapuQoBdKfuyv8X7q16zxiy27j26F2F7zHPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748097; c=relaxed/simple;
	bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDuzCG5BTBDKRPkBfx+jyL2+0zE3t7TI/7SqHWx+S12NmSmXXnXGhv3bpPE1YJCQ2VWlhLEjOwBL5Q9Vc5g+xcGe8voEEv8g2h9/TFf7BwDdxtNEh020etIVIOVuIopmv0HoGZHrxB13o9enYp8phP7R5mAciIX33TIqf6CyfTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2w2WyCC; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2w2WyCC"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea1cb2e4so6123654a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790748094; cv=none;
        d=google.com; s=arc-20260327;
        b=JQi2q92H4g2+VDC0yOhhEInkreq92dZGRQibt6TO5NTr/yJAyvV8PNlwV0NOZSzZj1
         2cseaWqLJU8UTraTeVYViwBuozxCGzSC6kAQ3cTlsdU7CTczgalS5PIZ77fjvDxZxuab
         d/kxlQ/uL0lN5gBLyyGtwaeCItY7N5SWGy6xYZdH/UkUrDc7Oy6at0O023Z3o6Qd1RcL
         ebihceLjs0r6G2bxM1rDe4D6xhzAUh/vTMJbdC48Hm++Vc9hnuxSFev9rD+c77EWh5B/
         Mv63wxEW9fSNaFd8te5j6Mz2MXTIU4aMW44YB/gXQBaIiUadgmDsKxHvLFuTpnFoLEPX
         J3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        fh=ClF4HuVH5n0zrrPr+0z9f+3V7eeMxHVJyVeSAzW2oT8=;
        b=LJKr401+8PPWp5yYoXcuLR5r9PImEI9P/tSCrwnS51/Jr0HqDerVa4mLFLarjAebHg
         rgxBuBJvVBbslzPquLIMVUn3aNxwjCCDK2OvFzyuMnLCgBdMJ0L2CUpYgDo7wl67l6FF
         xwnkEkKHZnACslXm8fv6R9FzkYxbZSi6n02oERlERXDaLtdEjZPguUS1COZNzP2HGIEA
         GT/CVx0msD3zZ2NeHVxz9zdS2ElIhUZuvusajhMBG8siU+uye+jBEP4aBiddElsrLjsk
         pF6jtUkyFUxj8MMo4669CSjrkrxaGtQ6P9J4v+9VkhX9uQqsge9ThX90tbOyfEdHSjbs
         MFPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748094; x=1791352894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        b=J2w2WyCCeWOVNjJoRf4knmvAJZwYoof9Tfmjv75e1CljA59RiJx1hu1lbG8BTwgoFl
         hbcCg8q/PnyvW9cwwjmNsAIp92ppA1DI0nE3enbDCjkSEoHYK8SlVyuRzKJitMHOMTze
         i7vE5erQ4su9J6kqKzG2iOWaa6LU6qxZZ1obGentJq7Yo1P6F7gRfaq8WHccVW2Cf/3C
         fzulCkBt5Hh5wNrprRceeU3SV7dPN+vIVVvq9MJNrNQ0kk/4Mc1RzbLi4Jw62z7necy8
         2M8A/mNgPnPkcyYcnE5an43tYcX101irky1Av5MkM+1yWW6mVPQQ0rr5wIXbQgd+XRZi
         2AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748094; x=1791352894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        b=FQU+aLU7fxh2jeRnlkBLEOvvbxwSoO9ah+aZcrUY2Hizy7v3Wkr5b2TKwTCJ+3i8AM
         NFaP40/In3GTsrUSSEBhQjFSFQAMkffPpOuHTcIQh/eZo9coKesUYPb2PsZu8qRCrn3+
         ce4RZNQhFDlAPbNYBxIf7iB5044LTI9xSGpLurW2GlCCu0cpHPpFTt9q+z1EcL0h1Vux
         azZAeRrESqNxlijUywNPrZrf7u67lQ3Ph7WlMrmWINU3G7Oh931OWP+ZKbqQsdJTkLef
         /1MdGl/sriesNVNg0AN1zZDI3UKdT2rKWDDsvot+pxohG2u4MWB2yEuFVU1cPYDFaw3r
         7+4g==
X-Forwarded-Encrypted: i=1; AKwUvBwnCNbC/s6MefiSYUCrhMuW4F7+RSiiyGezYbro5yxEH9A9VRSqqmkEwy0N8mW44ykS2QGWTJNFLL2RXzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKuNd2f2INxCxf9RKR1RV0yz62gjouCXJruEybiBJLy85eNqrq
	4vO/2lTOL+PcFtoT8e0ZRB7ZpFw9wS4sgpCXw9rjL1LDEymvoveoLzXwRk6BojdH16wvUPzbXAk
	+z4pmsA1fhtwf7RBWw0Q9hweqULxDnclmP9Ud
X-Gm-Gg: AYBFou0yCmIY9AVBPeG92XMWAFaGstHrEzdxEsGlZQ/Q+XWwSUMk2x5oHPkPcmzdeWV
	8esegm4IkDryAWKov/GMVyKaDJ0PG+/dC1LiDqDx4qQPUigG3bG7lhjA06aVgbz9E9/qAK6WeDS
	AsWTIFvl8tiqiKYW9xyX/kulU9mPS8GqOsD6QSQRl3uqwINb7jEo7h2hbFNCjSaEtUkEZeXP0ZQ
	AzmZw2vc2EBgYZvYdzTxsstBdkX96Eg7joOY0S27AIWOdm/j+K1naK6R6gbbz0v27r7QKxHquqI
	nfzlKWn+4g/nrvTzl0dAEOb8tTCB65FiFMz7IrADgp4PvkiJBq037jXmFdP4Pmt82Os=
X-Received: by 2002:a05:6402:240d:b0:6aa:b341:3f9a with SMTP id
 4fb4d7f45d1cf-6ae199552c3mr84751a12.39.1790748093339; Tue, 29 Sep 2026
 23:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
 <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
 <CAOQ4uxj4xQ9Z=9JH=U21iHnfLBQLboz5dsivigKicWS22M+zgQ@mail.gmail.com> <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
In-Reply-To: <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 08:01:21 +0200
X-Gm-Features: AclHuK-4L2-xB50QQpUyCJRdrgV6J6jaFhZT4eTld-X9LxMW38Hfe-Cy2gWP4SU
Message-ID: <CAOQ4uxiw-=keqrbFsPSAz6USCbHe1EtpjnGCLsRe2zXsXMeEog@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Russell Harmon <russ@har.mn>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:55=E2=80=AFPM Russell Harmon <russ@har.mn> wrote=
:
>
> On Mon, Sep 28, 2026 at 9:54=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Mon, Sep 28, 2026 at 6:04=E2=80=AFPM Russell Harmon <russ@har.mn> wr=
ote:
> > >
...

> > >
> > > If I remember correctly, name_to_handle_at on a FUSE filesystem
> > > contains just the inode+generation, and open_by_handle_at results in =
a
> > > LOOKUP of that inode (and now inode+generation). But I'll
> > > double-check. Assuming my memory is correct, I think that's
> > > sufficient, assuming that we consider inode+generation as a unique
> > > file object identifier.
> >
> > The problem is, that what you assume is not an API definition, this is
> > a specific
> > filesystem implementation, which happens to be correct for some commonl=
y
> > used filesystems (e.g. ext4, xfs), but is not true in general.
> > In general the API {name_to,open_by}_handle_at() the file handle is an
> > opaque blob.
>
> Maybe I'm thinking about this backwards, but we're not talking about
> "any" filesystem here. We're talking about the FUSE filesystem where
> the definition of a handle _is_ inode+generation. All I'm proposing we
> do is to expose that fact to the FUSE userspace daemon.

Correction.
The generation is exposed to userspace daemon and to the kernel
via the LOOKUP response.
All your patch does is re-validate generation in GETATTR/SETATTR.
Practically this means that generation is validated on attr expiration
time. This is a reinforcement of an incomplete id model, but it is a bandai=
d
not a cure.
I fail to see the real world value in this change, so please do explain it =
to me
in terms of use cases that would be improved and by how much.

> That daemon
> can then turn around and call open on another filesystem, or make a
> network call to AWS or whatever. In my case I want to
> open_by_handle_at on an underlying filesystem, but I can solve that by
> storing a mapping from fuse_ino+fuse_generation_num to
> underlying_fs_file_handle in my database.
>

Exactly! The daemon does not need any changes to FUSE protocol
to have a perfectly correct implementation.

If you can demonstrate or envision a filesystem that would benefit
from your patch please describe it in your proposal.

Thanks,
Amir.
