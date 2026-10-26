Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017136;
	b=cMBsZZ6yJfwxIEqH0IJLknFh63OWJNa5ekQafwyjIxbM6FtjW9kVuj+hwLsEo5/7WWAH
	 0CE31ziqy7sIIP+1Jkcgj0y5zy7bv76qu18jo+m4ijTuKaOOLoAjgLFmw3FP24LAviXcA
	 wcoArSCSG4+V+s2FDony5EyPbVjHJofVbMMYhc9ugKnj0sHM0efAMyC2fQu5iXWwDNwnl
	 x9ZgjRQeoqy+POrRcjdLML7hzruvIWSbacCQhiIuhFU7PSakiFhiWaVFo+QiGfnCYHC+3
	 3mgnK6PzpOFeki1gRhW6FK0ugkJYfAo5a4ORV9uutLJEpcpsI2NABVeBvQ2VVhcNLUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017136;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yaXI3Nbh5+pJ3mo/ViTuOATYZaNQKD2VP/LefhS5CWg=;
	b=xpTdlxTBbNUvMoGWP7FBh7MXZA2O+SooYn5m7lxTOrjXYAApjkpiXWfREyd5y6GD2PcD
	 W3Bt/kkyKvvh9mhmQhnawyyuOkYweyHuDYhPnLlcmDiTviaaEx7xnc7yBWJALUZ249J3U
	 38Cxj83fhMSBr7wZiL04uu9Efq3/kuFWIjLr3IxfPBUq80baHQ6qHjZ8gEPlLjCMKn5rX
	 pjPStrUD8dEhR4nX89rbzWQEODJDp0J9hWe2Iz+pYtoyC8GBmoC+wfedSUk33qkqquz6K
	 +Yc+tUt+FeQgfXoAzpUAumFJgJb6rVW81KGmOID4T39vUHLj+f+M0KIOInfS8InWNwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D5u1emH/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCD2606A31A;
	Mon, 26 Oct 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5u1emH/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE17B1F01825;
	Mon, 26 Oct 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793017135;
	bh=yaXI3Nbh5+pJ3mo/ViTuOATYZaNQKD2VP/LefhS5CWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D5u1emH/+RwuN4KyRpoLdlAQ+i0twajuafBFFPM3PCQbwovNzap3epOHMECow+/5U
	 gHepCpFQFVinkhWkxeZLs8qnZ/jXv87iPpn8VtWDA4Ae0bKK5tqYySOePHg6t1jtRU
	 yD4gjpgeFc1z4qC1SeqyFpqtm0AbxAVgJR/xw9bj1SpyOUWz6iXI72ixXRNIzBm8dg
	 ixIKioGwxgguq0+wzud+WjI9igYwbhbraOA2ROu5QeEaA8gK0hoChwFzLsuMUDmQuk
	 ze0U3MIQHhlHXSvxFRkicZb3629lYYtzFv2patU7DnhUUNiMcPZa9mbMF3PjdMcaiO
	 O2liRjR/abElQ==
Date: Mon, 26 Oct 2026 12:18:51 +0000
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: cover.1712920132.git.mazziesaccount@gmail.com, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/28] mfd: bd96801: Allocate watchdog IRQ resource on
 the heap
Message-ID: <20261026121851.GA17910@google.com>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-5-lee@kernel.org>
 <24bf0964-dd2f-4688-bbf4-cc891c674d3e@gmail.com>
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
In-Reply-To: <24bf0964-dd2f-4688-bbf4-cc891c674d3e@gmail.com>

On Mon, 26 Oct 2026, Matti Vaittinen wrote:

> On 21/10/2026 15:09, Lee Jones wrote:
> > bd96801_i2c_probe() declares struct resource wdg_irq on the stack and
> > assigns its address to ddata->cells[WDG_CELL].resources.  Although
> > mfd_add_device() deep-copies the resource table via
> > platform_device_add_resources() before bd96801_i2c_probe() returns, the
> > shared cell template and the shallow MFD cell copy attached to the child
> > platform device retain a stale pointer to the expired stack frame.
> > 
> > Allocate wdg_irq on the heap via devm_kzalloc() alongside regulator_res
> > so the stored pointer remains valid for the lifetime of the device.
> > 
> > Signed-off-by: Lee Jones <lee@kernel.org>
> 
> Does this warrant a fixes-tag?

Not sure why this one doesn't have one.

I'll look into it and apply one if appropriate, thanks.

-- 
Lee Jones
