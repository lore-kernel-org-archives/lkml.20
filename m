Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053351;
	b=PUjQtbGSG9KZ4W5XSUYoANJuaj+/LZHal+h2MZqQhSIXxWPghbdPPQrlfTQSNncZg/X2
	 S4vYBnNNFaK2tj/Pa73V+twtJfQcHZUf2O2iWsjhGuo/6KlbZM6hAzTWxbrNw0yEl/vc3
	 4lUDff6i0ec82gn46xpWLg6p5KF75Szks7g6mQdxYgI58jsyl9W+Q7FE62O+4V9s0awss
	 z6BPNFKiV143JKeMD/x5g0dW1WZSQaT7qtbV8+Kdbw92g1AGMNi0ou19vSYkEvKV4uYSK
	 HAXOI88CdgrnGtrYjt0LU6vL7VbXb9kmuR+owVMpYJgNGqfbE3XE/Q69ItRQFpVyKsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053351;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5a9b9p/UJjslYubv5cdFdvvrFLpKyP+ZAkQDrroPyH0=;
	b=TPjiRZweU4WAsnF6jIgGg6w52FHbZ8VM2CIkTDzqwOsIgdZQg63vH4r2cWsrfuIJsPib
	 ipnAG3nxZ5mibS97oS7F1r/KrhtJ+zQYn2a5sjeJzO2ZCj0OR1yeF/DbfJuI2KNcYH4mM
	 0WJMjTTQzu9Gq5wwDq2X+9ZnuyYh+knefFvj+S4nOiNtZMtveI7GVfVA2l0xWQ1ee1JtU
	 Q9ns1MY9+JHkTfxmvSTzyl/JBoZ6VadP2EQ83vSOhpgsbeOll/XSQiPTS8r1MOuJbvc6R
	 sSHgr17Od3QvTOakferg/O1XzRFrikqloFbmimztRwhQBrrCjpTciaylj3z+rSzUfLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=KD5fVYcY;
	arc=none smtp.remote-ip=202.108.3.164
Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF34606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF34606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=KD5fVYcY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793053349;
	bh=5a9b9p/UJjslYubv5cdFdvvrFLpKyP+ZAkQDrroPyH0=;
	h=From:Subject:Date:Message-ID;
	b=KD5fVYcYHy3Bi+8QBhKrzW7zSjtJZ0jRwrF/+JkUxHf1b3ghL62xnvwfidlIMz6u3
	 Sk+9B8Y4h+t1zTHlZpqGzHNc/+yJBzEls0cETauRRKdnSAIYtzNvHI+tONnJyLZ+ws
	 Qvzafr8CZYfjwGcHnegZQODJADP02NxbE+PWuIwo=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([221.216.116.161])
	by sina.com (10.54.253.32) with ESMTP
	id 6ADFD29900003C30; Mon, 27 Oct 2026 06:22:20 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5247364456895
X-SMAIL-UIID: B7C18B214B434382B1709165159D6EC7-20261027-062220-1
From: Hillf Danton <hdanton@sina.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	syzbot+c15de43f1e7fffbb7b9b@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH] KEYS: dispatch key_gc_work to system_wq.
Date: Tue, 27 Oct 2026 06:21:52 +0800
Message-ID: <20261026222207.1237-1-hdanton@sina.com>
In-Reply-To: <at-LgXM3BjyfF21u@kernel.org>
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

On Mon, 26 Oct 2026 19:18:57 +0200 Jarkko Sakkinen wrote:
>On Mon, Oct 26, 2026 at 06:57:22PM +0200, Jarkko Sakkinen wrote:
>> > --- x/security/keys/gc.c
>> > +++ y/security/keys/gc.c
>> > @@ -270,9 +270,8 @@ contended:
>> >  
>> >  maybe_resched:
>> >  	if (cursor) {
>> > -		cond_resched();
>> > -		spin_lock(&key_serial_lock);
>> > -		goto continue_scanning;
>> > +		schedule_work(&key_gc_work);
>> > +		return;
>> >  	}
>
>I guess I'll to elaborate my fix and this proposal as you gave feedback
>of neither.
>
>What you wanted to respond to my patch other than nitpicking is probably
>this sequence:
>
Nope because synchronize_rcu() has nothing to do with workqueue lockup.

>  key_garbage_collector()
>    synchronize_rcu()
>      synchronize_rcu_normal()
>        wait_for_completion()
>          schedule_timeout()
>            schedule()
>
>I should have put this to the commit message, and missed also this
>detail.
>
>So the way I saw this, which could be wrong, is that the workqueue
>lockup would could happen less often as also other threads are scheduled
>preemptively in unbounded queue outside critical sections.
>
The unbound queue could also suffer lockup.

>What you are doing with early return is at least not right as it 
>corrupts the state. So you should supplement that with something

How?

>that carries it.
>
Feel free to post a diff?
