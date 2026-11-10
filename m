Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304482;
	b=MPpaXYe6qQwseek1BPV7qKpFIgxSoc5zzEq6HwF1UVuTgLjApXhTfnEeg93dzBkxwJab
	 /v4DZ0L+e70yWc4Dvmn0lJ/Q5DxcCabMp2V9msM9niKOIZqMGHkVWl4NjzVQa9SxNX1C3
	 ROERFOTeiGwx9FpRkrg6lAtZMYRT/0EKH2hRZp9aTgDZjUYK4J8TtXvp0WzKTqpyv8bLj
	 wHRi1MHsp02lWPnkqBeJE7Or8x1uIL5vqy2FYs27jZlxM2snOer1b3aUPSGzqZCRy3djN
	 ic/6DxdRdNN0dJlTE9CSSsDeB5RKJVO3Mbbmcc+FdT8BWI9ac8mvJ/XP4gBh9juG+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
	b=20KV+BDy9x1p8s/dkYR/1zu0Eb5VMQqyiZzuRJO1saEpoJfR6hu6tRoL+3o4J60eBXq+
	 bUW4liKfiXBuQ9MWuciV5yld6a15fyFffqZuQ4qJMvQDF8/6yfKVCJp/cfDzPuKrEWqqg
	 5JxnQvnq5jkSxEx9l3fjd621BXFVz6jZw9osD5A+Ku7/qFHPXepHfsrgEGQSDkrtXyUud
	 /EUp4Fc/r8rxzu0TW6EsKvl3tXlUQhPBdG0xku/YVUjQEsADrO2jqSnyXJWs5sgigBe2t
	 5SCAIeEXNPH9w1JV874whtx/HnCbeOTvd0ng3luwXJWSqaNqxHibPw12QSVuGWeHToA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CldSljc2;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EEE606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EEE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CldSljc2
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11799655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304481; x=1794909281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=CldSljc2YDB1K8RmxJDeFZjd2LVdS9NaIH4OGfpHmMJoctX3GM5a9xvVKV4saZJWu/
         BWGeGNMj6H2n24m0+PY0cdqD7OSFs20lSGZGBRMLMCh8mRBiiSvJFyhpvCmkDsMH5g9N
         tqiu3KwHxHqtctw5+o+K2gERzbelRMd2UvmNhuvC4mt+nC7t+U2nYGTfkVTRHlWfOQU4
         TmHYxhwruyXtOIEsbu9VYPvrPi4iEJkKJhr4CMe1GgKcmGSxTJEAUcJOdxK0wttfKSAc
         NqujhOFc14aMK+XJ+iA2tuRJkUBDtt63tBeySZ4zeBV+eOrAPGw9l0AdctTGmK57HUXm
         PG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304481; x=1794909281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=ctCtapQ4nKvVfXv4gVA/QwdTF4ct0BuzBMkreneRdfA7MPJXciyE0HTbqqsKvMKYlE
         W888AsgWccv+exm3rGcpUyBzMYn9/apCZ896T1S59X4fzQ4k7dgF/4pU0uGQKIgRK4x9
         1fgvH0dB4uhDLGnlXASB44t3J0KDLWZz2cO8JB/7bBKhP7vQZLFyFKnX2Kp3eObtMDvh
         D0xAqJogBhybTuKEuKqP+1n8vpRCD/FPBsovzEtp9VyogFm1hv3q77c3xxOuYg46GR0K
         YOuXaUGPozA8Q2PVbWyzzbnjNuNv5uARo+5FfVo79Q3eDnDvmUkahxWrjloo59GMWIhd
         z5gQ==
X-Gm-Message-State: APuU4Z/Y1GUbzhJtVKRU6s/JlJosnxeelFNaod8//v2tYMu6AK2lHB4T
	fN9PBa0vCS/1e8WXFIo93ktsIpIPBTbvkCZy/YLnPx7q18yGf9ASOfqN
X-Gm-Gg: AYBFou1mJFCnnmU8Fa4wk6ib2wFBKM+GE7hOOougl72teu/pNDK+U1UvZv8TKK7/N92
	nhZjI3dMIQjyffMG00uBx974dytYgdVZfnz0s8fBZWF7cfLzBRh6O/CF9H5K8+ZynA99SQndFBD
	I5jXgtHBy3p6z++dW12hdCkjcIZIW8Xdt9bKDfIZ+uU7V7bDIfxuQWg9bpu8glx8ZeK+B6KuLlX
	Uq/GtcZSVtbhvjBAgLV2c4ylEE5bP21hb1WuHg9WTbWpqQopliTSQxXIrT3hWBsMjGHvdfsmNq4
	/A9571p+JNS+lkjDL9WQk/9fH434HSKOqZPWanbYwp//gjuvGlvq0c+vwAcLT1ABc2QP12s95Sr
	Ltg8TR5FQ8F4aQuVOB8MEXG1Ca5uiQfmNsooJmIvTWkcW8Thiqf1pj6A0CE6VjfhitYwJh4B3f+
	wppezFvsCYsC322pXd7zVZYGZMcSg0RIh64ho0YYD3EAD4/BT2RfDlwRDcRZU67Tl4bJpbD5UBi
	iWeFSm1lmmXv/LCpxQpBzAzfKzh05/MnmC6xBrGT0KfaxqUdFhrDXRRCmZbVc3DkMq+cy5WeP1E
	dn/Z9FeE2LDKMOcSqs2VaIHx36+o/2v1IIRuipuQ2akYp5q9tltUuDovQxxdxWHXJj3XZMP+6yx
	khHI1rg==
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr43740995e9.22.1794304480565;
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc? ([2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm48483805e9.12.2026.11.10.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Message-ID: <873c22a2-fd3f-4927-a06f-16a73c30de86@gmail.com>
Date: Tue, 10 Nov 2026 10:54:40 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
To: James Hilliard <james.hilliard1@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Language: cs, en-US
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
> fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
> installing the BUSY-safe divisor setter.
> 
> [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
> [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com
Hello,
thanks for the work, I wanted to upstream my changes [0], but got 
redirected here instead. This fixes the issues I have had in a better way.
I have tested the whole series, so I reply to the cover letter, didn't 
make sense to me to reply to all messages with tested by, but I am not 
sure if that is the right way.

Tested on Unipi G110 controllers (Rockchip RK3328, CPR-described
64-byte FIFOs, ttyS1 and ttyS2) on top of tty-next 6628e7d4c6b2 with
the two prerequisites. rx_trig_bytes now reports 32 instead of 8 by
default, and 1/16/32/62 select the matching hardware levels, checked by
chunk sizes in internal loopback and over a real RS-485 bus between the
two ports at 9600 and 115200 baud. Changing the level mid-transfer
kept all data, and the level survives termios changes and is kept when
set while the port is closed.

Tested-by: Kryštof Černý <cleverline1mc@gmail.com> # RK3328

[0] 
https://lore.kernel.org/all/20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com/
