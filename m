Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577213;
	b=1tz9sbwrzTwXUG5rKRbeK1uERvf4hrv8VQKie653jT3MBwq6QjkZBB8W7t8vCSKUoEIQ
	 d8BehOeRBKIYELIVLiz0bxc4Ql5u4Rfq/VMxasbCAUpxyfBTCelkDuMEzg2GDV706+f/R
	 VyUb7Wy6+61t7lPITetlDZKX6eR92pzUz3Bu6zqjwrPAvVNoCQWGOWA/avIzZvcvfKRwY
	 gweuDvIn9xw+/9Lf9bhqw+1eLJ6HK49VWL/PM/o49ZKKupL+DDpey2hhLV/jqfrYXtio/
	 irZFXZfx+ziBiWfML95K9i63UpJEoDLHf0/htagwWmryUPmv4DmIaG1eMrNIQ1wMpbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577213;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ZIeabLWc8/+X+ra1sWD8SHeL20genn2WdJFRc0Rla+4=;
	b=ZMii7ay3QYC/LJ5r6ZT20Vl/GbMzb8YuSLL2Ny4vsYu9zWAVOatkJ+/W8N2afpL3eaum
	 jPTDmA/qHAZczZuMRHLcs3UcoHJhwNH9ETaO9sfnnE1NHzWvyOycqxoo+TGiIlr1q1ZUA
	 VCDFGb/cavCjk1ikWIU9Co97FCUQYl5skl3+e46xITPRN7xv5E8ocbDCPy7U3QlU9kfip
	 tD7tvKVAHaG4lt0P7lSu+qB2hca5fU3Ci0QFshXzYnlPXs5ojl3edfWFV4PIu+aT86UZ+
	 Tw2tyYQYjQpFueIwwiT9L7Lh7pTcTtkEltVLJ28knV1bdHJ14a4F7g7Gymc68QafRTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My+NPPXd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC08606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My+NPPXd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3778A1F00AE3
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792577212;
	bh=ZIeabLWc8/+X+ra1sWD8SHeL20genn2WdJFRc0Rla+4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=My+NPPXdZzilgi8OU5XGXQa2QWI7Agq9xVcLjDqT6xp/zKF547A6W94nmbklZWwjg
	 rzBYhnKsaVPSSAGbOgdsXGrP5foSTo4jaqPw3swymrzkIYZiq25uiokhyDz+bSCBjB
	 oUTwulDO68uwZXx2+PsfP3JfvtsBH5J7e3Qk/7/x6eGCTzvO5RWW7yjWnNW8u3O7t0
	 gEdGgVqZf7yj9QrugZUbIkrJpTESFLpgW3wyTawItnYm3knuCb7X9MqZA/Wx5ICUyB
	 +WUn/IXuq2OHQFDWydtYc8PPlzEFiYP/iNH7+nlEqBM9ueY5CRR8b66TUuHpOGi8c3
	 tOZxLwWVHvCkQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4d648aacso401845e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5uuUwYg0d0K4QkAUcCtTwp+qng1ASenA5C/IZRrO2o4Vm2YoQdIDnqC+riFPv9WMFbcdvtjezCMnN7VQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/IK6xN/2GW29HpzBZ+Pz00EyIuZst/TaS8XpSuP+m/FQVliLJ
	cfKD4ZwxstHq8qAd9DsdGIGeKkYi8kol60z6KrfqjFVZudAAFxR9Dib3kZnWVUSAA+1zmm19rPH
	Emw7cEpZRkuyOqazCr+eEUaF/Z9cVVkcDbGKJ0dbQYA==
X-Received: by 2002:a05:6512:3d25:b0:5be:54c7:75f5 with SMTP id
 2adb3069b0e04-5bfa1be93b6mr617058e87.18.1792577210780; Wed, 21 Oct 2026
 03:06:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:06:49 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:06:49 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com> <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
Date: Wed, 21 Oct 2026 06:06:49 -0400
X-Gmail-Original-Message-ID: <CAMRc=McawKQvXKPHzrSsbjxm3nSmiy5gEGEjfeitBwDX=jBDyg@mail.gmail.com>
X-Gm-Features: AclHuK-DUw-TDKgIDp7kls7bG6fjPSgpfM8RhNNzpQbvwml0tw0TvFN9P4v7edE
Message-ID: <CAMRc=McawKQvXKPHzrSsbjxm3nSmiy5gEGEjfeitBwDX=jBDyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: soc_button_array - use __free() cleanup
 facilities to free memory
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 03:50:00 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Switch to using __free(kfree) cleanup facilities instead of doing manual
> cleanup or abusing devm for allocations that are only needed during
> probing.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
