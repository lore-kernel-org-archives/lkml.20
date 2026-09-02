Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146003A9DA5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331937; cv=none; b=GiPGkLIr4TbYl7fSphnyauU/JSPeGVwNysY8YoOHDHEMKU0/sCpRWtjDxPeOKoSqnxkVwSHogz2CrsJZlNKbMyoqTnniRmtJPh+MRpC9r/Q+Pa8asgqmmJNutHWd9DL3q1Ht0Dio57Kg0r/Ddwy2De/1C3nD1YAIa9kdF/SqUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331937; c=relaxed/simple;
	bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6jfeZNqowcFV9Wj7COT7rzFLULxjNBToPeKArLjD2kYOOk8IMTPgRni3UugTq3kMvy3WPue0Ew4AJk7mvX5QWTMpoxORc3h0l4gdU9qPIC2S87c5pQmWZivJ29RPUBpoyNF1eFMxJq+6Tlutmp6g1WLUhum5GR/OTxsmoIhZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pla2Nt/Y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pla2Nt/Y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so4762975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331920; x=1788936720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=Pla2Nt/YQTGAtx4hKCTTd1K4WXpuMj8T0hnSNSC5SkRV/PvbKHUTi7mUIhFOm1Dhfz
         55CcwaCiPUzVtKZpcsqpNBWNTdN+N2CpCL9d4J1wJDBRs1PHjrF5JPa1bwJ2RvUED+iq
         MNKpE+twcbgEZ/Z4i6kLqwEI3lKSCNj/CCnfn9bYuckm6b9PbOq9z2Wob++lFKUFElqj
         spWV/IHnOxN22EE8D6vGWz6jUF4BkwHsvh/tb9WQORBC04nQjEpucWkBXiwiNalm7UY9
         wVNyjCsG3Qu2W3QjA9dxNSQYhx0+Jjq9BpeSyKA+jMUwU+2dJ+DasNqvV12kMcHfpA7C
         7dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331920; x=1788936720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=sWAULkKBvO2/gvro2fuOAzu8dCK4XiyZCGQL7AgM3+Lmk1SbIzJeV7jXdEzZUvK8Hc
         KDKBWcwOjmuSvOvCCGMLBi9nEa15/3ESWbGEDU9/Nw5f33xPloJuvBljO2+Z78HqYyBa
         tob4a9V6or5aj0b+8A98Yq82X8aF9JWc4St+Kd/hG7mwp2UJqWVhXzIfRMOm5BZyXpwF
         YvylIOOUdka8ga2xCqdxWzEs1ZRSxXPRhCDa0hSFkU4EJ0lXds+O8LFNktPqCufEkujY
         fZZG8aSjq9EQMSwLq601dFI1OalF3bBlAm57OhrEWyfYPVWZ7K/roRcb3gkt6EqVyzey
         QVyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Ryt4cwl+98RhPEgXLcQr6zKj4BmHe1dr0ni09lDPd/QKMiklauQtYhn0vQP0n9+NnbRwMTnarlkqv8A=@vger.kernel.org
X-Gm-Message-State: AFuF++nlIa5wHhgiJwCmfzOj8dOjDHyzCl2CBukjLONenJ49Z/DuRzEs
	n8Y+rFb88GDAA6kTrmsZUkEIPtchflVQapHpSXziEMMxhmQGLnydGpsv
X-Gm-Gg: AR+sD117F3gg/48wXNB1qzQ8I68gl6Qt+ss7GqFEYmoPLZFaTwiPm+XUHqGi++W5R/f
	jRLnd2ZFQMYelL4h+vUtHzE2swUmxfNTd809TOTU9tw0CI2TQjinQL3QdeUk7ESpHyQkPlFVLN9
	cgKxh71QN/T90a66cgIc/f28CJwA6/N54VUXFIxmY0q+ID2UlO7y0OsWAamdv/zdtYgodPuRh4M
	NS15FUlPshQZA/6FuKEcp/3YLSeVDCxnYsvZqAQDYQrxk6RRjvXJi+fa3kN1rs8+GXRNxNQ0TBr
	UmgyVHKWw+FdDh6n7z0CF8AuIJc3n209rd+G4pTyq/BZIHg8HcOX0WLHDZ2PzEQaN3JKPYjGO6s
	OX5if5jpi1rnENYS70gzWNBZbta2kwpdmRAktnWYUt2ZJpQkFqAEuW6inRdiJFbkNW6LlB1BBwF
	pgOix92m0il9d9zhpZW6Ejps3UC7wAHBZwkAKjMVa2vqmX8hdOtktshF8LJ3FjlJXJKw==
X-Received: by 2002:a05:600c:a0b:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49ce5818612mr34637765e9.9.1788331920540;
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:51:59 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:51:57 +0200
Message-ID: <20260902065158.3617522-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902063739.A89F01F000E9@smtp.kernel.org>
References: <20260902063739.A89F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Is it safe to extract a parameter from the incoming *config pointer?
>
> Looking at imx_pinconf_group_dbg_show() in the same file, config is passed
> to imx_pinconf_get() uninitialized:
[...]
> This appears to permanently trap all subsequent loop iterations into falsely
> triggering the generic decoding path instead of returning raw registers.

Correct, the group dump reuses an uninitialized config across the loop
and my decode turns that into a sticky misread. In v2 the debugfs dumps
will read the raw register through their own helper, so they never go
through pin_config_get() and never depend on *config coming in.

> [Severity: High]
> This is a pre-existing issue, but does this correctly handle generic queries
> on SoCs that lack the requested masks?

Also correct. Once the dumps no longer use pin_config_get(), nothing
needs the raw fallback there anymore, so v2 makes the callback answer
only the parameters the SoC declares and return -ENOTSUPP for anything
else, instead of handing raw register bits to a generic caller.

Thanks,
Mehmet
