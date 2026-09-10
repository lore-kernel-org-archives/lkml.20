Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47353D16FD;
	Thu, 10 Sep 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044871; cv=none; b=GmRPykohaXbEWL2JvhKTg3kd0k6FG6WHwk+hV1KBT0NGysaLyTJXvlifQrGdezZclIvJF27TnZbec0Wpq4zyCgzIdQN84bobQ2XOkITru8GVK4siGxkhQkn1JqxCR7gnEw1YYrQqN2Veu2W//8IUiu9xfy2A7FPT/Pgs7vuLjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044871; c=relaxed/simple;
	bh=6/btzPwfznfFv8TQiUa+owP0pEk3ovBqE7vaMGsT/Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+anqache/CtFAot6nju1+EudjUq0jymY2RZ1D1IHJdyDJmTZGV359kWQ1HHaEt3ZwFjSZJh35PYm9wfj81AyiP0OzF7Cqmm6QSQ5SIJ33fQLZy55jY/s/hbBhufIGoguuWl9wcBiLtPK15+IuRnF1lD3AW1LPTLIh4oDniMVPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhxOMiwv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhxOMiwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719111F000FF;
	Thu, 10 Sep 2026 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044870;
	bh=RSjpK7/yTSMoZLSzD0J28LyBuQzrzJ/HO5DpbMjTJWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RhxOMiwvxOMcYAg9oDHNz9zvp0M8/fm4lqdxThbwjbpdnzYucg0dKnrU6xvDXARQn
	 GobT6Htbn3qqUNjPJE0bvpdPG4GTiEb+yrwh2QE2K6YZwaYGAEYS4ws/dsG57qtqs+
	 CHdjx1lTbloZhQ0CnFFqZIPjHBohOPn0Qg7X8yI8bJXpDWiQxrIem1KXprxn3Cpwdh
	 H07iqYQzdHUZ5z6A+xDTVrKE6uhuDHBFT42+tkF6bRld3PQjkP+TffRjoW0nlzFphR
	 RvVJx6dOV2O4YaAozXPO55WPmax8R1RVsoytUQrOsZMpgBqaepm1cuOnt3Zm0MZVs6
	 tysxgmt7ia4mg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x4eIO-00000002gnD-19hc;
	Thu, 10 Sep 2026 14:54:28 +0200
Date: Thu, 10 Sep 2026 14:54:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
Subject: Re: [PATCH] USB: serial: keyspan: fix use-after-free in keyspan_close
Message-ID: <aqKohDTyqN_MGKSf@hovoldconsulting.com>
References: <20260831023701.9579-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831023701.9579-1-kartikey406@gmail.com>

On Mon, Aug 31, 2026 at 08:07:01AM +0530, Deepanshu Kartikey wrote:
> keyspan_port_remove() frees the port's private data (p_priv) while
> keyspan_close() may still be running concurrently on another task,
> e.g. triggered by an explicit TIOCVHANGUP ioctl on an already-open
> tty racing with device disconnect. This results in keyspan_close()
> dereferencing freed memory.
> 
> Fix this by adding a mutex to keyspan_serial_private that serializes
> keyspan_close() against keyspan_port_remove(): the latter clears the
> port's private data pointer under the lock before freeing it, and
> the former re-fetches and checks that pointer under the same lock
> before use.
> 
> Reported-by: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5fabc1ae99ff40690d84

This isn't a driver specific issue. I've just sent a fix for the tty
port implementation here:

	https://lore.kernel.org/r/20260910125114.640880-1-johan@kernel.org

Johan
