Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A21D2D0C94;
	Mon,  5 Oct 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188575; cv=none; b=n6bLfYw140XeX0ZeusLkns/AWQSNe5V15vP1LQ/9J1coh3gm3fQsrVN1BUv01uOtP+cWr4jYK1wiFpWi0GOLm9fN4cP9UNmLFzchB8G9prULJzqNzUoAPuZheIV20XjCawz9MjZQwW0tOJATaPnIyQ4bHlOW5NDIrQGp1zuiojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188575; c=relaxed/simple;
	bh=iSWMLmzis+gg7eW6GwI6QsXay/sibkn0TNurfJ8ZHnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQV/pyzAWB7hHbKGksSIKN+U0WcPUUlVmG7A/D1QxpniVWd98m1sSrpcBqSTzKkuqJV5hhx4ueNIEw9FJJh5fY6iPJsAmDBKv4PV5G2+tF62GmQwD0UD2qd6mxEyHRtoXzqLq5Biew3h26UbRIH+1jj87MqTDKOdW+n28yzl/ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mipkfKK3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mipkfKK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8F21F000FF;
	Mon,  5 Oct 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188574;
	bh=varnBVf4YSFlcyO76Nh9Qb9fXNtTiLJu+7g5rVS2sL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mipkfKK3hPLMq5xB0NKE8DSLIHMb8OZohLo0fcjepQ/IAFkbkj4VwVaG4H19MNfLu
	 /jxFkY7w4UH5rG/36GWGU2rpTDmn0sYv+9C3po1r5pQ01KMzRKuKuVz+MksXvTMTeF
	 dsDZ3A1xfYgqVKn93wfxt8i9oS1p8ldhpjSIjjsf6N9PoUqoBz9BCgevCMzlNqS6nS
	 Rso1fTx3RYHKikK8y4zg+VjIU3Gw69kCdEB4y7eA5oCxwULsrGKU62wQur/YSXzFa+
	 /nPcOVbcU2aTIJx8Tdq8rrv1PnLoLIm+qJW68vwcY/zL9tB6MryUNL8U/ZMOwn9L+4
	 70UqjNsXwjKAg==
Received: from johan by theta with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xDdy6-000000000oc-1ygf;
	Mon, 05 Oct 2026 10:22:42 +0200
Date: Mon, 5 Oct 2026 10:22:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: fix null pointer dereference
 in get_firmware
Message-ID: <asNeUn4qLLLMrjYX@hovoldconsulting.com>
References: <20261005063454.95647-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005063454.95647-1-marinela.selseth@firmwaredesign.org>

On Mon, Oct 05, 2026 at 01:34:54AM -0500, Marinela Tatiana Selseth wrote:
> Automated static analysis via Coccinelle uncovered a potential null
> pointer dereference and uninitialized stack pointer vulnerability
> inside gb_bootrom_get_firmware().

Please check the archives to see why coccinelle is wrong.

> The routine evaluates whether a firmware transmission sequence is
> complete at its trailing 'queue_work:' label by checking if the
> transfer bounds match 'fw->size'.
> When this label is reached the 'fw' can be uninitialized or NULL.
> Both scenarios expose the kernel to critical memory faults or null
> pointer panics.
> 
> Fix these dual vulnerability paths by initializing the 'fw' pointer
> to NULL at its top-level definition block and introducing an
> explicit short-circuit guard condition to safely gate the
> trailing size evaluation.
> 
> Assisted-by: Gemini

Also, LLM assisted patches are rejected for staging (again, see the
archives).

> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>

Johan
