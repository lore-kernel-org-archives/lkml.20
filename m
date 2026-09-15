Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37653C1D49
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480263; cv=pass; b=fXgYxzV/3/MkUnHaju5H9w/Wjn3r6dFXhBbbLcuTKOQ+lNNlNlUXXdkEOL0mrkhYOY7sSoBvbJgn3ecmo/XGmMKCCKtsxZN/DeSX2YmUnECR1t/MTtPbJ48zzQpKNMi2mIbxiRIJrI1D+HsmktYZEfSwHUUoOy3evTUdYcMnyic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480263; c=relaxed/simple;
	bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQwmE7GC/+dctMXeXmO3LwQBdJSv9LWLpMOgjRPKc51zmrDJ5rdvks7F+G5s7rpx9vqziIpofdxXJacQatez4dmIEbVORAilKN3+UE4+YcpkriGrHqlqRTLT9vatcYHMvZJoAtNeoek+HR22dTTl3CB4SF3utOqmzVUl6pHPpLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfkf/blk; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfkf/blk"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46dae65dc5cso185621fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789480261; cv=none;
        d=google.com; s=arc-20260327;
        b=HYome1O4KvDzbRGvbwqDEHYQDOIV5ZWdo/rGMX6NAQgLc1VnsHYORWMuCgEdG+GHKI
         sJqRie49snKUHIg+JBDDNGCmmD9VPt3H1LIREPazmMbAK/bvwRcDRXjeVpYkiKnHCbAv
         /wsjm5r1qGZCPkvZOjvTRxDjKZNyJ6PBcoaxzN/b782m/2LXM3Sm4owgSJzUrTnrL8hf
         QKl4t2YNRdOd7Yku8SMnZaP+sXlGhkbg4fHKBIHghZ7cscadXsu7BazBaGBCxyIkQxG1
         CBqI921mlS0oMDGrZvLD3P3D9teCH/hhu0Qd06YdkQGdRnwJOpoVwwQwhse5sISXhgQe
         Zwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
        fh=c6S/f4u096424RO9Ux+7UE311tTVsTfcvCISbQwCl7g=;
        b=TCI9Itj42OZuvYLH2dMaeVPfQ201m+zQzFwRDUb/XfrGLqsY34bJlnfDs0ycEJKXbG
         FooFBLbSe/oaDqK1FpSgV9FKgY6xZtCa6HTOFnWZrbKxlA+Sh24LVONoWs7Q35itARbj
         61Ex29sghIBi7QcT8qEPhpH84E+G2sygsMMn8g/9zlaTXsGcic/cYq170Y8qxEtrTy3k
         EXKgi7jJDP/5EqV+Ch5sw0inceRqw3FLFxBTzlQVTju+AiQC8w89oZJrOMc+gBCDC3o0
         INSohuTqurXUFtBDLfWP961096YLupqUqtxlqDolo7zcYylRgBXc+Jx7XZu5zkoQ9NMs
         aowA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789480261; x=1790085061; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
        b=dfkf/blk0+Fc9K3qVVUAsmWWUjgtVwmLForFXyjdLJXK43NTnZ3+fTTNbPwBZ/BhZF
         5XD1Bv2PRXOlOhnQjev0sV+To1neP5DYyBE4Zz/VmlBrIUihBP5yWv1uTytj7t2J1asu
         FP6XY7Pm0Q8c/V4RaWkMssxVpcJqxvweZi3bpmHmvRxgU/u7Gpe4Jg4gRN9hmR63/6xf
         cTW8ZlBufOGcCWrRlODSoNJSGlFO5rc4AZK1KG0/hCY70nF4m7mxMK81nb5t2lwfHZ/B
         fUj2D0RFcrGhWBgFupi/cF+/n2Jdq6ty45TE4gje/CJdg42Gc2O1H+ZyPM/R3jEpsV2a
         8DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480261; x=1790085061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wPcRrMFAq+5dln8/Xz92CdQ5x3DJk3HiLHlwR+yBQg=;
        b=zvWVIbTpNfSk+l1CIugNbE836fIVadaf31SAZLdbebhg7xhRhPy1bgmpsl+eonpkzj
         OhklSjyIXLz/JWR+IivTg9OFX5OWaFQzKj9j7sWx+s+jO7EByjJF3W3/8m3MOfa2fPI7
         4R8elbp6wTrnqF+D2hzgNBTLh9pwLrkMhwRHVQEAICDmpWglkThhOJXN607WG4f0lrJf
         VJn8nwfoApsGAfrBQ69TBjeem/Mvwb31FnFgoIYxdpAU3wL0NPC76sv+KRKy2vCd1tqj
         QdSdM5E3DS0jkun04lT/wGkW3Jt4XJU1+oXzq5GkEtWi2yHzRPJ8ltUCc3NgFeE8pYxe
         kvfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxc8g4HIUyARhzN3bnp37jdjPWgxxL0EYzByVLSwMT729tBvmL5dnM7WaSWxVpFyiBXrYmWMcQGjPigdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lKXA6y+50qXyvRp9ED6K01iDZhixgCD8igr8k68uzAY7nY9ak+
	5c5fXIBhr5PL4Uqxh75zlgWBM3ACZoIxQ5L5lCRixn7YKUefaL8IsPVDg4WcK07bkcPGgUJv4l1
	0HhvnVtZtfHyMbh18C0fQ5KFSK3UsKVM=
X-Gm-Gg: AYBFou3c9TcuoqSiNEoEhwdKpJhEH78h22dZEjQKoVuqGXbsl6ruSYgakU7QlwWlyYB
	QRB7SL3YVtREkRzsW+5e6+tzbIaJzWKOcGhSqxWAHe/HrH8sDfDOu6Bl91puutfOUYKKtPjsF9J
	6dcagz/lYM7V7SHlGVmzvaSOIxWhx3VIUvNbujwrgh4RG+Mm8udvFc5egQXP6bbLiuhOLXIf7FH
	queEhgW+Ss//SUJfMCJAzP5uANjlxHpy1MblWut7XzfUHAIn8su4a3Jp8LbMnZ8qMNT+fe8r1Dp
	krCdBFz+/TpkV61K6aLFOhmbTPwAg4TSVbZfK7KDeLphMbdTCi2qvT8=
X-Received: by 2002:a05:6820:4df2:b0:6be:dc4:13ea with SMTP id
 006d021491bc7-6c739c74aa0mr737467eaf.50.1789480260532; Tue, 15 Sep 2026
 06:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
 <20260915075939.18180-3-abdelnasserhussein11@gmail.com> <20260915151634.0000787e@gmail.com>
In-Reply-To: <20260915151634.0000787e@gmail.com>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Tue, 15 Sep 2026 16:50:46 +0300
X-Gm-Features: AcwNN1VOemZ51WsQAP6jqp3alJcLgnYJqt7-z-lPu_slORPzqQPRWDZ6MAZ2e5Y
Message-ID: <CANpqX3ZkzU=+qmd4RRwwBbX2UvJOzeLhRi-hfXRR=FyeH6yD5A@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI operations
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi Joshua,

Thanks for the review and the great catch!
I completely agree that securing the sysfs store functions against
concurrent access is a logical next step.
 I will prepare a separate follow-up patch

Best regards,
Abdelnasser
