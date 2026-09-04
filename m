Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCC4A1DF9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530112; cv=pass; b=s5+AEhNreztd+tv0O6aQUYeptgVKNI8khpQj2lHMVy0cDjAZt5rLLta7jFmSQHDtCjTJ3WN1UXouWllM1dSjIQClTKH/BiNb/7zPZT7bgXi4cCPXsjJLUYzhI1FwhvgD2lhE6ZeSkxe1ISfLOBJ0ip44/YidNmKH0l0NDFAKi48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530112; c=relaxed/simple;
	bh=o6r0SiHg4zF9vX0kWQVpDU3Ak0Ayph/EQ7U9oRk0i1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7peWCDJJY5U8/pbKrNsPLPERInvfvagVL6Nav8mOZQQ7liTheI/iT22hB/0U3UT13TCmHQjfn9J786I8HVhtKlcPoRRN3ohgq1ux9Qic7Irs+uV0RbP+V/wN5MVYFwof97jEP6E7kdRVLf6ctUaEo6dyzAKwZF0uqGVKgcslDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnXkA/qT; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnXkA/qT"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e50a650a0so99675985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530110; cv=none;
        d=google.com; s=arc-20260327;
        b=qeBct3EtINh0e7l0VD4zrAjR76ha3NjAVNohF9he+dbdPnv5d3G0VM8oak8ptGj9Gh
         JCbsOWwXtYgpmlV0tQBz4FLHJr2HHqkVKu760jTj31axV/73ERbVpvdaNbWa+uoDmw+a
         X9xDoaU7MvlGPr3qwlYBVRcJRkJnjcXsdB0UDglAu23ikkJ3zCOYASiDacvZk1o0yEqI
         eT/ipfEMSF1isg4AoDOhRf7NfHDPJ8qrmWoVCMhcVyU/QZoW0F80OUjsR4YogubDeh5J
         +Dwspt+Um5mSoNA4yO+VQ9v/KkIZoHsq+lMnIT8EooOwdvJGuZzHqIFLjgfioSza6UKY
         Pdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ag2kes3X+yx+hXtnnZD26gCaVLqPvhzmqHhNLHDvSXc=;
        fh=UtcqqqKsZze5B7F7J4i3d/007l5bsp1DQKJYeHN0Gdo=;
        b=hJrbNADC0pbv1cZs1+jsX3k+H/GPm2yHtumQjjW7p42s/lcSoikdSYJiEi+TT6C//Z
         E7Kuutreq8N2GBDcB8LqqIcXqrIfvmI4PXEPG7DoEehkfnXePmPM7NSvNMOQuO1tHD99
         Dwh+tD8sJlJUHCh4o9kKnQeSKya83JmHo5o0QYcfoatP47VI5ieMNTv4koDAFM04uciL
         Vm5LWbUyH+bAy8vEihz1G05GqdrBho3xD+UL5KtK9tf+gbTHFCu70sbzSnFGv8cEpQqu
         yRgFLoTdIOy85aTqmwfj98/bg89REC8XxbQLIZG/+HnH3NNCjqwLRooaXSENMK1DcLBE
         nDsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530110; x=1789134910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ag2kes3X+yx+hXtnnZD26gCaVLqPvhzmqHhNLHDvSXc=;
        b=gnXkA/qTsEMxQp18kcn2+5X5pdz81sJdtcJB9GfVRea+or/rBVutvpem4SuGpMSMww
         1+eQpkuDI3imzdnWlRUBIk4n/ySn4JFvwEE6YFFCZNvY/kAJ8WE1ymrh83S8bj9GJHPf
         9A5R9SsCe+TyniMVdXGrhtykxvpsg0l4LwQGbqMJ7nQ5BOTWB2Y7ZjozxeuqpxX7hmGL
         cRs8KJK+ARcqy99YSBooEMRFp76dOzwSwU/JSEHNoJPEc4AkPS9whxRwyDHgoaLCCYAu
         mE7AcJAlDnwqhFSsYt05+f0dkZTyEnf8RUsecrAjQehixI3LMbxnEzWjhV39awS1kgB+
         6Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530110; x=1789134910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ag2kes3X+yx+hXtnnZD26gCaVLqPvhzmqHhNLHDvSXc=;
        b=ZyZH13Tdq0QswO1Y9lQetdhgIXTvh0Dkzkc5/X8Nm4ebJWbky3Tzw9fCOtNVJJ0Uyz
         YWIXaUc3ldpOM/LuGrXJX3wrbvvxOBFi0a2njv189Ia1EVOpqKsTME3NzqCCeAc1XslV
         TO4C/jqJsEbbci1uKewIdo1N867sRRVg+2exHEaZWnLjVBb3OlznAEo7Eia/T4hCsU/T
         6PkQbLWfjQGGgW3io95xH9mnDNwI2nHDoCRmQM6m9cpwMIQ7FzWJTmCnvb63INEc0Nk5
         NzWsm2ApXcJGKrlsD2hYjrZ6ihRICR1xJJEn9pgm4rV7jz68YyjeKjOI1YFWC5mK8k07
         e6xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv7UHF8mAbvzNKOxXB3vLppxM4DqIj2k+KvQtoWoOwxVRS0/x1fBjgGofwyzvQTacuOKAncJeirDg/ads=@vger.kernel.org
X-Gm-Message-State: AFuF++k6IWPZsu2+mHoDIvYw+wpz7zDHmE0Cj+LT1e2JocHLmU7nm9ec
	Enyc2NE58FGIc2QdqPUsuEWKWs6IVdd4lKfHB6qvre9hjqJK72zALIpmp4ucEs8L6oOiBSex9N6
	+KWQzdmsBaZV+qWlbbxOmWAs0I++mNTQ=
X-Gm-Gg: AYBFou3V1qTiAo/O7AaAaw1/AtoRuOrMvVXRbMVSzKIYSEGGIPuZbyjfFRdqP7njlSm
	YOM+NT8hCfxbG1WsoV4lOR7PofxJqQZPohqIl7Fmr0LB+4AcxjnXzYHul1G4Z+logc1ntLhMeXj
	5W35LEkNtUOOy/YX8lUkM4Z6gVMiuGBe5tW6wTkcDSLXh9ZxzVCo5bDR8HLrdfuGxgEpKkOLuEk
	T8SofuO0f9v+0Zt9+CgrqKHJ2hzUNRl61Z7oLLKX0Z3+TxWGeEctCawwVmjVEKc6HFzIfojy3jv
	Tv6O4sZjPBwOIhSx9O1bM+Cjzs4ps2Kkq9kv1zk1k4H8V1NsmHSxln/eQxYKJaJu2WauwbWUF8C
	o/76UstKaZD8JiUN4QsMwqdJdBo4+jprbYb8Yx/ryPmOJ9Xfj4k9tn2uLUjaYd5k=
X-Received: by 2002:a05:620a:13d7:b0:92e:8405:7ad2 with SMTP id
 af79cd13be357-93980462eabmr443214785a.41.1788530110195; Fri, 04 Sep 2026
 06:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904115443.10393-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904115443.10393-1-hemanth.selam@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 4 Sep 2026 06:54:59 -0700
X-Gm-Features: AcwNN1VkK3sXdz93xQy-xDnffNJjNtT9iNJiKQsigLZynm8Bzjao-dwL8lzoUKQ
Message-ID: <CAMo8BfKHG=3BZM9Z_wJgBSZ6hMGRZ9D7KdBofYeGdQ22LELnSw@mail.gmail.com>
Subject: Re: [PATCH] xtensa: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:54=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  arch/xtensa/include/uapi/asm/mman.h | 2 +-
>  arch/xtensa/kernel/entry.S          | 2 +-
>  arch/xtensa/kernel/vectors.S        | 2 +-
>  arch/xtensa/mm/init.c               | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied to my xtensa tree.

--=20
Thanks.
-- Max
