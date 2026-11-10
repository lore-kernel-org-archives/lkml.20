Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278421;
	b=UfAvLdSw3znQ1IoxLWbLpDWI04PcPwGR+2YrtqXbQFpynggvw4qkyGH8GwwLZMe2Shjl
	 5FvwXpsvjj2gaDLMZ7kCTshPwTmG/M/XXjMrpyaoAMyoTtoOCOEypqv5WrtJyHIhU/YC/
	 i+sPnYwejSJN5Je/UkzYW2aFNgRFrmzm4cX26nxLscxuuokjFNZNJjxaEVUzMs+4stAWl
	 dL4W9SUwEBkrl4dqsNyAfhA6LgfFKmnWZSOr8jY3GgpKSxFgKcb6UR8P3fONIsWG/++LG
	 u57UklJ0XYs+6kQNTJJQiGCo+UuGtunSdBNndAkjOd0mMb2/PuCxVkxvvng4xHrLwGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HM+XyEisFCZIwucULiILX4kMgQHO5fwVxx7FssGS5nA=;
	b=LMkvkdP1QfyTW72pkB+h2rKRJ9ni1tcqh3qnV4q/0J3uSvK5DqBHCakFpHjXVl3I+AZA
	 wbp/gTyQeZd23q9cu3YeYzpTmpG/227Ri6VEiJnFPtrByb8AKcJBk2qwAJQBrTPNYqTh4
	 4g/XzB4te5PITzIwHcQ+kHGT7kL9J3hIuar1aXXgy0UUxIvFFaF0vvaxLAdh4Mifkvx96
	 +S42fvRoVM7tXeaKHKe5Y3+ZglkBFzxKeV8K1eREK7ErDCeG7e+vTYXHHZTSrPneOMBrP
	 67PqPmgsTRo0Xlp7V59IG6cAVYO8l3Gb8QRO6MasstBqsJX5uQk+cHObEYDkhmYK36Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSQ5V8k6;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE94606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSQ5V8k6
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0cf2c0785so15358367b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278420; x=1794883220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HM+XyEisFCZIwucULiILX4kMgQHO5fwVxx7FssGS5nA=;
        b=HSQ5V8k60WN+aHLL0FYylBzscTr1Fiafj5adRc53D0wzGY6iWf6qCiJjLoWkGwpz4y
         MkYNCGFYnJ/RE9qjzrVBgGKrwDDYCzRKzwgHPlhUSwekzzlHWw9HH+IQNy0o8U+VXaNP
         cqLof6bJnvzxk9HGAwdDf9HB2QeiQ5rfgWL27nHiZjF5rXGdAL7n6JKVOMlrXmIWJ4R5
         lKY1JsyawlU35j8WiIY4pI1kHZUwTEt1zEvj3OPagtrrTDNeUn3vJ2V01YIWsSE5LaKA
         nmPyCTL80jWaMwUNW6ptnKmZy35E3xQIOc1tZrD+1LZszW7GzEidV/hN20MjeTJ/6UWz
         6Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278420; x=1794883220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HM+XyEisFCZIwucULiILX4kMgQHO5fwVxx7FssGS5nA=;
        b=jnV1krCJrudFW8ykuWMF14Xa+BwpO1Jq/vy3NkhJ+ra6K+JWZ33u9IQGNAHiSw5hYn
         jzKKG4S6/oWz0cCAwdaRp5F7pjNjRSImF7jIQLtxB69LT2U9otUwKC+JpUTtjfYnfyTM
         +BXHP7YHv3hxROlT2c379daqWofTreYzOa4cVTYWRz9d7UkAXi79ds/rA+jNIb5cVYfS
         nLKawbR09hfg/iU1YXxJtne3ifZA3s3USLCC4mwhw4kecY2r7sdLBM242uUoeHsmeK61
         IaLrGiqJFYv+g2m0t2zmmgnuQqbWdjT4rEB+c8GRud+aQMwHeVzbLJDF8LUZwIAO5O0H
         4LWA==
X-Forwarded-Encrypted: i=1; AL+hErFZcE6OrmSV+WsnTqK2dLEv97HFeC975oOXn9/IT3oKFuuVPEZCu2t5gjuiYUZcVn5gklVABv0bqA+GxFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kf7q4792sBaK1CXdUaQBwliCaT6yUeSb67jvKyYPVGkZCGQv7
	JVR+qrZJhT8AnRde4V7w0I3OCZAtF24VDh423VnkFxN5+49oaWbWL0aH
X-Gm-Gg: AYBFou0mfi0t98XEO/zbE86eCKtgEXrNLpf30UojeOecfmpee/g+gF9mOmnQBUickkK
	DFGSptEziGueehq1JT03VXpydhaItCV/jc7BhQ3nwg+JsZJjZynHaeB+5Gxh4qe088gK9Hf6lPk
	GYX8wzZ0crg1BhomZ42Szi/HdSSFf18pgjmpRVGy2nDrawzH5YNgItkfkrHOAmvdrCiNPBhsPlv
	kNPwIeI20QSRCJjoA6TV2tWyDKGCMCi4SljYsWUr7MG3RMDlKEABAhJfrjpVJAYZGl0vFzXahRE
	GMUSSMcoHAsZsdm1RAm644yFsHUGEEFI5q+vRIgc9NGDb2Pv5Hr31N1SaV5ywAUudjf0H8TGATy
	oVm0TDXhyWcDobg9PdE405YhJdlnel0hHY/gGMVupWbiykb65CPG/GNiPGq/BjTNxtYf+EbAzev
	9ry/YoBmNBWkfmAhuPXfIoGC+/Zo5b+j+36HvU++6SJkDyuSFxQCoEafGX8mBX5BcHjOJxANHDm
	SyxbchSY2JfRE+dxslZqwuSIGuhoaClK/Yp6vojF1MN65p4xFj2IBN1SFoVSoLWsNyfWVj2CtF/
	ZV9wlTY4C6eEUM/3oFhK4X35pv1Js8xkgFY3TusKPPi55HXOLKTu2Q==
X-Received: by 2002:a05:690c:7403:b0:8b3:90df:6264 with SMTP id 00721157ae682-8b39293ba9bmr7395247b3.1.1794278420282;
        Mon, 09 Nov 2026 18:40:20 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933e0d01sm9313377b3.22.2026.11.09.18.40.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:40:19 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org
Cc: dhowells@redhat.com,
	marc.dionne@auristor.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	davem@davemloft.net,
	horms@kernel.org,
	jaltman@auristor.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: Fix rxrpc_sock UAF caused by missing poke in rxrpc_abort_eproto()
Date: Mon,  9 Nov 2026 21:40:15 -0500
Message-ID: <20261110024015.198-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179427443746.994134.16851409559930782509@kernel.org>
References: <20261106011550.59902-1-juanagusnicco@gmail.com> <179427443746.994134.16851409559930782509@kernel.org>
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

> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Critical] The patch only makes the stranded-call UAF a race.
> - [High] rxrpc: race on call->_state in rxrpc_abort_eproto() outside I/O
>   thread

#2 is a real issue but wildly exaggerated.  #1 is real.  Neither was
caused by my patch, and I was already aware of both.

#1, the "critical" one, was found by my LLMs on October 29 and raised
with the maintainers and security@kernel.org on a private thread, along
with its patch and reproducer.  The reproducer triggers a UAF on
mainline without touching any of the code paths my patch touches,
which shows it was not introduced by it.  I will send that patch to
netdev now, since Sashiko has made the issue public.

#2 is a race that is nanoseconds wide, cannot be meaningfully widened
on non-RT kernels, and yields nothing exploitable if won; its severity
is low at best.

My patch did not cause either issue, nor did it make them worse than
they already are.  It is compatible with the patch that addresses #1.
Note that the issue my patch fixes is significantly worse, since that
UAF is deterministic and has a reliable LPE exploit.  I recommend
addressing it soon; the patch has been available since October 11.

Best,
Agustin
