Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1554E5221F0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069127; cv=none; b=FDoi2pXUAdt8xOiDL5SIKQ8kVDT0KwCuJ416zHvo21lXJXWNXb6pKnwCc2y1kdsQ9XIDK64np6KK/xfILLQpdGsm7tnFhDGu78gJRPS4uqtJiL5EDb3J2PTzO4C+Xs3VgHfiLyzh/vg73DRGJyWPIlG4V1Vp1jxvJ/6kfnKyZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069127; c=relaxed/simple;
	bh=rHt+naZXGLBZSE9O7hosIYmJ0Y+H+Qn/XqS+Kna3JY0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dNMoicsM5MMkglLBIwCcv/tSGN4+YG1FcRsJKA2ZRZWig+yxiM/LF+0I/XdpiGq/u9QarWrE7CS3V4Hs9NltV7nVIggir+33oOuuys1YCLYPUl3+w/bWoz/16Xr54qvze89cpGEbeEqNc+tUIBjMF0GYViEstlTRPCFwgqxmdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fRzFRQNb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dFngW2BH; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fRzFRQNb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dFngW2BH"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E28D61400131
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:43 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 08:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792069120;
	 x=1792155520; bh=nOhuLjJR3Obqc0tgKBJwb0ZJuVPMdcA5qzsdzW1GoOU=; b=
	fRzFRQNbP9maJ93Jh3//MuS16fE6xiZCvH4Z2RdIDncjyybXDnonOBJ+28fQ6WG1
	anK+dSnOpjsThll2BvOM6YiVQJtM3yqIMkgDNz/r9lhLItGPAKb7XJbZsmMSYQYq
	WSxVwKOiLa0pA5IHhRROXrllzf3USUeCc1hsK7QcjqaCiC4+6hQlJN/ZHBprvSwb
	PUISENjMIzZj/Vtg3L0m7VkwPYWXp1jX4A2obTsInFvzI3EXCmPTivUaKcbNgdDu
	3wK9xojalTOtEsHkATy4R3+OIQ/Zi4Vr7gFso09FYH8ffO81+e05lzXipgvWcX0a
	cDxMRqUJkxhrtmOXNRYJCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792069120; x=
	1792155520; bh=nOhuLjJR3Obqc0tgKBJwb0ZJuVPMdcA5qzsdzW1GoOU=; b=d
	FngW2BHTgDHF/nmavNaSfbbsseNCex16TVMFNVBM8Hmm1RbtqQjFzkHnMBTze3eB
	n7CdnldWCK0gBZWWH+BGFrlXIjXC5CJBv4vXDTL34DAbkGNtB3qxuGD6b1if6oPU
	5QaZ7EID1IsQtTWNO4CHxJIsAdtYwu5ZO4IVq0ONOT7cjspXfXrmgd2cHgYTk2S8
	AGv0Pw0QFGLeUxZGlzIIzJ5MWCI4+m5EYN1rq73as3CT233VVKJPeSCOb0nSKl1/
	ZGgTw6YPO8ZVAtFGDojitt1qBhF1LxK+wcTNHe7EgjkttUvnNk2UVQIqY7XYZBUE
	/UdX1ZxtyHGzi1r7FURFg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792069120; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:g+4xXCBVnO/Irdyv3JkgeLo4Oh3pBiKeXH1UYPLBYLhtH0L
	EVOCwmM2znpAIWu9qE11QoCFuyn3bhMdTmTe9JGTth18oMRzZUX556mQe5bcqVl2
	OOhDnZjQvhrfbZzxPePI6W2uZ/5KwO8mfEeOwBQ6NXfp4vKK+jW3eDkW8SSfxGn9
	yki/HVWiRB/2qQDJXMrkmpipu6hPtxkLKSDZHi+6VaM7OHsjnPTSDyozKZ1zFF9K
	nbfF1mitjm4rPFSNFmguwYtMvoIREPDsRZgZtLzZ3kuDEBvQVHv9HefHkeIK1I2d
	boC2LaWV+3XlDXQDrKJHTcttbrTmet9h39TOXeQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KQqCs75D8h4gjwnbsEUHiIqPYL8eR98qOISiJB0s1WQ=:rHt+naZXGLBZSE9O7hosIYmJ0Y+H+Qn/XqS+Kna3JY0=;
X-ME-Sender: <xms:_c3QakG0vdUAjZLBNfqf8xVfOMn2Jkmq3P085jG6JmWxnW8T7GIOug>
    <xme:_c3QaoL5MtdsCZxoG_1gA6AKtubUR7a3DRgr8P9osVRT1p8DZl0Ap0uH4aJIJZ_ft
    N41e-MfOViErOWqzV9ghrq6cLvUqmv4YfOk2BGl-_txg1is0zJo_tW7>
X-ME-Proxy-Cause: dmFkZTGNjpnVnZhfO0iyh0pgmMvHtjOnty8reN9iv8zglWFzrkXpH6HOx5f1fO1e3Td3qJ
    7LLeuU/WqYrlMdMP6FTGH4OVZq70H5LB7dVgvB9NE5McAux8Ckcey7uXlCyMji03HontWx
    bvnl6rosDyvusibg/yqcPZEJ/SWtxur9zNluoeYOHvUvmrvqkXvcZCpUCgb5Zz40mDv620
    FMcjFrQ3FTGRrfSYjKCC22/9GDLEl0wCuk7Pbd+uE+7bGgMXR87Xql2NSUm3HfxN9YKeuf
    xKbKb6wYsB23aHa69VfpD78yAOiBzi9yrAuiOYtFzOxcQ+QN3FI+yHWd4rL0QMqGQTebqR
    fJhCDjAC+IpdLS9Ruq/TXMA4XFhcBX30OPM1Cu9ar2IybPCv/HJs0shx8p2vDemVPH8Yt7
    LWItNBA4HMAzL7WjeY9pp4eAEXKYvAkLWABIjsOPS9ZhabnC065VPmGuOgMqeKm5xVrzox
    mLPoX+hHcUCvJgzbswJRdluUmYFPK0DCX6hyoyQIRoGOzIFCfJnavsAKytFRw3JkZc/A8c
    9QbUmA1ByLxpJPStpGsfbBhkM8XCxToo//57QfJJqATsyJUhCJKpi/8Dlmw9joSlV2a0TM
    ASascxdeRrQUKQTjvRDRoSY7/tVXj3s5EHZyXxZ1616JLu0qUejjnIi33i5A
X-ME-Proxy: <xmx:_s3QaoqS9-192s7su5XbdM0G_cpxrBoPx6R9P1ixl40dJu2ZNRMiGw>
    <xmx:_s3QattbshFfCwII7RjmS07dSEZmCm06LhoHY8nsNNtwq88vxTQQxQ>
    <xmx:_s3Qajac6PJ3sehLaz_0ShC861gjyOGOUOS8fp3-pSTSZwlySCEucA>
    <xmx:_s3QasYkFLQu0mI6YlePkyKKKEVvl2Qgol3UBYUMFxupm6rAGhfQMw>
    <xmx:AM7Qau1frwIKgxeRxUbcFCkLslG2wGIejpZ4cZSr-Zg7bwvd0JY_Xtdk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 35F5F32A008E; Thu, 15 Oct 2026 08:58:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AyGqpIRIZCcw
Date: Thu, 15 Oct 2026 14:58:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Menachem Adin" <menachem.adin@intel.com>,
 "Andrzej Kacprowski" <andrzej.kacprowski@linux.intel.com>,
 "Karol Wachowski" <karol.wachowski@linux.intel.com>,
 "Reuven Abliyev" <reuvenab@gmail.com>
Message-Id: <d753e1fa-29c1-4692-b2b3-d592475ae77f@app.fastmail.com>
In-Reply-To: 
 <PH3PPFE241D7F14C878F571D90A5918000EED9C2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
 <20261015-issei_pm_and_itf-v1-4-8212238a57a4@intel.com>
 <4253b355-9505-4854-8ee0-3c1db765d3d2@app.fastmail.com>
 <PH3PPFE241D7F14C878F571D90A5918000EED9C2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
Subject: Re: [PATCH char-misc-next 4/4] issei: add driver to driver interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2026, at 14:47, Usyskin, Alexander wrote:
>> Subject: Re: [PATCH char-misc-next 4/4] issei: add driver to driver interface
>> 
>> On Thu, Oct 15, 2026, at 07:28, Alexander Usyskin wrote:
>> 
>> > +	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
>> > +		wait_event_interruptible_timeout(idev->wait_rst_state,
>> > +						 idev->rst_state ==
>> ISSEI_RST_STATE_DONE,
>> > +
>> msecs_to_jiffies(ISSEI_DEVICE_CONNECT_TO_MS));
>> > +		if (idev->rst_state != ISSEI_RST_STATE_DONE) {
>> > +			dev_dbg(&idev->dev, "Device is in transition\n");
>> > +			return -ENODEV;
>> > +		}
>> 
>> 
>> The wait logic is inconsistent here, the first one ignores the timeout
>> and pending signal, the second one flips -ERESTARTSYS to -EINTR and
>> everything else to -ERESTARTSYS, which is also questionable.
>> 
>
> First wait ignores timeout as it only interesting in ISSEI_RST_STATE_DONE.
> If after timeout the state is ISSEI_RST_STATE_DONE - we can continue in flow.

But if it times out, it won't be in that state unless you hit
a tiny race, for consistency I would always check the return
code, not check the condition again.

>> > +#if IS_ENABLED(CONFIG_INTEL_SSEI)
>> > +
>> > +void *issei_device_open(int (*match)(struct device *, const void *),
>> > const void *data);
>> > +void issei_device_release(void *ctx);
>> ...
>> > +#else
>> > +
>> > +void *issei_device_open(int (*match)(struct device *, const void *),
>> > const void *data)
>> > +{
>> > +	return ERR_PTR(-EOPNOTSUPP);
>> > +}
>> 
>> What is the intended use case for !CONFIG_INTEL_SSEI in the caller,
>> and what do you expect to happen when CONFIG_INTEL_SSEI=m but the
>> caller is configured as built-in?
>> 
>
> For CONFIG_INTEL_SSEI=m #if IS_ENABLED(CONFIG_INTEL_SSEI) will be true, I hope.

Yes

> Caller anyway should wait for device with issei_device_register_interface() and
> it will receive devices as soon as module will be loaded.

If that configuration is allowed, then calling any of the exported
functions causes a link error. Your only options really are:

a) prevent the broken config using Kconfig
   'depends on INTEL_SSEI || !INTEL_SSEI' for every caller to force
   the caller to e a module instead of built-in driver.

b) remove the stub helpers and use a simpler 'depends on INTEL_SSEI'

       Arnd
