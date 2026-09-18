Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287604E2F0B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734261; cv=none; b=Umy/1uH/ba7u019ZE4VDNxkyqct6q7W5Y++Dihyp01aMRqahmj52BP7BsOR5Ak0Pc4A3rRz/Pai+zB24A4HBU2RrMLZY7cc2YS0n75Wyd0nO6jV2lWIyVb+87M4k+Shv+YyxcFYQAib4EjgHkUQi9Qi0oClY8WZIy1xJdWhaaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734261; c=relaxed/simple;
	bh=maSmLJEiVW4orqk/72EUoaWvFnMBkWSya0UZSf7eKGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioy5Iy782L/iiZtqhhs7oz4Veh/+r5debMbpsTqXSWvKZbrEbQ3hBt8Zr/MCJynKzo6isCIEZo5wjkyOeKDeK1uGIsT6tcfLkHYZIW4lCCS5rXyDCaq138D8CDtggHe0c6TUig0EC0EZJIK0DAXn/YTjO7n8V1RksIMNzPB2LYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUJx3HMy; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUJx3HMy"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so688739e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734257; x=1790339057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maSmLJEiVW4orqk/72EUoaWvFnMBkWSya0UZSf7eKGU=;
        b=VUJx3HMyXCIBk6RYllw3W4Afd2wXncJuwFqMCEHYt603hUoVCZIehk8mbFG7IWspyy
         QExjOhiLNRlarTD/tjJQKy4rGRZueeBrLR86Q2TztpEGLnhnO7QQihtRYqrzv6r6yvyY
         RBkG8bSIWltDa901NGM78nldTm1HzCplU0XztkE65pdt+IKWDMSkY/HQ9k2X17BfXOtk
         GmYqgkbdJN5A7YhhwHyjCZjMsJebdaR+m3qDphgjVoR8iS8TtO2+xffK6Vi1fJOThc86
         PEg4IPW3jxUrMk0jjK7Ply8J5q6Be+U+hGMy0ULcA+m3aawKqVnrITyC0wr1wO6O4MLV
         +pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734257; x=1790339057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maSmLJEiVW4orqk/72EUoaWvFnMBkWSya0UZSf7eKGU=;
        b=macwTWPCmABOrKM17EZm6xYvt1cF6wacK4wp8M+AfiCfKSmLWtD+GNx8Q8UwjBlhGJ
         fD0ZE4dxUqIlAcwS/y9uPULcdfqsboZaHS+psc79eZ6vDBaDnYSYPqEoBZhDoA+3GaB3
         Rf13AXeoRGc0OgO2uYyrKZ3UXcLOAp//7nlfHcZO4CyUZpzovuEnyR1S+ngbqgZJ/ofW
         SzPCqYWIpyXWA4HNYOS8FPbYkSIMiVU7eAnRUmELLXnY6OK6gm4h71hsABrg2CIzlyY6
         jrgWdOBC6NGPaynRZndDP6cbwEB2rB9GSysgxVK9oMdsic23W/NSEyJo0oVGbabcGLFj
         Xo7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpFvral/3tss3QbEtjuQR6gtsr6pVh/tFgPxYZckxOSQuKF59lg7r8YOKganxMjDPhqozP51rokONGXwo=@vger.kernel.org
X-Gm-Message-State: AFuF++mp13y2Vjvo0NFNhZdZ0foxz4dBuOpaUR/AVbbY0hycXxEkUG/p
	rfmX+s71YM26xPUnVI86m83fVfitnikRsoyrsHank2OTQ8b8TOzPvkah
X-Gm-Gg: AYBFou1V+Cp3GDTG/1JzQGnyHuIgFniWXo1srA9lIqNOrG2YCuK4PaffAByGvsEpJr3
	7l4iSUltZ2bGXv58+Y/cZNgiMxCxElNsiClHSlqK+RNmu4QdMJd77EpUFTg7FMYtbOdrknRAqwp
	GTlEBSqg9QLLHn2mPa4icxTZEOL0Kj4OSdgVL/EE+6U8Ry6EF8TOl9YjZgBkMkETLQRwQI/4T1t
	0yTW5QaR54PS/qkLwaFdhK2xvuciF23RhPfTSpO3jHC7RqRa61tJstYUK1eJ8klL6GXB71c7kZ+
	Gklh8FaBBfkpPz0W+tHKYDCJKxtcpx2LrlJqwOXQ52QfUhBmTX0lYApMwgKbjmAETS7NiIQvT2Z
	QvC4y4XBtw+DrUc5cMfuKx6xP6tbd2my9phnxMcotDMEshuDRqFlVkRngDpUcRswHQyFfm/H4GJ
	WtiZnc+4+M/T79dmrR7c+ga6/lX2Cqk6fNRKUmf/pERt40zvY5xrq/DqIaBNyrql9uhDNgXTmRX
	vJDCiAjHlLifmCewc4WmSEmU2q/QaWRTpfFcsM9YW6KQ6s0Ktj6Z+gAio1L/umoZVubW1vClhGn
	04CD
X-Received: by 2002:a05:651c:a393:10b0:3a5:f06c:f897 with SMTP id 38308e7fff4ca-3a5fc0f47b3mr3286371fa.28.1789734256702;
        Fri, 18 Sep 2026 05:24:16 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5fd5da086sm4172101fa.4.2026.09.18.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:24:16 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer support
Date: Fri, 18 Sep 2026 15:24:15 +0300
Message-ID: <20260918122415.375211-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178813888150.2788519.17461592150162820073.b4-review@b4>
References: <20260824201203.396651-1-zoone.rupert@gmail.com> <20260824201203.396651-5-zoone.rupert@gmail.com> <178813888150.2788519.17461592150162820073.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 02:14:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> As this isn't filling in the timestamp, I think you'd be better
> passing s32 channels[__at_least 2] as that final parameter.

There is no __at_least in the tree and nothing in IIO uses [static N], so
it is a plain s32 channels[2].

Rupesh
