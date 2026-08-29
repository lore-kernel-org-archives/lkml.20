Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451341D102
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035100; cv=pass; b=IPvXimubHDqVcaB0J2/ybk2Pbs23yQLyF8SxtYsJ5JNBLb9O1155N19nMz+12rD5uNNNaHMaeiqZAMdXzaAVMuDT2loTW4jzzb5+HUunnkC1DpYXBOha6KyUf7/dBCm0uaa288wn77eyCJtqo4fbKRdBMAREzyRUKD1L14SwCn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035100; c=relaxed/simple;
	bh=vR8EvjCEJMLtos/VE84rwQYG+yZeA5O2G7EFo2i4GmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPnWEQRu+85Sda3v5NYDKAm/+iC8KmL03jRMT656JrUJdo7MoZBiS2LW53wz6/vCVl+tY8GaCA+ybiAt2VURTo3YiodFJ+SA6hgubpBs8hFnY3w/SbndqRfmKgXZpzTwaJ8vx4DyMBKxEx3AMBiOcLa2teq/xvQPFd+M0CGRgBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSAD8sKR; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSAD8sKR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48436216a98so137474f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788035098; cv=none;
        d=google.com; s=arc-20260327;
        b=EXeuVoFd3hrzpyUnAucFPYzVmNCGDwbuGIjBixci9LHUaHO/8uiHAJ4Lq+XTK6HPbN
         t+4iMjuDQZhdpScXzJE75mql2roD7Ah2dHD/5GHE4mKOkpBXWkUGJvJAk8ksmiYtTXEA
         hT6zuDXV2NFw2kg6IYnG5EUA14hJ8p698kJLirj+KU486CxDIzMUxY6dRvC6EOLDdcyk
         v4/USsrQJwC/r9OC1Z985BYVU1mPqmO8OSENd53Os8uy2dGMQ0US/sztXa/JsM58WKcF
         Umfzsgi6jvbkxlexcEI9sanW7voN5mCz4iVLiwoN/t/9ED33W4BPOXfgIFYvHNRXyEr9
         Js0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tA8MlSVHTHrEwXyCp2VrI601oCpXdup1DNABDFDkXLg=;
        fh=VU09PW3K8G/SBrQWmxTL38H3Ol5LKiHGBGW8nrO9ai8=;
        b=S3Ypg80Eo7C2c6sSfDO5FMMWJiWQn91JgcGGqEP4Z81H2f37/42Uttqep23sg3B/nY
         1zhWj9TVsx3DQiSlhc+WvquchJuKHhMHKzGLbBybx/W4k1dglyZdYILq/1NJZd2+orw9
         IYDzZ3KoAWmP7lO6KlQ15mvq3ueQWdVGTprcPO65Et1B+oxlz1lP1M9+S2XoBqUmTuxi
         wuoq+rcC3EExWexIPWSPTVYmoodDDZaH9mgw/U9py6Hzp4sIwTXf9Z4KXH/ECQqEheeN
         ltObJ28Q0rVwtpSEALbtYI0/nOPl2/IE9knlVX+7sIocexmhbEW3Xw4gebVN/Ko7ZiBD
         Co5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788035098; x=1788639898; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tA8MlSVHTHrEwXyCp2VrI601oCpXdup1DNABDFDkXLg=;
        b=JSAD8sKR0TzHNNu5z4KZ5yUpsQvMfU5kPlcGeWxS5L76AJhJWm7T/lkrP0tqAEmzAA
         zkdaRt0Mw9MyEBnu8zlQIs/D8QyOj5n6KuxT8aoZ4O2C14GOO4P9km+juri6iKz/vz4M
         z8OX2Y3/dT576NhxhxaS2gGLpr5b0yrdRISAMbyxB/q2+RwI2HIGXuSxaOHvpLwa0VlI
         0nb9z5QyfqHOtY8W5/sRG7kkcpt7LmfMgjXfWihzhNz1MnEs88Plabd9ZYdzKcxcNmB5
         3GxUcg9uZROOwW7o3LJ9YQvsaOs8dHuODESAXGBDXHlCgdFR+2ozOXKPyarm6PJtmrNn
         Yj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788035098; x=1788639898;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tA8MlSVHTHrEwXyCp2VrI601oCpXdup1DNABDFDkXLg=;
        b=GCpzTpBjvEJlG2nyNKPIMoJVjL0K1e5UJ79Goqx15XdCjNdUss+nSWUJEGSCDq0zeh
         M9HNufXiiAaB1fLBBJWDdShUhDeHj2d0X5OS1MUAFnVQTM0fISWiuXtkQBhy1VIJSqpL
         tE8EcPf2DaYBVezsQlB9/is9spypgZiyTz13DaCcLA0oQWZmTF9uWeYV6K2e7owq96Yk
         Uh9p82nYZMiGYJ0q3qGXDR8saTWWCur+Dms+A/bmtLMUYJ3HGDaoZU8J/pqp8pfYlVs3
         jmapt9CO3acRTM2cUfetzpeXWk4AFcReXiDhBzLdTtXi/PBErXReU3y7gFMvYgYL10mR
         2UkA==
X-Forwarded-Encrypted: i=1; AKwUvBy/IR4bifIwAAMlpf4OBXypKn/yjKdMO3Sk+XZ0bH9yrazVyxnU1dC+bHf3lXRDzYc+GYyuzj+vOkf/oCk=@vger.kernel.org
X-Gm-Message-State: AFuF++nkZDaDX8AdWh5GemhwHj4g0Kp2/RvuV3w9/iPZIZvFo6v8RVHM
	5yXAHPUMbbSliFkTi/nt/EEN9AAZq8F9fJX0JF6FEaW68rfG1LSqD6EJC4WRosjBgdrlgdedxjl
	OQGYVzXHn3wcdujhuVcHPPS/e0CoDEtQ=
X-Gm-Gg: AYBFou25Um84niyTo00r+tDH5SxdhgSzjLkNKSv9XCDTjTTCeGPdhG/vQ5Pc+GpIkKn
	Qbo4YuTNcCGMennB1nhgaNPQ+V+cCBJQ+RTcB/Ysew8Eef//3/uGZonU+B+/0c27xwdhNSe/xpt
	Uc2b60NhpIkY4cxkqIUwouyEfn9HYdJTzcnJW/x7eCFlCTf8+STgyHT5xHUtgn42326PdJpbaad
	AXQdmbaGIL5hNejpfL5R9uSAAlcGDNF1GVDfJMg3Cwowmh3A2JjeSJGZ6jxzfSXjVTn9yvP5cVt
	cWTP4HUDnp45/KALrhEvoruKrL8/mT6JGMPIiW5tsz4LWTtyuoVkirj+jpHylaDzDii642HZdOo
	C1jpmY5C8Yl8JRmFM0mSAIUWn007HjEQD0xaMNC/VXMq7Np1cUXhNcE4GYpfOslhy/RU8qfdkE+
	Yv78wT0gtb35Mq6bRHL1MoKBsgr44Rc1abt+xbwTv2uPHDdEZFc2klkENBWJCWYjni0dfN7maMZ
	86Vr32+SjHg
X-Received: by 2002:a05:6000:4910:b0:482:a8b1:aa6d with SMTP id
 ffacd0b85a97d-482f79c1923mr23546979f8f.10.1788035097619; Sat, 29 Aug 2026
 13:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
 <20260829-kernel-header-removal-v2-3-c67739d5dedf@gmail.com> <178802625991.2637008.10318808016519364966.b4-review@b4>
In-Reply-To: <178802625991.2637008.10318808016519364966.b4-review@b4>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 22:24:47 +0200
X-Gm-Features: AcwNN1UOj791Z1vlAg1YaooJdLCUQ0l1Xa0KFU0QjisAdMWvodwAm00Eev2aVw4
Message-ID: <CALoEA-yLuDJFfL4MszuY5GAdOL5ZyLK12ZLXE=-tQbtQswhoOQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] iio: temperature: ltc2983: make headers conform
 to IWYU
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Aug 2026 at 19:57, Jonathan Cameron <jic23@kernel.org> wrote:
>
> > Remove the catch-all kernel.h header and add the missing headers to
> > enforce IWYU.
>
> Sashiko correctly observed that this wasn't really IWYU.  So, to avoid
> confusion we should be referring to something "approximate IWYU taking into
> account some headers that always include others".

On another note - since we paste Sashiko outputs regularly into patch reviews,
isn't it time to send a pull request to the Sashiko repo to Cc
linux-iio on reviews?
I remember the last email thread discussing this died out unfortunately :(

--
Kind regards,
Joshua Crofts
