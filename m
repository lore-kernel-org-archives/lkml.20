Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794112008;
	b=3yc0JR49WKtt1eMxElmL/XeRc8JTIAF9ZW7lTffKp1O3M7ac4h2ggVH99wuNrV7hrf0d
	 s0Gs4OLUkbXOTEVsuYVGdJdC6SC3M5852ZBvhrgFZ+Ywn895nQY96f6OM86GEMIc1satv
	 N96r1BUyRxUIUX0jsL4VvUFXbWmCgdQkATORbJCbF6xqervcyFDipusxXnKJqFhVPQlig
	 ZMTpKD/0j6v+WIsbOcwzBFTI+GV136BkuLrm5Zcc7IettOymC1d2MASkxja8T19gK21ZS
	 6xKX4nXNKspDzLOQ4UJw8tEnDnHG0S41SYlHM0/QEjB3+KSGuf1vtGQGDZvi3geAQmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794112008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AiM+LPeAW+0kbmk+BQ1RmFOTod2teJOvZsGbeHlaw4g=;
	b=xoXnzAxOJxTvbvjEeGza2npkKbod7KuJg1AWv1K8/3X7vVfQT9PGj7ljBHIbltHu5NHG
	 4HQN5oKGEP5w9c5dnSlqyOf4FBLyQq+MiIG81IW18VNrgUK/BnC5UpA+8o08pmH29ljOD
	 HomR0QUS7zT2UgRqTtgcDgevyzKM3UTLAy2KnPM8i+z/QpSPdenY+x7sz4NYG6Tq7V+wu
	 knh2zVkEfIEd+9nLLZ7zjon79EGZWBdOiMxLTq5NVPGo5mCYkJfszgs7aqaPMY9LqXn6m
	 qCm4AXC4p83q0Ugbz1de5wzTuOW8iciQ6WusXDwY1FKjoFF5wlxP58NhnJWhgfVw7kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFzdKciB;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FCD606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFzdKciB
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so527255eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794112007; x=1794716807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AiM+LPeAW+0kbmk+BQ1RmFOTod2teJOvZsGbeHlaw4g=;
        b=jFzdKciBfSGwXz56NKPGSVznZX8U7LUlUXxCQ1T42+qxNK8/F8FxEYDSGXj/IGh/m6
         oSUtim8njzpW4+lf7ekqtnpm9qWX+LdlVbuyQmxeSF3V39VY9qGpFGdU4j83/HP/2XH3
         l4u7zJdgN0nC2+mCAVVazZu3pU75lBWkOqougha1r4Zm6EWc+RS1b5GqBnSpmDvN+wBp
         Z6ZRFQrM9Dt5lc0qs7aGwSNYdVlm79D1+rzBRP9l2Rqi+hV0clMamOMI9SCgWjCVTgrS
         sB+1aEHbZmfIKxE3ZgzmHwwH5yxwM36Bj6WDnIZFvqrEq2mw9ZWdAL1kanExgPx3NhcR
         thyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794112007; x=1794716807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiM+LPeAW+0kbmk+BQ1RmFOTod2teJOvZsGbeHlaw4g=;
        b=eCRhpDwCtSrS3VvFxxQYPABuXyMOXFnRmY3ZtqupnOeP/HCZGfyhvGSnZQ5IWP9/Hi
         tX+87lmxGQqd9+ZzM/nHJbHnTyLeaimc1YmrHQIBt9Kpio8LWMlZcgMHRL4N0Wm36HLb
         gdVmBxOH+903FSRIwSvE7/m1l+Pcmqq8S2pYXsmn8/QzKmcwppsumMbzNQ5RCgnRDF5q
         2iQauXHdLb5FcGn2YCLBOgG3D1QezmikOpW8IDkO/NU+01n7mz1ty9KUzoLKy/17MeLy
         pivnWK/41NQDxDDCaoD8B45ILW1mgAqQtv9c5w5eJREPoqV7ZF2UZPZh+cTfbVEMklB/
         JKEg==
X-Forwarded-Encrypted: i=1; AL+hErEC6GSesjEss0880FcFkIuMQ+ZqHihK7i3dteg09etiwhxTc+u71+9vUsk2yDaI4eAHNyCuz6HaOEYqMto=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VLhSOfgKsFsIaEbFVeUBoqqOiCPjEN/kBMCYyZ0DVxiMVHlGm
	1awv6HSf1WGKAbYkh3ZN5ghVqG9K59OvnWjwg6WgZtLIKqdz/F+POcRC
X-Gm-Gg: AYBFou1o7RikGA+XggjLK37jKg5+YZl05OCCMsX3Lwj5Zdz8Xk6u96xZwi+zdTaXfwl
	qYsMFBh+yUMiWStX2s//2LUH42DwSTW7SltBxCfWZfZBpesrdo1aCqX64rlhR5BeAuBfb6b0H/Z
	RkPRe/sMgZit2shQAa2Q7eacMZGZXa1zt9tB2AzCXxp6eGH7igkKQPLd3l+WQ+FbJ4Vx89Y+XGi
	Ck7Fdd+fuQCQIddy1gNP3CaoXnEifv/waTXApjqrIpo2lNA+NkxPHcBlknO8sc53Bccw72Vqqms
	AdCqJSuRtmrL80z4sRnW3V+44p6ipznWdLDWlYRsYLzSCdapZdsf4l3QIaQud+elqWevEbtnra1
	2eDLbWcjRyXZ8cQDxnyWqUGdc030p2Wn6VByF+iUQjIYMONdEx7zb+0E8D/Cpf6tIrVGJiDjyMv
	FgwEDhO3bNBj8ZCkm8YbDzoA4FvDjQdvlZ7L9BSwcu/AovF/+RnW3h0AvyocvQ0eAAMW4zXE2fG
	k0zHbGg6s1Auoo4bNX2tblp1a2TnNzRendS0ahZko59b42R6QDWKmiq3Fh2cGkG1TFRgO4sRNg7
	+ABNyoRa9TNitUvc/DGUY2ESeUojS0k4a6lFhv/98CB5GCoObhRXtfY7ZbZA0JU8nbI5
X-Received: by 2002:a05:7301:b96:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-3725d77d5f0mr1214989eec.9.1794112006772;
        Sat, 07 Nov 2026 20:26:46 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:5a4:1cb9:242d:4f00])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d6088sm2650583eec.25.2026.11.07.20.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:26:46 -0800 (PST)
Date: Sat, 7 Nov 2026 20:26:43 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Dmitry Torokhov <dtor@insightbb.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: amijoy - fix memory region leak on
 registration failure
Message-ID: <au_5_1B_OVWQVau-@google.com>
References: <20261108004952.394691-3-blum@kernel.org>
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
In-Reply-To: <20261108004952.394691-3-blum@kernel.org>

On Sun, Nov 08, 2026 at 01:49:52AM +0100, Thorsten Blum wrote:
> If input_register_device() fails in amijoy_init(), release the memory
> region for the current port before cleaning up the previously registered
> ports.
> 
> Consolidate the error paths while at it.
> 
> Fixes: 127278ce2254 ("Input: joysticks - handle errors when registering input devices")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied, thank you.

-- 
Dmitry
