Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DD843933F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628793; cv=none; b=XhHMCXilCRKURAlU3rZtwZlQE0NzMinRFsva+vXQFvFiLNDahsCasJGRPBqkXX6MVqH0MMngBjEv0fiEilTFF0GOGBRSLLj5Mwgc3qJgpRP4o5XHtZ0drVtZHb6h6H5JTKGMtcNiN7WJsKyFzxMSg1hAI/1EV1KuV82IFbpz8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628793; c=relaxed/simple;
	bh=Huy0vpOdb+xU+xq2T8HxWv7xnUhU8w5frVPeuscTGJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qULBimyKIAHHXTz9IwSYzRwkZ4bG6nApOjcqCLtGCgZEGZKvMjTgnDKwd/OBo/NKxaGSJPIaUjD2Ki/j8ZHOu4uCxHCiX9BSk2UrNdVv+eitJ7gT+xIx8MknNWV8QzUU3oH/CAfDBIVzUlSpOQe4fUX8IpjZnEj2wKlpWDeSl34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIJnAPXd; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIJnAPXd"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a2ff16febfso5040271fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789628789; x=1790233589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xS2ROdM3t9ezFwrSV2+IwOwSp+lNFHCFMXSmUbeDh1M=;
        b=jIJnAPXdg8fNb1f7n0oAXRYhwWKpTW6aJQ1CwQy51Z2bfbTd1F7JaJpcHlnbm3RJkj
         6xvqcpdU2PW66rd0krtIlZZCiggmbQbr4YJul442m7h8M2ymm9B+nukCvdp04azr9Sbx
         7GZa3ZTdbIQ6BdmXI5L2zS6abuBjSNkhnOSzbOFdVlxDLOpIDKWafF/C0KeVNzNlzv+Y
         KMYhtj9REJjoMtA4yHj5lEppsqEKt9Pcr3X6xDR7VfqtNcTBHX7yjt0/+U1r5JqiaxId
         KTrShbSJIxrxiGyQt0ie/xJ+w7u8B4rXr+mXIisk4TfgAMtExg5anGuyc312RQLmb/io
         M+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628789; x=1790233589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xS2ROdM3t9ezFwrSV2+IwOwSp+lNFHCFMXSmUbeDh1M=;
        b=ntqSAo4FuHSzRdXYI+gugfHZrYA3gykTk7V43hAYl6t0NUD548bCmfz1SoDvywfrcC
         A+fZqmGztGJF/+V2Kk/0E+WlWEV79+mRKXaa48OsAjXrvZqGQDejt3xxJeqtpyJjQfX1
         vfFXtGsXjPMDQE1iPXhxa5UtGTN4499wNg03zq9LwwAIkqtIzq4QLVl6p9EaxC0SJ/LM
         9RJI0yWKYgMo49iX0chBhkisan1BfI9DwtN4RKJCRPb2YUoJIB8sIGx9z9dy9+Mb7cIq
         wRlcwjYvMOKIEfzJip2QJlu2Y2odb+tzmix/XNmMeOBC/IZoXefWXLgmGd4py+mIP0jf
         MBAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMlfPEEcdl8vrJIx6MiHQLitqb+l7B/clXzqODBwITLJQ9JBioQyg54FwUuT9XT3bDL9q9trh2rLPlQPo=@vger.kernel.org
X-Gm-Message-State: AFuF++m5gJf9PjolTt+B+OkCn2txaRKUUrDANfIfCw2+/kljzrxreKTe
	j+q8KybXgdChXkcnog0aNpR9Y6o9T7pL9di34UpjkBqdUIy0Bp+VIHSg4sfIlpkD/uQ=
X-Gm-Gg: AYBFou19Bf7J+RA7WGhMQGd98lUhaaOXR2jF7i4UVg73o0sT36eVWN+dn1maf2bkXZ+
	kwR+XQYBLTIjGI9L9SxmROOFuCat1SF5fmnOi+7uvCSmeXGreyUKTNfm7j/Rd+1jYdKF6l23M4z
	NJ3WJJ9p/GGMJ01/GG5Z3zd+OQJD3K/35IOaofP8+Ar0z+RpsdTcE2uNULCRvyHn2/NCLWxCGm5
	RLsNFP+Yh9knaYMLY6qmJdsSsH1eGJJsIdi1oi6KidzOgSXXte/exBzlGSiArPCG2y5tIFyyMrX
	pAuVOiW4wl1o+05pZ9PB/i5upczR2sRxY6AxKidUBmoxS43PndoioTzRxE/iYn6gwlOw7OKsY4O
	3q8i3TMJR1STJuDLzabkZwBhgCEfAxBdvSet0W4grx0EV/gJY0X8l0SyLC2YalrKa1HLqOJUT3h
	N34P8iPFEvxXKI+7J63ijg+lABTBSkriNfqsthIrMhje3Rkd6FAx2aTxHTPdg7n2bPsVzN3b18z
	YxwQRMGOBsAEiyz
X-Received: by 2002:a2e:a595:0:b0:3a3:7680:67f5 with SMTP id 38308e7fff4ca-3a5dca03e98mr9854301fa.20.1789628788951;
        Thu, 17 Sep 2026 00:06:28 -0700 (PDT)
Received: from localhost.localdomain ([94.29.126.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafdca36sm12946991fa.35.2026.09.17.00.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:06:28 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: Re: rtw89: BT connect state differs between scoreboard and bt_info on RTL8851B
Date: Thu, 17 Sep 2026 10:06:09 +0300
Message-ID: <20260917070609.11949-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <776cd43f75f14571943462bd5fc6cb64@realtek.com>
References: <20260915122625.6341-1-skokovmaksimevg@gmail.com> <20260915123718.7239-1-skokovmaksimevg@gmail.com> <25270f2066784a02806daa352643be53@realtek.com> <20260916053228.10042-1-skokovmaksimevg@gmail.com> <776cd43f75f14571943462bd5fc6cb64@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> To be clear. The problem you encountered was failed to connect an AP, or
> this was newly introduced by the patch I shared?

Not introduced by the patch. It predates it by a day.

On 15 September, with an unmodified driver, the same machine logged 21
"authentication timed out" and one 4WAY_HANDSHAKE_TIMEOUT in a single
boot, with an A2DP sink connected and playing:

  wlp2s0: authentication with 02:0c:43:16:60:e8 timed out
  wlp2s0: deauthenticated from b2:39:56:12:24:f0 (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)

It follows the audio, not the driver build. With the sink stopped,
association completes in a few seconds on both the patched and the
unpatched module; while it plays, the interface stays in STA mode
retrying. That is the coexistence behaviour from the first mail in this
thread. I mentioned it in the last one only to describe the conditions of
the sampling, not as a regression.

> The BTC_BSCB_BT_CONNECT should be set by BT firmware. The internal BT
> expert is helping to dig the cause.

Understood. In case it is relevant to what they find, btc_info here
reports the BT side as

  [coex_version] : BT_FW_coex:0(Mismatch, desired:7)
  [sub_module]   : BT_FW:0x0(patch)

while the mailbox itself works, mailbox_avl:Y and raw_data updating.

I can run any test build you want on RTL8851BE.
