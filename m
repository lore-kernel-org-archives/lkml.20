Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF411490C1C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286667; cv=none; b=Wp8ep8pCtxb69Mjtm+rbvZMzoL4aZn48LbbJ+u/UAOuWg3c+6cx6iFEDLYNoGqIKNMJYQBfVsnMO+HM8fzTcfibtKpT+Irf9EqGaju6xI/B3LTWRIgW5DinP61CJu9MWfS8P2Kog9+kFf8mENswZzmkMuBDn+HAIiK/wNRTD+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286667; c=relaxed/simple;
	bh=QAlVz1big6/0SHd02D8Am44I432cOSKgP8fiVVEJtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADo3lgNHkZIU1i3+etEwji7ymNVwm4b9REYj7uvCTVhJ0O4kf3zVXdmJsIWkJYzxcjkMQnRAkr9zHXV5Gjrg9BClNTDIk8Eime4Q8pNhdvif6B3usLEXnfYjkEu2eHp4naozqpvYbEcEJ5s+bOCVbturA8f/HyLWwYS6ymt1evw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZ3vD23Z; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZ3vD23Z"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9db539a54so1033355ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788286666; x=1788891466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvngFuXh4SNdJdga8wwv6o+vzwXABOb9ybeVY4QhSBU=;
        b=qZ3vD23Z+3Q06lfYre1JmctN1nCg1W9fdoPlnPurAxo/umwB0KK8BcWA9V9cfs3gKS
         pbyCm4NtLRx27B+lDsuYPVI+14UR9mj+Sst88gDzPMd9tjD/UYKHa1PhVHviibGqXzSd
         LIbbMCSoWhkMX92y1BvdTiVm7i1aejFoqbygCQ27XVn8PgsyoHJwylZtMPKG1s4Xt+Nm
         CsOCQk+MXuYvdlOnyVWgWztm6yCmVWXowTIgWJce215WqKJa8tcCGpnD+KiyyAV4LsLK
         Sm8i+ghdQKoHfi0ULxysyJPZ39nQ/DcgISw1IZ/UmBP5WMXN1wDybPXFka3hswT7vInF
         U5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286666; x=1788891466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvngFuXh4SNdJdga8wwv6o+vzwXABOb9ybeVY4QhSBU=;
        b=BHeyK6lX0nMAmnyNvIjrUJWq4R2jV3mbwwaUfIPrZOPr8f66qSOB+8KpDGyjlDziCh
         3xP0fygGt1/8PyUdjVoFbDEUNcJ8VEmGgSG11F6MViP9RpsdkHpUSHNZcfoWrdaD+Pyo
         mCbU2+cFb0/YfWvMZgU9yjg4V6CyLqnxkKAU13FpXWbpUi3QEa0fG0yosi0XzaXQsB1h
         JiGbXvBKCO1ibKe0s+/Qikaxu2B1nCzGsKBvN6p0VU6pkWlC8wCRy3462Q6Fh4eU7nFA
         AdIoYD7E0+5NyZZWNPLgBTSHt2IKHt8hkUYO2szyT2udVd0isUtR1cGmwYdx/pLJL+pn
         G1Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxK/DUk3TEfhTQ3ae5Q/gxdjp95l/iFFfibmd+XyuUi8x8WGk4//DlX1mUyuSW7hE+FaWi3hKWoizRdVVs=@vger.kernel.org
X-Gm-Message-State: AFuF++nafA1VEdiqI85Af7+hhV6SpvnFXLJeddTgsUWOW1BQIyeiljua
	CfuuWohyKQDrbGxoEIgsWOiizPvJ2hgK+6cVGHfuNv4Q1mxyKG+YDXWYFc9XVQ==
X-Gm-Gg: AYBFou2dTGobZw2NBEGW9UV7eFqPyBlp96DhX7frNxwhDaif8vo4kqEXZXKiFOKlUyI
	cq6vLENyqFRz+FhCGT7I5Svke4a05WfyTEAnTZv9fH2OY6VnFRAZlIlpxIi4k+UQwNNtQFsWPHp
	PrTitNnCvl2UOrrzwW7azxxfUZbVmKoY7Zl34EO0vjr/8Rs9w9mSl9p45c35Ap/gGFwmXsCSMdB
	FNHjr5kfybxblNeUH3wbm6BSUE+J02NDGgVXhTD45jZ4u8Vvkj6mHF/Xw3bKHgQ6lU+FvYJu/rx
	bFuiOLXwndizwM3jeAcOFHmth0CygeRvmGGkVpLbAfC0xZsuvsGG0QbGMzh1xk0KGKYgM6Oyyjl
	f6gemyNQfRDBm2gHVLQ1yPSVW2UW9tL7/9xYU/TW48fIuia6yB9lLC/RruBDDwTp4eBk1iq0f1x
	QKWeFEjplE2hTIpaKAvYk4UfK7DeXgyCGRtBfnJuau2xPf7575ynxV9Jgu/DmTpnIRhzaWFLOIb
	Q==
X-Received: by 2002:a17:90b:54d0:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39907ab0ec5mr16512440a91.3.1788286665840;
        Tue, 01 Sep 2026 11:17:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d726sm783720a91.9.2026.09.01.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:17:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:17:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: tmp102: Fix up TMP103 bindings
Message-ID: <0a4ed80d-a5c0-4b5b-b41d-76c37adb99bd@roeck-us.net>
References: <20260901174847.97261-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901174847.97261-1-marex@nabladev.com>

On Tue, Sep 01, 2026 at 07:47:54PM +0200, Marek Vasut wrote:
> The TMP102 and TMP110 are backward compatible, therefore the valid
> compatible strings are "ti,tmp110", "ti,tmp102" and "ti,tmp102" .
> 
> The TMP103 is not backward compatible with TMP102, but it does share a
> schema now, therefore the only valid compatible string for the TMP103
> should be "ti,tmp103" .
> 
> Make exactly those three compatible strings valid and everything else
> rejected.
> 
> Fixes: d67ec24d3f07 ("dt-bindings: hwmon: tmp102: move ti,tmp103 out of trivial-devices.yaml")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied (I'll squash it with d67ec24d3f07).

Thanks,
Guenter
