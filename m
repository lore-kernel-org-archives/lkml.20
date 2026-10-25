Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792889282;
	b=vH07gvCwjsUlRYSjb8s8QRAWj+E7Bit/GMa0YDql3Nq3FKzIcv74hIS2UTR6Ioa7PWZy
	 EFcIyGpz8p0I07R8mKjpb5K54r4BNEFjnD+mqcxy2Y//rkyOyKuYaJiGNIwo5a4LuJng8
	 wZmCk0KtgoQlSmd8Paq+OPeZj/jh19OBirba6HjA+/IThZ5HN94MNHouPeIoaL4rB3n1D
	 3tvs2ZBKBc/rT0YK2x2+u/PLYgjz1aAnBpnlYI5aNAJUpP3IYm1grDuWHNfdvJmjxnzSd
	 dQocY7z0/cuPCgb5YFoU5bpEueY/sUFG6k2+WnQis+H9aEZlzxUpbBhfFKubXbt5BUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792889282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DfLsQ+L49XY146PqWuFFz/wd7R+ne08otmYizj5jKak=;
	b=QCv47KE1+dwY7Af4KGzG4r8zUESMlpd0OZp3PNiwcTROr0xBzkwsLitDUwD5/Q00qnvr
	 k169OynQMqhoIQM+RyH+FobQpCJmh3zjwo52uxUz8h71vwGZ8wygfC3DHlu+T+N4QKxVR
	 bzHRKJ+qosCe40Wx5iIudoVRkQge+mZVC0gedMHSjMlnieGK/K+gzW2VR/zXiMdXKh1KG
	 Ck++0FbdOjx+T1dDYctiwugKfBOB4a7gcGjAfm3XCE6hOmWmMOa2ksJcI9npXBYlFdimf
	 lptmJxCU+NOpSsS5KfNiyYWxGr59I4G7ZohMcubgpJJwW2r/S4CMEhjO8bJKSpv5GNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="q/K3d3zF";
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B7B606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B7B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q/K3d3zF
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28d7c729fso1081634b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792889281; x=1793494081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfLsQ+L49XY146PqWuFFz/wd7R+ne08otmYizj5jKak=;
        b=q/K3d3zFKiavoHS/XaYG7Ffq4unbWYm9iIUGXmi4aRVAf3pbfOyvKPv3sI6A98BemV
         Yqo3mTGQdO0fIogMzaaYP+uw98wuubOfwCObtP2jTgW9W2sH8uK2wjhkkfHPG4vf7aHe
         grCYd29OEW3o98UbsvooK/QqOzFJpWOhz+2SMYM/bIG50nDJnhkiPNfxa7ala7GBDjlc
         W4iukfoZTKSbUApRJuSSeuRFM8zvtYiXDo0wgciBHFuijVtA1Q+a8Y1dF8x67RkyXT7B
         vZtQsrTMZ5K1nc0NlwUK92qxADOF2X9luaXZRopA4KfPVER4yH+f3yEpSqEGS87LiOX1
         KgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792889281; x=1793494081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfLsQ+L49XY146PqWuFFz/wd7R+ne08otmYizj5jKak=;
        b=X4YQ14GhAIZ8Gdxf06yapObNXYoQm8zpbB16VuhLwSTb/P9trYkZeos672phQJ1sJh
         UAtoPsbaEDLzKE3VTho7xUcA7DyyNc3nBenhenZiHGQJJkXlZUUb6S1p3D5EVm26CtgP
         +vKBk2BfpTJmc83Om2ZED+7/Ixm1+5PjsiPiKCZi4noJXQL6PCI0zkCCfGndy31Pcqpf
         RqOti+ykeMm/yjeQrr0deeFSfbSTnT6F5ozy+eD0iHeP/DazwP0fsFr1U1M5CYKMOBPy
         dCms1NxwlXOC3OtgwAhxWQV7WKJ2gAJjpoMUNrjskK/5AjUNoDbpqvKA0+2yg0CQGsP0
         B24g==
X-Forwarded-Encrypted: i=1; AKwUvBx5ehSDlwskQVXzQLIqWFLl3YrhlIR1Jb/TDA0iFq8+5arI5FRDFVczuU8Gxc73zbNzeMJB31LhDf9AgUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfIcYpmhITB6ChRe7EByRocQeg2YF+76FPgb95QArhmRO85pnQ
	pa+5YocXOjWJToHqSrTVmg9W3EZWR+26SV52iLcKPRc05nwIVbmk1c8D
X-Gm-Gg: AYBFou29nfSwxa2kgNDXTkRid6WKFukiio4lPUTrUaaUMEuHoCztNp85RdoJTzGjjBx
	Qq+bdlqE3N5vqLn0zX6pfvga6opvZOQSiylK39YeyEGmma21hVuSiMrk4rsPigaNTcJPdOFh54O
	v/3d2ukO/dXgQnoHmZEFztfaZbeK55nwS9e4p0sAnAyxi62z2nzOWGpWL5igGj9FwXRU/NLeLLG
	LN2Lc0+dyVFLFl6JGgfK8TXl7rQZcWFhuegZqfdGDhmnG1vWnQJ0MOh32YCYs+p0eGKnAfXdeYu
	mJi1xCpKdSAVDztFIrvJfUKAa4M9ed4c84w+2ek4cT/kxrC29YemNXvQqDgDVVfcE0/1LA/454D
	+XFC5zY5leVZewKMM8NF33rSenrlqerNY4dw/o3xqqcI4li6bwlQeSkCwJEIuQe73qzQ5cd6Gmp
	g0LvwKavXSTpA4cqcXkYvaz2Zkj/QBBs+eIa0MCH0lDtBGQw4/Lp33WEMfyK0MyH2hNW0naCmDa
	qps55ea9wlzEnAZzkBLfHFip04PMjqMjAUTO7TIKSGL+jBj4UNKQ8E31g6hZVzO4qUi8Q==
X-Received: by 2002:a05:6808:14d4:b0:4d6:9335:d535 with SMTP id 5614622812f47-55c0041c568mr1889025b6e.66.1792889280865;
        Sat, 24 Oct 2026 17:48:00 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm2315505b6e.9.2026.10.24.17.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:47:58 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org
Cc: Leizhen Zhang <lzsx618@gmail.com>,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracepoint-update: bound section names by the section name table
Date: Sat, 24 Oct 2026 19:47:49 -0500
Message-Id: <20261025004749.432830-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019095302.5a4aa377@gandalf.local.home>
References: <20261019095302.5a4aa377@gandalf.local.home>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 19 Oct 2026 09:53:02 -0400 Steven Rostedt <rostedt@goodmis.org> wrote:
> This is not a fix. This is just passing a corrupt object file into the
> build tooling and showing that it fails.
>
> Show me that this can be triggered by a legitimate object file and then I
> would consider it. Otherwise, you are chasing made up bugs.

I cannot, so I am withdrawing it.

The only way I reached that strcmp() was by writing 0x7ffffff0 into sh_name
myself. I have no case where a compiler, assembler or linker produces an
object whose sh_name points outside the name table, and I could not construct
one from a truncated or interrupted build either -- a short .o fails earlier
and differently. Without that, this is a check against a file that cannot get
there, which is the "made up bug" you are describing.

Please drop it. The same applies to the sorttable patch I sent alongside it
(same shape, same hand-edited reproducer); I am withdrawing that one too and
have said so in the cover-letter thread.

For what it is worth, the one thing in this round that does not depend on a
corrupt file is the undefined shift on e_type, which you were fine with, so I
am sending only that as v2 and nothing else.
