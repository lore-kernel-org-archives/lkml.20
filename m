Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123046;
	b=1/ekN3UrFzB5s3k+vbQ7KUS6AddrUX3FgRYbUXLatZSTLblp/TP1XZIdwW2SOo4uupj9
	 mFUPij6f/D5bbTXMTzeFSOs8HgYGNOJdiCwlRfpJjN4HfFhXV2EeOQw/H1NT131PdSbLh
	 j01c0T5p8ZfVEM1J5bN+kAMPQwPnD3doRRsOK0Emf+WpVAWYdOp/ZmFoO24JIhaMrC1qI
	 HbCDt4TAHEFOikZ4GgsfmqIu2pBGY8QybVJoBL5vW8MS5vrPHKEYX+mYa+7uEjjKmKmto
	 eq4oF4V58lTlC9BccOYbcRDefd3/UdSUVFvkpXh1oq8NCgvGnuB1QUeWHIYCmF4kUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123046;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=H3ftQVE2wpbEBVJ+VF6gtFWZg3t1dZyf8PCd3991cFQ=;
	b=JYcxeGPwx3hMlOyDslhvr8+PELAzh3Ni0lIc9syXhMEc2S66tw5tb43YoS6/rWjQpdAk
	 lbJUyQQrCdFeJ0aj2/IUM3DepAt3ixUwf41rdlAit2kWHXPWEFvuEjVXt9dbamUgUAZjG
	 oNYJwfcjlxe6Vw0TP9Bzz5QKnBXgC6poEtCqb64tS9I2VfGkqZCfOeFVb1RL9rZ3BA9TO
	 yeS6V9X46D640s/GEck1qlLglx9ubKliqHf9OCqEff/pHkrSTMil+PBvOR3AIQgcwjhgf
	 HlU8pXqOYemQrWRsRLVAGR4+XqnuTaRpplpMvLiINAVGCjnTpI6uSvnPV6vN9rCw/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="WTisWFK/";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E526D606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E526D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=WTisWFK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H3ftQVE2wpbEBVJ+VF6gtFWZg3t1dZyf8PCd3991cFQ=; b=WTisWFK/3oAI1YP0Kukj3qvckU
	X8myHQGiZo+Icm2ALRrAH9WKVI4kSc1rZJQiGRVyBCnVgF4xZwbu8ppfhXIoj49Nj929q9J2uwUu8
	4ghdyX2lXwZ1I+UBOWoJgJ9PuDGQmh0IfqrI7mU+KaUnSggXY5AKA3sTtmZy4D79QT4qdrBhIoZqm
	rGaeRnzmJYUx1miPVFhGNJb+4hufekcLRyWbhhQaTL1qsfvGUOYGR2RNPbpryMEf/vxny3uPVw5P5
	hfvhmZYN+TGOQt2aiz6WPZDLGnOpK/6VYN2kLahwh1i32ZhtiCWLTr8L3lDqbq3w4LjBs+BaL+DBK
	mh8g8XWg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLlDK-001d8b-1f;
	Tue, 27 Oct 2026 17:43:58 +0000
Date: Tue, 27 Oct 2026 10:43:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auDibpMWv7mkdRTW@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <ats4n8snmReT7Nc9@pathway.suse.cz>
 <auDM_p2_nwVkw_0n@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auDM_p2_nwVkw_0n@gmail.com>
X-Debian-User: leitao

On Tue, Oct 27, 2026 at 09:12:09AM -0700, Breno Leitao wrote:
> So netconsole, or any CON_NBCON_ATOMIC_UNSAFE console, prints nothing
> on kdump hosts.

For flushing unsafe on nbcon on hosts with kdump environment, this seems
to do the work, but, maybe this is too unsafe !?

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf8990b..9f1a89e301ff01 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,6 +140,8 @@ void __noclone __crash_kexec(struct pt_regs *regs)

                        crash_setup_regs(&fixed_regs, regs);
                        crash_save_vmcoreinfo();
+                       /* Flush consoles with an unsafe write_atomic(), e.g. netconsole. */
+                       nbcon_atomic_flush_unsafe();
                        machine_crash_shutdown(&fixed_regs);
                        crash_cma_clear_pending_dma();
                        machine_kexec(kexec_crash_image);

