Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86B4CC292;
	Tue, 15 Sep 2026 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498602; cv=none; b=LloNnKY9A0yDreY1m0jnEXrOr818QKdLAX0sHebC9V+g3O/EWzHyeAJslkWWAeU7iPOSTrxRSXc9VrujHct2EXrO5LzXYKRIsJAU74xFeO7GPclqM6qr3xFzc/DLC6FzvuI9Zh3MWI7bdxbomHcVKzgCqN+u9ViRR6jiapug5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498602; c=relaxed/simple;
	bh=EDn0+1E7Yshbd0kRZWyFRJ9+bGgFoE73iFEDBFw05Yk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cxpmtE1raTFEwShhGm067mx+jRNYdq3MfruqKYTQBLF0N+VTPiCBT245i44hIDiF1kuXimU+bAPBIbprhvnddsxwp4lB9Zyf3aq8hEqV69SHPnPg0liskoI9yRYrDYq53B7xpMSoReK24yhnxIA6Ps7pg6xqJTfk/hPA84gaGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UzRWKz/g; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UzRWKz/g"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BADDF4090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789498600; bh=Rsepp53wmdFvcjhxH+SZlO9xP8vtYlvbJCuU3Gb4BxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UzRWKz/gL76bsYRzmkkw/cMgDVoueXkuRGyY22r868vyVRyL4uuDAFl/JkG7Ug52l
	 99PnMEG5jFR5yrrXVGSCn1cHcIkuGShrvhhpDXGpeMJZ949ZjXtqGzC5k0rI6JCcat
	 f45CC2dmBV6xGKorRvqwj9liU09AT6gO1D2xu3I2jRHpJ+jbVXXfDVsXOmVVfrkgfA
	 q1cLQJbqzUYUdbez6d8MUZUOACBWXYWGWVF2SZcZDmxsLbetTtHqXSFJ5LTN3q/VP1
	 CBLKOYDgX9X5GaQd/CsL9n1gKOv4hdaNC5DPUPaLw1TJEEl5wzgPbbDNw02q5PTy6X
	 A3KZZAVwdKAcg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BADDF4090B;
	Tue, 15 Sep 2026 18:56:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Michal Simek
 <michal.simek@amd.com>, Ronak Jain <ronak.jain@amd.com>,
 linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] firmware: zynqmp: use literal blocks for commands
In-Reply-To: <20260914060615.1398531-1-rdunlap@infradead.org>
References: <20260914060615.1398531-1-rdunlap@infradead.org>
Date: Tue, 15 Sep 2026 12:56:39 -0600
Message-ID: <87ik469wd4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Use literal blocks for 'cat' and 'echo' commands to separate them from
> the surrounding text. Otherwise the lines run together, without any
> clear break before or after the commands.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Ronak Jain <ronak.jain@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
>  1 file changed, 50 insertions(+), 20 deletions(-)
>
> --- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> +++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> @@ -141,32 +141,44 @@ Description:
>  
>  		Usage:
>  
> -		Select over temperature config ID to enable/disable feature
> +		Select over temperature config ID to enable/disable feature::
> +
>  		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id

I was sure that this wouldn't work, since the literal block is not
indented relative to the containing text.  Sphinx does the right thing,
though... so applied, thanks,

jon
