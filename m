Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8643672A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361388; cv=none; b=IAxxtNVDllxx9c8xAJxN/aRytDd7tLgZEhkm0wFEPwJFSMMhqvyWXH72DWuXgLozmh7BHmrZ2Z6L+PXV6IO7qO1OtqdVvS/EFdcbTKI7m3xb2OpzkJegPbJuiwAJJBEmcTZmXCDIYYijK/hqF0ii7ewk/ZFpOEtrJoQ0+6sYWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361388; c=relaxed/simple;
	bh=ttsxstSQkiFn6W0emOQF/sZm8xB1JLtPixjXhsyDNfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yr4qdOMb5/T+piG7h4q9plPfseeKTlp9H8fpKTRrPQFtjO2gtxzAnfhpM1BvYxryP0RS+x1fTOHuvdeDuJL6H/0Im95YftKZWRKLduGcdrm1G8SkZ88WwPDvCfXIt/y6zuVzXrekF8vHS/nx6lloME/2A+/mKaKUMFW2XFTKc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7BeRZDo; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7BeRZDo"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e820df9dso994695e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361385; x=1790966185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTI8JOYIkeEhDhIISZUKJnYZH98Is2I5ZYdQTGS/9Yo=;
        b=V7BeRZDo6Vp4XTc2prehK/dsX7sLaeIjxHhxVr3J+gqjCYTF1hRLq9maWEJNURHm9+
         2vBFX/DSHOuYIw9N1HdHKeIF+9ca3rz2AG8kbd6ZWvRwPGKJL3LVIcIeQd1Q3efqJSs0
         4L10PWP5NN7ypTHJR1e+9HVfR1A2lcxqeCUb64xA9mdngVPbn0XyK8Lk8lfMv7Z4pMgR
         3sz2vy5f9xlDhvPQg+58a9PAYLShLfi+rMi65TXQekpfBFzrSLeROqWCwfPQKL3k5Kev
         udIOp9nEM2R7bAubpVRFknbUrsghPtCEzZBSAgFQ8oW9dz+VHBBmd++gD4dZPwRWo3/b
         L5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361385; x=1790966185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTI8JOYIkeEhDhIISZUKJnYZH98Is2I5ZYdQTGS/9Yo=;
        b=c4Q3InltCWpiDjJycv1pETDm8ctmTRjgFb9pYUC4fFWNQ4bSDHLxEBDvv/O/RL2xKf
         7VMW3KM4+JYIaeJrpwT8paLSy4ehM2BBQVdRzHalfobQnWK1EIU1pof/pkdakd8vRkDa
         wwG8MijvqNJIwwqaaS0l7hg9v6B5y5docQeAk7SMb2Vk8i2XETIOC/oxC0RReXo8vPnq
         IJYvEHsHMkH5IrdggAoOQbODg3Gc74W1v92um673QFteq0B3elCszySTIxW7KP/KomjS
         a2U9d8d64wbe+Ml02yJ69/Vlx5IK9af3/kjvBovhJBPp9TiyiBiJUIeCICec6hjykQAf
         G++g==
X-Forwarded-Encrypted: i=1; AKwUvBwNzIqXNJsx5j0tElX/DYflSQYNBku94rCXGo3Rj4k3ZPZ1mp1HKEFq/GcS/wjcEannnJDaQu5EySPOVek=@vger.kernel.org
X-Gm-Message-State: AFuF++kiLczocnz5Nqu8a495YFQECq9Qpr8eXWicluhKqzP21F2DRQcf
	i94ViSbjEjNm7h12gPsct2EGyTHMupSubqla+3H4JvzCQHaO390bbv92
X-Gm-Gg: AYBFou3bGcbRn60CHqlnq4GhTzcKZ03J4USyC2xeDTVVl2g1ogu/jaCE2PSLwjncoRe
	y7xTTTa/n7H0ZMjTWx0CmlgXZXk4EU0jgnwkKz6NXMbVSS2uBZS3yGL8g0ZNdV4FBX6/DTPOLSE
	eMwZ5QP+x2ujPbYXD+sBFGiZP0i2dDQ6Kh2OwUZdY0BE+bwjLvLDLgkQvGQrocOdU04WQ7qQfNK
	EgkQU4znQ1lqKhIYvybVhO+Es7tCMInMcjDIKKIt7t//zFjzqTER3UgnYezu08EAkdQ1OQx50B8
	Ofp+14x6t9Wydur79QDRQAM196xSHHRTSkfK3SU7FewLSto7pL5PbM7JcgEVhHI2KeU595Xysqd
	ZmCZl01AX/TXCl3wAMjpY6fK0AvEoUAp03d6V2gapl8Nl786HnmAWTNHaX+MNtgig8J1fvI1f0n
	ub0OaNrSod+CWhCouSzAZwOvfiy15X3NaqbOO4BhWTOOeO6g2VrSsAkxZ3TrAr/K3cKGCP5YD/B
	uQF0T7NFXe5AsxMPpKM2wiVX8habfzdv4R1AQVUJgHcf9blKI+hREOda+64dGZsIqJnuKik5H9M
	kPRDRw==
X-Received: by 2002:a05:6512:128a:b0:5b6:183d:2a72 with SMTP id 2adb3069b0e04-5b8df092a18mr2193674e87.18.1790361384899;
        Fri, 25 Sep 2026 11:36:24 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e85e560esm649366e87.73.2026.09.25.11.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:36:24 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 09/10] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri, 25 Sep 2026 21:36:05 +0300
Message-ID: <20260925183605.129614-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ara694wYo2qwBo5j@ashevche-desk.local>
References: <20260918122517.377565-1-zoone.rupert@gmail.com> <20260918122517.377565-10-zoone.rupert@gmail.com> <178992913316.706584.1446996024286841775.b4-review@b4> <20260921183106.231972-1-zoone.rupert@gmail.com> <20260922005347.069c490e@jic23-hlaptop> <20260925175816.75842-1-zoone.rupert@gmail.com> <ara694wYo2qwBo5j@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 25, 2026 at 09:18:31PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 08:58:16PM +0300, Rupesh Majhi wrote:
> > context_lock_struct() is needed because clang rejects the existing
> > __acquires(indio_dev) on a type that is not a lock. The header
> > suppression list hides that today.
>
> But why you can't supply the full lock to the __acquires()? If
> to_iio_dev_opaque() is a macro it should all work.

to_iio_dev_opaque() needs iio-opaque.h, which drivers do not include,
and pulling it into iio.h makes clang 23 crash on the container_of().
An accessor works though:

  struct mutex *__iio_dev_mode_mutex(struct iio_dev *indio_dev);
  void __iio_dev_mode_lock(struct iio_dev *indio_dev)
	__acquires(__iio_dev_mode_mutex(indio_dev));

With the core helpers locking through it too, clang checks them as
well, so context_lock_struct() and __no_context_analysis both go away.
I will use that in v9.

Rupesh
