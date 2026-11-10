Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330797;
	b=0QLEpMOjSqqMkrvEwhw+Wj8NPXvPVaY5ntufIhOhaLBOrYtiJNKO397ZZALqx7rqY0dK
	 CTp05/c70M3pLBxcHcs+y+6vmRJYNYK3TfIWHszvjLoVliL1dDl8gH+lHRZe4w6tU8rTH
	 NdRBKQyq9V60X+Tb8w0tinpMu9hoyM65mdx5thMo+lIvfGrQbizfN6oePTCM6PSCadAqQ
	 TnrzRYZ7gjDAvWEl8yIj8o/2QLx3uqMpaV31mbzYpG4t6oko5Kyl9MZu+7aBiCimoxLzA
	 sAy+mW4yZIoV6RhRQWwqCot01uOxYOt9qkSJYECfIRAsxihy0h7XS6j1q9ZHCYwPmGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330797;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-MBO-RS-META:X-MBO-RS-ID;
	bh=876nNHPSsXIwn5QT36OAF+F9PJl/ud1EqARrq44NCYM=;
	b=EOQ83+NWOHicvTzPwHat/MBhTo28kC6/g8XkccKMj0ZUI117dqpdwWludNUnaw8gc8Nt
	 lSU8vm4hj2Nl3QJ+qY/bt51K83nqq0YdAO9bZOFF9zUskfnc8egdoTGIRJ93Q5FRcXJuu
	 HwsCoY6Mfd4jV4Yc9uWdnkUsqMKIhH532kxhMwHKwPOXK4DVEOM1EjotPOwHmKz6RUf2p
	 3zgM5jOsjlN5UMfFKAZUG+XaZyhBLt/UJaFfv6rjoIkIn5E5e4rHWdJrNK5NmIGXlQJPS
	 OReB5nF+37S+axYc1qYQOc0dZCt3wvMBybbQet9SnLeBfJYnhQ9qTiDx8RsZKxwPsng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Fif89Btb;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027D606A31C;
	Tue, 10 Nov 2026 17:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6027D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Fif89Btb
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jPCsN4vr7zKndp;
	Tue, 10 Nov 2026 18:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794330792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=876nNHPSsXIwn5QT36OAF+F9PJl/ud1EqARrq44NCYM=;
	b=Fif89BtbSEllTeNT0Z5WDJXgmwtTK0DWbfd7mFevy5E/0fWgoCNW7iYFA1DG67982Bknne
	lw8dM3j3gWASvS7HzbbzcdYKn1Ka2EyIKIluNHk2V3QNsaUW5qMcukdtytsXZ0hJUAdgWY
	VfMMIgy3FGngM13IcrGG7GP/mvfLyKOVOsc6UpvmY45ZX2E1o3Sc5JcbHrxWWF6jT7fDZa
	wc/HTIjD09y+A5jLtT3OshxgjF5HxhLVTZsEban2u3rFaIPxavxJ/M+2xQ6kerNDKj19Ju
	+N8McDeBf8AdFgTgc/++fyM9WiWnLm35hyVhowGPHBy2Qzg6x1La4JG77j9ILQ==
From: Gabriele Gamba <gabriele.gamba@mailbox.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lukas Larson <lukaslarson@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: Add DMI quirk for Dell 16 Premium DA16250
Date: Tue, 10 Nov 2026 18:12:41 +0100
Message-ID: <20261110171242.49762-1-gabriele.gamba@mailbox.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026095326.21615-1-gabriele.gamba@mailbox.org>
References: <20261026095326.21615-1-gabriele.gamba@mailbox.org>
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
X-MBO-RS-META: wujjodt6tyenuy8c8m8unp8pw5jxreh8
X-MBO-RS-ID: af16dcd6decc968c9a2

Hi Sakari,

I've since noticed that Lukas Larson sent the same change on 31 March:
<20260331190145.11592-1-lukaslarson@gmail.com>

You mentioned there that you'd take it for v7.2, but it doesn't seem to
have landed. The diff is identical, so either patch works; if you prefer
his for being earlier, I've added my Tested-by on that thread.

Thanks,
Gabriele
