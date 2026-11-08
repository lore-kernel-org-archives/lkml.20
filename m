Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161580;
	b=WlS5nVk6s5zIoymxfiH5TVufDQzwteseaPpJqwUtvClIPiXoZemCotLyAAQvlmOeRX+R
	 qqR1ZV8S/FYe9SRwHpPXa5NmdaCg9ROqLsSsWQ2M98g6HFisqTbMwXsGOmYFJ+XOtxEf3
	 hsWpL2j9knA4EjNBihEMZdRhPxumnpUjVlQu3zgwVnYBoMp1f7HvhEXW3rkJYkJUjG1Dt
	 nFM1vBSd4g5/WAjFa7EhixYw21TWqm/YxpYqurL+Kr4gmBmhduCf9xIU1ZBo1/ognydQp
	 tRal2ewVLyZpXA25ckeTyjbzuyqThvdsV8mWrgiueTJ8vYOYxi9yXy7rbrx7oxVSfQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
	b=icDgnzy1fWWnj23Pqm25AYSLXC2tqn8wasI8wODMI5TSTklatva+WqSVJSYB9ELd4iS1
	 5oQ3Up+RHXHDcrk9uS19WBnut/K3bn7Di/QQeRJXlBmzPFyZwHdGD8/3KIn0VD5D+nWkW
	 +i3QXlKFIZ+fWGPHIeKNVieVto7G0MsrP1deI5oOkPgUwfEoVQkxvOjgALwLJMSz81eTK
	 d76A6rDYLIBvG4515H13aBhiQdupr62Mh7EPmziOpH0frPhz08pU2mJ16Q/7Ymyo4LFrx
	 QuAPxYAtu6TszPIN+LAzDusn/Pdl6QkFAjAmDVHeAXTKPbrDZpTX1bLx2qpkZmP3Ofg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBte9H9u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ABA606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ABA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBte9H9u
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a85c656c58so135762fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161579; cv=none;
        d=google.com; s=arc-20260327;
        b=FzeqjFeGDaKzWGeobqflW39NaFew9W/gmnjO5wBzjAbiyxc1hecUFKKXZmXA9CqGCR
         P0oSUMYe1ARxeZFs0aRhC2igHrqWenfxj7VgEzhqckZijQTuXMKByGJrla94/tB100f8
         jPmEtVtJhNlNTxXBwCUwkKK0gJ8vRgm0bBGtX+hF0S1wxlxjdJkJtqp3ABJrGB/Wj0mr
         9jYHAvhhVSHydQB5IdJmOwlp7XbuDMOKGC6P5y5/WlL2QGqX6qD5LkveoV0bxyJ/SLoT
         b040eVTzIOmo685yq9EcIDANFWdAYO0gWIGzOoMu0aSzsPgr6oYpd8R5M1NKCKjFpTwv
         RZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
        fh=4QA8Du+uEiDNQIg0Gr9XY8qM6ZNfmLsUzorNGpF/CuE=;
        b=Jh8yM5ffcCmYK8NZh/BzIglm4Viszn8oLdgC8AO3xom5oeCHxWp0lPsGtzjsjTUnxR
         yc7uxyGOivzRsu+JaNx359yq42GDX3aqaFRN4emiuAZRt9ZQGPDPZy/7m4RSB5xVwnQz
         MdOgIxmIu/9TMzonYwjWx4jZ/QXLSBuRWjQ2r7pRCQAZHpvTuiaObtCMSmioyW0vQ70q
         U3AzUp9HXD56LeAZAoROUJLVpUY1QLgj05eIqcaYyt+x3qlVJ1m/UjhT5REO6NksEbMh
         U77+t8Eh+I4hB/XxKrf7B8giaGsnCheXkc/HxuBIZxLbuPlVN+PZNPcWZ9kvEHJki4s+
         Pb4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161579; x=1794766379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
        b=qBte9H9uJHuVxe/196AT1r7QBpCHdNmjNqpstnpvNZGR0QBVo72LMlLSFIJA4+27N1
         Zej90nX4PUxdwy/Ayphs/PIYHRJKFsN4N5cRzTuWi6Dv0N1+nzKgD/TiLQeFBPJ3nWpa
         xvSxrvilo87iNKC2OTcmRdckuD1sgQrmDXYBvYIhxZnVXJloJo90JtlTid41WZy29p2C
         rPddl1kLM68ENEzA8ek8z82LfUNt4xW+QPqQnLwCLk+mHqj44JkUdf49DSDTKAku5gCe
         qOrVRdcBqvB8wXmvmwF0FSeQopNHl8n0MBOAY/eYaWVgGWPtsw2fYYm6tgaVwEVs6+Xg
         zEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161579; x=1794766379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
        b=pgD3Q9igBPcPklB3OAiX+IUE0NXYvjtMpn6S52QaqfvdRk2fb1x0/Tt5bHAys1h75b
         0o7yFDE9Fprcfwkmdo/Lfdf4pbTH4TjbLLoZjafVLAnfaRvaRJdAs/GXdBbPJJ+YLTnD
         EXVDVzxqY5OU7po/sEWodOoIrq3uOmHUaOoyEaK7DCXMHydTytyVbgfwymwqzqrYUCzN
         /c8xof16Vlz7xXXNVXEJmJnSPXmCAcG4vmiH+5YRMb3UjKng0wr2eO82dasQtG1RUEp1
         37AP5XRQ3T0aux6o9eUab7gvgVncBBaSxOm+ycSJXJSh5ASE31utpOZ7JJnFVNZsRAB4
         nTTw==
X-Forwarded-Encrypted: i=1; AL+hErGgsJda0Wp6HoVVdU9TCYOLPoGWtK0TbWbf3K5+myoc880GxyR2WI2F9QQqRQyB90OXYXpjaInRm6AlWEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PQMhJZ7nB3ZYSsrRWH8ILtPH1HJWHFQ4WNBpmEZnkfLsfBIlt
	QVgOhajhaEZ30oJJ4Ykg5VHlF+64iZOg8QNk5abil1I3cFaRUOUCyWrkoj0m33Bt+Aaovkc7u5G
	0yK3TkriihPsdmZA4zOKndAqtgHmgp78=
X-Gm-Gg: AYBFou1MHl3eR8duLu4dWOIk5hpM8hPZ2wLCsWFR1UwO+ChKt9jyvLwTT36Hav45I/h
	XjNqybjXsJHVngNTCA8Yro59XSEBLazxBWmQqacgl5dk+ivlfNyk+KHl48jgWR4ZRR1gNWc8I6i
	xZz97Xqcc+8PDrKmS8GhmB2B6/XkwCsOYDR5/yCmitSPptq9tqUW55OZdoKQbt2IIMv+fu2Srxz
	hB9uOON7GKSzkYunzM+7reaMnWTzGjEGZeVq5Yedt8aWeU75BzQR1YKzBHptWGXMsMFcnYD7u9q
	yL0Cb3/s3E7+iredHx+jkO95rhaa11iTxqEi+5jTTb8L5r/M5MyrClykZ0su0qh5H4IaRlGQkcu
	USU+pnLcirrrGrwiDOSXCEUcUFFFhK3FeyUGMgaeifrUlBBhV9Be0FxWplBUZOUSv76Jf
X-Received: by 2002:a05:6808:690b:b0:53c:7298:3598 with SMTP id
 5614622812f47-568145b6024mr1440894b6e.31.1794161578638; Sun, 08 Nov 2026
 10:12:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-3-hjf3108@gmail.com>
 <ea79031bd2324090bb1b39b3c3f18a36@realtek.com>
In-Reply-To: <ea79031bd2324090bb1b39b3c3f18a36@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:12:22 +0700
X-Gm-Features: AclHuK_DEGYGJmBL4I9-G70XKz8DCYgi6jcsy_kS1NLIHIqLvm8fk4Pm0FhqqFA
Message-ID: <CABOQOSV0Uys3VigkU4xoT-wfBmRk3UyxJ1KJ5dLDVA6vy=k6tA@mail.gmail.com>
Subject: Re: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 11:13, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > Only the first frame of an A-MPDU comes with the PHY status.
> > This makes mac80211 report the correct value when queried from iw.
> >
> > Test results (2.4 GHz):
> >    before after
> > TX 6.1    5.2
> > RX 29.1   27.1
>
> How does improper RX_FLAG_NO_SIGNAL_VAL affect throughput?
I included the throughput numbers as a regression test, to show that it does not
cause any speed regressions. It should not affect throughput.
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > index 9f9a34492030c6..a8910cdbfa0979 100644
> > --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > @@ -425,6 +425,9 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
> >                                                      stats->rx_bufshift);
> >                 _rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
> >                                                   p_drvinfo);
> > +       } else {
> > +               /* Only the first frame of an A-MPDU has the PHY status. */
>
> It is clear that this branch is !phystatus, so no need comment.
Will be removed in v2 of the patch series.

> > +               rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
> >         }
> >         /*rx_status->qual = stats->signal; */
> >         rx_status->signal = stats->recvsignalpower + 10;
> > --
> > 2.53.0
>
