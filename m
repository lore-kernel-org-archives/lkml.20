Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F5314D13
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760194; cv=none; b=bPuwdGKjg7DHUqFMGvhAG64+AHueNPveMFa8p26mUHoZmL1sQ8zY1yU4MJ8rAizwAytZdOW7/dWCybAD6hNZlN1MFBdX51j98jX0QKazf9/3U9fmIwEHUKAZuBbLDiYeNYW25G0iZYtveljCQUPFemWPAMVYBaO9s1IXMGjIiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760194; c=relaxed/simple;
	bh=OI2qtOXkXTpVfrTt4jE2WEiogZBqxw7skT5ULL1+Sg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dm0rDmIeJsyl+pdd6Flxe7PRYi/p8XnkrGQQK+1G4wqvvKOaB+00Smou2yguq4UIWLde47tyL3noHKpctLvSaGfF94/i+kpcNpows56PuGp/l6/J4X52Rl4nyYefFlbBsza0mEV1kYoLd7wjcrl83OS4UJtK4OKhAFzU6pI9r5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DV3JsA4P; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DV3JsA4P"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afb0d2a586so2394484a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791760191; x=1792364991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D/A8uEb8nUCFEF/mlNdjq5Y0ukVA9UW8HGX+L40fXt8=;
        b=DV3JsA4P/tVFBRTEYwfIjZ/1rCo8HcKhFwgBL6BCWuvP1KeijM0ebi/uYG1XlKpu1T
         D78WMSEMDgAvHX60Vep/XH/+K4x/atyYrxaLMCRGjd9SQrcXRIfLJk5xs8DvdLXN11bn
         cK5J+BD/DHn2mrGObyIzcTvMCc9dlcGB2+XNoLXEW0Bi7LiwbujJh4dCINXW89u78Rm3
         5inQPmJVroBIo0wWXW0oQQB3kI4vsCunRGqRqRVDSSOkiIgZ9g66GdwOKfMMh6nGGgrg
         LEwPtml90GAlBma2Che34UeSM82Zj7cWBkEkQVVQ35WGT/v+iaiwsFurh0ETWG0GL2BM
         4l+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760191; x=1792364991;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/A8uEb8nUCFEF/mlNdjq5Y0ukVA9UW8HGX+L40fXt8=;
        b=MOzp/QRG+hQ/d83D6s1gwCgZezpXPLg7lLcfwjbpmEXN3sMWMnAy2S/lWF0dCc9p/w
         sBEQb5EcZWc6Z/bTEXxHk47lMN0Tsjp8vxngtXPXiwD52cZ4ime6VhU0Dnw78yMljnbZ
         1HmMvk0/2pfbAuq9oPsU2HI3QPV7PTtBhARsiK/I2rMQMSorL8CEEA28cZ/4BMFWaWqy
         Gmd8pXBpjvMgQB/S1zZ2tKzfoLhnylB4KzThR/JYaWRDbU9g8vtIElDklYwIjRgd2CPv
         LZ13J1ESQEaPbwXM9EVVLI9qbrfb4iIkl3Nkiu1JvA4aIzAaW6fWFvTCe6YsgglAYB3K
         z3PA==
X-Forwarded-Encrypted: i=1; AKwUvByre1sAvhqgTEDSC5uagOcQSvu9018R759wCxz8T5bm7uvIOCecpsS49eY9xa6G5v+nO1FXezWjS1xwX5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYINzsIVEGID54UioFH8CF/xmHh6iOdOkrYtFxnxmV32dZVnpWVn
	YMi3vADfT/1lT7snsfLkm2hxOKcRx7DcvhYOhTjN6YK7ku5DkSTgBhOV
X-Gm-Gg: AYBFou1NF3hu2oV0ZfjuvHP8FmaVmcTkNqxIw+c3CcADwG67S+aZlPieudqG6vnJXXw
	EMFfr2SLwii4MKmYyfGpVKlIR1Gu9yVDawfovyMjg1TrvJWA3hAI41/uLQxicXmtJMshoJHLVjJ
	TqDnQhNhvlczUZhwWss6L+qhzvO1vqIqmufvIKNUiUAspgJnX5z1NNPet/am9Nx4nAw1B1/dPpL
	RQh8S4urZfN05mclHvl20AXqWoSF+5mwL3DZjo/ZzjCzYWwqvqTsmqJHskuucm6EttgECpO0g4t
	qf8vFzX/VtmRDSrwZ9S0M3SGYvJaXiV2dRCQHl6zShaVYdlcnIHHgMj//J6JQ+xBGW8evIwQRre
	whDJ7EWMCw1Fm0El4UhttrD/0xGmdEzT7Ca/HeBqxZ1qGNtGMYdvwli2MhIpZuo7T8OKtwXGzIY
	Vo3q5JR4UspzQN7BBx5r+oPkFXgakINGDseBHXXiAd/gt4G6gjgG6LSjv6mPCaVxLuKJWkbkm3k
	7Q4ohXoHsPe7Q8SMVCRv1gYXg==
X-Received: by 2002:a05:6402:f0c:b0:6b1:b169:68e4 with SMTP id 4fb4d7f45d1cf-6b1b1696a8fmr1347413a12.6.1791760190760;
        Sun, 11 Oct 2026 16:09:50 -0700 (PDT)
Received: from erwin (109241130011.warszawa.vectranet.pl. [109.241.130.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1ce47f8acsm103843a12.24.2026.10.11.16.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:09:50 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C5=82_Nazarewicz?= <mnazarewicz@gmail.com>
From: =?utf-8?Q?Micha=C5=82?= Nazarewicz <mina86@mina86.com>
To: Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH] tools: usb: ffs-test: return the number of bytes
 written in pipe mode
In-Reply-To: <20261011223445.2328181-2-sashal@kernel.org>
References: <20261011223445.2328181-2-sashal@kernel.org>
Date: Mon, 12 Oct 2026 01:09:49 +0200
Message-ID: <4gx4597m0jk9a4i7wix1ip4b@mina86.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11 2026, Sasha Levin wrote:
> empty_out_buf() returns len, which the PAT_PIPE case never sets:
>
>   ffs-test.c:551:7: warning: variable 'len' is used uninitialized wheneve=
r switch case is taken [-Wsometimes-uninitialized]
>
> Nothing sets pattern to PAT_PIPE, so the case is never reached and only
> the warning is visible. Return nbytes once the buffer has been written
> and flushed, and -1 if either fails.
>
> Fixes: 93f2aa4ddd25c ("USB: ffs-test: FunctionFS testing program")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Micha=C5=82 Nazarewicz <mina86@mina86.com>

> ---
>  tools/usb/ffs-test.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
> index f08060459b3f1..283db8979d67a 100644
> --- a/tools/usb/ffs-test.c
> +++ b/tools/usb/ffs-test.c
> @@ -528,7 +528,6 @@ empty_out_buf(struct thread *ignore, const void *buf,=
 size_t nbytes)
>  {
>  	const __u8 *p;
>  	__u8 expected;
> -	ssize_t ret;
>  	size_t len;
>=20=20
>  	(void)ignore;
> @@ -550,9 +549,9 @@ empty_out_buf(struct thread *ignore, const void *buf,=
 size_t nbytes)
>  		break;
>=20=20
>  	case PAT_PIPE:
> -		ret =3D fwrite(buf, nbytes, 1, stdout);
> -		if (ret > 0)
> -			fflush(stdout);
> +		if (fwrite(buf, nbytes, 1, stdout) !=3D 1 || fflush(stdout))
> +			return -1;
> +		len =3D nbytes;
>  		break;
>=20=20
>  invalid:

--=20
Best regards
=E3=83=9F=E3=83=8F=E3=82=A6 =E2=80=9C=F0=9D=93=B6=F0=9D=93=B2=F0=9D=93=B7=
=F0=9D=93=AA86=E2=80=9D =E3=83=8A=E3=82=B6=E3=83=AC=E3=83=B4=E3=82=A3=E3=83=
=84
=C2=ABIf at first you don=E2=80=99t succeed, give up skydiving=C2=BB
