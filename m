Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D94FC335
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630810; cv=pass; b=GmcCdbxnCc1rkotNp54QQA9nnE3fr0ekyTRcboiEPVKgj3H86n3AqnlEU8yoKXvvUN3xlEV8hJj1PXddTXGthQZq3x5bcZv8PJnixLz469xGjYYyqrVytOmM496FOpLYw8qdAbzm8G4kxrqWNDgyWbPelrFb18cYQYCuirko2P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630810; c=relaxed/simple;
	bh=36c4/nh2QN5FJt39r4MZ1OBS2WNzMmtUQ1xAvY0uwq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuF2igU2dqpURK7Ni16iT3ql2R4GG5N+NPfGzJr3zLuK0laPkNpoz8vxWipS8gLqLcN2XgacTSlI4lJkI9YcXvR9pJJgPcl5ta8xdw3BaHZ10G3A3khEmfBkIzcr/hpHlTqXFQ7r5Er9G2//bL7tsLj8/w3Ki8duyfzrdRW4Ki0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BppG7JaO; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BppG7JaO"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso5904512a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790630797; cv=none;
        d=google.com; s=arc-20260327;
        b=ma1myNF9YCsEn+dKMq1P7KhGIju94MCgN6Tf78JavUs8JcanvWMzx4zMxQWV5MLjgV
         GgyWNGbGXDKAag9D1zv9iwJ8Gx8qxHmHGI26PdD2bE6mllbjRIXiGXKGPH8s61DAbvbH
         9RSB2f5YNugqw4lkpLgU4cgIQFMTJNvwdGrKlrfh48HT9CvbghWmWJQGrMaWYQC/9sUs
         rSUzKHjcL69cvtkaNxHpS1VGsuI9TT8fmwM9DKsyLypGftgHGV2nezTDBPHfrjeBTHKv
         iqhdo7YV+MSQJqEDkBw2njsOJ/4W0rBK8p/O+VK2m5d5H7KHTSrZSb7PqsO6Fthl9U+5
         v0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FF22kV1FIt0Dfmqc/IkjF4lzpEWQoZDSVBGIa/FDMM8=;
        fh=THqs77X4RZnD1kcIIc5QHRR6rFbWNzGz/hyLk3lqrOA=;
        b=ISIHi/Oi0o7DVVBEIG5l2T8cVH9Pwj3VPE1QhSgrS9d/ydORwoL/EJDLnRFXv1gvI5
         3+WoRRWNAbpajOSZJ2tgXUs8Cknca+BB1RvlIf1msYBQRkyE9Am76Z1wGtzsqYE7y7Rr
         o18eqDsoRLzm3uHY5BQ90o4ZhUFFAueSdxpp9pRJR8AquJQ0uC9Swr9PnpudEG+c7ISf
         D5y+LF1Yl0i8SQCrsH2VBxRM5geRYN8IOHoR7eGRE6eJaDbkfvrS8mIxrPcNHzrz5MPO
         zPJ8h1C2GcznSfJmnxQTaRNU7nqKBxixuvcTbQ8ndIxAbeoCbtTPrvVCTs4yT+KW/4zM
         +Epg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790630797; x=1791235597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FF22kV1FIt0Dfmqc/IkjF4lzpEWQoZDSVBGIa/FDMM8=;
        b=BppG7JaOIy3DBBzo2JOMVh1r7+oGxT4z1utaZDi3nqkqq0tUNZoZRBVDcuGvgzncMo
         h5TcVakx8Ygi9KwyRi4ZbLphuqPYI10H83PrBK0nsBk060Tv3Kh7bm8WXUOn7lDVS3Yf
         NYmVAsGKRRR79eIqrppwhJ0/9WiexWnkg/BzRVtqW30YiFroaBkmMbfSUwsBNKFcrje6
         8+EFtk2sIwUCdFYpFh7N0njOzxuopnYdSFOyoUiicb2R91j7+VTweBETIza3fN50gar6
         kDANSx/QW0UyI2tvM1fbFMO3mcoZs5p/mpv9Gi5G7zGyExg76jwKZbXy/QuR72tYYYME
         LVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630797; x=1791235597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FF22kV1FIt0Dfmqc/IkjF4lzpEWQoZDSVBGIa/FDMM8=;
        b=bn5bshGIQema5GAxu+3S+XELEZTX1gvPqLF9WyVMnzEce7ysMVfd5NiB/8sLQPOy9l
         AfRsBqGFPrO7GiZQyXQdJ5U1GB2v4mJNVztp5wh2pL3M44mEEnAR6oYgn5MvxIyhzMEI
         HGAJVRb5hjWWWQMlA1lVF4DKyBpdYNXqhS5vAlbf28PlOfVIwFpU7FI2PW1Tge7jLAIe
         MtVR0nC8hMi1waWt5uiUBgDmL7x7yj52EwN+eh/OEabyZiWqWWuf5ingrhPg0UqMjhLr
         g8DYE09LSpHFNfUFic5+rmINJmGd0UKNo4Xhd3GP2ea9eFZqkcRDxypYK58caabUVf/r
         ydxw==
X-Forwarded-Encrypted: i=1; AKwUvBx1AwLju0Jki2zjjQGp5m24t+0CCxhQips+S9zlY+LrNxuIpYOXp0zkXAYfKbhLr9bhgue/sgya+U2dOLU=@vger.kernel.org
X-Gm-Message-State: AFuF++mCD7HnbbBB8kT1jervrxNwwtcgnC4bV+o6kUsY2AqcDcMIiBv2
	TUFhX9Um+BepOBU13hvJJ1leE82+loDiPSitJ5gMlpFKR4N7j/NAiYf9JiXhmIBB/bIU6MsDlFB
	TIDEs8w3q73rr4ik9PB6Rh/rPnsrcUcEkTokuEXs=
X-Gm-Gg: AYBFou2hefRWaZGwnSdMvVfMXbXsRHN/Uu3FyRTWJNI3JcGoIZOlpBL0hWgcp4XEl5e
	hpy3oaQR9zdYiDf3Kg0DwWrC1g0PFK3PHBvpFK3t2Sw5v3NG80niVHgrztp8nWbeJbsVfcUFG5J
	EslCdOuEuklZ74mZWsD0fj0Zoq13chSr1WEZN34KwYRvE6afr1/GVyC30HEZcXz38JmNNpGX2f1
	vsAenw896alw7PCwcNjjWEG692+z7Z4mH6jpxpEKYKQY+rtRCUXWc+HTeU7ajZlH8YYzZeXs+tf
	qyLjWnVtRZierCou2blZjk1GGPPNa7rRcmRTt8skw8YTbLm4kwQ+Bttcqs1hLJA93i4h25edcwe
	96mrryGCCKhyD1qOy7Yp/gCbO9IXM7f2iDMYisjGDLp1uf3TzMGdLfEZSN7vxMggTEXCUwvZe2t
	33lLDNGTIQf07VTHADu8mU/xpFqYRpMoxahq/WltqX
X-Received: by 2002:a05:6938:a085:20b0:c2d:c6e7:9e9f with SMTP id
 a640c23a62f3a-c2dc6e81bddmr310910566b.27.1790630796755; Mon, 28 Sep 2026
 14:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928200318.63383-1-meatuni001@gmail.com> <20260928200318.63383-2-meatuni001@gmail.com>
In-Reply-To: <20260928200318.63383-2-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 00:26:00 +0300
X-Gm-Features: AclHuK9aoydHFby8LX8BqY0ekVNNZF7gZBjCzIJJrmWtMkMRg0jStsZZ0Ski8IY
Message-ID: <CAHp75Vd0NF_5nusyoV=25umqUKiNGynCJU1tercwMZ57c_BfRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:03=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> The escape-prescan loop uses 'size' as both loop bound and
> accumulator, so each match extends the bound and reads past src[]:
>
>   for (i =3D 0; i < size; i++)
>       if (src[i] =3D=3D '\\' || ...) size++;
>
> Snapshot the real char count into orig_size and loop against that.
>
> Also fix two adjacent issues: the bounds check omits the 2-byte
> length prefix already consumed, and utf16s_to_utf8s() receives the
> byte count (src_size) instead of the u16-unit count (orig_size).
>
> Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

...

>  int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, =
u32 dst_

>         u16 *src =3D (u16 *)*buffer;
>         u16 src_size;

>

While at it, drop this blank line.

> +       u16 orig_size;
>         u16 size;
>         int i;
>         int conv_dst_size;

--
With Best Regards,
Andy Shevchenko
