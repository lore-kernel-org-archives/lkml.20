Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008597;
	b=c2H+KOoF7V58nnLsNBztO000eCaXmPFpX8WPHx73MnBhJa67NpZhnkBOh0ba3KaNqdad
	 mlNsrmF6LuHfZbB60CqpFxIp86D1Mq6TG0ABvD5dmAeNP5bPagvKzJ4VPRZyBM2IbfqK1
	 A/NFLIF/DsHamS6cFftBya5VVPHZjdRJ7QyxXJp9pRt1X87zuCOdPDQPnP6ADdQ4PXwKl
	 TmsCK9+brZWuI5QQG1vGk9cuozsdieSbyQPK+mt9HEoWuZyc/9g4T98PruhyqNpzsEVJP
	 lyPJRLirE2PLYaHfHzViaU3P2OjXGNgSFIjKHxNpLmdaPMJDcZTbo1MVtDCHp1zJA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008597;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u6p1NeAht6sy5HDs8mkaXuueBotTb12+8J32yY0dt6E=;
	b=zYfrGPCR3kmzoE4Iwzpt9uqg3SUR9yjsue2w8IAKx+b8XNDiofTEKYSc9FwkfPdi2B+J
	 2jRhZnjoHYTEJtwxAyip2EDG1GS5isqFBd/oXMH4AQaBEhuuCDXaKmEArK0p1zud/Pi8p
	 6tkILABkiiUJLbfMhCKkB22pbdLtZvJJCnGVA3/KbFGsmp1DSz9BsNqlkDvFOi2UN0eZB
	 BwBUFvxmJw4xj1wkZkFPMJMOsSlQ1opwpLn4a8PFV/nb3WEVnwfIkgOadjCTq0iXOwb87
	 JDR5kKrKUAvWtSaEaXmdOSJ287iGKPqZ8KZStcFMmCs9LRTo2Bkg9tb6c+jUA2eR0FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=PX13l1Jy;
	arc=none smtp.remote-ip=61.135.153.162
Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383E606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7383E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=PX13l1Jy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793008592;
	bh=u6p1NeAht6sy5HDs8mkaXuueBotTb12+8J32yY0dt6E=;
	h=From:Subject:Date:Message-ID;
	b=PX13l1Jy2GXuJfDe5kdclO+v2VulefGWvMdOsuOBOucQ7cMTIvfd6tPRLjrtdqvxY
	 DRljqFVEFnIwz3FIJC0KYcRgSAtLaNfc7zg05PxEbX/vdaLwBqYjgwKOpXgiXnbqaP
	 e73BKb2TcGnuSWTQicq5sW5gE4Zb8MvOgOIGW1y4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.246.238.119])
	by sina.com (10.54.253.31) with ESMTP
	id 6ADF23C300003E49; Mon, 26 Oct 2026 17:56:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9194176816254
X-SMAIL-UIID: 487C3EC4996C48F68C01A18961084FB4-20261026-175622-1
From: Hillf Danton <hdanton@sina.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	syzbot+c15de43f1e7fffbb7b9b@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH] KEYS: dispatch key_gc_work to system_wq.
Date: Mon, 26 Oct 2026 17:56:05 +0800
Message-ID: <20261026095609.1220-1-hdanton@sina.com>
In-Reply-To: <20261026031219.2627968-1-jarkko@kernel.org>
References: 
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

On Mon, 26 Oct 2026 05:12:18 +0200 Jarkko Sakkinen wrote:
> schedule_work() dispatches key_gc_work on the per-CPU system_wq, which can
> choke the queue:
> 
> BUG: workqueue lockup - pool cpus=0 node=0 flags=0x2 nice=0 stuck for 30s!
> 
> Queue the work on system_dfl_long_wq instead, which is an unbounded wq for
> long-running tasks i.e., it has the WQ_BOUND flag set and thus cannot hog
> the CPU core.
>
Nope there is no cpu hog at all given cond_resched().
Take a break instead then the workqueue has a chance for housekeeping.

--- x/security/keys/gc.c
+++ y/security/keys/gc.c
@@ -270,9 +270,8 @@ contended:
 
 maybe_resched:
 	if (cursor) {
-		cond_resched();
-		spin_lock(&key_serial_lock);
-		goto continue_scanning;
+		schedule_work(&key_gc_work);
+		return;
 	}
 
 	/* We've completed the pass.  Set the timer if we need to and queue a
--
