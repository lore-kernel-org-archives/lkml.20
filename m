Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C857502D66
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750911; cv=none; b=RhZlGD87ztA7qvOHLbWApE8UijYrWUZyOcyQHrW1mWxq1z4UfkwDKNW9tBaBnd9Wxk+b3kiK3RzIx/Y3ya+S/bajyHe/MfWPghDFoWhXwDajLs/VZvCRrqcCeTjdc2RHoLvvM2nAl2+8i1b4QdVDLdzifo8ctq3KeU4DHC+XCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750911; c=relaxed/simple;
	bh=XzX/cuNVbmGFqhnWcczMnbmYgYMFuFsbggh4wHF/6sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJkWj14LjpiraAPfmVKgAV/zZVToH7ATGd0DMblUEnmehdUf/byqKdQGPO35BZ950+OdSLgCZgkEoXEu8zzP/qpgKlhvq9jbqUQUAGQOw9WuIwc+g61TjVTn+vuxoHi9AWfdYOJB/97CEDMi7Bf0Q399Imh6I1whjE8oP4dsMo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ti+ITaeD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ti+ITaeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420481F0089B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750910;
	bh=XzX/cuNVbmGFqhnWcczMnbmYgYMFuFsbggh4wHF/6sE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ti+ITaeD10spAXhbsPH1ktBz86nopoYBGi2j1y04V7Pujz9ThvjVAsAunQxt+kRX9
	 VLXASgqinYiDLzrbaNr2B4MCAj2uush+WDFF5z1mbBDVof5Vd91D9yr37CLZh00CQ8
	 b26RMPXyK9tEamOP6+SXrlpG4zbeXsBYhueY4JNf7/Mx3d/EPcdiVetEsmmlhbar25
	 n7wnPdtar2SdxCuVbHeoMCB0n8ytGhyd4K2Rqh+/rsP/Nv0mBXx/++e1+N27qr1rn8
	 lmzAmtcQ/hvJeZKIvosqiulKHFGTLUMyTvV7ZqMPN5Vxu1jmoOkt3+uavDsyWhQJEy
	 lJGXJhRHSTLKg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so378757e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:01:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRXb4yKI9ca9BFJ0b9TiF4kgBWYaz58OHqcRINP4IAkbWWEyKbtbt/aCDiE62lrHolUwLjUyOF3PpWQ8c=@vger.kernel.org
X-Gm-Message-State: AFuF++nC5WtlGZGjsJNCLOKlFnlm/JCMp0pbIQ6C9Vd0pNDEu103dTHl
	LcTpKWSfzqpoa3QXU52XJPkxk8zjOp8hdozsgScXzUIOzcgXZ8jg8wxxbUrQ9C5uKSaBkAVr5zc
	48UeAPjvDQaTNVcD8OP6kykhzHGkgmUo=
X-Received: by 2002:ac2:4c4c:0:b0:5b6:10bc:b869 with SMTP id
 2adb3069b0e04-5b8c1481f05mr1062322e87.23.1789750908936; Fri, 18 Sep 2026
 10:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 19:01:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmB-sEea0rVNAE7Lnw4N4n69iutY_xU-CEOCBoT_8HnNw@mail.gmail.com>
X-Gm-Features: AcwNN1WVJ-71wcOJQ16Vkw2FVm1tNYoqCuUKzEVPNyfDjFfGBWCJnx2ZXHShmQw
Message-ID: <CAD++jLmB-sEea0rVNAE7Lnw4N4n69iutY_xU-CEOCBoT_8HnNw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3-rc4
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:44=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of Qualcomm pin controller fixes for the
> next RC.

This was not based on -rc1 like my tree so I just pulled off
the two commits and signed them off on top of my existing
patch stack so I don't have to pull in -rc2.

Yours,
Linus Walleij
