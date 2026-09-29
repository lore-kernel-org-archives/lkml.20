Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DBE474266
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672121; cv=none; b=MvLIS/Ehyh4fS7EyUNRJluNpPe32KFwS8qFn4LL69odK0n6rJYEGSe7FCRV0HGKNmwlNZW4ldqW6uMfutWC4CKo104MlBYARYwMdGm3GsWSGWR1vUzX4qEtdAIkFiFAwdKnlIDhMpSCBAy3FYwfZ+PGJf87CbJouhLgh+TqZoRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672121; c=relaxed/simple;
	bh=ROg1K4HEHDan2fbidhqTqZl35UHfqwRXw0QB8KUKqaY=;
	h=Message-ID:Date:From:To:Cc:Subject; b=qYVsx9juTJqUByUzNUu3Ta0j/WxD2KxuYW6kKTSbrvpcorRqTdSPTKpx6ytXM9VeTCJW0HGGZTscIqPYEN4/7XMJdTDAJP0392/Kw3W9o63N3KLYew/ueLkp1dgJ04SBNh8NzvViGyguNq0cR/CyLL2lnP90sZLvH+naxpn8L0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bi+A4zrJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bi+A4zrJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nI9q1nOkZ4APv6CRnxX4cWrNpCHLzSFv7X/PQwTxmYg=; b=Bi+A4zrJFmxz1W38JmPUzqD7pj
	Yq2yXWmdiDzPramAvU4TP8sI+daZp1UIwJV4sXXyoAB5w6cGWUKDisb78jwVnOGLAZaMjc27qj9Aw
	DaE0Fn1smL4uXm6ps+e1w1i11QXL2ag59iVDaF5bQUNBr8xxyh4aK+tG963u2VlEVOfcwzYOAwNk7
	XrylUdSn3FyLvKNbugdrcJVHcBLrhLWcLoRBFBt3CL73c9jm73/B3XO3DOwwvAfZEAlY+USiE9Vy2
	shjTlzzMQAeKP4ZD+J5H1a4vTV4LMfIQiL2lV+hp39JFF9bhbAumisLvlrpBwQOtGoM/YTuWF1Ez0
	V2Wj+yLw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcF-0000000BsLU-3C7Z;
	Tue, 29 Sep 2026 08:55:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id A4524300446; Tue, 29 Sep 2026 10:55:10 +0200 (CEST)
Message-ID: <20260929084923.092062266@infradead.org>
User-Agent: quilt/0.68
Date: Tue, 29 Sep 2026 10:49:23 +0200
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
Subject: [PATCH v2 0/4] sched/fair: Rework task_h_load()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Rework of task_h_load(), which isn't all that sound atm.

Also in git here:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/task_h_load

Changes since v1:

 - Fixed FAIR_GROUP_SCHED=n build fail
 - Fixed FAIR_GROUP_SCHED runtime fail (Vincent)
 - Rebased on current tree


v1: https://patch.msgid.link/20260828074059.232353141%40infradead.org


