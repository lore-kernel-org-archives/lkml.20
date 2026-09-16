Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872B3C0A0E;
	Wed, 16 Sep 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564930; cv=none; b=o0wjWb0JhauEGp3qJlC/9UvKYQq4/LPkLztZX+221cmxNJdRdbR257BT8mM3k9AZ1ytKLdz4ay1Q6WSzzrUWSCjoPGHjBhkuaHEW+zwS5f31ty+vGxZdzinuCLndoxyJgjBIL5j3kQ9L0rxlyCenIpmgXkOSDWVYEuwWqGkPa9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564930; c=relaxed/simple;
	bh=np3eVP1Sg9JS/abTblse1Wi7/hN3RpPHH+eiIYferYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfag9sNCX6GsDoVGpq/Up73TbVTXceH0lQa/bEXgdR6KNlBmYhRakijXNBHxCfpwXk8SBTZQ+XypGKWCLeeVpWXJYyWSmlbgVl1k3PtDwKREJkv4O+i61orna3mugqGHos24CAekpzDPqrCJznqkmyINHdEy4HKdjBgYxVycCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wdnw0l+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wdnw0l+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE41C1F00893;
	Wed, 16 Sep 2026 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564926;
	bh=np3eVP1Sg9JS/abTblse1Wi7/hN3RpPHH+eiIYferYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wdnw0l+mKnWpj71//pBB0TLVZR9lTr9hQY2PkY6xb4XwHJE9eZS6/2CKk3hYkIJk6
	 QUMY2mBRl/RB542oxKBEVJ4GehxLhMg5eGss5xJGABfZuwitkZjWG2P7L4x4b5c531
	 aBtnnrEpFHNmckm/TlQr+UCaLI3ovkwEnqeEtrDsjiIePF/YmqPGD/EjvsvpXWGt6M
	 pmQtt51WEmTuIQWA64AF4HzRzr5Y6n8Hr0pME0TWag0RcsgHHjLY6Jy6nuBR+vtQ8M
	 RwbnEdC8HrEEJgCG0JLamu5X2sdlU3arhUDKZ4NciEO3B22k3HtHaWVDqDgMepFQ2G
	 jw4NKyJK/T20w==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x6paO-00000006C4j-2sy1;
	Wed, 16 Sep 2026 15:22:04 +0200
Date: Wed, 16 Sep 2026 15:22:04 +0200
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?SsOpcsOpbXk=?= Carrat <jeremy.carrat@icloud.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: add Corsair AX1500i Power Supply
Message-ID: <aqqX_IquzF9iEI4r@hovoldconsulting.com>
References: <20260910162609.7373-1-jeremy.carrat@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910162609.7373-1-jeremy.carrat@icloud.com>

On Thu, Sep 10, 2026 at 06:26:09PM +0200, Jérémy Carrat wrote:
> The Corsair AX1500i power supply exposes its Corsair Link monitoring
> interface on a mini-USB port through an on-board CP2103, using a
> Corsair-specific product ID. Without the ID in the table no driver binds
> and no tty is created.

Applied, thanks.

Johan
