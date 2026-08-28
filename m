Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62E330D24
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934056; cv=pass; b=g9eONJQ4fiYY31YAq6Z7pKcUWCWXLBk18DlpKw97cuAy6a7w90MIPaqSJX9mJ/ghzj4DHB+Rusu83Ycqalaz8AdoGSr5qriJv9fBuAXA3cbOEfMZUJp6SRJtulrWo+qKomIqp2OIxfSpohXJV53H07C+wcLo8cU4DEvK6BUtxCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934056; c=relaxed/simple;
	bh=8YPYDYkrQlrR+CyxlVZSwrQX6xFTern0V+PoudwjWj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kus7Sh5fl3657xZ5zPYVGxgzWtaM/S1nJQpBHLYoGH7HFPSH1b7LAU4pTqoXHPjb0UtJfUXaMhSRMZ9ADrKfEBivOIbD+EZfodeZ8DFs+bm5xHYvecIey2LnXwHnIqQkBI0LXNxwpG2Z0UdcLW/Ykey3VPgQKqzgbaiQzuX3nFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=ROkzyXgl; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="ROkzyXgl"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81f36179d72so16847307b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787934053; cv=none;
        d=google.com; s=arc-20260327;
        b=RPEOnpC8Kjy6veA2air3o/XRp6t98kJl5R2Ul3mcmAZI70mHs4aEGdfO3ZZaOXMek8
         CDwRZ+WGn119fNngKBf7tVleosJJe1jlol2PTULpp5AfiTt39/mO5272+rOKtHEbagdn
         f6a8IsTbo6zY9jpJQ3KeberN3v5g2/7IV8k/8uDHs65NI3w+owbQUHjRw+MA2N7UHrLw
         Bxb5wpqeVWmA/z22NzRpj8vW2hSIExV/ElobigqSAvBkN9AHHcABlFTvI6h+XHK18kxP
         +21Xdr+Eo5uHeO6mxZwqx+gZHwdIrmIv8Pu/qYKKmCQ71jbJPN8ksZIpgJnn01j32L3l
         zNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8YPYDYkrQlrR+CyxlVZSwrQX6xFTern0V+PoudwjWj8=;
        fh=pu6JpCfBpqp7YDIFmJHllFnptpUZYRicQLXc7EXdz0E=;
        b=ix0KYWHCt4S1aL2fGWIomqCM8buTVWePuUQvBC5Kfzvyqzc6IWLnJS7pL4u+uh3SNP
         TH7XqJaJdkvOVg6HOEVZaoVtDKxmf2wzjnQIfDiveysmUgtHT5sFhckD6FAhH44HAOs8
         y5vg3AAJwpS8LbMqhojs33n7HENjFniVe3iJBS+T1UvfgFt7OsqGBqm08mb6ySaW0o9M
         EaBaZMFzWHvtFS4v8o2NbIDNtWddEQXam597S92Irmf8xfkOo7vGuJ4pQaxVnys+t+vT
         Ywl+TcY9BazT5YOJcLcaAPNhlHxD55iA3daTOksytcJgw2f/rMcArrRUoFvBYxRQxOdZ
         04Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1787934053; x=1788538853; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YPYDYkrQlrR+CyxlVZSwrQX6xFTern0V+PoudwjWj8=;
        b=ROkzyXgl/Q8sQR13oSIg9gJjoWkEkjMe/8keLGCT3g+mN3dTY1soanV123s8nG+q3T
         xidYtbgOq1jPg8uMmhIgntOBhlGg7zOSb5mqtLlEwwPedfvueZxhABimwKZ10ex+bGhA
         VM/XhlOniYAVBJUSYkQhWzbHIHMNO4HADJHiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787934053; x=1788538853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8YPYDYkrQlrR+CyxlVZSwrQX6xFTern0V+PoudwjWj8=;
        b=l+DuFseN4brN7zY5AV1RHa14wxXgAc7JymqsOqhTT/r8ndB90ZN+kUBlluCLZWm6Or
         kQZIh8qHWOtI1b9k/kxJO4e9iwsooLJFxpOwqHAbFpH4lLGltwnyFhwLb8CJ3UFDxmgD
         5nBIWeV0ogocA4DUCoya7mi8vUvuKRPC4UjjQp8d0TyYFI6rj9fc3RTiqkgyLcPj6ceP
         xXxPD04gt3pcRwWzRIK5/0C+4WG+gJ15BaRAvtL4Ni3Gtk6leMXLGZI8DCmyQxq9L4ET
         9XdgzEsIIaghIMoyn2pt+p1evdBx47CnpJagTIn+cDZADLV0DP+2g0S8Cd6FFlAPaahp
         pIuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwui21GRHCXnp74C9RtNeKZKTgCj5FK0J8c4KZ/E9hxjSV5+ehnFjQjWpTSNbUKrHhZ5g3aEh60JwtGAVc=@vger.kernel.org
X-Gm-Message-State: AFuF++nuztTpXGWTDNUNtkkhwX38mH9O1hMEljUE/6mZuRygDZRJMMW2
	QaLOg3Wh4Gn7oOUkY7HSwTl6eUfAPMToJ0cNAM05RlC3+kZ4bTSudAo9hqnJpZPsfHFvZe5PS2Y
	brZLYZ5YuucpvqYGLAKTzejfEYLbALnDPFIWbW6bVzA==
X-Gm-Gg: AYBFou0xT0Aq6HCoBc8NY3kGgpyVu7HqgbXtbdLlg11IDN1fMJ7hPFU5E/mj/+7lM7i
	ug9PP2UKO16OTgbbrUU3u7jwUxAIFA+rrfcC2euXViee2rY9s+7gjWhlP0vT1Xqzb/0tt3u8j90
	0eY8naVLjQjcTXi/h2xwXETYCH77C+yciIiI2zwFPY5JrQ1TZWOgqV5ZSBATv34OMBfXevEnoqr
	tEiHJp5oGbtzK0Fm4/UijLyOXnKkqp5xlwcJVD3M0+jXa0GhlBWT/QyHYhZJs7CEMa3CdKjxXbv
	rOxHd114jMKsjeYxkVHD9qg7+8lme5HTv8jdl3d6tzuIlKP7TE8Tu101ljPkij2OJOiHmvSl0kp
	pS3o=
X-Received: by 2002:a05:690c:39d:b0:855:f387:98c0 with SMTP id
 00721157ae682-85d6c7ecff1mr29590227b3.29.1787934052949; Fri, 28 Aug 2026
 09:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828161348.13212-1-tzungbi@kernel.org>
In-Reply-To: <20260828161348.13212-1-tzungbi@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sat, 29 Aug 2026 01:20:40 +0900
X-Gm-Features: AcwNN1WVkx5mI84Kje1AxK5jgHkZdrKfEJurGd6o3lFFPv184PlCKpPhfQ4j4_A
Message-ID: <CAFr9PX=PugO9RKGsD_E8o_fqfZAXxKFU27t2jBm0qT-Er_Kaew@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] watchdog: msc313e: Fix issues Sashiko reported
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Romain Perier <romain.perier@gmail.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

On Sat, 29 Aug 2026 at 01:14, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> The series mainly fixes issues reported by Sashiko in [1][2][3].

Thanks for looking at these. I will check the patches on hardware over
the weekend.

Cheers,

Daniel
