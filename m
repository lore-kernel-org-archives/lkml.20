Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCBD39AD3B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087087; cv=pass; b=bbCifalb0X9gW49baA22m2ncN7qJXvTobYLe8Vpyz+eiITc/IV2sn7gaLfQcjZYLzRK54VIFRnhe1HKb8IRF57b0XIEEWFqKjKFCtZaZWeJeCTf4Ni/pLbqIbyvlXQTa63KQUw8GFIDwv8YdyNdCzjamS69i5jvU4em2kRpD/rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087087; c=relaxed/simple;
	bh=aYeG3TvwCti6DUHhJVtNhHSU6TRfPUG21HK0z7VRJBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdJF5iuleuSVpT6yOGwuV0lmJJAAPu96j+qjeRlcW5fHe2/ApmvHeofU/kArDYneCv0mSntfJZnp3Eaa+l35tjBeYnM0l9+a8/iGN6K4TSpTtyNFw9RO8RKrou7vRsuPEmUO/MaPfYivAifMxH5ZN2XTHCpF8aH9cV4Buc0f9zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fh4RRbWx; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fh4RRbWx"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so2801915d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087085; cv=none;
        d=google.com; s=arc-20260327;
        b=OO2YV54m2p6rv6/RNkTkv8k8inlfJvrxLENr0qxuQh1u6N8V/qFGBXcM1ecIPx56gF
         GVuKBsHyrZrlYFzBIndaIgQmHVmSrMiVMsjOp4M/k2IAH2JkHceNE6fTYgGuFerM/41y
         eRLG84gZ+0W3OxFyAzO2Ex8Nt+TdgF5Sb0flX3DRZkcrahvaAShHEwxNWgjkPqRcc8fq
         pLU1lv152yr6/Dw+f/29NyJkP9Mz0TiHLUU7x4vTJnCs7vg0qUKJdbviPIcFBIj0lBT5
         P+xBUcEMSxYJ7ZOID+ujKV3xYcsXWD6W6eFBpzr37iKa7hC/4/AaCF2uCQZj6EJXPQ+I
         9cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pG5k92Op6QLpPwOb1OdXmxTCDLwjiDDGxMEx9C1NwdE=;
        fh=lUKkSHRpcigYoMYKw6eQ03VxyYJN2FsyO59BOAHnVaw=;
        b=Th8k3gXELlzhVN0WT893SBfcLjMcfOrmhYcdVLHGoiWzmueaPE0zFKmL75tuLdk2PO
         QEEucyFnNSQ+Dy8MnTgeM71bfYwAjmOj3f3oJFbO5nQDQ0kJlhiMkADADBkaYttFVXIG
         jetydS/BCKPUDMU1ptpa/lYYckNZ6PeTRdjkBMDLI/GQqSjtaMNtKyx2deHvk+YlRi0c
         KKrlvsK38i87UAcoHaqNHQU4E2qb1dA0IVQEEpIwtcCZdYocV3naQvXgCAWswoA2iops
         D3O4w7dEDVyK6CBAon/QrIg3rjjb6Tzx8/NkhkjSMT3XNCZqfRGTTd+R6oNpFyivVFar
         ErHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087085; x=1790691885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pG5k92Op6QLpPwOb1OdXmxTCDLwjiDDGxMEx9C1NwdE=;
        b=Fh4RRbWxWXm173srDAMTj0FYH47rW5mA/PW/1dKJfpuixZRC1Xz+J/fYGauv6d4y3Q
         A5OILFL2pywrv83N61kPw2OuDPF3UrFcvkMLOssYyNfL14Tg8U20FZX2cnsPmoOORQhu
         nKtgCBazO7vk9j76OogZ9mlwgWvylqJdNtS6rn6LvPZkea49ApamU76Kj1dJaXkGXk/r
         CUFKMNxcNUgMFEhFNF78tvbutiZZlk0KY1VBOiTSZJSBpD9+purBaR4PNlwyuLYZeY3Q
         8n+2cC448AHhsEHqANFB+7J0YIDkD6HWCr2hkxVFoupX9Npx1uSR3U6eWcD29u/Fz0DM
         5Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087085; x=1790691885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pG5k92Op6QLpPwOb1OdXmxTCDLwjiDDGxMEx9C1NwdE=;
        b=Rx6TRQa+7l7aqId6tQ4hn7K3xvQ4rK+VT3i/E7Mldwf3rQ5OgxNyD1ypkJNvTiJSZG
         +pq6QsikcvW1s/ProREYlFmB1Prswf7m7w7VR0wAKw0jVMoztB9btXqUb9/jdtZ/PveH
         4nq6xjZQKyiRtsXBMNoatB1tbm636J1LZt911LsYNVFuQFZYKNMTGIxjyhAukmT1QIow
         bG/HBF0xyPQ4IWnCy9LoQWlmZzeVpIp6+PmxfnY6IAi9Ohk6yXzCw2w5sYhiBKKPCxdx
         CduNfITmgGvIb+y6sa+l35mUPgB432TMJdh6wz0iUtzaPsENZYXMrBS4ET/LpvWQI08F
         az3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxr+OZbKqvLguo4jLkVZG90vlkmOuMGuloR9kcJIfdxANgByr6K/heLaZFfwWdO9U7pnbuPLhJynxBfLHI=@vger.kernel.org
X-Gm-Message-State: AFuF++kOcElC2U+HU6sRwTaGQrlHA8yAsxnkg6fY4+KGRRYfh28CiMIu
	dk8/XmTLZqmIz2o4cW8PmRm6WFh99Kpt9hF4nV8M7YNOvudBoiphwid7Sdomn0aZ6K0vwumIDSZ
	EVmxGjttRx+N0KaFXaH3or6PxI0yTtrk=
X-Gm-Gg: AYBFou0Z5e9duNpGb/jZFMcYCd4MywREllTSGfbHr4iV+0AsscrXctRnVZUlS8aG0uz
	rnXYP5tp1kVG6CCM4qCRF/QV2ijhENVlKWINijuEelu+5TKgr1hpWi0kjygvIy39A9J55b5U8Wj
	6GLkvuBNmzn3anLubR98pTbhtcMm1jP3sOdXw6Dc2SW1QYZkAOG2LNi8hg1K/Fj21sOQok0YJfU
	cztVepa9l1JP84tBJpTifNC0Frug5pri5zDfx6972mG7VzLEIPS0vjHOvPsCGyV95FUPdIlM0s8
	N7jppoeF1CTbA66IeukxXm19Nv4JNQiUb0xWjXggNsakwiukEf7cfdHAgTKlTZGkNl7cJWgWx+4
	N5XW2yy992+lZT3csOUcpoZAvpTFlNNczqD3EdK6HeMWVlj/+5oRFvfZxVLjAH61DCGUP0HAUIj
	32CGo=
X-Received: by 2002:a05:690e:4399:b0:672:99e0:ebfd with SMTP id
 956f58d0204a3-67299e0efc1mr2230921d50.149.1790087085189; Tue, 22 Sep 2026
 07:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918042835.156030-1-lucasadramalho@gmail.com>
In-Reply-To: <20260918042835.156030-1-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 22 Sep 2026 11:24:33 -0300
X-Gm-Features: AcwNN1UDCd9pJF-zNSIhDzl0RLyxNuW0CxJ41yZspJK_ynX0yqYCCaJogYj0QE8
Message-ID: <CAMAsx6fv6Uw+QsYdHcS0yddB5VOqYbeBjV78-RuyBez1nUV4fA@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add debugging index
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 18 de set. de 2026 =C3=A0s 01:28, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Add a Brazilian Portuguese index for process/debugging, mirroring the
> section layout of the original. No debugging documents have been
> translated yet, so every entry is listed under a Todolist marker
> instead of a toctree.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../pt_BR/process/debugging/index.rst         | 73 +++++++++++++++++++
>  .../translations/pt_BR/process/index.rst      |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/debugging/in=
dex.rst
>
Thanks, Lucas. The translation looks good to me.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
