Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924471;
	b=aywOxgJPii7QJnciQqTwr+qTh/nGuf1rKHErJW86X1FylS/hK0IWjzy901C4+dsKlXdn
	 sQXshKCtdsgPPgWfJQtkDep6pF588X7GrwoWvqpQ0YAAmmTYqrS8zHxcl+umtcMQ75BZC
	 vBsVIYh6yVo8yT3ntx+e/fnsfmGPr864UoqIENo0uCDJHfwRsmBQEqnI5CeMqrI8VJkC4
	 OsUxENVsqMyThYfERtrl24yntqrC/R6KgyIcgEKQaSgebFEAWlTLIZ1o2u88yrms3LsGc
	 7dIiHl6zKswk963oDXQjOOkkqLCg5xbJJYibHl3mCmd+TCNhEv/uAVeyi438MAhPkPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924471;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qj8Sw9mUchR7OX+IPNi68Wrx7ZpfMOXDyUtg//GhS7c=;
	b=jzk1tjX77XDMicQ3Wi7/5pmujFjSV9N0RBue3+Wj81hvdUzR6y0LaN0lljexO859n5JM
	 KI2DOLneiPxP4dXPujVWKsqUus2fwOuwJHhRBnPk3b7Bi4XghQzgLxbfzbf/hngrplg6r
	 clIobhJAfTvHRMDdTecoHq5wrrXMyNE8eLtTcxZvngF0zx8uvObYS8OnRIl4RKipblIhc
	 0B1om8eZB1G7mvV3EpFxmtra2A+Yfusw2qO7ElJW23awQCKdmliI59KP9Nduie8QGzxuK
	 BsD7HN/kOCJXPWG+etC/sPuhqEAb4M2t66eIbiFsiJ8EYraUB6Ft6pw3Z6AFno0N2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=fFx+rwFP;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D4606A329;
	Tue, 17 Nov 2026 14:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=fFx+rwFP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qj8Sw9mUchR7OX+IPNi68Wrx7ZpfMOXDyUtg//GhS7c=; b=fFx+rwFPGvChncBV1ubXAccELF
	MD+nxzDXj3ghNhVhBzswcODzeg9tgxD5hFwZ3eq16BpD4A4s2pgbfFpCyga0Zobxc4HiQfv+ueUpl
	gfIfo2arI4whpwW0E+PfjNEsjTosAVjmOoOf3NOPvlJeNfZQU5JREbls7t+Iz2pekrJQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJqb-00HALL-SF; Tue, 17 Nov 2026 15:07:45 +0100
Date: Tue, 17 Nov 2026 15:07:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: wan: farsync: reuse card slots after hot-unplug
Message-ID: <6a161933-357c-49d0-9901-9398ff23b71e@lunn.ch>
References: <20261117121314.811514-1-shxzhaosr@163.com>
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
In-Reply-To: <20261117121314.811514-1-shxzhaosr@163.com>

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

What does this tell you?

That nobody cares. Why change this?

    Andrew

---
pw-bot: cr
