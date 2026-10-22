Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657951;
	b=EVkwi3kFGDFDQqqmD/N7/UKHZDwK4IWUtBkVHUAEKmbZCGo7Xw+P/aDwpFlsd1XxCnZQ
	 3CivmnIzNd0bSPRHPMFJgQdWZl6Oi0qcp7+ZJxhxh7tNfQb6++07xtxpEIW5hLd3UCSNw
	 l17lr3U6tkeWahWlilXDN9ExArhwarK5N5rzAGvaqbnz1V+9BTg8U/NZtgMqem8C8n+/e
	 CVE8zxl0erFT0pDkskXWi8s5ong/xk3t31fqkfp8Lijs16RazFl52QiIWNeJaE4zSYq6O
	 bg5SBVOp0qUeTuoH/4SuV4fA3zS11uEyIO60N5raa7IhNu69+DQZDDFoE3c+CPltJcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657951;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=rSb3gqzPgZ1tZs3TI6bW8xnBVV1dPUQEQ5MNgZW8yjk=;
	b=sS8i4SQ5NfUwbbwqYtEs7ploTZj+SfZX4MKWtbwBaOt3l6KlPRs6yt+hO38EQeIVi/2g
	 hTMDsWMPwbiS03TPmh2/EeLlDSfHBXFbakdu59/7tpBqXQOQvuJ1sWIubmlcYmiHoNeHJ
	 NSkhSN5Mx8gTRDdyDe6rTGqb4aZrSqfLk/7DLaB2zznUswyFzVnDvKZm3b/m4eTdUpN71
	 QDB29a/n0l+m2frErWM88LInHxXaaQgsGvjzdbXCLQ/ACrEK7aPXg8Q8nVBriYHs4fSfJ
	 ZsZGkdZANLqYNmh0e+mBYm3cqZ1blQjbmHdHn+ZUZbSMgXbKhteTANsf9vogFXIoX4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrR4kazx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F446606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrR4kazx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E154B1F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657950;
	bh=rSb3gqzPgZ1tZs3TI6bW8xnBVV1dPUQEQ5MNgZW8yjk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hrR4kazxMKpZk80Mg5hTjMw9b9GVE9+Hpfjb90a6sWe5QdDJDBnMWPb3/Q2R+rE5E
	 GkdjB+3grR2nngi+D5xHBnZEcfBVVBacCYgYEJIMQh8PykUTZOqLWu5lV9xs1BSApg
	 JWOlRAxMb97XeE0e2f6QaA2qzQ3YNEsXh2Ty1RR6fVb0wWAqm9d/4knXD8ItapcUtW
	 mdxJ8rCIqmtzkoHpNrdALYkf2ESFmlRte+iShhYudpPbclyEHdVGz+Q1TVhTDm8tIU
	 8w5IgGtC36Tot2YCzO4XSf0kB2xRkthGyw9yx/b7QYyvd8BNHtKhU2zJq8oipA5JDh
	 e2qJsueRe4xFQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so9764261fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:32:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvINOekrn3/fo0cQIHHkPeAUSvxuBb6MtnYNnL70MVEh71PkZJhRUD6DhArLmilzDoSLpqdpUZ6tZpVuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoHciSaXAIqQPWw8ifTZv3yl4ARzzo6AMLkMDwYKapmDErc5fG
	NrnaYhRFaih/lwm5AQna/A2LSmkwSTHtIuBwBFm9hjOUZTxg9GKxS2+xTwR4X7/d4nxszhpqnNP
	+h5eAT5hcp+w+VrddjoLwExvwoSH913g7fuku2xSMng==
X-Received: by 2002:a2e:a7cf:0:b0:3a9:d70c:f75e with SMTP id
 38308e7fff4ca-3ac4415825fmr11368791fa.7.1792657949635; Thu, 22 Oct 2026
 01:32:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:32:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:32:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021195112.41138-1-me@michaelmcallister.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021195112.41138-1-me@michaelmcallister.org>
Date: Thu, 22 Oct 2026 01:32:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfFKKaKspq21eB6sw15WJJ9f5MuS_RQ372z68h5yt1oxA@mail.gmail.com>
X-Gm-Features: AclHuK_tvu9Ry3auqtVWhfpeNgoUj6kWm18hi7mgN4LxsSz4oTEUyQavlf84pwI
Message-ID: <CAMRc=MfFKKaKspq21eB6sw15WJJ9f5MuS_RQ372z68h5yt1oxA@mail.gmail.com>
Subject: Re: [PATCH bluetooth] Bluetooth: qca: Fix the WCN3950 NVM baud rate offset
To: Michael McAllister <me@michaelmcallister.org>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com, 
	lumag@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 21:51:12 +0200, Michael McAllister
<me@michaelmcallister.org> said:
> WCN3950 uses the HCI transport tag layout that stores the UART baud rate
> at byte 1, like WCN3991. However, QCA_WCN3950 precedes QCA_WCN3991 in
> qca_btsoc_type, so qca_tlv_check_data() writes the baud rate to byte 2
> instead.
>
> On a Motorola Moto G10 with WCN3950 and cmnv12.bin, configuring a 3 Mbps
> UART therefore leaves the NVM baud rate at its default 3.2 Mbps and
> overwrites the following byte. Firmware download completes, but the
> subsequent HCI_RESET times out and Bluetooth initialization fails.
>
> Include WCN3950 in the byte-1 case so the NVM baud rate matches the host
> UART without altering the following transport parameter.
>
> Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM

This tag is now gone, you don't have to add it.

> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
