Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202516;
	b=Pq51q8mDL1LFvEzr2GwfGOju4xMEzM+dsxYdCSDvNExPO5fBw5/6mM/z7KPpbErDspV3
	 OgO2tnuvCbsRacGF5veD1PtOaxMO53Y5S+5LU3X5mwcIviUG3xutxmsE4858KTyu61ZUH
	 gWOgVYD5M5ZKjYpZvOVpPCHJg3xiz0b1pKXzJohtQb1JgA9BdUUaTDGLVS9+Ge+p9pfLq
	 18CQhcMNSCArnZYIhb1CGFm7mNQCUELGl7/n8MHfxfiqNOuPpMHgCVlJF3jSS471im7NG
	 atUKcthPCM3QZkOj+UD0RBwej20AfqWco3uWRPzrpwuq2/TCYqCfcrQK9zH1BuQmwjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P2Gtmc+yPPyy4dGekEnPEtmKjhHWq0oqn8nEo9QjzPA=;
	b=bKtihx00MWaA27zlXAxo6nvYJU3o0teAgA8XVIcgOpMUoRLpG4EjoQsU5Y/pMxGHUNFs
	 i+ONXX77v3sRWk3M7Lv7+2Yv7UFa5N/9q2j6v3h0yIO9oVDcbyTY7eW8JxL38UUWdiACu
	 XIvV0xmshizd0Emvz+YqLPH+4jLKgwX6AveMpyefxCWNxIRLMHBXZpRneaGETovGB+osf
	 xFFDDVtRZDOVYEYWe9irI7B6UQJfs0DS1aDrWbyLnyKCPKdFiiZy7Sqfbj0waPW8ca/z1
	 6TstOdvd714FaRi2pqXUJ0xXRqbqzeGwAyfAJYNHuXIx9uvWh6cIFKOdjdyxOw9fqsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sR9JdKFc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23173606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23173606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sR9JdKFc
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso1533425a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202514; cv=none;
        d=google.com; s=arc-20260327;
        b=s/ay0yvE3SbLJmz7aBIqTkPmoUU8VNY2wMFT3EZAhGS7L+b3UFfW+lavDXIZ6lvZIh
         8/cnaNKjjVIKBiSbUsc5TPCm66kscL/We8JgqEep9RxcJn0AvbPky5tYZCAkZN4TUcY8
         24wWq+E6ST7O5eLr0MX/S8JyCWLJ+UUJZv4ygNNd+/Nc4OTFCKIVfj5O7F7KE5eixkaq
         ydYQ1jiW1krna5RDAZ6bOyshV8mL//5e+w2/IVy/Ws8iVSTgafmz3Vsho1BW5DbmKiVc
         RgciEHsPISNHkOPa/el+ky4zrXz/WMs2xnF7VgJju/MgBPaCTtubx5lOVVpO2xYstEoF
         G/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P2Gtmc+yPPyy4dGekEnPEtmKjhHWq0oqn8nEo9QjzPA=;
        fh=1aCSUXKsnyiQh+oXDuedirGonQTBLtI7VMjzEFjwEjI=;
        b=eq/ykcKM7yZloCWeOu/KuCe/Fs7MkNxoJ2Nl2mnUvz/1np7JINsbIpsJn5UH5jM7T1
         ruwjIfowMbhpSrbBVaUBSgtQqy9gh6CvMggaOcfIu4+RChtRhEzD6nrK7SLCv6g1TeYV
         WYqPQEuVPyAFgfkT+Eh8njE7vEFLaiQmR7S/uDzAv9rsM2roVMLwym2zPPN6FpNrKtBH
         qEujyN2YkNQTtQzYr/p0X99pAuhr7KSrxrZuTGCTn3o8dNM9O0H0r49PIAP98YY+odvo
         kbbWiftXCaultsi7TYV1xVLaUk4uAPVPaK/wKCXxdofhx5Ua0HJ9Xwt+NW8Vq+OMwo7d
         HYBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202514; x=1793807314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P2Gtmc+yPPyy4dGekEnPEtmKjhHWq0oqn8nEo9QjzPA=;
        b=sR9JdKFcgs0bpN4QkQ2MTdIADGBy0OfZK9Uc2xzngxH1OUHE6XPlgmotix5n04kE4V
         tKXhDVWcUi7R8x+WsSxO2XKULm2UrCLa5ugS8f2l/Nicboyg/Xq7P2T+CyBQwzwtUuSA
         00kvck2jyr72g40j3aOA8r0nVAnGYbDjdTazXmR+zx5OSZKFqq0rBsYi04jxNiTiLr2b
         b4k1CJpjGAKX5SIh8b5X0Vz9tLapvrzMIh1IAEh+zcElg7kBwxHx+E4aiBCISBHpzRVy
         sK/o6PxDR0wcadqZ7HwH7sh84bKXO5+wNcvDUBoiIhOwr2Otqj8bsp55EB6PBwliFnGI
         NU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202514; x=1793807314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2Gtmc+yPPyy4dGekEnPEtmKjhHWq0oqn8nEo9QjzPA=;
        b=ogGoWDnnI40cB+Y+gje8880PcgmHbaSG4W9Kgss2REHAeBEUti6XcAMisD8L+SqU36
         HPvCyJt2nQd6uZRxxu9dmnKLKdyrqarjdFFdDoJt3ZMFGRDNR0P89eDhbpmpXSc/w6EL
         pc2NuZLkp9u0VQa4gFzRV+QYIfWS+Zt1bvW1HrM3v0prWGhkW7xv4CkHTLxbiDWf3Y+E
         WELolWDV1Jd4kXG0L0cUSRBgUyIyyq/CcZi7317eZYE2cDwbBqcf6r3dJbKHEqan2non
         tSEuOgp9c0AiQF9wGT40yvMccDCiIKiNg9tDXjLJ+ecSpek2XSoS6ENLJKDzR1rIPQFj
         wMxw==
X-Forwarded-Encrypted: i=1; AKwUvBx6hf1SCY3LryZx8KPfFHlNNNpEFfQPu0rUVlozJ5Q0Bwxf4OqppvUNkR8+QfJWjKdbAaYTddGFRn9W7cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxtycrVrWutwyIvH25BGedZyiOzu2sWZTCjsqXXmxR8a/h3Cgn
	G7VqXaddTxsy+Kp+k/ce7Fk73+SFhpz5wgn78zyt7D+zG6YrbxDsLa+PwoCl+Yy18HLbqHFKZn4
	xq10mPPKFPpVL+p7h50HGiTXW+K7m/24=
X-Gm-Gg: AYBFou2RB34yg7BjuIOm0YIQRMTAuXaXKh5AVTyuHFRtLKQ8fqyBKES0j+uDhyfTden
	+ZlnME4aQuVs7dY9u/miklvbNcAY+N90+p/zCd3IBkNYd0JQgi6AN1MOgPtAIA+d50sQQkYCQke
	JJBU6eU6DHemP6ceJ9VwDLguRORP9b11gAnBySIew56VLwVx/KGnfUq6/yeDnL50DiwDlKxL7WI
	aTQjeunPAc6fOWkAG0ho3nMSx6e2QCNMBqnZVBOJ7YnN8BKe1CRX1jlTw0uHpJK0WE3zx12MyPt
	uoJj8PyjRNmLLpShiaRov7Oscwg6GVrQgOiFImBYjOm43e8gOPq/pMaFu8wX2JxzRpqBn8V0uEB
	XpdShR0J/hq3nKCr3wWxW+1EXqK6XSD/9+Og0rjNJNQnpRCZ42M9+WKIJd6j3CS0DaPWACw==
X-Received: by 2002:a05:6402:4414:b0:6b3:c0f2:eccc with SMTP id
 4fb4d7f45d1cf-6b49cbf6a9dmr2006612a12.27.1793202514481; Wed, 28 Oct 2026
 08:48:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <P4wUBaI--F-9@tuta.io>
In-Reply-To: <P4wUBaI--F-9@tuta.io>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 28 Oct 2026 17:48:23 +0200
X-Gm-Features: AclHuK8ls02xbX493_Bp1EqA0zzJpZtmFJofnLekSziZPblGB53hacKp5SDR2jU
Message-ID: <CAOQ4uxhT4i=UDvLmPAunehFujouFka8UKDCuB_exR4oSx_V01Q@mail.gmail.com>
Subject: Re: [PATCH] backing-file: inherit FMODE_NONOTIFY from the user file
To: Edvard Conrad <edvard@tuta.io>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:32=E2=80=AFAM Edvard Conrad <edvard@tuta.io> wro=
te:
>
> On Tue, Oct 27, 2026 at 12:53 AM Amir Goldstein <amir73il@gmail.com> wrot=
e:
> > Any chance you can post this as an LTP test?
>
> Yes. Written and verified, I will post it to the LTP list shortly as
> syscalls/fanotify26. Two cases: a mark on the overlay only, which passes
> on every kernel and keeps the test from passing for the wrong reason,
> and a mark on the overlay plus the backing filesystem, which is the
> shape that deadlocks.
>

Great!

> > Urgh I hate how special case this is.
> >
> > How about something like below (untested)
>
> Agreed on the shape, and it covers backing_tmpfile_open() as well, which
> mine did not.

There is no code that adds NONOTIFY to backing_tmpfile_open()
the only code that could add NONOTIFY to backing file is from
dentry_open_nonotify()

> As posted it does not fix the deadlock though:
>
> > -       f->f_mode       =3D OPEN_FMODE(flags);
> > +       f->f_mode       =3D OPEN_FMODE(flags) | fmode;
>
> Five lines further down init_file() calls
>
>         file_set_fsnotify_mode(f, FMODE_NONOTIFY_PERM);
>
> and that helper clears FMODE_FSNOTIFY_MASK before it sets its argument,
> so the inherited FMODE_NONOTIFY is dropped again. The backing file ends
> up at FMODE_NONOTIFY_PERM, which is not FMODE_FSNOTIFY_NONE(), so
> fsnotify_open_perm_and_set_mode() does not take its early return and
> still raises FS_OPEN_PERM on the real path.
>
> Measured in a VM on a defconfig + OVERLAY_FS + FANOTIFY +
> FANOTIFY_ACCESS_PERMISSIONS build of this tree, with the reproducer from
> the patch and with the LTP test:
>
>   kernel                        reproducer    fanotify26
>   mainline                      hangs         1 pass 1 fail
>   v1 (fs/backing-file.c)        ok            2 pass
>   your diff as posted           hangs         1 pass 1 fail
>   v2                            ok            2 pass
>
> v2 keeps your structure and routes the fsnotify part through
> file_set_fsnotify_mode() instead:
>
>         fmode_t fsnotify_mode =3D fmode & FMODE_FSNOTIFY_MASK;
>         ...
>         f->f_mode       =3D OPEN_FMODE(flags) | fmode;
>         file_set_fsnotify_mode(f, fsnotify_mode ? fsnotify_mode :
>                                                   FMODE_NONOTIFY_PERM);
>
> One deliberate difference from your version: it inherits only the "no
> events at all" mode rather than masking FMODE_NONOTIFY out of whatever
> the user file carries. A user file in the HSM mode (FMODE_NONOTIFY |
> FMODE_NONOTIFY_PERM) would otherwise leave its backing file fully
> silent, suppressing the events on real files that bc2473c90fca
> deliberately enabled.

The problem is that I wanted something more generic and v2 is
still very much special casing NONOTIFY and much bigger than
v1, so there is no gain.

Let's admit that I gave you a bad advise and a wrong sketch patch
and feel free to add to v1:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

BTW, pls remove Assisted-by it is not needed and remove the
newline after cc: stable

Thanks,
Amir.
