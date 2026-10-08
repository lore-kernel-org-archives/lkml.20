Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34594F5E09
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913918; cv=none; b=jT4QGbT3oly/VOX7bUaSgTjMW7Dlg9JKFypFolhmr1uxAlC2lGpe/0sOXjJyaBK+Hmyz3RcszmYOhfd+kyNa9YR+B7pQFVt8G4qigjcg6QHN33An7rf5WCRpCqgP5K15aM7rS/4x7wKXfDhUoBqv/WkqvhAZD0CpZmXBqnqqFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913918; c=relaxed/simple;
	bh=4Damtj9C0Gh1uSIetXiJC02lHI5b1+Y3L1ZzZV2ZsqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITyk8kxFpi/bJQGp51Pbv8PmFREBQVBdP92N8a11ZzDEYZrMFl89RjBQNpjh/Y5tQYQmFVaUqmsEziOjGX61oClRtQKux1swLcU/ixJ9YHpsmiSGSiIDlBknuxrbL+PMYbQ04/Y7oNnMt+m6E1EoPriJBpz4EDaAcHRQJ9orMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GsRwYQFr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GsRwYQFr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3CF881A1217
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08DD060362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:54 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 658CB11D718A0; Tue, 13 Oct 2026 19:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GW3kLCRR56U9eQq/mE5tYhVBEcD1tm1jAN2V0WASdBY=;
	b=GsRwYQFrX/5zMPHvSqMu5BHBmfOrgTW3F/6NlTh37NCT862VV0sJujbmQuQd+F0y9XiPuz
	oOUS7H0boSZIpMKuyKC9CGR4FngNvM+C4M77TbVklikNlHcXDq6YIVWHVxHNWwx+WJ2lvI
	jj1kAVUTEUlZC/xxyI0M+ST0jXTjaKHDJuokPOd5O1P7HqUo+ijj5kHZ6tKY8OL8UHUH5V
	dyrLmwuh2kF1B3w2mOl+szadG+AFsDv0HF9pqZdVMAGuqqibN/zSjtM8SlY1kruASAh4Bn
	Pp3hByBvmgeOEKQfRrpk6TSOMXV+cjzgjK964m6LBXNqVPyR2mxxzZLgdv4quw==
Authentication-Results: mail.galae.net;
	none
Message-ID: <35a238ae-0e06-49a9-8539-9139aeca1a30@bootlin.com>
Date: Thu, 8 Oct 2026 12:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: Don't allow disabling napi kthread mode while
 napi instances are disabled
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 linux@armlinux.org.uk, kuniyu@google.com, sdf.kernel@gmail.com,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006141119.85562-1-maxime.chevallier@bootlin.com>
 <179142548474.434549.4875313383372623036@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179142548474.434549.4875313383372623036@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 658CB11D718A0
X-Spamd-Result: default: False [2.40 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[127];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_SPAM(0.00)[33.12%];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[sashiko,netdev];
	RCVD_COUNT_ZERO(0.00)[0];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,davemloft.net,google.com,redhat.com,armlinux.org.uk,gmail.com,bootlin.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,galae.net:url,davemloft.net:email,armlinux.org.uk:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,lunn.ch:email];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com]



On 10/8/26 04:11, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete.
> - [Medium] The new guard in netif_set_threaded()
>   (net/core/dev.c:7352-7354) treats NAPI_STATE_NPSVC as meaning 'this…
> - [Medium] After this patch, writing 0 to /sys/class/net/<iface>/threaded
>   (or calling netif_set_threaded()/dev_set_threaded() with 0) returns…
> - [Low] The commit message gets the hang mechanism wrong.
> 
> --
> 
> net: Don't allow disabling napi kthread mode while napi instances are disabled
> 
> This patch makes netif_set_threaded() return -EBUSY for a request to
> disable threaded mode when any NAPI instance with a kthread has
> NAPI_STATE_NPSVC set. The patch uses that bit to mean the instance is
> disabled. The goal is to avoid a hang in napi_stop_kthread() when threaded
> mode is turned off on a down interface whose driver added its NAPIs at
> probe time.
> 
>> Trying to disable the napi threaded state while the napi instance is
>> disabled will hang forever in napi_stop_kthread(), as it waits for
>> NAPIF_STATE_SCHED_THREADED to clear.
> 
> [Severity: Low]
> Is this the right loop? On a disabled NAPI, SCHED is set and
> SCHED_THREADED is clear. That means the hang is in the first wait loop of
> napi_stop_kthread():
> 
> net/core/dev.c:napi_stop_kthread() {
>     ...
> 		if ((val & NAPIF_STATE_SCHED_THREADED) ||
> 		    !(val & NAPIF_STATE_SCHED)) {
> 			new = val & (~(NAPIF_STATE_THREADED |
> 				       NAPIF_STATE_THREADED_BUSY_POLL));
> 		} else {
> 			msleep(20);
> 			continue;
> 		}
>     ...
> }
> 
> The second loop is the one that waits for SCHED_THREADED to clear. It
> would exit right away, but the code never gets there.
> 
> The real blocking condition is that napi_disable() or netif_napi_add()
> leaves SCHED set, and only napi_enable_locked() can clear it. That
> function needs the netdev lock, which the caller already holds.
> 
> Could the description be updated to match? With the right root cause it
> is easier to see whether other paths reach the same state (see the
> rollback comment below).
> 
>> diff --git a/net/core/dev.c b/net/core/dev.c
>> index e76762e29360e..83237591cfe85 100644
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -7347,6 +7347,12 @@ int netif_set_threaded(struct net_device *dev,
>>  				}
>>  			}
>>  		}
>> +	} else {
>> +		list_for_each_entry(napi, &dev->napi_list, dev_list) {
>> +			if (napi->thread &&
>> +			    test_bit(NAPI_STATE_NPSVC, &napi->state))
> 
> [Severity: Medium]
> Can NAPI_STATE_NPSVC be set here on a NAPI that is enabled? The bit is
> documented as a netpoll servicing flag:
> 
> include/linux/netdevice.h:
> 	NAPI_STATE_NPSVC,		/* Netpoll - don't dequeue from poll_list */
> 
> poll_one_napi() sets it for a short time around the poll, without holding
> the netdev instance lock:
> 
> net/core/netpoll.c:poll_one_napi() {
> 	if (test_and_set_bit(NAPI_STATE_NPSVC, &napi->state))
> 		return;
> 	...
> 	work = napi->poll(napi, 0);
> 	...
> 	clear_bit(NAPI_STATE_NPSVC, &napi->state);
> }
> 
> netpoll_poll_dev() only takes ni->dev_lock with down_trylock(), and
> nothing serializes it against netif_set_threaded().
> 
> Suppose netconsole or bonding is polling the device when 0 is written to
> /sys/class/net/<iface>/threaded. Would this return -EBUSY even though
> every NAPI is enabled and disabling would be safe?
> 
> A disabled NAPI always has NPSVC set. The reverse doesn't hold: NPSVC
> being set does not mean the NAPI is disabled.
> 
>> +				return -EBUSY;
> 
> [Severity: Medium]
> Does this change the documented behaviour of
> /sys/class/net/<iface>/threaded? For drivers that add their NAPIs at probe
> time, writing 0 now fails with -EBUSY on any down interface. Enabling has
> no matching check:
> 
>   ip link set eth0 down
>   echo 1 > /sys/class/net/eth0/threaded   (succeeds, creates kthreads)
>   echo 0 > /sys/class/net/eth0/threaded   (-EBUSY until link up)
> 
> Drivers that call netif_threaded_enable() at probe, such as atl1c and
> ravb, cannot leave threaded mode before the first link-up. Drivers whose
> NAPIs are added but never enabled can never leave it.
> 
> Documentation/ABI/testing/sysfs-class-net says the attribute lets the
> user "enable/disable threaded mode for all napi belonging to this device,
> without the need to do device up/down", and it lists no error cases.
> 

Ah true :/ hmmm ok is it even OK to have the check at disable time when there's
this sentence in the doc then ?

> 
>> +		}
>>  	}
>>  
>>  	WRITE_ONCE(dev->threaded, threaded);
> 
> [Severity: High]
> Can the same hang still be reached through the rollback in the enable
> path? The new check only runs in the else branch, which handles an
> explicit disable. In the if (threaded) branch, napi_kthread_create() can
> succeed for some NAPIs and then fail for a later one:
> 
> net/core/dev.c:netif_set_threaded() {
> 	if (threaded) {
> 		list_for_each_entry(napi, &dev->napi_list, dev_list) {
> 			if (!napi->thread) {
> 				err = napi_kthread_create(napi);
> 				if (err) {
> 					threaded = NETDEV_NAPI_THREADED_DISABLED;
> 					break;
> 				}
> 			}
> 		}
> 	}
>     ...
> 	list_for_each_entry(napi, &dev->napi_list, dev_list)
> 		WARN_ON_ONCE(napi_set_threaded(napi, threaded));
>     ...
> }
> 
> kthread_run() in napi_kthread_create() can fail with -ENOMEM. It can
> also fail with -EINTR if a fatal signal reaches the writer during the
> killable wait in kthread creation.
> 
> When that happens, threaded becomes DISABLED and napi_set_threaded(napi,
> 0) runs on every listed NAPI without the NPSVC check. Some NAPIs may be
> disabled but have a thread (SCHED and NPSVC set, SCHED_THREADED clear).
> The thread may have been created moments earlier in the same loop, or
> left over from before.
> 
> Each of those NAPIs would go into napi_stop_kthread() and spin in the
> first msleep(20) loop with the netdev lock held. Only napi_enable_locked()
> can clear SCHED, and it needs the same lock.
> 
> The first way to reach this is on a driver that adds its NAPIs at probe
> time (the mvpp2 case from the commit message), when a kthread creation
> fails part-way through:
> 
>   ip link set eth0 down
>   echo 1 > /sys/class/net/eth0/threaded
> 
> The second is a probe-time netif_threaded_enable() after
> netif_napi_add(). For example, ravb_probe() adds the RAVB_BE and RAVB_NC
> NAPIs and then calls netif_threaded_enable(). If creating the second
> kthread fails, would probe hang here?

Is it a realistic thing to encounter though ? I'm ok with iterating on that,
but this seems to be something very unlikely ?

> 
> Would it be better to handle disabled NAPIs in the stop path itself,
> napi_stop_kthread() or napi_set_threaded(), rather than only guarding the
> explicit disable branch?

Hmmm maybe yes

Maxime

> 

text:
Return-Path: <netdev+bounces-342895-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id CEYGKT1ux2qJEhoAtaWaaQ
	(envelope-from <netdev+bounces-342895-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Thu, 08 Oct 2026 12:19:41 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 1E77E103307C1
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 12:19:40 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=VoC6YSQT;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342895-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="netdev+bounces-342895-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791454781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=TB48IzK2cT8dwGehSyh+nRTjfUL2HXktpEgQJCx59No=;
	b=fhOA1ADTYvKGwVjVGa4HfW3VFGzxMWRf6rxBoNRGDbpBb81m1GFl26SfjoRfkxgm/EGZnr
	OHpGIUtVyuH/xFPnQfyBlkYv+u2zseYifk8l/tyYIfMwMKUTr00t0mukGASFX+28gaV0RY
	wXDm9cL0iNhukUv1QeoNIEBxgw8uMxJd05E1Sfiz6cOBf3RTQfhS/nAhqJUkY0O5SyY7Cz
	jVmlZAgH+jx5PnynkW71Z00HtaA6V2S5+Olf/EpE39gG1OjaOgHW+amBwooSYiCgl2ZzZd
	PX9nG9pdxMnQ6HfX4w9fxeQUEHMFZoTRPRUuf0oZncjeaZvEmmn+Ua+jUalKmQ==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=VoC6YSQT;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342895-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="netdev+bounces-342895-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791454781; a=rsa-sha256; cv=pass;
	b=13iM8SC5gOWIg1Vgn1FPRvaT46ET0VopY7+Tp0HgZJqkfaW7Jse3iazCA7VcLAZKkNANaJ
	p0xyvesNzlJNJtrh1W6iIjAHzN+RpVdDZItWNad9SDuzV1LougzGYpj9SmXj1M6LOVmBBd
	U0DbdCDAFgu0tmnwjGgfU3M72MTwPfWSq6ZSHuLwWmw74ssMavcBnuSGP3R1bdV+Nbe3CC
	Af4Cl4/pzix+2/jkqNcyS4wDLe+gHStpMR1+YItipfIHJ/zyIq1pEimQGakqzt3IYYcUmV
	1c7ZeC1conkhqeHnHluDXIe9MyLxn6JZsEpkTVF1gAkZ/hDLPSIttuVh3RXtLA==
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 7BDB5342E42
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 10:19:40 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D4C727E57
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583D1493621;
	Thu,  8 Oct 2026 10:19:30 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5448C8AE
	for <netdev@vger.kernel.org>; Thu,  8 Oct 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454769; cv=none; b=SBIeW4dhML8Bzlg66xcgBA6qOCS0sH+YBFcqoHnOYGF9o9EBu4Hh/VuBj5lZBr/w3kaUfqWSOLEeH3poZm6NQYQZ31Ya2BmEedAPDeSdurTWpkPF+vqP3aiEjTMbiEUnxE5jXFFg0aU257uL4uaHvHF70gONM2vYrJ4/NUnKhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454769; c=relaxed/simple;
	bh=v9D1byBfiq9TEgLAAt3ZJv9mv/k9ZU10KYmWcDAZhTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyVxSymFOGBol1HIg1cPKxUgbQiK6Rn5fjBSUvvk3EVuKgoz6bC6AN7IzMbqtey8nZozIkLklhIhKT/U0akgXUw7GiEeRo2foX+3BE0lIsS2Drm+HUfkCfXjlI+5MO0CSHQpnvgdwjjsncaUpDuh3NhD7T+hV7QuDwCyz8IXPVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VoC6YSQT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 322001A1193;
	Thu,  8 Oct 2026 10:19:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0376D60341;
	Thu,  8 Oct 2026 10:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82049103307C1;
	Thu,  8 Oct 2026 12:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791454763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TB48IzK2cT8dwGehSyh+nRTjfUL2HXktpEgQJCx59No=;
	b=VoC6YSQTAF1xMvRN6XE05xuU0zzoe/zMDh0cuezJ1R5vKPuinnEuYIExpxxZLBeVyuXNBU
	3J2blO1j2P0+kpMomYJGYcAyVpvjvrXb4UcnYI7Nf0o1z7GB1XArJ61vScsDy/UdiDy+aO
	x0owYC6juKGoyWE65ro5Zysd5uCDCVluhviL5dQbux5Ra27hP4yX2zEKlu22zoIJxpf44/
	u1FTaCTZC5u4u0Ls60x/4oaM5EjAuCjXlcBmVy9LdZjvFayuQhRcd3YOb9baVhyRyB9clT
	xpfvgQK4/NRRadDKC2L3pVGwl7ayywKcloRilINMtRtTJG0Q5SAAg7L2wJSqxg==
Message-ID: <35a238ae-0e06-49a9-8539-9139aeca1a30@bootlin.com>
Date: Thu, 8 Oct 2026 12:19:19 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: Don't allow disabling napi kthread mode while
 napi instances are disabled
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 linux@armlinux.org.uk, kuniyu@google.com, sdf.kernel@gmail.com,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006141119.85562-1-maxime.chevallier@bootlin.com>
 <179142548474.434549.4875313383372623036@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <179142548474.434549.4875313383372623036@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-7.38 / 30.00];
	BAYES_HAM(-5.30)[99.52%];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.105.105.114(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim];
	TAGGED_FROM(0.00)[bounces-342895-maxime.chevallier=bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.105.105.114:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	TO_DN_NONE(0.00)[];
	DNSWL_BLOCKED(0.00)[185.246.84.56:received,100.90.174.1:received,212.83.139.233:received,212.83.136.155:received,172.105.105.114:from];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,davemloft.net,google.com,redhat.com,armlinux.org.uk,gmail.com,bootlin.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	TAGGED_RCPT(0.00)[sashiko,netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E77E103307C1



On 10/8/26 04:11, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete.
> - [Medium] The new guard in netif_set_threaded()
>   (net/core/dev.c:7352-7354) treats NAPI_STATE_NPSVC as meaning 'this…
> - [Medium] After this patch, writing 0 to /sys/class/net/<iface>/threaded
>   (or calling netif_set_threaded()/dev_set_threaded() with 0) returns…
> - [Low] The commit message gets the hang mechanism wrong.
> 
> --
> 
> net: Don't allow disabling napi kthread mode while napi instances are disabled
> 
> This patch makes netif_set_threaded() return -EBUSY for a request to
> disable threaded mode when any NAPI instance with a kthread has
> NAPI_STATE_NPSVC set. The patch uses that bit to mean the instance is
> disabled. The goal is to avoid a hang in napi_stop_kthread() when threaded
> mode is turned off on a down interface whose driver added its NAPIs at
> probe time.
> 
>> Trying to disable the napi threaded state while the napi instance is
>> disabled will hang forever in napi_stop_kthread(), as it waits for
>> NAPIF_STATE_SCHED_THREADED to clear.
> 
> [Severity: Low]
> Is this the right loop? On a disabled NAPI, SCHED is set and
> SCHED_THREADED is clear. That means the hang is in the first wait loop of
> napi_stop_kthread():
> 
> net/core/dev.c:napi_stop_kthread() {
>     ...
> 		if ((val & NAPIF_STATE_SCHED_THREADED) ||
> 		    !(val & NAPIF_STATE_SCHED)) {
> 			new = val & (~(NAPIF_STATE_THREADED |
> 				       NAPIF_STATE_THREADED_BUSY_POLL));
> 		} else {
> 			msleep(20);
> 			continue;
> 		}
>     ...
> }
> 
> The second loop is the one that waits for SCHED_THREADED to clear. It
> would exit right away, but the code never gets there.
> 
> The real blocking condition is that napi_disable() or netif_napi_add()
> leaves SCHED set, and only napi_enable_locked() can clear it. That
> function needs the netdev lock, which the caller already holds.
> 
> Could the description be updated to match? With the right root cause it
> is easier to see whether other paths reach the same state (see the
> rollback comment below).
> 
>> diff --git a/net/core/dev.c b/net/core/dev.c
>> index e76762e29360e..83237591cfe85 100644
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -7347,6 +7347,12 @@ int netif_set_threaded(struct net_device *dev,
>>  				}
>>  			}
>>  		}
>> +	} else {
>> +		list_for_each_entry(napi, &dev->napi_list, dev_list) {
>> +			if (napi->thread &&
>> +			    test_bit(NAPI_STATE_NPSVC, &napi->state))
> 
> [Severity: Medium]
> Can NAPI_STATE_NPSVC be set here on a NAPI that is enabled? The bit is
> documented as a netpoll servicing flag:
> 
> include/linux/netdevice.h:
> 	NAPI_STATE_NPSVC,		/* Netpoll - don't dequeue from poll_list */
> 
> poll_one_napi() sets it for a short time around the poll, without holding
> the netdev instance lock:
> 
> net/core/netpoll.c:poll_one_napi() {
> 	if (test_and_set_bit(NAPI_STATE_NPSVC, &napi->state))
> 		return;
> 	...
> 	work = napi->poll(napi, 0);
> 	...
> 	clear_bit(NAPI_STATE_NPSVC, &napi->state);
> }
> 
> netpoll_poll_dev() only takes ni->dev_lock with down_trylock(), and
> nothing serializes it against netif_set_threaded().
> 
> Suppose netconsole or bonding is polling the device when 0 is written to
> /sys/class/net/<iface>/threaded. Would this return -EBUSY even though
> every NAPI is enabled and disabling would be safe?
> 
> A disabled NAPI always has NPSVC set. The reverse doesn't hold: NPSVC
> being set does not mean the NAPI is disabled.
> 
>> +				return -EBUSY;
> 
> [Severity: Medium]
> Does this change the documented behaviour of
> /sys/class/net/<iface>/threaded? For drivers that add their NAPIs at probe
> time, writing 0 now fails with -EBUSY on any down interface. Enabling has
> no matching check:
> 
>   ip link set eth0 down
>   echo 1 > /sys/class/net/eth0/threaded   (succeeds, creates kthreads)
>   echo 0 > /sys/class/net/eth0/threaded   (-EBUSY until link up)
> 
> Drivers that call netif_threaded_enable() at probe, such as atl1c and
> ravb, cannot leave threaded mode before the first link-up. Drivers whose
> NAPIs are added but never enabled can never leave it.
> 
> Documentation/ABI/testing/sysfs-class-net says the attribute lets the
> user "enable/disable threaded mode for all napi belonging to this device,
> without the need to do device up/down", and it lists no error cases.
> 

Ah true :/ hmmm ok is it even OK to have the check at disable time when there's
this sentence in the doc then ?

> 
>> +		}
>>  	}
>>  
>>  	WRITE_ONCE(dev->threaded, threaded);
> 
> [Severity: High]
> Can the same hang still be reached through the rollback in the enable
> path? The new check only runs in the else branch, which handles an
> explicit disable. In the if (threaded) branch, napi_kthread_create() can
> succeed for some NAPIs and then fail for a later one:
> 
> net/core/dev.c:netif_set_threaded() {
> 	if (threaded) {
> 		list_for_each_entry(napi, &dev->napi_list, dev_list) {
> 			if (!napi->thread) {
> 				err = napi_kthread_create(napi);
> 				if (err) {
> 					threaded = NETDEV_NAPI_THREADED_DISABLED;
> 					break;
> 				}
> 			}
> 		}
> 	}
>     ...
> 	list_for_each_entry(napi, &dev->napi_list, dev_list)
> 		WARN_ON_ONCE(napi_set_threaded(napi, threaded));
>     ...
> }
> 
> kthread_run() in napi_kthread_create() can fail with -ENOMEM. It can
> also fail with -EINTR if a fatal signal reaches the writer during the
> killable wait in kthread creation.
> 
> When that happens, threaded becomes DISABLED and napi_set_threaded(napi,
> 0) runs on every listed NAPI without the NPSVC check. Some NAPIs may be
> disabled but have a thread (SCHED and NPSVC set, SCHED_THREADED clear).
> The thread may have been created moments earlier in the same loop, or
> left over from before.
> 
> Each of those NAPIs would go into napi_stop_kthread() and spin in the
> first msleep(20) loop with the netdev lock held. Only napi_enable_locked()
> can clear SCHED, and it needs the same lock.
> 
> The first way to reach this is on a driver that adds its NAPIs at probe
> time (the mvpp2 case from the commit message), when a kthread creation
> fails part-way through:
> 
>   ip link set eth0 down
>   echo 1 > /sys/class/net/eth0/threaded
> 
> The second is a probe-time netif_threaded_enable() after
> netif_napi_add(). For example, ravb_probe() adds the RAVB_BE and RAVB_NC
> NAPIs and then calls netif_threaded_enable(). If creating the second
> kthread fails, would probe hang here?

Is it a realistic thing to encounter though ? I'm ok with iterating on that,
but this seems to be something very unlikely ?

> 
> Would it be better to handle disabled NAPIs in the stop path itself,
> napi_stop_kthread() or napi_set_threaded(), rather than only guarding the
> explicit disable branch?

Hmmm maybe yes

Maxime

> 


