Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910503;
	b=y1U6Hs2hcq1D1MRlFdgFCVVJ2PEztobdHAvMPjZYYHeKWuG1+mZAWbkOqGCgsa4ci3H/
	 /1ix27LKO0IeUD89HM9kSB0kU1HkFBoMBi4FxlAV43mHG6NqG56AM1QKovaBLRwUB5N8t
	 8r+cY7L1OwWeUl93Hd6C6Msx+YGlTSM15+/zTrny30cpEMqvakq1gurC48qWJEzyydhin
	 LHSO05O6gMk80fsWTiCaSdNvL1Hzu3Ro3eEV6TPYSr7BVNn+Kw8dAy9v1i0HobKGDKxf7
	 vZlGDwpa7xWUC1VqYszJOzA9593zv7ENKClf+/HUw3xMcuSNh3mPkV786QVRnSi9Lxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qAX9kyfis4Aqy4pr9MEWnabwBSlgiLOeyPCQy+N3HBQ=;
	b=diYJK+6iHzSmVJrjZaXAuktanWrI8GSnpNcyrzbkDP9K953P3F0T0jXcoyHl5HU++df8
	 BqGjY/DIXd8uyrgFfeoy4sG085jomaUHVs4Fl0/av2UyIIU3lQ1gSnLZMU3FNQxSES8q6
	 UjusyuDy0xiHJjRq9/tPxF8+veknkd8AzLdLUQ3hTz2X4evyB4V+zkwdy90OSzgkZyZcM
	 IPKfrWrjukJ68lrxcBmCcg22rUWGVAVq2dJBcb8msXOiv60rcI5vBQkboSUt39Bltznfy
	 M0kS8WYxIufoCP713Lj29Pkiuhig+1FRuv0WnXc8lI6IfJS9+nTNB2D1oVPg0kGistg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GsIdlX3Y;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1C606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B1C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GsIdlX3Y
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490a0e72578so1529930f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793910501; x=1794515301; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAX9kyfis4Aqy4pr9MEWnabwBSlgiLOeyPCQy+N3HBQ=;
        b=GsIdlX3YytZquSuIzg4N+TOwbw8Cz35fPgGQ5WRQ9dnYam2MUyeYgpmNz3mGaq18jI
         JStnAksX2x2Wjf4yBZg3lHFq1q9TY1SCt82SP42m1MA+W5XrOtQZDkrxgScR79pZwq+I
         IN7eItxbUgcIBCZu97t9OSzSXPC/i9Dx/m8K5XlkSUwv/hbkH1oaLOuhNSps2/KRxnyi
         eeOMYg/Ynwpod9fEngbnTjdpIp3wGh8yRS7Ya0ypv3LKb0euqBS6doBqDHfX/BZCm6Aq
         1nHmi+if6ZmM16ghG2iSTDcemXrKZ9fkfjjgFKV3THyIOHUrT50BAtmJxOyGw0jWYpsa
         sgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910501; x=1794515301;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAX9kyfis4Aqy4pr9MEWnabwBSlgiLOeyPCQy+N3HBQ=;
        b=e3s1yh040UMVMPRxA/JY36vy20teVOuVP47EP5mKQi5ymt5KAOTdk1xvTuzL94ZgY8
         m4g+Of+4L+k3G2n4aYH+hO9xUJFhIoune8mwlrXA4N+iFGpMkwV+sgp3xNE3DlXRUfzx
         U5iRdCxO/OIaU5r037SquVLDAxxSwniTMb+OgU73hQ0s5TCaYWEnnDqddAys71L4XEV6
         yxMCHCz+K9mrN9SEWyejUvcJcgWtTkrJxcpa6UZWNtjhYGXTRj6V8XoLTOTsJ7QyMW0P
         fAXG0WRcN/fodT6Bl32TgmREQO3v/FU0yJiJdUwQ+t7Dq8PZrUMA2GXejsNCpIeP5Grx
         66JQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6btRQ5wJlX7pFYuXIwdA02/j1FVzWiL7+WgOaJffiEH9c1EuIPTGu0W4I6zCsJcwbg77CCCUDwlZITt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7i15DbdvPKsHqCmSzWVnuKXeJwtNZCDSQANJMPGM+rNll/TNS
	0EaCCqxZIKLEpHcS4fwqauqn/SCFMy7tKjxloPuvuAZZxn7UQh59cUZmDB35vNxgpZQFvM/ebPN
	I6jBstKyeU9O9R3aSKHKS0g==
X-Received: from wrui15.prod.google.com ([2002:a5d:630f:0:b0:48e:1b5c:6e55])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3104:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4b6e054955emr4701325e9.28.1793910501234;
 Thu, 05 Nov 2026 12:28:21 -0800 (PST)
Date: Thu,  5 Nov 2026 20:28:12 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261105202814.1350312-1-vdonnefort@google.com>
Subject: [PATCH 0/2] ring-buffer: Remove unused absolute timestamp mode
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit b94bc80df648 ("tracing: Use a no_filter_buffering_ref to
stop using the filter buffer"), nothing enables buffer-wide absolute
timestamps on the ring buffer and userspace has no interface to set it.

This series remove that dead code.

Vincent Donnefort (2):
  ring-buffer: Remove unused absolute timestamp mode
  tracing/histograms: Drop stale absolute timestamp note from docs

 Documentation/trace/ftrace.rst    | 19 ++------
 Documentation/trace/histogram.rst | 11 ++---
 include/linux/ring_buffer.h       |  2 -
 kernel/trace/ring_buffer.c        | 77 +++++++++----------------------
 kernel/trace/trace.c              | 10 +---
 5 files changed, 31 insertions(+), 88 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.455.g6c5a503b38-goog

