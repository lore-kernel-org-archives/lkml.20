Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C800F4756D8;
	Sat, 26 Sep 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437339; cv=none; b=Kxryp0uwxdWd0kY+/V8D+dLqniwjMs8nyi4P2+emaEIexorSiB5OgYZYKjRzT766N1vWkcteCKygSIbVRXYrgAePkwaRlI7XaeivbWRLYKTz8bqvLBSx5NvIxKH8qyvqy59QedVZcCwl7bYfop6Mfm1GqIEQND36gQqsUfK1eLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437339; c=relaxed/simple;
	bh=gQw2ZgSd3ergVvgpI0q2l4stJ46XiR9tnq1hzrIb4rU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HIbr4jIX+vVIBFol8hm8teNd8jibH9Kbpd6AwTtuqsw2t0U1QcSKUMyUvqMtp6HvfXq14xANFTwD1JBa+apPixiSsfE4QhqTQYorFv8IzdmVh+aH9laU9NxbwNVUwAfb4n2NOuLMR9rnuALIaQXVPeWGjh1I68eXHAmHM5BTs3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bTyB3RfR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bTyB3RfR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E7EBE415B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437337; bh=QdrO1+K6lbULchid8gHwSvq89eotortgz7vBoB5rT90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bTyB3RfRdPpLfHkXgrP6pyDoYOYpdqfGqegEL/Z/iEuUjlVzM/D4e2CyX35upetDM
	 zB15em514n5SYp/11AnjdM9Lel+AKpXBJnLlZgaien9OVbWOZjLN8zl4JN+CObTuuG
	 Xgz5+A19alzFlRj5t1/uFr7NWNvtSVAw2wtmWnwKHmsxCwIKw+xkzSFcHVywdmTEk4
	 7BvgP9iHWP++4JVw1NN4pqiMg5hZBC4LhzPvDxBunGHQTJlVrarCc7B8i3G1ll0qER
	 xY5ojRIQ2feqNZie90PO+OlX6vxVoJ5N3jzHezR4GmHZqrZ8XsTsFFrvekUDDepgPc
	 VLSxINX0jFr9w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E7EBE415B2;
	Sat, 26 Sep 2026 15:42:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Appana Durga Kedareswara rao
 <appana.durga.kedareswara.rao@amd.com>, Michal Simek
 <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: TMR manager: use literal blocks for console I/O
In-Reply-To: <20260921044912.97843-1-rdunlap@infradead.org>
References: <20260921044912.97843-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:42:16 -0600
Message-ID: <87y0co2f53.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Use literal blocks so that the console commands and their output
> are not joined together on one line.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager |   14 +++++-----
>  1 file changed, 8 insertions(+), 6 deletions(-)

Applied, thanks.

jon
