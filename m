Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266504;
	b=rirwkZnJwbSNSzD8+OhlPcga8qGOkqSUuwl7wbnxgh1wSZWgirigO1iOFmfBX4ZvDQPq
	 rYyBUmbX6f+Nr5gAiFtjhhG4c5irSX/sE+5h+438wlgI0JFlBptDwxYnHrb4tm/rJVl9O
	 J4TvlAFOkXl/VGyw7wlsHw3ivBHcxaXKMIPU87WRc7DdBGcuTb78whIbeLxs5+YbYEVKC
	 B4dkI12Ax9JoWjZMwYx8ntsrmqwQaJ+XBwOTTjMrq0LAUUxf0p61AZGTYNfXF58q01Fra
	 4QC2RD6gZfpyBkEguRffPGUPa7q8E6Vy+1fKfD67jgCECA4sAhLxC/KHo6+1Wh99lXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266504;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SmhMFLn1pD5xdL192Nn1266bL4SZb57SNC4MA7BB0n4=;
	b=kGZT66Tr1020STGZCZPnKPWsQRsRutD9ADo4v52ae1fARmD+y0odp2Pzw7fQ1yCrwtdO
	 FEKHP9TB3Eu11LWCGnl18KY4AhHq2JzPH4pUXhMutZG++YQivkEKV3yH59xLC12sWYFOd
	 P1LRZA8owbj5tKIo7lmhOJBCHAz2TwdV/AS5pm79DhC1tws4TTdrUihnVhmui+JDejdDH
	 oBOwHt0RUMQGbrHrrWkXzwZNUUKVD8DzXPEZ3DO0D0XdBEC0M5lYqROVNrxwi1FWUzSU8
	 pciqBn5KtvkziahAw7h5ctC4Snq/86TgFWwxoEtfdm/BgtCp28Pk80qn0dDlrq2v8Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=oTt9gfRV;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED70E606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED70E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=oTt9gfRV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794266500; x=1794525700;
	bh=SmhMFLn1pD5xdL192Nn1266bL4SZb57SNC4MA7BB0n4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oTt9gfRV9IDu4tuqFf9eN3u+BKAOUjVOSTtyE24s9MTxzuluURCCCoWIDd7zq/PAw
	 1KT/GBPG58WJttkY0dkY+cXU6bQowJEGjDdG8J1IRfUXdXDTO1I+RzTVFZYfYKDb0B
	 N2UNzzi9V4Zaj5F8V63izt1zpLq/zE6ay+qtxi+49q/YOICeQuDmV81ZObccItESMu
	 h4p4QQ2ciXgpm4gN1AU/R3wmuzVibRz33Z6EJ0NXvKxHeC9SirNYJkQseu3CE02/mx
	 XFtERUzoDggmRdALG1ascye4xYV8yaLNbnk04YTQKdCMDNXw1dB7Dfhupg5hhn5Eqv
	 M5iOsiHwRFAmw==
Date: Mon, 09 Nov 2026 23:21:36 +0000
To: netdev-bot+sashiko@kernel.org
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: jmaloy@redhat.com, tung.quang.nguyen@est.tech, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tipc: bound reassembly size in tipc_buf_append()
Message-ID: <mHuZAf-oFGkrZS2NLMDwNKobclne-YUo5tKMP7IZ53h15EAX-S7xraUmY5K99QcfwmggaWJgTcdctsXFPaMuAbooTWyQGhoJFfx7hlawo_g=@proton.me>
In-Reply-To: <179426495025.994134.5478434430372728777@kernel.org>
References: <AoU-V5M5ZCKF37bLl8ILhgeNdsnCEaiaQNuWP4K56kRfJsnhkIexZ8tFRLq7uzGiA0qNqK6shXcSZ5E4hyV0-QI0ZWSuKiJzKvMrv3NfqCg=@proton.me> <179426495025.994134.5478434430372728777@kernel.org>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 621fe41e638a70783770d9319623ec813d65833d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Please disregard this version of the patch. Sashiko =
identifies a possible NULL dereference in the new check, and Tung has alrea=
dy rejected the original report's threat-model premise.

Noah
