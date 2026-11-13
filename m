Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602445;
	b=wG4qXvOgzo7tF9RVMnXq9KmdD5CgHzCiw+XgrXe71Tw9cZa2gMu5tH9n4t++PabdMnpj
	 Pv86t2Map0Za1qEQm/K0gXRU8Hhx6+TJhPwtSXWhFxl4GxNp/VyEkxwepHpI4Vce9JK2F
	 QFoC5DtbEx46XX6flXLVhEVt7cusx8T50g8ijLm65GDOz6m8S46Esnz4t+HwxiuUA7Ns8
	 mzmOgEJFsK65v5OFs1LD1izcYnkq2tSoksF8fZrAFVVu6Yvh+UU/46y2Hzp2+Q0rnFbk+
	 wsehr0MjEDmO+p0vxvK07U3wK/Az9QtKlDCVBIztf2ak68PpVIc09sG/0a3t/o1m9Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
	b=UijTu2cB0b94OrQJic0CFNvbYdWu40495P5tVC+6XrfTHnNbiw7CPBM9QxIUHZLmogrk
	 0iHDlP2ZxH3bS6Tl9z9uTGc2Epw2opQfUrNyBZF5FEYVEwr9lQW9lCr+3Q6bTP50eXU7l
	 RlVcwmopOeF4SemD9KezwORYtQyHB/4RE9MdYK2g5J4Um+CNUcccM57kj+VCkyF2F9xTF
	 3rRBq+z1VOhrsk0nUlJCEo+/GeP0KuZtoR/xFbTf07Ktm8AW5MyKYbauibZRXhqAmOLtr
	 kqi3LShthJZXMcmqGuxAl3mgTC9gYX6FnzQYwpmEO7tLMqy8PffvHAxhD8m5G08SvVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eQYxRWKB;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513C606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8513C606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eQYxRWKB
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so15527261fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794602444; x=1795207244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=eQYxRWKBoSn33nCjMTJbVBy19a6PeaxPkO0l+OrePpRAzD3hW5cilo/AeFE/FMsx6S
         S8xP42iKIP/NxI3wDqPhv1u22L6K9zqmP41RLuYLIsgjOpTfcuc2dmhmN6p4lMhFfP98
         5PFBFqkAJKvNbVc/OmcCgp+x7p0oQmqrCkVAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602444; x=1795207244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=TqSJdfVTUt15eCCna4ZzYc7Ep4ypRyBaZ/tVDhl77ageQHGLBh3AmfCWdATwHfHefU
         heA27KpsLunh+p5OC1FSM8iLvOdAzpxsrnn1d4Abv6tQ02z+QntxDjfezsGGbJfyMVSD
         CWnNk/JEALxIskgzjvtNYnFntSD+QAKfEQN20S7DI1n1m7qTL2/hv6+Kt8mB8HcV7i1G
         vJ47J5ANXMrfoMiT8jVI5iql+2fKTGBPvpjnggCskh940Lg+dYHeplgVxsSjN6t68j84
         fzEK2Io3wAR9IElRJWHayMEo8N1cwkH5I5RzD2ZTDjcm686WKRQ+X95Z6evYJJuKobZx
         b7sQ==
X-Forwarded-Encrypted: i=1; AL+hErHS7NDnuuMc/TTpuNBeeyotDVlQOhjHkpwVZulSHqp0IN+KGf2ofUa6d5CJmgXgdf+SfnZ/T1Ezse3oRNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y4NeYU57HHiKTl8V7/iufYY1NG13B6FSkOT6Be/mPILQ6FVzq
	9s8f1N2Mi8Em4VPd7cP71w5xD+OO2SouFoJTQY01N0jXisNC8SAewSIoraaSs1ixdSMeSz2yXAL
	8AztoeNA2
X-Gm-Gg: AYBFou1d9BlrxPalTwkU8p+hI9iqpQVXmO9zeYHJUMLng2VLRMaZENSG2T+831b7krU
	VlhCHaUInSsdCjlP7P6F7yq6te1RqZKuJgoI3XUiR6yLGil54dxiPI2Z+xa4RbF/u8YplQbOopI
	p4Yc6TZI80G1Rdmc8qcq54OMJ3XdW1gMnmP/5m4Eb4VKHvpTWxs2K4zQ7eLQ4DP3yd4Kb/pjAYL
	jliXOjZjeCtywfDWiLJdYDRO4y8sn9TXLjccHWra1BRz+7Ute9oZ6VntJis+O5Wzsp0ysZRN0Zq
	BmO3Geb4115Me0ONB0+Eby3pIaCqVZW/0FouDsfk7pvj7dnCi8zmdNJL3r5CyXkUzH7HHGggUXA
	BQBSY3Wg8CgEsck5QBWhGaKKxQ+avHIzD8397TIbfnJf8DrweiC22npdbjJcLXCjNaBNcI5KJ6A
	nZAFku46Zn/S7b4pkQqU7pqOHh1YdWSREgYWw2HKVo4DJGQ8WIuJoi66fOGXs18FWVB+AuzhLxq
	NOcF6zfkJ7qDYzSrJNRaB7yIiL7EaeRBqfsM0zzRrNR5caob8975XRSh7mOt0msFBgQ+o4Y3kxS
	9ruMytepE6DnfVkTrNXa9W5IQZsdg/cBS5EydW0CB2tY+CUgC95g0E/E8JmrLgOrsG93bSEIGKQ
	s43yf3tjr5heDFQ==
X-Received: by 2002:a05:651c:41cf:b0:3ab:4f5e:3edc with SMTP id 38308e7fff4ca-3ae2b4f0263mr10829831fa.15.1794602443656;
        Fri, 13 Nov 2026 12:40:43 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135c232sm1090848e87.80.2026.11.13.12.40.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:40:43 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1991171e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:40:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHC6WIMYytFK+5B1VH02CqVAHmbZOM/GevmTB02MNOvKa27gi3fwrjAzhhMYI03Xw/Dsgjbq83W0Z9hCis=@vger.kernel.org
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr76502555e9.24.1794601957270; Fri, 13 Nov 2026
 12:32:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
 <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com> <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
In-Reply-To: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:32:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
X-Gm-Features: AclHuK8SHFgoyjCXNJrs3RjG85XKuoNtkqoClolncw8zp41l0jasiLh2oN-rCLw
Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Following up on one piece of my earlier reply:

> The idea is that fdtfactor and the overlay fixes will all land in the
> upstream dtc project. Then as part of this series we will bring both
> in, so we should be all good.

Thinking about this more, we won't actually be able to sync and run
`fdtfactor` itself from `scripts/dtc/`. `fdtfactor` is a Python script
that relies on `pylibfdt` (similar to `scripts/make_fit.py`), and the
upstream kernel maintainers have pushed back against building `pylibfdt`
from the kernel tree's copy of `dtc`. Since `fdtfactor` needs a matching
`pylibfdt` installed on the host anyway, `fdtfactor` will simply remain
an optional external host dependency when `FIT_FACTOR_DTBS=1` is used.

By contrast, `fdtoverlay` is a C host tool already built in
`scripts/dtc/`, so we _will_ still sync the `libfdt` overlay
`/__local_fixups__` updates into `scripts/dtc/libfdt/` once they land
upstream, meaning composite DTBs built by kbuild are still covered.

In v2 I've documented the optional `fdtfactor` external dependency in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst` (as well as in the commit message).

-Doug
