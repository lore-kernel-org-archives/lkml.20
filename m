Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3879A493D27
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048245; cv=none; b=n9/NoMNLnw52wayyhqnxLsXcr4H/6ciWxKMqEpjdohWg0uYMly0/uFZbLRQZmyLTpjiYv8TiYyhIc5DAAykFHDDoaa8bRftj41xaWYnKQzYLKiJ6ii16pZoG63Lh3Krs6X4iBiWAlv60ez5+EJrmZPlTF6vj+KdMHYVMMsJn4Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048245; c=relaxed/simple;
	bh=t64WgemJ44sLiP42cUWBevOHDYrLMFtLW3hIQBonjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTFMxeIcw1Tbo0V4EGa0Cq5PBVj3qIEwGoOwQ1LKdWUSxYggpMlWUooZhld55EJWb7+ApkGZzBFVd0lmw+9/ag1+e1ifuWtZNWIi8N2TjX9bkL27d7MQSI6ChrgNRKvl3dR+VuiEfSRyNGB/AAks5s9jWfAK4R/wucZh3pdifPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJJJxeFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJJJxeFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1D51F000FF;
	Thu, 10 Sep 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048240;
	bh=sCsCu0DXeIpMUGAfeYYubm590doGIBG1rUdP5Tb3sU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJJJxeFfHIzzDE149CO+r7c2akZPDJ9Eiv3V7xYS1q8ghzojwCyJqog1YGuvWAHkh
	 3QRSWdy2RSyr7Cx/z8r0gzshI0kxjpheV3atO1cpjixkJAxoArtjh9uqeva/jhddua
	 G4UmfBjkQOus2QXbA2QKj65LW1e4Nf0v6rMwIWha3aX3ws0LLT6DhshKt5n+bc5gfS
	 is2hOLCZR5BjSa/k6hPije57iqSDrzq79UDtgXCwTsxGm4EO+8h2FuUexxRX1+WyTV
	 Nrw9K+yyhITfOGCRxIqgZnRmaNjqPkCNfcAQxclweYcVp5t4jMIp5LPhGcRLpruWgo
	 TD/O577nljX6w==
Date: Thu, 10 Sep 2026 15:50:38 +0200
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
Subject: Re: [patch V2 3/8] posix-timers: Move posixtimer_exec_cleanup() out
 of exec.c
Message-ID: <aqK1rp5Q2kcqHQf-@localhost.localdomain>
References: <20260905181551.738186850@kernel.org>
 <20260905185839.768037117@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905185839.768037117@kernel.org>

Le Sat, Sep 05, 2026 at 08:59:10PM +0200, Thomas Gleixner a écrit :
> Move it to the POSIX timer code and provide a proper stub when POSIX timers
> are disabled in Kconfig.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
