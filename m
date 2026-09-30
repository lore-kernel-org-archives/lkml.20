Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630703BE642
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758247; cv=none; b=CTHrdK9F7biN5JLHi3oPxhBUJcDOIHmt2bMcHNkWWq+DrPvMI/uCqp5t+moE/QvRhs/36OdsT4p0Tzib/RVykEK7+O1aewVbbubMtlKAK5j12+0cETCD/7OQD4b+BR687puIRaLXzZHEtFWZ0evQpM9P2bVcFe34xf70uDG/aAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758247; c=relaxed/simple;
	bh=mxzqvlri9Ibwbqo3RK2wB3BTMPpW+o/FKFXqTM7hluI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlaxTpPpcwjfy6EuDkdRfdryEwe0F8qO0xWHJPTEZ1dP1B22/7oF/q1mDVpHZE6zRvMGQLigAnOsAg7oVTpjlATkGFK3ofuqxbwNVGIEByUIAUaJVr3EU8gahjXe6nQzuelTUkyWJH7D5NFGX9CuSTCLXpgKeDWIp2vtVpRurts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gq+Hkz3b; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq+Hkz3b"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so41250815e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758245; x=1791363045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syerpKjnrG/V4/mGWnapKjB8nHZ5GCsdjKXFguWOck0=;
        b=Gq+Hkz3bHqE55uR4fG4B1XrJWAUOfWCcSJJbTGm8KzpRzJD6EGieHgT9FsvUdLrGOW
         e82zoDjtpK4xnSyUtV9Vhi5aXc/hIXV+X1XpU/ocu8QJUscaLESnrRnBA7V3wFCHijE+
         qxoBO1qeWorsqbiUhzilETTEzKEWrHkQFbR9lflE7MUA4XFC2a6vYnal1r7agDZD99Py
         kVvlB0p+hMfKIHVZtsWApaiHO7b9LzmfQZsPfzZneSuSf3LOizSEkVLw9ElYpLfPkCkK
         fQARbcR+uPqPVxe0arhcg3eljNyGdmdoRsVNQP81gR7lk+D7t3J1SmusN7WSCrnV1Hiz
         adDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758245; x=1791363045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syerpKjnrG/V4/mGWnapKjB8nHZ5GCsdjKXFguWOck0=;
        b=zl65r/OUaXk3zJEzed6MPNY1HvRPyMuC82eHmK3GiRgRPUrRlXEi7xWKSlMY3NpLiK
         u7asIl85J/teAXjZ397P0k0R/8Gnzz9lwoTTsfzq05jveO8J6oySMOfAk0uFvTT4mU2n
         e/hc5wIDqtysPi81ZLo88bKq1S6n0OhVtKYPYv4xfyNKmy8uLIWaq7+NQqmZF7p42DBl
         ueKpuwjdzwoiV+bZTbIfwr73klVZ155AZl7YV8jNPI34noI1DkGwtCxuMFyHp0mb1P5i
         7OVnHMsng2TH63yFLFVK9zo97USpTH3o4n0eL83N6m6q2c5JtElsV/X60LI0hqv/LtBx
         mvHw==
X-Forwarded-Encrypted: i=1; AKwUvBzzz6xaoGvAXLZbkDJCp/4UVSX9kjA8bMQnBRS3WRrCmpDOsClhO1WIZIkJsiq1wIQu7Plmsu1jKu43U80=@vger.kernel.org
X-Gm-Message-State: AFuF++m2nujnSulhowBxJSIQSKD3E2Lxpx7mXMt/Rg9zhah/841nBhfv
	+T5+bnYJySAwq5P9dteb7UQCvJDla49whMz+jGoXvVimMfpAddo+ht0S1XDIfA==
X-Gm-Gg: AYBFou2doxKuuPNzLg+MqgivgReaXo/IfE6k165OCmzlrB1CzfbU/49HLvyDYi++asm
	O4bvr7VxItwsX0pxxgsEUHpRs+SnxC4e/M8UChVKCCdJtCdNnO4IPTzSxu+5vqs0AktUG6/Gvr2
	/uy2ffmwfopSEQxJW/hsg8rYoMFbVrvVh7DEya4z1s5Krw9GwWC3poLHxOEQNboBRILlGPQfyHU
	km1KSEEH6/Jti9qiBTwATWRTwe5nJuhR9oErYb0DROUaPHnc+JWHh57cg4zkf44HopPEyB23OMJ
	fCaQ5wHw5Tzzk5vjnKv5cCZ3HICV237Cdwt4jA6vqlDKT+OEnYDWM2IuG+tiLpXgg4b2+7Qrs28
	ydMwPm9gy+KGK3i2jqhPW3kODnNywLDTSa5hkOg+6F0xuOs2uu+DTvCuTYjJxsnzjZA1WKlBK+P
	eiJuVMGcV45OoDiD6kx8vF14/E9pEfxuEXsdGmPaLT4jQyiFKdQ930HGQInIUuFBqYT/XEUXafV
	vvx6G9ezNvxLyzkRlVTkISBJVKZuBd/8t8dVm/kMkmf50fHMu8u6HfUZXICJIvZQrDa6K++HMqA
	t2T9dh548BaUhk8iMplQKe+ZtYJSroptEQ0uDBth0+BmyXxdzMGsoHL2Bi4eFzzWOqXcuM6Jr1A
	pSQKtvW3Cxe7OytZIMReW1oJUPhmnWLg+FzPOBZSI42jDISzAFd0orJvij19vGIN3Ly4a3p8kFn
	uI+cThtKOcq2Vd3ls=
X-Received: by 2002:a05:600c:4e56:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-4a01b00ef27mr11371415e9.33.1790758244505;
        Wed, 30 Sep 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01751613dsm36189785e9.3.2026.09.30.01.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:50:44 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:50:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@analog.com>, <jic23@kernel.org>,
 <nuno.sa@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <Michael.Hennerich@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v3 02/13] iio: adc: ad4134: Sign extend sample data
Message-ID: <20260930105041.0000303e@gmail.com>
In-Reply-To: <a57b3a24401b3101aa10b69173e5edbde326e741.1790719424.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
	<a57b3a24401b3101aa10b69173e5edbde326e741.1790719424.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 19:42:29 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Sign extend ADC sample data for correct delivery of negative ADC input
> difference.
> 
> Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
