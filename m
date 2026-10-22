Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708119;
	b=f+GiE+S39W7XwOTq7HpEKAFNz8hm6pB0+fzO7C+vceqeKgVUnqLsJK2T3UigIOegzNVV
	 R0yFCnFKvrOHjB72Kfzlk4bD2uQ+QRyWbRmHd5hSAVDdco4G+VwLEHtIdJ2hC399YtWQj
	 BbFr9wGv55jwMcJrKqDzsXhvA1uTkWzK71I7TLwGHzjHKD81Uns35tHLPqKRFkUT8c/Mj
	 xPXrAChAU8cD/Md5KcuGiI5B/4Xvkpl/0APB2RYepawnLOyBNC+WtB+T4+Yw7e/oV8xCK
	 IbVdvC3t7RPgLLYiPUgsfifRJFpXr6Yd2uBWm2Y6xRzuYlbNrT5SqK7r9AH4iZBpa3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S9nvo0dYAQsPs8WnHZoy9/22ZqY9nCZeAyTVnl3n0P0=;
	b=1dwHvPcQ+kSqKnqBLEAj5OVm+laQtDtQaKvCaJLpgsdRopLxUOxQsZm6Whs6rlYIUDPm
	 LZBkj6T0yNfTfBgwczr8wP4bN4tBsoqcGfSO1VNqKk4bgnt/vepCv9D71As7quih+qvBa
	 0Zu8+LsnJHdvFFw0ANZvSEFB977YOgM9kbdWGSE4bL8Sw9arnuQ087de0Aze8KygGA2/j
	 mUoavTQ3oMHzDVzDZcwd5nBsL0/ng7lfv0P3a578j+Ur4jzehu4TnF4E/trix4dVuwGts
	 UHmrfUSXY2TlJVpNb5AzOCf9UbGb8Ub+WVNg6L1mXrg8ha4qVPpp7AhKXR/xcciIVcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d2ROXMaU;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B0606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21B0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d2ROXMaU
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-745497ac8fcso180572137.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708118; x=1793312918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9nvo0dYAQsPs8WnHZoy9/22ZqY9nCZeAyTVnl3n0P0=;
        b=d2ROXMaU1QF9tDs4gp2Vzc3IaCpystzRzXf6WwzwZiYMN2q4N/C/xxOFznhkSRUfST
         o9luOS5+mcaAJFXxDzIcvI0FSBNUNU0Ry32gYXj9lZGcZgDzw25tsgNhPMJvHFi0AXNq
         +P83tPpkHHtOrEH97ndNyAEN+I0teQo2UpFjOM3rUb6cLF7BAP0keIyfqxVZH/nRn0i2
         JwB7WuucNEgWy/JECIzT9hgd7cFRIq13PpvTwne7U2GIeydzxY/3iPptp5z2JwZKgenm
         o69ohwtwPxTkpzTSo98Emv138VHTWwVWBdfqrXsw+n9kaxmXfPjYgpDzgyjgBnHaS3De
         dO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708118; x=1793312918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9nvo0dYAQsPs8WnHZoy9/22ZqY9nCZeAyTVnl3n0P0=;
        b=NZF+ZtxYePpTloqVvmmW36gnMJaSXPRN/VnU0f1SXwbcVC163E+MtAzBoPpyLUyRjX
         ADtzwFlq4G1IZY3ciH6l43/ogdkdCj8zqZf7o6tcfttS+In/pVM9oW7LycJrh9M6SfCg
         I+QZ1cqXG7iYXAyU3vHNKo7N64U1iJv427DeX/A/WYw3EX3e+nxb3bMR0V6oFJWz89Ma
         shbkC1o6vFk06ilACnjwEarUT1aIUqcj8GFYiiG5DRkKxA6aaQlNnr/RcOwuhz6RIICs
         imqu+oTP0tvIa7aH0PniXTJDRWdMXkub/rpw7emGoR8KT29QuOrUaLCnHsi8jOt8qdBg
         e6Gg==
X-Forwarded-Encrypted: i=1; AKwUvByBTLdX5Z2TB5yGY1T5UmLi4kRFsrN76u3C2689F9GyLKxBYu6HnVUXkjhutjnn6QlJo+fxGcbByY0kbKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKri2MbA9XOsabw/PY3PLIzzhO2xmAkQz2ZTqLQkCBdbIjOEw1B
	zhAqHvn8EtWnPPl3FoHo/SrNRWIx9lgG1rpZ4OZGblfDgWNg0x8Hpekh
X-Gm-Gg: AYBFou2Eaklx2vP+LPqE3sgddQyJCgwJ1TOHn2aIJlt+BR0qDBgeZrowPczTgznrImy
	vBPL/D8tnKybnPJxiFB/s+6bPQKydKgJ2SCPGi4KepUEv28f9vScQZdDnhDXrxx171RMSfE4tYx
	8rBMGfZf7j1wbbLDQzKNKVqwcvEpQ1UuQl/jtHJyq5dlX4FOsw2lsDG5SWDX3eEaoQ8MrYtuTS6
	Tbgl+UfeN2mt1i5rOvu6dxfbR/K7y9mFGrP9X8L+HKPOtJNjFIp5Svt/1jpVgy0yDEbDuKM5gzk
	Qiot6cgN07ePWVzAudUSeN0n5jter7WaPRftCfEr+EtlRqorSdH0PtftmWisqyNqIwJvjxVVpnl
	Bc3ODYt4QshrL7ShlcH6IisaQsylhCSUWUmrtID2Y4JNzIQejiHyimnBqAssTG3gb4rLAylPoJl
	aSnaUhWJOqGO9bjZee7x9g12Jv0uBcCA42ZL28Lg7owf6D9Ke9sPd5ePinuPyJih9QeFkAFjCL5
	/BXbjpZfSZkYN/muV6FyOmOaIX0uoPwDlLA7DL/EHxxGszB1IQzgwe9ReNNUM/mBc+wjv/kLx3T
	oQZb2QTwvdPtN4NkZkT6
X-Received: by 2002:a05:6102:290e:b0:7c3:1213:1e2b with SMTP id ada2fe7eead31-7ccc337cf94mr314700137.18.1792708117775;
        Thu, 22 Oct 2026 15:28:37 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f2cfe0sm481582e0c.14.2026.10.22.15.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:28:37 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk,
	Bart Van Assche <bvanassche@acm.org>,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 19:28:19 -0300
Message-ID: <20261022222819.92507-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87wlr9z8iq.fsf@trenco.lwn.net>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <871p9h1kc7.fsf@trenco.lwn.net> <87wlr9z8iq.fsf@trenco.lwn.net>
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

Hi Jonathan,

You are right, and I should have been clearer about the motivation.

The reason this patch exists is that the original assembly has a latent
bug: for odd transfer lengths, it drops the final byte.  The C version
fixes that, and the odd-length case is now exercised by the userspace
unit test.  But that bug cannot be triggered by any current caller, so
even the bug-fix justification is weak - it is a fix for a path that
nothing currently exercises, in a driver for hardware almost nobody
still has.

You are also right about the broader point: "assembly to C" on its own
is not a justification.  The kernel's assembly is there for reasons, and
translating it for its own sake is churn that reviewers have to pay for.
I have been approaching this as a translation exercise, and that is not
the right frame.  I will not propose further conversions of that kind
without a concrete functional benefit - something that fixes a bug that
can actually be hit, or enables a change that cannot be done in assembly.

Bart's Reviewed-by: stands on the technical merits of the change as a
change (the C code is equivalent to the assembly for even lengths and
correct for odd ones).  Your concern is a different question - whether
the change should exist at all.  Both are valid, and the decision
belongs to the SCSI maintainers, not to me.

If the consensus is that this patch is not worth the churn, I am happy
to withdraw it.  I would rather withdraw it than have it sit in the tree
as an example of exactly the kind of change you are warning against.

Thanks for the direct feedback - it is a useful correction to how I was
approaching this, and more valuable than the patch itself.

Breno
