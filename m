Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791EC254B03
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256933; cv=none; b=rP1t26icxns13rg6PEtC3Qb9wLwIIa48/wV2JbLXoS1sg0dU4G8Bj4tNqwOy+YSAyUD6ONoJeYLUyaOG23gIXV0y2KMpl/hqvRSFJ3HNOa+jZtG5C/2IE8rxjj2cVKkL5x6bDYCDwcaVGnrS6T1Is3UfZxYl/5Vmrt+R0H/twA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256933; c=relaxed/simple;
	bh=9jHCDZ/vmqzaSvN0q5leuZpLt+Evx7ZwCRLn8CHMW/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bs5q3cTY/JmcyadpDL2vCK3DNtLI2xPg9z+nGUFe9r9O64MJU4abbTX5DJDU0V5JfmfRsa5h9j47e3340lerxb+EwRK1G+y+KQgxQOOtaWJ3qe/sQzGNWr/CMh9tbnLYhSylxFfRGeOuokDn2IzR1N3SVBl+kE8dYzwMDgbg/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=K9YqXg6A; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="K9YqXg6A"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so2063909eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790256926; x=1790861726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkdVKqAOldSUnsrajVaqKWEtpzNt/N+Ojyt/04+6CGo=;
        b=K9YqXg6AWsJs4i0EGymekQ+8hFeQdvr84ozF3csbeaEi0UlUFQEQOX7lSeom6py/nd
         A6PaacgABGQsBD8FNV6YJi2wqeuSNMZhWsVf3CzTYus+7wZWmMVWFzdaXC13TDfvRg55
         cmS84RbBElPpOWn4R9EjylSvdym9uHtJ2qnrvyP8iinuYXynwP6g/NJllb0H5Ss2A7F1
         SmVdi47z22FG2PGxHJ6Bv80ofybnli0Ho8+qbf9Qf/taUxMlaFzuLV9BPXXBvUzpLkgG
         BpMSk6Ffwd6TR4vHAqCWjLuGQ1HXfFEJHiQGc3MKncl+UqgKub2pEErc3IZofftCsK4+
         X/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256926; x=1790861726;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkdVKqAOldSUnsrajVaqKWEtpzNt/N+Ojyt/04+6CGo=;
        b=jcG9GdPeFdZ/745BIrEbF6Mp2sR6Z/ZH1ecv3nquKKoFpDrqgOUtNX9uPGwrLfECrq
         Hyj5sy8bfItx2/T/FbQ3EG9xOw/gUgqQoGuaFT0ZsTYzDFX9Ppr0fXbloy4hAYeScRvU
         2BbEAZTi1vxR/lwYBW5FMQ/et7z773b/3ReteD8/a+4FoVrP1d/kpQsuFGILiX4DYN7Q
         ZR8ltvc+ijD3SYneEQ3uyPU7vAIxm7OuKyqji+5ZuECyezLlkI/MY2S+yb1JpfD2vJBR
         RMLXXqAdc0f/FdbYriWwZKjZllU9jZfUqVofheHnFMPDrr5aGFqllKI3dhZmolmrArQt
         P3fA==
X-Forwarded-Encrypted: i=1; AKwUvBycI7cmWa3RvQ7d4EBxVSRI7TqJnxMA0p2falYjrZtj7Gq9B/yHLxfh1iQW4FoLWw9yK3GQJsCiNyYD8dQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mMU2ZpGB88ulUFKkn47jfYjr46WRYZ+ve1KVrhW3EVrd49nYTF
	oLDMGZcyj74g0pzULb4dWrfkSywKV2EsVSwTrhjlmj18D7DYNjd5eKW8xx8a8TRlJvQ=
X-Gm-Gg: AYBFou1ilLzuxh7z1lVMJINS8KvxAKxzXvrgJq0U5cK2Iv8413C/xlmjUuftj3mRFAC
	0cEFOxE0PKIvlZkkl5QgnedTP5zItrKleYMqvqKusFNAB1eweSrddOthb1QHHZSym2QiMrN0Ewh
	9SEWGgoJe1cNzaSDJSVGbqrYoD50+tWK6IQJVwwOogLFKRVkyEbKw5KS0/6bnUbtquYuVIV3JIe
	+RfD0nB9DsVVoxvwGEbGqFAAEZVixIO8c19CRei/CB3CyrI3vL8uZKUPE+G2GVUS1NBQL8jHxZP
	ImVpnjMSHR8g1a5sCg7XECgcx4nQkvGxN3yONI277W6F030NKAo3VZwxyQYVi3zdtWKXsPVjSHd
	WNJoPiq2fIKAE1oxur0zoJpvYguTgeEY2pfvmkkCKnPQnhSrZvKXFRJstplIMlefIzgv7lk14Rb
	C0LTwisHNUCHwsuLtiFF61IGbeo67Hmfh/RIuQUEDD4EHPHjmU2BdN8hkq4hlTW7LrDN9GfhfFg
	IG8iJJWc/Xb2PCWwSI/C9WkXYVnoRaV6jSxMq5cUDfuWFMi2n7k
X-Received: by 2002:a05:693c:8381:20b0:33b:bd89:26d1 with SMTP id 5a478bee46e88-34004c81f1emr2342532eec.12.1790256926408;
        Thu, 24 Sep 2026 06:35:26 -0700 (PDT)
Received: from xps16.local ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96952605sm14382681eec.22.2026.09.24.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:35:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars.ellenberg@linbit.com>, 
 =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, drbd-dev@lists.linbit.com, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260519203057.1340528-1-arnd@kernel.org>
References: <20260519203057.1340528-1-arnd@kernel.org>
Subject: Re: [PATCH] drbd: remove unused drbd_nl_mcgrps[] array
Message-Id: <179025692530.320427.942841012071872902.b4-ty@b4>
Date: Thu, 24 Sep 2026 07:35:25 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 19 May 2026 22:30:49 +0200, Arnd Bergmann wrote:
> After the rework, two files have a copy of drbd_nl_mcgrps[], but one
> of them has no references:
> 
> drivers/block/drbd/drbd_nl_gen.c:641:42: error: 'drbd_nl_mcgrps' defined but not used [-Werror=unused-const-variable=]
>   641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
>       |                                          ^~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drbd: remove unused drbd_nl_mcgrps[] array
      commit: d431e03d831c043707e22311c4bdea1907166c34

Best regards,
-- 
Jens Axboe



