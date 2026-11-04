Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835933;
	b=k12CjB23pDZsS66+e1rkJ5tHY4dXrdlIpXhkgkBK3DEGEFsCgL7SCZzYdRp+MOByiQiW
	 NN5zWcKIKZtAj3KoE+gGC1AjJ8J0IM47Ly0HMyg/9DR+ptAB4VUViJu0rQMaePXYf7qov
	 +58R+VUnKWfxqbvEl1H6GR4lqcHDe4Tv3eBPRn0yDCbGk5lyD5VeNJaK/bBVhdW4NXAgJ
	 /3K0mNs6OR/QPH/sSYdCMQ5a4wYMLagTQ92glHeWTUmbxsdOjL3IkDWEda32CQgbl7I7T
	 J5i1kc9u+JXd3qBw0rNqJSWxaYGPDVCKqc4ukzJQrX7Xv0nKhtEly81V4HLYXAsrzlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4kXbR01S3M5L+wtam7WkgU+NSUFvLBmF0YPHzpjKWcg=;
	b=0LT0ulriZ8RzwmksyIQ1npqWF3zdCcAEWlc/xeezO5xDxsyEQWe4oCpFoDxPChbTnETk
	 renKn4xFG0Z1KCFsygqNLXWOzrSYkHCWISH/SY3GTqsMTsSjoiq/vaiREmleMHQjppxA/
	 Nk2oCEY4LvQ3hPpa4SoJVST5drw4x2pLyqbl5P7DVlv6ZmjSdRLanJDnki1m6Y9/SEJlp
	 nhlQ37inJUoV2sSZDFmDRDnbvbhs7L7p/+eM2NMIT1bilZiDmEENOIrlQV0vJXKkptunK
	 52ZEQGThEg+flrN7kiBo9Kw+SkacHtRTBGpQzbGQpwyCenG7ho1tlpEQbbLH1b3E1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vlZURf7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DBE606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58DBE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vlZURf7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2194733eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835932; x=1794440732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kXbR01S3M5L+wtam7WkgU+NSUFvLBmF0YPHzpjKWcg=;
        b=0vlZURf7k5QquqgfLumFSqEumWZLZz148w7NNP2RiTozESJ6wZf5/ruRNYPMYYn8oY
         5XOtsT2C9BJvtIoxTQrIpf7V4LgUBc31QryMJ6dHc6ooH80PZHAau/0Y8q9n9lnHaWAs
         9+WnUhGfhV4WWLUFanZdJXZzkm2IWmr9GR76/TAicGphHaO/MHSNjrQVYPhP/BzaH+Eo
         5ze0IH2gUp4UqQieDGpjC0XNrphW7ubrV1pJ4oIjUhr5Xs7vSYlUW6th6R809IT4OAP1
         Q0/k9TJZwuFSbK4vP9YmSj8TKcxhqbEWQczHlr+OWyKfXG1J3/m9HFj5BPr3CCtoCn6E
         kx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835932; x=1794440732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kXbR01S3M5L+wtam7WkgU+NSUFvLBmF0YPHzpjKWcg=;
        b=Jzdwn+2Ea3XpLaLWtYHWqHwOEINGvqQz5AINOapO6hZ9KHMPAxByE/mb9+pY6UB27Y
         BMWinR0drlYfkfMSvKG6o8l6JJ/5rJDOmQRxs7HLEP+5wLL4ZU8Na8i5dey1vIq6E33R
         d8l9ya8bqx9gbvRBDM/DuRCTT/o90CpRbK3VObaxZIyCaPMcghje58rnuI0Zel9P2j8u
         akpIlgmbotxhYJnYxIIOi/IsnIlaD11hBvNiiLYfL4tCstkD9ZEetLf0i5T2si6eMikR
         7j43hejK9F4uUgyuJpwiO3QWg56oHddfNSCzdJtgIa0CdfZL588pnvl8xo/yxapJRFx3
         l4bA==
X-Forwarded-Encrypted: i=1; AKwUvByZrSBquJ3VJVfnlSi6Z1GEqmcho5CfONCtDx0zl+Myg5OopSck5qAENf4jy3CggIKF4kKJUwCVuGumvTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DqnYUNRz5AtSVt+H5wgpkEqxyFsa0XMrTz20DFv8fo60rbHRX
	SMHHNSzUF4CzGZiCyNUW5KQEJEeXj+ZVWWEfKGIQhtJpVHsZn8QMrGnB
X-Gm-Gg: AYBFou1NcJAoqO5GNoq/3AISlgZpw6gaT08yRnLmUoIvLuJvwIUGMGJIYYJP99MBpWx
	zzCmfEXSOvzQxqGFvJUBplZVX6co7LiX4qqJVrjrp+cgaj370SrBozxut45Kkfe+P2yrq/c4lHd
	SoKbaihFpecVuYMut9Z4uL5qQprLjxsPG5GjnZSGoOy8U8kz8GK4Gp7MAKObYR05Udvkz5iacZd
	5IjK6orAMDHucRLbINPbYVTeoS/vBv/V8ITpdH0Tp2M5YYRLFnOS7IUZLH88qD4reN16UTCJDt2
	Z1XdjIVQ0jtZFJVKJfMGzqS6W+SnaPxj/yFmd54H08Zo6O58snAcHMP9qLSsTcVBsz7gDBPQy+y
	cSXH4X3qnA0QPRF6E02B7Iy72FS8agx4p4ZGPDXYA1TQUpEwV7QK150dRd0UibuctDnnohBotTf
	Dys/Z6np6YN8LtGgvWWdLp+uiqvO3VasARtA0mPZxRFCucwDJOI4ecOqP09qNny4N+2HPtS0XoS
	9zXt2MXElpREAxReY13rbN4Rk7xtTzu0pU8+7R1+wKPL0QKaNzw7hqguoxFlxG7xZaDwfCjifCK
	LuaBXQD3naEeLk88mnVXLUD3JgsSyT8BKyyY5GYYUkEMJ0iXtZN6l5RPV3LqZ7IPw3KVS8E=
X-Received: by 2002:a05:693c:20c5:10b0:36c:da71:37e0 with SMTP id 5a478bee46e88-36cda807b27mr4610132eec.2.1793835932074;
        Wed, 04 Nov 2026 15:45:32 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39972d4sm18076499eec.26.2026.11.04.15.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:45:31 -0800 (PST)
Date: Wed, 4 Nov 2026 15:45:28 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com
Subject: Re: [PATCH v3] Input: joydev - avoid signed overflow in the
 broken-axis correction
Message-ID: <auvDldWq6qnN4Hnd@google.com>
References: <8063a24bb9f75bb9096c947d8ffa7123@gmail.com>
 <20261104055058.854710-1-zhugl3@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104055058.854710-1-zhugl3@xiaopeng.com>

On Wed, Nov 04, 2026 at 01:50:58PM +0800, Guanglei Zhu wrote:
> The JS_CORR_BROKEN correction multiplies two 32-bit values taken
> from user space via JSIOCSCORR before shifting and clamping:
> 
> 	value = value > corr->coef[0] ? (value < corr->coef[1] ? 0 :
> 			((corr->coef[3] * (value - corr->coef[1])) >> 14)) :
> 			((corr->coef[2] * (value - corr->coef[0])) >> 14);
> 
> Nothing bounds the coefficients, so with large enough values the
> products wrap around and the correction returns bogus axis values
> for the rest of the session.
> 
> Compute the correction in 64 bits and clamp once, and flatten the
> nested ternary so the dead zone returns 0 directly.
> 
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Applied, thank you.

-- 
Dmitry
