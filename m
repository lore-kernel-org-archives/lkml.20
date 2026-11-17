Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885106;
	b=Z3nDenqPFQ/RZq6qXtiVWG66brsIeoaz7NCeEMa+4XL/lpaGh8dCm/YtpUhpW+/bXBav
	 Jo2azc5Nk9wCAQwCVBcKvLtiUzLzTkodas54Q0JBTQkMcLOGbQfdQCYUj56BzwtaaAirj
	 nVsuBERK+UMyKDB9h2FhuxIY2EPzS6jOomZ4hkXJe8jhwBKnO3Af36l/NSv2ybdZTT2FH
	 DUVS66Axp3xIUhhHBp/opwPHiubl0E3XJS0LEIHtiU+8ETVMnHmsCeQC5NlLuuOT9l174
	 pglV+VJHtqFIF9YwaF2+AWN2+c3zLrHsjl0nEJCng5+hPAlR+0PUUOjq6pkXTVaWJEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885106;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+wnSZ7A7PPnlmFWzjSRIWTnpzlW48m+JuWgJ9p2+anU=;
	b=UO/mHq5irBmqqxDapMcX3eEE55kJf639XoBByo4lLd1tcbuNjmyf6ZHwexMzmcuh3MlE
	 0KK4s8d0sfY2TfiPADyaMbquEQInqlP4xPwoNfXpcNFOSB3jWALiL/v+AqQFlv5dqNU5k
	 N65q3VyB30UH26NOmntQyWc2K4NZP8oam498r1gDl+r6aR1mBlMRTMfmHzYtWB6ezVwme
	 hfyG0O5KHzOoOoPP7kx6BvzFE3WHnoWDjKmbXzkyX/TSb0zUQ8nro+XAOkzvhaDKNljQv
	 JS4XB6VArHY3cY4Y07ueqCRb1TMfkX9QQkgSA3JSnGWa32/wZtitQ2q+FkCQK1rYVUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=g2QBG3Vn;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72971606A31C;
	Tue, 17 Nov 2026 03:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72971606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=g2QBG3Vn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=g2QBG3VnPk2eHmbkyQ0RNnW94jSo2CUEHcjbvroXSqFQwDRzPNktNY90pEGCm9tM4LOq054aApWFk
	 +MVr6WXwVOjYq9tqRKVpqbbivB4/l+DxCPQ3RxfPdnr89+IyCDFU/moUhy6baBipBLDoOw+qM2m1cL
	 kjrYDdRRBd4SXxtc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afbc5ed53c-a4a77;
	Tue, 17 Nov 2026 11:11:41 +0800 (CST)
X-RM-TRANSID:2ee86afbc5ed53c-a4a77
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.50] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6afbc5eb43c-a097c;
	Tue, 17 Nov 2026 11:11:40 +0800 (CST)
X-RM-TRANSID:2eea6afbc5eb43c-a097c
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Curtis McBurney <cmcburney@telcobridges.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 willemb@google.com, toke@redhat.com, linux-kernel@vger.kernel.org,
 yana06070@163.com
Subject: Re: [PATCH net 0/2] net: keep txq->trans_start on repeated
 netif_tx_stop_queue()
Date: Tue, 17 Nov 2026 11:11:39 +0800
Message-ID: <1794885099000.591574.1428654905365174928@cmss.chinamobile.com>
In-Reply-To: <20261116143716.367451-1-cmcburney@telcobridges.com>
References: <20261116143716.367451-1-cmcburney@telcobridges.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 11/16/26 09:37, Curtis McBurney wrote:
> Since commit 95ecba62e2fd ("net: fix races in
> netdev_tx_sent_queue()/dev_watchdog()"), every netif_tx_stop_queue()
> call writes txq->trans_start, also on a queue that is already stopped.

Each of the four drivers re-arms its hang check from a two-second
watchdog task and stops the queue again while the hang persists,
without waking it: e1000 and e1000e via netif_stop_queue() from
e1000_clean_tx_irq() and e1000_print_hw_hang(), igb and igc via
netif_stop_subqueue(). All four set watchdog_timeo to 5 seconds, so
with the unconditional write each repeat stop moves trans_start
another two seconds forward and dev_watchdog() never reaches
trans_start + watchdog_timeo.

The ordering of 95ecba62e2fd survives the gate: the WRITE_ONCE still
precedes the barrier and the set_bit(), and both of those remain
unconditional. A queue stopped only by BQL still gets a stamp, since
the gate tests DRV_XOFF alone. That case is the last of the KUnit
tests.

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>


