Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6604D7966;
	Mon, 28 Sep 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603746; cv=none; b=jJw/8pEZtI5Zqp8vpoS29EZPZLRYMQci7W3OSv1oCwMw0r8cAjppUrg3dtbLaoAxEdGD7hU/qxUobd8Y/64LgnrTELCfvuRtYUf6laJ6w36nVqcKkCsCdraFAaVv7okECGyd2DTaYRAU2gCu89XT5N0d4aarNAL5DxosgzTvVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603746; c=relaxed/simple;
	bh=yuJddjroMlm+/RCT+Cas5kXXjK5uRQ5mO7vkNKsYApE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSSRvYSH8fwlHisc9ZkUi6T6z2XOzE54tB8B0HbkfMmFzcmA4oLEAUzxWooExz0MHCAmEdYfJoSLsz9scCc4sWh3PkHJyBjbMQYSkFDCZBpvUKrVMMimnVuXtWR/p2qynhkVLwkrMj8Vq6ppzqI1ZQzTGRqftY6HfM7m7/cPbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dE8ujsXG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dE8ujsXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBF11F0089D;
	Mon, 28 Sep 2026 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790603744;
	bh=yGqXn7VLlEs2YiYRFxjTVYua8scup+6Ki9y20ItEg0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dE8ujsXGtOG/NBNuncPrMtotj3F+n4WlExJA6jsfcTZYr3lIJwjP4XbgisvIo9/NK
	 TsvO5XnQgnXiw4r3U0ejv4uYBb3WIAH1dg2NT2RJAvQFMcMYtRR8uaL7kcNWqEqiZL
	 yyGDLeakqrUNuEu/SXSdC/MPgtNhz3jJzSovLcO/yNHqTlikR7SS2PeQ00pYcz5+Qf
	 ix2eGxiLzK4yLfpRCNnoAv4LTLjpo1v7GoklyNIqNGyv4rB0C8fB037oFv7R0QXtJK
	 StGKrgDpWyL5xkIEsSGzT4vWXJcJcE3zP4Hxnsab4BuGwmDMYtS+TbHAxwpWDDWu8F
	 dqw2SkINjI9lw==
Date: Mon, 28 Sep 2026 08:55:42 -0500
From: Rob Herring <robh@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 0/2] of/irq: msi-parent handling in of_msi_xlate()
Message-ID: <20260928135542.GA4062773-robh@kernel.org>
References: <20260907112944.313618-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907112944.313618-1-fuad.tabba@linux.dev>

On Mon, Sep 07, 2026 at 12:29:42PM +0100, Fuad Tabba wrote:
> Hi folks,
> 
> Changes since v1 [1]:
>   - Added patch 2: end the walk at the first node that declares an
>     msi-parent, with the reference handling moved into of_msi_xlate().
>     (Lorenzo)
>   - Patch 1 is unchanged.
> 
> Patch 1 is the v1 fix: of_check_msi_parent() hands back a node reference
> even when the caller passed one in as a filter, which of_msi_xlate()
> documents as receiving none. Patch 2 is what Lorenzo asked for [2]: a
> node declaring an msi-parent names the MSI controller for what sits
> below it, so the walk ends there rather than carrying on to an
> ancestor's msi-map.
> 
> Patch 2 removes the line patch 1 adds, along with the rest of the
> reference handling. They stay separate because patch 1 is a small fix
> for a leak that has been there since v6.18, and patch 2 changes
> behaviour: folding them would hide the fix inside the change.
> 
> Based on Linux 7.3-rc1 (cee9395acd804).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260904073424.3855365-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/apqnaNmeuUjfC8Ng@red-moon/
> 
> Fuad Tabba (2):
>   of/irq: Fix device node refcount leak in of_check_msi_parent()
>   of/irq: Stop the MSI walk at the first msi-parent

Series applied, thanks.

Rob
