Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699650;
	b=rk779JJicujX9u++fVR7VmZx2OLxbaufiEDy4PFGdE6g1Cqsh4nXIapBHTMBUZv3/fO7
	 eGwiVHgb8CwIWnXoLfkgTs7zcQXFfjNRAKwyTvvMuvoK1o3uFJck5cgY+IEBO9BYCBhec
	 r0Kv4KMV+7HWwODG7ZSjqpB7fwe/cTbxJ+oDm2sHTwu885PPELmX6aEiCaxZV8mlthf4J
	 F4sNa33qutEZncUC0TCzMHOcyBrah+lKZVJHNXLP7FPPcQ28CHJfVC6fL+rC8rqBh9JLf
	 sW8chHRG6jE2yBBbZEy75qYf+LkVhBOy0DBJKDngr34j/4YPnKxeRaMpdiSUFz7pUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
	b=cqq2m+Lz/2Nie4ueSOGeHYFb7JJecwyZFUM7134nzIpQ8GzBP/FdR44pAEBi0ckohB3W
	 RbgZdtMdGM1inp0anE1VroKqLEkvRYjiNQN6EOv9zgtpgoCeF5t1isPTZOLcgPLwA7UUk
	 u7rH4eSZP6VDSAbS69/bmtB8cvxwCFxd00HAPnoCLjcniKu07Qe2rH3As0Q29F74dcUX8
	 yhLTxHMiS/2RH7tE2RzNXgAqf2+PAyWGXbBk9irslZLlfRvDr5CdXLI++sf0xDylnEKua
	 QtE3B3tXyjz4QyqkURVNYbXEWYnaTWol3Slbtb6NKb3SzVKvKblVpsemte0Xzrf1tIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wxhs5SdQ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523A606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9523A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wxhs5SdQ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so41231815e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699648; x=1794304448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=wxhs5SdQQDpXVmSwxS+NdbsSkjCRC/yNtTyUBkmjLXVNFK+4nX3GmfxFwzyysm/t7M
         8hRkpajTSUKxGy+aQN4KI4JJGBrLxOro2DUGi1Ji2/OxZS2nYjYuKA00FtVdRmXTnnPd
         cW+FGRjhDepphxQ/mJs9fu/br154+9SpTGJaLf2THur4NCRWCE8DFBY8P83ZcR17GW95
         Y4hWSDx2rPo7tLbjSMc6uEn9ObGHkQaYF3sGI7u/9gB6OrzXs9Pm/JQWgg2Q8PX85Fme
         9nTh5KTjX4sz1g3XeZEFZ38tNiGzIDF//xmFdZEW3Giao7qq/kgwmOgj8DqCaU5dDV37
         2pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699648; x=1794304448;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=JGuTcpaB9tt8dh+WEbL2pPjWo9TeNQklJY0RH3MiXfuNRkdKWM+9k4mm9Ym7hcJkcP
         DcIpycM7eYIjbPgUgTihVz8AQV0WoPwCtjiNjpVI0ln1vo+/HM6CrQQhBkjOk1v3OH+v
         tIqGyMinehDin5B+YKs/LK+Z7ipUzfHEwvIQwsKI3Uli7XOzOx4/Mzx/SO6GjWHzHSUl
         ib5wbrqg2rQTOC551ch4d3ECGwBmKdjZXfmTbT0QjcUsBx+AoXmc7su5d0k+4pRmHLJk
         gnJV/dXTPElub1wbOGjGLnuDDHPB306vjbKykWMcIfVa7Cn65J0dY6bnjCU6DwyvJX7X
         WI2A==
X-Forwarded-Encrypted: i=1; AKwUvBxSnORTYUbHHpmktdVQlVJRjKw/RqjEbbygCCYY0vBLL6UT/KPDFltPLj1+c9zyvvTUaR4srQVjg0vNbz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IqM5IxkHsJ3jT6Ul+68Lg0pIyKeeplA2Z1sZ32ZPhby3Wf/9e
	xFKPXztcNUCwpVPUqIca/YDHJDywNw9m9y3X9s57cIQnz0Zzu/P1bpin60+0VZ4s7Ik=
X-Gm-Gg: AYBFou0zCeCskvlyDDOiB+uQFyqefriTo//OqisC8h2yNuciEdDucsxLySWBQ/qm5NB
	UEjc7LeKQlkIAAG3j/5mHjbQJzRx1k6e9THwNJ12pQLoaaj3Pxf/pa59gaXzif+Q3aGByvkT82f
	zTQNtl6n+jU2Vm4qnhoZZRolXFZbGuhjpqTmi7ic+aAaLdcKLcWhTLC4Aw43DTpSua1q49hk6xH
	h8ZkIA0HEWjvUxxGIAUoEO/h+AudMxXf4HfzXtjgYbDLYSd8yOHUavWiU0Ix6TRDl0UuveBhpNe
	m1EoUIlPKf+j8IDTQbX2nW51U4yYQGeshqcE5fbL3Mo3cp9SMaiVMzVr5UY3UKiQShq0+EoUdRK
	n8DMAc6hYbWS/FgGxPawTFPSD4DZNPj0fxglUKJAKsDE9+KsZunSAac/VXq/NEYLDqOEAja6on9
	VRjNWh6SzBSJgwqNcSAuQ1Ed9fD4RD+1RGpsyhC7GE/kUrkKdYztsoTvUoRajAa60a1OCtRD2vC
	1JyNiPiPpvTTYdXWsc/bgGYWuq+tknEcJi9LqlMg6Q/73BluXNTv/WV20FIR2Cbiqhq7ijsuBHq
	akMyqWPx5CuDP4g6lDsHfi9wRiYCaAFAKOKyll26+qokEr3mVg==
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr271871785e9.33.1793699647846;
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, Nick Xie <nick@khadas.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 christianshewitt@gmail.com, xianwei.zhao@amlogic.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20261017040038.3702428-1-nick@khadas.com>
References: <20261017040038.3702428-1-nick@khadas.com>
Subject: Re: [PATCH 0/2] Add initial support for Khadas VIM 5
Message-Id: <179369964713.2330120.11723763412614220428.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
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

On Sat, 17 Oct 2026 12:00:36 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM 5, a board based
> on the Amlogic A311Y3 SoC.
> 
> The first patch documents the board compatible. The second adds the
> board device tree with UART B enabled, an 8 GiB memory description,
> and the ARM Trusted Firmware reserved memory region.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: Add Khadas VIM 5
      https://git.kernel.org/amlogic/c/7db251465d5319a5c0fc46c397ebddb284560982
[2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree
      https://git.kernel.org/amlogic/c/56d1180882a32c78a6207b5364e43c2fc546cd9d

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

