Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670305;
	b=HYMkuOZNblULOTTGSHApDm+P7MnAnY8kHgRWrnzR1V2CAH+GVZvorfczxhoFutoY5Lru
	 tvUsvwxvYpI9YxrcFNr5cgR1TdxpEYITxS9V5ZsSNhl94pfGHU34Z+LLF9zi4ynLU4Rwg
	 g6h/5j+bKf/Q2OIp7eqg9i6tCjvhJXGqK41DjXQXJiEPYokxZE7uI0QSUlCJM5xkpdpXZ
	 vUmDqZhbIOSU2dJ9eWCQOjv9zcI9NZwGzgSHn7cw7LO0L9akCORWlwUdMvujP/ihQ1Lr9
	 DkmV4nhJrYuN2uzCwm1DbUiv7BPzuadjoViltsF9xTp8fdv8Vh2xi+Sq8zHnDzgR27A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670305;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SKUK5/GdLZFaMvNXAe6hw1LRL0hbCiGKqTHYLhCBoL8=;
	b=Fwm6KR10BkecQVfpeYjyvWKmfGv21OZ+JjgKWDwlFaaCXKWM5ZV3JtoH+fon6YeF7Jfc
	 Dk7WTilUt09V0eTz3ziVsHdFXcTmEOrdlmNduNtMM5IZouA6DZ5P2QQ+b8PToHcicrYpO
	 hf2pcEfhISs+KqIIRCkvXhh6bzK5Sc30A0vzI1VnmrTj3OLTxG21vTcdT6HwhjOmeLaK0
	 aJ+vNbLjtl6jsyaxS6fllbZUPpIOpfCfELPxLuBbQD/XkSmwlGjXUk5DN9kURT7H+zJ3G
	 lU0Ve3dSAKhov0YQ/6MtynAr661xycLCEIXYvoF3TqRlipfzd3XIxmEILu/oSrCnUGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hx+8e9pV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F9606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hx+8e9pV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA791F000C5
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792670305;
	bh=SKUK5/GdLZFaMvNXAe6hw1LRL0hbCiGKqTHYLhCBoL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Hx+8e9pV38lBaTyI3tnwpq+IlSGLFTHiyP8rn2IEzLvxH12v/6NwwI73UnrjrfHzy
	 VOw1fXOug/slBHRf4AEyVBc/kf291bXw8X0BrW4pkakmB07PzTFc8hLq9Hw5drsQN8
	 dFdfwgCUkIexkoNfD3BlYFzjGCf8H+SzzXJibBbJunXezEY6aYqhR80/u/Q8chAnqm
	 A8I0lGsazB4/dfQNZbTspLuGH9jXf/3a0xFx2/ndV/CMKFhpvhIg42cplnWtOphxMg
	 OdJuVTUJ9hbAiD2CgTqxi4NMSGNPEkyGal2fX5ivZElCgfQqKiRh0zpRNwB42m5ahq
	 FFWo0yNyyzLNA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2577191a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:58:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVUnOAnevmrfSlVh+p9s7arNI2EUxzUsTlNoiRAH/TnHmOw5j2n9V5WiOqD1SRMiTr8XO5LUENXrIXArQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPK3BQ1oL0azihYTvtn9JDGRvbTZqSsjVaEs+c5H49nvdnWKmh
	blin1QY5RJ4ozKY1vL83hYFzEuS+2+7PbXqmeZN/Qjr6XAkSUDBXQobDNMkrQEO9wSABGBTwh3o
	+qv30BKvq/8XHB5/2Ae9pzo4jrSEP8p4=
X-Received: by 2002:a17:907:72c2:b0:c2e:7fe7:288e with SMTP id
 a640c23a62f3a-c4679792b95mr480147666b.32.1792670304103; Thu, 22 Oct 2026
 04:58:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
In-Reply-To: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 20:58:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd86svfoGJdS2aG9CuZOFtsUkabngqpoSP3aP45N29LPMQ@mail.gmail.com>
X-Gm-Features: AclHuK9YHft1UrOHZ38QcgvC55Aj0IztkVgeNlWXyE1TelTdnUesnAPBg_zIk68
Message-ID: <CAKYAXd86svfoGJdS2aG9CuZOFtsUkabngqpoSP3aP45N29LPMQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix u16 truncation of the update sequence array
 count check
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Bryam Vargas <hexlabsecurity@proton.me>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:44=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmai=
l.com> wrote:
>
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> ntfs_check_restart_page_header() bounds the on-disk system page size by
> recomputing the update sequence array count from it:
>
>         u16 ra_ofs, usa_count, usa_ofs, usa_end =3D 0;
>         ...
>         usa_count =3D 1 + (logfile_system_page_size >> NTFS_BLOCK_SIZE_BI=
TS);
>         if (usa_count !=3D le16_to_cpu(rp->usa_count))
>                 return false;
>
> The right hand side is computed in u32 but stored in a u16, so the count
> wraps once the system page size reaches 0x2000000.  An image claiming any
> larger power of two passes the check by also claiming usa_count =3D=3D 1.
>
> Nothing else limits the value, so ntfs_check_and_load_restart_page() goes
> on to kvzalloc() up to 2 GiB for the restart page and copy that many byte=
s
> a page at a time.  The size is only rejected afterwards, by the
> (size >> NTFS_BLOCK_SIZE_BITS) !=3D usa_count test in post_read_mst_fixup=
().
>
> Compute the count in a u32 so the existing check rejects an over-large
> system page size instead of being defeated by the truncation.  This adds
> no new limit: the array holds one u16 per protected sector plus the updat=
e
> sequence number and must end within the first sector, which caps usa_coun=
t
> at 240 and the system page size at 64 KiB.
>
> Widen ra_ofs and usa_ofs as well, as ntfs_check_restart_area() already
> does: both are loaded from __le16 on-disk fields and every comparison is
> against a non-negative value, so no result changes.
>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Applied it to #ntfs-next.
Thanks!
