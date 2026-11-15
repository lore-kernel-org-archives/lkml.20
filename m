Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794741103;
	b=JVs7AE7V9qKCx5n/CZ9jzCHvGPT3xhDtf1ZmKZ0qbFm53Ew3AzRjh0+gGvDvwurlOZKX
	 ueoHSJaoYBNdux/X36oIDswtBzEmnQS09LvKK2DlJBedI1CTBFGSmOpN5dcf2Ss13KWBi
	 5pAyNjpx2k3P0yqVfcVb6/Ah0UwkT7TXPGIVa4A8B4v9u1cDkjbjXxcannPf6KjKNTpfT
	 6B0dsvC3n7xzxaO/ZA3d9r4GeFnaUKRLMJN6vNVQzRnunFqNsUgIS7PYM1pcy2/TLeWpO
	 OeQ/neNzlHoW+9GVs27+XtGoE0Vx8gumvpgqkXRrQLtoiQ+kjuH0OKTEd58Pfd7W5Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=niupttma8X2M6tpT9/+fkvKpJUleDbchTCyz/6AChGU=;
	b=GgfThGd0KWD1jQUojjOXbblc47haOtXpmQPE0KTIvwZxvwAvZByr3meq8ELcp3qeb3eJ
	 G6155iB+oWHr2MYJ22G6vurkBNW6f0ksMdcoxxO2kgNOsC8XrftcymZfAQyP/wuSNQRUs
	 Px6Gp8J71hH5kltFEHWywpxQc6j8JMxg385/IEmCvLAD48lclAEwC0WZWOiKfJgk8Tyzg
	 LS8WcgUeWc5fCjDW8r5xkha0NBLPbFy9Qxu44koYvy5opwK6gSv85aQJmT5K16t5VC0Kf
	 umILGpb/1ee/+FPwQj5u48z2TytShRsMjq/Xpgu3oLw7fwv3oIMqWEHxLw6w8ohXCqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=of3jASAY;
	arc=fail smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C664606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C664606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=of3jASAY
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-7190d9bdb2cso2320478eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794741102; cv=none;
        d=google.com; s=arc-20260327;
        b=rMLbkfNbOumS5BD5b8YosRvlCAXDdWv24PncjELgx3DX8Vl6HsDkWCrDxSM3Ygl/Dn
         Q6CmD5tFBGhrF4Ey1Rp5p5IYW5z4CXAzCcsohmk/cvzX97mwYWYe6t4D36RBvvrHYXQR
         qcaRf6nLem+R5Ap6I/jJ1Em4uYtyhFJ8EyiO/8xnkVexOzA8od3gpRvx4TtsCcEoqY/K
         MugELyyhsbmPtF9CCFcazqBuwr1ZlpZeUjlfgT+/Y3jCe8wvGWMblYrh8fSYjLG/m4Fn
         /c9MIGATmVs0d3eNZiaf5pzz5DCKltn8td1IRDLRZ4UnhZU/nvCRGqW5hHTVPFqNWzXj
         E5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niupttma8X2M6tpT9/+fkvKpJUleDbchTCyz/6AChGU=;
        fh=LZjsKln2kDlTifJNxtUZg6OnIj1oFMQqyCNKTDNL8ug=;
        b=STvmlxfXQlhxMtEhXMk4fZxWmAeOe0urg2r7LtSXDRM4lkRyMo6y2nHJ6q1ThCC4B7
         kqu10f/o1xxzvEvKkG8jjYRw0nqX6hLsNuLG2oGozNDfx2dTOldrHEPGbkJyzW62T208
         kq5ffiScv6mFgqR40WxZkx4wsEi/FLXs+3QmjLEOzTYlduOAX+F4CLHUzm48zONCyvsW
         U9FPpP2cy7QY+EBunej7WOz6uKNWKRXhyGYmNhPvdUw1/lg4Ih9uqU9dYVYqQvFPTtkw
         tp4EyLRlviGaRpFdls2S+gEWag9SVwdQnHeZqWUCGf5vYH9vkUkowg+cekukJ5OuH1Z0
         f0MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794741102; x=1795345902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niupttma8X2M6tpT9/+fkvKpJUleDbchTCyz/6AChGU=;
        b=of3jASAY2uRq/jJWJtu/J+egIQO1aiAxkyVYlqd8JDWFDtFgfEM/Ma9B8dkH712nlU
         FwU+6/jbKtlEGp+Te4LjsNsdHikC39GeG4Nl9n3ilFv24t3C8VTdUA9jVreMg2jF0crV
         etX6Qs1vrc1s6u9lg9S4EZP4HwAE5e4ybxFh+06r4L2XrA/e/pqm9QUnr0HVjdj0toYX
         0UeYI6CwkDYj95zh0ysL4i2peIRMgecP+5lvvpTKeZB7JzWwfBKpl+Pws08y8ZmK7NJA
         pOvfunaaFGTpvE2TjiFqAnvKDCOaHNvdi6lYP8Qu5gY/UTUJdyhnNjwXvZDIXDHxCzfj
         nbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794741102; x=1795345902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niupttma8X2M6tpT9/+fkvKpJUleDbchTCyz/6AChGU=;
        b=WZAtfrrY4xm0qa0XD/gFWxW+XQMHPqSHez65Clc3PjQSmrNkqJ9ohRCdMqgbHYhPZo
         8c8FKgkBmdoifh9AOiK10DVujDCe67pXgalPEQK92VspXIAe9SL6p/sZy2x1EtmwsPYC
         k6YjOqapilRZRIklE1ZbTHMDIztMHa/510MLlD1fxRZoJaV1uq96XFfvGa7mHTnxLYEZ
         NXulhQTTy0v1LQlxBeFikp1AiKCDVqAD+017V1YuAm73WDfuz3RowsbgxFOrMn4x57er
         xBe98GS697klswZ0oArETr2Wd590fV3XFz2u8Fg+xD55z6FROEcAzDZtXKPmxT3F769h
         ctrQ==
X-Forwarded-Encrypted: i=1; AL+hErE0K9Xj1JYjz4pJVMdupbXhorPG1wgwUvw9rTF35WW71oI3be5GXYWrtnpUYwdFAp+BcMzAT1FOGwj7VRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H9ym1MDP+wyJkkOmQwVmXo4yKUlB+XhlzR11mS4ZzrNsxUf0g
	2gywx5YFO+FATheOprwAZ1l6OubQVZw4GdV3Dd+PE2LPBmrsnt7wyXMU/ASMPlyZCwDQeN208Dz
	oaYBVrfZaqAUin+9bHEmXCJaNr+g3YbI=
X-Gm-Gg: AYBFou1oSEvEGirgwzhW2oeOo4/v4jpbtxycCMazxZXopmUC/ZzzjpDrCStSVZ+kQ+g
	R3IMLQcg3myVPj7171iaPbLVpkdLNYQPeLKX99aVtEHKCA1eV3GXproa5UpDZ4qMhrSXDYwVi6v
	rOpAguK3V5BbSldqDolDYVA0v4Jw4iuyjT6bQbTJMaFZLSJ+Ma8I2zZXn7Rgpdse8aGvKW3WSHp
	S6Dp/IgYtDVXcomH6zKknDoA2q+IplEgt2kjJWtWJD4bkjZcwiuu+ipS7MRf3+E5ooGAAO3wwRi
	Jv3mwXa85znMjjiigcdBQ5jlIxPhVmtuOwMpeWg3oT0SN/wrUhxhwkRvrqRw+UXbVE6FI8CVl/y
	7EtEkZDhvXHwutUbfFbuQsi5gOIGRpvNB5jzXHZdXCUur/XYrA+3bz0LYOxemDBqtrAVOPeGX3h
	FjMUNtyxe8yGuswP3Sf6gfwsf9wa4PDLaECTFmrDBkTACjpLw+y4N/8RlyNQ==
X-Received: by 2002:a05:6820:4189:b0:716:d376:1676 with SMTP id
 006d021491bc7-71ab523f56fmr4513622eaf.87.1794741102408; Sun, 15 Nov 2026
 03:11:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115003352168cE_tyVxSyZV124AM31htL@zte.com.cn>
In-Reply-To: <20261115003352168cE_tyVxSyZV124AM31htL@zte.com.cn>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 15 Nov 2026 05:11:30 -0600
X-Gm-Features: AclHuK-yfkBjfTlRzPqncy1or8kBWwirdyvLakJdI7oKdEpo6iQh6u-uxa2CP6A
Message-ID: <CACVXFVM_nfkBVnVr8oEVjjTOYp7mhox7KvhkME30QBc52b-yxQ@mail.gmail.com>
Subject: Re: [PATCH] ublk: dispatch the next fetch after a batch failure
To: shao.mingyin@zte.com.cn
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:33=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> When a batch fetch fails, for example because its provided-buffer group
> is empty, ublk_batch_dispatch() removes the failed fetch and returns.
> Pending I/O tags stay in evts_fifo even if another fetch with usable
> buffers is already queued. With no new I/O or fetch submission to select
> it, that fetch and the outstanding block requests cannot make progress.
>
> Claim the next queued fetch under evts_lock before completing and freeing
> the failed one, then schedule its dispatch in the proper task context.
> Marking it active before dropping the lock also prevents cancellation
> from taking it before its task work is queued.
>
> Fixes: a4d883755399 ("ublk: add UBLK_U_IO_FETCH_IO_CMDS for batch I/O pro=
cessing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
