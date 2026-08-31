Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1753DCDA4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169856; cv=pass; b=WDsYyCjUDj00FEOiYhsVcLHjej3fL8Qt7pf9UTwvKHZyr8ol/uNNthMqs2MvIVwH7XHrg4FTkMdWoADY9aXa4wKAuTLGIvuyf4+FoW4EtYKswzM8ZwJRb0rk8m1UGgOilIN91t8yJyi+ok1dUV/tRRd74kCYc26sjDpStd/oFXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169856; c=relaxed/simple;
	bh=RbuKONLY0/S+AJmxjQgwpW5xe4SNlSbwc6Tzv4DTTPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ji5hOknhEad8TJleICWerYOaUGxNz41+OO/DvWUir16xZJjPso/+7yg6ulHHpM1tLIWTQalZyNgv4EqcQaiM9cP5X5lnxkBc/xCBtMan0NdJCE+iRIiqBaJs5lijdWM1cUeoKe0FT4UikzYvwzdjU0y5bCWC3eGcMdj9C6AVYDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU2Z1aF5; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU2Z1aF5"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedaf975a3so626744a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788169849; cv=none;
        d=google.com; s=arc-20260327;
        b=bfa5qIAnNUONU7pKqmR55Nx5LFD/2z8mBDN7mdYMbMBl9dTcAeR2j1NOwOF+EaFpek
         QizU3Q58M5T4nl8679Xy587/3Iexa5lLr7SmkF5mC/RYPmK64Pf78HvxUNs20kCyv4lF
         EBGmeu4QQzlOwmnuCb8BFuSdq+Un7Zeu6mIJYc1s1aCNND2h1+nVPIE4Z5zo0DPK3145
         TKxIPjpe5mGm7+UgoiB15r2APPYPVdsu0wp715H7ondtGflZe7xsdfuQHlaRf1RVD88P
         dNukgJx8BUWYa8yF35CDk+THlnaEcz2RaapM5EiqMYSN27+Frd3md+wp7DmGN958RzX1
         v6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoMofcxx656wkcjtt08BKv2Pi44P6R9nDoS9NYe5W5M=;
        fh=7P+bHR3QHgQmQL/KAsTeKKtgV5QXJn9ZVJJec1J2ZKc=;
        b=GP2Kdf19T9tbJpAdsJ2fpb7bgXP8rmR92JrGGyK0186gEEfLSnxWDP3K6xK+44zRwf
         4UxoxqVhHQzaPgzgJSeiH90NTG5+vpM31cM207kyohQTEe24K51roqhvCVrddzVepi5J
         9QMtkmtxh+jWCT9zb9VYfareXPmkTQzJOp2Ta59yTef921VGMQ1nj6f/ULwgKdB9Fek/
         mZDjGdv09DEj/9H98EA8/tyDHTSq05bJoEZSWKGoakIBNqUwzB6sU0ospKKwrt0l5UMu
         k0V/bQFeurgV49wx5BTTuMWTujwOgWgexS8by0q0+u8JdydkwrO5FaW9m82BwTSOprto
         ZbUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169849; x=1788774649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoMofcxx656wkcjtt08BKv2Pi44P6R9nDoS9NYe5W5M=;
        b=NU2Z1aF5O2lfgwnc45eA/Drx5frvK5AQLzWrlmtFEvAvAyWjXiRVpHAeRZu/hWJiNy
         RMu+JqR13htB0X/e9aLNdMO9U1+8vwV24lZL9bx4At8zi2C3s3AGJ85ZuqQ4/9k3Y+Qb
         sXZRAWBX95JFFl46wQOkj1noKhBKomvfV5cpH3HIz4gUjS/n1YWI5J6Ww+UwgxT+8RFk
         lOB65F0iVVdf4e7YzbZIgnu5w4Ri9sYUUl8COaEfhpA9DEW/kZRE7KvGR8ve0gLNgA0+
         I/sw45EQZDZvV7bKHDvq7MRXzaLMj4GkK2SkvR6U0bk8B+obd0j0RFEwk99TvCRUsaE0
         pbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169849; x=1788774649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoMofcxx656wkcjtt08BKv2Pi44P6R9nDoS9NYe5W5M=;
        b=kuInXPGQF2hG7yj4mycpLCcoN/MyRu0wpJ3t26dHs/Q4DULZezsiNW4hcnsvQSwR1U
         CFHk2Tu3RxTIRfY3raCfuAZfc7a3OLKDknvTWXz3SbfIXIq8RV9XsH8OUPDyuX/y6Bbh
         XIRpkcp0/M+ycXPtkhz13Ye5TVAAimU770gn6rT+aeT8sBATLxvknYWM/xGVFeqDaJpy
         mnUzfvSWDWG+iDlBbn4qZt4srUNFbWRoj5BShUE9wVYt49mx5quu8LiWIkAsHoVHSf2M
         yhVRhF5iQnTnLwKz5l+A4CRHylkE7RpUP51pATa9XdI9W2HqUGdemZOPJeXmXETo5LRT
         Dnew==
X-Forwarded-Encrypted: i=1; AKwUvBw8N4PHGSdbcmQDdDvN3k71dX9DAHeX6FZynC0PXyTsB2l+xHuOesVNgEXanZj4p+CZ3oyDn2on8xBx3Z8=@vger.kernel.org
X-Gm-Message-State: AFuF++ld3xb8nEDMdBE6PFCY9G/3jkNEGSHfvtnxFA3BYr5vCv5rPFfc
	YP/HKTkAgPO9olwhbqd12rP6VhKokhDoB/La1AYqOHxoWvO3Wxy3Ogp74TlWJdZR4jISosvHFMX
	aPUTw0EsrwiSai8lyObM19u9l++i4/FQ=
X-Gm-Gg: AYBFou1fw2Bwc0Dk8MPmY34NENezevbZuXgYtNWOUBuV/Y9Aw15cVaUsoIBTZReQuQ4
	fLmvTA9ZBK2OjN9eLOS/0JERKOHiieZ5LaESCGxvRfWOd2HWH/bCdpbYgO6sAArTaaUZEL4oCQf
	6tjhudbW2p+eNu+eWXoNXp9P+bIyinz4e0orKg3Xesp/38HOZVybXd96s2BrktGW0+HKZUhlLt4
	kk3nCeWsqpPR0EXiPiUPcFX5I/LEr95/WdSfYP0RpiFyjViha94Kj2lA3RZ8yeyyeX45KZ44brQ
	yvcTLxHsan7KH9m2KZd0QiJnB5+b6eI1x+inMuRGAITmpsU/lZLUXuw8GG0Fuum563hn0AGl1CX
	Ohnr3I4q9j+VCTbi2O+rq6XlDU2PU8qF70yGTeGtWJYK6urGlO3o09Kbz/nra
X-Received: by 2002:a17:90b:4ad1:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-398bac28133mr11638970a91.4.1788169849364; Mon, 31 Aug 2026
 02:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-fix-pci-irq-vector-index-truncation-v3-1-a2103084d20e@hotmail.com>
In-Reply-To: <20260831-fix-pci-irq-vector-index-truncation-v3-1-a2103084d20e@hotmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 11:50:34 +0200
X-Gm-Features: AcwNN1ViyddrDBit2qWlifkamMcobcRAYSEK9R5OBBJcArZIlXo8eUmjUf62r78
Message-ID: <CANiq72=8JgETrNHmoy0gHxPmfipUmVGq14EhjkU6JWYFE+7xhg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: pci: reject out-of-bounds IRQ vector indices
To: aiqubits@hotmail.com
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:17=E2=80=AFAM Sophon Z via B4 Relay
<devnull+aiqubits.hotmail.com@kernel.org> wrote:
>
> Fixes: 2fb7755b0a7e ("rust: pci: resolve IRQ in index() and embed IrqRequ=
est in IrqVector")

The tag looks good, and there is no need for Cc: stable since this is
from yesterday's -rc1, so that is good.

Nit: we usually don't do newlines between tags.

> Signed-off-by: Sophon Z <aiqubits@hotmail.com>

Is this a known identity? Please see:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

> +        let index =3D u32::try_from(index).map_err(|_| EINVAL)?;

Do we need the `.map_err()`?

Thanks!

Cheers,
Miguel
