Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690935;
	b=qi99t9pBXd+MaAuTiNwS+xjH7laMbfjyqcvO3g9qnbsKk0FQpcz9vkSqo+H3BKrDbDVH
	 v2RIxBlPb6t09D6qplM4pB+F1hZlfG4o1LVGcpciRnY7SHrqFug67k9qFKiHOozCc6elD
	 bVNz3OtiqNyBKl6Qkg0PqbTXVlB+1fuPEEF06Y+12Pa34s9ralAiLMdMT8y1cUYYw97mk
	 yJ3q7Xpo2nAzgUbZxYdrVfVIW+DP1lAUDoK/VZcfwm9QckyPlI4vBLHGAGkDmhRrrsVa6
	 NE3YsD7xey0QT5Lu+BWrfttUNkHD3BhqQhRD5ZcSpOSquHdIRLMxCRMBHB7pRmZ4G1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=BTNqZBLZ4V+Z/BDcsgHZJ6Lp5cyvyfZFCJCeJ7tg1SQ=;
	b=SmrQ6npvbOukx3VpzrDt/61FBomYgHgazX9Jt5PgMWIx9xAt+wexszNFv5ttHnlQHgn+
	 u/314QuTsP2GZ90/sp3kVZpIKhbL9btFf+7tyuX+Bh+Apur99sQjEFhta2rejyn8JnnuP
	 uGLqsZrbGcb0xGTKw0mJCtI5Wh5RuSEhHRQedS19aY7iwmp70+Plw7Xx/YimHhDd7CRFB
	 AvULG9TqayywZWUHsQa9CxBnt26VvXrE3Dw3Nb3Ly46MSh4RH+X9wzxIgiJ84NDwvyv2U
	 P5B8HOxh/79WLfERaWmBLGhGgmwoZuBT/QLJcmHERZkyOanBPrUMtyro5mMm4gA1P7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=4V602Irk;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C5606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=4V602Irk
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRn371RFlz8Xrnt;
	Sun, 15 Nov 2026 05:15:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794690931;
	bh=BTNqZBLZ4V+Z/BDcsgHZJ6Lp5cyvyfZFCJCeJ7tg1SQ=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=4V602Irk61zRHSbdH8wMgzBdkAbd+dRAIY/0+3OxCw5Tr8rvn10HRiZiWenUJ7JR0
	 bke3dzBztFy7yM4d50HX1U3mNHOatVT0m+IUQmj0NMXgEtY/mMdXyQgRHgEFz5YrsX
	 DJ5Vm3AQIM1fZyE+4xCyWq/lxckiA/0oljQlutPLSqhSA7l2yP9ecfvGpogImyabdN
	 /g1qtbmEuRx54fuhJ/OpfzLGxyg8QvWu4FLgHkd2OHqo82JP5yh82lmYSxRZFpjrJI
	 8+lI1/zwOyQKVSIsyicIDcjXg3DeGQragRyngnmb4pTjd5Us6dTeY9dgZ1Jn4gH1Tk
	 oVIESzhekUuDA==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6AELFReh002389;
	Sun, 15 Nov 2026 05:15:27 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 05:15:26 +0800 (CST)
X-Zmail-TransId: 2afa6af8cf6e508-cb43d
X-Mailer: Zmail v1.0
Message-ID: <20261115051526117H0NSID837XMXH6qUeh_JS@zte.com.cn>
In-Reply-To: <179468563735.482102.182237761852902643.b4-reply@b4>
References: 20261115004655564ix3vefI54RZ3HhYOmxuKX@zte.com.cn,20261115025832904-wsPy8LPoyIcDJ6FMU1_H@zte.com.cn,179468563735.482102.182237761852902643.b4-reply@b4
Date: Sun, 15 Nov 2026 05:15:26 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <gourry@gourry.net>
Cc: <ljs@kernel.org>, <akpm@linux-foundation.org>, <liam@infradead.org>,
        <linux-mm@kvack.org>, <vbabka@kernel.org>, <jannh@google.com>,
        <pfalcato@suse.de>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gbW0vdm1hOiByZXN0b3JlIFZNQSBpdGVyYXRvciBvbiBmdWxsLXJhbmdlIG1lcmdlIGZhaWx1cmU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AELFReh002389
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 15 Nov 2026 05:15:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF8CF73.001/4jRn371RFlz8Xrnt

Gregory,

Thank you for the candid reply, and for taking the time to write it. I
appreciate that you explained the problem instead of just dismissing the
submission.

You are right about the triage cost. I had been treating an LLM-assisted
patch that gets applied as the measure of a useful contribution, and I
did not weigh the review time that every submission takes from
maintainers -- including the ones that are ultimately rejected. The VMA
iterator patch in this thread was exactly that kind of report: I could
show an internal invariant but not a user-visible effect, and the cost of
reading it was still real. I have withdrawn it.

I will change how I work before sending anything else. I will not submit
a patch until I can state a reachable trigger and a user-visible effect.
If I cannot establish that a report is worth your time, I will not send
it.

Thank you again for the honesty and the guidance. I will take it with me.

Thanks,
Shao
