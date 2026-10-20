Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508887;
	b=ghf3VmAIYldfkpGItl+7+QLHLL93bz6zdZjPBan0GJKVbxzZgoDhlOVReMV6QzBFoW8K
	 eXX1qrZLBXmBrEJky18mlPNCz+gTHk70wx3TKT6uz7s2TY6BqIoTTzq+bo4HqmhCc0+Mw
	 cAMOFdOmYo6VvkLHxqL99agKiH+crumdBbeA2a2B0SS3MvPUCshluFZni9LhMyM5IWCdR
	 W+S/Z7bhHcgE2X/NLJ3yNEzPOKC8oeTuiVC+o9KogmB3HQ9dDVvHEnnH1l7Sf2xO+8tQO
	 nytiyoOxhdmMQflVYmeqoUm119oLV5ZvJH5QkmolUs1QI/ugM+B7dxiJnJ9JDTqyBIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508887;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D5nKxhKIYt08LeQqTmG0fncZXbityC/wwf8hK3PtN88=;
	b=IaY/S1vToRpJpqRnMv0Epjr8dfaHVqVGWXGsWnPnjbLUaUlMgoh1G/9vU5Puv9Xgm9oa
	 ZYtU+tE3xWGoGhZsKrld20QYCwK3xf0VFeDSQnuAvZqwG14VJmBIOtT2Of3Bveyvqvybt
	 axdtpjKxZK7bgMnaoo/eFhy9JPlzgQMXUQpw+0A2YNqE1nSc7B3Dme55qBdY6K4Wl1oYX
	 h+YCKyB8/Z+VqQccTEhsUxsYzBF0hgC1hzvhWH9ckMqDHNlInjCSZUMJnA/7Q2uh1JgM6
	 Lmn6Yl6rmo6nadeTYJyOjD/bYay6N0MA7H4E6H6a0oCa1Iin6hvwq70s/yHySbPkXtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=n6WmxyAf;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=1rL1ZvP3;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7F60A260B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A7F60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=n6WmxyAf;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=1rL1ZvP3
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792508877; bh=D5nKxhKIYt08LeQqTmG0fnc
	ZXbityC/wwf8hK3PtN88=; b=n6WmxyAfERThBCxaCeXT0nH26BW2jemu5NN1uAoKIyLEu/PV7j
	3Jkc25sz7Y4jctTm9PmtR2lpAgSEHS0FUVFcbhthXo+s+oxhJyCEkbdka1H9cxwH3Ue9mPbYng/
	0bjhMEBNH3DfU7cCO6/UrlJb/5E/FsOcyslhGmUXG67fO0e2/kmaGDeKMpNIN923MroSrmDCQYH
	vDWsttV+Zwf1sjalv2hNvbnhsSyr8eiMMTlrbdmGNOsRaee7FZZMMEl643iIwsHwwSED707FiaN
	uRwXJ7oM63LsdsAqtnuBvKCglXzB6863YKGwS3eO/YzshMMGkorkRjezTiqMR9v6Mzw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792508877; bh=D5nKxhKIYt08LeQqTmG0fnc
	ZXbityC/wwf8hK3PtN88=; b=1rL1ZvP3uNqQoy9b7PebKLstkg1mQV8+yn0fMLZEgdE5wSTKpb
	Tqkb9aMtzv3VsNm0mgp28fnh2I54ib2IFOAQ==;
Date: Tue, 20 Oct 2026 16:07:58 +0100
From: Bradley Morgan <brads@mainlining.org>
To: thnkslprpt@gmail.com
CC: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] profiling: fix sampling step on 64-bit big-endian systems
In-Reply-To: <20261020101225.917959-1-thnkslprpt@gmail.com>
Message-ID: <E2C67135-E62C-4E68-9087-4E3CE47E5A4D@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 October 2026 11:12:24 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
>read_profile() stores the sampling step in an unsigned long
>but copies only four bytes to userspace. On 64-bit
>big-endian systems (not common obviously), this copies
>the upper 32 bits and discards teh rest, causing
>/proc/profile to report zero for normal shift values.
>
>Cast to unsigned int so we get the correct 4 bytes, while
>keeping the shift calculation in unsigned long.
>
>A small C reproducer under qemu-s390x reproduced this and
>proved the fix works for prof_shift=2.

If you wanna be 100% sure that this is regression free, you could test
building on all arches. Sometimes linking fails in cases.

>
>Fixes: 2d186afd04d6 ("profiling: fix shift-out-of-bounds bugs")
>Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>---
>
> kernel/profile.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/profile.c b/kernel/profile.c
>index 1fcf1adcf4eb0..e7defa90a34c9 100644
>--- a/kernel/profile.c
>+++ b/kernel/profile.c
>@@ -156,7 +156,7 @@ read_profile(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> 	unsigned long p = *ppos;
> 	ssize_t read;
> 	char *pnt;
>-	unsigned long sample_step = 1UL << prof_shift;
>+	unsigned int sample_step = (unsigned int)(1UL << prof_shift);

But this would compile anyway.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> 
> 	if (p >= (prof_len+1)*sizeof(unsigned int))
> 		return 0;
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
