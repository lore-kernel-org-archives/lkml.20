Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEE4375AC6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422382; cv=none; b=Nj8uLjrfnZy2AStXlsmTaPXTC+Dx8A0TbFUhcyRAo7zr+mCKA61RJZgQFME0VlKHsXD7S120/ChUP6HavTki4K82/RNWGl1WuRqLqZbKHMGP+XztKKLYC8OeRkdC7ZmPvRjM6pgBPNDDRYyLbtTT+tyGf2CPmDmrOXCInE0EG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422382; c=relaxed/simple;
	bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJRuKq25E7rFR1hx3ezaO9KARf/yBDLXz7QMGX0TpD/29t20Js+nXlOnYqs/rgO5KHwXXnfBEMg6PAhMusXW5/z+KxxhsLE59+wU0FiQxv7m7Xatck4CCgzKnawUV8MInnLKbT0EgQNtKl04k8QM55lRNNrIE3qMR++aEXH3UXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzPV10l+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzPV10l+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48584dc164fso1137f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422379; x=1789027179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=CzPV10l+p2sjcseqG5+rISj6wSfljw507YRrEiZIX/nHDmQGSB3WF5XaKAVlCemYmI
         VEM3/fTF/D6cvRSVKztO+1bnVuq6uZb/j2bm32d7iqF491GbVniXyBuJTXp1Y4wlD9xa
         iE6HGU225t4pgBGNO6eFtEt0Im4ddnvD81bSSE9B9D9R3TDqCQVVVEfI3XUK7fAXyYVy
         2kVGbzDEUdWye3zPwoaBMdqCEZBem+ukv2wBcqWX+lGuQfigWfkDfOViIMKFflNjMld4
         Ur9TaNVtQcl8cTH9Yg/5iKUZ2+xfyNcWxm/q/9D0B6UEpW6eQSXrmkfgIFCAa8SXnTIc
         b4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422379; x=1789027179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=VPBb4hrGN1zwxkPzr9A7IuGMAe+VD7L9DuS2LQbXtdpTXzvkvV8BaYFLSfgU7fz94n
         5jCkejEtGiCOvTRutWiz7Iqkolu3pq8XXPHAEGR9tKdw3wG0+5J8q+VRfPldSB9xTg3r
         AYRcRZyVp1w9aOfwOPGYcheUfEp3PY6ihqVeExe1+ByKsmzppwkD5G5aLffdf4Zqsult
         XZRjMt7W0X/Ouhyn8KqaBQpcSVkV4DvxMw+cpSKthN+NJuslnVVuNxRTsOV0vAbtwkRP
         k4a44OTkCvXThhcVhU7l9gXNVwL0cHagFbLUolmLdWZ5FgjVdtVkY9HJL+1QIYqnqTqL
         CuZA==
X-Forwarded-Encrypted: i=1; AKwUvBxZV7tia2HbGJo/geKtBbVXxMQAGxG8sws0Uohgj1nWGNT5sShuNoyzjTg6WxUSdxaEMR4ENLRQsuyMDf0=@vger.kernel.org
X-Gm-Message-State: AFuF++ljA13gbFf30OO7m5dMkSRMY6uOfGTNxbJCcGSYTLYkqgoo49zt
	Zw9HghbomHQfz50Hxp1Luj4goVq2b4Fi5fdqi+KPgRddKAEs4R4bWUo5
X-Gm-Gg: AYBFou2CzfGuPAErol0rs9Ub2aYeKEvC2UKe98rsOBwQtssgojvdm6pC63eJBWFb1/0
	3XzUwnDJGj1g1VvpYItI1bz4THIgfy+5wmJRX/3H/lAVVypo5nI5hPbKYCPd3cj79qGy3CkeET4
	2DdY8jZJtwpwnMQmckj75nELIBt7uxfqqXTXfCL8zgNY5MlPCHDaqW/Wk/kSrJ3OmCkW9sw/pHw
	+YjVOWzUeqANS9eMOzFr7qSSJ7GVWnXaXKP8esHdbk92LG5ha94koJKTq/OFix2G0v5Q93IW+8X
	qeMjPRpNdM0v8X7HIEXr8IKpTDbetpwSsJfgKgvxMUd+XPDFfXouLqCgyoPh9gVPVnBIb0Gh5Uf
	uMD1diSOlvsHlh+OGPXJt+Fm8Gx0rk1n3xOxY98w7GBglZ66rezw/YAc15FxrFr01YPhAhv23k/
	oxoXpf3+6GYMkmlrZBMWqTyqkvYROx7rDpinzDHFu5nl7LNJDYsEC5wTEVrf6sxguoC8DtvvYWD
	vzbhXc=
X-Received: by 2002:adf:e18e:0:b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-48488f0f80dmr20736014f8f.13.1788422378643;
        Thu, 03 Sep 2026 00:59:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Thu,  3 Sep 2026 09:59:34 +0200
Message-ID: <20260903075936.2089280-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074348.8F2DF1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-2-mehmet.fide@gmail.com> <20260903074348.8F2DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Critical]
> This is a pre-existing issue, but can an unvalidated pin_id derived from the
> device tree cause an out-of-bounds access on ipctl->pin_regs here?

Same finding as on v2 and v3, same answer: yes, the parser trusts the
fsl,pins value, this series does not touch it, and I will send a
separate bounds check for imx_pinctrl_parse_pin_mmio() and
imx_pinctrl_parse_pin_scu() once this series is in.

Mehmet
