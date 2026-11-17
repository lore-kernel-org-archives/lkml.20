Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925494;
	b=CRhJiZp4UtpIxGM7m3mvE230n2xQIR+X95O45/dHVMImBzFHQz+wGJygWMoxVJCb5HCR
	 dU5fGA2mPkQTFz0+vX36txo97f0GjlFapB9n2bwefInpmd0Vau0OA7vFtQ92gRvOQS634
	 2QCZf6aL3B1p6Q8jtZ7idSUBJ7NSF+ry14xzpn0ecqovfGaDaVYNRtR8hjtLiNMv+K4aX
	 xI/HaesY6g9U5JDGLLf1eRq3ccrHRkeOxQtqdcjbcEq+KUHvM1/GyAiHXwnJ9Mpqc/fYA
	 ZL5GTO4vt5U5IIHY5V1X2RAyIDBm7B5RkFqtcEg843qtjpXUte6peclPeK2sbbOxRLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925494;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=j/7cWyCVwtlpm6mypk4rCXgyNna2l4Z4486ikKJlJQ0=;
	b=5fRazH7MegJzEFi5Vna0FBkVP91dDR2oUnaRAQD/tWCQPorKFBM/Hsy7RptVwdm/7xy/
	 jjQkUUBGoXJTgVjB2q1INSfXLVjrDBSY3g1Izz6y27S68YU4ZViLDGiWCMxCqRRxZDEEL
	 g6dTxo7WlzEJMxGv8bPI0Ev8V/lk9pJfdpDnhqSHnYiWkfLG4xVW6KU//Rhba9nVAD0XP
	 sW3SHa0azsmsQoS3whJBpnEq1u+rxfc65v/i/4rzU1gRBKC0pi8P6AmjMCmPYgZBv5XWP
	 w1PEbEd6CJZGg6jw8eYrvepwK2x+vfXDTfvrULrflPSz07UhfJPVpedn0pcpZSnma3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=BQF+2GpJ;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3549B606A31C;
	Tue, 17 Nov 2026 14:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3549B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=BQF+2GpJ
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jTRns31vLzMlX9;
	Tue, 17 Nov 2026 15:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794925489; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/7cWyCVwtlpm6mypk4rCXgyNna2l4Z4486ikKJlJQ0=;
	b=BQF+2GpJRaXgNium9E8VjAlhLtGttDwOtJn86l7plSHuvFdBSEwPTimMwjghj2LNil0l10
	TuYVzGqQPS6UnQ+Cg2Y3mI4rhlHKSZ4G8KiVMBsydRvo5RW7aF62HjLm5UlOFy83AvT5b4
	i48nswb5pb1wSjJTOvENiz8b+gAdLY4SDI2KnnomXAQcgWkS8naTvwKk0a17A0TAl6lVOf
	z2r3BBm8/4sLTrjbKY8iqkPQmsOxCJqXXkFyqudcL2DBM4kJn0UD+S7IejCyB3nXPutrVP
	cUirGuS9k+S7AHWju6B4MSys8HM0NXfAeT7+gEOs50nB5yF9LkrzSRDbeN5wFQ==
Message-ID: <f00ae38bcd0fafdacefe21b6ed96164d455301da.camel@mailbox.org>
Subject: Re: [PATCH] drm/amdgpu: Harden against potential deadlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: phasta@kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Felix Kuehling <felix.kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter	 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 17 Nov 2026 15:24:47 +0100
In-Reply-To: <fd9cc070b3a4e28316ad2ffce942227e33974016.camel@mailbox.org>
References: <20261026141541.469727-2-phasta@kernel.org>
		 <bcd63af3-d2ce-488c-ab96-2b11536cd50c@amd.com>
		 <1ed5c075-c66a-4144-b23b-a9d80e1fc2c1@amd.com>
	 <fd9cc070b3a4e28316ad2ffce942227e33974016.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: zb3ge4x1gmw6augphdkpqbti7h9jdknf
X-MBO-RS-ID: e7586474e1991a176c3

On Tue, 2026-10-27 at 14:18 +0100, Philipp Stanner wrote:
> On Tue, 2026-10-27 at 12:51 +0100, Christian K=C3=B6nig wrote:
> > I can take care and push the removal to amd-staging-drm-next when I
> > find time.

What's the state of this?


P.
