Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF9524AFE;
	Mon,  7 Sep 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799293; cv=none; b=nvC+AwzLKIgDEKB1OK8ki+ZEhiqN2ScE+Bn559j/1HemtXMf086E7LSbRLxYCFRragsbPNpUTsFGEgFPTy0sYHLEbZVbu1YH8fET26LIPCQ1bhKEg+HaH+XdAcD1As4Kbd0/Z/dhWJiF67E+uZRkUQs4lQG/YB78cGt4o4B7Peo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799293; c=relaxed/simple;
	bh=m42hFV7sx9CzIFOPCUmmFIfZCRn9bsDzhfG/6n2dd8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kq6LsRA8rlg3yMH6HV11QSKGiSHYe9g9mmiivo1IidEOQglOOGPD5nWum9tO8WN7spZEdPBRF3WgVxO0Vv42pzXBuboRiI3PMU6Hlp5jNkP5uwdcWVRqj+JFmu2KsXipiOW8ijMoOethNSEYIDANhwOoU/JLvCoKdZKrt1RgopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hC8jyeuW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hC8jyeuW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C7CE6408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799291; bh=tjAtv+oonZYpkXkL6B/93fFHM1akJqs+rgkm0CYB2ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hC8jyeuWdtHVYNZrM3GYqMcY4NokShSE7rKz0rs/GnAf12GypcyXRLM0pLgOQFE3B
	 J//24led0GxIHP+kb8hAEtOIqfcqR8eD2oX40J7BmeYE8/zzSpojr4CviocYPY81Lw
	 7UP9cDfo5Wl8eU3Ov4FVEPD7JpSiujsGut9IO+AYjKa9pb41M+SWbQGIHHNabWYyXo
	 Zmn6mCVIdQQhQLxH81LScwtFgmj/H484IumEHj0oWX0uS61lmWRm7Wx5EDj6zd6c9R
	 9y4XDhiY6v6xW4Thi1aI/SnPPJS1QhA66uwe9CpoS6eXamcKaJY4Ol5EUa/vb772V8
	 36qXwk8DrI/oA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C7CE6408FF;
	Mon,  7 Sep 2026 16:41:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: admin-guide: Fix bracket
In-Reply-To: <20260903154924.732852-2-manuelebnerli@mailbox.org>
References: <20260903154924.732852-2-manuelebnerli@mailbox.org>
Date: Mon, 07 Sep 2026 10:41:30 -0600
Message-ID: <87ld9dovyd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add missing ')' and remove ';' to improve readability.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>
> [v2]
>  Remove ';' as Randy Suggested
> [v1]
>  https://lore.kernel.org/all/20260902152347.708070-2-manuelebnerli@mailbox.org/
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17a..5f4a056e4 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -438,7 +438,7 @@ zone[i]'s protection[j] is calculated by following expression::
>      = (total sums of managed_pages from zone[i+1] to zone[j] on the node)
>        / lowmem_reserve_ratio[i];
>    (i = j):
> -     (should not be protected. = 0;
> +     (should not be protected. = 0)
>    (i > j):
>       (not necessary, but looks 0)

Applied, thanks.

jon
