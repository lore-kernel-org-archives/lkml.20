Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864558;
	b=0dBsT1/7womJL7XG+hGmHyQY5XqcJ6GRV7c4T2++F+/l2OY4cgYXfSKrtVGjC7/BipIk
	 JYUWTVZXD8PYmxToAugQ/hxDYO1jKjiIeb5LORUmFiCdV6ZmfDqkUdUS1pFT7meQQC00f
	 ZPJ4uL1riVdTbl0TsQGAZeu3T23Gjr+jLoIlhAAIEVvnLhid6Rs7m6g+/nVEIFRfazyqd
	 ikX9dFp5QpNt6tIaf+ulrnep/Khv+aC+5fB09S7TRJysDsfpdzJ6diOJ4LRRcTjyZWAL9
	 E5wOKsDvWrv692wzCDkT7Qm0baGKEE8awXNGPPbyZdNrnEN0g/pg0wcZ/ZrYO5hLWVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864558;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aeMQ9G5oxDgPk5vp9wUs0hOLhFUC9UYe8Oo9bxMPCYM=;
	b=UCEQIUDdZL3q16KmKJy1NUIG7ipomhdCzYTkXCFu1jPxrurHrakIqxvnVRf0kXOFEQI+
	 90MnoTEOAcDDJQe7nS73lNs4MLTRXEEHtPwagJJv6KpNmhMLoo9lgFSVHY6cc0qvBI3rm
	 /TfHhbP5tjOpxYfG2xYpUWFZWmIBt833CH89heJzADf13d66tLxpyFIFKk0KjqG+qsdIy
	 8crxkR3h3EEbWwqSOJYKTlTi3PfAzdxiNQaI770BQPIJ0S3lSYPSgJUsQt5rxFswoE8/F
	 /TWJXLe9uPDrfK8xaXUVWjC+1ghu4eggrzktUmXGvTQ1kWgHXDWWxVv2v6UrqO1pI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/9GUESR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2083606A31B;
	Thu,  5 Nov 2026 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/9GUESR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713861F000C1;
	Thu,  5 Nov 2026 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864557;
	bh=aeMQ9G5oxDgPk5vp9wUs0hOLhFUC9UYe8Oo9bxMPCYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H/9GUESRHHlmEz8DjJwxolnaoMQcRUwyfEWSWNOJU/jd26x8Bqb7rxXltDTXYNPt7
	 Ph9o4pzfKCXLsI0ZfmMnMp1g2FHrhPiPvdUt/1uCvPKiC943mgiIN2QOkAZ34ySsEz
	 4jjibzmx4s9BAwPZGXC3upkgGCy7RPtd+uJI5D6PpmfTsXR9F+kqMOVFe02HqBH3tx
	 4ykBbujTFRo8dMgxsFSNXKH8g4/fuKS2+isStvb/RNwkbrTfNhkWXRcZ7377QaRc2D
	 zY9nzhxvd3qJD2ahhB/lkD3nI377yIcstkA97xeRJ3wb3rwF40NntKE3CYuQy6TpJ8
	 0Hj+NUdvFNUGQ==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xOs7H-00000007PIP-0HVw;
	Thu, 05 Nov 2026 08:42:35 +0100
Date: Thu, 5 Nov 2026 08:42:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Adam Simonelli <adamsimonelli@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: visor add vendor/device IDs for PalmSource devices
 from the PalmUSBD.inf file in Palm Desktop 6.2
Message-ID: <auwza-4fcBq_lgpM@hovoldconsulting.com>
References: <ciHDthUGQaulSODjTZQ9wg@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ciHDthUGQaulSODjTZQ9wg@gmail.com>

On Wed, Nov 04, 2026 at 05:58:24PM -0500, Adam Simonelli wrote:
> From fed0bc0868dd1e0dfe98ec84fcd7c1208cb076c3 Mon Sep 17 00:00:00 2001 
> From: Adam Simonelli <adamsimonelli@gmail.com> 
> Date: Wed, 4 Nov 2026 16:56:50 -0500 
> Subject: [PATCH] USB: visor add vendor/device IDs for PalmSource devices from 
> the PalmUSBD.inf file in Palm Desktop 6.2 
> --- 

This patch is still corrupted and cannot be applied. You are also
missing a commit message and a Signed-off by tag.

Try sending the patch to yourself first and run checkpatch on it and try
to apply it with git am after you receive it to make sure your setup
works before posting another version to the list.

git-format-patch and git-send-email are useful tools for sending
patches.

See

	Documentation/process/submitting-patches.rst

and perhaps also

	Documentation/process/email-clients.rst 

Johan
