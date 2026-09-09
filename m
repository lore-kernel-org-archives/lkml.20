Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD63264FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966923; cv=none; b=AI2e+RljMrTfqGnw3uIlWZ2ULjZ+Hx7n/6qucXLwIKt6nk8oNrxSpSah3WofREtKieYn75tp8jEmg08QXHqvvX+IWvv4HBdZ9IFE3Fc5DSQ0JlrDsEaoDdbuXhVfyCzup6Y/wIsUwSiXzuTCYhiOKWsl2Wby2aMQAtuWaGdxHCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966923; c=relaxed/simple;
	bh=ZnIpv8WZvdJ5YJePEA4oRdI/IfL6BywHnZH/XanqGWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jj1rb7inzuDI1H++eSBtbJ5tjYxIoBQjNd1vpumJiRp7mXHpzxiM48wIlUs5AY2VVgxnYPNhztgC/7D2cFID7j9/OjSyEr/ijisl7ZRBPZZjudUHiPJA+ekMKICgUeVAKF/Ua6yvE+JHPnm3ajVdnDONSvXizHKEg0Jj73VTOw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFiXfI50; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFiXfI50"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-484392e3d33so4296204f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966920; x=1789571720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q7rwmF0hySld2HyOILzYsqpEuhwCI2TFr3jDyI8CRI4=;
        b=LFiXfI50K3RW7L1N0T1iLQADo8TvXmTg1YkOUm3S8XZnqo3XG6nNzKgqYWhTZ8mmSB
         JQNbnYMVUHb8gFjvCknxhlp4rET+qtuwiv3d+FxAjnqbjimnOWzNz04leoU/CRTvesQa
         cYf1OXQ80ofAX1XupIP8iAqpuxCJc7JucTTRjHeVSyRd+Meh4ddbXXGtRenTuTT7tfCi
         tQJCS4WclobUDkgQhkFrULzOOnCBHM0nI0+C3sKfpr05Mg45SpucX1O4h71bFEPkawpM
         YNd6IiyP67yf4k+7IjWiIwofJtir2WrB7GfXdnxDBNzd5kbs79XjmT8m2IRqF6e9wBxz
         PydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966920; x=1789571720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7rwmF0hySld2HyOILzYsqpEuhwCI2TFr3jDyI8CRI4=;
        b=rDVX8QiBj31GASv2154ls5cGO7ADTfzaQ7GRMoVRrXQiOsk/RI+FzEeKr0QMm7AT6c
         UkLxdPlqOh+P/PQCnTUbwhqWG4AN0kvm0pqFvcqQEBwsWdN+Hffd2g2SwpDFI8Wbf8G/
         WLc5wOWWG3zAXz5XnIR4lxQfPYGewsjKoMwRRL2QTok8uPZyUN51C1xOcq7dYKHpB/l3
         93uLVY2P/TT3RAuIQLiFM23VNKc2CUcLXaZnJdXqiE2t0latfJl2IS72fyjllQnUtMIn
         Zd1es6PTQ7YlNty8SoTBXMyCas/ZL4CdhcDtDx65rDId/v9iPYBJ2mx8QKDZLKK99+nr
         1/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1+yPU+r6hvNeFTi1poB817z5TRTKiQAH+ATySXBqwotFqHC4Ukyd902u/T65OVTkeVgbKpaZj+vYbj20=@vger.kernel.org
X-Gm-Message-State: AFuF++kz1GvHq+AVJuJXkQuOZAQ/wZ2WpkBlL9jGEuw83eFjI3GIlpos
	w1qP0z57P1wiI9YchXgBFhMl6XPiiuZoLK0jIloC9YnnR79Rb/o0icoBw18DB0lKnocmFg==
X-Gm-Gg: AYBFou0njeCEPi2Z8hnuXM/v0yC3mPBZbD+Wf54q0nBveHSezuYzd/7RlelDelyG1KL
	4o0EPkXqmZkT1+o4Kbz0sascm8eSvXWTHiJOC6k68Ay8hqHjIf3tEtceZ3RSNGWIoxZqKAnaiDT
	tsAs/CBnOcOEBD9ZSDFrq8EyC1X8wCuoyj7CC/FO49z7HTPMD8JA5DR1pp+swYj3qeAkL/NXdoS
	F4+2qJ/7qFmMJG8a+hOq6T7oa+iWodI/2W1n4/c+2gkkTBrwOh9pLDYMT8zn7hrElf6LC8EWMEM
	Dmy60ixkFzCvr2XN+Bj/mCw7rAajBY4rxK7YiESJbWTcj5Aa0wld1HYf/RuK4IoG90iItfjkb9q
	yVlUox0FuPd+/MXzRcJ/hPwzGJuobOGfQj5fDxbnOz0c/02TwJ3lWRE4YHN93Xqz5LNmAcY+Ope
	Yp4ICKz9gI1eYj4yGC0T514REo8WsoN2eQ7V0cM5/75Zdh1lQ7xy2gE7qYz7m3gbKl65TS/+XXE
	plmw2bt+p+geHdIw4KClQKJO5/x0kVPEedKOjpfvm7I
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr40255536f8f.21.1788966920068;
        Wed, 09 Sep 2026 08:15:20 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48594172546sm36325061f8f.15.2026.09.09.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:15:19 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed,  9 Sep 2026 17:15:08 +0200
Message-ID: <178896690892.10327.10619929289869883612@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141841.532191F00A3F@smtp.kernel.org>
References: <20260909141841.532191F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both findings are real, and I have posted a follow-up series for them:

  [PATCH 0/2] phy: qcom: qmp-combo: fix forced com_init() error handling

To answer the two questions directly.

Yes, the error path has to skip the decrement when force is set.  The
reference is only taken in

	if (!force && qmp->init_count++)
		return 0;

and && short-circuits on !force, so with force set init_count++ is never
evaluated, while err_decrement_count decrements unconditionally.  A forced
init that fails therefore drops a reference it never took.  init_count is a
plain int, so it goes negative rather than wrapping, and the damage lasts
for the rest of the boot: qmp_combo_com_exit() sees a non-zero value in

	if (!force && --qmp->init_count)
		return 0;

and returns early every time, so the clocks, resets and regulators are
never released, while the runtime PM callbacks only bail on exactly zero
and keep touching hardware that may already be off.

And yes, on arm64 a read or write to a peripheral whose clock is gated is
not a benign no-op - it typically raises an imprecise external abort, which
arrives as an SError.  Whether that reaches the kernel or is taken by
firmware is platform dependent; either way it is not something to walk into
after an init failure has already unwound the clocks.

Both are pre-existing, as you say, and neither depends on the patch you are
reviewing - that one only stops the teardown re-entering the driver's own
runtime suspend callback.  The three are independent and can be applied in
any order.

For the record, the two problems are reached only when
qmp_combo_com_init() itself fails, so I have not been able to trigger them
deliberately; they are found by inspection.
