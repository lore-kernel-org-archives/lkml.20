Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB961366054
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151291; cv=pass; b=LJ6aX55lf141XaD6LkmNwr7e5V1C/XGHI1j4aQXf16t0NWgrrRCvUDIvpNRkhDGFLC9HIzu84VHnum4PvEXulMcgy91MGl9NaT0jhh+JaxoKCcAqt9a9D9YsP6/2wN7JcmKfDbIeGhH2HvWKU3uZAvNfG6UVvSMEDbnHqxqN6BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151291; c=relaxed/simple;
	bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWJcsSIJgFubalP8VAZHUcW+WdFJbsLYJae77NFcqxDCwNIfIWRQukd8AENFA2zGHFQHp6gd/Q8r1DfFTxt2LD4YjPC9/xGUxY5+hLTtqBZOvDxW756Nn3IhiJfq4qdtcclmU/rGvRtBI51FRYitW6oaFVmndyThBiG8GGxd47s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jRnft8B5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jRnft8B5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so68693f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151288; cv=none;
        d=google.com; s=arc-20260327;
        b=RgoIps3UzMB4i4EmDFyUreiBOOnu/zzJzZCkFOcMvfB10GKaOZRJvueyh9+veAqROw
         PO/bwiZpLT0A46rKWIx2CKkkCIBu4d9P+Xsq+fH+DPwMhu0e7d+CqDf+eYd/KXUpaxua
         nv0x4WUWBM4H2QSLeOsYZ76trKy2mVTwK3x1b0n3bAA9TfbCrWsjFwWBHquW/mPI64mZ
         3k3vDpqQlGYJkzuSlHIiSt+pG0k3jwz6/qKUGHX12ucszP51go0YMqrWZrH6y0nTIs10
         sZpOBRomLc4UpLyY6Nw7jCysff/fXl0oihgi8XJ3G+Vtax8vJE3+t2mbqbpmp3rDyUTR
         fEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
        fh=5SkVI6SrRMNJSFcFXiRit1vXwg7t4GR5Q1v+cVJsarE=;
        b=LYNPhki5cW2Q4eMTvuAQ0L+n7xDJD3UWuNNPBInQdjVKARj4nKzHODO4rPXO3CSj87
         RZOPSHXhyvBhvwTFI9VJgNPgAg314Xb7oDuCPdEb6eZ/EL0jzyjFGnZFVV2Nyp9AkwkM
         RTDR2xPyWCAXh1xWPb87TnJ7c5TOp5v8nMDe9awjs0IybUhazAiBvMRo8v0NA3oQwo7m
         ioG/TF0h4lw74mk1jF9ITCab3TSPrgavLmVIfgPLlIihGUx2K7M8R8gU1Hfqhfkx2bi8
         aSbuX+HIOxsrBNOy9ZIO3IgwYcD6boBGe7MSTYW+E6stkxYAjyxK/6u+lQuKI5PD/nPj
         O/jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151288; x=1789756088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
        b=jRnft8B5UGDOkTwcFD420fwte2Et9asVQD9na48sP31wLIrhJfZqpNw6aKvO5Zm/5S
         3d0n2jordDICmvg0OjV30YeSiyCiiaKYB+uehjbc/wpzE/WlFJOi5AJdG1J46b6J139b
         wZ7QEOMtFemVOh6nnbNnFlfoxjc/UuAKYslNgOHjM+aSSNeR8g0rib7sLhMkLAntPoFb
         /+jMBJX+1qL50lOBMHjHXa9p0Y7lxLdXyLjTQW5uXf2yPb6l5H8iH8pRKGYOjEIhMXrU
         lkKETvhYWiQrmVWyv+FwuUZn4rFrObZVBY0R5XkDZQw7JMK4K7SEz0+gDg8sNLYckPZE
         Jw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151288; x=1789756088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9nTbIjY2+t5cR0URENpGmSTYgd1reBZmat/Eu9yGBo=;
        b=d1M8rD00j7ebepCp3cXsuvMLVSErM5fSc10k8MACqeMAFjzZwtRPC1u1WbpVO1tmhS
         ODwpPMnZfnsFzchexew/oshxEQWM8vrRRWUQD5w0/rlP9jTvLcL8GpX9EFdcpJYMU2Pr
         YghmXPeQp+EK4lWKxvhWpy2AAMOvimkm1yn7Mi9TJnDZw/MsMug0fuexlA7gY+u/AhCk
         WxtlToBTZCWkf+Xa1azh6sMz0qXkNzHt1mXvsVHpDhYREvoPM//blXUubPyjrA88BhsI
         1Ixx/WtzVT/gnYMdFDF51BPblNaN+yWhrt550qqK23OIlkR6K48nDiqNDigOWuzafZzA
         bQxA==
X-Forwarded-Encrypted: i=1; AKwUvBytL1lL8Ts54j11ZXXYy6P0vVE8Or5DOheApe5/WsmA9kihVB2gwBogxamYtW1RUCp3oSXSJggI2dASfTs=@vger.kernel.org
X-Gm-Message-State: AFuF++nLhAAZEP3g8+bUAr/GLZMOIFcMPLlbuJqrMEQ5WWzk0pHO/b0I
	s1QRhmBQC/lw4MeGuYZG4Ss3c7gRWFUEJ6Ae86is1ZoHmwT5WsrwKXEehd8EWDSfSLqmDqRm3sf
	3adiSmgAdOqNWgZYb/GSnuMapcHIA0NeOgcAh2gNM
X-Gm-Gg: AYBFou3Ayk8ezSgyT7X5jdriBA1J2ppaNc8qbOShap9ZWYxdINmj6k7yHE47JdaCtEf
	kdLHgdlX3xG+JUUx/bEKyXoyDplP/9T5cAprjcKaPhIAihzFjYmLm9YXpTCcnCWDETXv2TVbuET
	k7gUp+9y3izRdMlCI76F4UlzOQRFNOp5bGbAwodqpPAcI1MZyON3Rd0F4hZc+rxtvqc7sqF8+ip
	A62wo8wGxhNiuJL5VjBJviKooCELXLfXguKo8Jg3Se21Xic3MXYkD2KIwPD5RwG+KlwnB7aJsx5
	UN4c6kPB2hWLo9rAQhAc0ZN9uZ7Vme9Hx4mek60wZJ1lNjyXmZ6YYH5EYmsx7zGzbTuxufqvNBz
	wNA14QePwtQ==
X-Received: by 2002:a5d:5887:0:b0:485:ae8d:1e07 with SMTP id
 ffacd0b85a97d-486eb3543c0mr6951383f8f.56.1789151287712; Fri, 11 Sep 2026
 11:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234401.2339633-1-jthies@google.com> <2026091023-numeric-husband-1b03@gregkh>
 <CAMFSARfnRpkq21j7WZYqdthy4aC7VSPjQAKm1eHvbYxhM6pOnQ@mail.gmail.com> <2026091139-spindle-zodiac-2342@gregkh>
In-Reply-To: <2026091139-spindle-zodiac-2342@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Fri, 11 Sep 2026 11:27:55 -0700
X-Gm-Features: AcwNN1WsFlTMBvEiNMDzIzZo5OmwjBJhmGTnyMtJQR0FexDEekyndWgnFLMhtM4
Message-ID: <CAMFSARdSyB9m72r0gpujZmknN_aDVUnyOzKHfdksKhemfzcUhg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, akuchynski@chromium.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:

> Why not just a fixup patch instead?

Sorry, wasn't aware this was an option. I'll send a fixup patch to address =
this.
