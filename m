Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793371608;
	b=MnvemMEGEJq8LKQXkvI7sjCAghsL1XljRFzyqPaGF3BdZZxh829s+aQH9rVJnKxYVGvI
	 r6FtRv/5scxckR3iMyPQqv+fNmSg4frq8Vi6K90PLCiF2UtPDO5npBELpfe2G3V8QG+98
	 J3ds3Y+/donUu7CFua3cg0F6AtL1ZA8Hp1v5TgQ+WmhXE0n9lk5Y+mHEk4kkpkXQuczUC
	 X63EXf2MY3qTEY9iaSOx3xaihwLKWtsRpT64Atr3fV9S6YrSv+ueeb2KqJItPtV/sOJ/r
	 6sckrCsTWXhPnH2gr5RUBJKdSvakIwsVrvZrGtGneo8IX+A7twE4SK87b5cgVx09duQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
	b=Rfh2py1YwIfa50PFS7fukp9EGzsqOVaH+EUrbxsGkwZldGIE7KzxpMM6yCXp79RJ4kNB
	 g9UT96sfqCF6eQHlYoPRcNXCfsXq1XHK1p6Atmc42FlMIavUf5iOXFDIjbaogWa7si9pG
	 RppAo/pkN0+RgmoRv0q9MNtmOrSlrUcwpV+t9hmO3kvgxTUqJelSud/s0rI8xK917/vcC
	 0C+db1+rezTZmKVtkoSX/rsSATFR0/ZiaT4Py2JwX/fj3qQfUz7cvwt1SheP98bg3QhG+
	 sDZyAvYnBmFGfgQlNfe+JV+SbPWoCtQfrGCL9WpgDRNfHs2xwWlkk0fIXxEwPMI2/GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wI6/c0oR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wI6/c0oR
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d91601bdso15906157b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371607; cv=none;
        d=google.com; s=arc-20260327;
        b=bUBo01jvu9InuX+y/EI5WXjKw/9R0WjQo/vh8NWhBZfGMXGD/vWKCi+9R2NFkPAQ8v
         HgN++ozchf+4uJqAJYv38j5i1PmaYIQnbVXUi6Gy7ib/ROXuakI1AmfmI6BrTYOiXbPV
         A3B4sQLYIXwAmvGt55dZx6vOSD3sTGcgKNujXZPQ9ml5uIJV/pFWdSasse5bwsixw/5z
         8BQeNGppQ+Fveq7Jcy3gbupA+hZcy3do62J4fnyyj9b39aIFe8Mr8pYQnnSwu06AWm27
         53ULKb2FxS/Rk1a9FOkkg3Sv3VPONJiwjiMgTkYaBVGOMg4IakE1V7EFYm4KCwBOEA/i
         Ml8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
        fh=xKICB+DD3JIjNW+63xtnI5wowqTHT+Ekk36rcpNL3R0=;
        b=XbVQGgTV2Wp6Jv6AUe7nfmOYqnZJyXFkJmViiQKm9slj6O6gCvzhcc/kSWLp2mm1N0
         vtnYea3qd9w7/2siQDsn5GqVmZJeZ92oZ9NCESzrPpadB2bHzdC4DqySEsq2wcL0UPbG
         muLnwvT8LSm6B9ob5w8UXRKrz5vMtqY/sCq8Lk5A1sZvlU3M7cNogfG2hiowgnyxF5pJ
         2UIaQVdfNf4uiq9qf3vFudxnTpDLgWMHpC6gfIO/7mq2kE3EH35np5yA7b92HM5bNAV1
         PvZpO15zLO6ThJvbysFpZNu63P6VM4Tbt6chZpxbncgqGcph5kp8m51ANQS9GmKob3FF
         IKhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371607; x=1793976407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
        b=wI6/c0oResgsgq5b8xhMVt/Y6kYk/H2ae6jbf2ayU65xNQSFrxQdj0VOiGPvhU7xgO
         y+qW80YTz++RZsX/GhMAVOYRfH2il2CjwqzD2eYLrgE1+YCNKVvCYLrVSH1J6BkA4KKu
         fGSeyxOhzQySNt7MtIKPDSRv2LVPOw/BdqNxXYtZNVHWJFOam+0Vw/HOHDJSl3xu8EH5
         jzUrfLRig3Ab/mdiLwd82zLd9Rbk4qdgktO4xiS2JEIgo761YcWUTNFNG+xhw6MAgbnZ
         HdzCKjOzV6bA+mJsaUewy2vobYWahPAm+Gno+UeAwZLY3/SYR61iI8Lze6J4VFjfuPsk
         RZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371607; x=1793976407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
        b=ZEMShTCE6H6kKRVabSnLclzhbPidNkdaE8+kuVPP30UK55zmeHM/ToD9wpmRGl2izZ
         wRKfe5owC7kA7HD5UGzqXVWALP3Y8woJdgkKNmiu8QdWAaS5WADIL0bjSdw8lU0dz2Ox
         hpie32tRjKkaJiNYKT5yTXFVM0lWB80uLJ5HfQHi3HFvtghagyFdAq9f3E+83qszNzYb
         wpkuOHUW5PiNOdYGsClLFX/4rEPGZVOetEndgbtQqTbVm/sT2emLzK3uQYO4cFJ5qFLa
         lNE+JW3Ebv/yb1JC89JaZmVccRDLoSQw87MnmIcrMS2vJPZcWOwTd2KK6+qzK0IZjp15
         Ahzw==
X-Forwarded-Encrypted: i=1; AKwUvBzQgwKSevwYaWPkv1+IWoQ5qANQlRDll/vy6tg3qydD3yi5RWXQNGsCv3VFRyRewkrkNtazPgarYBDgqNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYINsUj8YAOAuKifUerXJ9brsJIivxEp0wlk5/Vs4FAAp0OlDwVJ
	sZJbeFzWxjzcH8f0jAX49p/BmiCoBMUBJV7piJbuDfi/ffiwqY5Fupoi0zMHgq59r+lZd4oVeOf
	c1UUa6uNDeyXto5+3eoaElvBhSXVAcxI=
X-Gm-Gg: AYBFou3WKFR5SGFyqNDZALuud0mm+E0u6ppyOd/zwgEHdS9jicW7AGrQUlSvHxdGm81
	dZlj68Grjl97AY3l60hNMs5Oj0R5Kg/ArJcKxMCgotLvvyyZA9AU/rUo7NptC8KEQlJpIbIHdLF
	6fOWC3ETn3/up2PzrQTZ1efo1HSF4gFxQeay7yT5TnEt74HqB063pmzpLj7W4nJu6LyUZmiyQSF
	5xba1OOhnxvXFRvo7arUSUt6w53cwmto9aYTF2NMEA7iLYF/eunbtcB+PdDeiM1aX6CVg7HjvVP
	9x/iPgzaYsRgdKXwTC650BweZED4P0GxNVmDhGHxAgdWeqow4JzkK59oFp93dqGHpv/vyXjropL
	3SHitY6ffPm9sZZy+iA7CKpo+DhB0MVyGvO/g
X-Received: by 2002:a05:690e:11c6:b0:675:6c29:c985 with SMTP id
 956f58d0204a3-67a8d3dda68mr4094771d50.22.1793371606158; Fri, 30 Oct 2026
 07:46:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com> <20261016125229.1798791-3-thi.zirnstein@gmail.com>
In-Reply-To: <20261016125229.1798791-3-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Fri, 30 Oct 2026 20:16:34 +0530
X-Gm-Features: AclHuK-GWiL1q4_WovgWSO5m2eQecD3gBL39B7xCULqbPJrTNpg-6D-hsXEdOeo
Message-ID: <CAKfKVtEOOGsJSV0_im=-0u=N=fxkDuCMnAzt=1ZfBs4A4rg_0g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:24=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmai=
l.com> wrote:
>
> Use non jiffies based waiting functions,
> if in atomic context.
>
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index e68e17bdf0ba..fc9a0628cb67 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -359,16 +359,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c =
*i2c, u32 mask)
>         xiic_irq_en(i2c, mask);
>  }
>
> +static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
> +{
> +       if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
> +           XIIC_SR_RX_FIFO_EMPTY_MASK)
> +               return 1;
> +
> +       xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> +       return 0;
> +}
> +
>  static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
>  {
> -       u8 sr;
> +       int rx_empty;
>         unsigned long timeout;
>
> +       if (i2c->atomic)
> +               return read_poll_timeout_atomic(xiic_poll_rx_empty,
> +                               rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT,
> +                               0, i2c);
> +
read_poll_timeout_atomic() expects its timeout argument in
microseconds  the current one is jiffies. Can you check it.
