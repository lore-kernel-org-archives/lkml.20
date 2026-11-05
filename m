Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886054;
	b=A3ik829mBp/nAceC3HAT7IAdTWVEkVa8aXk/zoPxRrBSdtyfPgBLAHHJURlDdxmVy0BD
	 Qt/3Zg4Ml40SyBMcvOqdonk/r3sRMEDW4g4Eb96UIX28YKpnwk2a3ea4/uFNcVRBpVFDs
	 dZDZt595iu3HYESq7+ZhEYi1EqcB2XK+IhLJyUrLyI0Cq7OBBIFf6b89OOd+ItYoI0TKB
	 RSDQHZJE8jF54SZ2A84NaGOREr/RkNWQorHoD7mHU8kabxT2xj16zAvRHQIS1uol6421G
	 oh/G5rPI6mk7qMjvg8p2q3eQIAFk4/tckH7LiU55qRMsUCsooc0oOrNsK89/6Umi4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886054;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=S7t2RkNoj7H3PpYwhESf4GQH9llhdmMhHU9eX02nxmI=;
	b=X8DZgW1Do6jC6VPyDB8pGL/DWkfeCeUYslF/oPg4eEjNABwjcqqkTaCE3d8tsQKyt3GU
	 a13KU0MM9Vc1M5/82t3lRAo5L5ER8xxRDy9UQULDLfJ7x7RKDx/0tL6go+MDmZg0Ak926
	 QfsmETYq0ZUW81ePBVhGIylIh92NFNT2PguE9/wfM22bict1MthbH9WU4yBd36M34K86C
	 ZhTskva4ykkjIxPeJQqWCWArcQ2NvfgCh8v0jIeWdlgMp0jWiJk9MhEI3CsSOE1BxVMCC
	 0IcDtYJ8YOFpIeHWsaXQfT9OIsCdtCa+8Lbltd1GNzano2qBA9Kc5hZMdbr9sEBCs9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MN8w7hZ+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MN8w7hZ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793886052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7t2RkNoj7H3PpYwhESf4GQH9llhdmMhHU9eX02nxmI=;
	b=MN8w7hZ+HbyXAJ7FrUjd/K7XZLEynBMFRLUZ2WtYoJyz4jvfKHRkX3eExt+UFQqMqwCkcK
	4h3VR4s03w4lQ8U9oeFnrG2XjvGHv1BmuCxdugkIT/apsCSE6jEtytiwwU9x1t+W8f3Ni0
	cW2L7BIw7N/hpaPqIxqSz1vvCdsI73s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-2Xd5LgjsNWyMIKH7S99oNg-1; Thu,
 05 Nov 2026 08:40:47 -0500
X-MC-Unique: 2Xd5LgjsNWyMIKH7S99oNg-1
X-Mimecast-MFC-AGG-ID: 2Xd5LgjsNWyMIKH7S99oNg_1793886045
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15F401801326;
	Thu,  5 Nov 2026 13:40:45 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8AC251800347;
	Thu,  5 Nov 2026 13:40:38 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>,
	linux-kernel@vger.kernel.org,
	syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Ahmed Abdelraoof <araoof@amazon.de>,
	Seiji Nishikawa <snishika@redhat.com>
Subject: Re: [PATCH RESEND] sched/core: Do not touch SMT siblings that have not joined the core yet
Date: Thu,  5 Nov 2026 22:40:35 +0900
Message-ID: <20261105134035.170438-1-snishika@redhat.com>
In-Reply-To: <20261105101018.GM1813469@noisy.programming.kicks-ass.net>
References: <20261105101018.GM1813469@noisy.programming.kicks-ass.net>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Nov 05, 2026 at 11:10:18AM +0100, Peter Zijlstra wrote:
> Of the two, I like your better for being more consistent -- but you're
> doing the same thing 4 times, which does beg the question if we cannot
> wrap that nicer.
>
> How about so then?

Thanks, this looks nicer.

I tested it on v7.4-rc1 with the syzbot C reproducer. The warning did
not trigger in about 1250 seconds (about 6100 offline/online cycles of
CPU 1).

Should I send a v2 with this change, or will you apply it yourself?

Thanks,
Seiji

