Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37CF43CE70
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382444; cv=pass; b=NAIHIT/QbMwHwP53A8Gs+FOf7bT2p/4Dh+KDdq+qFjdaosNeoLrlPuDNeYNOEXogzS0AbtMfvFbKx53vx1hj+s9OOqmnQBDhP7xxawitwv5JVe6qnE+W660x+rDC3J1LBlZfXOfyHswL74/DgG3dnvdq5sx7SYu868+JRhNrB8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382444; c=relaxed/simple;
	bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEG//lu09bCadzfXy/ODyzJlMuUqFelcRH1stPYVFF7h/DvG4HeP1fm38vnLcbWYOWrey7OcJeyT8AEkwNV3nudPDRmyWpzy87XG3v6ZLMDZVWQdrbrmkOJNu5GJOX5pHNdE4b6wC1I4VuPT4SUbDenXsZL5myJHoYbP92xPIU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=e1tsi/ah; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e1tsi/ah"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1480556d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382441; cv=none;
        d=google.com; s=arc-20260327;
        b=AcX6mZlOiOLPVjt0kOjVxYq4Cmqae610uYLvTKffuAwZRTXqngEFnXzX2oPiHn0Krv
         aAiRIQcldFY0uk2PnX9ZGhRUZ5xAJNx1YCD+Ch0AlbTKMvS47ubUL8Vq0GLzEThNVjgZ
         PETdPTHxSsQL/299cOrkZrydE88kfP0sgL+u4oPigZ+SQ2gZHo5cAUWvmV3YYavalQ5S
         44+1NNGJYUZKOu7jX49hzNXTmHxen0X5aYhVGZzAMWjeMPrflmnX+L+eEGeRX7/YXUGu
         GeuviLEzJaiS09MybVURk308KvCFrRdRX3zA2KLy2Swb2LNNQ9RMfFTaFPvW5FfD++ys
         hdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        fh=sy3yfq8uIkDm/XdfMjV9Q/i2E1BMarTuqXmzQYg0AH4=;
        b=mTTZcXGsT/alcYT0bP3QFwlBzeVlWehStK6UEsfNx6zm3dPMUlLp9PRsr0cZjlTZ8X
         jiPurOKCehsqgB5nn0SAGcnKs/A3SAMHnW31dbjFfDgIqL9TtM144pcDFZrvJu2H1lcK
         lNKQ/tzJgccsNdNBFASRTNzlV+SRH4wI+21eYSiABGiMygzGJ1+N4TVgUY8qcpYterMt
         iMsl4b9AHcQyDU+Wys3mcJk6SEsQfR4nLHxkFVFROuNE+PSRx2MXDNpFYkjxNcUj9FSQ
         kHANEmS3uf84pNsNq5ekiyDCCNSgkWQJP4k1Pon/K2EOzuagBD4WqxcECEErjTPFkKKY
         wyzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789382441; x=1789987241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        b=e1tsi/ah4235p451Eyger3ojtmEj/bcXqVdT40mibRJK5AcoqilOqakPl0B+bROf/j
         O1z0NrlB6ocOniBPPZbHxk/+vVtDIL41S2hF89+z9i1Dhgq//EB89Q/wn2dkf+IubXOe
         LXxJOrAtoLmslpWhldoPU25R4MDjJGMUoOcHPrjKes7jSXZCLeLQWwrQNhHghpJiv3gM
         6mCtFghKXPgmreIHQjvojoxs85YpJl9iHTGhH7MSFbn4Kj2Roi2EXvmfylYND6HuCBa/
         63hs/Lv1DomWkWeer9xmJgEKIwN/WvTvXM2BsES07hKwOlX6BtErUnmpxhTUO5AwuYpE
         6drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382441; x=1789987241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        b=Sb3U1No/afIIGTTc378SCKXD20C2P4u+IFLwEAahAjFWm5ynTJafQFWhmoxLooohXW
         ahHZLii2+aHPpUVIKGxEWi596djnxwp7rS4nr3oKVhiBHtmEY6EXgo+GNryMJAlu8zcR
         B7eswWUYIxKKeLYU/JAkR4fRwn08egZO6z+U5ZAEu/KtwuDzg+NiQ5Pnid7eyjDw5jEP
         ZbGJVu0qTS4P6QaGifGQFMBs7NFhznTCayuNznWyhOzSxOG7XdovlyTCZBUduIn9qTK7
         3/taN7S1bzCRqN1Z8lwTZrqL/y1uNCCN9wrOQMs3lHEguYoQLuwdMbRMYhiPtXlxF+xI
         M/pA==
X-Forwarded-Encrypted: i=1; AKwUvByH7PVOYIXlxjHxi9Cgt3jbicJ0LatCIA0DCCeOr7SyENLr6ErtiNfskyDDEMH9dstTwL3cVj9wdRE4SOE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXlasNrEL9i8ffmdFNTfo/tHv5JYY4te3Gk7Cv7/OrOsryJTp+
	vbdeSLzyZkLoGIRPsdS73jBQJhFyt3nCVwYsKNPfsjF8Lt1II91vjp+Uyd5pjw4+fCmlSvgM3KR
	bH05R+ZgXxY0YWLY73SbeQxbNxyerTPs=
X-Gm-Gg: AYBFou0e3B+29CDvpQmXbSuqmdDgcJuaxLmjNu3fwFXotuFBvW4Ep9Fg4Q6o9K8YhEu
	UiJyXVh7gpIANNtoxTzhi/n8+zkoFq15vpS9d8GK8AZuxCrbzMxyfyiNf8nq5+1UiargSGujRat
	dPZJJ+M/Gmjl+8vyDMY3AYr19eyCp5FBc9hgia6Cwd5KT9BqkzblEnV21+088qQwuXtJcMokGvI
	FdcWpNw/AOIOX2xEIy8qmJuhdlZil7T0pZR7FNRHGbEEdTt36VIaC9X2C6lzBUQ2OtZQpgG0vKy
	36IMOtfP4aI/isQWENQnphLouhpQstdEv3madZvFKYfBzkfxs7/TCoC4fSIBwbN/lGNFj4C4qaD
	Yc+R2qxAX0NKyzgMCjlgZc66C
X-Received: by 2002:a05:690e:144f:b0:671:1bc2:7f83 with SMTP id
 956f58d0204a3-6714e19664emr414645d50.75.1789382441505; Mon, 14 Sep 2026
 03:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
In-Reply-To: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 14 Sep 2026 12:40:30 +0200
X-Gm-Features: AcwNN1WaZUZ01X5-U4jB8BOoolJJHZrM3FcxWuEUtBzFbxVHcUoB7XaLZqR-tLg
Message-ID: <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: xianwei.zhao@amlogic.com
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Qingpeng Yang <qingpeng.yang@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:56=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Qingpeng Yang <qingpeng.yang@amlogic.com>
>
> Mark the A9 ethernet power domain as always-on since it is required
> for ethernet online wakeup and must not be powered down.
Is "online wakeup" a wake up from suspend?
If so: is the Ethernet controller listed with the "wakeup-source" flag
in .dts{,i}?
I'm wondering if the pmdomain and/or power (wakeup) frameworks in
Linux have other ways of managing this case (e.g. only keeping the
power domain active if needed).


Best regards,
Martin
