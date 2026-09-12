Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC935EED8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174778; cv=none; b=Yb9ZZMO1OxrOAvL5lAE4daZkRFGPPZAOhbJgjpLxwt2wncz+oLESlrCg8uOiwH9QaDyRLYfGbdlhJA4pUFtJnLJvfs+AHCMeO2wBad/Cs/6J/9val/xfseqtWsNoVGxOLc+breaXb98Xs2/Dd5gS0dA3OCujmCJB0WI6QjBZdtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174778; c=relaxed/simple;
	bh=upcwOqTksFzVvwY2xLbduvinMYOV/rJpZ5SFcW3Cl1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IItnBuXfL6IgFx9PWZqXhvhMijAsGfvRNj0J7A9/0ID1oiBeiZQokFdxVZUyl6oR7Sqrkpg9T4Q2g7casCT30vdr9XzvapCGTDuiUpujVhtqG9OKsaqUZk6WQFN98hVZCvslCGnP4HAr36GfvCvNM1WHs0QrcnmIEA+TIeNdhMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtHmTyli; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtHmTyli"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so86244a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789174777; x=1789779577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upcwOqTksFzVvwY2xLbduvinMYOV/rJpZ5SFcW3Cl1s=;
        b=KtHmTyliSUk8JyM5npU4YUgxuNqtQ+hKntmtAMNgMjq6qhbleRyXdCEK/EJKLVebdt
         4ZtOHWjQOyNLzuMMVBIFedgCsTVZ3iPLAg68MDdH/p9STPZXu6m+0YsJdKc/r5nYkbLV
         vjD/Kpe9vMykGj/e3TJ2iqUe4tE0W5nWRYajpyqAEwE6ZQNKLSTLgg33IUNGXcGEhNdU
         64lwOXLlvXrvIBk9HyOgJbdMsFaLihup4KbX2Qhwzp3CoN+oztd8aF7TKsd3EMWD11Jf
         rH+nkK18lEcdkAzuGUHaiYTvhsRJtzbWVRo5hghSkFyqnNtt7z6RLRG8I4KT5r7qGWfL
         4jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789174777; x=1789779577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upcwOqTksFzVvwY2xLbduvinMYOV/rJpZ5SFcW3Cl1s=;
        b=DzKOldYvwEx5o2MnmXeu/sJa8ZN5WNDgw6ar6nWCC81WUJKO/elCR3/RX5o7kZ9QdQ
         j6xt0VrKzwn/1IpwIzOdvWRFO3xOQdUNqiNZDKxFcqIsi10Su0VEjcQWaAK9fnD46N6x
         bzg44QLiwWVwPjqOaIGFN65NvlXDv8wZXYVGX4iC4fB9g3SIq2xm49p0WRDrxOZIFyJ0
         6b8bcE6tcYhvChMplK16104RP5XB8CYV+Es9rNzF00L8iCflt3fZIEDaKhLw7vaXHMhZ
         j6KD3uyxJgVa0kpDaiPEZNs73V89QPK8I1FPAYrpjfjMxSqNBMG3gwjMs8UmNPt5/JkY
         FAYQ==
X-Forwarded-Encrypted: i=1; AKwUvByWtqBLmWfxGpZzZWIUiU/b4hEDzeOLqtIwWTwm/TjQgUIqYpPhp4IvWJqzTn+2MGl3uRnQPIGmMa6Olrs=@vger.kernel.org
X-Gm-Message-State: AFuF++n+0UqCsGBP9xWmxdlOtMt74VYgpTyVjUa8W7BZdeGUFGitQ7c8
	IjRsYcUqCTTuVfkUAKdUJK+pyI4v80rk/YJGvcW5xaOSjq1jLW8HT9pV
X-Gm-Gg: AYBFou2baotx0/sBSKXKRxzwjMmLExk6+mfv68iq0sPLvHSpHTPFXxJfbJKqs8havNI
	txhK22d9fYF9+skXThEBkmj3Py13wL4Uidk+YGelVijwRkkMWOhDqTX+alxh1OzzrieUvDd6/wy
	1w5dPs+7XSoqAZAEDbZPAPy0hqQlSsG4E6kwfjUGBAlhFiPaoQtP10IhN7IAxdbJZwlfuJYBO/c
	nGcGjv84GU3rrinpO6SO9SKMnzPEyZYsrzQcwnMd5/fDFYS9wcwxEYTNVIX06Em/s7K5/8Ee8M8
	qyv0NgQic7x8m11vFe1tHEYprBpsN8LOZF8rXWEcwg+8DgDuR4yXYUpEAU1a/wktilEt7XKzSXh
	ELAKnnShZRrfNb/sKGxGQfp8Vs70yC5lFe4krSVUTr/hdE2XCO2qlWRQgdCWDmqILihrR37PUvQ
	I2aE52dmMBBVu5eippVmn1nVehOenycaIYH+K5OnBNgy/RnXEq1hEGeJbetc84UbKzNkGoXfJ49
	iaMEESuytUfCH9WAc4zA8k3hZsdmySIkvp13+fxkzJ/GXnO8E8O0o7uabQq+kVfJE1QtOmn9Ers
X-Received: by 2002:a17:90b:1a92:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39dbc6f0686mr1143950a91.23.1789174777016;
        Fri, 11 Sep 2026 17:59:37 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm233719a91.0.2026.09.11.17.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:59:36 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	=?UTF-8?q?Ricardo=20B=20=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Mykola Lysenko <nickolay.lysenko@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton failures under BPF_STRICT_BUILD=0
Date: Sat, 12 Sep 2026 09:59:30 +0900
Message-ID: <20260912005930.2080724-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c2235ade283e0258e7ab018bafcc99b32a63f586.camel@gmail.com>
References: <c2235ade283e0258e7ab018bafcc99b32a63f586.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2026-09-11 at 13:24 -0700, Eduard Zingerman wrote:

> Why is this change necessary?
> The whole PERMISSIVE thing is quite ugly and I regret not being
> involved in it's review.

I hit it building selftests against the distro kernel's BTF rather than
one from the tree. On Ubuntu 6.17 that vmlinux.h has 5 __ksym
declarations against 269 from a tree-built kernel, and all six libarena
sources fail on undeclared bpf_preempt_disable, bpf_preempt_enable and
bpf_stream_vprintk. BPF_STRICT_BUILD=0 looked like the switch for that,
and the build still stopped at libarena while every other skeleton was
skipped.

The patch only makes the three libarena rules consistent with the other
skeleton rules. I don't have a strong opinion on PERMISSIVE itself, so if
it is going away or being reworked, please drop this rather than take it.

HyeongJun
