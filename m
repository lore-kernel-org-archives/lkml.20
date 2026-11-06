Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114418;
	b=iV4DI3nEr8BEkhIjTMUuhCH/lre17hqRa2uQJZ0WWvUs+1c3l+hDwase7N07+LF4f9AD
	 8Aq3A9g8mPOKvrDUuqtWRK6rvb3skKg9FmGdGEGoQP68+iCjSmTpZ7HBeYV7yO5Bu1goQ
	 5DdbNG385kc/BMNiQw7+H609myQ7KeNWPhGKP5sTItYfbQM1h9+qHc6j0HdeFGyGjB1v0
	 /eNDSqG/Nlg0KbwZ4KTfeOnciqzrB1rLHW7dCHug4ha5FFMk7Cam8qINX6tCUK4xi8O2S
	 3KbtNhFDpnPON9wSTTLwEmYWktd0aGRDGTaX3Z17GO2z3ftWfaTikdez+cZm74a27cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114418;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:From:Date:Subject:To:Cc;
	bh=HjHoyPdMBcn+jheDqqwQIx64tAclSVjYUrpZHYeWvXg=;
	b=WZJQtnDkuVuctfIjusEDAjTa/N6QgRFW+XrNcAGxxMFxvWN352yIVdJlCCOMih4chqbe
	 HPtaB+0HJc6QPVsWSK0CmI5znp9J7zoLDAW4RijTj/rTUgIxLJXF4f4X+5o6KK2hnizfU
	 XsXQTDJxZ7hSbe13/uiizLn3BQ63VK2INjPr5TEc8+lL7fGmKgzAI8ZyzQVIWEZogcXxU
	 hz+dMNsQ2rFdOj2lvgwBOLKNqdFNvVY2hSTbqKhPVn0kmLOox2rh+2u7zF/huU4gXKCBX
	 CPifYz4eSd1VC3x9LLZdajv6xdlxfjICi5K1COfH1/VfPOFhtVv4islrCUXWgGgJfuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ASfOnKDk;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5010B606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5010B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ASfOnKDk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ztGj//42N/YC+zzH/3zgPHV9RAYb/wxn3zCXZGX3+vU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794114415; v=1; x=1794719215;
 b=ASfOnKDkWTn78012xhuZ4vGqjKWEp3UvkeUJoLhdaagXMKXmGI2mV/j6CjNtQdc5tBj4nXl6
 UXkN6fhy47rXRVq5KwXnc+5Fbg8Mf2q8KPeihj+X27BZIee+8T8RBvNx0ESGldF8eMozFQW5Wu1
 2dlOokz7iiVqbj/WCjPww7Wo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5e332b51c31dfbde;
	Sun, 08 Nov 2026 05:06:55 +0000
X-Mizu-Trace-ID: 5e332b51c31dfbde
X-Migadu-Flow: FLOW_OUT
Message-ID: <7e9369cf1473539bafe9cb90207ba6fe98b534ca.1794001419.git.guodong.xu@linux.dev>
From: Guodong Xu <guodong.xu@linux.dev>
Date: Fri, 6 Nov 2026 16:30:48 -0500
Subject: [PATCH] mailmap: update entry for Guodong Xu
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Use my linux.dev address for kernel correspondence, including for
contributions made with my other email addresses. It is not tied to
a personal or employer mailbox.

Signed-off-by: Guodong Xu <guodong.xu@linux.dev>
---
 .mailmap | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 0d05be949eff..37d3fee6b4c1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -352,8 +352,10 @@ Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com> <gokulsri@codeaurora.org>
 Govindaraj Saminathan <quic_gsamin@quicinc.com> <gsamin@codeaurora.org>
 Guo Ren <guoren@kernel.org> <guoren@linux.alibaba.com>
 Guo Ren <guoren@kernel.org> <ren_guo@c-sky.com>
-Guodong Xu <docular.xu@gmail.com> <guodong.xu@linaro.org>
-Guodong Xu <docular.xu@gmail.com> <guodong@riscstar.com>
+Guodong Xu <guodong.xu@linux.dev> <docular.xu@gmail.com>
+Guodong Xu <guodong.xu@linux.dev> <guodong.xu@linaro.org>
+Guodong Xu <guodong.xu@linux.dev> <guodong.xu@oss.qualcomm.com>
+Guodong Xu <guodong.xu@linux.dev> <guodong@riscstar.com>
 Guru Das Srinagesh <linux@gurudas.dev>
 Guru Das Srinagesh <linux@gurudas.dev> <quic_gurus@quicinc.com>
 Guru Das Srinagesh <linux@gurudas.dev> <gurus@codeaurora.org>
-- 
2.43.0

