Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5464A8FCE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596917; cv=pass; b=dOfIJdgo3rHKXuC9X3ag70g5zzmv09wET4OmKpjIm8pHj3IjhHwmZltXSYUzKA7HKOV0qs+sHtvMvP6iLAdP9wCHdSWqLPs6mZd3KxoNFtxJbtxg14Z132sZGyKU89tf14JE08atrRD8sDrmWo29JJ/S5vRE9pXBPM8zRQkcBho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596917; c=relaxed/simple;
	bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8mLMTuVB9H8ivtfJQvJWpgukiUEy/DketazIJj+pGrg306gEg2pMVKf+sBMUyQBz+2xMIdfLNM5UjLCZHyB8C0cWtjoa8x8LAR4mexCkfZjPJ2C++tqBhcBqq7bhyhJESvVQ8gTGiHE4fnfmGvJgZbAFXiuStJXrp8VNELfjAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nrq2lmcs; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nrq2lmcs"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729c4030f0so2536590d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790596915; cv=none;
        d=google.com; s=arc-20260327;
        b=VjedHGvLwu79kq8iFWUAzSDKj99yRyZI5U92V2PO86QjvMAVhTE2lJeF1ymcNtSmZf
         NltnlizUew/3vW2SmoBtBowURqo2vTtvo8EjBLtFDGw1i5wmDli04dPexho1XKagcboc
         rWq9lGCfoiLyTSLXnsi23BUUpt2szh+W5r+gvxPp2XTVwc6ac44vcbrnOx6QbRFCDGkS
         4bQX6Ydc51Tu2L0xKLUmc9BGZwEq/ugCykj0YCw6MhMkOZQE2cCFqKbBQ+Grz2rGnU2Q
         Sbbx7QmWoPH4pPkTka7PEHdbMUTG5T8Syt/oiM3Bd8sjBVN7dlQu5jSKK/pg757aVXT1
         vI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
        fh=a/dThZ1/dIQtL/PHv/AbeN+7/q1/fLW8mv9fYnSk/04=;
        b=kIf1YCgYNx5AxD1G/76eeNttaNXA3zZTw/3iVWs8IgNfZzRCJGjdP4K8hwa443hljG
         lT8EUfb45p7zvUmXeNGrAzg63WpF09LCZ+sAu3ImyZZJJFgI44PZJYLPpKJTM8Gsw2yx
         dL6ZtnV7kN3Iyrh+7QAps2IMi66/MqAsL98ee1L2av2oqXMOi8PZqsiTSUK7MFjkGNnT
         uWjdOVUMObtxCcDJaRX07mW76+vA3BdSddxzduXo7dzn8XLUjY0SweXsLznNf4agbsoX
         197fHm8i8GugULbjY5YefGzh0chr69+s7XlO9EXWI21h/+mrLE55liEC6+jFz9B9wnPA
         elmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790596915; x=1791201715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
        b=Nrq2lmcsxmCdjnPgCHG9KquqJ8QgDJDLeN7+qgTfVB8B0U4V9n4q5gmT5cQJm8YKcd
         J/PrQpF/EmjTwa5up0y6JDgoYVWHrH3qpsZdIDCYO4Zk+MCIJfDUS7Aw47aDR7ZHcJpV
         P+0OoRRcdDi0jaBnb/JwV7D+zpctPDSp4xMQwsKQvMep2hTQ2UWVZ1uL4i1c6Zlzv8Id
         1He0aXE5JHsj1/2lu2fHMRaSZsrp6OhpklYtNSrwpnnjyKrr/Yde6DXtaFWYK5HmOcUo
         AFbr542PEcbwkH6n3qj/u57M8F+YvN26LD6D392APlr0e9mSIfwtdfj6ujGqvqXWdPS4
         EJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790596915; x=1791201715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
        b=kQxvaUJCLYNHsQg3I1FfveUfViwdcqpeKfQxAZYO3LrTeUMIT4xg8hU+gnm+yf6KCM
         dHqdwqLldIBZ2OKi8MLVu2hMlfrgu2UE6dWKZ3N3xFpsfL0QE3jSaL9RWCdJWinPZQ0I
         IVh8cefPIEIn+A8FoEJkR0A8fHOGlUUP7UaJXeiu7TA2ON961DymybuxL0Zu4bmSfMhE
         dpyfG6Hed9wdoXwO1wvDRkPPWPd1rNTSghYdHWNbT4EMw6BtFvEFHdirD4cS4jOpVHcq
         jz8Rbdwj2AD39wplQyfuOBE5zK/L0faYgJaM9FY962qDFGtflbmXGKvluj2S9mBY3Cap
         h0lg==
X-Forwarded-Encrypted: i=1; AKwUvByITE/B2NeBb39PaPJ+8H5LwbzdyKj5N/SpDkKpEhW6+gKGwhIP7Dm3quvMgLhNSxFdRV49UWbNdNyoPJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9RJ7ZFpppSLgmVdtCajeBTX9rB3qTsh3p+pirEl+yv7rC+ofy
	5CKK8AdV+N6pv1DxLIbYAFck+m0D1AL9tjcS5m7UzeyCBb+R8zUwF2zp/PRPe6L4uKdcv/z5BPD
	eFrk0smayiVOj+YHnMI8y9iIlEYWfseQ=
X-Gm-Gg: AYBFou1xXNh3fncFcld7pO+786fcmMMDyuX0dJ8ObUVdiybMi19wMbzWO7y6S6YkLnU
	3gunLWEad/UR/oiX3RO1zYI37ysWtz6g8sFlBZeJAzhl7ubtrlV21tmYKL4IyTuCab7C3wflc7f
	WHVKKpWZyzOQb6MdPB1ChAdoCm+BNTU5W6Bjlco8KiMJViAAMhUBGxKmkx7RwyLG8rj2zXzvSPH
	5KsRSXGxIWZyMO8uJTwvnf8bu1U0LUbDAOI/jMyvPOij6PqOLaNy5TCAh7nOCe6qUX3CMRxB1Fu
	kUnbDQINpRYY3u7HMCdvEE+m0R4J3Mz/M/rzvSY0GnMLzs8IUDdsf2qYsLWjbzS25Trmq8RIO9I
	ztwZQMC8FQnQjXKVoGtxt2amqaROWEVZMWGGWFE6+nL38
X-Received: by 2002:a05:690e:4104:b0:66f:c1bc:c084 with SMTP id
 956f58d0204a3-672ed46f22amr4346039d50.76.1790596914854; Mon, 28 Sep 2026
 05:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918054851.26083-1-kartikey406@gmail.com> <arey7Lyzlb2lq09P@extorris.mess.org>
In-Reply-To: <arey7Lyzlb2lq09P@extorris.mess.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 17:31:42 +0530
X-Gm-Features: AclHuK_DElKr2bW_YcTnR1z3WAtVyL-4qOXaLC7wBY2eg2tywusqgjLLtA0gkzk
Message-ID: <CADhLXY6CZkmhMqVDDf=u=EgPC7ni8M9Oc7WxpwVai-jxUh+f0g@mail.gmail.com>
Subject: Re: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
To: Sean Young <sean@mess.org>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:26=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
>
> The debug statement is pretty pointless anyway so why don't we remove
> that instead.
>
>

Sure, I will remove this and send patch v2

Thanks

Deepanshu
