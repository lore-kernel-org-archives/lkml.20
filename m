Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26A46F486
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786848; cv=none; b=DORXo0OolPpXK240SXTloQZcib/JMpU7A7Hmqm15DoEm1plFEDKzkc8Bah5pszFac3yhAOLxpgGnyh7fXT8fGNkhemmXjAkZvbLGR0hOVGQTxQmIXHQOB8DXJA0q2RTwDjuoJZS4MBa6pUV7roNTgKJode/Scvyh/JSorGSUrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786848; c=relaxed/simple;
	bh=dWzNR75g7GxtOP9gnAemxDujVQlcOaJPEWJ4zxqivnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGLLlT/OvTVaEXRMKWlenY6tm71EFlFbiNUeRmtSIV4oAoevnXgRTS4qOq40HgKISwAujQeVgevvh2r1eGSRkrD/jjIK+JXoR/znV6EmFQGqfxfkMSUrhxKdcIso7f8ySwmpPQxW1JUL3VgCB624wFU5fZ3Z9QLfnp+FpE4i9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3aZ8mBj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3aZ8mBj"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so45506a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786843; x=1789391643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBNOe0eEjUTG15p8/eAAeCa3HJjbYU/T5PhuLMghgho=;
        b=d3aZ8mBjoT8Q3pD2+IjedJ+RH8gpZ9SEv8xlbiy3fN+KMokEZr7wT7hOBBrrIlNAm3
         9Jf6cbau9QDKAGjfB3VDScJt9amSp2UKCnQlOVAh14nXTO2RjyYgRPAupn0DhjRQuqDD
         iwD8g9a9gGq10U0iSKScqVoRv45SARLUyrPQj1QsTkzdB6/Q909iUs/CVREDQXr4+RQm
         TtitMK5aqJDQfofcQsuJ/rQU9JeAqxifEEWcp7pVx9eBPUAnr9w07QJMse+1hhOMghjY
         jJ6bY2hKR4NV1KQCchIQdAjwDyCUeRgiJrCJ7pkfgVEXxX7pFNVTo8nQY7w/wudjx5RC
         /dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786843; x=1789391643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBNOe0eEjUTG15p8/eAAeCa3HJjbYU/T5PhuLMghgho=;
        b=U/VGFqJuGPiborl0byafmMfrXyxO3kPEv/uhWXjDWjYNPMLMvINec0UgvPdiSAQuxF
         yyckt7SvcrsyYdLrukgqTBZHK1LXRE1wmULtEj0w3CExDvm1Fy6nMr/5dtLRC8C9IAzX
         lxKVvSRj8603CoAbQtlWSdhnoAxswwHIkIYTKEett4q/WZUtbQ0MpOknn31ytwoRiJ/f
         lSO1nwk7kic4QAX2Pby/BIpFzbzXRk1INP6oeloG3Ce//QN/eigzYz4/mMBvACVVpN/i
         p7Zrpfg3JlNw0O8TOTjBpuSABs8cvSRNFcPxv7y9bcwNSwYk0K6dItXRiwRJWgIuTlsL
         CiZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ6qfWgKz+WtsDc9nVO4JzGEKqqujDfwU2Kf6tsFO5+YIeJqglXunkzcsGq6C7fHZoWmHCkfpwk11X/UU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfXQbcpz3SZmMIKhsWRRYoe0/7iPMW0lplszEwLWaUXq59UqUd
	PW2qHhRC6r16dRB0nyAlxxa6tujCvPjfbNfoyTn8g0uoOkTvfLLAg74=
X-Gm-Gg: AYBFou34wyx5ZU3cyHPfZJ7w/oMCSTZBVhh1OV1OEugLcNvwYFkvQ/476ntVCZXMth2
	OQ0+6bDq4PDPRnrAjSh476UF7x6nU5Vg1FHsI2n42jao9CSxfitqEq5YdTQ7MpIbLqk2rKZB+gQ
	mxmUiNxy7DrKPq+EsQrqGLwXULst1okVlFX1jo85N9TDzwQ/dnl72pPheYvmuny4blY5mciLzN2
	pUQzckDHxPbmFlBiBikwe5yjuc8b2kQxnazMAb2x03Xs09qlXld6fdr32AlxczuKF4MPD/lfFLP
	rYZgd1FLv8Q62E4q6bEscBtoAaVeZ0GVIU7AVibmc/SKf4c8T3xvYXI3JIxP61cKtxcRv6G0O3n
	knn6i8ZGTZHFLEnZzNOgE/VUW3rn2kx1WO6DAQ78a7+wdE1YJjDBGcFVtWxbfLKr6V+HJJkQYrl
	dAj6hvG27YaYTfBnW3S7a81l58dno3gmcs9MDMn9i7TEc5VBO/hatRi+82ctVhQYJW2539t2tdf
	i+vLzJv3wHZVH0/YQ==
X-Received: by 2002:a17:90b:4ad1:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39b8bd997f7mr695966a91.8.1788786842561;
        Mon, 07 Sep 2026 06:14:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm20713756a91.1.2026.09.07.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:14:02 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH 2/2] tracing: hist: undo the registration when enabling the trigger fails
Date: Mon,  7 Sep 2026 22:13:57 +0900
Message-ID: <20260907131357.613555-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130105.94DD51F00A3D@smtp.kernel.org>
References: <20260907124420.607097-3-donggeunyoo.kernel@gmail.com> <20260907130105.94DD51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 01:01:05PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is a pre-existing issue, but missing cleanup in the error path before
> this label can lead to a use-after-free on the global named_triggers list.
>
> When hist_register_trigger() fails after successfully executing
> data->cmd_ops->init(data), it returns a negative error code without undoing
> the initialization. For instance, if tracing_set_clock() fails due to an
> invalid clock name:

Same one as on patch 1, answered there:

  https://lore.kernel.org/linux-trace-kernel/20260907125934.5C6261F00A3E@smtp.kernel.org/

It is fixed by a separate patch that moves tracing_set_clock() above the
init, which this series is not based on.
