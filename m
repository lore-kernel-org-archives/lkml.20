Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502920;
	b=c5Ejw9zV4gAZN6w9qnrcVNr5ctKEmm1LORnqFdanrrpciFnUT9bWx9p1iLB94msE7sv5
	 CJmrL94dVvfiJIKdjmpf9tmLdLUW844W17vUJdzRhouAsPO1lMCMIH2VhczxqCrlvjCnG
	 QN2wNsVFGXIZMl1WVGvycz1HpPRi+/28DuAIwYE992SsrAKRNgJgtJbmmL3ip+rBSovdO
	 O/zGPRcsLWhP8Bs6Fgh2/YYp9SDGILgd4j3YwTMllQl/Y/U5I/OddMAqZwUMR2nRw4YdU
	 mDvMhKrM3ybx5V+MCBntAhxA7v0iQfAAv9IFFrSSl2VQhh4rPsS9KpQ9aBXj6xhBo5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502920;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=aK2LRvWcyaWuJ5N34VtZzDVFBSere8k02VDc9qIjYlg=;
	b=NKZSjvqM45t7+13omwBwzST5Qo8cSohkHlgnoE+MxTRQAz1R/hK0p2WbrKLmwbdCHiVf
	 mBYyerOrF3mO6Wvcv8VRKiMlVc6NN7I54oPfpGTQxryjM6ZqYYnXVo+x6ox2SrXoMnkvD
	 TW4LekgySt+ae3eheDCIIgEAGNlU7VsjZmKF/gOI+WQKXvVe8pS2SEG7WpwFZ2Tz3bOeV
	 oUXOytfR+t2dI1eEF4JLQ53TvPWrWaeISi1INAa5KREU/UJfVZP4mPUv9nAQLnzZdFM87
	 RlrmL1xw04/FQRkTAXbQtxMBdMY8mbJ27ZyMADp8SSdZasVuIbQlb5RRd5Hh1KF30zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2SAuGob;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929AA606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2SAuGob
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8641F000C5
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502920;
	bh=aK2LRvWcyaWuJ5N34VtZzDVFBSere8k02VDc9qIjYlg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c2SAuGobZPWLsQiOjvjs7aI9kWCzlOWYZbfT6QDijt4vVsuqwQEnS6kPWeejgZbyM
	 D2ceD/99+f91ZZ/ZV9AsuFjMSgmhWYR7Pr5n+Yw1Uev958uRN/baR4szjh2ct5TrE3
	 GQZxzBw3rUBhM7+e16ll7Lx3YIbtFTRfeKMRhY0Zb+SVsrFK5QXhxYDGPvMcOPNofC
	 TgXyj5iXXYWSwmipx8u4nVYI3lmCuoHb7h+jwdKYkjEV0dOfKT7vvKoaS14sJ9inSk
	 7NKbWcvYallGa4O6haUYu9dz6zkfjG5m0JwL+fKSbxZW1IQbaMj+rM/e3Fpom+EwYe
	 JMEDusowMWv5Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba328513b9so2866851e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByERUgXnQr0T34huaCib8uuFdI9RYDqbt2da0pg2WxQsdIeqSpyuaB+2prcHiPkKnlQbCFfUP+OVj/tfXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ45HM5L49MfyOlAh0MqSlBaB6VS5NMkp3DIw2smgBlg35hGsc
	ZRO1Caw+f+5ehFZAKp/OpzsjaFAPEbwGNo+2QExzcUDjX8m2kqEpVRd++Ai1N/yqcCqj1pV57l4
	HF0Zj8vd/sRKqFnA4YNomi/RHf5/pXopn+n8UY2dcig==
X-Received: by 2002:a05:6512:33d4:b0:5be:67ed:147e with SMTP id
 2adb3069b0e04-5be67ed163bmr823916e87.12.1792502918976; Tue, 20 Oct 2026
 06:28:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:28:37 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:28:37 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
Date: Tue, 20 Oct 2026 09:28:37 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfSeP-NyzFYkKb4ZD4C9zJiUcf174ySBc2_UscngjjQTw@mail.gmail.com>
X-Gm-Features: AclHuK_jmEu-GLsDgsOoMXXz3_AlNWyRRXd572kr1xGQm9KwKipuJ3sW_S4w8-w
Message-ID: <CAMRc=MfSeP-NyzFYkKb4ZD4C9zJiUcf174ySBc2_UscngjjQTw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Handle direction register read errors in
 IRQ paths
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 18:50:03 +0200, Sahaj Chaudhari
<sahaj123.sc@gmail.com> said:
> Three IRQ paths ignore the result of reading the direction registers
> and then use the destination bitmap. pca953x_read_regs() does not populate
> that bitmap when regmap_bulk_read() fails, leaving the callers to use
> uninitialized stack data.
>
> This can select incorrect GPIOs for direction changes during IRQ bus
> synchronization, corrupt the saved input state during IRQ setup, or
> produce incorrect pending interrupt decisions.
>
> Check the read result at all three sites. Release irq_lock without
> changing GPIO directions on failure, leave the IRQ history untouched
> when pending detection fails, and propagate the error from IRQ setup.
> The read helper already logs the error.
>
> Fixes: 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
> ---

Sashiko is technically right but we're staying in the same scope with the jump
and we can't guard the irq lock in this specific case so I'll ignore it.

Bart
