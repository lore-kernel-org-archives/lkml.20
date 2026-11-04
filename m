Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793767810;
	b=WXnBa7TTwcVAE7Dwtn8ZYmxhYW/IokSLO9b17kKUOuBTeDm3Fl0+pHoRxbv+Co/ZXTHj
	 ZK68QtrR8DSPFQapLyOYJaWg2rz3ZMWgcMlcsBxSFftKWQoK7OeSoFSuWfmNIrz0BfqkL
	 FcFp8in4IjsWVdJigSV2xYwdpBxRBi51IpTxuJISbQmFBA4wvIPeFAed/ZcwQJq83oGRe
	 mQlDHnAHKiNtHVTnkVlKpANNf1YkPJw/o21tzJWPyCsm8XCYb0aSk9XSiasS+Fk/+Rp5i
	 ZBhC+y3y4dWj1PKi+ErxANTQ1yMX0Gg4n7lMcTX6qmLSdZk1DWKqWSIJzb/AQXXR2LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793767810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=t+rSW6HJ9q+pXSgw1qr0mGB8H451TKRrA94PrP5HOW8=;
	b=HqIL+R1tzBzko1RCxE3JnZKxld3iwZjml3+wPqtEYeVZRuSeS8pU16KJ20ZN/AJxoDZM
	 //eOawQ2XU5z40YrJl7oEzyrqtXi/oBeCBdhHrnyhKA+yfQCxoCLKYCEXx5Yn5GF2yUl2
	 NGMgcw5lIdfIIBYOrNfDs4gZPtMRD87A9dOtYjn91Fpc2yQuzYE0xJOcvGvSic+zM4xM2
	 81vVfIq5s/RbmxzehPGfEjZuxBmHKGSxWPY0cWrnL/FWDuCKI4XUgezpnqo4/zfvKRGyq
	 uMqJMCXjNl1cS5Z5qIa5fBP4PhmuAyT93TdjSJHrC9TA5wjyvLJq1GihqvX7M1yK0Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w52YuNVL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D15606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D15606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w52YuNVL
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab01c46697so2787561fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793767808; cv=none;
        d=google.com; s=arc-20260327;
        b=VHhdaPJT6XCQdHQ1D5Nu1/zfbrVvNMRhZ+/2MQf08Dj3lpp8xBQnBpvYZ/SGrbOdOb
         rsFdGQOr8SUhTY3YYSa5yWlxVs+tDKTrtQdbECN7bjdZ58qRS7Sgv2sUJdhIT9Mz1GfI
         wu8jtOPqrkkwnns/tF2XPF7/s/bBscvaVd6nDKen9T8GzhAj+RzCt4XAG825EiQpTodo
         rZpxtnvE20xwAYgBi/xCbMSE+61j5qmCOqmNOgTA+5SBpw9T9qBoTivuOD7AulSwuhp2
         529799iIGnra+jtBAwWOtlOb6XYGMEwQJqyvCn44Uxu4Z1/lU81lvmcb9929O8ISbBVP
         s4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=t+rSW6HJ9q+pXSgw1qr0mGB8H451TKRrA94PrP5HOW8=;
        fh=bxO2FKGPKqGxB3PB4lO9hn9uFi64zvrDmMFE6O1Qb04=;
        b=UztA3y+XRQ9+omOjAMbuqfQ+FHjG7/czUEjikaYx6BMsCMV766KFFAINdNB+mX4OgU
         j+uvv45cEtXHKHDT0n1LnXVKVWKHoQtiJzeTH7uLcsWWSh//RhWeOy1zhOSZEhYRmBW1
         TMW3BLAOFvQd3KnY93Km7WjangpEMpSvuboZv1WrxwXKlPOG56DXv0qhBGo3qZVG3sJQ
         yeBn29v5kHyCBMlciBEMQCHaG3qLDZsjzWLSj3sj56tZ/66qf41hENlQsTKUscxcm1Zi
         H3zgdnUaRhYRebC3T1kSIAumDFdBA/1ajyy7uYvlkOv3hOiOg388h9bPRFv6pukgbA33
         BOiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793767808; x=1794372608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+rSW6HJ9q+pXSgw1qr0mGB8H451TKRrA94PrP5HOW8=;
        b=w52YuNVL2jvMKUGjZS3sGf0KGbW261let+XA94IV31tKr2pwEi6okdylD7eaLlcfw4
         tckuo30SmPC7v78dvCX5V8xw3KDi3dxu/lt/HWtBYk7Vv5SBatRHDGgtMySKDuPH34tu
         hTQ0KFgg+hqvDs4L7TRzlppaJCZRf09sIUo6a6VRHqJ/T1K+ZmG9ZFki0WMgmvUivEyu
         7RloMeWYpQy4lqnvHXGGBdr/iQfsWdt34brNFv1UV2T9RlJgMXS6y0bOYaJNtVaD6FAC
         eER7Wy86545ApxdUbQq0xwhe+Um45SK3EXuv23+lFhfKA/1xtU2LTy9vt3netFxEf6zO
         7HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793767808; x=1794372608;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t+rSW6HJ9q+pXSgw1qr0mGB8H451TKRrA94PrP5HOW8=;
        b=R2cFamxMkoRV/HeEdEMtKzGLJd5b7Ccv5duPmVRCxzlXS/2TXpD49ZTIpNgeyWa08q
         jf7IQoh9zVn3bhNggE9vla/rtI/QRMCWpsV5+41sbrsvo+18D6zr2PkludwrE9Fl6nqm
         PxsoqiTRyAdIwnjEUQZ6yGnuBtQyU2oDhENMrPynF41bDBMtTef+OvUgLNzcrBxfB4EJ
         OH6/dVmQOqMUmNJ9xPLM6pwyiYjr44uvJRnnekxZTNZwGiOg7yNQyRZQcKYcfVYp8tpB
         VKF+JnwFb8UdXaKl8iZy9XTcSLsMnIDWOAuTRF8Q7J2hQ/e+aOjn7w7PIFzxijFbmmmv
         plTg==
X-Gm-Message-State: APuU4Z+2zG/hhfaSNSM7hUiyqFEsYCgThjuRElZBZU6l4PD2aQFIMNr1
	9umxSXNFkp5Zo9LdCYlcXWHBDnVkoiz1As76IjxxR9bgrb3YmkWuF8tKuQW66bW+m/EQO2jQpTv
	LismZPJGXYh47v6m78I+5wAkq6Dz22w8=
X-Gm-Gg: AYBFou3oeDWWripF6FT0/bYaCOKNWtiI/D8Tmha70vbx+A8FqiCaXcYq8RxDupO6Ps6
	DGrsqCD8W1VypncqeKri+4V7u09OG+kzTvP2CXLOyeKKywCYUBndGQ+gjX0fMvoIMSSfeAYgDf9
	DXrv+tYJdd5A5FgH0ilyBneiU396wTWQcbFN7uGPhmO8ZDUJqN33E5hykSJndKNCgYbJw2jR5bo
	flhoLtU2H44cGBvrjX1wr483Oj6WRL4oXu1c4sKCNwXDi1mTGric2Ap7DhjVS0YV7EXEmkX076Q
	0mhzKRqdcV00dqP+0bN5Q39KRZPbUdwIBNzRr0EEuNca9bzSsiFV5PbyfA8ecjPLBD/Srt1SKB9
	g6OKtAiP1q+H7gw6R3tTlLQBg+cddeBfUDmZwY6eRTvqm4bWnDcFWzkgKB6am6vttj7v7Yg==
X-Received: by 2002:a2e:b896:0:b0:3ab:f43:a3ca with SMTP id
 38308e7fff4ca-3acb7a80dcbmr34745271fa.16.1793767807500; Tue, 03 Nov 2026
 20:50:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: zhang san <shunsheng1218@gmail.com>
Date: Wed, 4 Nov 2026 12:49:55 +0800
X-Gm-Features: AclHuK-4GanAOxDZDPNj_ou3kO8QgJ1T1RH9scm_pUJ4N1uJVY85qjW93EWGZTY
Message-ID: <CAGTEBTZhCw68mzkXSQShW2pGspb8eJE+Hr+en9zKnBkszUom_w@mail.gmail.com>
Subject: [BUG/RFC] extcon: potential lifetime race between provider unregister
 and active consumers
To: cw00.choi@samsung.com, myungjoo.ham@samsung.com
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

We would appreciate your review of a possible lifetime gap in the
extcon core (drivers/extcon/extcon.c).

extcon_get_extcon_dev() returns a struct extcon_dev pointer after
releasing extcon_dev_list_lock, without taking a reference for the
consumer. Meanwhile, extcon_dev_unregister() removes the provider from
the list and releases its internal resources. A consumer continuing to
use the saved pointer may then access resources whose lifetime has
ended.

On Linux v7.4-rc1 (6628e7d4c6b2), our KASAN tests with self-registered
provider and consumer devices exercising public extcon APIs produced
use-after-free reports in three scenarios:

1. extcon_get_state() after provider unregister;
2. extcon_unregister_notifier() after the notifier storage was freed;
3. concurrent consumer and provider unbind.

Controls without provider unbind produced no reports. These are
synthetic provider/consumer setups, not a reproduction on production
hardware, and we have not established whether actual consumers must
guarantee that the provider remains bound through device links or
other ordering rules.

Could you clarify the intended lifetime and ownership contract for the
pointer returned by extcon_get_extcon_dev()? In particular, is use
after provider unbind expressly forbidden by the API contract, or
should the core provide a reference or other synchronization?
Depending on the intended contract, would you favor explicit
refcounting, documented consumer-side lifetime constraints, or another
approach?

We have not proposed a patch because the right solution may require
API-level design decisions. We can privately provide the reproducer,
KASAN allocation/free/access stacks, and kernel configuration on
request.

If a fix is proposed, please CC me on the patch. I would be happy to
rerun the KASAN reproducer against the exact revision and provide a
Tested-by tag if it passes. If this report leads to a confirmed bug
fix, it can also serve as the reference for an appropriate Reported-by
credit.

This issue was found during an AI-assisted source audit and reviewed
through source inspection and KASAN experiments.

Best regards
Yaohan Li
