Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1164AF66F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381050; cv=pass; b=dQhfD0n8gWuAOaS0FiXYtuNzXihS/vx4gLxP3VuQTYCxLY9cVEPvYeMjWHFk6aNVR72DnhIXhTT+mwNKwZ1qtYL06H/ZuvIb6oETPBJNIywwoyikIq1Yof1eD5FlEaJeCtFXAE4kQKeXyq1dGz5juUYixcBxTlVBoNZrtNaRcyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381050; c=relaxed/simple;
	bh=3UGhbs4zr6z/qCcIMYIoLlLWY2LlCY3/3Pv3DbDqvo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TywagVTnGPS+kJhNH0ABxTEAWbb+aw9SDKDqmZ3VM7+lqlkyg2v6gfIWmdq4zwj1oaT7oEAJnDs2F4r5zs0bfSR0UEtJEsVovTuw+gKUlHT7W7GX7bTz/yj6w3fgc8sK/AvdE2rr0DH19FlXs1fHkAUkACEtfBsGUrSwwyqk3JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1RThiWD; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1RThiWD"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67699afea08so1993490d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791381040; cv=none;
        d=google.com; s=arc-20260327;
        b=q21T+IIYY0sJpKBUPTrRVi/sG2+GpmMgfcqIDS2Gp/Ru1md1JarcHddvoSahiFFchR
         MC7+OeQLnjz1Ol2e2XBwVhDJJQ+gGXV3opYhkn2u7jfWdbbEZVE/zed6ChAEbgIioj2v
         ihutsixgZcgboo9kehbmBb1WqN/g48RzEMMKm0r7L6JPqlTStah78880DX8cejenMe0s
         Yve/P158WGAyNZmIpj4UCRjHQ1pULtlmsUWaPiNkHPr0xYpxXeQQpNqnc9m89YnxlDFy
         lWJAvLVEkcB70bhFWMnx9W2lhLnFrsrup/efLw5LZD6npK4rVkfdn8OG388duF8ktCZ+
         n+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3UGhbs4zr6z/qCcIMYIoLlLWY2LlCY3/3Pv3DbDqvo4=;
        fh=9QhLfcO9QZdzTOoKGK9eYRbNDONbE6tu+y98axUMMv0=;
        b=Dwh1EbSpEEOe1EwpJxKVM7vMU4pp/dydoqV8h+ygwikrWmb79Bkb4yjwL6wJ7wJCQB
         TvGVa4nT50CZqIa7VpAB1NSPt4VMF9ObrmNjx9SY9/P0S1oEHTvKexHuHWD5+YsujmgB
         fh+Sg+KO4Nc0PM9WUWgfSwGxbcl00fgYFk8YwOca+UsDoH7l7BY92cA2IclzPDGb0z/H
         S6p+avvSyI6lyOTI/bsrtxajY2AxWZkPQ1fnsWPD/WnN2IXtH0yDySxXhuvPxVuimfYr
         7+bwVkCtBZ0xEnGkceaR82vnj8+BhYD3in4zMJoNiuyFeuKddVYxBu0MFSpny2ZFque/
         6ntg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381040; x=1791985840; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UGhbs4zr6z/qCcIMYIoLlLWY2LlCY3/3Pv3DbDqvo4=;
        b=Y1RThiWD1o7Ntnm3nbcpCyB9r/WefuMyyFRYJdF3Q2Oo+wQ8aW97agEFtwj3MoeYDw
         G8G3zT+XYoTAcrqo+ZzIZHppaK3ogLuCx1hT5bsOcS/OzDQZ2Uq3zSfJlQOfs/VARzaI
         5Y374JS8K2TL6VhJrVL6jbf6QwN7PLhozMkLItvap6cB+3SSw97gnLG50mJE4oUL9pKU
         y0mvyQ1Be5Op3qL/EmdCtMh/+XyW3tQjGVwL4NneNsozQFjehIpnkpSIawQt2mhsjn9/
         GbsDP8TNm+M2exqAEJpQ7+UAw6yKkhXMNXTRqq2KPpCOO62PJpqQjF3897bZq9b2q+2a
         uG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381040; x=1791985840;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3UGhbs4zr6z/qCcIMYIoLlLWY2LlCY3/3Pv3DbDqvo4=;
        b=cIl18KBi2lgjVh4UAPEa35BqjX/jKqf7TGemSz+pd0mh08Emko1NrdY4Wqa8AkOi5I
         /77jByPA0uV8beIyGTRHNfEQoYZA/RW/DfSS1s5VkaRImOa1HHDI3cSbqkZm8FRsyZiu
         CaOHCvnUXSIfy7QQtXOwycXyj/fOtRb1kT517FI0f1v3cuUPk1nXSEUhTCFEyEy7rJId
         u7wYly7qOPou1CgwNmW+4IibIOc76mD2pGj5JFCSA+J51Xu0ldb44MVGVlmNYUuyF3mR
         eHJtItzmFuqvAbofaK9+lJ5F8eJxlG8+JLD8LpycCcWTKzfvwGqJwMC4EjLS9XrRSlGn
         rADA==
X-Forwarded-Encrypted: i=1; AKwUvBxChPGmxYyil/Of05Vh3NkYJtU4zoVWTs6Qqw7Fy/fcdeVOKCXcYsaC8gDNKonvUbYi5ECOnOF6CWZNEHo=@vger.kernel.org
X-Gm-Message-State: AFuF++kitqBsZ5dBnvrF9xHbjXyBdmKfoRFFO7xETvGXySIzGg/SAkzA
	zAu9AWzKTg6be+sMbQogGdNEQbYQF7dGkoGNpMMX0HX5d7MPZ49LT8PpX4qxJ5/Mc8V1D7TZ6R+
	YpyU7Vr+Hac8KZTosfes5M4Fdzzyp3NE=
X-Gm-Gg: AYBFou34n811CcNs66fPGl+s3WrxOQ6gZsm1J1Y5+wXY7HXZZcw2gPB+tgwAjgzkfaO
	ZVwTGRK+FKEYye+11mcBq6yYm5Gsjoqg79PPm3suWAq724Rcz5Bzia2ndk+sl30YCrPrlPSPTl7
	xdpmxVnryS8f9bz72mPGJjseibSA1jWcKGb7kQiCkd4yQ2It0khVSu8ukSoA08gK3Z0SdPrgEAI
	gtNNrUnVEvwwMZOxxpvnktLINulphojhn9j4fsyPo9M8POmFGN0kCof5uLw5nsjRIzg5d+HJJvX
	9N8fie9UQWRf9w52oEtAaf5jpThIyH5cOpAcp0Q3fEhwAKsW3G+Y+09T
X-Received: by 2002:a05:690e:43cf:b0:671:3036:42bf with SMTP id
 956f58d0204a3-6790a46d435mr920875d50.91.1791381040024; Wed, 07 Oct 2026
 06:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007101738.2348038-1-chao@kernel.org>
In-Reply-To: <20261007101738.2348038-1-chao@kernel.org>
From: Seongjae Jeong <jsjlee1020@gmail.com>
Date: Wed, 7 Oct 2026 22:50:26 +0900
X-Gm-Features: AclHuK8iLlp_mGHrnQ4QBr8yOqenUzJM8SlRn46iAkR23qTM5t0Rqo9YKwo6vvE
Message-ID: <CAPHXVrwF0cCtO8G4+bFUJFtM8ptC+5dNxPBx=CooiW6n-2LJGQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "f2fs: skip node_change lock for inline data writes"
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao,

Sorry I missed this case.
Thanks for catching this and for the detailed explanation.
I agree with the revert patch.

Thanks,
Seongjae
