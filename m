Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699648;
	b=UuVI/wjvFTMUb/AAVN5L4WoGzN9ZRJPaEW5wyn/J3FSJpyDCKtW2VFmu+QgixZBK4QJ/
	 HjEIZFSgGKJc4LnORJa2duMUW4WtQQxS7xk9pHET1RsRMVRMi1p/pgaIQd2N+ktMjHcYv
	 a84r4DUmvnY5UeC4iglcCOSeuoqo+gTum6tL7ZXkm6YK3n4RAuEPmUkStrt6ld0/xsiIL
	 xy7ZplBZ6Xq165bzlWDRnzP6WMX9NraxsHbGvNhwH7uYep7v5SWU+Sf4RQUZpwSPJt+vA
	 upsFkF7v4flDSt+9GdmZrLPqoSGI2dNr11Un9auyYwRxUUqrnehwvV0mSSuT7NW9mGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
	b=z0JsQFzplCnXdPo5dqWWjxpDipcY6N6JjP/27IsJtVfrKsKnKtRgb2IPpZp+Lqxw12wf
	 ffALddoG1RqkpBdtWDMVoCSZx0GeHlsthpo78njSedF1abZpPU+NMUSEiQF1dMG05A0DL
	 ywaHF5VXpYJ51InmeH23R0e2LVGVzM6iUdRVuj0QKsaY/bXpVtMk+Xc15x49V6e6xgixz
	 tM13XWf+rI6q10b8omxXCFxJHBP3CNMeBGUNodIz6+U7lZNX0yItKOLS6dA7axWt3EnQ9
	 kBo2XniEO1YcuAYtH7ef1Yqwl7CtIT9nJju0s6Nj315ZzQyYd1F7YNuuKyE1fbSZAZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V7754Six;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9A6082BEE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB9A6082BEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V7754Six
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so35382535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699646; x=1794304446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=V7754SixUCzWY/ur9GCxnDEK5yQzADgaoWUgg3pItG/CpNSHi4Op1t2Cad+mggu8iD
         +gygaZehZEM9vwjK7eaAK9S3ursV6KoYB7m/GKdIgvSCiB/CXTvVjLHiJZ/l5TA3fj/T
         ndQIegwdBHWlKsSP2+WJzo67ZIGbxIvoRDtJxmg7eQLgcMoyWdB0Oa0qaLgBpQ0gwgYQ
         t1zsQ9eGQi9WcH9oN29f9+b58bM88c6JZbNl3grp/QZrs29xJF2KH+q2/9gj2vlxnHJa
         coE5a6t3uivyp60Go4uWbK7OgTo8wEcWriTNd7SxcvedwjJ+UKhhG2tvwQCPbap3zRgX
         ek4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699646; x=1794304446;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=j9GPDAC6vkGPwagRtIe0OqY3kKUbrDoIeiRBhaxrCRxuFrm3PmpVMWewHm8YK+gNoL
         xd7/0avSkyULjyn0+XwtEiKeh8HHHLYrduNMrXaDuhTinbbzOGzNcx5vhkQpYQ0pHYf3
         dakvStF3o3GJ8QF3ekJ8LmQ9ayxB1hpihu+GzbJxQV9J4yhlGUYnoRi9ck7RsgvtVRK2
         4+hjcwJcw5Zf8U9jO2rXa3dcAwJ0xPbBtE0ZgFZC3yCTmqB0jHKS6m1zUzBkQq00HApX
         cyEnUofap60l8AwUgikO+I6kw7nspaLi+soYEJk57WL1Fg3NbbvsbnN57Kw6vyE7Ypq2
         11Qw==
X-Forwarded-Encrypted: i=1; AKwUvByJMhRremah1ZfrwhfAkH/70QEuVWALK39Xl9Ctzsd3ON4L1XurbjU9+eIvSBKjWnqf2YUYAw36ANRcKQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kbhAYqMzwbIDbG6BePnp/hnEMhsjkE5/0iaiQzmq31Gh0IvbH
	weg4z5QkoREEn3m2OEFxmH++ef+6s03WgxWlyQETsbU7UP8haGWGJleb7tQKfoTraaY=
X-Gm-Gg: AYBFou0wB4hjBSYsRIhFtqgjhBVT8d082QJF9HYNnf1NRny7R9FQ1uKQX1oNLFk0Asw
	cVPbfHgfo1kwq2Je8aSoKpaZdzY+2l1uYc/8tqc3gp8lBMwqaiGOLqg51dyzKulVFWzIyU6vdL5
	8V5FQYQJBWA9/aJBqDw9XdTh79otFjY4c6HSPQZZF24Ni8ITNrwZhT6Cv12I0B97jnRMOnq/Xnf
	tRdQX309rlLH1jfwP/uUaDxacmKCHzK7O7RJj3AKWlFc9/3vR45Xytp+uy3j+igyf92NUX9PNaW
	b3tvMKvhSyBZI4oPVHRMagVn4WkvBb/YShrXYyr3pd7JjTgAUX7GUD8IGWX957aH9sCIBIgduya
	DDPXkS8b54L785Ts3U9u/A3JUEQrkvwqlFP3va9WtKM0BPKB/Bm9zFqkTxlLBXqr7LqK4SNnkmh
	VARu1uhimh2FsvZMkes5K8bAXWn4K4iSsB4h3934uTQkrXaiy2xSeOuiVIfqk8iappHmJKxDUvb
	/GFHe315NRhkRzvQJ5cCBCu0WIyKvDnwoJp5kAwDROCeKXyJBGWwutmlFQVdBAAXmIejRIRjtMR
	0ZqnWfibqDbjpU0DhmBfKQOIjp98+VU4ieaDxBfprRtuDc2ei8HpBTy64ILqnhOV6/22Wl+u
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr284036325e9.22.1793699645988;
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC
 address and LED properties
Message-Id: <179369964538.2330120.3831399405443215739.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:05 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Sun, 11 Oct 2026 21:31:39 +0300, Fil Dunsky wrote:
> Two small device-tree updates for the Hardkernel ODROID-C2, found while
> adding OpenWrt support for the board.
> 
> Patch 1 wires the eth_mac eFuse nvmem cell (already described in
> meson-gx.dtsi, but so far unused) to the Ethernet controller, narrowed
> to the 6 bytes of the address, so the kernel reads the factory MAC
> address itself instead of relying on the bootloader or a random
> fallback.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      https://git.kernel.org/amlogic/c/06c71037627974652c08ae107032d7459f1bb0c3
[2/2] arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED
      https://git.kernel.org/amlogic/c/94dfd6641686dca8d49439896efe678b47e05654

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

