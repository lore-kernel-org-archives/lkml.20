Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794455360;
	b=154GJBuFrB9HCh1rVWPUzFycilDr+eNVtWWi1w4D6JbfaKnZIXB0PbVCntMah8Ttyuio
	 la2pPBwLC/oSY/9RPTjrSRxNnEOAnk2kpgIPPoQ66jLXQTy81vCvLI8X/G6O+ifDdPuER
	 IErrYq5GWcBx/6ApMzy36buMr/5Z3IsiKcQO0KQP1N93gMFRn8OFbKOSyf0Ysic1V8jHp
	 BGaZoPBW4ncgU4YSds/vPaL2U6STO6kdGcktn37DW5wTFgHg0yPvagcN1uIBGDkTEzuFQ
	 cJuPz0kdJO+xD8bpazFwYdNKARfutQ45yWpesOWuUgtNVLHiEHsLx/xZg+jZrRxlhSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=25tsZUpiQ0lVQNm9JwfGrkVYEdwIvgyagRg9J+KAyDA=;
	b=rbveB4AqaeZixKZIHYI8xWqWboBxgkvxMff/bXcGymPJho1W6zOc09qbgBtVj0Nx+mHp
	 eyA4NdeXUImoT2dko8BFED1Vdau9tvPqqTvMHXkz+BtWFQFvrMH/KP8ZstbJ6wHGFthIb
	 ulvzPHtIRaprIckoXTVyS1vifYtGjQpkX9n8jSpvpm27ARk+P9l+Y9XfxMt7zmkMrrqw5
	 CtewojlT58597ugwgpzUQX60pGF0lVpf0TpLmK0lEZaTUaXhFzKgAV3lM++X0bB1oA4pX
	 NXJLr/pXuhPCPFLlvi2fKDL/VuReP5KaYOK09baBko9A7GQQ4nlXUpNaqil3Y5iE6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOFGclu4;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D425F606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D425F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOFGclu4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2396298a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794455359; x=1795060159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25tsZUpiQ0lVQNm9JwfGrkVYEdwIvgyagRg9J+KAyDA=;
        b=hOFGclu4HudCtVI9CQuP8pEykqKRvrYhDMXesAcE3Fu7IzxEMClz7O3PelcWZZ6w25
         eszIQU79C2e3saIwpL3wfee0hRUHfYEr1nchlZtxF9Mq6l4yiFOm0ho0oZsB5kzh6zX5
         AURwc2ibA1EQYPnlQyhV9SkKjg6xsXTBXXzlM4S1Go8b8z9MebhuJdKjZ0by/aWiNIwp
         H1LgIxhVyUjqYNRoYr+k7LjVC5uKyYOtG1VAaYHVZZgar3sopj7q+XzbhnOtKmDYs17k
         xi9j4V9wu3EFFTkag2USrKV1zCFk3NUtSuwSPp2geOlL8/Z64lTkEtG+zxnWYP3dZ89K
         AT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794455359; x=1795060159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=25tsZUpiQ0lVQNm9JwfGrkVYEdwIvgyagRg9J+KAyDA=;
        b=EO/qoLUQ/IjZIhooEz68vXGzuAhm15lGqQeU9tisGD+qKvg560f+gdWzFK/kFKLvnW
         bx8l5KRLnTUs4aJbIyAvEI+S2Do/Qytkeb/FD89gvAzzQN5nYDqV7TVUEnpmvB3jHR7U
         C0G3h22r3NuZh3acOjSaQlG2NU3OoA9sD+Kne+P/tleFyreFgYtbDIfdTnwTxskGw58i
         jOSibXKpzw1ydcNP1CcsN7MHAv4te+HoGMkac9MlpQ6XUwe1f8cE1h+jCOZWZlD8zHXr
         XDXqbVlsnjp22sVxpBP0VXDJ3TABeJss/mOxr6y287UEcH0uf/IF5j5H5b8y2pyDLlnu
         G2Bg==
X-Forwarded-Encrypted: i=1; AL+hErEkLgs1bBWAT75sb72NIGwqPwXehTlcqnJK560kcegHptdvjAfzA5HJaBCjpR4TFh6mYHXqOFO4/1ki8KM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hZ2PEBj33CTsKMuos5BV4hfb1Jb1rgXyl8Leu/TqVvjWkKk0Z
	vuuROQBl3McvQjTMNBHAm1uyLhzto/2yqXp389oDUqIJh5s1ywuuf4Aj
X-Gm-Gg: AYBFou0QWljeRDuEV+ado5WDE4wCG3b1yS1BRSQUFbeZHp7nccapByWi5gi/3baGEu7
	lMRWLHra6HIrdRenJcc0CJUg4NxawL15LGlCgTxDaYL4bjjC6XTStFDpxzXFdJQ4VxS28Fyf8Re
	ZmkONekbFnL1SGrmQEzi/1o4BvheKZ1YVQwTTS44R5sy1phvc4oII6TrolGh9QjodJMGofGYnZp
	fQ2FsC2F0MEcy+DO4wxjuI0f5bNsrXTHnTowmV41OC8Ef/yKFsuEGd5Lv/P4FiiQuq6BYQyMZrZ
	jzHd2AIjLzRD6ojjKNAUjaFKsbmdkaFc48ZUui4tEZGZlXyHsjpINtObaiQ7jVW/uihEaAnzTes
	2WbkAg1MhqpIv8hvRdfBuDedLh/9XYC0DpSXzUvUJYlsd+9400Ve/nRuO3BGAg4kaInqTl6R3NS
	phIAg/Yao3oSVc+gC//16yatS4PZbs8nu/9I6+d6lITkqks2cGKnoAW1gQ2/SPQJdNW29LZKDIc
	27lU/YN93x4y0OLKj3MXEip9FpcjOyKd94o85uDp4YlDd0Z3vUC84Qpg39/2/3bTJIcAv/MxQHV
	jYOHa2b1sfD1c4x4bpkLXwj2UsHpoKLQqAg9G3xb0GuFryVbHS77BGP1WkpNJlsb63GipR+rTk4
	4YgWVAjrC
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4367944a91.7.1794455359061;
        Wed, 11 Nov 2026 19:49:19 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c4eea2sm2135404a91.5.2026.11.11.19.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:49:18 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: TAKANO Mitsuhiro <takano32@gmail.com>,
	linux-perf-users@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] perf stat: Count kernel events in a group led by a tool event
Date: Thu, 12 Nov 2026 11:49:13 +0800
Message-ID: <20261112034914.3704801-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-208886@kernel.org>
References: <20261111-tool-pmu-leader-v2-1-3faa0fb98c51@gmail.com> <20261111110616.2249764-1-takano32@gmail.com> <sashiko-outbox-208886@kernel.org>
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

On Wed, 11 Nov 2026 11:33:19 +0000, sashiko-bot@kernel.org wrote:
> [...] leave tool event members enabled during -D / --control and
> leave tool event leaders disabled during exec workloads?

Both happen without this patch too, with tool events outside any
group (perf-tools-next cc905a18a647):

  $ perf stat -e user_time,system_time -- dd if=/dev/zero of=/dev/null bs=1 count=300000
  -> user_time 0, system_time 0

  $ perf stat -D 400 -e user_time,system_time -- sh -c 'dd ... ; sleep 0.6'
  -> user_time 173 ms, system_time 137 ms, though dd ends within 400 ms

The first is what TAKANO's "perf stat: Start tool events when
enable_on_exec is used" fixes.

Thanks,
Hang
