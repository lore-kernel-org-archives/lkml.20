Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCA4F6480
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781981; cv=pass; b=F+8BRF8RvnPl1X8BsdomPKCSqKh4z4H56bAvvG3Jl9q+uL24iH2+kCbVOHleAaooLZNWkBx1aTXZZJipmbKnxydI3gJQPzCSJ3DjjATWpVIhxQlEeccexT9UVyjMCEEw7wg/5YmqB5MB8BWqyUk4+RvBLkwvTYaa+lYsG78wwxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781981; c=relaxed/simple;
	bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lV+nmOKd0LslmbO5xtFDEi3RIZe/l5PglfVv9T5DxVIzTilyDHXFQFHkt0gcd8xSeBzXBfw1DsgktrT5tB65pWzSiMcnPcbsAWVIeTId2+tGm07QyOimNV1XUyNxGSzudJUvtn6UISaSqaCsCkK59zX+x2nkYbF6thAtRQ7rjmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2l7/XlY; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2l7/XlY"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso784761eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790781970; cv=none;
        d=google.com; s=arc-20260327;
        b=kyeG3S2sQ/t1PE70684u4dzr7L7koiI1g016AohS9YhOGRKHr/oPUlfEWzLXq1Pnh3
         eACTxgyk9Rh2LFnDos99LKAKmDRATlE71Oa4XMcAPiGnZU4pGx0rPugwMcagJUWJHZT4
         5TZOhfa41cd3R8akGQ0ImUXTbl7wHbxZeIT0eVNcE1WiudwRSXjkbiBEdp/RY7ACw4Gs
         Tuuvy5JYyWZu+ZDdqrC09drV4VEYGVOTsr9IASSuXNI/48J3TV6sqPF8yh3M2RBYNHVf
         pMwQ3TI1WnGn50VwRAwfAAm19SJe0j0wSd5jJD8KroGvLQ9zyAk0QfFrMvCGhrNl0D0l
         +P5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        fh=6lrghLCBVqUEGkTVj+EvW7p6rVPqFxEgw+H7kz4FUbE=;
        b=qEtSKlVKVBxIPRnoHI5b9N+DsVz5sgGRhuOgFZhYSN/OnLf2vm4E0rx8BL2kkkqEhF
         DsOLlbtJcFDTo+VU5fpEIbXh7UMGyWCH7aNb5aY05DQ3ghcL7WJs55wDKXQb2wNWZuVO
         +Lxsna8gILD64JyOvA9/5cxFR7lRTZYYndutKFOGfmxifQvvFIWZQOXFec0MWEVyqm7/
         u6g9/qJAZQPAywfvACJkzjFcqFi93BJBsRzKLAnRmbCWQOTde2YXShkpccjF/2aRnWrj
         iVIdHpYoymVbYKopnEhiajBgX+Vadh1V9N6DSZbrbN7JfaJnyWLcAtQPtiCZHWRM1J9Q
         DStw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781970; x=1791386770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=G2l7/XlY3zQ6NT95T4GJIABV70dQH3YXfhm4enxJMeipuwl+3j1XoUkEd8u8oHldOK
         esuecKKwebCbmzlTH9xuDG4FzzeSEAX58acn2Sv6Miqp0XhSDE5nU4vxFdfpDOVZZFRc
         LwN+K2QUSnmzMioeswr6m+PTzU01zYe1ikW/ZbHMWFZtlbNdvpl5a0gl37FJqtb0bRX9
         5g52nlVMtKtu4x6GY2+fQcJiHz85/rlk573rk9oNCNmlG4aPmR/XFdDVLgpw6NBLOK6Y
         5SGhhvCUzM97hK80rknNUoW6UjGSqbJUARHn8XvaFHmRFork3u6xX2D8znP/ZC8nJfjg
         9CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781970; x=1791386770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=gUI0HJSEhulW1crdRgDvEnLIm8nZaS6s11JOPZZk92BGkEK8ILJuXUjPNOUQ0jxiIy
         vQKOs5inxkCaD26ApjTgzbbdhDudp7DWb0EJxlhvn7g2wPGIegGX4KAXGW8VG9US3RZP
         +fQZ8rL2pIWx/O+HA6mrOXDzQOl+IyXjdokH6eAVeF/fL1jOc++IIp+YVLS9ciqnhorA
         rn1+uczPqKvBDHHxuLdHU8SJuBNJyO78O4RvGPAOVVv1YYnc0jFBUF0N0Xc/341nsdMU
         wAjvQuaOviY/QnUtD+u38o9QEM/DTJcU3AW3ZXVBSKsW7BlJQiLgE61R4CKKBsVclT0r
         9uhg==
X-Forwarded-Encrypted: i=1; AKwUvBzAFU6G5BYUIaDH8Z53m5tDpRUrJW5Zenu7Hg0fJVl+Ir9fTOqUwgy1IdVwLjpgOupyCRrhPCPg5Gq9q0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq6R23IneQ4a/17jtqbv2DoKxuAT4rfV0uJOq87EweEf4GuEVz
	MrUw6eRGPPAehKcKhD75+2Z7KNgB7JP0ebw/G2oEKQQUcKKDliFpiNjP9+PBddGnh2sUVEIhvEl
	KAGLSm6oQsqfnvVxiXpR1QMzNF0pfjOs=
X-Gm-Gg: AYBFou10EIgkIpXIDkfor0cu8fbCC+W92791qDUBO9HfW5Ynqwvx9Iy/yQrSaoJ10h9
	MpGPja3F8ixC/8dzvsvXWtUPagU79Bpel3OmJKTMhGjRVV0cGa6zyuVGHZE9tRIIL2qNlGrmoWO
	YGqr1dPGLqvlt7p85pWbp/D9CU/v9g5vVJz7HBvrHN7tTrVYn/Tn3WIgLwNBzXRMDz9aedeaRAt
	RVfir4LB0x61IZGjpSmMjvfbWNz4/11cvUU0Q1czQlfzdLOTZP/lM/EQTA44KNRkyE7JcDlyrso
	pxlJhHtUog5+KqPxJB1+mTVWV/Grx+Ru/kXdK0QxI2r7z938DCi0yZlWRm2+/N+AR5GeXEqUrYw
	6jHQIZyI1RXF5zX8ZHZDUJGWZcMD4ZW5w8CcU2RzmAxk1bgkJt6mHEDXVgmMjc8egS0di94LWKy
	qpc9bgkj2x1xpuZOcYbVbMfJ+nt01WKNkXKt2pRkItbysV2OWU9tw=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr3012710eec.0.1790781969755; Wed, 30 Sep 2026
 08:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rust-block-for-v7-4-rc1-b4-v1-0-642a4c1aebd7@kernel.org>
 <179068244058.1205226.1765319338142659278.b4-ty@b4> <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
In-Reply-To: <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 17:25:56 +0200
X-Gm-Features: AclHuK_OBw9tG-s9O8MtvXyTH10ESbf_7IiKq4RprYC7l6RRjV0_TwsAnU0VqBg
Message-ID: <CANiq72nFiT0EoL8Z9iPT3xcPWynofUAs4F2gb6-NWmUQmtBHPw@mail.gmail.com>
Subject: Re: [GIT PULL PATCH 0/9] Rust changes for v7.4-rc1
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jens Axboe <axboe@kernel.dk>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>, stable@vger.kernel.org, 
	Priya Bala Govindasamy <pgovind2@uci.edu>, Dylan Zueck <dzueck@uci.edu>, Yuan Tan <ytan089@ucr.edu>, 
	Sophon Z <aiqubits@hotmail.com>, Qingxiao Xu <qingxiao@tamu.edu>, 
	Malte Wechter <maltewechter@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:07=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> This series showed up in next today and broke the build for me on
> various Fedora releases for aarch64 and x86_64; reverting this series
> fixed that from a quick build test limited to drivers/block/rnull/
>
> The full error msg is quote long, find the top of it below. Full log:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-rawhide-aarch64/11055137-next-next-all/builder-live.log.gz

Confirmed, I see it e.g. in my arm32 build.

Cheers,
Miguel
