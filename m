Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8B4C33D4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351105; cv=pass; b=M4jLLHKtESA9tKFRZ/7xAma+ApLYp52QHnlNfduMJs4akvHgRbsdwQ6tgsIu/4k9aphGiNv0MWjA5CoQuTWEWnLume/oCPBoHVFWnQwPWjkatFtlE02MIBIaHF5rVaTQ0qqipzgQ5+FNgReI9IAanC01pSTHXIcAIR0rGOpjzok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351105; c=relaxed/simple;
	bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZWI0w2d5NpeSK4J52comr5e4b9J4/u28u4898kVaQd9WMPAjWYKBBfgG7Zuu2hVYnPBZdJQANTaAivN5XcAGJ5w+jD8lddmu5FyHJclY6jgm+CcGi4Z6eV0GFu8qvRa3OZV8Eq3LZoBZkhZQrehhMniF8kjgqx20OeF6tng9qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWnT8QEP; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWnT8QEP"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eb15037aso245420e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351101; cv=none;
        d=google.com; s=arc-20260327;
        b=IaQv6jLAIeUiHaNBTPW8H54IbddZSizVx4Notb05rdEii5tVFOlFATGEQhRBgh3om2
         KuJb1rkmC7dWLJwItdIujskKjqVTWdnjT2qAsbf6Xo2vnl91kvQDhkc2D6U0FMh9GthK
         89GpHyt5NHp+VcBFRE+VJKzE433Yi0xI5dbJEJAXHBQZorWvpdsK7ak5IFmigXwjIeEg
         +16hKuN3lQOuZ4grcFTIpW1IGzEl7CtIht9lGYW/Xp4p62Vvzjwbnt1B7jHVKlUHF9vG
         QU6xHw+sulac6szbHhNEI3kynGZGJ6GTQhEg1DDvrWLcE85BouGyt9Cdf2A/LYClELzF
         8Iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
        fh=HlHYl4RKajTiWIMTmoGwQ6l3rr2979c7PUPvJzaT5VA=;
        b=YcpMR/gegcNgXhtgL6u2ZAoWkhkaN4Jo85A9pQ2pDNEO0kLn/3s/82bWiLwZZnwSic
         WppKFAEkoX3TPALStR68DiMCudmSLq6O3LaBeWlxfLcSHNGmyWqzvdgWEZ5EUfutQwXy
         8rgU2T/imbREpmTNWx8qA5HWDodvQBUWSz50G5FTax6lpyxuAfJcv8a8EZ3TBISZPO+f
         FVFrE5l9EotqgFZqFZcJ7nlSQU4e6+RU04R/q7+o04V0gt58IEmMIVso5okqQJR8FUIK
         MDWvVpUF6Qk6+2eiF0UFx4VdmLXbp3tSRBmzfVVwhKK6nxkdrpaWHyZDYpgGSRxa8W+x
         u5DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351101; x=1790955901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
        b=VWnT8QEPp1GVE7wlYyyRYUXwlWdhqaWYOY7yREjTdwdS1ajtf65fdQPiwqpXB6mBrJ
         TqIgIo0BViW2SeuBJndRrQbmCwUMbPzdqcs7J7JA+tcNbq28mANOQoQD0OsJc93EsYfc
         Ryd+dPKQOezNiWgjModL850oSgwQJUo+1bNiaE9XD51B/gTZ8sR0Ers+Z28amgqdoh9F
         8GkzrNkK97H3hgZLssU+tGn2LnOrlrvyXFKDgwixmIYlbnOlzOTpiYe7UgVo3PUKaa2X
         HSE9lwek+cDOYm5yuN3bumGzkbIUlj89e/cbM0aQ5p/+Y8m9x4l/5I5RiarJ770nzxW9
         /sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351101; x=1790955901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
        b=AxyML3Ih0pcUo4WQdAdcFadEPuITjBVuuddM0Ith4v3fal6w9IMbLuXgSSP6JTFkB0
         neTmtG/YgWLw7xL9UAj4n3+TSF45kxrWS9jVlUifqtdUssIRrqFtMKkYnBUGmp48FTLT
         XRJNrLfDJpqO8yjdXzqLAVbWJsxLlJVd4fX91wKdvIwrZ0sI7NBdFSx2mK+WQefnr3ZE
         WscuylQeV2So5Gx3QVOEYKWGb5gPvKIu8JjxlUpOqxIKpCH9EtRbx9rza8Ck0H+n48nX
         Fesxtk4vLgc0ns3oJ0aZ0Nv8crvWK56ZS32baK4vsTcfJ7JKi4xekxmiaR4jYf7GH8dY
         zKoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdelntIT+yUQGY2NPrnQBYGmU7LKT8Eb3PCidCpDvbuZlFQfWnUXiza2qBQRJpIQ1VEpqw4y62PRIovEU=@vger.kernel.org
X-Gm-Message-State: AFuF++lpS8hQbmDP4l8NPR746yx8ihCZY/zinFZ38Yl0KqdrsK4Lqo1Q
	Pzatrvz/DHCkS7EsxSaLKDsmfNtio5FVa/UKUSX+GsBbaAMxsh3gtoGUszRD54i9jsnocIot/yP
	Kp26751PAVtPVx8WguI0IhgW2dXAAFTI=
X-Gm-Gg: AYBFou1nB4VQ2xU7FsSubVLwZBOVR2VUOe2fSYDRzdzUAV5HXdYu3YzaKwgvEmgcN3S
	TCggKwxGgNNqUn4K63vEEGjBPvUllPZGJlb+mVutFuYko2tEkJ/Efdr4bJ1QPBYdn3TaVmwikLF
	kLRiZPtHfJDWnYLAvQL6xZV9v/vVhU3upt2pr05kAnrbrbYUaY4wZyPdgSXirCfcaVQEfzJbFaf
	7wpnBw2L94N4C+76J2ndcpbDrfISlyoFleVHDG/foWSZkWbVl+1l1N5Ijvoix/44bZPc1qo3hZd
	jAWdE2ZIDgY6J3r0NQjW9eM6hQQVXroH/zkQs7taHWHmEBUvH1hDhJSk8xBs1Qbb61w3p4a1hzg
	CcfQxAulGqxc2XxKl7BjI0AGriAvypceiLph5zkzd3pnD
X-Received: by 2002:a05:6512:378e:10b0:5b8:de9f:85bc with SMTP id
 2adb3069b0e04-5b8df0a5e33mr1493051e87.9.1790351100604; Fri, 25 Sep 2026
 08:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com> <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
In-Reply-To: <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:44:46 -0500
X-Gm-Features: AclHuK-5n-rkchM_xV5oHlhGXrOaf5sD-uI5jyQ_MtR8PlMTXUbFhv2e7KwRPTE
Message-ID: <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:13=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:33AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Codec drivers are not supposed to do anything like this. The result was
> > that the first second or so of playback was essentially inaudible, and
> > very short alert sounds could be missed entirely. Let's not do this.
>
> Again, are you sure this isn't a workaround for terrible hardware?

It's possible, I suppose. But this is copied from the already accepted
aw88261 series. And it has real effects on my devices. On an AYN Thor
without these changes, if I start a video, it will play for 1-2
seconds without audio, then I'll start hearing audio. With this
change, audio and video start at the same time.

Aaron
