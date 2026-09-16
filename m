Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512AC43CE71
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544022; cv=none; b=Dr37ktE3uYmojZ7wQjrumG9EjL/OXi05yXYWgXIIi9zuNJHnta+cKZ4E/sJl5lAKEYyzb86VF7nZ98vaE/DuOGrTazGah9ym109AgmHPDkClJ4Otglgr4QuoqmhbnjkSJmbDXwCEzblhhomKhWPC09kLJD1EsKjQqIhtQENxtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544022; c=relaxed/simple;
	bh=/+CHFvxaZXBEDsaaK3F3gevt+zVsEDflv0XeEM83ZB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0Zb7pvRyPr7SzadB8jHR17JwhtVXnSsBYqQpvY/MPHpMeZFr/y+dJy8zosuNrUZrIV0IdwWK56j061aFENOgIg/VMH1DZkphISHYexHmqIjnEKsv+ZYJRk7uV9bYDo1P7Z83KNvRt7xrNZBb7oSb94Cs17baG9QSmGgmSbAyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OnOXX945; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OnOXX945"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/+CHFvxaZXBEDsaaK3F3gevt+zVsEDflv0XeEM83ZB0=; b=OnOXX945bC2LjGbz+EOiwpqcHq
	crFbhDl9vjS30xuWw/+XuXl1OVMSi1qcKlkPmuD6Hc1+KicoeJ1qBCQE5JstCol1yRsaCTCILLfPa
	bIMTA/bbJtDHyzIjVY/mUR49+X/v1WB3+ed0k+5pEh+5ZAGF6LGPWrKJNqu/XRFZvVaucpKpePfju
	8BpV1CrpKY1eUK13BcF8bJ1PXef0smngZMymHiBuRed2hWSY5nt5jjcjR2NncnfpAVw/rwPo14qL6
	Nqxp7iHlJOePIGE81sDLw1IY+kr9QnrWGL7YuFgrzw4FoZoUyqTiWbE/7Z6m7H3EXfBwi6Z344GSj
	B2HYR24A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6k8j-00000007aPX-413x;
	Wed, 16 Sep 2026 07:33:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3C08F3012C6; Wed, 16 Sep 2026 09:33:08 +0200 (CEST)
Date: Wed, 16 Sep 2026 09:33:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Haakon Bugge <haakon.bugge@oracle.com>,
	David Laight <david.laight.linux@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260916073308.GK4120091@noisy.programming.kicks-ass.net>
References: <20260914202102.551333-1-longman@redhat.com>
 <20260915082655.GX4121339@noisy.programming.kicks-ass.net>
 <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>

On Tue, Sep 15, 2026 at 01:53:05PM -0400, Waiman Long wrote:
> The main reason for this patch is for addressing the locking test failure
> reported by Håkon due to missing barrier.

What crackpot test is that? osq isn't meant to be used as a stand alone
lock.
