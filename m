Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744178;
	b=YWPnI8hnmcde6dvYzRgfvsYSMlOod4OYOC+cqVHM/1wdrxS3QPMetw5Yjid5BviKAxys
	 BR4xNTZt9eNibWDaHVm+O7rFD8Qxf/2JStHBgWMtoTB+fpHhSdzTkkV7sfk2tV9YTMDXK
	 fzTdWOtdXyMHTKgdaLOjNd3+VbNDowiBs3rP6vrD6s+nFD4RdG0qLOfB7AfdBlBrdmqu3
	 8V+iIlSTT5qbdCtsSd+eBQQ4L8ViHpjUJePhhA8rHWL0Mx5YoY+gHVdxn8qwl0js9hx5h
	 b2qxhR3qX5eKbcSH0lbKUovqUsImWpHoI29I+RKLqnXgUqlQNIIN/5OC9wnJfnzSw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744178;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=a68naecbXPiVp+RBiDOlkn0oTW1XFAmC0R9J837YGik=;
	b=msNUVN54vd05f9rpDJz5xEYBKc3Bl6Q0i6VWX8Pc7ICcptmDcBJEfjLeWsWVpwYTwa5V
	 NHAy+M6pktcHVm/D+/e5/PtG46U4UIoQSK6XBSDE6ieQrajyO+o++7U/0+HRYPntFIOci
	 g2d9PhJyXKPwFtwTHHtcCRVKVOwOTqasYTBiRSnxO/IGdoOlXS3VFKnPTUe904LKowyc0
	 9bMvyRJKMDJdchQyADGN2TTHWy1SKFkg0vP7HXv/AtYBlY9oeklSMs3Wes8Z+6XfHUMWq
	 9sJG/82i82N0mDP1aqu/FdfX4vpPHetU8EwL3EyV+GJJ+ss5tiPpaQDgzpfFwrc1dvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Bs4JNiNG;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8772606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8772606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Bs4JNiNG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=a68n
	aecbXPiVp+RBiDOlkn0oTW1XFAmC0R9J837YGik=; b=Bs4JNiNG+3FjoiRalM0N
	4zN1q7BUCqeTzCaVuFCGQ+rmJa8cBMcsEBMPZzuT/x9Q4+6S9oBwhUpEu4XWjyPt
	whQ/BoK2cpiNrIoM4C2nwQOn4ACbX3hwRe9GgQurA2UoW6Oy+1Bfe87jAzkIC5g+
	qw4P2Aue0N3ti+p+umTQRcAf+kvqnizfIjYKc5R7YPUGGxYTpZS/GYRGLsNqZcm1
	qbiseJDJ1bPUEF1Ho9JTF8AJzh/wSR0sQsJR8NXfcNga91JhKu2YJnRyaWsuGbo1
	zLxL4f6yNWsmLfsz08OFz6P3VMIvtTwSehRO0m1Yqxc5DNMtAmSyiwGDyfOttEWB
	mw==
Received: (qmail 907919 invoked from network); 15 Nov 2026 13:02:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2026 13:02:55 +0100
X-UD-Smtp-Session: l3s3148p1@etoAcU9grqYujnuZ
Date: Sun, 15 Nov 2026 13:02:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rz-sysc: Remove SYS_I3C_CFG register
Message-ID: <avmfbZSQsV-AHGb_@shikoro>
References: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>

On Thu, Oct 29, 2026 at 05:51:56PM +0000, Diogo Ivo wrote:
> As per the Renesas HW team this register was unintentionally left
> in the HW manual of both the RZ/G3S and RZ/G3L and should be removed
> from the code, so do it. No functional changes intended.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

