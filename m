Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546B43DEA1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352363; cv=pass; b=PCbr852BSl+tBsXwS12sZBwEdq0l5ScEgI3woqkyhIAsT3IIP7nFV1X9VOnZ3y89zgVB90zhzDEclxavZJ4EpYR86l6uFz2xID9/BP7uPLnJaFk1LdKFzBaNLharoH14Tt3/6R3r8P6y80PtLzf6DiIyiKiov9f6bkCnBsi9PCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352363; c=relaxed/simple;
	bh=N8W2TnBERDfav+D1ToOJ1Gvhq3bpy6in/FMcjcflXE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eg8BwZ5lac2QglXxQX8QAcEd6Ix0nkmMUnWtEQzBS3uySik8TPpHay9Uel87cneWsPH25ubyH/dSnzIUqAbczGwUl7IqU+pVkaqDyZsUfsVDQ7uKv0cwSWQYWosZ9RtxKjCmNjX9nvE1z425oT4+IJyP9aHqWlGKV2hPjjVQZUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfPJ6ED0; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfPJ6ED0"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so8640291fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790352354; cv=none;
        d=google.com; s=arc-20260327;
        b=cQSNnORlRrCIJjTyjx7mdKXO87Lo5PuiZ+yKQRP8k0Zu3cwOsW+HTzMdGFORU7ztHh
         AJKid+1p02djlK8DuUcBzpJBEE9u8A2owAfxefYEntGFdjYMQcCaZV/IRLd8+7OAoaYM
         jCXis3r5qXV0cB49Xki2hBCKFi+s726kv5N7p4k16P3De69c+6G47Op+W34x1VEBkMGv
         Y5zNIX8mACRckFTxn4eULcBnoiFEr00xmyuMzYQwCzVOCIfhSyDS+gzx1cZeuCLlsyWu
         DP991MIYDkIshvF8DFk9F9mTDOSjONK7vl9yjcKNR8sMHPvu2DZqq5JhwW5CZgU2lsdN
         NYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYrfSS6k5BXHNWQpa1AoSz3JMXqef2ioppRjAdP1h44=;
        fh=SVDP62VUrijg0PA+95NKvNn6CFk15qHagmpGTEwA3q8=;
        b=KfHJ72YTLkw1yjjWT2VKtsctU/PeWTV64hDiTNhfAy+SxjOhprbaUccfBow2g0YCKW
         E5D0IOMif9/Bv7lH92I0tPKzx7q8YuCPM0FCVmWAVgpEzGjf3KZ2De0FKdLzEvSbHM3u
         d2jcfxEiDKDbKB8pjb7s45k9ri4+DgtQWxRON+Wgk6bCC+idf30vaC+DGhF9rZMdQpdc
         YAE3rVnSzJ4iFIJ273sM2jwgZsqtKiVQC3GCiMvgze2Nu3sXJR8hq74bYuwDlEkBOaZj
         EQGTq1+5fYhUnVpHXyvNKb/h5X7p2aqlr9WXFZq7l9qzYNzSlefjM6nBHMwcWv7lBzsH
         mcZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352354; x=1790957154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYrfSS6k5BXHNWQpa1AoSz3JMXqef2ioppRjAdP1h44=;
        b=hfPJ6ED00zGQ/87UqqPzAcKZ8MoH/sOD4+j2WQQfitE/sZbKrrj3p5XbD+qvaypjvi
         rM7nciaxDTZeOZJs2gRa3R45wH4VKCXMfr/7yNVTu2qD8nSIGZ3o7cee4YBDqQqNihy7
         Cftw7z2VTaVrJpPWRcwa8pCyBBkiErstdfSW9o3UUoO6Y+7FLpxSacAC/Xm7dV6J4LE5
         iC3ZqBZz5nDSsMajXATX+oMslJKZ54LwO2HmoOhnZ2vZqX3UW/77sReUESVKun4JZED/
         hlLTH0/ZHAu4fOSMtaYzxC8mTDmhJ+lIiz9QHroRa1v/QOFKchOZiJBA4kxbu0BAIn33
         MGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352354; x=1790957154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYrfSS6k5BXHNWQpa1AoSz3JMXqef2ioppRjAdP1h44=;
        b=qPgyad0Zx8Q6z9y1b1HrlrwDfC6M56joOM3rQlRKyse7gcFOQb3QkZ3ngkwDqpy7ET
         froqOGWtrCW9+T7+hxTVmCkrrczGGGYvcsiBpzOGy2c3IUupJ1Ia7SngQTwiuAhMOY37
         OhIP2DExolM3IHmoCccx67ZXbjS8uADV7uDD54QOgye0aybT7JGOCzrMC5faUSZdL+sI
         WMYDDxsEx2KC6NVS5fPE+ILDQtv9K/Ktp5xWvPhOuT/6/62/VOCWeomP0m56yOS9oMuo
         E29emWSTn2NFhzIyY58h/8LLt0lFgYrjh5PMNof2bjBJfQ9Nz0bpv2cVtTbJFSFG0Uqz
         fthQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzNIgrzSX7EaX0XVe8dZNHXvtIC56wFGaQC1ggVUEj4CnMHTZ/GOe3HNhbe1HZP2Xkbz6PH2DMp02y/Lk=@vger.kernel.org
X-Gm-Message-State: AFuF++lzzhYWtF854nxdYe1pKmkNE/2VF9PLiMtfs8Lxy/5F4SDZIuNC
	WYo/QB3jPjsI56Z2H169J9qnLM/+9GD8z2VotwnuP2B0wrDzrHQrKFfPPWOfEEKWHFRGAe07sD7
	KO/0Ga7xei6N578mMB2EjwOvP6p3CAYA=
X-Gm-Gg: AYBFou1J3ZVRJdO04y8Dkv2qy1dft6cY3OGifTS/fC3V96CYRREEmvZbJ/UWsqXIyfO
	KvIJx+s1VZjhPasND+QLkUfVQF92/J8iMRLjDgcw+wwNmwuZFpymZaxCs45uiQx4Ear5EzeNpq4
	aFHb0s9aCIExPXNEvs/aRCIQc3Ih+Sx8AueC2HOtt3PfOyuVTe8n5SeBVt7G/WzD9vQ4UZyME5i
	kcyuy+x3SGdAKQaG+tDW0+TbJV5eDS32CjwyR0T0HfHCK6JCaR4kISc2ovKUZdS+1iio2nW6dMH
	CyH+cpW8Wzwwt+WZYkaBGaU21CAsZDgsp/Jq9p5bahFG6rSVpSvYXX0Jy8cl7ytcOJCS8hT/5xC
	sY0TZnAXTpps2aEZ7cGXzLcf3dS7Q+Aa4piCEm6BEI5HKY17oNLwzPw==
X-Received: by 2002:a05:6512:ad4:b0:5ad:55f6:1ec3 with SMTP id
 2adb3069b0e04-5b8df06b3edmr2567328e87.5.1790352354192; Fri, 25 Sep 2026
 09:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com> <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
In-Reply-To: <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 11:05:42 -0500
X-Gm-Features: AclHuK-wF3MJ8QwO73hg0uMSrMhxLAJBYkbJ9MTyCnIniRFNFOf2OMgvN6BsLP0
Message-ID: <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:34AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > - Invert the value to match userspace expectations (in the hardware,
> >   positive numbers represent negative dB attenuation)
>
> That's a very bad compatibility break, if anyone has a profile saved
> they might get excessively loud volume from their existing configuration
> which could be distressing.  It might be better to rename the control.

Mmm. At the risk of sounding like a broken record, is this any
different from the accepted aw88261 change? I wouldn't be specifically
opposed to a new control as my use case, Android, is very tightly
controlled and I can just update the audio config I ship. But more
standard Linux use cases that rely on a standardize control name would
be stuck with a non-standard inverted control forever.

Aaron
