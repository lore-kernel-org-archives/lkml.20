Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646140;
	b=Em8UjOhgNrFeO7kp3HQhb9HowqL34j2G+Qu1/EnksmTpU8ey3nerPfEwyqrawDGw0B7B
	 DBNa/kkqqodiJgc24H1YpSz3+IEBmE/x9BzKkTg7333NaeV4yAvU1qvt3m+8uyi7ohxe5
	 a8CNNAsmnKry2gjIV5KwzQcs4kLan3BW1SouVKM3KVTFgQJ5DcnUVTdZPfzW7Dea5Pzw2
	 2fPNo+coV3061lhNnJXcsQOpzK/oMGaYXDc6uje1qfZmdC/idsSAaSa3ZzrcRG2ay+Tyj
	 OnEr+Bu2es0SeiL6EaxlE6gLAejzzYeBn1JgZY3H51I9aViYuNM/OduYkFDqqEDghmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V8g75MWbh7z8sctPaA+NOR0Avf+Tzht44DgHGPXPEfM=;
	b=spbWUu0SixV37DW3imAuu3/LdTZOC5TinBSm+NC1iTOC/9TgSV5j1/uY6YvH/SnMBD24
	 bwSOLB7HCYBb+2dPL0CyWQkGP0MG3O9zc8ZtaIu+4RJveJsD4nZecVgbwRslSCjWPnVuI
	 A4SHNG173F0AtRrXFcJtXGBEfYizYPehUM3ZJ1v5a03uGeB281rLZo0GwseebCM2D9p11
	 fLZt5BxWb1Z/A26v5XQ5a2jqLGh6WQVVVhHQ20ad5hA3M0a60JB6Q/jnIzOWbmuPvxroe
	 dqi2siMqCgMNbglg80YhV7USmmSQy5S4poOt/gV1AV+JQr+6i2307TsH2Rt33GSbsug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ICcww73X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E79606A324;
	Mon,  2 Nov 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ICcww73X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03341F00A16;
	Mon,  2 Nov 2026 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793646140;
	bh=V8g75MWbh7z8sctPaA+NOR0Avf+Tzht44DgHGPXPEfM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ICcww73Xn7bPX2SX94nh0bR01jvEMIXxEKPQxMiiAlNfmJxZC/8y7y4rE0d3P7hEU
	 zdBhPpNvTB2zVozNFFvMg+1M07Kt/st3bMcsWY9UsuBDZTPjEaJH5fwgdP3x9sNVmd
	 kgbfI1P01sc/bDvME4N4aDw2ZfjxMoxwlNudRdbU=
Date: Mon, 2 Nov 2026 11:02:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, LiuJunyuan <2058432396@qq.com>, Mike Rapoport
 <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the staging.current tree with the
 mm-fixes tree
Message-Id: <20261102110214.26627fcf298c77b8ceee12b8@linux-foundation.org>
In-Reply-To: <auib_crbWYfKZw9V@sirena.org.uk>
References: <auib_crbWYfKZw9V@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 14:19:41 +0000 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the staging.current tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   88c41b4cb3432 ("MAINTAINERS: sort component entries alphabetically")
> 
> from the mm-fixes tree and commit:
> 
>   24934cb6b8cd9 ("staging: vme_user: delete driver")
> 
> from the staging.current tree, the rare delete/delete conflict.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined MAINTAINERS

OK, thanks, that's nuts.  I'll make those two patches go away for now. 
It's not exactly important stuff - think about it later.

