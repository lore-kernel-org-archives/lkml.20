Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494055;
	b=2LQ2XkiZVTS+KHTLLMPoUXpNL0fqNbf2cNYfLrE7oUstsSnyqPwMdwXo2GCWsJKM5DTT
	 dJx8JLQAS3adp9CehgXYZyh+a2W3YvA7eJ2DKANkn+GtwxP+Nwu5GIeUFafn5OqxsmHPA
	 noa9WVZvNyeU6qrLXFrvi5s/nrMZGzI8DSj3hm/ofDuPx1mFEuNEfZKwExJzdMg2KmDjk
	 C7qx02nZcWkm4dWHDVhX23X++L0QszkHRrmq+Nz+Sgdw9lpXmvrO6VG3R7o54ayPOwPsu
	 ykonSrY62itca1eMs2v7T1HdbhSYyk+o04gAu3eLiizfZCT0b6XU78zQaDYq/tlKMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494055;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=fEJo6vbvhz1XZl5tpxWvOSvlbS9UMk64Ct6jD/81+qc=;
	b=wmPfWxpunDhtAMLEmXaIRYufimMhC+Rk2uuA/za1z0BycBwKLuf1PMNtMHotQLQipyff
	 UnMl7iocRc0SYVBjkpmruNm7JL/MxlBXXlsHYYPY7HusEoyz2Sw/agExXkE+MC2JocObj
	 I13oj4T2uLJa6rkrVi/u+slIs7sV303uVJxfudWT43/84wjag/3i9gdBnwzzRURVyZMyF
	 EcEqRpaxsNwsvjJOP3CNJWsyRWBacCXnR6ah/+THJ3FWbX/7TznsXZIiN4JSMJKG3L1ty
	 6PVh+gYmEuzT+gjk8uc9CTpHTHShSG9ccKrXVzAQDCin8inBbKQRZrP2uS7ChFOnLNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OnZtIQnz;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BCE606A327;
	Thu, 12 Nov 2026 14:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BCE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OnZtIQnz
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 83C8640B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794494054; bh=fEJo6vbvhz1XZl5tpxWvOSvlbS9UMk64Ct6jD/81+qc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OnZtIQnzzvr3Vo3hkdjhwAOPrLXCHAQDGrZT808UW1TvvrmopmjW0Mkp8d8z60+gD
	 4N2bfmbpZqyjVhvkJPNRcV0aB1ZLNHwzlwC1hc8sKFCFSvsL1I5ONbu2YIluLemRKH
	 JTwgoYN8QmbtN7L2aD32F0lnA+pWHbIr68q8cOF3uKpoXqD8fgxhpKysVADuVKm5B4
	 jjVYHhG1M16t+L4mml6gAQodqzHjmRvJMJLZldy7H/+AMSk/qlKMNWMGd+gzbXqj1+
	 c5+I1nlcLmuUU0WCqDemelgGp0aon169CO+rkXgjUCLakWGu9RDup9HO27MQHksLtv
	 GXXFC3nZUzFDw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 83C8640B2D;
	Thu, 12 Nov 2026 14:34:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Add category of subsystem-apis
In-Reply-To: <20261105181542.3071-2-manuelebnerli@mailbox.org>
References: <20261105181542.3071-2-manuelebnerli@mailbox.org>
Date: Thu, 12 Nov 2026 07:34:10 -0700
Message-ID: <87ld6y6rvh.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add Bus and Communication category to reduce number of items in
> 'Other subsystems'.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/subsystem-apis.rst | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Applied, thanks.

jon
