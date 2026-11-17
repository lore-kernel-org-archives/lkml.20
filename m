Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893406;
	b=sPPGZF2HGXeeupqFQYg8oMcKN3DrvKEv/5thNleV5mliB7852JguGN5+h3sm/B08k3e2
	 08niATMsWXA/d83YMwF3OlejBmVMrHPQH0HGFba78Wx91LH18kosa0vksmp79qcVSKWyx
	 9LDtkINo0Mx8psh4/xDpnMNbKU7RgFi/b8snNCA/mF/5IgamwUPxkqiPPAT+tKNFaZU6T
	 pMlzm+g2J0hyj7zsd44wPDa3D2V8maWzLQZo1CB/RqykA+1FgpjwpagTIiya7BrKx8plz
	 l9OgN2Wz1gV7M3rb7fgBUg9gIhfslOHh1ys9BxpdVUO07dwhlDrHHtZIeYIkr/kaBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ftrMizvuhIHObTCvAdpIahRgmk2EwZxg4CfQaHM/YjU=;
	b=ezWxdjRCV8XvvNwa3P6ehqhvL6THkAZArJhkKriEXkYCt71O2M+XGiE4jfG9lH3Kt3Ln
	 bAD35cy9ptLPwQgizd/vB7K59QmwbLHNDaQBJucAINYpuArKmnreBZ6qHey5mqd3FM89a
	 v7oUsDueqFLkBjmJYDMi5d3mNgRKWNNcB1Tm5aOkqbn8Um0gbgbKpBdyRPC2WsMGwq/q5
	 iuUzCJrGLWRoezChyZ5Bg+s38WK/13HLh2x1KMqZG6ZhlHY0r6eKtp8JcDKqvaTblOTT4
	 AvU16OyuqFMGQZ4nsIS0KIkdykTTUXrtZ2e+sOfvYqKl3NIVsiI7gFR+wjJWb7UPhuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xlka4J0T;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0842606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0842606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xlka4J0T
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so5929389c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893405; x=1795498205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftrMizvuhIHObTCvAdpIahRgmk2EwZxg4CfQaHM/YjU=;
        b=Xlka4J0TE/yLeF+c3TqpBEinxWaelRjQzvdvPTOgvM3kdl0NusN0YmmFNCzR9E60Pz
         K4AqtRAUQhQJVZQJ17sInykC5kyw9AMvgLlMhdr+8eoxYO/vV6InpzNseDR1aZuez+Y2
         O6Gnni3viKM1L5pZkuNWNa9yikouclaNWsfOoMajv0G0R1CGu6GpQDHX0E/m9KOlVWOR
         +r7R4/K+lWfem/06cnJA/suhg+A1KUgydlgk+qzkWIZ0TSjGeu7Zk0qElfN6K93XOaKP
         TzFiV/sC5SNfza7HArQ3lTxJ3Is0PmKgapOleTYB5LGDNwHN2Omt74M13jcrW2l6bQR/
         J/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893405; x=1795498205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftrMizvuhIHObTCvAdpIahRgmk2EwZxg4CfQaHM/YjU=;
        b=q6uxo17CV+wb/+UOwamuopJHREWlb1nIK0sq1BUICgWXjVSMAlVd5K5iprkCdu+0Fd
         3pCcN3356D6YfFlW2NfQVQX47RI/1cahXRzXMRDPX5AkaXUV0T+L2fct3OQF+WdSlfHX
         vi2K5kvAg+x58H2cQ4U5gHO1cxR3n0AKZjbaeu3SNioQFbCOQhqadLKhJNfFkSAjSqBf
         iCmhK4o4poLEMDAPksY08c6Dj+7lRd6bqXN7YAavxbvi1tf7BEwB0JvljW2prgg5eRRd
         VYkxKMwceCEr2vVtY6npDYhTRMrlRmu93yqyDXdybHgYITjml4OMNlHA7c+9GODH422O
         sE1Q==
X-Forwarded-Encrypted: i=1; AL+hErEdSKf0WJbv5zjxpHyfbKvbZfQ20w+FuIpKWyV/TJof9ERu2IY3+Co78GSEUWko4wefQ6DPTfBjO/Mm0/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ldFj/zng9dNLuGeo+yQfAsUR+YpNGQT+9KZaEUbPDA1ZyKFNR
	pUa8WoD6c2Fnai2sHi0HueeikiOnP3J88GDbfvYwp4gbEY977jCVsFgA8vH1U+U2jqo=
X-Gm-Gg: AYBFou0DqKfhNmAJ+TXGA0k2EpdOHPUtHTgCATDbNezPCNEQp/fwCF55uF9pQzS0yNw
	wNv6CzxjfYy8HcZJxeaYA9wf5z34R3NgqSKLU3+ZMt/LNGxRnDhdsG38WI6Ai5yOF6GEUwEI73V
	xVLzN6oTNvR2hfsij2TGJ4NGRM6nfEJxZojeSXGTx4xdj8PyvUZfg6sQVbkAL1J+TBrugihcclj
	pebWhNy0aJHYjamqpEetje9DNJbjEr4MwzCG2EkbgspiGRuQVY+4wmyl/2EjCwBOgWUUN84uKvv
	raied+Kf0Wob102QuH980asJOuTNm70cElhjo0M8KbEUVY7J8gMwL5yZ1mP2zjM7XEfrvAn71kz
	YgdcZARhfOzUdED/0A0pagcjWyP93PWzqJtG43dluaB0ROqfYqj6U9tkMbXGj05TZI5aLGIuYsV
	8Q55l2qjAb3R3X5bDjqfsr2c0DcQ3O5cfIKvXbxjwHkDAuFtbVge4rJhFIFFXUIqWLnPdDM2pj8
	oFEXdVveIYEzFR01NM2iklkmG9ynZHmul/PJDie00mBMsJcfCZwfnpg8KkCwhLDzOVOv2rznxVy
	7v0FmOUy7UiUCahRxoEVhN+QYwFsiQ==
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr12899653eec.10.1794893403702;
        Mon, 16 Nov 2026 21:30:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm77630203eec.20.2026.11.16.21.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:30:02 -0800 (PST)
Date: Tue, 17 Nov 2026 11:00:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gyokhan Kochmarla <gyokhan@amazon.de>
Cc: Shuah Khan <shuah@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] selftests: cpufreq: Disable the runner timeout
Message-ID: <avvmWA6YX2I-ovJy@vireshk-B250M-D3H>
References: <20261113163951.1510082-1-gyokhan@amazon.de>
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
In-Reply-To: <20261113163951.1510082-1-gyokhan@amazon.de>

On 13-11-26, 16:39, Gyokhan Kochmarla wrote:
> cpufreq_basic_tests() reads and writes every policy file, offlines and
> onlines every non-boot CPU five times, and then shuffles all
> frequencies and governors of every policy. The amount of work scales
> with the number of CPUs, but the test runs under the default 45 second
> kselftest timeout.
> 
> On large systems the hotplug loop alone does not fit. On a 256 CPU x86
> machine each offline/online pair takes about 0.5 seconds, so the
> reboot_cpus 5 step needs more than 10 minutes. Even with the timeout
> raised to 180 seconds it is killed in the second of the five loops,
> and the frequency and governor tests never run:
> 
>   not ok 1 selftests: cpufreq: main.sh # TIMEOUT 180 seconds
> 
> A larger fixed value would only move the problem to the next bigger
> machine. The basic test has a fixed number of iterations and does not
> wait on external events, so disable the timeout with timeout=0, as
> ftrace, timers and net/forwarding already do.
> 
> Fixes: 852c8cbf34d3 ("selftests/kselftest/runner.sh: Add 45 second timeout per test")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gyokhan Kochmarla <gyokhan@amazon.de>
> ---
>  tools/testing/selftests/cpufreq/settings | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 tools/testing/selftests/cpufreq/settings
> 
> diff --git a/tools/testing/selftests/cpufreq/settings b/tools/testing/selftests/cpufreq/settings
> new file mode 100644
> index 000000000000..d3e07370a7e4
> --- /dev/null
> +++ b/tools/testing/selftests/cpufreq/settings
> @@ -0,0 +1,5 @@
> +# The basic test hotplugs every non-boot CPU five times and then walks
> +# all frequencies and governors of every policy, so its runtime grows
> +# with the number of CPUs. No fixed timeout fits every machine, and the
> +# test always terminates on its own, so disable the runner timeout.
> +timeout=0

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
