Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F946F4A6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166805; cv=none; b=iIyLvKqupLpS7ewzRxr4sgspcp+ZZ5XMwzsgVidbOjAhIGgV/LsvQ5dZT4IDNkJl2YQAgxt3Np1JB+aQS4Kjcq3fF4tyTT+WvCRLO5tGiYdI821S9ZS1oLgcghkaLdY3ngOKZJ2DEjjvVPsZY3s81s5SgiKsVC8MUWSzz8Ia0bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166805; c=relaxed/simple;
	bh=dRmZ44uuoB5Cl7zEcgd+V00VLZ/bcrxBYaKkqBwThX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROAoCSkHVIjosxPaH1AHDZET8tVMQnT4IlcsmeXZei+//JezcDGy3WB2qohXMfsnszAh3Y7sD05/DyAtN8lrbFaglgzMSYcGgKZAsQ1GxSWbj72U7uGgyvmBwxhkwlRpEuyrtDgMyxrq/7AiLxYo2Tc3yPOvfIO/IBBxTFHAnIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DasD90Ly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DasD90Ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1226F1F000C5;
	Fri, 16 Oct 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166804;
	bh=dRmZ44uuoB5Cl7zEcgd+V00VLZ/bcrxBYaKkqBwThX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DasD90LyT+BMeYDYdf0IxsNcmsatLiD6vTOvzCyv2scluPKVaCBGjujVfUXHlnXpg
	 8ROtgL9TPEklV3vD7lOYE4sx+rw9rul58CN2C7QVlsBCWVzR9/bmWpRJluQQqLsXrc
	 AOZmnYGzxu0PiW5kPs72ErwxJJVzZIzHiOSThD3zgJPLhJSo91dc8jbtufEv+g4GHW
	 7nCCAJC90oCB+MF7l4/8xVWBQF54tTCCSoQ9yLP22NO9EzndSFds1G7JsI8ovM9aeE
	 xDU1K9NMXVPGM38vCoh0XHt3mYFLM4wElyA7ydQPTc17YSliW1AbJI06BGZTH8aumX
	 e/CvhvzoFlyrg==
Date: Fri, 16 Oct 2026 10:06:42 -0600
From: Keith Busch <kbusch@kernel.org>
To: Nguyen Duy Nhat Anh <neganhat@gmail.com>
Cc: paul.ely@broadcom.com, nareshgottumukkala83@gmail.com, hch@lst.de,
	sagi@grimberg.me, kch@nvidia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] nvmet-fc: skip port entry rebinding if already bound
 to a target port
Message-ID: <atJLkogz_looz_I7@kbusch-mbp>
References: <20261016155947.11018-1-neganhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016155947.11018-1-neganhat@gmail.com>

On Fri, Oct 16, 2026 at 10:59:47PM +0700, Nguyen Duy Nhat Anh wrote:
> v1 -> v2:
> - Move pe->tgtport check before nvmet_fc_tgtport_get() to avoid refcount leak.

You may want to double check before posting new versions because this v2
is identical to v1.
