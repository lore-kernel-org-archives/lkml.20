Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803ED2AD3F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798643; cv=pass; b=e1LAZi61aVsHEBlymw3lMPGu4nJ4+pNHpnf4meWlCO5guuk7Kk+qZrxIkErr6btrtb9grShQrD4SZIARPZ8kayWb7HeCyyAcDFGL7/f/73mShjwQYIQYaqmNRdEDcJH77SPUWkHSCc/16LyUP30YNB626cgJOSJsM7rLzsQmqB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798643; c=relaxed/simple;
	bh=TTZYNnPP9NazSWxhID0pmfTudmtLXlSKGgVSNsokZpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYaHtFP4UNr/K/o5CnPFN9y+5iiB2+BnqvOT6xrMFId2d61aylxQUGaF6ntVRcECsa95rBGGnBb3w221qvSsHT9xxO4HUSYKj0E4ii+9hVCRmV/gUfKBiZxoUGa3f1vKYXPyk737T5DFV7lOFD/0Xa68s9M4vgOe8TRsC2Akkn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APPs2eR7; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APPs2eR7"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso774238e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787798639; cv=none;
        d=google.com; s=arc-20260327;
        b=eSr5WtJ6Cq6g3accABDi7+dEEF+bdCUooqGDemAP00uryGGKjKOxt0osfpt448vlf0
         XGlEfCIxAJdvL46QK69bcYNP5eXQi0O2yUyhJ10ZmrDCUz8sAON4vlaKozB0CZFY7IUH
         QjmXhyHSiU2nKyU5k6t0Q4qlDGnBvilFfwvzjfw1gpZ0+NPOrnS+mxZM9yul8+b6nWZz
         44uVYkDOfXO/ZnVofDhDni090LO57oxiNLLD4+khqJuAlnOkRMT2hxVv0sJBgDTMuBSY
         sEKfNZPJ7LbciXLPF+Zoue00WmCDplOql/RjauSQmiIrez+qDUlc6wyqOfhslmuI09UU
         CKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zqvJoTlziQDX70znP8ECNAInbQoTi/mvAJEVOqS/Uf0=;
        fh=SgX7f0aGKCintCru5jPVb2AfCc0OSwlLKxPt9D1gOew=;
        b=s+r//dPWy61Z5s8csGzO7y+vuzSbuib/wYxDEeiipeMJnIaHXZDZqPs1kAGjiVJJuP
         K2+a38AbztmKOynwK3i5rOBLKquTUjcBl3s9qq49MRMglW8sn4paiFsIeabviDlM29VB
         BlLfizC7BLRk2olJqVbA6uBJxEXsX5y+x5UNzlx60feo2U4tYISCkC0eBPhCnzPTDyrQ
         CZ4VMRm0Soi0fvjuD8AqHa4EC1ip2Nce1YhVv0ZOjwKBQUvvk2wxcxuqPn0/maWIKtTV
         5FwuMtZnxU/UY56rpvL26MjQHDLYb2yTgTNIHNhYUV25mBRWdTk321qn5P8tCUqDr5Wc
         8lcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787798639; x=1788403439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zqvJoTlziQDX70znP8ECNAInbQoTi/mvAJEVOqS/Uf0=;
        b=APPs2eR7LGjXSZS2tCOFtLY1l3p6l/TwBl8zL/tnrNVk0pLF9E5fDKDmaYwhgAZaVU
         vmmCjpVl8p2Xz5rsqcyWffuzqabaQ4Y2Z1fGjIEXVUCOuXOmHb9RPMx5wmJRtaI4b0+k
         i4ycxMOEdAnSi+5LpY1/VRx7fJ9SlwoNKYrOl9+66310zH6/GS8iGSZm88I8ckcwDBfi
         7NZq7c5+VxnYnMy/NP0pFPQC4cPCLJC7wNTJs925DfCBNoUz7yQu2SWZnKDzhEkmw/Ri
         TdF0CHXRxjoy+FbvGBVhXBZ7KOuubk+tjXCoYwMyJUKi7ufPKfTvaoHnyeIM2BqF9EYf
         a8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787798639; x=1788403439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqvJoTlziQDX70znP8ECNAInbQoTi/mvAJEVOqS/Uf0=;
        b=eh9m7OjFHaZvJ6rxv5ljYjgKiHaBlbuzz+0gOnQJEmADd8QpWXjXug9QorRMqNcw92
         4Ljev6Pui7df0fxDih3W9pBk9BMyJ3LGwXuaEF8FcS6xzS46zDTw7iTtaWy441BgKZiF
         g4SbTuEXwsc2g/AI8E9bFF/2DB6yyfdUrInI7IEwZYkaK0YJUE2sR4gFfA/gp5pXT0EC
         pHqZilSaQURzPaBwykONKfqGUCwChUePGaJM6qM4/I18s764nOj72v+K3V+CVfArld8r
         x5f4S9LTMt8lAhI+OOTdTKzIqgYN1bZgxEVxsKpD8aiVIUbCftttNFQCWe7wDsdjpRWj
         sARw==
X-Forwarded-Encrypted: i=1; AHgh+RoEuNfGi18wIAWwubtS56Il1VPYdbZq5FOki+Fj04vQr6uQzMUlN74mrF4LEJh/hf0gTFDWqItMP2kX0SY=@vger.kernel.org
X-Gm-Message-State: AFuF++kFtV1MGq/KpNLVk3AofBE8jkwQVHxPXZ/uede7mwrV1rcCEH/C
	8CF0BCr72/JZ3eRjCfQGTuEnGDRA53qPvTVugZpzlX5ARcs72n86TVPJFEjz9ftqAIofY1qTAaM
	ZiyVCOfOCkx2Icvomp2wmAGiNIDG6EAE=
X-Gm-Gg: AR+sD10xpy2B+6KzCnwZuOiTTodtDrHFoRI85YUeLqQaAGI16vc5uXqTJWWU3TOkXzE
	2zANq/kch7GXt7rPhZc/g1re5xI075OyYmqJPhItpEF0MSwNBBnNjWhRMHfeCKHg5FjjMCMdgOZ
	5EU42TRWLMtRq9FG6vwWCLGnUqPdOL0Ef/hdaz1wg/p/Yu+5TLvoFcUFQLQYjFRVlIbHb2jjDUC
	SOUD/GIInj3dMpTOwXQ191fSo2IS5UCp7trrsX1Ksuc1IG802qlIlFiTy/NjGZL2KS/TPFtUo3o
	4O1s5r3533gYFFCstra+mBvCut7od/iW7jndDZHDDiky
X-Received: by 2002:a05:6512:10cf:b0:5ae:b969:417d with SMTP id
 2adb3069b0e04-5b4a8e672f0mr3686763e87.0.1787798639149; Wed, 26 Aug 2026
 19:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826054204.1364589-1-zenghongling@kylinos.cn>
In-Reply-To: <20260826054204.1364589-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 27 Aug 2026 11:43:46 +0900
X-Gm-Features: AcwNN1UkaDT5W_Z6HI7OoA4IkQTjvljt2A2kTCf4G4MSGG4h02_YbW9SMmzlD1E
Message-ID: <CANFS6bbVZ3jZa+a8FTjz1w3RuPvFTgjfBh134J4a-9fK549UxQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix race between fallocate and mmap reads
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

2026=EB=85=84 8=EC=9B=94 26=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 2:42, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The fallocate implementation only takes invalidate_lock for punch hole,
> collapse range, and insert range operations. For standard allocation mode=
s
> (mode =3D=3D 0, FALLOC_FL_KEEP_SIZE), the lock is not held.
>
> During ntfs_attr_fallocate(), new clusters are mapped to the runlist via
> ntfs_attr_map_cluster() before being zeroed by ntfs_dio_zero_range(). Thi=
s
> creates a window where concurrent mmap page faults can read uninitialized
> disk data.
>
> Since mmap uses filemap_fault() which takes invalidate_lock in shared mod=
e,
> it can fault in pages during this window and expose old disk contents to
> userspace. This is an information leak and data integrity issue.
>
> Fix by taking invalidate_lock for all fallocate operations, not just for
> punch/collapse/insert modes. This prevents concurrent page faults from
> accessing unzeroed clusters during the allocation window.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  fs/ntfs/file.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 88747217ba61..6958a1469fb0 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1153,11 +1153,9 @@ static long ntfs_fallocate(struct file *file, int =
mode, loff_t offset, loff_t le
>         }
>
>         inode_dio_wait(vi);
> -       if (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
> -                   FALLOC_FL_INSERT_RANGE)) {
> -               filemap_invalidate_lock(vi->i_mapping);
> -               map_locked =3D true;
> -       }
> +       /* Take invalidate_lock for all fallocate operations to prevent r=
aces */
> +       filemap_invalidate_lock(vi->i_mapping);
> +       map_locked =3D true;

map_locked can be removed.
Otherwise it looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


>
>         switch (mode & FALLOC_FL_MODE_MASK) {
>         case FALLOC_FL_ALLOCATE_RANGE:
> --
> 2.25.1
>


--
Thanks,
Hyunchul
