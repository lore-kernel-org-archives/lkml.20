Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054473B7742
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197643; cv=pass; b=pHt/3KtznSUaTBtB4M6n2NlitQfbNPFyaRviouTMtY8pST+3ilmEan0oQOt85eRyRr44cUPbttSyo6vhCi/PyC/bX5nEIzQ8vATiytQWzjoFoMzEZYqrAlS0nlgFLwXnukESOyQSce7lJyCVHHwFRyFoAqlaSLi4MvqmBoWVUh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197643; c=relaxed/simple;
	bh=Dem5nK4pGkIGesk25ZB1fjJQVbSK5tclia2Nf7cl28o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJIHYTvyz1BpprBhKT0TReNp46H589+gAcWWPb+X3BZSK8+9Ipz3rN7hjTMIg6o+3OJyPT2CO/yfCkMbneBjIOI9o+Xn4GKJbdpOh5X90eDF15brNXOcWiz9Q2dwJ8WhOi/HGCSnJ3CPpwAeWlDEsEBWe4qlML8QJgTg2BJdb3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bCAAER4d; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bCAAER4d"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so2405096a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790197634; cv=none;
        d=google.com; s=arc-20260327;
        b=aEuumGX9Z+hsY8xUm6fTTsrdZdQXM/7FFiQPujcMn26FiAG6Tl6KuaGVXFOtqfGfrE
         AwYevgJCyNtLLf6lR+upyQszNVFTi1eUe+mYI7Hw1qSeQ2NAVTzXtqu7TJ6JZgY2QSZi
         jsxau/ESdMTQ4Jee0/Cs4AefFe3hcBuwvYuJ1OnJERS0iNSmGtoWBdssxmCMitZH8lbJ
         koeOFwmaRJaPNT5TvLtSDCbBtJwy2lgJmyU2f+LN1e6ReGoq5ALnl92h7t95AGb9lzeZ
         lHv0SJXfGM6Fwkj/LhOQrBwSpR/2Rzr+/FiqTlUOJI5a0KHjUAG1pzpgC/tIRSxv0NOT
         bI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qY60ZsRG5qhxIjnmQPWdSglWYuMq5BNKrqrKyqL2BrY=;
        fh=ZiTbNwowT/zDDCX4eR9GYT5aTaI+gXilzu7l6ItgdY8=;
        b=acH8CMl1MORbLWtd1rMaw0R0TVPeH34uxkJP1r/vpnY61T7WqJQPdA/YrbzQkE4gtc
         SQhQS3H7IbFBjw2MqFxbGBiv9FXxwk8xwT4o+I4KEB7xehoxVqLECk/cbw6AhEpOzJtP
         xiztT48soIUxsBf+JkxD18Wep1PWlPQ1PEof93GGp6IkWVjqQMM075u6zzdu4WnNf6HZ
         89Y532+RvjOe+Ux9NwIFh/DLSb6G3p73fJL4DTI4hC/0/F59H936LeqWdWS3OsIMuRe2
         TIv6fp5TFdJ3pC1dWrGe10QP1lj08x+Vijz0TM0b5O2pES3IfGa+ONgZowsY51sryl3S
         vjrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790197634; x=1790802434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qY60ZsRG5qhxIjnmQPWdSglWYuMq5BNKrqrKyqL2BrY=;
        b=bCAAER4dg/jSHIRYOR7qihHD5nLu4t8dN4m1ecxYAHyO7f4hoSN3Rwa0u2JpsmBed6
         Nfl7OD7nzJ6fUxPdpjhSarOIk2r28j+ePUwNO+SxZmTF5Xb9C4kCeUFVSvcOC1Pr+644
         eQC/gHgBT9+/rf7xPKrLpkSG/FH+Uchaeyzq/V/EYc7KkdYqXCNLlTVV+GmAmLdS+8/I
         VArVHIzRXVKUXJYNhVjCVpvJt7zP6wIecXWzJOLMEpJOBmWEjJ8d8qbRicf4Pm2O8yPH
         I0kFWN+OE+/H0e0Ux8ctPPVQKxpw6i6z0TTFTKiBT+CGlNlRuMrtzhmdYi4nVGJ+4DEy
         4P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197634; x=1790802434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qY60ZsRG5qhxIjnmQPWdSglWYuMq5BNKrqrKyqL2BrY=;
        b=SbwqfMll9Q66jl8nrtJ9qus0KqYMpIYTHgNueCdU0+OkWkQ8h0WA7WfQC7P31pKIh6
         hcL37+bKSdo7qnl0jDrWsTt0jPg5zWm6rr8bc1pAkogtJqDp0g7tajChZxgBsXduGs52
         DK9qWsTzppiVWcA/V76HNUiaJQLKmiohjW025h81LDJNytfNoKrIno6hC6QAQriwzc6w
         /OLDW6uHvAM9LF694v3Vkm75+0Au7aYevr/CHk1gnky67dpZjXvMGcvPjRerRyqk1N9Q
         XRzmI35tjLXgYSokSMH/ZjDnOu92EhGLX2V9svjmKkjfnJ3On8QkgPufMecqGmeVHh5J
         xLXg==
X-Forwarded-Encrypted: i=1; AKwUvByrFNcCN6wDAjRQc6QarN6uvGM9JZxXn3wCY++nkXHKUMRf0mcxzCUTjivVa+cefbyeuQk962cjYDINXiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m3YX3P96WfuHDbaCJmjEJHCaSww8JJZKv4qiU5yPpi7mOR7G4c
	Ms81agj8PtPDmn6Ad8YHM5pa8k2p+Q0066Bmq6IX+osM2bP1rfoVEvT0dgyXoYwhPD/5OtkxRJ/
	dT4Gfyz2FGFaM86ZCZQEOik4N0xMykf3Y14wd0bOT
X-Gm-Gg: AYBFou064BMr8sHOSXq8T9TIoauQpEkatZi4ZiUsnRX/OJ4MgXSoPuJLUsrbv4tJCTJ
	rdO5KR5sGbgLhV340jAFpNsHjOzW0CKdbu/f0FWoERDTvgzDvs96/k42BYyAIP1ZnGGHNZg7oZ/
	Iex8DdzVcg+2jp79xSPgCoXE6NDYnINPSGKWZOCIHSGpbyXhx78/OmUkk9x2avb5gALe4KJF8KE
	AY+Y88dlHEYLuPkdZzR3d2AUZeMLa1Js3Ji8dqVHsEP7A1J6tvH4Tv9jxGnHi9Pgyt0mXUPOzVI
	r732+U+mHaPPC6ETp1QeAvtY9c2fU9DNyU8c7vKlvAQDvT3HoabSmgEiV7vMqox842wQTNKwmn1
	40duQ6kCjEsI=
X-Received: by 2002:a05:6402:388f:b0:6a3:ff14:ebc9 with SMTP id
 4fb4d7f45d1cf-6aac8f10129mr413713a12.11.1790197634286; Wed, 23 Sep 2026
 14:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com> <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
In-Reply-To: <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Sep 2026 17:07:00 -0400
X-Gm-Features: AclHuK979p08Ta0TyW85fwx2_KJpKtB3aJaWYoJNW4H4ynPYtF25vr6stPl_yEU
Message-ID: <CAHC9VhQzW_tCCLyMwkuFhoJhiyC2XSsUyQF19+Ag8X1=J75qUQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: David Windsor <dwindsor@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, alexei.starovoitov@gmail.com, brauner@kernel.org, 
	john.fastabend@gmail.com, memxor@gmail.com, kpsingh@kernel.org, 
	matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:14=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
>
> This implementation was chosen due to its immediate mergeability (it
> only touches security/bpf) ...

Ooops, I hit send on my reply to you too soon.

It's worth mentioning that sometimes maintainer objections/NACKs can
cross subsystem boundaries.  You may not have followed it, but a while
ago a LSM was proposed that implemented BPF program load access
controls and it was successfully NACK'd by the BPF devs, despite it
not touching any BPF code.  An argument was made that the proposed LSM
manipulated internal BPF state (there were arguments on both sides of
that topic), similar to what the proposed BPF kfunc is doing with the
LSM framework.

Hopefully we won't have a repeat situation here, but it is worth
knowing that code location alone doesn't necessarily equate to
"immediate mergeability" based on recent history.

--=20
paul-moore.com
