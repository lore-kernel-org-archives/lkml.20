Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C9439354
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399232; cv=none; b=mc6ICr354HpfLkd+hRCFEZWSYROTFj3/xIlcUcrZB2xv/fkG+SDtnYFz5O7a1Kq+sW2AlV1I/byPz2/h680e4sx2lej99BdFAk3pQ0LlFqaF+VNxEW+16Jv/vq2aSuoowqODiO8ArTltlTcT7Wu54ocUbH3AP2JC0K/ZsnyxPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399232; c=relaxed/simple;
	bh=IDiF85frZeJEZAOsgR1xXVkqQfoqGin6i1WTRB+Jd8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Itd12rqjkKlFtCXe/tJVFYpQ8LdyHAVSOgZ2Eju4CASiWs47IaE0CpOaFGLsbrfrVHfC9o4UhnmmSTkl0xSqJu3uMDI0C0Sv01wK74JFtamxWTPjAyTaySsEJvp2bhnql3r7BDtbUSQYgd0LqkbIL0YlrmjNS7qsnMvL4WGXaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkPnyJhL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkPnyJhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FF11F000FF;
	Mon, 14 Sep 2026 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399231;
	bh=IDiF85frZeJEZAOsgR1xXVkqQfoqGin6i1WTRB+Jd8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkPnyJhLoy4Rrr8wztJFIKP4HSL3lWn9MOsjCvcfmrQuLoTH9Pca40ZLYnysE0Lvb
	 5NuLoo43VyLjv49t8PPWQlxTwDzB7kyz28b75bf4vY2GeKB3Mml3b5IR7Pncq0HbGY
	 XwnH0KLurBNnplxzSJKTifyXTCiq/LbqPupTb0XIhw+fSMe6K3gz9/Qzx283x5CNv4
	 XZq+Fe78RdFXrQ7OVk+sA+6ZY2AoTR5skLuxFXBXMCYSbTNWk1NJmQJuHFveZbcprn
	 6qC0l93atwe2m+AXTZgz3Qe7jR35hYjpw28/ALfbeD86ECl7g8fJkKYyeparxyWvNm
	 QzvHSelJfSRxA==
Date: Mon, 14 Sep 2026 09:20:28 -0600
From: Keith Busch <kbusch@kernel.org>
To: Maurizio Lombardi <mlombard@arkamax.eu>
Cc: syzbot <syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com>,
	hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, sagi@grimberg.me,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nvme?] WARNING in nvme_loop_reset_ctrl_work
Message-ID: <aqgQvIG17WgKKoFs@kbusch-mbp>
References: <6a9ed559.6e6c5f9e.240462.0003.GAE@google.com>
 <6aa6c282.4c28b7d0.c1bba.000d.GAE@google.com>
 <DLEXGM8VZOW9.1J9A20FEP43RM@arkamax.eu>
 <DLEYMPA5WF42.2GHC28RDZX90E@arkamax.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLEYMPA5WF42.2GHC28RDZX90E@arkamax.eu>

On Mon, Sep 14, 2026 at 12:16:53PM +0200, Maurizio Lombardi wrote:
> Maybe moving the controller to CONNECTING state before exposing it to
> sysfs will prevent the warning:

I think all the transports set CONNECTING after adding the controller,
so this would have to be duplicated for all of them, right? But why do
we allow going from NEW to RESETTING? I don't think any of the
transports do that anymore, so we can remove that transition instead.
