Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F3751D539
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909909; cv=pass; b=Z4Fg48xPjy0Hdgagi2biC6xW7238t738nQfru+uVyoRxODjThoCryV3zbsUiUcGIwH0Tp5WfL/YUMUckk8Tgaj08/j3WffoujhwA9XF4FN6nguSJ69/xh6a0JI5UqUfrWR4BW4j0cagYHzCt35aEBspOSdAYjF0vyQG+ih290k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909909; c=relaxed/simple;
	bh=T0J5BYuAnT3Xdi9Jj3WCm+YKqnN6H2/WrFA4Kd+XVcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMZgp24F8EtOCdTaFnNcGp+EVZK0aSvgxobTsJg6WTrMBq2orM1FpKudKGgtQe9uAdSaDAtS9+V78hS1kx+K7Jz1h8e1vS3uFiDlmURvMiO0nNRM1eU0OhgaC6QSaUzoS/F8fKCs8PLVamD0FxM+0+vGI2E3ry0MQ9LCQ+o45zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bu6oCxjW; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu6oCxjW"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4af81963f35so1913633b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791909907; cv=none;
        d=google.com; s=arc-20260327;
        b=Cggv5R5VGotjeGjLuBvAZHod5bCdkjOHP5D00ToqyNwEqM4QekBD2llFGSOTEkcOr3
         4eLClHkXICr+2gb03KQZV82B8IL5zkBi8aPROL+OehR8kroQ7RYuaiTakSun3a9KbgY3
         5cg/x7w6Est7/fvpxSv0EjiC4QsdAcKLu01dK+o+IfDB7j+4aVzJ0DyKeApqd0IWl8Vl
         +belIgwkr+LLyUpd4TlWCKnG7su2RgVRt1EtVI3Kgz7cvH6edRmvQoRUPZgpUOEpdUxa
         u80xR/8QZCFQTasCCwHitne8Cb9JUJHXDadDREuJznnzwGoRIETyDc7HkXwTPt7/4srF
         BDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T0J5BYuAnT3Xdi9Jj3WCm+YKqnN6H2/WrFA4Kd+XVcw=;
        fh=HC8d9gkefoAXbP54Zs8qJ2nbgTboNul/HB97TBhIiVI=;
        b=FtK8KtM5mwSrcxbRdq+dF/XuSpNTCqnyJQAr9d8MIgFD0mQSawQQUnXiB9xrkNDeap
         bCDtV0Ei7dNF3+UcCq9L7FZfN9Q3jUlQ3ueJz/OS0H3rOLvmFkKlCVQk9AXK6gsh5djB
         2OWS18k2oTpiWDqsUH/XxWF8VT/jKqYMP2jlkhZzHkySWYnms7uR0QN28h5AM7+2938v
         YVzqgULjhr1RBWr8NVTbiQZeUYIaLC42VUHSxzOZfAwHwmUHuZVzIZxQTsjC02L/4MrV
         eRYoY5GEHDqplw1rlesbog7gJ5lVxC9ZVjQzF5H7HmWQSr+DMvGE6hElDiktXt1G75tz
         l9KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791909907; x=1792514707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0J5BYuAnT3Xdi9Jj3WCm+YKqnN6H2/WrFA4Kd+XVcw=;
        b=bu6oCxjWhaGntr+VM13rF2COOHxrghPdcW2BylwKxNYEXaQVVYbn9FBBxGhgVsmsgj
         XUfheH0UTD/OFTx+hzPK0grZDg/AosqB0748Za5Z6c7DXdJxE3nQN58/6evJYbzqyfmv
         kYXvOGuQOv0FIKaD6kixsYMQElxwiXdnoqRuIGMdpk/7Z5GH0UXvvO5UvTpfV2f8ZXMy
         y0IvfAfRvef28HHOyN4J3mb1jNRqfPfyXdxb020z4w/2gF3mYgLpN3UAJV5v3m0VatLG
         4hH6hyCVGRhBd+Byflx7lmp6pInZAKAJari5nQ6rdauiBVmxVXNaQQeNoXXwQ0EPKNZj
         ueHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909907; x=1792514707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T0J5BYuAnT3Xdi9Jj3WCm+YKqnN6H2/WrFA4Kd+XVcw=;
        b=xbvg58ZBK3QyuDdk0PkxJjXOWA+r5wOjtrnYItc1XF2wfQXNpfn/I3zdfuP9UneH6G
         NiS2JpwTV5d1mtaHR66MM67yo3REvndHO5HrpoGw/IRMQm0A51VdJTGsg0/sltYUwDKh
         FWreI6aeImi+3UvkjhbTUBTPKtulqR9d2ptCVxHlrMR1WT2LQVWJ3RAAGZZilcA4Okp1
         8qf3K8nKDb84erHW7UCiDbJD/UeTTdIG7Gto5VWekSRSvfSXA31xwQGo9jphV3MgDps5
         Qfq12PSxPObAh6MP3wP6GIdlpyVGwbeTHJZ05dyBL4BKsXM0NpaIucWjsmfqLB30kJT/
         WIKA==
X-Forwarded-Encrypted: i=1; AKwUvByKEGMJnFN65fi18yvfpHpGKRXeUMRX2pcNuOXIBpJj9c/lurGxa76Przpy/NE6HFsv4QobIbm4lypTC6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbycCJcoVQl52qgeks4jPj+4c3K0hUUv2zeVa7mNX+p8/CTbtT
	L4+NVfqkQ9tdvjJ2jqBAjFsfR0QUzDy7tETZSWM9WAomrPb7RnvI2mgrVKZhvm9kgBp/DVt9XMN
	SRnaDoK48eikfR7W+GccKInK4pX87YwY=
X-Gm-Gg: AYBFou0gru6oZeKRiEVDSMyCmTk2fd3GRyF6Z1LfI7wH4+FaVx+X01hCS0GJWLq02JG
	5XhobQNU83znBrW1UZfz5QfrkhlG48nswHRXzlouRE+Mwj2YkKW/Cn05j/pAIL2vnjvspwTfOfd
	8PS9E/uC4AS70mClC3ke1UN4eDy5hpu4nfvG5ZtZiZdMr3uHyQCWI0jrviEbvY5rjgc1a8XnZqY
	TMzLzovkJg6UWuaOwUniTW1p7Um0mVE+DXgoiSdTB9PoPEUAedFieQ+um/8Y4YOh64AT0RH2qnr
	bH2NsZ5z176N/kadhokQaI7evvxyfl00J7y3b/ISUKdVJ8f1V58TYm0HXLLIzJY9gPdPAUfEzNu
	UvCmVBFArbdquZaEhHXUbQE3MdRMGUUSLY8B7QJsOGof+IA==
X-Received: by 2002:a05:6808:182a:b0:4cb:f21c:a79f with SMTP id
 5614622812f47-50c516defcbmr14456725b6e.39.1791909907159; Tue, 13 Oct 2026
 09:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928142450.103799-1-vidhu.linux@gmail.com>
 <CAHp75VcW3ADQdf68Whmo7yhqu9rdi54YVYgyh5PRLPccH6aUBg@mail.gmail.com>
 <CAFqz8LL0bgOu3TKfxz0Ri=qw09wVHC68CbVS2yZZjv7oKTGwVw@mail.gmail.com> <arrgEPs779q9ck8q@ashevche-desk.local>
In-Reply-To: <arrgEPs779q9ck8q@ashevche-desk.local>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Tue, 13 Oct 2026 22:14:56 +0530
X-Gm-Features: AclHuK_TBpGn7NoEBdw6LC_e_JC6BfcP9OOGjC18pYWAlajojr0JNuJQwN-0-7M
Message-ID: <CAFqz8LJbyheyXmf9i6v2cqMgVti_jii5OVe0WSkLvi4sSJXmVQ@mail.gmail.com>
Subject: Re: [PATCH] iio: humidity: am2315: fix negative temperature decoding
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Siratul Islam <email@sirat.me>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2026, Vidhu Sarwal wrote:
> Decode the sign bit before storing the temperature value. Positive
> readings are unaffected.

Hey,

A gentle ping on this patch. Please let me know if any further changes
are needed.

Thanks,
Vidhu
