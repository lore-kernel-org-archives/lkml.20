Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB1249F133
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288414; cv=none; b=l+DYBu6nJbBIaxmDmIatB/YdL5GDjEP3vsuQamJuHXqMMxsWUmJa3JxPzhIkhoDiFAW26xWBs0wyPPPBzCA8/qr8ShL6tjHYb7bMMeBY2eoNHVfajbhfVamTXo8f2k70TTDgrL9ATn5ii3WflkqKOp8qFZAv6LdwdcGsmHlRmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288414; c=relaxed/simple;
	bh=SyHXRFB8mCilyaBZQnFT9s0cnWeexGCKc/96On91Wp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HEka5Y94jnpb/OU6DS/FIreP+ldbJIFJu4iWk9a7Rx59sqbJDCTOtkrrXmKljGy8iJX+rryeiXP2f+d2j8mlAQ3wRE+weoCOpFX2BrCu2uXm2qeYqrhNCHJ9XB+48lh+hOeKXQO6NV04X/Ap/GnhBfVtprUnCH0TgtWLOd10H2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KKf+4D8Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=txIW24Vd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KKf+4D8Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="txIW24Vd"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788288410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHXRFB8mCilyaBZQnFT9s0cnWeexGCKc/96On91Wp4=;
	b=KKf+4D8QPQTmN7fi2OPoKhQjy3/oFXUF9FuQv1QT6XwYvUOotRvHa1SknjhKNFXgDV5g0H
	mJxHajqJBHSfC6cU0g0UM3z+HUEQr7CY48kbUg6kSgU9tx60EBi2M0UxeJk9fDLT969NHs
	QGyAaUp3dr0QSmaqMQgq7VB7CgDSNHx9lZFNrKc97bBRVeWT3P7iOoWkmQqsz1cTY7yO9T
	RPm4MNNf1ye1rOkkt+VUGHNj9fcTk0s4xruyNNcJTZy1DqKDKPTR9FxvRJqXXogwUm5gHf
	Z5qtqgaw697i3rbB8RRvy48yRFRm9i7lVpB7JpqV3/juwx1Kg/6vj2aAqGcqjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788288410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHXRFB8mCilyaBZQnFT9s0cnWeexGCKc/96On91Wp4=;
	b=txIW24VdDhm9iD4wJl6INCgJlyPmFUhDoJSWnZ0UKR2kCEYA2Kosk6Xg4fOj7FZ6cRG/eD
	IgVr+a/ExvUd5ADA==
To: Zongmin Zhou <min_halo@163.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: kprobes: Reject reserved branch encodings
In-Reply-To: <20260901115421.109573-1-min_halo@163.com>
References: <20260901115421.109573-1-min_halo@163.com>
Date: Tue, 01 Sep 2026 20:46:50 +0200
Message-ID: <87pkywajxh.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Zongmin Zhou <min_halo@163.com> writes:
> A probe on such an encoding, e.g. placed on
> data misdecoded as instructions, therefore keeps the instruction
> pointer on the breakpoint, and the CPU traps on it forever.

How can that happen? Isn't probe on data disallowed? And how can the
instruction pointer be on data?

How did you find this issue? If this is from some LLM, please add
Assisted-by: tag.

Nam
