Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343442;
	b=TRFqokhxJpEa7MJl7GZDoodkC+cgBbq00xpaeFsR3f70DjDR/tDl19Fbs+uJo/D8CzVE
	 //V4HIMYy9HZ6w6d8eEP8A6pDsgecdr9ETisGYIqItcy4j6VKPZxw0DdbtYF0Ul1poK0y
	 6OpHBMMgGpB2Wr5WSkSqIr4Tlrgq0YADdmjmkzMFuHSGWMiHDBSRbuYzlEMOuExTC5wa3
	 +wRkFJEO0L5b+/cb3CufiWM3pixhNedKr7UHgt6BUMwx4Sd41wKahGkXmqB8OL/0DuERy
	 9R6GtIc1x30WsqgKIFlCQ5we0HU6+D6Nx8v++aAECMhjEBlGX8ARTjNyAmVM2GXTWCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
	b=jis7bhZ3y14jV2nBCkFTES77qGN3YV1llzj6VPDmkJZACKcxwGHvu0pQYXVK5e96aqqr
	 wcWj8z+Vg1gNBbpIUG00IC2V0Wthbe7mIaZDjEFvIRNniGbH23F7OGfTmmXGiNvnJDpSC
	 pmVr5gbhpoPLszvF81/1A1peQB+5jq5r55QoWKaDFZyt1SGcS5ibgJDICim5RJhY+Tiu2
	 gx0m0q26mJ2lR0HTvw8fAW/7yKnfbaOgrgju3HKUaKXtuWEKqvJ/W110emSf6tdU4N74O
	 sqJ7F3PFq4kFj/pBfrBpMnZYwdhexgeM8ukgqN5Oen6j0uNjJ51kx0bJh5lDgI9wDQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ef6hQC/u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8412606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8412606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ef6hQC/u
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so22008755e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343440; cv=none;
        d=google.com; s=arc-20260327;
        b=L+LstZcji2O6KSVv6RSpS8dJAvBD9Zqwu+hCr90wiIvbZgyvg0I274KmNjpSswCBHN
         TG+lx0F39/06IOX/PPvczsWdRuZAtk9hrL7qPVof6Tn0nHcd1SMjMZq1tfvPUdDhL36j
         rbd5eHwS4x5HC7HlQ+cE8GSYlWyLQK09OUhibdFSj6/ZnzXKvZ0wnkT4JhgIh/+b0Hnz
         r1pkNT/4Jem4Spo+i0Qiv2ywBVt7SUX7eMMJEAQMtQeuqDzBO4EiLiT+b71jghK8KZjK
         8oFHvNV0kJoDQoJSTZrvlk/W2hWVoznVSi1WjtCGARVVsNhRyBSr1FO5ri45e/HQXdG/
         n0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        fh=T+egsEpQeKmyxz4cpseo8KtOXl9t1ySil9Edq3x2awM=;
        b=h36i8X+PgRmsICvbGFs7TfsU+dPd1F9g0mXTA0fSLJkJr017lrLkPh2j+r/s7fvU3M
         3RsJw6kT/lnqHXKO67Ewvpl6gc3gOZdLTj+J2zCqSVD9EzJ6rbvun5MTSJ24wbTfptvM
         SRq7ce2bphwikOmdHnH1DoTUlVuSFwK5A4cUEcdGuCw1iALaKkYB3JBUT66r6UyEeMOx
         kM3jamr6iNhB43Y5mSVIz87tNas4tq04EVq8cfayUsbo8QJsgcxbyAon/PhDLCTcJhU7
         dlH3inFX3Q7fi9942w2xxN7f1oi4MK+5U55u50zB8TJ9bzOIlUQA52pS2ldSd9FneAU5
         XZaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794343440; x=1794948240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        b=ef6hQC/uSVy9ydem1JLqPW7Vd3y0dUQg/gsHXvcfGN4D8Y3eL1yncC0OmJSA/nfdKu
         FUtmqhY9UtVIq+ypvvHig7m0gg76e3P1c/CX3LREmGszKXLR+9QXsHiQ+dZ11CmSzNzS
         GmJU45hQltt5B81++O8M/FJB4IPRcnyTP9SuDS4PYNgOK90SJ/KMrjoRGWiQCkv7V7MI
         dt28GR52dia5nENFtuxs4vI90/aO6kDeGQoTGy6Kmb8qYBel5UteHEZexa/qWKY40huR
         OfZmOhZ6mmg8K3LKPcUZut5Ipc39QHcskeP//JuyaQzP/aAYKbjemoh2fa5d4C2r7gtn
         qgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343440; x=1794948240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRgSF8D4bd4C8Ia14tMpoUoyFPEZ196x64KWzShEANc=;
        b=J4FTmpq0f+63nMSHpG/pM8qUEwex2A6MIWlKu77tvo/ylH7bXjNGZ1cYiXN5+4aze8
         8UyLdBIEVLIFaGru13NQAJm1+UmozVSCqptx00e2+5XKvammqawEN0wmiUIF2pvacaO8
         aqA2FelZCO31/L3Sg/sL9ow3N5mo7bYQJ9dgCmrpOHhJRXkmE0MnsE7rJ2U+qGzMnltt
         3AhShgYBV0RbxzQompDB3EaBeupxlsVBtm4PzQUWFhdGHjl9bkyPq/KBRA0NjgLEDk4P
         ptBDzHcejL0N9pV5g7dWHc4QyDhVqIVl1pkOcpeDDPKkvqjuhGfFTVs1KcHUfo9+sg4Z
         ZL2Q==
X-Forwarded-Encrypted: i=1; AL+hErHy/7WniclbbU+Nw7XRPtIIKNoGbat0A3RwT7/sFI61hudhXOkIVo/zY5+QmFB4/klDSuv+v/9hbOIaFTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XtR/YTdh58rptNfET/UlF4k5zb/uUMdoKv5Z6f9HYuPi0TN55
	FL3VIu35lPQdDb7mj5EWo0b+BzncYOcZANLhvtWg13qf8s8Ac0X7+/n5a3Jfisdr3304kjsJH/u
	nuCpWOTaJD56Ador6kkVVif4ZGkgPk790XUxYNogN
X-Gm-Gg: AYBFou199vyCUiJ9v9Cg3PMvhQ9R+ECXHYcL51gy+bzYGmKfLUiwe36UixhPzyiQmTP
	bDy9O/YfZLkyh5YRshZf5q12qtySGb6SDHSSwFctoOJY6RBcbn5ff6ug0G/Q/W1RpliATa9uu4O
	JcUUtUNTELekWuI7IzZBUb8TsfKvfLAIGXsC7DBsZqfQejr+DaCJwCQfG+HESboESEddzfLhcbP
	I4W1AxDVrk2oPdyVifCVUxk6KCKvAJjt/ZSD8N7rcUDYE5gdNKdZWYlTS5nZ3vuGc22xQtlGcVN
	wjpJs1PYhzCU5x32W/r1LbwK9EIZOhUMGu/jQWnae4S1Q+VJqDsq7JuuWdCI2hP7Yi0GVlnuMeB
	KYz/uFQuOPbn+GhW/ESac6qeYNEP79UJgCD7GyNUCBb4xzHuG+Zi2CD7swIh49tbdj6GDE7+foY
	pX7Ti8R8GdfDDGjv8=
X-Received: by 2002:a05:600c:354a:b0:4a1:7e77:c382 with SMTP id
 5b1f17b1804b1-4ba0935dbe6mr4583165e9.5.1794343439620; Tue, 10 Nov 2026
 12:43:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
 <au7eV0D_44ipe3mw@google.com> <DMP0HGBVA3Q9.T8UP93DA34UK@kernel.org>
In-Reply-To: <DMP0HGBVA3Q9.T8UP93DA34UK@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Nov 2026 21:43:47 +0100
X-Gm-Features: AclHuK_M_RBnCdkeBBogWw-mSzZ7FX9o88E5X3OuiqD9l_BOcZbdHx_bNnfG79w
Message-ID: <CAH5fLggzEvheweiHte5KTaQi4G_5GtV02krR0OpXB+buDUORBg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File lifetime-parameterized
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, 
	alvin.sun@linux.dev, deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat Nov 7, 2026 at 9:16 AM CET, Alice Ryhl wrote:
> > On Sat, Nov 07, 2026 at 03:03:25AM +0100, Danilo Krummrich wrote:
> >> +        // Run driver destructors without `filelist_mutex`. Take each=
 link before dropping its
> >> +        // allocation to avoid recursively dropping the entire chain.
> >> +        while let Some(mut data) =3D files {
> >> +            files =3D data.as_mut().project().next.take();
> >> +            drop(data);
> >> +            drm.open_count.fetch_sub(1, Release);
> >> +        }
> >
> > Instead of transferring all the files to another linked list, how about
> > taking them off the file list one-by-one? If you release the mutex in
> > between dropping each file, then we still avoid deadlocks if the file
> > private data destructor takes the lock.
>
> I did consider this, and technically it would (currently) work with
> list_del_init(), but I did not like it because it would be a very subtle =
change
> in semantics from the perspective of the C code. (I.e. for C drivers the =
list
> entry would remain intact after this callback, whereas for Rust drivers i=
t would
> be removed.)
>
> Actually, I did hesitate to move drop() out of the filelist_mutex protect=
ed path
> at all because I don't think there's a way this could actually ever produ=
ce a
> lock inversion, but the "move to a separate list" approach was pretty sim=
ple and
> very few code so I thought it's worth ruling it out anyway.
>
> (In any case, I'll soon start working on the C code to implement a common
> lifecycle scheme.  Once we have that, the Rust code becomes even more str=
aight
> foward.)

As per discussion on chat, my suggestion doesn't quite work. The point
of moving to a separate list is that we don't want to modify the
existing file list.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
