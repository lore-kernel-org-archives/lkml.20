Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504753F824D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750119; cv=pass; b=f+2QjESPausz33AkTyus1xR6b7D+5RdZE8FGTA7A6uU6/+Z8nWX08DGrzsE3RzEc32AzeDWjVKlgYDh/wix8J6BZWdKBN0EzAPoxRLEhDxJvJXc/Mmnf6+KglufGIIZ5ab7+GoJeGYGI/zEl55n93BCGjJoyZfMLTCk841KF63E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750119; c=relaxed/simple;
	bh=RKNzlRVl+S0k8ilZtcI6h2AWwuL8NHUOHd60FRGko2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8VxSYniGKtc6jWcUIr3jQZr3220kcsjka/FmxhkyZwxX0lMx2yehnPqz0f+7SOvNmraQJBod+TRPdtmCJaPt9MAYg9pRB/mg9WGGR/839mpswjyVMKIGnitHpaxHD5LXA4z5iyApc2c4Me5JtgJDZWB+rtPC/NHTFGOVfrTJAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdnx6fAE; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdnx6fAE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cecdc24b1cso1377335ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787750113; cv=none;
        d=google.com; s=arc-20260327;
        b=kZNBIpzYr7f9xu//2vRln3rlZXGvwiPjzISUeGg6ivnGWyPX42e5Y38E7pd0IMGQgo
         2GgtqSxpWGHL363UWey2xqr2eXW1UclIW8WphLP9LmMiLO4cQxhDxifNRScw1yIlfiQi
         akjY2Qo0auZMyJmKwNlzURgn/PDLK2Vy7wRPKyWKLpaP7oXr1A9vanDwORplMfav/gI2
         TekIAYTdMK67ehXObL4iSUtUDWA6D96mr1h7AOYctZJGhB/D+Iv2S+B4utM2gVSH9cvA
         RLZ92aB0ulGGAr//BEmswGGAE2kMm961sj9iAcxEaNzPn+A62fxQXY7qCgRvJyoKnPUI
         sRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d68A414WB1dkKupG8neXp1UtIKkBQkiVmGySNMv1upw=;
        fh=yJNdUoPqznERM6FIgMSy3G7j0sqQkwdBYnQ3jFqbvnA=;
        b=P0/wraCgo7KGWTZ0SEnfd/xgBa4O6vX3eVbVb4E/byQnN+Bt/n4pnvIMo6KMO/8RLe
         BltElzr6uRNcgCVRXMyu3fxh5MnwgQepA6OO1gAdhbPJHJYNeXLkVfS23a2MjCpcFnRJ
         nZJ5elrEEQZZejN75brlI25UPe2UIkJXzTDuzgPa0x1t/dYswSiVqcAMmyJse1Qh23rR
         d8la7JX25ueago9QpDoQEfq8vl384Awpu+LxRMpPIFoboioEuNBDxFEnG9bDK/9VGJCo
         Rx1ZbKfeRLb50GAOppN19h1p+YHZSnE9aZiQid0zFz6qZ0QkBka4G3mlLzulE8aCAc3Y
         SPQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750113; x=1788354913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d68A414WB1dkKupG8neXp1UtIKkBQkiVmGySNMv1upw=;
        b=jdnx6fAEKqK+q67Ubmmz6BFb0UIznCWMvOqyMkM3+8aALbPOKpTHL2GwiihfJAPCAC
         uyFb2xJy81V20n+5b3zBQWsqdm599DoFTYlcEUehMAw65fIyhJKdmGYHYoNKZebwYK9G
         XE+BJDa/yPqNmkX/rolJFayie/mvXpzeYvkCJXpA91NxdRT/3gwgDS4RYgxL8G3eHYNT
         iTBZHaLndnUsKtWAGcn4nFcMVyIUHvwwvP++L2qMgooUrx9431xnW2+oCsXN+1B+kbhZ
         qnd6sAFgZUyqh+TWDvPHRJYZHGaEZqWCv1GIOBS1met8EmJac4Mrdsa4Nn9iEYFmN3gY
         /cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750113; x=1788354913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d68A414WB1dkKupG8neXp1UtIKkBQkiVmGySNMv1upw=;
        b=agYJ8zS46v0YIL2/w09xoHE9hbVEW9xGYJ+W3cAgRiHa6pmyrE7isdz/fmxMxjyMVY
         g45VgZfKlggBFB9tvFpQV50iV2Ik6NjzEdrXjidzxxbr/H/KQ/EQN9O9pcMH3dH4tdP+
         25McUSZb9AX1fGu0IRjZLySPJfaGGP2Sp+/Q+dJ2ahJqszBE/A7dVplavI14SM2HP1c0
         e7AGmCnOdkd7uMz5NnC98xFdH3ikgRaaFO01zHnPPXVIpFBCiRDqqxU07mwkC5zt3mEq
         HMgVwOpa3frKmaa9Hn7okdMASz2uSBZCQ17U9loA8LraiTNQ0IInfUAoubXYxz58fZlv
         5PIA==
X-Forwarded-Encrypted: i=1; AHgh+RotmnobtgfHsC9QE6S3RegBZL6++7QarPfImTcU5jrCulI2hlGJM2bny0kDuHFNl1uJoBikaXGwv4YUCls=@vger.kernel.org
X-Gm-Message-State: AFuF++my1PBAwlkQc3JqWxOO+s9Tfg4Kmeh+Kg9vuilR2zT2abxA2W74
	YUdKzO8ni0FwXkMwilt0Z3rnGzHZIuxObykFNQHaf6vOgaevodXRgREz3s8k2qZMRBT+qzXhlFY
	mspDuK4eETikvbCtoGTIXpUONzm5sww0=
X-Gm-Gg: AR+sD119KWp5NaVayA3GjE+D6lS/a9GvHUzo4Tirs3Y8+AgWQdCilQFfrtXjNPFzANq
	cFjom/xlLfTwdgDN0NU0IMb89mMzyruDWWreeciFNuInBbgZI6wo2KV3ZtCN/edtctcGdB64BjZ
	KFRrJ9jne+5JL7kgup6tN3I8M2cq/en5XlpL0a14DccopPgUo7fUMcq6q6PQ50GWWDgnF6kxfRA
	9lWPoo1IDWx4pIjNQ7XlLJljd1Jk1h6ggxmT4hiDcLlMDUus1BOr39v8I3ijoiC8inPp44d4BQL
	/0ueLH29j6TKIaXV1INx8StpgiznTDQTiSTCzK8NhAbxOjHhFYXyrrOjQ6Yk94YQ03q4wrjyCOa
	vOr63NN8rJ3vG6DbOrI1lckYGifFPXC8=
X-Received: by 2002:a17:902:ec8f:b0:2d7:1a3f:8db5 with SMTP id
 d9443c01a7336-2d71e51eddfmr1812505ad.4.1787750112568; Wed, 26 Aug 2026
 06:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815180033.8958-1-linux@treblig.org> <CADnq5_PgZx7aDGFD5pPQ=1MvF9_N_omVojNiDQFHjs0Tqasv+A@mail.gmail.com>
 <2026082644-monetize-tingling-0abd@gregkh> <CADnq5_N0AxaDZswgEQ7BEcKw8mF2hnSbAQp-w9U2Fy-MaEw8Rg@mail.gmail.com>
 <2026082654-gangrene-support-8541@gregkh>
In-Reply-To: <2026082654-gangrene-support-8541@gregkh>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Aug 2026 09:15:00 -0400
X-Gm-Features: AcwNN1X4LudWVwUaEUKscYc-hvggQoTSapOlPRsnZqqAC9NLjfVJYKctFGxUoHc
Message-ID: <CADnq5_N+bXX2cFjxr0xHX9Yso6+OHh=9i=61boEsRedYwid9aw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amdgpu: Remove is_idle method
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux@treblig.org, alexander.deucher@amd.com, christian.koenig@amd.com, 
	harry.wentland@amd.com, sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 9:09=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 26, 2026 at 08:45:29AM -0400, Alex Deucher wrote:
> > On Wed, Aug 26, 2026 at 6:21=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Mon, Aug 17, 2026 at 11:27:41AM -0400, Alex Deucher wrote:
> > > > Applied.  Thanks.
> > >
> > > Any hints on where this was applied and if it will get to Linus "soon=
"?
> >
> > It will show up in drm-next after the merge window closes. 7.4 material=
.
>
> Sorry, but this is hitting me now, pre 7.3-rc1.  Booting and getting a
> zillion kernel warnings isn't ok, that's a regression.  Please get this
> merged sooner than that.

I assume this is the series that fixes the warning you are seeing:
https://lore.kernel.org/all/20260813143605.106104-1-mwen@igalia.com/
We are working on picking it up now.

Alex

>
> greg k-h
