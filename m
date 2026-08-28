Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387AB3CD8CC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903810; cv=none; b=Y1wH+2vCwMUczCeh2m7IKySksO8IRiEreCLSwUUmQJzNOvKPWe2a+9QPQ6ghCUu7eYEMEon36B+DDKfrKB2wJLU47PF8ox6TgXrmTyn+EHzOyT78hJctl61efgiQl3mgNU8jXHJyvNkZMecKBHaaCkNCpX0GwTaanEgkPdlGZo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903810; c=relaxed/simple;
	bh=QTE+weV8FORXmDjutHJpj9ddtjc1IswlBjhdVmtH9fo=;
	h=Message-ID:Date:From:To:Cc:Subject; b=S7s3dCeHlbMMPAQkA466RGSo4a1+290la3A+58cKys0tQXPx9uUDK7KEGKcbHbqVqla5HeNSW8tgKwN9++b/8Cu8afP9qECSskuaR1AnOHZ8tICjyneVwZ3qGZBRVD9aHfEmZTQVlqytzq6Qy0Bgi1dWfZw6j8iXrLhTvrlRZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jWrmYqXb; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jWrmYqXb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QTE+weV8FORXmDjutHJpj9ddtjc1IswlBjhdVmtH9fo=; b=jWrmYqXbyBYXMuywaA9r4Nq6ma
	LdOFdRbzHyCbb0h84IQwf3uN2p4gfbivnQzMmesfv5RSihNSgVp6PATxrpi7om9Jps2Rls8Ft5i7z
	C5dF0VzeX0O+L7/7ARW7L0+U7hYIJ8eiJ4UGagqrDzB5uv/4gfUtgAZUaKM4iyLoR3KJ1Hb8+C3lN
	oapIcDDcMCPlU+DbMS3sSidAsn67gm9k3OrmEtg/sB1TOxBP8V2WLuJ5UA4fNu8K7UI7uOjDCH8YJ
	9hSZHYn/JF7FidQBysgDM/TVtjNqe7znZ65vN6dlOFYQXVBxLfltMxqPmiAFvnuwuDZJOFoC5LY4z
	gXB5TNDA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzrS1-0000000EGKJ-0tDO;
	Fri, 28 Aug 2026 07:56:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 38A823006DD; Fri, 28 Aug 2026 09:56:36 +0200 (CEST)
Message-ID: <20260828074059.232353141@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 09:40:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 tj@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] sched/fair: Rework tash_h_load()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi!

So task_h_load() has been known buggered for a while [1], and while looking at
[2] I ran into it again.

These few patches rework the thing and should hopefully result in less broken
behaviour.

Lightly tested...


[1] email that unfortunately ended up private with Vincent
[2] https://lore.kernel.org/all/aoxah90s0bQ4tcUW@three-body/

