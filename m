Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785924;
	b=N21QsDWXR/r9KsoplyJG3KscVBOuUCAx87eYfSKDopIP5Krz2Dfx1xonkDCZUq7AMt4G
	 LK71TAdBGX2hIx7eryqFgf5oV0NNFYNqP6+r4G8HHeNBmnLRd6S4iUhMqkdMhva96i6vZ
	 8i2aCRsLlRc8HPuR5AkO8MecK08yy3ImCfSaUgo5Z7t/g9TSY3Ac8wS/B8F+XUt7gY5nD
	 DjqMpwnLK77S5f/wXSFGojnYpr07wPxGwkCd3CMpeVgpRa4LD/Tmwp3mAfevKJbUG2ZzL
	 ztYGeaWN8lV9mHOrFOO7ie7r0C5wV5ZE/ez1Rx9BJmKQnjuJa07Ncyvr4TS7i2sYY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=sjjoNU4OK/n7KURPKe/oyQb00JhQCh4KxXbD2x391nA=;
	b=ZZYlIeP0VP4RreHm2zIeBAIIborsgfaMtwsncyyY1ljY98DDvDN1+bWEf2H+itFqVL2Z
	 LJu2uFRPnAufM0xxoQ8KlcO2QnuZQUuuB4s8NPs54rwG01T7/DTdjPQdakI5E+/J2sB0D
	 TVr1cX8GYBBJzpKLTrTy9HAhhwLpQtISja2ZIvSiwaDPeA2ACBWyKRGwj0m+g+9PTorrP
	 0TNdimTm1pkISUziPSEMaYUE/ZVueq/60ScKWXKMZCeiJk1/RqlCF5tx2lR5uFtCgMzwq
	 7tBi/11CQyNpcifVAdd8rF2+O8S3xKonmpg6mJ7wjq1mfqN4gtjLnxRHoFKmsUL02aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxJVZMPk;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A3606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4A3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxJVZMPk
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36d6e342f98so85597eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785923; x=1794390723; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjjoNU4OK/n7KURPKe/oyQb00JhQCh4KxXbD2x391nA=;
        b=RxJVZMPk5rl+rmSGI0jnSRe24VoOJlo9Z79OpwPLtFXqQaDaA1fpuBmNyDS8SLLv9P
         OFbQ22D6sSuP8mBG+wuaWeF2qdXuEJt65kDxVWT5yNskpacVqZkDHghfuxlw4CVfqGJ2
         r7eZj57E6MfPKc4fTBDqpD13klqoHbTWGkwXEW3QDDDJQqjFO5ZWsk5zTTLOSy1q3iYP
         x+NoZMKPrn4OBNWykJrN+s6mtGeGRE6LrPy+4pkrUzNGin5Iri5VWhSNqfdnnZgQDnWE
         8D6eU8MvslJpRafTAvumrdeS17lKOZ+v4mVvDjADjuxXXlHyOTU5tPTzGZtQhIIUuRYG
         wSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785923; x=1794390723;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjjoNU4OK/n7KURPKe/oyQb00JhQCh4KxXbD2x391nA=;
        b=lWKWDXVN4x0yU0nFIokpoc+UqX2l1PemZtV8fqey4nGEWbDSL9toY+C/oy5SBZezzf
         1MdybcGma6tsBiLk/7yZrxLTztBkGoSsxDo9KH0zV7ifzZGQVHBIJCUT9IvBjiavS04U
         BmrQ3Q+dKl5VEN+8tHmRiZlRZGzNE4vNnGeoyUhhzSFonHTcsdmiK2fsLK4QWZ1Mhmdk
         PeDuBLhFJIWYLN9HV6mMqiI7oVvmpNznCEBxEzyrdJXjATKdG7vCH98Xl054PRPQxL/Y
         akaou1xpSwwrsWbH/3Bl7/lqhK/vU0XtsTr4sAnfyAvnBc6fxOmzbLX5h273/deiKgvO
         syyQ==
X-Forwarded-Encrypted: i=1; AKwUvByBLBWPjXEHYVht8PHCI2mVX/ers28B7FBaHqL7NGK3Srrjr4p6/2XfoL3wP2tch1PQoIFFAMKR0ar5Ol8=@vger.kernel.org
X-Gm-Message-State: APuU4Z98NtZJVFBYc/ie9ZVZZiTGO03TuJaf5GYai/eaBm4VDuHa4tXx
	TsPxWA6tUnabp8zLeMGbGN3DnCQIrZQOaFFx8eK9rEpUpSGE0HXjoBlI
X-Gm-Gg: AYBFou173tiVVUosRSeAA3wum1MjfA9P0BQT/23RkjpfC+f1a+iEC0ij3D3riy2U4uM
	OxiRGJsNehGZ4nsEbm8792T/Fe1VZKJhzFPECNQBd6mCp/l+B/GmBL1Gh3hovaIA4w3mbWJ/ZY/
	qqc8M4iLbjEUUqiFW7YVZB4lJdCC4h/yLgtOVgtQ88wZll2q7TMVQe8VgV76X5ViEo6m48FiEX9
	eSmHkl/m7OrFfX1axJkF+A5G2mTyB5oJ3jR7bj8j9lLFtZE/Tt2XWj51cNAu9Vks8eh4s43PuCn
	Csvwb0UGUl3dwYnW0zJfpliR0kQj/Cm6E9f/+L3UwZRcM9eAq4ggCiypnBKqifb+m2eTzoDVZNm
	v3ptAls1U4rS/rHelT114Ggwv9ElCKkwYO33EEHpL+37/qNIxZ91RuaQURvrvEaLfMYO2Y5g/i6
	ihtW+x2wiKRwgfY6CuDOtMGA9+7eK7o5KnCV1TeHIgJxWVNJtzIv8pXCWmaa5RQ/NAiRooun++c
	/NgGJyM7vpBx+EE/MsECl/8l+xA3x+vxi/PjIf3hvgqMiYkI+HcizpMgDj3Qf+vzBsD1L/iRCb3
	X8NHBQx1AOj/8g0bV6e2vb2uYCSUSyB0YmMWjiYA7dZx9qWtWm+lXz23qUZWE6n6EzNJHdh6w0v
	GlWEBfcY3m1Ss
X-Received: by 2002:a05:693c:62ce:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-36a42362451mr22493017eec.11.1793785922864;
        Wed, 04 Nov 2026 01:52:02 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm7911411eec.23.2026.11.04.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:52:02 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:51:49 +0800
Subject: [PATCH] nfc: rawsock: prevent TX work requeue after socket shutdown
Message-ID: <179378590950.74297.14503648624087894519@gmail.com>
To: david@ixit.cz, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com
Cc: horms@kernel.org, lauro.venancio@openbossa.org, sameo@linux.intel.com,
 linville@tuxdriver.com, aloisio.almeida@openbossa.org,
 oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

rawsock_release() marks the socket for shutdown and cancels tx_work,
but a delayed data-exchange completion can still queue tx_work again
before the socket is finally freed. The new worker can then access
freed socket state.

Check SEND_SHUTDOWN under the write-queue lock before requeueing
transmit work in rawsock_data_exchange_complete(). Allow the completion
to clear the scheduling state without scheduling new work after the
release path has begun.

A KASAN test with a deferred NFC completion callback reproduced the
use-after-free on the unmodified kernel. The same injection-assisted
sequence completed without a report after the change.

Fixes: 23b7869c0fd08 ("NFC: add the NFC socket raw protocol")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 net/nfc/rawsock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a599fade7..efdbd512d4600 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -168,7 +168,13 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 		goto error_skb;
 
 	spin_lock_bh(&sk->sk_write_queue.lock);
-	if (!skb_queue_empty(&sk->sk_write_queue))
+	/*
+	 * The release path sets SEND_SHUTDOWN before cancel_work_sync():
+	 * once it is set, do not requeue tx_work - the socket may be freed
+	 * right after the cancel returns.
+	 */
+	if (!skb_queue_empty(&sk->sk_write_queue) &&
+	    !(sk->sk_shutdown & SEND_SHUTDOWN))
 		schedule_work(&nfc_rawsock(sk)->tx_work);
 	else
 		nfc_rawsock(sk)->tx_work_scheduled = false;
-- 
2.34.1

