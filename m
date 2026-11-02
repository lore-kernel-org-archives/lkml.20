Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632195;
	b=EQo+0uRs7jTDHjoOR1pUDPxrI+Rn4CaNYcMEx7H/4YjGjgMFzBEX1RxLqTJbgcmPPLRs
	 3Ta14IdCHokCGEHKozQXWFRp8HhmeuX790u9FfLU8+ww1UqMYxrfukJEojZTFu5x4d2gR
	 Laa88fJxoIq5gsGEk4B/JLa2E7rBUWtIsDsPioKDokAB2R1s+k42InuCqtFsoYYyiRNkR
	 0EEMTXVE9KCXAPHYtJwUKldeLpGX5+D1bkjf8hG0LBPjrmHk9/iQ+JUWJzq1+laRrYuxS
	 5k3lrqQcwBgi+5JXfdk8RbMvxsilWhepQypFqqVwdPbAlbdbV6IOIhJjpP1GZMiE0dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
	b=2RmvY7P1fb8r4MWyEFumRdHpNTT8+QRaZc30CZp0R1fju7Ou92eE0Awke81+4psz4axU
	 iCLG03D4BJFSceYP5ZCgUQwz7CogcGC5MVvua+4igULK0CFTt/zzCEv246raTLsddd4l7
	 y2KhzsWVVRM5D1afncwZfjuf+GtXWnGi11w35P+NSBW5MdXsG/1Mdj0SIs3KNF6vHGBG4
	 MTkvcdQ2EOOubaI04IlCWYSVZ5U/MDAZu+Gq41/H9U0RONdNEIcWay6PrcqJGPJLjJlGP
	 Y+aFYPorJ+Iu69ziJds9W1wrnda4i1nObwtYVdPWE536RyWGsRYuf//Y4ULzZJAinzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIOy3AeV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E0606B1EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813E0606B1EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIOy3AeV
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso473493166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632193; cv=none;
        d=google.com; s=arc-20260327;
        b=Jtoqttz048iO5sukxJRPDieMIaf11fXpkTPzp9aifAuBSjCtVD7kwh6AMtMzvC0d8/
         8HN8oii1xH87f+1O1TW7sZGXH5HB2mtqWbrjNehJ2uKvmGTpN209s+tikZk0S2568Hxf
         8uXdpoGTFc1ivE+RcR3mcY5GfMuspsF7XXEd4n7JOPO3aizTz9VjTjst750vNOzWf19+
         QLR+IcbSBkqZmixbbj6aviIvkcipUiaf0sBcCLfGap0oycdnmSGjLAAMdzcydm13HI9R
         +tXuvWUSz79rWkxgvmNse9shc5wd/mxHE2fIZ0H9jWWTHfeQk3qwccloCiLx6ZDSHRxy
         mL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        fh=uKtCy7gL3vszbV/iV/rK5Kn+8KrfwxLMUqLjh08z8gk=;
        b=LqE/Oo/8e6/oJZzJ9Tr7JOvc++5iPDpfXTMru/PzZEUCyFg84JmSWsAYjSF2AVuOSG
         5fChDx452MiwHlFKPqhZDPicCfSYgXy4CBxljRotM48bkG4D3XqJlXUcPU0AHArb+tJL
         KEZw4Q73A8xY5q5PqSDyiqcbsNHFKXXZrFJwYHwiLXJgyrV/6g25qmppNOpYlj4xpnKh
         htFSFXg923DMcow/pWpQRg+QmwEucfNvh/oJKEUQuD5gAZk9fU86Hix5OMSib8InCZEX
         arfwdXpFKxspwydj1BCnLzYqLROO/f1GFXDfU83Qc7+9vHgqkg888VPAvcLobZIM+hY8
         nT0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632193; x=1794236993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        b=mIOy3AeVsuWhyP+l6zA16Ucz20Y+QphUxMILOJk08HJCRUJzanCmGGCzgIzPsgBy9o
         LyJ8inTq2q9yWhRw7me/r58dVxm6liirJLCxwEY6460lx0DXcEkaqlFP8OV8YCx0kFoM
         HoE+n6yR9RitH33XexK6Z6cy5cl3M3o2JG9Z1WE6aUBM6ZsP/VxlHG534TLHDnsUaare
         jMFzjt20DhnmU8TYEiyotX5hCQYZdGjSym2gUXW1p7xsUyYH1XtX0iiA0HpEhiNC0u/o
         zVGFyTi7a55y36X4lQNFQ7NoXmL3GN3UjbePDGNGL779i91M7RqsaBxPOULjaqJU/Hek
         kMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632193; x=1794236993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        b=qDAbjkZ9JmTefLfiVTXl/MyJo/ylVo6kMmnuRCL1Rm8ymgkDLUMv9/jeYsAYW8Krjk
         +JJPBnUvobNRWb7hWK6kx0aYXSL5mh7RD8id31WXUdWbtZsiJe6KF0lxH7+a8zbyG+XH
         GMNjUMqBrqEi90zw2rBePEUHOVaV9rBHVui8M2mmkpTDslI2RbGp0b99UrYJRVl2GkXx
         Qga0txgSoCxQRUg7+Zg2o4xB6OWAP/RtSAcmsxUj1MwN42plVVKKDTfDqbffGFFsgv+y
         4Wa7tBxMxSiFySI9+5ASTM/RM90GIpE/iSbpASQOg8biIqpxubRrkpz+0NeK4/N0XJOT
         bTcA==
X-Forwarded-Encrypted: i=1; AKwUvBwdKgGy0H5bNVNK5nmJ7yzTogzg455teWAERjUl56po2gbQCQunbkvOs7I2Hp641HLaFlSxFRphAsciBEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xFI0gr1eKw/57/DocnzDaaWC5PHCTkSF/6PPJG6Fk2RgwsIoS
	ZEAQW9OLpoZzVl/PbhseoGLMzLrmQVlCUcyv0HkYXI7knyLF6O6QTzkZKRO+B7gCP4eAB9QaFON
	V7IZNQ9/wrTp2w3kjBGsUcmCfI9MGl28=
X-Gm-Gg: AYBFou3y+ihP+uFveXo3p7g92smEQ/9VExM6H4ylvtH73PwlMGiXvg9LiM6R9VRKHxc
	oyI4bCEW/8sKEjI53AGy7VuW67XjNkRHMDPS4TCXe3yn6Opv49neoPtiVXoeCxysSh+OTSWJ4rW
	JsNJK5vwYlJw3loqkZm6mr38lzDrEyZ8jQ3aWeI44ocHftHyVtQJLlo2bWfUQSNWoOnarVkDAy1
	MR5BP6Mt2idL9NpsGQU5Nq5DTln4eSvb5CDqqK72OFVU6br6IhelcCQCYjFsgtEohFnsUzylqi6
	bAOWaQInh4JRX6X3izufBuKVNSIG+By/wJt60uBSpisJC/YvvF2Q99VXoGpXzu6lZ375EcR4mfo
	6Cuzbyx12aEUw88vyx/2qM4Wb/gdI34OrQkjasm46lLTu3t7uSKmzF3m3bE/Mlv8iUi3O1g==
X-Received: by 2002:a17:906:4fd5:b0:c46:7fa4:922c with SMTP id
 a640c23a62f3a-c4ca7b20e1fmr868205166b.24.1793632192478; Mon, 02 Nov 2026
 07:09:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-4-koray.fra@gmail.com>
 <20261102142452.d6jkitgdeuquy23i@pali>
In-Reply-To: <20261102142452.d6jkitgdeuquy23i@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 16:09:41 +0100
X-Gm-Features: AclHuK8kuq8eQ7yCdpsnJrZqU_PhMlxnY90gMXEz8lBNnkHZ5ogvsTJfHTXbOfo
Message-ID: <CAOQ4uxhQ3uhq6s+4deEJAQV5iy8QZoucojR58_dUNYrnjt_yvA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
>
> On Sunday 01 November 2026 02:55:49 koraynilay wrote:
> > @@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idma=
p, struct dentry *dentry,
> >       if (flags & FS_APPEND_FL)
> >               new_fl |=3D S_APPEND;
> >
> > +     if (fa->fsx_xflags & FS_XFLAG_PTIME) {
> > +             ni->i_crtime.tv_sec =3D fa->fsx_ptime.tv_sec;
> > +             ni->i_crtime.tv_nsec =3D fa->fsx_ptime.tv_nsec;
> > +     }
> > +
> >       inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
> >
> >       /* Save nodump flag to return in ntfs_getattr. */
> > @@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, con=
st struct path *path,
> >       if (unlikely(is_bad_ni(ni)))
> >               return -EINVAL;
> >
> > -     stat->result_mask |=3D STATX_BTIME;
> > +     stat->result_mask |=3D (STATX_BTIME | STATX_PTIME);
> >       stat->btime =3D ni->i_crtime;
> > +     stat->ptime =3D ni->i_crtime;
>
> For me this patch looks dangerous. Somehow I would expect that the
> "btime" will never change for existing inode.
>
> But because the ptime is mapped to i_crtime and ptime is settable from
> userspace, with this patch it is directly possible to change btime.
>
>
>
> I was thinking more about it... Is not this just misunderstanding of how
> the security model around the times is working on different systems?
> Because on NTFS there is stored just one field which says when the file
> was created. There are not two fields like "time set by user and time
> set by system".
>
> Windows security model allows anybody with WRITE_ATTRIBUTES access to
> change that create time. Linux security model does not allow to change it=
.
>
> NTFS in this view is just a filesystem like any other (ext4, btrfs, ...).
> In my opinion if the ext4 or btrfs filesystem is correctly implemented
> on Windows systems, then Windows security model should handle it in the
> same way like for NTFS or exFAT. So if something grants WRITE_ATTRIBUTES
> access, then Windows should allow to change also btime on ext4 or btrfs.
>
>
>
> On the other hand, I understand the use case to have two creation times.
> One time which would never be changed and could be used for any kind of
> atomic / synchronization by userspace application logic (this btime).
> And another time for human which can be changed at any time to any value
> which user wants (this ptime).
>
> In any case, I would suggest that filesystem driver would not report to
> userspace unsupported values and would not try to invent other values
> and lying about them.

But all those fs with mutable creation time already report it with STATX_BT=
IME
so what can we do about this?

If userspace requests both STATX_BTIME|STATX_PTIME in mask arg,
those fs could technically return only STATX_PTIME and it should not regres=
s
existing programs.

But this is still a bit surprising behavior is it not?

Thanks,
Amir.
