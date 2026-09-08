Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808773769E6;
	Tue,  8 Sep 2026 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854707; cv=none; b=aGd2Tr5RXERl3iEqvDydKw8flfwaPLfq02HjWT3BuDbGdzeDp+TBmORU+LcxEq8gt+CVjqwoktpzcWf3n4pgjXeIdEb/uBhMU9/5P83l+xk2idevj6PSqSIwoQsYNHTuinJuD7vw7ERjbaoXT9LhfNEnxfKi4wGxBkFny4Hlhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854707; c=relaxed/simple;
	bh=seY5u/CslOZWGwYGsNn5hjJXNmlm43fT37xsIKmFsc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMfufTo+tWFL2k9ghPmtaoRDPkUTDxc8kijKJNfDMwZWeMh0jRX8cjSW4mziS6nR4eElkvDqnvoBUQFjIjo2f48RAdjLFpEoNLiE9zCUhYGg55HID1vqbwvAFcICmQ2e+e6gu4e7D0qq3ACVpG/3tkSMhiRzoFL5fdJYfSOmPz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T79nZLeE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T79nZLeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DAF1F00ADE;
	Tue,  8 Sep 2026 08:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854706;
	bh=bJh2MhdLa63Ttm1UiskqgHeI5PnKcOO9wH8EfHh8qRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T79nZLeE+MVQkkVQxP9ZC5GbaJPNSYzCCObJMkr86s5FAmSJwWsKWyDgBG6bJrtZr
	 KhLZNUrzDCtihT/T+SqIKKECtWJk13iY3sbu6Ddt1Pyhk0fxAj/X3/kXzP3H1YJWpV
	 0WXUR7qDhNbVuHk4z2/OJRIDoBpOPz1EYEkp+UjkmeH9yfyIb/VGrrNFmEgwutuddQ
	 EJHJoX4OC4IXHW+WsvVv/OaC/dOoDUObw/pGQihOCxKzrDrVZ3eurYe8pmfeq2GkHA
	 yhZZHNrYchon4fIfcG6sfHEIh6/QTeahbY7/DRMNWAaYy0BAsntnT/nK4sa2aiW7GZ
	 3UNgj54YJNDsQ==
Date: Tue, 8 Sep 2026 10:04:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, "open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>, 
	"moderated list:ARM/APPLE MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] phy: apple: atc: remove stale kernel-doc for removed
 struct members
Message-ID: <veg6ies4ob234g3gerxzvnlfxwcjlle7sarkbzp5ptycfljixe@2kgokqw53ncw>
References: <20260608053525.12354-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608053525.12354-1-rosenp@gmail.com>

On Sun, Jun 07, 2026 at 10:35:25PM -0700, Rosen Penev wrote:
> The @sw and @mux members were removed from struct apple_atcphy but their kernel-doc entries remained, causing kernel-doc warnings.
> 

These members were never present. So 'removed' is misleading.

> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
