Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BCC23ABBE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681681; cv=none; b=d/Ft39ry/WQf9IGYKFHVnLb+Dvkd8KgCbW3llI/U7GpTuudaWPOwZIwcNXydafXUzOU6wQFa26afFYUxP8YkraNDdtdu+2uVqnT8krauxD7RgFZkMXblMDPqjyVV+4EECkHB3ushcma7GoPf8B8dt/HrG6U+7ra4Tw6RjO46t3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681681; c=relaxed/simple;
	bh=Piyf5SAQ0e6S2WiTKuzG0JgQ6TL7yHLOoW4GrVsBwXo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afbLTZ9Avld5Hwnq5HYCwTkE9FR6GOx64L35i1SHi2e6h1r+u/7qccorcfsyle+p4+HKB8lQHdB9tIinSj9spyu24uG4uZIVZc3Y6OUhvpaX4NsYUa3dqtoY3/CAupqfF7HN5tmT2bmZF0Kedxk2Lea+B2s4370/BM7nnWPfOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=MXb3+eIl; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="MXb3+eIl"
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 6E790A077C;
	Sun, 11 Oct 2026 01:21:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id B0A2F2002B;
	Sun, 11 Oct 2026 01:21:10 +0000 (UTC)
Date: Sat, 10 Oct 2026 21:21:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Willy Tarreau <w@1wt.eu>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org, users@kernel.org
Subject: Re: [workflows]Re: [PATCH] get_maintainer: only use THE REST as a
 fallback
Message-ID: <20261010212109.202fd50d@226.227.38.69.naturalwireless.com>
In-Reply-To: <ask0dkduRV5pxeLZ@1wt.eu>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
	<8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
	<ask0dkduRV5pxeLZ@1wt.eu>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B0A2F2002B
X-Stat-Signature: totufpgytx6zxj7a7ihotncj8xs8nfsa
X-Rspamd-Server: rspamout01
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+/AwhMC7uOrIRZUPtILhv8uDA+HfT60wQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=o0gn6Y3011ryQRfAOsfDRwPbbG+G8bDgEJzE1JMyS8U=; b=MXb3+eIl6bJtVj/zSCbdENkhBZnaX3U56XtuhYttUS2T680UsiaB4PkfqK/XPljrbT9w1n3FiCXR7mic0qQV8Cw/ahPy3HsIIgu3Eg0wE2AXdslP8oGd86cToXzkWH7+RUKBoXSzB0IBFv9d+Pz9kNJP0lm0p4R2cWUFy5gTqQY=
X-HE-Tag: 1791681670-84616
X-HE-Meta: U2FsdGVkX18kGjKmvqbaMUGnyLqWtEYE7fJ3YZQ70Dw1MOSjFNnE30BK85jm+YuwTCbOA8xHWcmGPvkO1i9APSzD4kqST40Rk3Hw/5trz4oNJIRml8m8jVCLasYj3BbV9loXbQ9vkNMo25i+QMpjNrfLBUuF1zd1t6YBsHscoha6bfwTfs53n5Pr+hXnULgHmPLSkBMXzPmKQTVdnJ0t33rM1MlCrsqpjUecTrXTFbA5BAaLugJIVfRG9p8pffZEodpLmht6OnuqtPNBpTCxYL8dnXqNWyYDiLONB9E97ygNjS/V/8hRpyDynGABfNtfVmSAi14zH29k0lIsx8gE6B2pGps57YaSi/TeDmBngEWhQcebh41P/ohPAjKXqKIc

On Fri, 9 Oct 2026 20:37:42 +0200
Willy Tarreau <w@1wt.eu> wrote:

> I went into the same situation ~20 years ago, with filters sending LKML
> traffic into a dedicated folder, to then realize that I was no longer
> reading them because it requires to actively think about it and make an
> effort. So I turned this back to my normal folder and I can have a glance
> at them as messages arrive (like I'm seeing this one BTW).
> 
> I understand the problem of volume on LKML that's not really compatible with
> 2k emails a day (nor with many people's expectations), but at the same time
> I think that a dedicated catch-all list with way less subscribers would be
> really nice for those who want to stay a bit informed of what's happening.

Agreed. I look at LKML every so often to see what's happening in the kernel.

If there is a catch all, could we make it only kernel patches. Tooling
patches (like my own trace-cmd patches) should not go to the kernel list.

I could then unsubscribe from LKML and subscribe to that instead.

-- Steve
