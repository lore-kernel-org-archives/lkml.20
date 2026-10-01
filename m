Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25BA4A0F10;
	Thu,  1 Oct 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883018; cv=none; b=YXU6cUSSkO3/yD1m7HGbJHstQN+GBNFDdpqIMpG3qseRaFIXVVmcXa/X9wimnqUTRPE0G5GYbtWb1uzWdgNsSf5FhvsRoCAyuWm3v1BmySTaDofmlUoIt/Dvxi6q+pSeE1c0U7BIDsOcJ9FDQZ3sruGhHnZNYLk4qmHBmoAIKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883018; c=relaxed/simple;
	bh=LojnI9U3LVbmOWCs1RX/+AMx2dAc6oFQDg5806p8OC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juMcatE4I7CL1g0r5ny8rGoQ0lxA62i7rm1SIs/bmqq8MnH/HQEAxKfEvTtz/zkq96g8cAJl/9bLr9jY8ER8NeU1ofaWAh1QooVOYgTn753g3wPEM14tQ+JYmUFqBVMYKB+AkIk/8HRyEQS2iXK2T3THVR0DfcWLZJrGyQVNOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDV7nb+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDV7nb+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9231F000FF;
	Thu,  1 Oct 2026 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883016;
	bh=4/2Wx4CfhUAprfyBEjIHOTc5lLBpb1YzaqfM8uby9Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MDV7nb+0hzSO5uOvlOPM44vkg/iaXuaF/e+U1nVezaZ+4L/TT9hRxM4mcvpo8p4FN
	 Gnaz+BH2umkHqCTxTTgncSV0BaGmeTFY85ooFdYlsXdCPGje5Uip4q1A6iJ0Skg28e
	 STXEdMfHvINzAfyNv9tA8HYfsCuyXWmk6zTRDtz5NYZTQzT2dBQ6LNPgKxT30T21QJ
	 kDYCTZr3DWk3XapSkZvDajLqWqZ9zRizilhI36bfnAlNLbP0yF5uVdPN3a89qzAYe+
	 8Ht8J8Gb2By6I90De0t2+Y9mm0fycS3hMLtkcxE1zLcv8d1Y0Qj+79Trff1aeYBYe0
	 CBvWrT2a498QQ==
Date: Thu, 1 Oct 2026 21:30:13 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <20261001193013.GA713848@ax162>
References: <ar5-8C-j_JT5OYQm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5-8C-j_JT5OYQm@sirena.org.uk>

On Thu, Oct 01, 2026 at 04:40:32PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the random tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> In file included from /tmp/next/build/include/linux/list.h:11,
>                  from /tmp/next/build/include/linux/resource_ext.h:9,
>                  from /tmp/next/build/include/linux/acpi.h:14,
>                  from /tmp/next/build/include/acpi/apei.h:9,
>                  from /tmp/next/build/include/acpi/ghes.h:5,
>                  from /tmp/next/build/include/linux/arm_sdei.h:8,
>                  from /tmp/next/build/arch/arm64/kernel/asm-offsets.c:11:
> /tmp/next/build/include/linux/objpool.h: In function
> '__objpool_try_get_slot': /tmp/next/build/include/linux/objpool.h:130:42:
> warning: taking address of packed member of 'struct objpool_slot' may
> result in an unaligned pointer value [-Waddress-of-packed-member]
>   130 |         uint32_t head = smp_load_acquire(&slot->head);
...
> and x86_64 allmodconfig had a similarly bad time with -Werror turned on.
> 
> Caused by commit
> 
>    56ff95ee85715 (random: vDSO: avoid call to memset() when zeroing reserved parameter)
> 
> (which is the only new commit in the random tree.)  I have used the
> version from next-20260930 instead.

Just to close the loop for others, I think this is a result of a
problematic resolution between the random and Kbuild trees, not a
problem with that change in and of itself.

  https://lore.kernel.org/20261001192731.GA713751@ax162/

-- 
Cheers,
Nathan
