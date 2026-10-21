Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605197;
	b=kZpFA7fu87s4dkCAA0ra6S/SJ5OvTWIUvQIDkZH/0OVxGUJL32jOm8xffbSvGBg8UZqD
	 3dtKWv83lgyggSiMxGMac45MQvIounRrtAWTpoENYYdB2zFu6jyWH1KvXLPEKBznx1acQ
	 sYDcsTbpQ7fHHyrjeVYqzrPEPBvr54UHVvBqgRE3syrEifl3rUp/mvB/C5bXmgNGVrQZR
	 IqgQsEF04kF5rlEFgJy30LXlwSe8D1cBRdKHOfUC0SimET/q2fg55HFomseFO4t7G9yQ8
	 N9AypHbYUfFcLJUxaPk22iXuNXLK9q8JLqPKUdk8bNlKoqFd7qhlVK2ArynvTM9kKwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Nkow2WxsbwgbBb3PRtxAKEX5ZOJS6u8PKRX/NW/T3IU=;
	b=kFRRuLczPAuEPQJgkbgrZ0nk3WnJxYf9ptlM8eyNAtG0RK+J3MM6aWjXzr5kg3Igf3X9
	 ucSV9HY9fW3yxrQ3bzekx8HiSdLteYxkKiL3GxMa/fbVQcP8l+I74Pwu58dvhtkKo81wh
	 frp9CbaL2DkAeX9o+lc49GImBvym0k31CAsa1xyStyNgFYTc7VgbmptgeeDVG7l56Ojo0
	 A2Qm/OKBZkmdT3TP7YZ57PeNkRrv33rbyOlr1LhQI2tigHmb1sBA6fz2aSqlm9rPduqw2
	 cFQQ16W2k2EbSMcYdc49dX9PGiXtjbn6lMvgp4yS6iV07sTr11i4z18FlxodBGYNfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=apSsoOej;
	arc=none smtp.remote-ip=74.125.230.196
Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C1606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=apSsoOej
Received: by mail-qk2-f4.google.com with SMTP id af79cd13be357-93f08d9aa49so11250785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605196; x=1793209996; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nkow2WxsbwgbBb3PRtxAKEX5ZOJS6u8PKRX/NW/T3IU=;
        b=apSsoOejDjjcH5diiC2gbH+Z8kNd1Jauv+MSmpI4UZrUS2NjxhosEOAmgFyWIw1tK8
         +lL2IKClK1IoBMMMjvQOFgoS9EqawBsXTPPTrExACDcEohGG3kebty5hpHgtEy/euVMa
         ZjC8gDd7PKQ6LXTst2U3wP5xFcno9P7NShD2VCFtkqEyRd1hAKPc4wMSaxHZxtKp83hd
         VZB788xsnGmHWOiEL/+bcOQ6dosna5Kvss+/yLjjUhJ0hk3NHjLSeoY85aYgLzKodOq5
         UcOWYNdhwLapdAd44EFDaiinnPBQj/bJumTz5tnw8VcciX/ErEHPF76cIUw9e0N+DVky
         nUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605196; x=1793209996;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nkow2WxsbwgbBb3PRtxAKEX5ZOJS6u8PKRX/NW/T3IU=;
        b=kWUXb0uQGsUBDYhHbbiAfrXnVYPIaBwhOjUseGTwf2MG40UPliNooYhDwY+WPFcPbo
         tXtlCG4gsBsZ5DUCLZTRyjmfZU9b7fPAyAvM3WwwcD4WsWRs51i3b48jAijkYjtYNtgZ
         LQkiPdPlmzR3GrbNMPlKSuUZJDc3nzT5iRZKq5DpoU6x0tAZAZTiCZAwhWpI623DxCYz
         AKe91cDmZ1DVwoVn/9GlOB3OtjH6sAnu2m0PR8oPpDPemsxRRHjfz3jBj40ojDbHLwK/
         9rmNjZUPhDfqh2V6jZqytjI9AlVfr89ROAp2Nt6mdGs6PeubacEcc7TDPlSHAdBNwPjC
         CovQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpsr2U4mBv9rhMdQLj3V0gKagxLnRSnBjBnlJrGK4FxncKyj/XDqe3118gsvMCrF8SSNxt6j1i7u9AqW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS+DadRlnBDwiwSijIYs7r7WKVqEOP2V9kam3vhIacP8uMDmHv
	jwHgy9otgJgoNlcalhW399OgOi9ZdniZRBPXmEGlV2V4OfBtGBOxgTXv
X-Gm-Gg: AYBFou3OhfIzMTx1zvUBSc20AB7qlLq5UrARGgWNgijWhwIoTUjacP9Ai4iQKZswbvF
	3OpSMyn8eU36PSr37hZXU2kdi7G58UYHM5Sy+br9vWGe9ojwUznkXG+1lA0Mu8FjzNgKHY0ZaDZ
	92cq3SPxyq90ijuuWydwpGB7IWEJvmqUrTgE/0fW3foUIUcxlh0Nd1TQvH9WTlKvVWuMMe1+e9b
	1aSVaQdZfiXGWmbMviO90Qgy/JuQQAYUYnfnzBWRYlKqI21cbQfI6A1anUmLmQaeV8U1d+8RW9p
	z5YyFpRNiu1WPlKN13feO9zduD9HKrBpc7S3qZXUhG5HnkyEqeDf1NIXHTugxwBErdnMtVklzQi
	jtV8neFN1n9X1w628ygqs+88DeardVR5p4b/l1UIYew6ZNo2/k8vEHzabk7PkZfvviXueeXWqbC
	UrAlMS6IBFV0qT1IxvbclaT/UsUnHr9nfTjSNNegpQLbF05XqTYtZr4gAknaXPJJWm+zdw74Vsj
	jBLaKe+WombkZIJSiIOcVPXyXQjyocg8iGKNUiPSsC4nSqwQWybPetz3u9dKLge
X-Received: by 2002:a05:620a:2b92:b0:93e:7156:f814 with SMTP id af79cd13be357-93f624d257cmr17959385a.11.1792605196271;
        Wed, 21 Oct 2026 10:53:16 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9af50sm305675385a.8.2026.10.21.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:53:15 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, shaos <shawnq1@163.com>
Subject:
 [PATCH 1/2] fs: statmount: don't copy strings past the caller's buffer
Date: Wed, 21 Oct 2026 13:51:51 -0400
Message-ID: <179260511193.411.4517720543579678364@gmail.com>
In-Reply-To: <179260511193.411.2849255769062027805@gmail.com>
References: <179260511193.411.2849255769062027805@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

statmount(2) collects all strings in a kernel buffer and copies them to
the user buffer after struct statmount.  copy_statmount_to_user() copies
seq->count bytes at buf + sizeof(struct statmount), but only
statmount_string() checks whether they fit: it returns early when the
producer emitted nothing, before the size check.

If no producer emits anything -- for example STATMOUNT_MNT_UIDMAP on a
mount that is not idmapped -- the reserved empty string is the only
thing left in seq->buf.  statmount(2) then copies that single NUL at
offset 512 even when the caller passed a smaller bufsize, and returns
success with size = 101 for bufsize = 100.  The write is beyond the
buffer the caller declared; if the following page is unmapped the
syscall fails with EFAULT instead.  The same request with a producer
that does emit data correctly returns EOVERFLOW.

Validate that the string area fits into s->bufsize before copying it
and return EOVERFLOW otherwise.

Reported-by: shaos <shawnq1@163.com>
Link: https://lore.kernel.org/all/20261020110747.959829-1-shawnq1@163.com/
Signed-off-by: fujo <hooyan2024@gmail.com>
---
 fs/namespace.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index c30f06374..c8aceeff6 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -5831,8 +5831,18 @@ static int copy_statmount_to_user(struct kstatmount *s)
 	char __user *str = ((char __user *)s->buf) + sizeof(*sm);
 	size_t copysize = min_t(size_t, s->bufsize, sizeof(*sm));
 
-	if (seq->count && copy_to_user(str, seq->buf, seq->count))
-		return -EFAULT;
+	if (seq->count) {
+		/*
+		 * The string area starts after the struct and must fit into the
+		 * caller-provided buffer.  A request that emitted no strings
+		 * still leaves the reserved empty string in seq->buf.
+		 */
+		if (s->bufsize < sizeof(*sm) ||
+		    seq->count > s->bufsize - sizeof(*sm))
+			return -EOVERFLOW;
+		if (copy_to_user(str, seq->buf, seq->count))
+			return -EFAULT;
+	}
 
 	/* Return the number of bytes copied to the buffer */
 	sm->size = copysize + seq->count;
-- 
2.53.0

