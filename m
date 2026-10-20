Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482161;
	b=a7fbox8cp8J1ZoSdqvtUh+/JCHikj0p8ad5BJXsBtS09XPgXahatXXmpDXAzhbxoVuce
	 3Fwf6NxFG4jntCWMUF10MliU8X3ChxRyf+BOQRdHeINDg4o7TSx8BwpyDI/BcJBsWja9f
	 SEB5XBfWnFK1b+E34OSNkr62ZaLUwOnASNA3GrkV055xDW4ZtPAVUw1te1ynLg8IngI9X
	 SvR8qx1+Z8kAOyMGNz2ctrcoEkVfDoW6U2tr39pfW4vNHYRemKRS0yoolufZUoj9JAZjJ
	 7XWN4IfsTcYoePB75Iy5ROuxnKXb7ryEZRxrPOGNO/BTyhEpG9Ws+JDW5ez8zQ0hwEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482161;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Scanned-By;
	bh=6Clz3D4Wf01VZMPl8ROzHV0lszXJavJDkKiRC97TBCw=;
	b=xlsim6I9JrkF/l23+CEonQOc5T8LJH256NoDgkK7+E/kfE5T89sXf/R2LmMh8bdelICV
	 SA4o5U8OKj3LymjQnEF2tkmLbIcGd7HmCSNDsfHdZX0WchPC1X4EUttY5sA1UwHAn9Au2
	 Bj3bYWSYzOEh9mimlxqNFuHzQ2enJwmX1w4m+RM8uZZEF10xxKdYk5y7F2UYwuBfSrEbF
	 OiRR0/RC859F7dD6F5utpFAksGPAWONWUUp2tPD1xaIXLPxOxge2fsfCVUxg0HcW33FQZ
	 sMSVFzzkEH8FtIgqz6fgCHISe4PvBlhe98H6kwDeRPbqWLh6iecGUH9FtFmcInpL5vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Apr18TO/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD16606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD16606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Apr18TO/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792482159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Clz3D4Wf01VZMPl8ROzHV0lszXJavJDkKiRC97TBCw=;
	b=Apr18TO/3vCi33K0EGbN/1wRNrjBNPwXya6N3DabC4eLYyL/L3VzO3iQkAAv0qGxkGCjTc
	/uHMSsW+X7ei/vXd0VFdjwdtG+eYm5jgEhRUTqSKfzwjQlENxUgASes6yvo7rQsizGcaXy
	OEZEw7zxY6STsOkF3c46em40oEXOnZ4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-dB3IkWoeNQKDLIC4XWl2Tw-1; Tue,
 20 Oct 2026 07:42:30 +0000
X-MC-Unique: dB3IkWoeNQKDLIC4XWl2Tw-1
X-Mimecast-MFC-AGG-ID: dB3IkWoeNQKDLIC4XWl2Tw_1792482149
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C3361955D7D;
	Tue, 20 Oct 2026 07:42:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BC3F51956088;
	Tue, 20 Oct 2026 07:42:26 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 20 Oct 2026 09:42:28 +0200 (CEST)
Date: Tue, 20 Oct 2026 09:42:25 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: shaos <shawnq1@163.com>, Jiri Olsa <jolsa@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: mhiramat@kernel.org, Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uprobes/x86: uprobe syscall accepts forged trampoline
 frames
Message-ID: <atcbYbiI9Ez5yHhK@redhat.com>
References: <20261020003704.1012276-1-shawnq1@163.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020003704.1012276-1-shawnq1@163.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

(resend with more CC's)

On 10/20, shaos wrote:
>
> The x86 uprobe syscall checks only that regs->ip lies somewhere in the caller's
> executable [uprobes-trampoline] VMA, then trusts ax, r11, cx and retaddr copied
> from the user stack.  A process can jump into that VMA with a fabricated frame
> and make an enabled uprobe report a hit at a site it never executed, with
> caller-chosen register values.

Yes sure. Userspace can easily fool the sanity checks in in_uprobe_trampoline().
This is a known issue. I think we don't care, and in fact IMO in_uprobe_trampoline()
can die.

At worst this can trigger a wrong a trace event, right? Nothing to fix, I think.

Oleg.

> 
> HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
> git tree:       upstream Linux checkout, local branch master
> source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
> compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)
> 
> console output:
> https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/9eb4cfbf7c87bf4b06cd6138775a13814ded54c6/console-output.txt
> kernel config:
> https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/b1d9a09b984075b425aab4875117a6766a795110/kernel-config.txt
> reproducer:
> https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/b7e400345a004b4a4c340eccad862ac1f569aaee/poc.c
> 
> Build the PoC and run it in a disposable VM with tracefs mounted.  First print the file offsets for site1 and site2, then register and enable a uprobe event at each offset.  The forge mode executes site1 once to map the trampoline, then makes the forged syscall from a uid 65534 child:
> 
>     cc -static -no-pie -O1 -fno-ipa-icf -fno-stack-protector -o forge poc.c
>     mount -t tracefs tracefs /sys/kernel/tracing
>     cp forge /forge
>     /forge offsets
>     echo "p:uprobes/site1 /forge:OFFSET1" > /sys/kernel/tracing/uprobe_events
>     echo "p:uprobes/site2 /forge:OFFSET2" >> /sys/kernel/tracing/uprobe_events
>     echo 1 > /sys/kernel/tracing/events/uprobes/site1/enable
>     echo 1 > /sys/kernel/tracing/events/uprobes/site2/enable
>     echo > /sys/kernel/tracing/trace
>     /forge forge
>     cat /sys/kernel/tracing/trace
> 
> Replace OFFSET1 and OFFSET2 with the file_off1 and file_off2 values printed by /forge offsets.  Run as root for tracefs setup; the PoC drops its forged child to uid 65534.  
> 
> Two fresh boots emitted a trace event for registered site2, which was never executed, and reported attacker-chosen ax/r11/cx values.  Legitimate execution produced only site1; an unregistered offset produced no site2 event; calling uprobe without the trampoline returned EPROTO.
> 
> Impact and prerequisites:
> This falsifies tracing and profiling data for an enabled uprobe in the caller’s address space.  The evidence demonstrates event and register-value forgery, not kernel memory corruption, cross-process data disclosure, or privilege escalation.
> 
> A fix needs to authenticate the probe context before dispatching consumers.  Checking only the trampoline address is insufficient because that mapping is user-executable.
> 
> Validation: Two independent boots emitted a trace event for registered site2, which was never executed, with attacker-chosen register values.  Legitimate site1 execution, an unregistered offset, and a direct syscall without a mapped trampoline served as controls.
> 
> Thanks,
> 
> shaos
.> 

