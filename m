Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59233B05B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280687; cv=pass; b=ZjDScyZAhg0IHHLE95gH3ouw8LuMk0DkXr/ktlFgiiFCrWbYol44ufwaDl1/2Mp3qD0ipKPYpIuAJx32RIsjuNVcjrkDEZH2XJpJcLu3Ox2YXVx4Xy888oyuW4A57hIQ/PRIS5TqF0NSo5kDuNfntZcTZuxecDvtw0wvWCWXa1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280687; c=relaxed/simple;
	bh=nOa1RhCOWow5Q4Zd1s2ylWpbZQcLPTfR3gq4oCCRnno=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoEVpOOjkBFoiEi0MauKX0ZSqjtuSa3tbKi3PpZhSIfEngvXDtm1PM8ZbQWh656kyTbRtZk+HjIUcJu39gVwEX1h8ArWgzzvRDNEToEgTUibnhW5BNDExpIzME3KlqWc7QGJvLCTI+kTEUoFgRT9F89kssOE4xZMQEWlBgQteLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p48PRJIg; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p48PRJIg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so29298a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280684; cv=none;
        d=google.com; s=arc-20260327;
        b=gDnbkTKm/LE135VwsIy1ni7u/mvsNi3BHJYWx9Fnxtj5lrf1B40FvuBbqD1IpuxORO
         mbudTT/aFDfw6xDWN731FTOndZA8HHzeCZVkP8gkqGIiiFno20i9fWxwMqVn6DfVgU1O
         WF4tYXRbFrZr7F8RoDt5As5KPE+S+LRmJYTzWVQkFcRhS1SRyHTnO3jhSNUFVj+ZP5zP
         uvswVPkFY74WAA/9jRvvWG5Oyw4C46Fo6JETcsdgAoqKn0q9J2WyckVEab7dSp3inFGy
         +cMRkZWTmQnwaugVtYaCNFx1EA2hUk6Jrh1TGJEsB1vOW2A7LRU+du2LAFXIT4u1fgMR
         j/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=nOa1RhCOWow5Q4Zd1s2ylWpbZQcLPTfR3gq4oCCRnno=;
        fh=Jaw+CKMBpcP0I5BM8ikLoAN1ltCHAe2uNIAAsJepMqQ=;
        b=CRvJClGJ3oOyOf3L/ow0243/cnARH+tY5DlHoKITG4gCSzcne+OU577mHgYDdMcLjR
         gy8wHGMAPNjwyTXgl+29zmdh7JRFgo/XUvtUJ8K24y9ROL8n/7rt5wNgqZ7eOeAt1DQa
         GANGITH2xG+1dOxI2By32ISdarrOor3om4O6K77sH0sxLzp7BGx/sQLWhnudGgWagBdM
         cyJYcoZlshSjS5SqEguez8tHzeUD1FOfI4joBCvmvJ4c5a7+wohogXXnOPIW8M1ylQRD
         +6nuiysSyAmucXNFoq3gqOyJDi+P+2RXFEQ5D2wzuEE8n2EtMKBukR6mYtG8tGa6jCf/
         yKaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280684; x=1788885484; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOa1RhCOWow5Q4Zd1s2ylWpbZQcLPTfR3gq4oCCRnno=;
        b=p48PRJIg8c1vftaBmBxABQjQP4+BcYhOsaOFOyvDbVrfn4uT0PgLb7YagRpT5GlY/m
         UD0Kl82HSYK6Qr7gugzqstybNiAylJtijfy/R9osftOQdaE2v4h0J2OhB55sDXFtm+SU
         4ciMkPLO6NHhyjlMtWXtTCuhwT1yUge9fKFcWkYQnxHf+CQzw0f/e1OeMz9fLO2zcp4f
         +R8eFKVbgz6feGBucp/7Uj+f1sDgyaYqg9Fs2I2Diy1Tkkq0BXCDTGi98eC2dirflAh1
         jSFgIqLpLtET5z/tXxggFyqNn5oipGNExaoguaxtS5IivC3zsafSmVtofyjqPDhk+b+q
         zFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280684; x=1788885484;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOa1RhCOWow5Q4Zd1s2ylWpbZQcLPTfR3gq4oCCRnno=;
        b=naekj/mazAzfR8sEDI1omrA0MfS1xghp4rQx/zmtuCisb4nAmspS4jGjxBIQt+Kd2I
         G3I1oy6YWQyvHnaYgBnGn9AoG2FsiY3KdxaKfUNd2kx/sCBO79ZT6ybKpEb+mVvCeH70
         kuHDb+FFXN8ZXnVGmv2xs1ZAJYergSNXOOnEBvfAOYNgTbQBwuipklq0ruWZGSnovyb2
         qdd8yKDw+SE7AIF0DY7M8LotUY+nz3g08Dy3tixb6VGeaWYhxaY9mBiGwJeqpU235/uD
         +h/lnLE61NM8QcQlg02jYDaAjfmLniqGvz8uAkOdJy57tA40zHDJ3Kv4ow2LdrMue5Tf
         qhuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwHTIK/ni2Mp9BmTihyVZpJASiaOG5GWYYipZZbT1qCSeXW/O4NWdpL7R+AIuVChhPF6c56VRucOQ96vE=@vger.kernel.org
X-Gm-Message-State: AFuF++m/j4OItbmfgP+YWIEG80OyyOOPHeVHHAkVcUZ5S9+nZwv8Cb6w
	gPvFJf4ET6GFAI93wYcfNSKA1FpjY13QB5S8xN0YgBXK6RqtxN2/Ii7SUNrGCtLdUsVQ9rye/RH
	dcWy+iE7r+GZr2Xh4VkcUB0erSGrZUf4=
X-Gm-Gg: AYBFou3zu4rof7u0OEVmMbwBC6faqf3iL09WJD0awWdRbEw+EjQJqzwL5pDG5xNkX6n
	YUxftGaZ9DzokpnGGHLaNfNgwxr3WSC5DQKM9Je2azAzO+SNRJqWepdHeX+U5ZEd5sVSkjoR018
	7cJLr5hsRc/k3LC0nEXc97J0PV/kP3w44REo/+HgLRdPrDa7oQp2oDNRny6xKmNMFn+OT1U8xl/
	f7604KDOOsQY1VOaSM8ZamBREIT0cjJrWwlw3xT7Frgfx6fb4Yc0ynvLWkiHlWlcmkCJHIPniML
	KWkVYxpSudQ4s9LIQvnvFj8eF9Q4sLR7JH2jjd4vhyv3mHmzZURRMQQN9zspi2GZqclyjReImfv
	wwQ==
X-Received: by 2002:a05:6402:5107:b0:6a5:dfb6:3618 with SMTP id
 4fb4d7f45d1cf-6a60d318ddamr20562239a12.5.1788280683620; Tue, 01 Sep 2026
 09:38:03 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:03 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:03 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7ab51a29-a214-4e39-b684-4c4b3b87eca4@kernel.org>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <d3fa15836c409ac6028956c06dbe11a8e0149734.1788213716.git.zhangxp1998@gmail.com>
 <7ab51a29-a214-4e39-b684-4c4b3b87eca4@kernel.org>
Date: Tue, 1 Sep 2026 09:38:03 -0700
X-Gm-Features: AcwNN1WxuIF_MdQAaftvkanhT2uP5XsVUqxVS_gAOomGkZ8JkMrI3Z9K18QQNtY
Message-ID: <CAH=xXfHzwJwo-R=neWSHAQkni4OOyT8LKug6T9kbZmkhH6WA_Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/11] f2fs: initialize sb_info early in f2fs_fill_super
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for pointing this out. I have restored unlikely() around the
sb_set_blocksize() failure check for v8.

Thanks,
Kelvin
