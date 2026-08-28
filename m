Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB5311C2A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927650; cv=pass; b=q6qlj+TZiuZh6OSjtrZA0ZonQ6AgbptO2zOwjd0RoUftj5HxdN/UBYV5qLDTRTq9DDW0JvBemyVdNQPGuNb9Hc/JxXrbOTj2V861Tmw1K4MePYhcWVaBonwmFHRezF7I/TSBBZIA56hyxDSwLKdKsHrRSKczg9DP5APCKQ/nmjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927650; c=relaxed/simple;
	bh=h6urPZgF8bTfvFzVWce3FkqNPdyyhEqvIBFSzMK7R9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jny/thJ5KapsX00/AMLyZHejcPn07jzCVuB6UxKSgs1K8nAPgj32ZgOeLNoO//Aza2bj2L3lwTALXiSbKJxF8b6rC+K9Tf0XvE/8RVRujm0W/1qwCsmEBFae7Hy9nT6BDVAlW2Ly8q4Py57i7nsZeJO9vBcfEVkU69PW+FcT5II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PV+24Fli; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PV+24Fli"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52f83889a93so8925631cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787927647; cv=none;
        d=google.com; s=arc-20260327;
        b=cAkdahw+2f2vtjPMXvFOdYwWo5bqQqq1hDyhrZKRKElZMz1bRxW1tZPCEk4X5npqIn
         SdlAYsmYBPeqA4GHGD/IKXS4ToLpZ/U2XJ6dVAftgKyBLyVKYkEsKnH4B+aWRRBvduvS
         hxghufW2yvMsPhKOPN2rlBxZCs2RcsSX0Nd0VBFSvIB01j/PmHke5Q1TNuqttpqBgPst
         UwJThPkcHBv1E9DKBih5fQS+cLkm+sEvIxi4R3dfmwVvXQQpC59//3BUeilVFBwYlLBC
         BemqVbhUXSascrIMANQTTuYcDnihnwdq5lgs5wxNQ9blbly8v6HsafDbEtGKHzpVCMSN
         /Nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YumHW+3Khcd3HlEzxF3Gk3LiB4e45hriCCvI83W4xOA=;
        fh=MG0rq3lweGhGBCNSNQOe2tqSDwMWKNOz7BBLklXRGFo=;
        b=Xr87xDYPIPBHSdo3CquPmwwT5KbnkAz/RmeMqaS24xvUZUFN22tv18wupcn7Ks0iBj
         H5dGXO2vroNGwDV7joB7lMrY7f4orI/M+duMPvFpK0WxZ1nT9n1jrdLp2jxVCrNqSwKn
         sPFQhsok0oF1IXbCTqIfL7hIkRPxMhzNQcgRuTIsCRtt0spjMVGK8j+YbccsaWmjRugs
         IKZsWrsNrbO0Q37qHuob72AjLw7muMkfV/A2f1Dx1KR2Vgcv+AUchPgbmZ2XPV+VHvdh
         jEQEnJ3Va8av3KWzvPsS1qyjSVbBwjZ2RvSlmsabiHToYnwWMXq8RU0k12qDfXk9MXGm
         UTUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787927647; x=1788532447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YumHW+3Khcd3HlEzxF3Gk3LiB4e45hriCCvI83W4xOA=;
        b=PV+24FlinxZYo4O+wz86GSfYocJt9h8gu4/B3ENqClxT1pRNumsocQy1E/bskA9C5d
         8PTqDpruTr3W95CVLFMU631dbacg/Rf9nSMu2f4MUD57uy0aeFIEfrL3+86QGo5gj1x+
         4wJbiBaf+YO+uffa9xW8ANloLqp3w/OlIUutdHeS3tQA3EDNS3zE3+SOwMat8NyHwKfz
         HINtHPMdA1jEQEqVxeHwzXjMp5/KVs2VqFMZxlN+yLmJBvtZwAcuNJEQ/iPTsHMRsXA6
         Lc9iqRo4E9i8QbmMNfJsd/jW1JXx60wWOMynuCylkNxd96pVF3a5ccXQy1SIVZrkSTXk
         YmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927647; x=1788532447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YumHW+3Khcd3HlEzxF3Gk3LiB4e45hriCCvI83W4xOA=;
        b=N1GEVB2Lu+2PUXbW3fV5vDwRTZIGRV7q+ryTCUphr6N8F1u69lx+lViXZWSQ0P+iwU
         nniRvmPwE5V4+q4GPM+3dip27V+yRk9o7SPc+s9FHM9LzIjD5XvvM9tVZziKv7AWoz3S
         H7DVZlG4v1j4lXLjHrOdqfsHNcZ6oCxMMRneqGnd1Uci944L7hY7tPECZNSDX6pIqzK8
         Hw4UspCu0e+KH+zox6PrXx7gDp5j2Qi0tLt597JOZ9BhhyQ9IiFgzUSmxPk8qqNJKvZt
         l1HzlOzmiyXRiPscrJ/+H7aY3BbyafGTVbbtHreM/7oTZ5nr6LGZvPpeAAEuF2qQjWt/
         rgWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoxkkozDcJdrBqNdG4qYrTgNtn+niDsmqDintsiu+T5MLnSP0EpQ5jkBvSHhaJCtN5NV5yzVuUe08sAV4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJMiTeVCaw4DcMIFQ7fq7Gsz7xGTb3z5wwH+NLtq58YpBp7SMc
	gLblDajxLH34XfAejBg7E0K1hiBqFYh3vFojguj+6vT2Hhx6xzlzttk4EF/XlvjgTnoe69pMqQ+
	XGDzLkuMh8RwXw+4qGPGXqD334+/3rhncLw4ug1cF
X-Gm-Gg: AR+sD13U0N43nWbZGP/b0Ic6ykPJEHgwEZZgYlx/DT+fb6AV2UOn1u3NTnFooKsm+31
	KmiIdL9rUDrdmuCXDbiRaSZGk0oJfY60iJHwJnp1hqfTAnWAVkkfc8X/4tGvlHL9uLxBd0Va55M
	/6VxKNZaffrdP8C5vZkmKw7vxwTiLDi5xUKkE0jzGjrnvhxw4PUS6E5txnIjY1287u1h2ylarsp
	oH56COCcYIz5nUcU9+yjh1a1pYkT02IUGoi3vBs8TQM3D4nv7gpQL8pLXJqsKYZ88qQFfO6QM0f
	KLpbhuFLaoYvyIItx3S7gpDuUMpttS/sXupriijywD9UpbSwCd2BTUj7ZfPCfvLya/zenupZ0gH
	cDPt3elkuLo1tPQ9vScZd6IBPlcMklIE8/uE0vbdf41Naboyt/4u1K0WMQDk=
X-Received: by 2002:ac8:590d:0:b0:52f:ae2b:da0b with SMTP id
 d75a77b69052e-52fb942d67bmr84786531cf.16.1787927646262; Fri, 28 Aug 2026
 07:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828073245.126804-1-qingfang.deng@linux.dev>
In-Reply-To: <20260828073245.126804-1-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 16:33:55 +0200
X-Gm-Features: AcwNN1UhdM8hO1u0XPNdtSnx727Mw5Sdf1F5y6RfcZsOSfmGeXvlUkBvd0DUx0c
Message-ID: <CANn89iJ1DTd-C65Ps-6C3djV=yihFinGpEqQjEwn7=7X6P3iHg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] ppp: ppp_async: simplify tty disc_data access
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+8e808eb853386f575d86@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 9:33=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.=
dev> wrote:
>
> tty_ldisc_hangup() invokes the hangup callback while holding only a read
> lock on tty->ldisc_sem, so it can run concurrently with other line
> discipline callbacks. This currently forces async PPP to maintain
> separate lifetime protection around tty->disc_data.
>
> Line discipline close is called under the write lock during hangup
> processing. Remove the hangup callback and rely on close for teardown,
> as done for SLIP by commit 23c53269f2ba ("slip: remove slip_hangup() to
> fix use-after-free in slip_receive_buf()"). This serializes teardown
> with all other line discipline operations.
>
> disc_data_lock, refcount and completion are redundant with that
> serialization. Remove them and access tty->disc_data directly.
>
> This also eliminates a lockdep warning reported by syzbot. The warning
> does not indicate a real deadlock because the write side runs only in
> process context with hardirqs disabled.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+8e808eb853386f575d86@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/0000000000002fbad30611e25849@google.c=
om/
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/ppp_async.c | 82 ++++---------------------------------
>  1 file changed, 7 insertions(+), 75 deletions(-)

Sweet.

Reviewed-by: Eric Dumazet <edumazet@google.com>
