Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794302292;
	b=kbtxykfVNFmWRWcA6SKBVpIX6KRuOJR8pnUUL2w8bcloE81Ad/InGHumprwXb59uAVd6
	 Y+D3CbH+J533/p9VWc9wUzjbWKOb2x3fbneK89tZY4DQ1l2v9J1cp8zZLYWyqWv+oWGzf
	 XuLNWp0ZMM9dbMYdj7h4yag0+9iMJUCvjONbZnAtp2GsaL0jIV0+UuTwhnZIQQMt3EQF2
	 WgHSrgKWtEJREQ5TG9UHmX5gRX5mx4K/6i2ZFbiZcKS/21Sva1aQa1BPYXkoefwNd8ytg
	 +z2ae4e7+/AfF+MABHDlp0zmdQ+iCHAvMQNmW4T1yy/bn0ziy5nexAMW9TOFtR1t4/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
	b=JNnZvynLxgzDPd97WbnYd0IkbVXJB1YXxyMbQohsA0Po9qSyTgftKxOn7R+wTHOezq6w
	 PASLsX6imuO6UF9Q1Ug+/x0xVLsuqFnz7QIxdv2MV+JEl3J4Gx42xI90l7uE8tvK7hdwa
	 VpxllGQBJw39iJTuVQYVAm5kDl3Qe668qw4yMbRXcMF84mUu8nzZ+LR+giEE1SFxkB97U
	 18mGFFMwoDLYOKpMNEl2UKjgkl5unFukTHfDMEviXWtKyYjQR68fDi0QrTwHP/EePBbo5
	 QRuiPYCjqS48On9dHoMt4RwBk+c216t3PffQgSQzolGBc45Or0Zq2m+xKdAt7Z8TZjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDsa4LgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFE26072651
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFE26072651
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDsa4LgU
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b308fca7c3so16627267b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794302290; cv=none;
        d=google.com; s=arc-20260327;
        b=lZAU8PO26VM5iZ9BevJ8TZ/ACs+SvvBcCjDEZfB7+M0zJbVix4G2CConZsqg3rutrX
         zKUr/Ve75mPMTRIkK6Sn3EOi5+B7QlH6s+AappkTu6OFsEnBf4z84Rv1EnQklB7nirRv
         K7hlOa9v1aaevJm36rBSLngydchZQlH/wqgE1M61GhZozJjdLpLgjXH2x818FT9b0sBi
         xH9wvHncGTCvdalmvizwKejXaK+56xZ3YfsToOHPRI1c+DPw1Jh8JhDK074pqfOj2aDK
         jcAt5ApRcLARN9DCZlQp8YzMxBJ1jNojITI5UgmObHQxNEiHswlv7ZsUSInSn43muz7m
         Wmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
        fh=RPlkE5OWcxk3vUTwqMo9nroCi8hXg7VLcMSQfxu28uo=;
        b=RUeO2YstkiNsBDGN0X49n02cmCtm0BF/6ZohL0HHdqhhqmc1tINZP77HZbIelNT+Lo
         6tFLe/FT0a7rdUBG6GWPRRsx3si+O8Kk9mgVYZ5ZG0fIx+R+CWVfHDNyzDbrNuVadKD8
         D7Lgec9zObZPCyKksOYPxjqihmhGkbsvMqlVI3/eQBE4VCCrTWFe1RH8pVoKxv64jxuo
         ntyma7g+H7Ga4Vw/T3e7lKlU407DYHKG4eP3sQsRXGxp4i+Ae0SmxyHQgyketXzRHWVX
         um469d9c7MLTQbrUQwUHrn/Ee5lnn3K8w9VCk1rsSOfV0arMx35VG4lq9yO33CASoKUv
         8Wgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794302290; x=1794907090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
        b=YDsa4LgUv5n0lWCUEIfmMCWjIYt6ygKSrwZsVZ+QjGAEdhc8q2QeEvjCPA1Z/6u537
         WkjwNa1Il5/wGDPX9MiFyr1CTUOScTcunw8/VFBx6wd+llOK8aFQ2hvAUZiWBy8FRwZ0
         KK0usChUNLfDYp9sawBKytdDycg+VjkVsbOP5trDabilCoYB19+bsEUTnoxz8N1EWRI0
         bYEQWMG85TSLNUn5jHqYijJLZ32w/k6K4rTsT9Z9kQ198Zoh3osjWgWPrckZQ64E/Pz7
         vR5bIY15GRLc0p6zrmq7/EcJvsWvE0ZcUSq0erbvi7xitWc9w0qNYrSonBI9pW0dQCGV
         n1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302290; x=1794907090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
        b=ORix5GsSWChw/7D0gFal4XgCQQBtrYkL6Dw3jDF8Fz9owzvcez/Iw1E8VqZUqEk93A
         b+UIUYxXbL0Okmz4jZBPrbmftHpvHlOrIjb8g+l6eYo4i8s1LRJUQxjtrJopOyYca0R2
         aHuAAcWKx+HE0pasIUBCeqAgB7ZzDo9PRFd7Rr77YWrt3LDg0gVB+cpwyQiH6ZNPP3XJ
         AwuuUafqsTOLGRnN4paGDNqt168aVT8EGUXIJdgYrJHc6DrrA5fryf8RitthK8ca3L7B
         bn+u2tHWfopSscvj59EnPzu7fT8vFa+oECJf2I8DIVR5ok/NAnGoYQRQggzSND4CjyXe
         gKFg==
X-Forwarded-Encrypted: i=1; AL+hErFYK7Hgv2OxO0twaSCanifkJuX7CuQVe/Eca/7fvO4F2a6Iw/gqvqnRfEPsPr5wqX739Lj/vCabApjEJJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HwmDteq1gNYWuqkthWaeizeMKrh8AsKDu5BdOCwWIWSkUc9+U
	U9ijfYTNKlwbLgIz34zRGxwVvb+primOOJ5f1HRNkKz503CSIK8RBArFAbpWe0VWlpxzqcSt/Lz
	tll/Dkfdo+jge01X6+XTikDk65RnRgsQ=
X-Gm-Gg: AYBFou1XTv+I9gcx1FYrsFx2XSbeiRA2LGt1y/8en5VYamEAP4bMJs+osMi3SsAY5NZ
	SzXx7G8Iah/CYubU1cWV7iDtViMfbb05fj7w9XmVi74OBbLIkvmR2D82SQ+/FJcum8ETO6Ofkvx
	XFsQx+eU3cB8UadLAezVAC0/IxKdNc70id1DuoiqdXYAnQH4rPgdDownl8wxfrALf6dliBlBZlI
	8BTwtyzTlH0kvj+q7j/v2n0MxMSA4426AEtjIL25/JTo5GUL1dSFNPIpaDV16fNwp5dbbPXeb06
	SpmyOv6lAvFsby8uUidwW1JJpCr5rO5fkJ+iGDOcJMi/Ogtiek4KYAbU9aZsOcuwvcOjdbaYdYV
	Zo5Zr5xekwKSTYk55beNT6/8KM08VAXt0jHCIfTM46SK5aOyTBJi1gMrQcDcQBjCpeFsWCIxLCR
	wuJUDiOUwuo5MXXLv1TGTgzeMPqPcmubNKOP5R8OwfcuNfhmZzZ1RLl/3Avvr/DtNH9i6XI/p6y
	Nca/kuKVSNwqvuuzU0PthhrTjg6kl8FDyeUhirZbzd0rw+zug3npk4pfTIJKg==
X-Received: by 2002:a05:690c:c6d1:b0:8b3:3f54:353b with SMTP id
 00721157ae682-8b392a5fd86mr10563747b3.23.1794302290725; Tue, 10 Nov 2026
 01:18:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
 <kyqnjm57yrercvg5raacrxwt46p2fig6leeeywipv66c3iqzlg@tdh5swet65jb>
In-Reply-To: <kyqnjm57yrercvg5raacrxwt46p2fig6leeeywipv66c3iqzlg@tdh5swet65jb>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:17:34 +0200
X-Gm-Features: AclHuK_tfRAddWryhIu2itwZTuCw6dMSKtHbGDbuVRDpd2s9leUebZVLl6Fly40
Message-ID: <CAHp75VcO0tFShCN5n+7WXQwM9ZBAUS7-0G+SQL3LW_tbObKtpQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sodaville: fix use-after-free bug when registering
 the irqchip
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Thu, Nov 05, 2026 at 02:14:27PM +0100, Bartosz Golaszewski wrote:
> > In sdv_register_irqsupport(), if irq_domain_create_legacy() fails durin=
g
> > device probing, a generic IRQ chip is left registered in the global gc_=
list
> > while its underlying memory is freed, leading to a use-after-free. Use
> > the managed variant of irq_setup_generic_chip() to ensure that the chip
> > gets unregistered before the memory it uses is freed.
> >
>
> Andy, will you queue this or should I take it for this week's PR with
> fixes?

Feel free to take it, I won't think of any conflicts in this area in
the future with this driver.

--=20
With Best Regards,
Andy Shevchenko
