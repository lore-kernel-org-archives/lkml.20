Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1541483BEE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764446; cv=none; b=EMMEmtAXHU7QSEp2T5ndYYKrYXS9fwKmgqAZl4MDxCK+iayoyyDDEMLmKWRY9DiTo8BtLTeSQvh16dKs4mSle/4l0UniD6KNUR1PXOW+xPgPiktikHrmyGPxnI61tUJlGsQGGVnwZXzUuBLwUIDNPtA0pAcTeRoSr3DOzu2XzBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764446; c=relaxed/simple;
	bh=fX/eL4egHxQsD3dNWhWGGQJnd3WSpOLEOwP2vncbe6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYjp0WZqkdQkv+NP8Wb+UimMoLqHCKJeHyhCkOzCWWWrToABCjeHht8mYPeNEee12s1QWW0quMj+qLtfFpBU4R5zSr8s5jghxishTg5awqdWhHpWEcWOC45ub4BJTVYmZD93t/vxFJwX9mbwoUgRiLTLfDt8yi4QZj+8p5ZrKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=dAvfIGpG; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="dAvfIGpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790764434; x=1791023634;
	bh=fX/eL4egHxQsD3dNWhWGGQJnd3WSpOLEOwP2vncbe6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dAvfIGpGag5mjP6H0MGU+KpbWgn0Nya5SCpZ7VVwkqgSM2qzO4AS32bhro2Jdo+l1
	 /Ja80QCkF/kFoCGvpsv5dhqYiLe3N1U21I0f56w+eMFZizjvdmmNuOtqH2dLctat34
	 ze1JPFQTYywALMxrwkIpqr7UhZ6OwWVucgBDZCDffQVf7mCLShH+IkRYciIkshyAc+
	 c1k1bMKc4f5/XybhqKQtGkDY9LfUV+ou+xfXyxGXpAIJQNKXXMqql9jSNJVwGX8eDZ
	 vMR8l00XjLq45dZ0SyZENhRSh9vynlFbgRQ17m3rrVf26QbVXot0BdePotikt4K4l1
	 tVQN5GG09L7Vw==
X-Pm-Submission-Id: 4hvrxV2KMjz2ScDC
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com
Cc: david.laight.linux@gmail.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	natalie.klaus@runtimeverification.com,
	noambs2999@gmail.com,
	ribalda@chromium.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: uvcvideo: Let uvc_parse_frame() report a skipped frame
Date: Wed, 30 Sep 2026 13:33:41 +0300
Message-Id: <20260930103341.256220-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928205037.GL4406@killaraus.ideasonboard.com>
References: <20260928205037.GL4406@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026, Laurent Pinchart wrote:
> On what device have you seen this occurring ? How did you test this
> patch ?

On no device. Noam found the overflow by reading the code. The zero
size case came from my review of his patch, done with an LLM tool
(see my reply on 2/3). There is no user report behind either.

1/3 is the refactor Ricardo suggested on the list, so that 2/3 and
3/3 can drop one bad frame instead of the whole streaming interface.
Apart from the truncated descriptor message moving to dev_warn(), it
changes no behaviour on its own.

Testing: Noam ran the series on a UVC gadget over dummy_hcd. One
format had an over-U32_MAX frame, a zero-size frame and a valid
frame. Both bad frames were skipped and the valid one was exposed.
I built it on x86_64.

Not tested: any physical camera, the -ENODATA truncated descriptor
path, 32-bit builds.

Natasha
