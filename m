Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868233;
	b=FoMbEqki4CIfOFV0nB/h0IhcreGnxKRYMWfhvGgByNtlDsU8l8dcprWn1tw+XMIDVQ3k
	 719gsfxEXs4V7W2p8l8+JmpjvanjSQXcHHn3GLv5uR8RamU5qcaA7WWIYreFv32i/0U+d
	 J6/5LUtj9Z1pJd0fu1hXwTsUKIJ7D196bndU/IrcYABaHhOtu7WP48O5yb/HWQxmc8Rop
	 yHtH/B5BrsoNfQMtWeI+uerae0t7VGUrSWZMThdi4IMDnnFR+s6dy7mTIt4ETRbUlWR/I
	 gdarAbf4rfasCU4FNmsLmeKTdrrnwU0oSzlBk/HsylSxpUNBd2Cb9bSLF//TYlFe1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=rW3ESA/Pw6NBRNjjr1CoW7LIwEGVqJDSBwtIbvXI1MI=;
	b=F62NBhGMFykU+vKNmdQ06pbE+3io8DcTvaMFuLTsKEBZZTyEgY0asl6YMfDHQfz8gSa9
	 tGf4mWlRuEqIceHkuqQ8EpnPr3B/f8eJ2K8hi1967dOy0I2fKs2biF0+R4wvEfXBZX709
	 dF0RmCgljurUVp2o8fI6HBGhB9O1Leire557efUSPI/PNN+lLELusRSF4vJBLmQ5XrbYh
	 Kr3j8tGrVpDuK84nMCQgmj/CkWxfRpI/me4NRL0bCmGUH+clT1dLVaW1pGpDp3KuERf8z
	 BxjuS1rvKZK+h81uLoSAnn379jQDbZDW9hd7qnRW17HQayKWLlBDYXC/g8eg8wcv+iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ePEMFT1J;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B7606A880
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4B7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ePEMFT1J
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c246c0c60so373057d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794868232; x=1795473032; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW3ESA/Pw6NBRNjjr1CoW7LIwEGVqJDSBwtIbvXI1MI=;
        b=ePEMFT1JbNVEwg8trrBH6LbistNfZoq4UZzQY1bT0hce648cBczz0Ti/xGHKUvrQVG
         EuaTGBAsBmuOKGx1w+BHeX+9o9ToDDHUPjbHmHsUTHgW1RXlRcrnO1S8oVOFbDyKVj1Y
         cSq+u476iZJ7MipyrMKpSznWqpSuiZkJ7AvSsMebnb2RBgtS5ey/skjjvoak+jmRvI+X
         JTLm1uZiOoigpTgjmteSC54C6MdFnQX2dlTyBpUC71bg2tQl/x3ge3ec+MlILkYZkmvb
         0wDVV1H7i6ir8o9Z1ze52/ejit7OuyHp9kvcpQI+ZiHMcZzCZwi4DoWuWOl9vak03PCb
         4ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868232; x=1795473032;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rW3ESA/Pw6NBRNjjr1CoW7LIwEGVqJDSBwtIbvXI1MI=;
        b=WvCkfMnujuJmBTe6ojG1wvbW9AqoFXj1yIP0viuRa3WG9Yqfd2pzY6Tl98WJwM0OdG
         kEGRUIDyO7ejIfEKQg7PtV2Lgfyi9OIj+wSxT+ZVeu7rjh6fDqXEuzJaykJSdxShpjjH
         oaI5Botad8LtggIraxdeQ93ch0pQXw+5nQgJqw+0emx2Lb81kyWbA2l+XRYU1dsxRwUe
         Zoc2NxX0q7lGHr+drunMha4LU9jfBx89FsUVBeRuvB0J1+C1kdtIdIeKNsoPq7SX/UIM
         aFJVbNGyvR3Bpk5coqHQr77JJccCnLxy3YjGaKKTJjy79knidhB2VmJJl2E+zuka5tG7
         x2zQ==
X-Forwarded-Encrypted: i=1; AL+hErGLIRQyT6pGQWvKLVHjIGdJnboy2IHTkWQRUoxVGrsgZVkiP4K1pu3lFreWeLZsvh9r7ilb/gD6akXzsyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r+XOiTS2CPXG9JDAn6gGv+EoVcb1ckyELMidUM11HASt9YDLN
	NIqA2AyVtEqXNYFwITbZyWgm52Nx+HBVaq1OeaM7sQKu1hYV3eIeO599xRyMrleB9Sk=
X-Gm-Gg: AZFdTZcpv7LiR9mnOnim7UrSJK715fqSi/t3lwqngsjB+sGx9tNcMBLgfeaVqBv7SoY
	YCeaiE8eUNuA2nH5bqRlbQOuQq/PfU5MYpWaH5QyY+cCgKnrLrySq92g2tAO3b10fjPCn2GE7mh
	LS9t27EDtHqURwuiTWYuTAzf8MGDclaW3CxXBF6viS2uMuko9Ez9AbuDwg9AwdKfnqG5ZEJ3v6L
	UiDISg4PEOkT0fnyuwlE5mrAqjqnLBHZ26ll/9d+TySSZtjaVOdshfKuvoLhG7iHxOJ5sUMG1XR
	MgVn5n9xKH2A4vcfpOpKf2KiVZjfJlX4IVbdDC2eTpsC1/gthmhDKDbTSRaubtcIyRdBSGBVa1d
	xSZSBRaRq07znj7L/O8uH8VPLQl1lAxVgJu8zGp9G9XWc1yAn5g1JJFPY+I3uMZic3iC/2ny2UA
	Vytqr5UL3eW17wqevm5C2gX1W6jjbCWvOj2Kv8lXv8XaBEJ6B065KUKQx4/0Bo/CSgQ/FtyF2St
	AlBDAHqp2L//rd6Xq138SePpoWrb7b32mbQ4IvcW2z4HMtyBWWuPrP4y5xMlyK2t84rF4yEErk+
	R1/JrG8iuOt7Dk+RCEBnkoCdFkkCvtNs5eFzvuhWII+S5tbsAZv/vbFP9qeuljzSSMDTSi0qWDV
	UJEbNwVC87N9ZaaakSPCMslEGrIQFu2ggC0obfSedY0DCpK/KfTLMua73lW1mDTB2+wdSu78=
X-Received: by 2002:a05:690e:e8f:b0:677:c281:d685 with SMTP id 956f58d0204a3-67dc79787a7mr469334d50.34.1794868231774;
        Mon, 16 Nov 2026 14:30:31 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:48ee:a3ac:5a4b:3831])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55b08fsm11136160d50.7.2026.11.16.14.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:30:31 -0800 (PST)
Message-ID: <446748647839fd554246a78d72be728069b44b7a.camel@dubeyko.com>
Subject: Re: [PATCH 2/2] hfsplus: do not end readdir at i_size after an
 unlink
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:29 -0800
In-Reply-To: <20261114125045.466604-1-hengyul@cs.unc.edu>
References: <0205ef88738917a6d307b4e334e2dd1b0851317b.camel@dubeyko.com>
	 <20261114125045.466604-1-hengyul@cs.unc.edu>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-14 at 07:50 -0500, Hengyu Liang wrote:
> On Thu, 2026-11-12 at 12:44 -0800, Viacheslav Dubeyko wrote:
> > Frankly speaking, I don't quite follow what is the issue of the
> > fix. Do
> > you mean that we create and delete folder in one thread and execute
> > the
> > readdir in another one? Or do you mean that application has several
> > threads and one thread do readdir but another one delete file by
> > file?
> > How this deletion is executed? I mean which files are deleted?
>=20
> Sorry, the commit message was too short. There is only one thread. It
> reads a part of the directory with getdents64(), deletes the files
> that
> this call returned, and then calls getdents64() again on the same fd.
> This is what "rm -r" of BusyBox does.
>=20
> > Even if we delete files in folder then i_size is dropping
> > gradually. If
> > we traversing the folder's content and ctx->pos >=3D inode->i_size,
> > then
> > it sounds that we already showed the existing content. Do you mean
> > that
> > if we deleted the range that we already processed, then we miss the
> > rest of undeleted items?
>=20
> Yes, exactly. ctx->pos counts the entries returned since the start,
> and
> i_size is the number of entries that exist now (valence + 2). When
> the
> entries that were already returned are deleted, ctx->pos stays and
> i_size drops, so ctx->pos can reach i_size while entries are still
> unread.
>=20
> A small example is a directory with 4 files and a buffer that takes 4
> entries:
>=20
> =C2=A0 getdents64() returns ".", "..", f1, f2=C2=A0=C2=A0 ctx->pos =3D 4,=
 i_size =3D 6
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rd->pos =3D 4, rd->key =3D f3
> =C2=A0 unlink(f1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i_size =3D 5
> =C2=A0 unlink(f2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i_size =3D 4
> =C2=A0 getdents64() returns 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_pos (4=
) >=3D i_size (4)
>=20
> f3 and f4 were never returned. Before commit 4b0496432844,
> hfsplus_delete_cat() moved f_pos back for every deleted entry before
> the saved key, so the second call started with f_pos =3D 2 and returned
> f3 and f4.
>=20
> With 1500 files and a 32768 byte buffer, the first call returns 1022
> files. After they are deleted, i_size is 480 and f_pos is 1024, so
> the
> second call returns 0 and 478 files are left.
>=20
> > > +	bool resume =3D rd && rd->pos =3D=3D file->f_pos;
> >=20
> > Is it possible that rd is NULL here?
>=20
> Yes. file->private_data is allocated at the end of the first
> hfsplus_readdir() call that stops in the middle of the directory, so
> it
> is NULL before that. The current code has the same check
> ("if (rd && rd->pos =3D=3D ctx->pos)").
>=20
> > I don't really follow how the resume variable can help at all.
> > Probably, I am missing the case. Could you please explain the issue
> > at
> > first?
>=20
> resume tells apart the two ways the function finds the next record:
> from the key that the previous call saved (rd->key), or by counting
> records from the start of the directory with ctx->pos. It is the
> condition the current code already uses to choose between them, only
> computed at the start of the function.
>=20
> When the call continues from the saved key, ctx->pos no longer says
> where the walk is in the directory, because entries returned by
> earlier calls may have been deleted. So comparing it with i_size
> cannot tell if the directory has ended. The patch skips the three
> i_size checks for such a call, and ends the walk when the next record
> belongs to another parent or the catalog has no more records.
>=20
> A call that finds its position with ctx->pos (the first call, or a
> call after lseek()) keeps the i_size checks and the "walked past end
> of dir" error as they are.
>=20
>=20

Frankly speaking, I dislike the resume variable way. It looks really
confusing. And, as far as I can see, you used it in two/three different
contexts. If I understood correctly, we are checking three conditions:
(1) Is current position correct? -> rd->pos =3D=3D file->f_pos;
(2) Has directory content processed? -> ctx->pos >=3D inode->i_size;
(3) Is it last directory's item? -> err =3D=3D -ENOENT.
Could we introduce dedicated inline functions for these checks? The
code will be more clear and easy to understand then. What do you think?

And, please, explain the problem with more details in the commit
message.

Thanks,
Slava.
