Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167173ED5B9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853969; cv=none; b=E0YLV9wWcE0dK8tt+RJjRtRfePNCAQY58RsRUnTW6A867jFzklNHb8vnAmB57V7sXM/X1TbIIuNuMgyEnKlRcrZtx59TUw/lM2NaQa27MXEGKgzAcJOI4we4cFuKeWNJwdLW/p91nTgt/M0sRfudgW9KAGb8dmVm/P/G+bCwxGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853969; c=relaxed/simple;
	bh=XXJE9lpazIypG2rFZXwci5NBfeM4Y59+X+ByKH1vibk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvxJJeZkR6EOyZXmSmvInb8+V/kTFwuys9I/o3naY3FKnrnfndHQW5XNpaY8EVMIr+CPsWpNyYuUwp/BRN5WxJrpgW156WG7H4O6iCVivY/fOgrvb5cL+TK+Mm6KnoffZI9y7HMgATlE4s913PuXYsrfprYEAo2SMwRqpZ3zW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjOJG0G3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjOJG0G3"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso662607e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853966; x=1791458766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=sjOJG0G3TgKU0py1mynpA5NVOk8Fopl3FoYPDfi7Nf2OCvGc2jemPwrTfIW4MhvEGD
         R7pzkkDxIaSrFCQGynLmQX0rfBTwDvblmqvqS80bvnjWrRSESYTGs4swg0wuTGB4wDvH
         3bkWaaH528FluGLqVWAFlF09Tu4az827h1nmJ3ybz/kAIymYfAmpRbE+c5tWSzDS0kIK
         qHfFqspCXbbKtvAN9Nn1aB64jiygAMdeKvYsPokNGv+W1/JB0d7ENx6TB0ho3A0SyL6a
         BDJNwTa3JXWHfwwIW1V7DzscEIdy6lCR5adfa47a/jC8C3ly5qqkyrqnFQvvdVxpUago
         Ob7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853966; x=1791458766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=mcPXF16KTggRQoMLi2bhQciqhMTd5aY+Mj3t/sE1mzteru2Vv9MglbJpLtgIbVJ3YQ
         sNIyx/sA6PQHYZTUz+0XHVXWjsS25CXFXF5AwlVy6nPFOeRnYgybPet7ONM5azzTvikd
         nm6xpGnnfoG+kihzUHsNgxU7PWVvBy5zhRx27PynCeFhawxijyuoKGtKjF+4qKXH8Hh0
         060OaJBDeimRy3UsBWSoe3sh50hf3T4ASntkEE0QzR1tO1jhnprZ20ZVpysXC8CXwfRh
         1588H9VxgCN2eW4RuROUW+j0hKNoBt0aBIqI72aLPuTw/u/vDKrfaKIdIS9e8zG7DhQG
         rfDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwdK+5ecJNWm6T0aH3h0DFOqwh3nIjErNPkXqBPbCiX8Z1QKhPPb0yKWJJjfi7fnf83NU8AoM8RClZMg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy3ucVHNODzYlEdopQO8jUpdj7slV5GaSUe/LojVVQHUF+GXRZ
	yEGIke96S0LuValOOIuTueP4L3/6wM2K8qQIzERAU+cro9ikJtu0y+2Z
X-Gm-Gg: AYBFou3p5wsJzCRzSrRMCpyhMvgwzTemsP9E5gLvxqAjdkRm7RM5WT5aRCH0R9OpzF3
	4kRcN/0RPYbfvujsJiYuErQpzD3EHMti/9tu7yNX5fPJt7HScvYudG5N1Id2PGqLx7EhiuPNnAa
	Z5e4L+3SGFBeYAcYJ6ztJNwSG/bRHpRQQ9B6QenWY0rTx1TGFlzkKBTbJlfCRw5wgn/va1851z4
	yxBGkPhmKahXkTn4ePDldTIcNKnVxmq1jrFyWr1k+dg/LM6ON9vv4qtN0d4a6QGn2GqWw4OnD/H
	GGbzLvPJsO4ntGIQpemoQyg+aKjO81vgtVgFnMeHZkZbRpaktx2QJb0z3UVxBTftqTD84WPDgUy
	swlYggSFw6kES6kazPaxlP55fgeifpDcYg/YZs4vRbL5yYy8F9ojlqY8rvmhYzy1rgakBSb1Za3
	Iv6sbkjVIYCmQ39YRTC/L/4Oqe0VCgyt4O8YI/d3zyn33Xrdq/lbOcbMaFEuXp+ZdhETqVyk5p6
	zBpfp+4d3FM/pGeAR0bfgDqKBnYkRkX3JZFzyrbb9RRJ1LPaMMIZwYiO/0LPYtpBW4QL4ODcRr/
	/mW0
X-Received: by 2002:ac2:491b:0:b0:5b8:f1d6:554c with SMTP id 2adb3069b0e04-5ba433daf8fmr722764e87.12.1790853965797;
        Thu, 01 Oct 2026 04:26:05 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbebacsm649768e87.72.2026.10.01.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:26:05 -0700 (PDT)
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
Date: Thu,  1 Oct 2026 14:26:04 +0300
Message-ID: <20261001112604.15200-1-zoone.rupert@gmail.com>
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
