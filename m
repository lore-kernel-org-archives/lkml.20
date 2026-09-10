Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E547F76A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048825; cv=none; b=JLu/BBwCeXOH6oloG87MR8lE5NfrbfspmggptWEihg6LixmgXDrGZnrrQzsXkdOWf3YdKL9zsZEm9vvCZ5IBbr9BJ3sgasawt7/o//dwhT8vBmASYH1ekjcf14nyn277VsNsmplQMXwPsvMoW3k4GhtAMcT5IB8SWfJ0PCS9BkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048825; c=relaxed/simple;
	bh=DaqRFjYMe+LimizGYFsacU8uOpiJ2uZf20JDlKZGw1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP2zR9SPaFyOdN/keLYoQo72QDvEbWqsvxrjID2xte7lqrJ/x1jDYXjtFM7sAq20/CbZUtS1+IBI0NMe1GZ4tOMn8XcMukUpa+Y2vRKEtRcZPRJdgttf1Em4RjnxQPfVr9jR7p2R8sTlIqIQce2ObOEA05r+rnsajXlV596APR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJSOoUl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJSOoUl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6F11F00893;
	Thu, 10 Sep 2026 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048823;
	bh=y+N60RzQwl2+K4VNcKIRYQBOF7KFmFiZvKL8+ofN33w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJSOoUl5KJxAMXG4bkSJamrTKHqvFNgE/IxK816wr3+biXGdDtCEb6fcwCVYLqjGT
	 5xRglAlmWmVpQYq6hevp/JBn7km2jrqYvqZLI95Rrs/5hptyZZ3cCghg4HZRMKZK8g
	 evgmXGrXmUmaSh0acNs1WQA+OJneehwSGMC9RiFyx51PSPxTaBNSfv7hFitxS9IDrm
	 MzJRJ5O/5noVwgKfJB6l+ikAPu2E+HR3bE9DPScJvSiD0u41D+16oWnfZ9LRt1ddNH
	 xUChHQeMgIxXAdDCqK2SYbD4lyCGeR5dviSTyKLIajQ+BENeIXqTHx1CZSDilEAweX
	 vB+fsHknPEgHg==
Date: Thu, 10 Sep 2026 16:00:21 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [patch V2 5/8] posix-cpu-timers: Move inlines out of public
 header
Message-ID: <aqK39aib6ke-V938@localhost.localdomain>
References: <20260905181551.738186850@kernel.org>
 <20260905185839.868259402@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905185839.868259402@kernel.org>

Le Sat, Sep 05, 2026 at 08:59:19PM +0200, Thomas Gleixner a écrit :
> They are only used in the POSIX CPU timer code. No point in exposing them
> globally and parsing them for nothing.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
