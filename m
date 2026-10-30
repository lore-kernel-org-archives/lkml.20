Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793334495;
	b=QXZ6k8vyMSWJy5sRx9TEPe3XJIN6+GtdwYIt9DcU2eLBuMWx9LMXrCclvCYDlrXL8HvI
	 UHhvTmai6BFQr7c5rFD1k3h4kZWCDPQdiA5eqzeitTsCyPPmsYu8jJ4l2F4hbDQxVbop/
	 eQMWRqhPOuBjBNhA5Rzoq7kLdHMXEC61YZJJimfYL9BFNuYeiaUy5sWxpAOOP82QKlOr2
	 0M3Bcvma1VxoM8/xMJ9J/Kwp6Ct7Q44YRyiQDYcktbN7JqXuCaUeeGTpkyJYlDqnEq6yd
	 Kqn6ICs9gMu3DQvMQfOpEg5WnFvwXKAO9OO2DNCA0LQk3kUuOpDoRXkOhzk6eZNXJjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
	b=pOP97XBP43Gekc4scuAxmGysUscmwSqtfptZbOaFCCjgWcyq6Yi+3ik0nmFmVIjKoqyl
	 M2Ay3T/5pOHEdSrM8RVAjAgK4jCy64FcAZp6rWYAqnuJbMhaGvzT+fmHcguzyTHKmHISC
	 /kO/QukkXRNZ3t1jYMAdMps7eKWmBrLc3qLfHXGdC98mZ+whBq5wTQqoeO1AP6UU/F19P
	 x+eDVy78UaFOs4if/XIJc2PNS4BwbWPkvj/mZ02E7d78TGB5MXGk3VGb327Et8M911ITq
	 j0WOyZtAGgxklkHSM+IYp6+cJKG6a1GtiZ5TLCxlWtcn33ukf7df9CUFj6iRIseDBEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeIehF1V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E459606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E459606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TeIehF1V
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso82157f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793334493; cv=none;
        d=google.com; s=arc-20260327;
        b=TKDxFIQLAKF/RzY0ZXWxTZLejuRYpWVrfmZ2vIfD9SoTTZ20XxH9jHcpMbgIQ/qSbw
         6C6lrvsiPKq1vuqRbvhiTgWjQB01DQqdhsWfAza56eA0+dDuJfAJiZIB6Y1TJIl/4+cc
         1Yg8n3XO/ZLGiDO14GpCxyiLZFMo5L995OP3Oae/GTzX1AXCG1cfbWcgrnyu7UTJPG/O
         2yrRBS9l151aeG6XcPPLwCRwvCxpwdhJAdaP+Twmskq45Fc4YMitjMNcigLIGFstU49+
         Kp73ytZTcmf23l8qgpvH4X2XKAcKBj5KAx95okbfXZcS3OBs6ZB/TdbpsT0Q/OZuUwej
         Lhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
        fh=pSO/eN0bi9gkK8ifNI90L3Tnmi79R5dZdmrq/V9+Lkc=;
        b=X3VXO70he66YKxBZsazQI5OzaxG0AJATvwsMxXHrd2Z/nC2GqT2eQMqmRLZOs8Xxf3
         HhnH/OBeEvORCfJsR/KSpxY7gKB2shfPuDKMeVyEaLK1HazM5n1VAkCAg+h3A4F2CiC/
         +zJwkiBW5IlVO5HAeZdhXGVMnnPNTgi4O0AFr5ytfMDDxzx1tU0SSrBy3c7OOImnPZO6
         zY3dlSYwtiextpJSgANeHikwEvxdExE08bI1V/SIkSIY2pHoBq5gfcn3VWmPKAYQ1tSw
         VudearaStfpk31/nhH4tgIVLOt3whh39TFUQOOnjdmRoZQbCphvGZkK/RCHP4XC9L0ma
         hk/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334493; x=1793939293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
        b=TeIehF1VsvlgBpGlN+mC7gq4a8kLGDRcAjbUpaoxiRdPzOO/1HKjnDuUKVHhyTi4o+
         CkyGKW2ZEpH7y9WAjkpNfKLTtu++Pcntnho9T07GUaHn8Hid11kqGfYRfbyptbKq5DRk
         ojYs9z0JlxsZqazGo51KFCvME6Rpl7NssxD/rG+LGLH0i9si5OUKcjya13x+SMjTCjpl
         PsKYgwVyHyzC3UDpkBPJmfUP3D1vmEddQwwdtwMWM9Szpzgo1nM0QTThzk8tY8WEg566
         7saLFlbnjljIrlKhyjugtUNOXS3YNMX6xYUIFpKaUhnr8wchwNJvRn65yBUzM5FC4eQ2
         S/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334493; x=1793939293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfMdAttIlTAY1SwyoPDDYvTzd2E+tXZlYdfQAQrs+6s=;
        b=EdCMo5NqyZ+6pJrEJWfHycrSlA8bQSgV5Qk48vvDFH3o0UMkDxcB/CIQEVeXYsoYSh
         re3twTkDVu9isHQfF9Yg8v1SENqMf3pJMo9tZ/V3fPAPc1ehi6gM0ETvxDN/N5A38/ow
         7ij+CDyU7Li2gNDiMvM3tap0K3uTVLR9kfej+UxZfLY3m5UZMx1qiEsKtn0LJVchoTNZ
         dEZX7kNaM0AMsbJNnTqkViHmCiHwuKeNX6k2r5Np6OJNNpy1c/h4LaXXEoo6IeKJB3YG
         gSqly4ciXO2u72JpKuwQMPg+FK2KjD8U/GDa7JlXsUGiRET/475l1A+LvaO4lsHwdm1G
         Ex0w==
X-Forwarded-Encrypted: i=1; AKwUvBzObMu3vOWdOaKg4D96Qi8DuHWKd/XdltdGBm2kPqBRju4aXT78kojPozEjYZyKDd+G9MD2X33f9bwjDYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyGB9w4kFERoZJNvmvKDNRJr8OkhG4uGQHYP4Rh9JNWHH/TTTp
	A5k4ua2XAS9fpN6LCw0jWvcl+IKyo5KlqP6jWQAKzQPX0K5XtAKrb6/PmBIpa9NAX/ly8jLTdj1
	JlEJhW38hoEOlZ2cbU0hNBWzb1Hq+ji8=
X-Gm-Gg: AYBFou20O61swG3uibn06gs4Cj9dyNIA9iuTFz7GmYtkL/ev1uE7DrnTVemxT3DC0ow
	9yX/Azf17m5IGtCRwZCJxX/M8OA5+KcNDyx4HHCUbOgLtSFp7DaBVBHcIjPqU5YpOy36B2pMPeC
	Vw6+cs2gLZXvfmuNDmBwNuuQJ0KV8UChwAPeVk4zf5xKC89vASr/3SUqU1EvH1yJEmwEJfNBiGm
	HmYjCGb+Z21wLzWP9Iz/iZ1h9CEhWicCAb8PQlWbi3bK/vHFkbAl+vTkUuaHO+aSVPPozlY/rzj
	oZA8TzHIBFMuvO4sLLCHUurADZ3/Rr7Qt+EsrK/3qvO2tog6sT177p8GOf0p+a3SQVfZMBlBHtz
	bfjperv0RCniTTvOoJ9KTw4Z54FX58PU5DtBMOwUW9EQCt8oju/HlIqv3Zs1GwEaCkTo=
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id
 ffacd0b85a97d-48e6e4f4ff5mr2056508f8f.44.1793334492948; Thu, 29 Oct 2026
 21:28:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029192223.462367-1-paskripkin@gmail.com>
In-Reply-To: <20261029192223.462367-1-paskripkin@gmail.com>
From: Eric Anderson <ejona86@gmail.com>
Date: Thu, 29 Oct 2026 21:28:01 -0700
X-Gm-Features: AclHuK8-YtfLQIYf0AJZzk4X-qP015MAb8rXgpTOmu_8xsR17rFa_b31yQUvJ34
Message-ID: <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical section
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:22=E2=80=AFPM Pavel Skripkin <paskripkin@gmail.c=
om> wrote:
> SPI does not support atomic transfers, so it's dangerous to call from
> atomic notif chains, since it can cause stall during reboot on
> orangepi5 (see trace below).

For my curiosity, is the hang during reboot/shutdown random or consistent?

You are explicitly mentioning reboot, although the stack trace is for
shutdown. I'd have expected reboot to have always been broken for you.
In my change I noticed that reboot and shutdown didn't agree on
whether to use _PREPARE, and my change adjusted shutdown to agree with
reboot. Since you apparently need the opposite, prior to my change I'd
assume shutdown was working but reboot broken.

> I don't have rk3288 board to test. However, I strongly suspect that
> patch does not affect your case.

I'll test it this weekend. I suspect it would work fine on Veyron/rk3288.
