Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853279;
	b=iW2RikrKyBJXV5FPi5/44wSxyEXacuWdYRoH++c14ri+7i1X/bwioAHQbye7aIb3FR9C
	 BZUEEmP2ZTPec+kPQpMsd3PPnuf4GTJuM4jXSRG8kw9h0RZ8a3bymQ071mdodRhG35slw
	 e7TBPnMovCQyZSBoEYoRoV4GBnsR/jRySeJ0F2XvJJhcHcIYIpmEtAdTsfFm/cONCC5Bd
	 d7cdNj2KjR20nXD6IMaKlGolmGpl3ragvAQvpmmbjBok4VP5tzi9RrUk/S+oiYhOLJHVy
	 ZvIHy0N+nPnvkH8ppTYnJPt4K6riKRo+HE4OcUPk0K+ztsKmYxoQLSnJK9H5EgieX3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WLbvZZUrSw5V3WK97DepXaH190SbFLxLhAaVVJSONIc=;
	b=RyJxWtvswXonLDv8M1VrJneSWVcFILTQijwdc5TOJ2h5cen0/dSpj3rFk/NDY2XL/S1a
	 EXjSYdfzB4l8h25H3SeSrg93kkDerUJsTBNxiSDqKXEs+YlNciuLOhTb9dMdIfwH6XI7t
	 3eYpxRCoieNXQh7syKf3KpBn0lJapaTK0lxLOUqmuKdELSTmRKaodMuqjgGGUaPTC3fRE
	 bFnSkxR98xTuvxepDzo2Kidhf3T4iOVdcB78TWpNFOjIVvBgrcbgWXOXQJG2xK6FvDs/G
	 VBUfaeJAF6D1a12mEloZxE+9PXyAE7Hpf0SKTyl6KAJTlkEQLU1E73F6WwfQp0OVuZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cOyjGNXD;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75595606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75595606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cOyjGNXD
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1310655a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794853278; x=1795458078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLbvZZUrSw5V3WK97DepXaH190SbFLxLhAaVVJSONIc=;
        b=cOyjGNXDLvqhDwt91E88cBd0axkpasya+Ob+OHfe5h39cjLZJ4zGpsY7vx1ZUURo1r
         Ii4etqcM2pfsQzYCgWGhfa1BalVu2jk4Qy7XMre8BYtwhjIYPx7CpvfsLUgJTFJU4rgF
         7x7ROfBVWpaALa2PG31G3YKQohwmdZZFz+tWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853278; x=1795458078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLbvZZUrSw5V3WK97DepXaH190SbFLxLhAaVVJSONIc=;
        b=AWZgrG7Fw1FRnYmcEBJDuqGTZutXVmfHh9c2XakJVdtUCL9PD7QInMfRlc7p3yKPOJ
         gj9eUgpeKKfSCeZlQwmK7qz1wAaqSH2O8DpZdGKpQNoPQF6kgb5ogswQdCckzSySpUpg
         IGG1tqDcdIhP57Ld0TapyynN4gmTpDYimrDI/usMzdmoxY64aWmKoQ3hdUKtlN0fM1oU
         bYunb6Wcj3HsExHEbh+ugeuuMp7/u9LQy4C1cEPMQCsseWyQaXstPb5D4roUHfGwMILs
         helGbQ+RtqCiMtD6Bg/j1ouLVfBFH6awhVsfmzdDjYEFanJms0mJI2qwKAgOgaDo2CTU
         bFFA==
X-Forwarded-Encrypted: i=1; AL+hErESc+mX1jYL3u69DHfsJwXsNB5ONUwOV8Wvli8blFN/Tirm5QEhctHEMfFbuUPQCVHGyYHBc0O/NWmVark=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nod8gUgMJxd0LkKxwkCw3cCvm1Z0zGwNvJamVoEjG46ouZdu/
	V4LjkIhTafzJugwC86cIqzuKAD+/ekgd2CVPuJlQc551P/3S79y7DBG3Eg2CU7FhpyA=
X-Gm-Gg: AZFdTZcJV621/teINWdfSAJhbEYMBQSI/OMbv0J3A5o89s4EMZizN9BANX0DVz/G7BP
	gt9Fae1DgBj1kO051Nji40LMnMYqA4TAf1Fcs+eULQFVrauUyJYb9O6+k0Jju2caJ9Y9LANxj43
	FD+YNQRP7aC39JQJTnfhZHSAHQIa8d1jj1NisxalDJGQ327nVSDQI4iHTxmCe3ag7fYKESV3HXm
	0ytX9tqMLBQ4fRl421vIgQX0Ih7J24Ni5d4BlfIJGFtIZzObJpm9F8a3S7z1HI82nwzcAvETCMV
	fPLzo1rj5J1NSNO0sINDdJZG596FOza2CuaROHXbQGmyLQZMlSYiuzlDYNS6PyiRaxOzjxeLZdk
	ZE+c1LeFy95euYeGYVD/n8byWIXFHxujnKH4yMvTG4HH0JaKGD90kT8oEGbyyHlkbD0fJeBxkbV
	F2YXB7gWmcVWmM5rph+cvEezDEi7T40D9WEOJC0Yjk12Loi0XVzZ7DoAp3V0r5B2U6Ot65QMEMo
	7rFHgrOqVYDcjvWt+a7lelgSyTabud2TGyPol+zrMecNS4O7E9YdJwBLHzCeYEV+JVtuxsNJcBv
	9B7DXvREGmaFcklonuAKPsjeny+7TnTzQUo4wQgZbkhpWUh3sKDdZHPpjufkCPURo0mF111p4wc
	ND2xoDBUSTQ4+jxCaendx6pmcGkx+DSNFZbrZyZLNrqk72ww5nlXJjZYTAmzXlUUU
X-Received: by 2002:a17:90a:e710:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3b1b0a428b8mr9583988a91.27.1794853277539;
        Mon, 16 Nov 2026 10:21:17 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm312798a91.10.2026.11.16.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:21:15 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: Re: [PATCH net] net/sched: act_csum: bound the IPv6 jumbo payload length
Date: Mon, 16 Nov 2026 23:51:07 +0530
Message-Id: <20261116182108.2581258-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

> Could the changelog say that TCP and ICMP csum configurations (for
> example "action csum tcp") were also exposed to a bounded over-read? As
> written, it reads as if only TCA_CSUM_UPDATE_FLAG_UDPLITE setups were
> affected.

You are right.  v2 follows this mail with the changelog corrected.  v1
claimed those handlers were "protected by accident" because csum_partial()
takes an int; that is true only of the kernel it was tested on, and I
should have checked why.

The reason is worth putting in the changelog, because it is also why a
KASAN fuzzer cannot find those three paths.  On x86 there are two
implementations of csum_partial() and the configuration chooses between
them:

  arch/x86/Kconfig
	config GENERIC_CSUM
		bool
		default y if KMSAN || KASAN

  arch/x86/lib/Makefile
	ifneq ($(CONFIG_GENERIC_CSUM),y)
	        lib-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
	endif

  lib/Makefile
	obj-$(CONFIG_GENERIC_CSUM) += checksum.o

So a kernel with KASAN gets lib/checksum.c, whose do_csum() opens with

	if (len <= 0)
		goto out;

and a negative length reads nothing.  A kernel without KASAN - which is
to say a production kernel - gets arch/x86/lib/csum-partial_64.c, which
has no such test and dispatches like this:

	if (likely(len >= 80)) { ... }   /* signed, false when negative */
	if (len >= 40) { ... }           /* signed, false */
	if (len & 32) { ... }            /* bitwise, runs */
	if (len & 16) { ... }
	if (len & 8)  { ... }
	if (len & 7)  { ... }

The first two tests are signed comparisons and the last four are bitwise,
so a negative length reads whatever its low six bits say, up to
32+16+8+7 = 63 bytes.  Your example confirms it exactly: len = -70 is
0xFFFFFFBA, low byte 1011 1010, so the 32, 16, 8 and 2 blocks run and 58
bytes are summed from the transport header.

That is why the KASAN report in the changelog names lib/checksum.c:119
rather than the x86_64 file, and why only the UDP-Lite arm showed up: on
the kernel that found this, the other three paths genuinely did read
nothing, because enabling the sanitiser had replaced the implementation
that would have over-read.  The over-read on tcf_csum_ipv6_tcp(),
tcf_csum_ipv6_icmp() and the ul == 0 arm of tcf_csum_ipv6_udp() is real,
it is bounded at 63 bytes rather than 65535, and it is invisible to the
tool that would normally catch it.

This is a new posting rather than a reply in the old thread, so here is
the context.  v1 and the review being answered:

  https://lore.kernel.org/r/20261112075445.3555341-1-piyus@iiitd.ac.in

and the [BUG] report, with the original KASAN trace and the reproduction
conditions, which went out as its own thread - not threaded with v1, which
is my fault:

  https://lore.kernel.org/r/20261112075159.3552470-1-piyus@iiitd.ac.in

I checked your arithmetic and the three call sites before writing this,
on net-next: act_csum.c:245, :196 and :343 respectively, each reached
with the negative value behind only the wrapping pskb_may_pull() in
tcf_csum_skb_nextlayer().

The code change is unchanged in v2 - as you say, bounding *pl in
tcf_csum_ipv6_hopopts() closes all four paths, so the diff is byte-for-byte
the same.  Only the changelog grows: it now says that TCP, ICMP and the
ul == 0 UDP-Lite arm were exposed to a bounded over-read of up to 63 bytes
on kernels without KASAN, and that the 65535-byte read is the UDP-Lite case
specifically.

Thank you for the review - the KASAN-swaps-the-implementation part is
something I would not have gone looking for.
