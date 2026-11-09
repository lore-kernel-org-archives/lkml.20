Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247348;
	b=AnKAjrP392rHJjzrpF3jpv5dBkREkzLQeDVnk8yh6TaFaeI/fzrDwjgN8Iaa0uFy8KcH
	 JU0j/n5WhBldWtiAgOWzjoSskfj/gczOnUoUKoI9zBFP/jFoXmOyogk9KAZLJ6GCiFjuO
	 TcB1FHqoSrCg/eOK+1ixvxhS5AmsMhkRxAR5LY5eVxCEtzUbjOKKmpxaYiU1EYuRjWpfw
	 O9oKWy6ZujgkZlfIev6mqa8Rmv+yh9Ztgdzvf0dfCDxjNTAE4WXSveKsS4OSRQe2mgldQ
	 DCyviUncxYzL1rfOXLqmymWv89u+YRU2qYBWtdD16mmrb5lHIardwq75cxHW43vrH2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247348;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rq/gVRzc6NYvKxcKfEXgG66peSZidPjTyfqE5LKg8gE=;
	b=rm4+8lH8oMZR8cpaP3EJ8kCl/wnBYOPqk2OxTZBt6DuAcVTyvlriqwLmIsRzIXyy1GwA
	 NgXAeTvaTHuMaZkANjFVJV6fP1uFhSwyyi5rO3bT6YEQue9sd96ZjKhFSEQ/vDyZgmTyR
	 V8K7/Nwsq7PT6o2o+6YTXpZysJesulH6++DsjcMIYbn6gASUSPzlTFfJg3xau9ify2sex
	 Rmnf2S0T+rvtYTOnrEWJIyt2zSrFpiZJhFZ2fZdERUDlx5tcwe74D35RC0FBahFFIdyNv
	 rTQ9GPpwCpgQlaxii+bfvg/NbkbhO/zi4JP2jHL9Fv+/hdD+e3beh+Ls1BY4L6KaNAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=HrKUftKN;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD00A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD00A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=HrKUftKN
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id BEE3820DB5DB;
	Mon,  9 Nov 2026 19:02:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id A100920D7CEE;
	Mon,  9 Nov 2026 19:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr A100920D7CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794247345;
	bh=rq/gVRzc6NYvKxcKfEXgG66peSZidPjTyfqE5LKg8gE=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=HrKUftKNuljCyYVA6RIMTgWRhey5UTmylQbgazqyHFKGR7bKLES8B5c5p1nAxu8JL
	 fAZMCOmIy5exdfkuWQDQM5SPU1tK+ll5G4+PfvQ/jnzSrgb+2oErzQkmfYQ6OyE6Pr
	 19NsW3aJWorciwF4CpZcHP3LAse/d1P0SMBBpW2RAvmpVDkr66oD8f0MFfuu6CRTJ+
	 oxdgYFzAfxBtSjObN7/cd4UZgxA08AsG/eTfI0qRKBKK5UgTrNf81RB2K/gB7GgU/p
	 yrwxB8/0NSzClzGE/fTVINvXFh3ZK6TdIjPPBT48yObfOUWZeaj/SWAXVC/0XRy1Pn
	 eBLUJYdExP15w==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 6P_hqUnXJV0x; Mon,  9 Nov 2026 19:02:25 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id B881320DB5DB;
	Mon,  9 Nov 2026 19:02:24 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1 thermal sensor
Date: Mon,  9 Nov 2026 19:02:05 +0100
Message-ID: <20261109180206.323394-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109111155.293849-1-frederic.mahe@cirad.fr>
References: <20260825052233.66850-1-bbanelli@gmail.com> <20260825224905-GKD631715@kernel.org> <20260826-ought-tableware-73678af4dd1f@spud> <20261109111155.293849-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Note for the USB-A ports of the BPI-F3: dwc3 alone is not enough, the
VL817 hub also needs USB_ONBOARD_DEV, which I sent separately:

https://lore.kernel.org/r/20261109175555.323067-1-frederic.mahe@cirad.fr
