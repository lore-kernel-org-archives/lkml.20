Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882538DC50;
	Fri,  2 Oct 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949638; cv=none; b=NbyalV812qXhgL9/kkVcLIIUKikfAGodff0POibXaNjrcpnlwy34kn6lyZowcQYPL07mjDTYdjpHBndxrgxf3hOMubfw3fl9JGoaanVdvFdzh0yj9VN1E+L9Zb9vQ+uUKhQvhHpsgpmnkwkjqt06aCwL8gg0KPYxdw1g8WGdwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949638; c=relaxed/simple;
	bh=AWQb3mL4lGZsmN5hIB4Zd9ECCoNpZKm9RCNbkgVp38E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XulL8eC6HLWwrsmIT0QlouKGz+MsSKyZH14zxj02Tef70Lekqu9Hzb4TkoYTRx3EnrxwKhs0mP2uLnBhargZaO8PvT0rG6DJqmlfBvad9t14uzfJmQOQ51NvHkMtgas2uZZ36ENGMofgJ886HlnBCxPt2HubzuKDA05ZthtvL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OFm2xiKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OFm2xiKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54F81F000FF;
	Fri,  2 Oct 2026 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790949636;
	bh=TlY1Z0MXdoEVpJou1Oz74dV2UHrM9J5gEcECMqEkGhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OFm2xiKTKOkTNNdWro/Y9SJ8imoxwMFE/OA8U3i/+0NzNUIbf9GHm6lluiWOMHZTZ
	 Xq8mqwiRxI2vF738iJ/dAF0noufSDfWVrfylM/V6aY/cdPVjS2mpD/K2DAsEXPvbmu
	 kBlGk4DqIZbVT4d7HsJ2KReo2MbOKUeLcRff9w1Q=
Date: Fri, 2 Oct 2026 16:00:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tianbo Fu <3064575448@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: remove unnecessary parentheses
Message-ID: <2026100257-circular-trustable-595c@gregkh>
References: <tencent_41FEF4B2AA27128459C679783AD4D039F207@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_41FEF4B2AA27128459C679783AD4D039F207@qq.com>

On Sat, Oct 03, 2026 at 04:51:29AM +0800, Tianbo Fu wrote:
> checkpatch.pl reports multiple CHECKs for unnecessary parentheses
> around single conditions. Remove them to improve readability.
> 
> No functional change.
> 
> Signed-off-by: Tianbo Fu <3064575448@qq.com>
> ---
> Hi Greg,
> 
> I removed some unnecessary parentheses and compiled this on my
> x86_64 computer successfully. Please let me know if anything
> needs fixing.

Take a look at where I have rejected previous such patches in the past
in the archives (like just yesterday...)

https://lore.kernel.org/linux-staging/2026100127-fifty-wrought-2d30@gregkh

thanks,

greg k-h
