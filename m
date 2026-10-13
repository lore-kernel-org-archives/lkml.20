Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EA339389
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853794; cv=pass; b=SonqcwIv7fASUrS//nlBE7Cg2IhlOTZz4MZzFJSYIjYOUDvHWc6NrA1hq7S+qrZxJO1/V9F7CNDOo0OjbZ46fHuaUis+wphDne+ayaLpoBNdLzaZ2OXKh2OFJ2Vf1DE6UV58Ij6keDnvn55h3JIqpTf1sXnNajtXW8vUKZQQcLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853794; c=relaxed/simple;
	bh=9RL00LFHIIO88+jXzVKLvob0h2mVaGF8QI8DB6z0krg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqeTB4EqmK6ICjUiANP1mBzArKa91gpS1zt+f8NGMTqwSaYp3r8mk73+gX2p3aQaZwe2gA94NXTs1wgu6BG0yD2zg+h9jc4wjgJtLyz7iI5vwvLGTi8SHTAPmNU2IFhCoyIV555b+J35t52qZvH9p5lfYwvo9CnQ/G1Y3hAn6iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQOTwTqE; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQOTwTqE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso2682571e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791853791; cv=none;
        d=google.com; s=arc-20260327;
        b=C2dpCiGNvMa4f+Vw3AmPY3CJ1MCZWYI4g7Pobu+WZugJBI2Rm8bqdqULHe5sclacNL
         T58xnRrzHJQkWPa0/ejaRUflmNsbioWpKwAewp3zCJb7fzE/tH80rEjB0j0cdMZ2c0zc
         iGcwe9XhXBeinrPLRQ97Y6jOQmkfuxRbCUsuOPLPY6nxHlCML4LaCTL9Q7YSrM6IVPY9
         WZMs9eGA7VhrlcqNGiahI/zpqXrnGk26EtnVYIF6nuIa/RvZQHlIc9fXFrLn+Qk12d4I
         Q1d8FGzsTqyubW8HeLQKw6FRylc9X2zpt1ZZR5Nt2ntueBYMaNrsMbG9m1cJJqCA9byc
         5OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        fh=brhVSWevZXbbWJkVAy4Z80WWO+aQ9VW6tQXqaWsq4JM=;
        b=F/4HrjsVP58BkOI2UJvQgRPe2ikV1Sk5RzwH3/fIpDqmRXy92nZQb0Ck7oYfUyGul6
         hzK1ve77lXwkU06Sk+/aJPnO6Ck47vrIV+J12BrU1msi6JAQRQUZxwlDWi2wUtrcHABK
         vzgLvzIz8ig+oylRrC2x5Gxgin5FD/dUnIPhsPUpDymD5zM6s31vKiwo8gQWH2rNN0/x
         D1DtRRB0fWO21qzsoT3BnL+FBQ0nUzFh6XRaGO95JOUl5EruTR05bvhGzj69cJkMMbtE
         K2Cynp+Ch3ZmkoJ+KFbFVA96lawYfn0B7qlDMvptRb5SqIpp0SQKsNyjD0NMsxYkbygn
         I4Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791853791; x=1792458591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        b=dQOTwTqExyNKKch7YjKQOp9E9MzhdR+3GhRer/NZ9cRSjX7xxnsBl58CKBtoZ8ddF9
         Y/ukWR1fNpkqoclRtwCu5kqq7+J8Cgds9/wB6QdTmNOfucgG6mPuEkc+Cl/5viaEteqH
         sGhJxmD+c5EATWoc7y9xX41BIYTZEY6Hvg4oPXPMqFrwKh1F8UucqXZCFFqZxEcl5lfS
         1CboB4srDfiGcO4ZIUJ8mtg8jNvJrIXDJgp7CUdJxWDRK27Bpg2yhf6fjrtBeS1sbqXX
         4xzNmnD2Wo5AddFmYdTBTPJX9N/qaW/GEnEaBDscLdnoWf5mMCfu89sjuworlqp4kTRk
         QixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853791; x=1792458591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        b=RGyYOP5bsOlh+CNXlvFDLp4dJQry9RYbnXD8u3Rnhn/gKYh0JkUmwbdEfCmxR7evyC
         Wexru007Pj+Q8qIcq8xaAXvRnoKWr2WQYLX19mD7bNt7T5H4NYNVsQPvoT8aAuwQQpHj
         FA6QLwKIoau93dGYAQ55jruzSfz9OOkFs7Fki0uHr2HSkB9RahD+j0DlN4tv9gKOLpJi
         DwOHNVxCrDDnTFe3G7XMdYs+r0/jaBqp0xlMiZv9LaLpR+z+4e5t8kNg3IiQb/EIZQ7d
         Ue6ZKq+9QD7zK4z0Nn109LVkjeNe3CFM21fZ8+q0LgW+576PB8Es1BgQel25GIXEIpsE
         1hpA==
X-Forwarded-Encrypted: i=1; AKwUvBxNt8RcK1mzhJ7q4i+e9hfZk0IprVSAmfJ2fEtvIKCfxjsBniWLizjnnOJHmSATRrBfLePGMv2jqQFcTPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCbOLHz3uGgRz01mzogFuHRGJlE1IciSNr18N94RtK8vNM2wKV
	R4Jy0o3KTs8QI0G+bH6AjML7M2aS8KPuMB0LePN4vyQo/CgxJTbmhY92wXOCWXQKSOkXhF0Jd3R
	lpElrwUu7O8TaaMbwvnlyG773eqFr8LA=
X-Gm-Gg: AYBFou1eWetTvlIJjbBEkHPbzbeQV1bSPzGM5fSh7s6PlD6Ysw2/rZOfvW5wRwl7YJL
	WAAyKLFJ+qVnWxTVyr/Rn2Tt+XZq+c8F9gB0/H0u260wHZaFdiDsFQyHal9L2uBbiVb0VKOlQ53
	uUON5V2IEBkB0M9sXz0AOyXxyJ84FQwSn87h7PjqEnMxd86oE7wqQqNiRfuO7g0EG4uLOCKeCnp
	wmUlV/m/+6OjB8mgWM1QGr/1Ef7osvRRHtDg9326Zpn7xFB1kH+NQ8rdpJlu7WTtQ/nnIA3DJIt
	IF9Q7Y9C/BoJsNfwSAL7SL7zPcvnO7w1HDnNjIjDMT/6+Hdz9I0fX0mxkbshf/epm6vfyft/ukW
	t3BG2R6gi83FRwYf6BqvTWR1xVr35poMw7WWgLOGsi5K95gPfWVDYj4I/utqSICCaDvCVJw==
X-Received: by 2002:a05:6512:3d8a:b0:5b8:bc5e:b58b with SMTP id
 2adb3069b0e04-5bcde8e872amr3334571e87.67.1791853790708; Mon, 12 Oct 2026
 18:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012230527.750567-1-aaupov@fb.com> <20261012230527.750567-5-aaupov@fb.com>
In-Reply-To: <20261012230527.750567-5-aaupov@fb.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 22:09:35 -0300
X-Gm-Features: AclHuK90-dNnoxwZ9xm_7cAhII9ZWo6vVER80Mmoo8VfMl8VsyHGM5XUC-R765U
Message-ID: <CAMAsx6cvv6XZY=LdayuEvBAXV3NN09Ru0KCcdaufscCtMeXoJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
[...]
> +  perf record -T \
> +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
> +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
> +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
> +    -- ./workload

The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
systems get, while on devicetree systems it comes from the compatible
string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
after the example, along the lines of:

  The CPU PMU name depends on the system; the available PMUs are
  listed under /sys/bus/event_source/devices/.

I applied the documentation hunks and built htmldocs, no new warnings.
With or without the above, for the documentation part:

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
