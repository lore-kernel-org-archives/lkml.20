Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B8F35E549
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789211578; cv=none; b=g3nBd3RqLJ+CWj753ookLeoVXVMJtIi2vv0ExUjR9Jpij4G4NqYSH/EhG6ao+vWamLPk2ZjfiPUsGDY49aXdEOs+JP9gaJvXjPkS1SAxgx0b/9uQUDDaPAFyncmRNhAikrvHMOAXjUjjUqV/NIixtz+macjXPHHNbGmUCj6Iqxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789211578; c=relaxed/simple;
	bh=97bhhKMklXsw2yqKWEvcfcOq9VlutyKT3Iaes2zDJNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYJ1ZqULdPfmjRNyu4RVRGSG5sBBIur6r3pEyeq7Rd8lwr8jkSIYJ3qk8kCphqpnSIlhQzqFLRa55OzCa24iCOryoumOHSjwRjcl9rDUUA99rXbgwNeXt2+qt6nvMQI5C4o2j9PPYw3u3gxsvLF7uKthha1w371nCXrtOT7KcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XJaWFpm9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XJaWFpm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=97bh
	hKMklXsw2yqKWEvcfcOq9VlutyKT3Iaes2zDJNc=; b=XJaWFpm9w4ZrmxkpcMf8
	iQq0H2NwptLuHJ0CRTgrTiXxMarCZH767mle4CFo3vz2UDmwvXDuU4vXBMMc6koP
	KqApJTvK6Qnzg68Ilus2TAm8OKEp4fIZb8E5zoSqeSRBb5del/tC9jlUdopqutCc
	Ba7jjL9TDV9o2rYKE+DUfnQmqbUAikZ65p8F1ilRaFZbHoHtvO4U/RU2s47LuQTY
	4QiYJe0y6sLKZ12nzY0PSHA7uyZ9Pyxtx4XZZFtymKL4s9+GK0LP0dgkRf/wx0Pt
	3y7OAgzlaXipcEMyO9god2bjfDK7iYtLVlk6niwM5PSbdakOb2DO21MA4LHAZCVt
	MA==
Received: (qmail 5143 invoked from network); 12 Sep 2026 13:12:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2026 13:12:43 +0200
X-UD-Smtp-Session: l3s3148p1@6MOtR0dbupAujnsz
Date: Sat, 12 Sep 2026 13:12:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
Message-ID: <aqUzq9MIS8hBFDtD@ninjato>
References: <20260906202747.4041389-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>


> [2] https://github.com/vitor-soares-snps/i3c-tools

An idea: because this project only contains 'i3ctransfer' at the moment,
it probably makes sense to provide this tool with the Kernel, placed in
the 'tools' directory? We can seperate it again if it becomes too big or
we want its own community there. But for now, I think it could make
sense unless you want to maintain this repo as well?

Happy hacking!

