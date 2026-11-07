Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044533;
	b=EiBNtaaBfxZTFNn7u/PKLW4f/eDyr1fuEDIslxcMCB7nLaQgz9LQJCbg1kebyYbeIUQL
	 IZ/YAkHc6LXhVa7wZaORWLl2HM1kaJ4v3kTTZMXl49cWCStBHxISQdfJpVlPBWpe01DRO
	 N1ZwXSJyAuxGO0rIPp7FF/9WxK3YuoCgo/etC72XbLseYMjwNOG5L/0fUhAqmiy0HT8V+
	 O9GrwIS/3jgP5AZpi+Vi2WptYvLaQC2t1/M8Nll+yHhcc2bTWMDQOSWiamWchV8SACaKP
	 VLq+j8i9HiVZYIxid+VvP3gitRalwlGilLtYXyjtEhQK6Y+ZxsanKz+Zmq6NwHZhLJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=BjeUzCRSxlDXvR+vGTXle7u9SSybnhTANnh6MwWYffwULGRNHhVZr6P4Ye5WtaszUCmC
	 It8H2EOf1mVn5/ghFUkDBarlEQjezUCdWnsK462RlxvtLe3Cu7r+JDkHXz50OS692fBaX
	 q2/e9hRZIu0QOo4YCCcHGuRj+ithllt1Mng1uaeiXWiMCsgJR+5shjtbVti6jjAYmASgY
	 MeTAtXGjZUGBsNdMhNHHtHDGGEZzbe8l42P4JUgTFSvVEMJ8mh1RkH4aGSzwqDsB1lWd+
	 Uz9vTgX+wA0oGvNhnstSc3bZ38Zsr34GSse9KGsPb36Kk0+SPDS9hqwy/7aquqrV6Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKGlUFc4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80969606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80969606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKGlUFc4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2351634eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044533; x=1794649333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=hKGlUFc4qgAhuEcENEmaG9xvGFtU6oAhzoWwbgU1bV3XkVQ/4XDEJH4qIhh95aMacp
         IT7lmMKK1g1eIHQR1jgmlkXJwIi2N8ZOLZIuui3XdVSt/CSNU7q1UCcFoKMCOTzSgVFs
         J4FkhhR26a6/s5g+idsW29pJNs+oOTMf8OmpkdiCIvz2GMYJix1HWTmwEcXVcHQLwucJ
         JudQ/g1xggwB5f6A7/DXLv7ILI4oH3Ov+o7G8bluYIF0tSzHL2q8IyBDqJaEmmOrk3Ao
         O85BpHrVK1+a2whVa+aT9K9RHJmgoapL/2HyZs1PVyVMzd4/l7GMvrq0kLFYAUSPueha
         IV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044533; x=1794649333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=Uy9V9ozJK0yoNXdOxenFlgLuBsNGDK814SrhXMA89T/zXc5rjfvgOndbWy5qZjMWJb
         rZlEUzkd8kLS2mwr/lE67dgN2xwWrjNm/jrEly2/QnUb/L/2WTDhXrN73MuHczyJ4WGQ
         I5va0chePp+4JO1mEcMu4JCBAVgjSCdFb4siXYvrnlk/ly54ABlZLjTIgh8bglEi4T2x
         IcPAfS235TZWIRpHgcCYsRcgBclh2x+ojlYDvaBuyFKEpSrO+HYREoKbc7muRBABDLLh
         vmSnZyHa+JLrESBCBS8LXBPxFmGvqM88czqkU0uarA7Mt6+k0RFqfM6jTFRL7RWHszm1
         u0kw==
X-Forwarded-Encrypted: i=1; AL+hErFZu1SxHui+//0bn42VA2lFeZBrk+i+1GRkSgNDghj1wegdMGe0muXwo9FvnWIwmN5jlx8uKSki8IcM4VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IzAyQFksSIF6Ev6ODz8a/iuL+x66WOzmOs9njUbCedorJkMZ4
	1yfSILwIsQyvOA6fTkIMZACfwreicOEI4anNM3Sz0WoWwN5Ykume3eUT
X-Gm-Gg: AYBFou1gKPQohIVHSYcZOeaTr9zGb+vHoAowLOEa5e1I9NHa1FQq7zf+BbvWfqAEHP3
	iDJoGT6TOST1KUg9b6Pkg3qzcbRHjCzdlR5enu2+zsOr+Q/WI5aK5ukpipZYx5MhDKq6/UEeZCX
	vqwS5mtlXT3v8wGvLm8LevoWRzs2dV0cAEAGyP4xIIqackPi7f88kqaX/PXD3GEKG+DcMnbyR1p
	8PQeVuyAgRE5/hwdYeT46A1fT8xQeRlL0leTtXuHDGog/hniz/KNsIJAm/5njQidbjKdikBCo4k
	u8y+zEmYLC3hg/iGdoJdb2YWHEZ77KYG73iVkRstTzKn03gB+C5sMPJBOqqQuqd6xHpzQWrR4OT
	b1MNZSo1kTXtpE96gp+Q8KDtWIjSm3fjLAy1aYsTh5hmmlaqjPffceQekgROVpy3SHArAmEp7cf
	NGqF7biLpmn0tPX1BSDst3mDHn9HxwHBpQm1X8psAaPbJeP6SuJ4kzKFOX7vLtZve5nq+0Bz47j
	YAR/eWAT/pE0o0AVVsunII1D1gJ0M/l4OcamJ4Gk71UB8zjhSlch5qOQ9thQ5l7/CGXZgfXdKKg
	klcehPTInQPcYxdSBAHbZVrKOXv50THM47OVqMHtzBmqtRvq4bBj7Aommo/yWmkpURnAXXTAwy0
	kAPjzWKbh+RIN4Ja0UjDGceVjJh7sCCZntg+BjJLH
X-Received: by 2002:a05:7300:f58b:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-36f75253776mr7263853eec.6.1794044532550;
        Sat, 07 Nov 2026 01:42:12 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm19185908eec.6.2026.11.07.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:12 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] soundwire: sysfs: Use sysfs_emit_at() in array show callbacks
Date: Sat,  7 Nov 2026 18:42:01 +0900
Message-ID: <20261107094201.3951903-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-3-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-3-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
