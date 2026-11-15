Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754421;
	b=15CwyM/9ZOdYngWocjpwD0SxXqPJLZKouL3ZBUynjLlWnnR3xhXlfsKSVlt61b0FxZKX
	 +KgPQY+7ZBDB4vjEwA5pdM0Yl2HmrJtPuv9AzPX0xTffhe6zuGuTFtal/s3jji4e1kFeZ
	 w9FmxUZ6MPqQOoBz0cQTbhMJnr2bHbe02QlQw1WnjgEzBMJ2XwXstB3UxUEyevfOqCuX0
	 y8n0I7nDebpogelTa68WOwXh9PbHIROTT70RgxX5aKMF0AuvTrzvvL2Kimx/uFzahPJkW
	 hFsp+UTL/gGyR1j2icWUOVgbhizecUY3/y5NX7K+6iN4I7dZ+XzE3nymnLqmSbGnMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9a2DBc8ZcUzVhH7At8yo8XvOJPsqaWUvPJzTb0ebxYs=;
	b=nPupmeErXKuefPMMpHgqsIRBo2Yfk97lVOlVL3AotbjQRxpfnzDdI/Ka2BWlg9NEHsio
	 vYSirPD7r5Wfbk4KEEJIRvRrzaEtWQjvWtQYBizkszu9T7R4xKCoREnf3ZKaCLxQnf6O3
	 ACCpaKa0b1YPlNxwNahX3GU5SQwGDmNA36v7gW0u8Ud57Dzzj0suMChUYzekuegjCdR9L
	 +q46eMZL+6S9C3pzA/yPqvCFw8ztrc+zQMXCwLYTk4w86o3ypv2ICPzz1V7bMXZdMSkg5
	 wLX7Tz3QOzUeAneYepYB0PsjQpBhuBfFRafqf7nDaUC1uf46EUFXjMfxZIsLAthEvww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t1QDuneC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t1QDuneC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so10878655e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754419; x=1795359219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9a2DBc8ZcUzVhH7At8yo8XvOJPsqaWUvPJzTb0ebxYs=;
        b=t1QDuneCYzaavNW54FqmCd7JLercWH9M0pOEKp2ugkAWAZEhyuQ9A3VaxaiNfgpolF
         2YAdiwlf835ctD3JK2LnGrdyzsHISSwoKS18l9T49boI0ga+x7hV7bK5kSA7m8fMs48m
         6+J1xpzUrN+bbFern7GCqTa8gaowHC6/BmiNhP8p4XRlE8JTVLH4R9dhIH/VGU0WYEcc
         7ctC7CgRi3P/mvOkPen5OaURbBV3Z+Ik8mP+aQY7wWzDePalluwiDl9Y8xoKUqnN9Ykr
         YfkKochOMiXGtJp2jDMcWlDrTmA731hHIGbtVmdTYo7Q5GOnw3Gl+uhfKnJW7iGZbF6i
         fqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754419; x=1795359219;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9a2DBc8ZcUzVhH7At8yo8XvOJPsqaWUvPJzTb0ebxYs=;
        b=AIFFwKLAALvaeC4yjkKiC2+qieDRT1uqosnUrfGiiGQ2QfEFw7jgrMrX/ofytEcjvw
         yeNAwITAwi8yWQb5g57pPTNmM2joxRQ2lHVLX36OyUFrTyRJsUtlIbiZlARfliQN9avw
         F8TQlBrzUe0r4Pc27sPbFc3gQBFUmRK07+tUpYc90KnVDVszyS2UFubd/J6xTOAex4wx
         w6Ja9fu4FRESPFwhjYMJBt5TUxhcH2GLmlbeFIdQckOmfWOP3oVKadXs3w1Vf9X6Hsan
         9nj3IZvYAyvI6o/2XGbWKZTZqgZJTiTgXxOsLyUIRVvaL6LWgr9KG09La2HqNmJJk50Y
         ty2A==
X-Forwarded-Encrypted: i=1; AL+hErFmSrnF6c7Vhbs7yNzK0/gTdmxHDoVrugtT+Eq8OJhafMU+Huv42JD5NgMkcwX551J5yBF22e8R+xsOb1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vdBcJ60peIhMKOlGIePVCntoVeJWl0bsYTPF8KszdMdVz6Ftj
	U7k7W5PYG14TAtnbaEfBYJvq2c26X26/v1gcgY31IcU5Pwakj0vFapGn
X-Gm-Gg: AYBFou06gJtH0Xsb8MT1USu9HMErKDM594mdZYGUwMlqZaCkybbzw4AM/8mdY/sIVlO
	6bRnxvyyLwNNJYCair4kRCl/vLfVaKg+7pbCgfy7BiycYLp4CddvFWYZyRc+5NpCYWOhNUFIleO
	5pAjluE9MxTrdLR0wnrp5M2ZSzcCmRehbvAwsXrgQOi5H3lFI9SVGbKV2Xp/nqRxNpAt6CwmIO5
	6zUIraNhWSEdskOcxN6QB4a0ZAnNtb1NMJNVT0e9OKHCnCg5iX7Xj0WuP1xXBtm9vje6QPYLkG6
	gaJFumF+aEue/SYkcYn9si5kqAhCVHstiOiS9oSCBKddZrNHJ4ZDTAacMqf1SSIaZT3lXhZZP+Y
	8oKZi8blUxv5LcOwc8wTpgfCE1wHJgqjmIbMNJv4KPHBN3JriEMHgFhGxoG3MnFBDVK6qNfy98R
	qS53gcWdkmUZiUX2bRXqYCUeyQmY2EuFf0Qzl9L/yPMiY5w9eXMatKbtBD/1kIAMECPyzZYiHqt
	YJPZQX8bykfI76mK9uZdoAKwlM/zR4g8XZPCpf0LvMtfNQ1syMdMCoh67YRkxcmdeL7reHMaC0D
	rJkgttd8W8UxAca+y7uDbi9gcCSj/6ovy7raz8fD7YoL3w16d4IhOWzDPC8X3NmKMg==
X-Received: by 2002:a05:600c:4f86:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb5fd19428mr114912935e9.15.1794754418802;
        Sun, 15 Nov 2026 06:53:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571df488sm118982395e9.4.2026.11.15.06.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:53:38 -0800 (PST)
Date: Sun, 15 Nov 2026 14:53:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Christian Brauner <brauner@kernel.org>, Sang-Heon
 Jeon <ekffu200098@gmail.com>, Breno Leitao <leitao@debian.org>, "Mike
 Rapoport (Microsoft)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Wilson Felipe Pereira <wfelipe@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: Remove strlcat() and sprintf() from
 do_one_initcall()
Message-ID: <20261115145337.2416b99d@pumpkin>
In-Reply-To: <20261114110531.26138-2-blum@kernel.org>
References: <20261114110531.26138-2-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 12:05:31 +0100
Thorsten Blum <blum@kernel.org> wrote:

> In preparation for removing strlcat() from the kernel [1], format the
> warning directly in WARN(). This also removes the temporary 64-byte
> buffer and the sprintf() call while preserving the warning text.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

This one actually makes sense!
I might have used 'const char *' variables and removed the ' ' before
the '\n'. But:

Reviewed-by: David Laight <david.laight.linux@gmail.com>

> ---
>  init/main.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 93a2b12976f0..430b403e0880 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1397,7 +1397,8 @@ static inline void do_trace_initcall_level(const char *level)
>  int __init_or_module do_one_initcall(initcall_t fn)
>  {
>  	int count = preempt_count();
> -	char msgbuf[64];
> +	bool preempt_imbalanced;
> +	bool irqs_left_disabled;
>  	int ret;
>  
>  	if (initcall_blacklisted(fn))
> @@ -1407,17 +1408,17 @@ int __init_or_module do_one_initcall(initcall_t fn)
>  	ret = fn();
>  	do_trace_initcall_finish(fn, ret);
>  
> -	msgbuf[0] = 0;
> -
> -	if (preempt_count() != count) {
> -		sprintf(msgbuf, "preemption imbalance ");
> +	preempt_imbalanced = preempt_count() != count;
> +	if (preempt_imbalanced)
>  		preempt_count_set(count);
> -	}
> -	if (irqs_disabled()) {
> -		strlcat(msgbuf, "disabled interrupts ", sizeof(msgbuf));
> +
> +	irqs_left_disabled = irqs_disabled();
> +	if (irqs_left_disabled)
>  		local_irq_enable();
> -	}
> -	WARN(msgbuf[0], "initcall %pS returned with %s\n", fn, msgbuf);
> +
> +	WARN(preempt_imbalanced || irqs_left_disabled, "initcall %pS returned with %s%s\n", fn,
> +	     preempt_imbalanced ? "preemption imbalance " : "",
> +	     irqs_left_disabled ? "disabled interrupts " : "");
>  
>  	add_latent_entropy();
>  	return ret;
> 

