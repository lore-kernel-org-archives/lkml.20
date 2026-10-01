Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608693EA97E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853940; cv=none; b=ZCYbc0KIT2Te/DH3zxIQpzgdU5PyQSP8lYe9jfFchsTpkZnyf8sqmQO1owlDwpBDP+eYnmG60jcV4miUfAn+JNyyHnQ1AEfbEt/fQAIdxG0bxLn3WY7G2LTzYDaUb9Aty//5dEW1I1p9N9pgYvnU27BEhGSiWWZENjB8YyzAGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853940; c=relaxed/simple;
	bh=XXJE9lpazIypG2rFZXwci5NBfeM4Y59+X+ByKH1vibk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0dudZ7ZoAOjC2IjKmoZg8Lu9qtIrMATTRCw1TNYrhXfYfKDQSgIZdNY8nETjvHL49h93OxIW0gnob1438RfLOnwkQgKaaAg+5uol+5HiLqj8UIL7605Y5HfGCJRrK56qPDnKvKHz23cogTOAp0iS51UdZzVAZY5bvB3uEjh5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3Gee/19; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3Gee/19"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a65fd1534aso39611771fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853936; x=1791458736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=g3Gee/19RPfSdyTFbWWXQO0RoOO4EIor3hvlWIbKklIDbxS1yJyBW0L7mQgN2ONPE0
         kkgdm9vGmd2rvYC8qpw2tmnpeQiEa0yTt/9muUKJGKYPLExveRZpabMfLDUFhwIcChDj
         cUu7drY5NT0smhq52LtvW2OJoXr61tv3sn+2UlcqTYFRSsBq9+lrnb8NZupGGMGqgWCV
         Q6T0+KaMguQW7PuWvzcE1LHifkirUt9J6YQKeQXbVR5BXwhC1C3Yn7iPhwz/kHXPMGJ9
         qoIfyJ9AHPJSvVRESuMFSB0l9CLFC1M9/YrYbHkvBcAuRFrm8R4aHlR7Wz0rzaw0FYD+
         SQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853936; x=1791458736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=r0iSdg7KXwcOWjmWilsFDxgLYejShBsB8AgbWQFCzE57gwEfgOhHedIM/lNhElPlba
         3n9RrYfINw/DGBANddz06m7+WZHiyl4/Q+bRvQhS7JtkwlN38+jLRhWQ7FU88vMrIy8H
         OdnZx8dfieUoKgR7eW669WJYj1kDGy5pTg01TKKg5kS6hJcD2OElESfyqCwKsiBtJu3c
         +sEx3vLaJMVUNExZf8ogyw9z8VYcOMdYtw3r2AqjPGIC0jXrYDIpc1STLyiQJR4ABxmw
         +JGILaxoBTfdp/GKoW1SVB3WUgtN/CiqUkib3xi8ZmMDcn0aukBgx61/hOBeBVQeYbAL
         oSOg==
X-Forwarded-Encrypted: i=1; AKwUvBxT71pHi04eziHDQgct/tA7pmqjpDH68wTfTstLbTdIqGG6CX4JHOBzT2gsNEMAN6ts/G65S5CTvzTkn60=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQYLuB5sdSj3I57Mvm2TRl1GQ6JtnFXbEJufPq0nLxozOPkK3f
	a+mNSaC3qjTPGE94hlaoUVPOOIXFRTJB9/YEq6hTb2szJB7QZu+DhYng
X-Gm-Gg: AYBFou0srQomXs9Lp7jZUCU6zuUtjnb8N47ZSA/vL5BGWBBr18uxLcBv0jTTxfFzl4S
	l2RBeqsRkuUNLqtMBgIrnT415AGZfp8zvnbAw4rVpn8F6akAKLPmwYC0KxwpUw7ZKsnHoPyOxGC
	EfEDRD/bQv5f9PL1MqrA4vi3rj7lNSB2ea6TQE85wfR87+xQU2pqRNxYHt95OeC+gshQAH2UTzd
	PTSFYb05CzDrI98DfQlerH4rnt3Trqukj3BOIRHmw8h96SqxWb6t0xnVABMyivoNf2wZcJFZO5q
	4cgwc6n0Bo/0KkQXhu2NjCupWtRL4/9mp9SsSi8jOM/wiHnGQsz64DXBQ95+t8Gtr9JRKZVHfe7
	Vp7tNtxA4zn3bvL0sOjcwNLu09iGGXeMlc2V07aXiw+dJrY73OlZf4Vw3RlEmc624f4rY4oIWxD
	Y+GJyLqwYG7z/OFJAatAfFJYQ/Tv7YWFkfE3sHIXRT9Z08/ifka4Ox1tU7yUGhS7yKyGOx+pnMC
	leVpFWz82rrYxvsCrS9mpdMbzZCyTWkAwFbD25b1sgZORPsfbPI9tzE8X2hC2ymdXcMDA==
X-Received: by 2002:a2e:b814:0:b0:3a7:6f09:76c8 with SMTP id 38308e7fff4ca-3a779251d2amr9219071fa.24.1790853936130;
        Thu, 01 Oct 2026 04:25:36 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717bd2a0sm14889991fa.8.2026.10.01.04.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:25:35 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10 1/4] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Thu,  1 Oct 2026 14:25:30 +0300
Message-ID: <20261001112530.14594-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arzl4DK8vhP0g8Hg@ashevche-desk.local>
References: <20260930100158.957977-1-zoone.rupert@gmail.com> <20260930100158.957977-2-zoone.rupert@gmail.com> <arzl4DK8vhP0g8Hg@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 30, 2026 at 01:35:12PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 01:01:55PM +0300, Rupesh Majhi wrote:

...

> > +	rc = devm_add_action_or_reset(dev, dps310_cancel_fifo_work, data);
>
> Are you sure it's in the correct location?

Yes, it has to run before the buffer is freed, since the work pushes
into it. devm_delayed_work_autocancel() goes here in v11.

Rupesh
