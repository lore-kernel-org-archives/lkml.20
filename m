Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220507;
	b=jH7pIKNdHKlbEEfnt3nQ1z7P8MvjW2leZf5IzuHJQwsXI4JYKiKWKlWCQdXXxcg/uctI
	 SLV6HwPWZDs9B8luh6kJyJ4CUGrb3jSAdKZ3mF9798a0Y4dF/5xGGHVbwWBwrsi5gsVzr
	 bSX3GFt9POMASn2kLZ+8D6brkeSftfR6+w8/u/Sdz167h2woVsMGS5MZnsonEDApLTBiv
	 KvxpL3M1NMpWVcsyJW/kYt/wUCOV+9+V+W73cB2Af7UbJpru1KYMHEC4dhjXvcT9qrpl7
	 D1DiYSt+MIgY5wN1jkEgylgczzs15srWgbL44cvjOyrqJbXAsp3dzogDgFqnJDOhhBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220507;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=781MGkUds9I/CI1+UP2+HKzeCqNjF5wPmk1nWC+RDLw=;
	b=BeZVcvSVi6ezYf1CJmH6Vds/Tmqm8MxEwGQ1v63FbrXg4fBLPIgyQtjIaPacWlISto1n
	 vqf6Cgt+KH+Cgr+NBSEDQAi1vAcbIbfIGbu20Asn8jAB1QZn76NJxB5wuNVcnGPLmQce8
	 BfChKzITdXiLcSuFnjCS2UIxbWeLfJ+JGxVTW/aWVxuN+U74j72Cq6KYAY9EKAskRZG5d
	 sOUG6T76CKhxz6NS+UK0ABe4sDIfbJqfJguPKZ9tBTWjGOKjmfQ7sye1YdskymL6g7X44
	 9bgYw87K0ek1Cd0HpRty6WoFwIHdCox10Hwer4tJ7fdNT/hmcDfSzCRFFhNIo8yxw1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=OyMtypEJ;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C5606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859C5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=OyMtypEJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794220498; x=1794479698;
	bh=781MGkUds9I/CI1+UP2+HKzeCqNjF5wPmk1nWC+RDLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OyMtypEJGoKtINe2AEHBQiUCtjzZr1LAavt9y3jZ7fzBv6McX5oIPNPG4p9KHaCbN
	 uPCnvGaSA3bfeZzk/abBEtju0obqeUD6tkEcPDmsKhTqWSbrNeuNnnTmhWG/Bo+Vdy
	 LRDZuJNmkmwXh1PQvjvdZMugKhjS1788YhaL4cQn5LPJwnWTDeiM5xZJZnm1rWzFB8
	 08YG2lt3HnHUYYTnx2DqgcrpqkaeHAIVeWYjQp07d7qqqE5KzYWOP8QxrPJ1fnzFEZ
	 YQGfjWmVmTRbb1wSJJkBnuitC61Z9DBbWmDLwydvy5xb4s1jqx/1QRK8YhYJMpZXkd
	 nc5PCFE/lldXg==
Date: Mon, 09 Nov 2026 10:34:51 +0000
To: Farhad Alemi <farhad.alemi@berkeley.edu>
From: Chad Aldreda <ca@modelmiser.com>
Cc: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, Jeff Johnson <jjohnson@kernel.org>, falemi@asu.edu, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ath9k_htc_tx_cleanup_timer -- ODEBUG free-active-timer and use-after-free on USB unplug
Message-ID: <20261109103444.381459-2-ca@modelmiser.com>
In-Reply-To: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com>
References: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: d3056e397a153c22841cac1e7ebcd25d4381a482
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Farhad,

Could you share the reproducer for this one?

Two paths in the code would fit the report. Both end the same way:
the timer re-arms itself (ath9k_htc_tx_cleanup_timer()), and nothing
deletes it before ath9k_htc_disconnect_device() frees the hw.

1. ath9k_fatal_work() calls ath9k_htc_reset(), which re-arms
   tx.cleanup_timer without checking ATH_OP_INVALID. A WMI_FATAL_EVENTID
   (or beacon-stuck SWBA) that arrives after ath9k_htc_stop() has
   finished still queues fatal_work, since WMI events are processed
   until ath9k_stop_wmi(). The timer is then armed on a stopped device,
   and ieee80211_unregister_hw() does not call stop again.

2. Inside ath9k_htc_stop(), the timer is deleted and priv->mutex is
   dropped before cancel_work_sync(&priv->fatal_work). A fatal_work
   already waiting on the mutex runs the reset in that gap and re-arms
   the timer.

I'd like to know which one your reproducer hits before proposing a
fix. Does it send WMI_FATAL_EVENTID (or let beacons go stuck in
AP/IBSS/mesh mode), and is the interface up or down when it does?

The code reading above was done with an AI assistant (Claude). Nothing
has been tested yet.

Thanks,
Chad

