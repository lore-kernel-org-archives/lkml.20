Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B134ACC60
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163394; cv=none; b=PjeHNKi9SuwgSbOmfCFgvwQn4NYZN4C8iq1EAiHY2w6A/P7v0HhV2Wyedk1qun/fsJVPyyOoIkhwut1geR5BPC3bt4bRgKSC0l80XvGqIInMqB4wU6wFoYiZ9pbaHbcBURuni98QCQ1YUccBnk8lm2/5hEmPZGz3EHGmCWBjI+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163394; c=relaxed/simple;
	bh=PXjfc2GRpQp8nR5HSPX35GWAd6twnDnTEfIfXRHgJKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEy7br8BexGPAm1xm+XgX/eBYIGVlULQyQ9dW6tBroP9BPv90bCAEdKI6n1XvgOu+mI1ZwFyA9BFPRAvPlO3RIt30RyowCCkwXOqhgjthpxMK8ddoJxveojIfrEamcyyUYoGMSsEU1cpSSVEA4o+EgnWE833c9gAecexXvReBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ot3GYfQQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ot3GYfQQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48442ea8f59so889204f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790163379; x=1790768179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FKt7HmZnhPw/E1D+Ih3FOMjjaMfPcZEydJoiOdLcMw=;
        b=Ot3GYfQQXteD2sFGJ4lNr2Bz/l/MG9f7VzPh/Tu+gwvh6K4R6wewnLh9fVEMzd5NQB
         uhqeOBghX+njBVYeWH58+9m1QOJKmndc/khvhLYt19UXsX7tdok9EMvyMOvkVQ7iZ7qK
         Un+YYPWV/SeNZyumpbA0e8Vc4QQMmcPKIwnZ6ACVUHrm6swosMKacys6BjDC/4EtIDvo
         /3PqrvV3ELHr6aa4P1fZXPVmorc1lGMPO8+jxDtlfDIv+H/5fHQjLMdUjsabB6XdMRVU
         x7cGN3txshr+Uro2if8VVqbl+bMVWC3OQuW77yeJ+rkdsMy2xljOMKiGJeOm3aN6nHRm
         S4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163379; x=1790768179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FKt7HmZnhPw/E1D+Ih3FOMjjaMfPcZEydJoiOdLcMw=;
        b=2wp1Dn5QjSJNu9168CVtuEzIcqsaGBflZXOFVLZUhS1mAAKC4e1l8gvnNq1xisVpyD
         e71fRzeHxQJzlf3Qcgwd+zXr0B2Zg7eKLjahg+0ks90tO6Rkq5XtU01S9F6T8vyyxqPE
         hHpxEzRu4R3p+MAItjqYnBOLeXAAkt1RjBq+wkFZurWLLIlxnqZ/zOI5bm+RK5AuzyVq
         sC6un0cT+ypXeDYLLo6AQRn/i9ajrO8OQhLe86IOQ9krjloE1/opQswGHAygKKMIJG19
         APswuz3GruMswYCk9O3x4ze4nznEgUL2y1M/oMKaDph58MGYltYU0fuXxCUEJ0IIhAkm
         0L0w==
X-Forwarded-Encrypted: i=1; AKwUvByhvhg/NUoxjyPF2j3E35fzGqk2Me1WaHuYxfvaV5D/nG45NEWHaE2O/ndZqkv2qDYqf22pX95FZ4XLsLM=@vger.kernel.org
X-Gm-Message-State: AFuF++mXd6uoCNP4pYzX2XKoOYCSD+JUNWT9jaRwo46nUrHvdwyYiBXT
	tI//GInJT/IpNK/8BTDJjPRYRh/3y4oBifEx5DcR8tS73Q+cFNJ8nGFqSB2NByWHSGA=
X-Gm-Gg: AYBFou0NemG/A1N8Fs8IqBJDnu2XEY/zzg77XYfRkbfIwv6i27layUI5OFgqt9PgGoN
	waZN1a+8FFqFY2hPpGIkn5rfsb7uFnm8xF4BXUR2ggZEZmXGfkrE6QKsvrGVou6Qxo1ZJgqlbpy
	QMz37ZFbgRf9W5cpM2VefGazyH5neRIOE+L/VQea6xZElWaWfv4y90i9GsgBd8eD1ILwp+D4vU1
	d2n/eBYT+KS+0PMCFgM5uWicEE7DkhDu+iuFI9Oh13PF1bPCoXuOyFsurcgXCeyW3UjfMBO7WGP
	5iuYs7lsjqCFML4QS2A7YU/fAh/ZPcY1y5ZI71/NN0Kr3P3s+yWiKJH/cE3WXlbk/FI5S//mu2y
	/gqunARJ07hrONJyBwcAEqLSIFvHbr7oo4YB86ihZkXhWvDM3e2aNruNzMynETK7X5ZNh/7SdOG
	PMJKyPhQJx5XqyQ/cGi0zwuh0oXmWA+/GokfAr/uRJdBvGh7vzcZAtBmko1B4eSbsXWuum73ZRC
	QT9RmTOsNhn1W0=
X-Received: by 2002:a05:6000:65a:b0:487:25:71c7 with SMTP id ffacd0b85a97d-48860fc032bmr7430362f8f.12.1790163379420;
        Wed, 23 Sep 2026 04:36:19 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a19bsm6872294f8f.25.2026.09.23.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:36:19 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:36:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: Wang Wensheng <wsw9603@163.com>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk_ringbuffer: Avoid needless read of prb_desc
Message-ID: <arO5sVjuy80UsMkp@pathway.suse.cz>
References: <20260922062520.248439-1-wsw9603@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922062520.248439-1-wsw9603@163.com>

On Tue 2026-09-22 14:25:20, Wang Wensheng wrote:
> Since commit f244b4dc53e5 ("printk: ringbuffer: Improve prb_next_seq()
> performance"), desc_read() allows @desc_out to be NULL. We can drop the
> local `desc` variable in desc_reopen_last() and prb_first_seq(). Also
> update the comment for desc_read().
> 
> Signed-off-by: Wang Wensheng <wsw9603@163.com>

Great catch! Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going to wait few more days for more potential feedback.
I'll commit it the following week if nobody complains.

Best Regards,
Petr
