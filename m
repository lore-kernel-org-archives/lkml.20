Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649955;
	b=Es5d8sFC4f6L80yh924TQl9dYFgxWfOsl1fmUw4GzKFo6YNRTLf/zeiwpNzv2Ba1Z3Wa
	 B9Cit+lndRWJpvBZHjIUmJKMu+U3dU1zLi8v/Ix2nxAa5+lskHMueMCmcDkRRkNpH5aCV
	 FaNDOGpxORSLQqfVYMKX1/Q8pMsevFZ7r93spw4zCv4s6VeFdKavYbgzSO6lAlJeu3HBI
	 YAP4ISkMtUp1AvuuTT34pOz/ivYdqPs/o4238ThGkQkgtv7X8W6p+2SrEbuYnCtDcahbo
	 mrd1lqB8q3jAIDqss3fxnyO3Ose9kMMbE+lztAs+p2W37qgbVSsWrxQBKfgYUZPhHaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qM8Hk5gZSR6vwaifZD+YQP4V8KPd/OKyYNpkK0J7xaQ=;
	b=VaPz3mZtDwcdgzHGFemHaGu3wVDMtHpvtSDvSfxPQhwrau3Mh1YFY8zUt8taqHfFbZzj
	 IoLu8VNKuCha14smsL3ZTdlsOt6ruPbuADH7CyLYhcis2NrYR5CqRMSKEiv6F+oAIeAqD
	 blJ9eyOoOA+F3JefjtyA3b1G50qXdLICPdJiwgCZlmyQRfTmTph7lWlnGKj/vQlrjAPLn
	 w8x7uMAA25DcysN27tio9uSFGFdXfRiwTKI/EP5Jj60YltTltPrwVC82MVSiAf9g6fYGf
	 F6uy4vnWoAzTLBlE5ifoZl2+krCdqq+xKZY7+V5FLWPgJiOYzcr8aw5NA3tZUTH5S8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40C606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F40C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-00Cc8q-Oc; Mon, 02 Nov 2026 21:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=qM8Hk5gZSR6vwaifZD+YQP4V8KPd/OKyYNpkK0J7xaQ=; b=jRjnvr
	mSV61nruzBQ/EDHo6qeaVkbkoLywLU6CJEjLhu3gBkLX0LOZPMgaaDbG9NqykxFCO1IZzUDgEVknX
	kUucA3ZAdRdJr/VLuDjx1xm6up5hJ/zC74wn7MqzOQ2m1PrWkOe4Hjf9ECcVnVVTa6IPO1z3uk7Bm
	4iZ5i+4vM7lJ7BZqol+bhpJw3BzL4JjboaocnPJeRhhXjGurELSxs9RGqHGd3TzRx+t0nf8b2I9Ge
	ffbexfEP6FAhpvAfCllTfnNt6Tg8uRcPH6Qeg5whbNsyGDOla346QaZjZUHkOVc8i+HBOr9/SsDyJ
	GITlQPiChkpRMrvvdEzF9C0ZaxHg==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-0002nH-HS; Mon, 02 Nov 2026 21:05:46 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHb-00AUIb-NT;
	Mon, 02 Nov 2026 21:05:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kir Chou <note351@hotmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH next 0/7] random32: Improve security and simplify keying
Date: Mon,  2 Nov 2026 20:05:15 +0000
Message-Id: <20261102200522.3337-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
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

The change a96ef5848cb0 to use prandom_u32_state() for kernel stack
randomisation noted that 'if the prng state can be accessed, we have
bigger problems'.

However the prandom_u32_state() function is linear. So, if you know
enough output values (eg 4 adjacent 64 bit values or 19 adjacent 6 bit
ones), you can trivially determine the original/current state so know
exactly what the following outputs will be.
Basically you can determine the constants and then calculate each bit:
	state(n) = parity(constant(n) & output)
It is the same 'schoolboy' reduction usually used to solve 2 equations.

For the kernel stack randomisation this means that if one syscall leaks
the stack alignment you can determine the alignment that will be used
for the following syscall (or loop until it has the alignment you want).

While not making is cryptographically secure, just replacing the xor used
to combile the LFSR outputs with additions makes it enourmously more
difficult to invert.

The LFSR cycle through all their possible outputs except zero, so they
must not be initialised to zero. Additionally they are less than 32 bits
and the lower few (max 6) bits are not used when generating the next value.
The easy way to achieve this is to just set one of the higher bits.
This reduces the number of initial states to 'only' 2**109.

David Laight (7):
  random32: Use add not xor to combine the LFSR outputs
  random32: Remove some unnecessary #includes
  random32: Fix tests for xor -> add change to prandom_u32_state()
  random32: Change prandom_seed_state() to be a real function
  random32: Use add (not xor) in tools prandom_u32_state()
  random32: prandom_seed_state() use all 64 bits of the seed
  random32: Simplify prandom_seed_full_state()

 include/linux/prandom.h       | 10 +---------
 lib/random32.c                | 30 +++++++++++++++++++-----------
 lib/tests/random32_kunit.c    | 14 ++++++++++++--
 tools/include/linux/prandom.h |  2 +-
 4 files changed, 33 insertions(+), 23 deletions(-)

-- 
2.39.5

