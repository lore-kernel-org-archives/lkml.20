Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18BD52F275
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170965; cv=none; b=WgCzIx3xXT1QZ0XsLMznTNe1MHpVWE0WGgEAOJrWEu7yZFswrpl3TXiLxJIJCbboFWEN0gYKOwG5kIEie8rriV1JDnbfKGA/yNtExXLFGLME+P8POPj3+GcHiQlcAkiKU1EWv5w0eZFXb1/3eeoXoc3o+Rsjf7KD10U+iYnNaY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170965; c=relaxed/simple;
	bh=LJV30kQ3AhVA19Qy4NIYzlbllUic9lnXc34rf+8lBzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKA+7Kp+lQXuk5UC96rSMFBKWtgBZnq1DPdoQsdgwuZbCXop5lUDYicIWDH/CJjLbG72hhnPhWKOcLyKrlgmGVBYIQwXURdZgNknmjoEEAa5UkHGi84r2g7+f2vYR+Fu75VTAHxIo6g0/xbQQUTAPfGlvXsLXhcxg8TC90b2+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJYoXcNO; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJYoXcNO"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc515bef69dso485081a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790170963; x=1790775763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW9r7iNqfIgerNjHvG5s0sL/lw15LFmmpUDkujs3h4w=;
        b=YJYoXcNO9tam3m+wEIriMKQpqKt5QN1zYYQm3yl0F49YbafC7pU+Lc8A+IzBTeIrBP
         kyPPzyB9Xt73wY0pxyOCZukMd5P02+1c2xhvp9P7/KyUEXLLs60FL1sBMjvJW88RzUSU
         /JOqyE+qrIoSk13zl8NCbIpsPSMKfAvuabgiNQ/EGvoWyRLmLgYFJAy0oiXEqKj4vFHO
         3XmdcV4+CT/FS8NjwugQOsf5cK9rTbVCRmSa7+xZslmWMvJvynzKP3+j8Ff49ZvMU87r
         vxOgHhw6s74CG3jZt9pEZI0cKWiEiHIdX1pPCrQ09w7L5o8komj3mBkem0MIao+KlvlB
         xbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170963; x=1790775763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iW9r7iNqfIgerNjHvG5s0sL/lw15LFmmpUDkujs3h4w=;
        b=w522fz/05NLRcrha7dfJEAHepJKygHBNhb2u8E97xXpqUz44uCIfPS+2Et/OakVLDh
         cMdgClO7Bb/OtE5Ybg7ue9CpWQiP1HFRo5y29OlXzjb8ebYK87ruL3cORyqAQuh80T4b
         0t0uJwsKqPGpHRb6a550M1e+lZi6Dfic8JI2gqn0WllpSTPV1eNJIhLNV0jaEzvjt1Qw
         +sVBjNNjA77Vb0xCSYWVSxq5jbGfLpiFa4kBhmkYEB+i3nWC76PnuN1T6ifmrPdgsx6b
         f1WRQisiDqZzDCTNB5VOYa6z4LsLjVBKvLRn6JHbEsy/AOrDzPLe000w4LR8D13nQAuY
         DRjA==
X-Forwarded-Encrypted: i=1; AKwUvBwuG759Z7K435lKcqMFmS50uHZejlvvr5S8uNq2X2Iue8WlMNqSWaf++FaBRKegVTGrXDaPMYsuBn+k7iI=@vger.kernel.org
X-Gm-Message-State: AFuF++l2A8/tFVzMvxKF67foDTHoOVUaM+4fv9897AQkRPbRxKrz9DUA
	XaslT94ys/WZ7H6TxFPgCDn6lArBEYnimbZLQodJzvoRhzKwUarkOP6J
X-Gm-Gg: AYBFou0fNhZ9vYv8wMgnnOYj1M6d4HLJeh6txfxFRZjvaaqLVYJ/48zrzRJApydSUJE
	jjG4/7ednvNgDllB2m4yNFVwZrpMQsrMMMXYO2tWSDVV47wq6gsvx4IQL1MLHQZOzuWWA7z3Ia3
	rrFTpI+2qqgAJioTFrS6jWIZaoPIsMc0FDLTvGYw3nAG3aeAgQlqurz+nkFBoHqKSuR1eVhi12U
	17wEd6dWpbzoJBqz63s0Ueb3CX397InvoWAMUHb15g7H5eRmSVh0MIKBAiqxutINn9waCobG2IV
	3AtwyWb5fLxcvFPoqAIZ3Imae7jZ6shWO5k6N6/gBbUNmC3zvviks4U50LvaNHo1O2MVL9X5KNG
	bZiZK9X5b/x5mqZXJiOD5bnwwsRxkPWdG6fApmGsqFPywcvxpqUj26RnVA6SV72tyw9SzutkXIM
	f5Nz7sRBdFvsb5Jzj235R9W+RozAJ0hdw5nF7jrfw6d8NIbidRuvKuNeylmLLAVaB/4bVZnzaFx
	J2t7t7MMWs=
X-Received: by 2002:a17:90b:3d8e:b0:39e:194b:fb2b with SMTP id 98e67ed59e1d1-3a07e51d0f1mr2640854a91.22.1790170962777;
        Wed, 23 Sep 2026 06:42:42 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a089197169sm2966570a91.8.2026.09.23.06.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:42:42 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	kees@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] time/jiffies: Saturate in mult_hz() instead of wrapping
Date: Wed, 23 Sep 2026 21:42:36 +0800
Message-ID: <20260923134237.3628505-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <pu5kcrhze4f2wz5fk2miocxx5edgmj4tp2zwcv3bpeo46vo47f@siezjqbxiuk2>
References: <20260922031229.2300283-3-zhanxusheng@xiaomi.com> <pu5kcrhze4f2wz5fk2miocxx5edgmj4tp2zwcv3bpeo46vo47f@siezjqbxiuk2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 02:27:56PM +0200, Joel Granados wrote:
> Not sure what the difference is but this is the result on my test
> system.
>
>   #  echo 18446744073709552 > /proc/sys/net/ipv4/tcp_keepalive_time
>   -bash: echo: write error: Invalid argument
>   # cat /proc/sys/net/ipv4/tcp_keepalive_time
>   7200
>
> I tested v7.3-rc4. What is your base and did you modify any other sysctl
> before you ran this?

CONFIG_HZ.  My changelog gave a bare number without saying that, sorry.

The value has to exceed ULONG_MAX / HZ for the product to wrap, so it is
HZ specific.  I tested with CONFIG_HZ=1000, where the first wrapping
input is 18446744073709552.  At any lower HZ that same value does not
wrap, the real product exceeds INT_MAX, and proc_int_u2k_conv_uop()
rejects it - which is the EINVAL you saw.  No other sysctl was touched.

	HZ    ULONG_MAX / HZ         first wrapping input   wraps to
	100   184467440737095516     184467440737095517     84
	250   73786976294838206      73786976294838207      134
	300   61489146912365172      61489146912365173      284
	1000  18446744073709551      18446744073709552      384

Measured on v7.3-rc4 with CONFIG_HZ=250, unpatched:

  # cat /proc/sys/net/ipv4/tcp_keepalive_time
  7200
  # echo 73786976294838206 > /proc/sys/net/ipv4/tcp_keepalive_time
  sh: write error: Invalid argument
  # cat /proc/sys/net/ipv4/tcp_keepalive_time
  7200
  # echo 73786976294838207 > /proc/sys/net/ipv4/tcp_keepalive_time
  # cat /proc/sys/net/ipv4/tcp_keepalive_time
  0

One below the threshold is rejected, the one at it is stored as 134
jiffies.  With the patch, same build:

  # cat /proc/sys/net/ipv4/tcp_keepalive_time
  7200
  # echo 73786976294838206 > /proc/sys/net/ipv4/tcp_keepalive_time
  sh: write error: Invalid argument
  # echo 73786976294838207 > /proc/sys/net/ipv4/tcp_keepalive_time
  sh: write error: Invalid argument
  # cat /proc/sys/net/ipv4/tcp_keepalive_time
  7200

tcp_fin_timeout behaves the same.  Legitimate values are unaffected:
7200 reads back as 7200 either way.

I will respin with the threshold written as ULONG_MAX / HZ and the
example labelled with its HZ.
