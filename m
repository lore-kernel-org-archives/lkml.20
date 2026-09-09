Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFF3C9EE8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985532; cv=pass; b=fUEEHPKxssAQXYpwxra1Z7xCORJIz5dwoIU2FON5v3QfnopvnVQmW+z9yygFk2VBTSdZxulsKHmzZ2R3EFZDp/7cGtqffg8DdFCNhoOk5XRAyGMrUMfHYilIQdu3kwdip0OOMP88/VhQX+sbU6+S+7YHyX8t9hpYOtshSJAuxsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985532; c=relaxed/simple;
	bh=1nEkJy7MHnbs11q7jN/DcP669TYW7DpE8mIgujMRK/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbRCdJEbc5UIyt6mEmYwTpRxHRn4s8SVd/oNkD/5qzm0iMYkICZOouPDtUxaw3TSD1/FFkxL1Q57GYmBcymXlwq2+WRQMn/ebuQDSC48IVjYqZQCTg5Vn0pF1zs04jOexQ0LhHrR/DjLS65oC6s7QiZe/RgYMBR2nEBXhxlOQDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1vsHSiB; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1vsHSiB"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so1084205e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985525; cv=none;
        d=google.com; s=arc-20260327;
        b=Nz7NJoQ0fXjpqpR520rg8IDq1UeDZ9iFSoc+KNVRxzGbG+pkkC/rqOkTYy//UXX358
         4NVHZCXe/+VMHVlOsuQJ+O87NPAzIM3lSI3+WGN05b4WzNcVVmSb/68N482IImVq+57w
         8sMsD4w65v883ITxk2Zm3b6euX1sCCVaQWpN9rtbfvtZ42vp2RIfjdHuajzKumkUYpGw
         xfOsOLM2dY+8xBLzikUAsiugxSI/v/LcpPRP6+9Qq89/G8OLevfsN6v5DMQrZC86xCtY
         CdTz0B+MX+y0mXmBCqxCGnvObLakPApb2O2CIUUREFdjMQnPZiWHnrTgaMpZjdTdgj7d
         Bo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=POC2lH7mwvKdL69yA96ciVwerPravqqkSKDADdthXkA=;
        fh=avlae1uqIJpCQAUTIPuvFArZR2uJl+Uh0uiLiasTHdY=;
        b=NNQHGDVTHPWccfuuUisE6UI3ZllTJ0XC5OAV8xXRlYXVrcMwo33cLmMiudJFKmZ1+d
         WdvwMgtteOwJUJMo3q0zLGIbpjxahigkX1gmIqkCQh335PtQeTgDD0CLcQl5vcvbex07
         amHXo73eYLUuuwOkIx4seXNwN9gqrCYiFZGqm6ACtL9PAiCA2JmpeMBBGoIBf4psrmIN
         ZFtK4jG1fnBJ5DwDBqLI6qebPn7Vy+Io6SjTQaBQHof++uF4TBnX78l7Zi8jnFP0S3Xx
         u0zjaym84PTcsoYjiR/qu3Rby+EbWuIi+fPj1SrO2r2eTwdcpTDBNREN55BAB2pL7s/Y
         hFTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985525; x=1789590325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=POC2lH7mwvKdL69yA96ciVwerPravqqkSKDADdthXkA=;
        b=m1vsHSiBrp59vgIPXDpi3WNoVBL6U7iJ5sVUBfkluZduX4s4ixnCEadVZI1F8AnMrl
         EOQUI+BwZ9iyjY6S/zooPQxbk2Fs0ptWnr5IjV4QXa9rILUYxwZj2fjSWIBlOb4tDLtH
         V55utu3u5KCYxJKQ3IdAwUOYOExMPX/WgWYgb4vIRKYMuh1KVbQCBxexG7e+pNjLINRz
         KtoDfPKcaP5N593vlNXgXQc7+gCCecuRu+GNdKpPMlu+psYIHvHnTPcsxlHV0U63HMQf
         JdWJWoHsSnbT8VOd8Os49q6DDvVbJfi0qS42hpA66MRd6k+vfB78u3BcPiWBO4R7NGFZ
         gw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985525; x=1789590325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POC2lH7mwvKdL69yA96ciVwerPravqqkSKDADdthXkA=;
        b=Rm4AmXyxV3mjypKGQdNeKC68WmMid5nV3hMh4Zzy2/uNlnC3aNgX1AH8jOsHu+G4MD
         /fBicVNXYetGrt9GXfsgsyduoTLIheN5AB7Cj+u/wvX5/29NvmCFPmEmyCOWdajb9oWd
         U4mKSCseSOF+icY3Cv/jBhOo1Ya/86GSMGQZxDq+wg1CGQrsH6GSwyfXcUdZ7pxMmkkx
         ccoUXJUldB13I39csrt8FkrtMr4ZcrHRqVk41XO3AbVZVtfS/2DWUd0aMAeTdifQqg/7
         wcHU/hpNTz0ljKUSdKibotan0H0JTrresXqJ77QnL+rx+icfsTgwtRVq+IVBo3dlI5WB
         i2hA==
X-Forwarded-Encrypted: i=1; AKwUvBzD27GwGRe2bg4CP6pR8iqCPmgIOMfI1slecZuRy7Cz8CpGhvrHv21pt1HbrKH7jELsdmOAXrHUy5knE64=@vger.kernel.org
X-Gm-Message-State: AFuF++krErrpQFQOvVnzViMPt/Ll/s6FTDeANld0ig/CIQ3ICPjW6ctg
	3Jy3r1NarolGuuk817fGRnoIqDsl92EdAq7donJNbNDmKM2IBJfBxzp5L4ogUe5vL+kU4z3OHUp
	DEpBqUywxFzr1GzQ18X+v4pqheCjKOHM=
X-Gm-Gg: AYBFou0zOsNygSjMUsuEDi+llfpUQ8p0+pmZzTjtdROPWuB+bCcBeY+jP25zX/4gt1w
	+/aYxxCDn+2bYqvKYM6WoM2pyEFWoy/Gn0o5k9ANgAg5jBwtHkOJceQTGSuyAqjCTOCECTt9FWm
	BJKU4U8tgSO/8SVV8Tq1g1vD/fZnLWABuLMAtsrrHuYMzGAPc4nEmZa47XgKk6ccGwccKCkRb8b
	V9m//c2E56slgGOZtxMwaSxnyVPvnNy2mHYk00FUxUTzKhXeh7nrwhnsHZI6EKwkKh8OkHsFT+j
	M3mmKfXUmS8fUU3M71Inl8kjVx6R5BvBm+iL9t6amI7Dfo/Ha+vVWsa5jcNWzoAFt8pD//M1stj
	uZD/X5r2M0Arvio+Yz72Qq/6hVZtW8O0nfToEXZEYn6ke
X-Received: by 2002:a05:6512:10cd:b0:5b7:6665:1028 with SMTP id
 2adb3069b0e04-5b89a2fba43mr201759e87.9.1788985525096; Wed, 09 Sep 2026
 13:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
 <20260907093123.2438228-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260907093123.2438228-1-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 13:25:12 -0700
X-Gm-Features: AcwNN1VitG_oQQkQ0jIqPnt52-lFjuNztNXCTLV1XOP3wKHIcvDioop2798A5cU
Message-ID: <CACOAw_yDKmuxroZRV492UDdLd0ewengiXiM=w6DzekY81f4r+A@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: extend folio state for large folio
 write path
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 2:31=E2=80=AFAM Nanzhe Zhao <nzzhao.sigma@gmail.com>=
 wrote:
>
> On Thu, 27 Aug 2026 13:51:06 -0700, Daeho Jeong wrote:
> > +             ffs->private_flags |=3D flags;
> >
> > Is this field protected by holding a lock properly?
>
> Thanks for the review.
> No, it doesn't. Thanks for pointing out.
>
> I want to change this using per-field atomic read-modify-write ops
> instead, to avoid taking state_lock, like below:
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> @@ f2fs_folio_get_private_flags()  (f2fs.h:2719)
>         if (f2fs_folio_has_ffs(folio)) {
>                 struct f2fs_folio_state *ffs =3D folio->private;
>
> -               return ffs->private_flags;
> +               return READ_ONCE(ffs->private_flags);
>         }
> @@ f2fs_folio_set_private_flags()  (f2fs.h:2730)
>         if (f2fs_folio_has_ffs(folio)) {
>                 struct f2fs_folio_state *ffs =3D folio->private;
>
> -               ffs->private_flags |=3D flags;
> +               if (flags)
> +                       __atomic_or_fetch(&ffs->private_flags, flags,
> +                                         __ATOMIC_RELAXED);
>                 return;
>         }
> @@ f2fs_folio_clear_private_flags()  (f2fs.h:2746)
>         if (f2fs_folio_has_ffs(folio)) {
>                 struct f2fs_folio_state *ffs =3D folio->private;
>
> -               ffs->private_flags &=3D ~flags;
> +               if (flags)
> +                       __atomic_and_fetch(&ffs->private_flags, ~flags,
> +                                          __ATOMIC_RELAXED);
>                 return;
>         }
>
> Please let me know if this lock-free approach looks acceptable.
>

Please do not use compiler built-ins.
Plus, plz, consider race condition of the field with the non-ffs path.

Thanks,

> Thanks,
> Nanzhe
