Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C397227AC45
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988863; cv=pass; b=ukRo2Sxpagcs91giHd3zZhFzJZN7Voz+du/3YMC+JuuAkLnslT6ldK6nk+YhmqUxc4CCOR66spn9+rXT8LC/3Vnl6niKPYpkbvxiJ2cYsR3F5BhZod663NVTFbIhF1M11qcyodCtFPmw2pATpEmfDN6yrDs54uWB5oBsWEFe9tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988863; c=relaxed/simple;
	bh=ZVQBnQo/eFh06vorGcqF1KC/7SENgnUf6N9nm8JGWSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnBJGkbefk6SQEGupx7iLiyj5iJeJICHt2ad2CzsMfxP1wnH8TT81pbHv1h6zHnvs1sD1VhBIh4ZFmukBWiiMwyHwCx5Vub/aiT5UaTtWJY1o1qJDUeEohbNL7ebxOc5pUlYhPiRd+3/v3WvHfqBdzObk70ZD7wZApm9cYuvff4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aconHeI3; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aconHeI3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so13015ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790988859; cv=none;
        d=google.com; s=arc-20260327;
        b=RSpFzyCTqm7NW7vVPXfeDALTAUgoNeR/1IqRiN0/gk976s/l0Qc73Pf29donkVvniW
         KgTQMnhv6fuS93CTk7fhQLyArsal2oplZfLXIKto1lY1MfLuVtT3g4DAEu2sB4/OdkYf
         3wXrdnz6Tr5TwEJGcW93HPVBX+3IdkdFgRkvOmha9dqcwB9BNJkIyutwzuQYzUYHsigr
         naboyynRUbxyzc3BOdn1BWYSe6lMlOurJmCFV8BCL/cFxIsRUsYs940wgY8zBYmk8J+E
         O5PQ0j08829SxCzF7NET/JFTVQzdZAQbNtwgyKD8GQqUaloMMUN6Pbv3nuKB7ildiOWg
         6RDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WEp8X+PRKs7nUSCeaHUChoo386upLZKNHaOGRHgrf60=;
        fh=/j8eE+tZE0ymj30CRyKkhEcILycQvuMEc9wU3ZlL6bY=;
        b=czRmLIr7c/QrovolPeI9y61oJuECp3M2xJ+NNzwskeAuvfSKzvYtC60GSMnxiHaJ4c
         cVcHf19OEUb9jp7FaQNFNim+Pt8HVNhcgshgDtIwma01YQRlIA2g7bdXTSTUD7Q4rtb6
         kEgJuWekmVg5uR+YQDPc6hu3WvvtVX4rSQngLQU3011bt32rsBKFxWXvw214FIQjDwKW
         9Vwy+Ap8bZAQEZWGvdG5C3xw+9oFXRpqE+RU0GqIr5YxXgjCoh4yGbSHCNKEwRy+xSVm
         OlYM840zYqQKebUTVsf+iscSVYOWojkLZTDp+iuZiSqi7MwIDh6MzFuumX8cmSiUUWl/
         mveA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790988859; x=1791593659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEp8X+PRKs7nUSCeaHUChoo386upLZKNHaOGRHgrf60=;
        b=aconHeI3/hgLgqEsabadPOGMQikGcMYgxzJo1eATfENUCkwfHRnL5saJJvuJ8Xvq+6
         GID3ZNFQScvFV0X7+n8DFVt1Gs5KQBN0gUPWVfR45sL3+PFD9Ywmllkxb+zmyewUdFZZ
         ufR/10yGa6vWq67h+akc5q+Zl5joYXKbzB/Kl2cOCwZDAF1Y2iRGHOg4hfWJPEsL4IAG
         /Vje/YmSiBrbdnI2T4qyNTFKN5YkUOGLRXFDY5yQnbmc/wr5mnqScgCMjOMWzD8XxZ+f
         b5drWA1L8SbnUzA2UiYQQZWVUWx8NuYC/qmmbyME+NQMrlMRr362H02TuglD+bHF3ulD
         jXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988859; x=1791593659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEp8X+PRKs7nUSCeaHUChoo386upLZKNHaOGRHgrf60=;
        b=hAhb7+tEvGWAbKDi7GPOTFTXD4F7a/rSciN+XzgWcuBA6RrNO1dC+n/5y/AtwuYSMG
         2e5afDCSXP8g4wFKxq0RAjA6403OJfep4g58XxKG7vL4W7ACB6j3IMz/+/Y1K2uC2IZJ
         0XBdqjQ2wWJqRtze4KDDtftVb9taPEQl/YATWq/yywDTqS35/6Ia0zwNQUYoMqq626ck
         oi+ZC0IECJabv7phGyGUSpaHgPjDUQMVGeB1PRPASDWF9Ceg+p+AgaDGcBH/ccYmJjHi
         xFetJ1U1N4XL3BkO6OviigZNnOg2BWcxiKcm61F34IZmG/a3QRd5ByBuk2NcLTYQoBPM
         z5Lg==
X-Forwarded-Encrypted: i=1; AKwUvBw9qUiFqE2TF6dpXByl0n9JIRibdZInOV5C8wav1wH5pT0TwkzYhgyzHV487hJ13PkJ8ElvjeRYECDim54=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDDAlkfVSa6/YBP7h5KrjEzVBVIGToMEGb0gCIhZsVC5QU/Qg5
	4BsrzOwcH6W5gp4JgxYqpSTL5/lXB092JYFjEwlYvfiMyzg1q5yYikdEy8vjKxEMCwUUateRjSt
	0wh694YGYPd5v2871IHhZf9XaKR8CoqcTcY/BSVvY
X-Gm-Gg: AYBFou1XNwWnpUnKtzunXeUhzLgQMdwOfZ9AxZFBVoXcfW6W0c8QcvniWFF2xiR+WBm
	/bk+rMrcNDTiI8I/IDULPrPpDRDeNDpRSZeX7K7CYshOj1qX6qW+54xNQKjEsApFK8pdKHVTShI
	EZyA1hVn3WfbCscHPnmnXvSAvApht7kOPqmpHoMdcBlrY9bDDM3rYNSReyfQDG3mrWCjhMGrQGH
	L/7vDBYN+aWCrGFztSpF+SeOqg16pJwMQYXN+K3ippxmWtpIaMdGsgW0qs1lg3jw98w5/bkxwUt
	r4QE0pXYXeRvfbXtWdm9DegfNGALg/HTr2JBJ2t/S0i5cH903tGEWjouuFLiZR+xLND+lAzpqrZ
	HcZGlt6zt7G7x5dqu7YzG0Gli3B3etOroKchN4XZVMSq2Ncub6UBZQg==
X-Received: by 2002:a17:902:ce8e:b0:2dd:3a08:d47b with SMTP id
 d9443c01a7336-2e5339f93a4mr1143425ad.13.1790988858220; Fri, 02 Oct 2026
 17:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com>
In-Reply-To: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Fri, 2 Oct 2026 17:54:06 -0700
X-Gm-Features: AclHuK8ouJgcRlucOdN3eH5_YugyE8t5pnHL2laHJr6qeoqr1Ko3b7rLVQ6y5Y4
Message-ID: <CAEAWyHfyamEKdRa6PAjEfffq2Xw1ByF_g_jpmr=Kup8UJQY7sg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] mpnic: add NAPI buffer depletion check
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:35=E2=80=AFAM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
>
> This series provides a buffer depletion check to unwedge Rx processing
> when page pool allocations have failed. Patch 4 has a more detailed
> description of the events that lead to the wedge, but the high level
> idea is that when page pool allocations fail, the buffer descriptor ring
> can run low, and when that happens the device will drop Rx packets and
> not raise interrupts, which causes the NAPI event loop not to be
> scheduled, so new buffers are not posted.
>
> There are three setup patches for the depletion check:
>
> Patch 1: convert writes to BDQ ring head and tail to WRITE_ONCE(), so
> the depletion check, which is not synchronized with the NAPI event loop,
> can READ_ONCE() those same fields.
>
> Patch 2: introduce the driver level service task that runs once per
> second while the netif is running.
>
> Patch 3: set the minimum Rx buffers needed per packet based on page size
> and max MTU.
>
> With those in place, we have everything we need to watch the buffer ring
> head and tail positions from the service task, compare posted buffers to
> programmed Rx drop thresholds, and then force mpnic_poll() to run if
> needed.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
> ---
> Daniel Zahka (4):
>       eth: mpnic: use WRITE_ONCE() for BDQ head and tail updates
>       eth: mpnic: add a service task
>       eth: mpnic: set Rx buffer minimums using page size and mtu
>       eth: mpnic: add a NAPI depletion check

For the series:
Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

>
>  drivers/net/ethernet/meta/mpnic/mpnic.h        |  3 +++
>  drivers/net/ethernet/meta/mpnic/mpnic_init.c   | 13 ++++++---
>  drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  3 +++
>  drivers/net/ethernet/meta/mpnic/mpnic_pci.c    | 21 +++++++++++++++
>  drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 37 ++++++++++++++++++++=
+++---
>  drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  7 +++++
>  6 files changed, 77 insertions(+), 7 deletions(-)
> ---
> base-commit: eb0c18404c8943356f4aa164e5db9067b79ea93c
> change-id: 20260929-linux-mpnic-428998421ffc
>
> Best regards,
> --
> Daniel Zahka <daniel.zahka@gmail.com>
>
>
