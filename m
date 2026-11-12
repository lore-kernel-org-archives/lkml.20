Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495596;
	b=DgwvsRiYMDDj+Wzcy+S3l5cCRXHAX47EgyC2B0jIKGH0mMRhGhe4y+Xlmpw5B/h5Cm7I
	 PliExxi6vAC88oWjwZRH9ImA/NnxnErc9KMD4Gbw6GW1e4AQXKHRQPe4x0xWoaIap6Z60
	 tiTdKT5qhvwtCvVPPk7cEKiDpL5unJFYIMSuOXstNRUPbZvwqFX0T+R40rf75Tije19U9
	 JWhOk9XJBwW/c/sU/vrcMY/p+7VkhmUgD8u/QbSpXrwIFRv5n+e4eKWi86ZcKxu6EPA2Q
	 8+Dfw3kKjDVvpLAQRDmiArewPI3hacQwADfC0U159B0X1FO4Czl8cQnKYclY3p8xujg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495596;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=46aJ+NZelMiSr8EhCGm9t3xZEQJS5co1bb36uQP2WSw=;
	b=38qhJMHz68nwFY+ksXxp97J0umHPtB4ezZVKQxDHclU4fkjWUKWgJKCvx4XCAPBkydhV
	 Jd7JjWow7PLVyLQbk7CQMbef01BKIhHMsat1MXwipmxew+CjKX645x9a0sZqKNMw6+ENv
	 SA+fEeErvK8N/VOYPPsLAOevgpL/gKdSIJOZXtCZPVXkltf/7A2xocxE01EVXwylBP94M
	 mbd9D3Zuazi94hjTj/ZbGynu3Izlg9Y5r1TkjBjbg15AdYKRTYHyJaCNlcDen4tEFQsAy
	 QLdhvftWloQcoMvGD0DrAORrOICkolakaG6gAgf3h+SdNVTgWViEIL6SJz6DvPmo9cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=NXiLHoKt;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84017606A31C;
	Thu, 12 Nov 2026 14:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84017606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=NXiLHoKt
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 11E5B41099
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794495594; bh=46aJ+NZelMiSr8EhCGm9t3xZEQJS5co1bb36uQP2WSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NXiLHoKtFO2RgHx7eYlhrXUtXMV5x5VNuCRyC6gAdstMKcNRxFsLQQn19fUFgroDk
	 QmkyyQnlu6xdG1SudH0IHLgz9yHS4NfRTRGPcd3gMN9o3GS8t7du3Ds4dhNlJEuTic
	 SZNZzeU7Qtgr3L+ngVufeLJjterSxycCFcEDM8J4xVjct4qu8NpBjKK6o/GuSqSgy9
	 NA42OWDMxNYmD/d3vbTXAC6ccmySFCXuhZg0kcDvgtxl3rZGTr2W5MKR85iMrcLr8U
	 QP6sZgXUYEDrMccS4M1wB2rxEDah4ibJCdIunLXCJPsy82kTXwwjWs7R6RLzYqY340
	 VRCUuXHjk23HQ==
Received: from localhost (unknown [151.38.237.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 11E5B41099;
	Thu, 12 Nov 2026 14:59:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Docs: mmap_prepare: don't italicize structs
In-Reply-To: <20261102175619.2274135-1-rdunlap@infradead.org>
References: <20261102175619.2274135-1-rdunlap@infradead.org>
Date: Thu, 12 Nov 2026 07:59:50 -0700
Message-ID: <87zeve5c49.fsf@trenco.lwn.net>
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

Randy Dunlap <rdunlap@infradead.org> writes:

> Using a single quote mark `struct xyz` causes the html output to be
> produced as italic. Omit the quote marks so that kernel-doc's automarkup
> can make the "struct xyz" bold monospace ("code" style") in the
> generated html.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
> v2: fix one more instance of unneeded single quotes
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-doc@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
>
>  Documentation/filesystems/mmap_prepare.rst |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
