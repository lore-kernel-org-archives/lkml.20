Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DED7262E;
	Sun,  4 Oct 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134740; cv=none; b=QfDS+ktxg2txUZTAiMUgB2xw6DTSsuRiGSqFwabWMOE+XYmhWTl8Iq8+OrU839Z2ClXvHbFD8lps7h5y2/Rgrg8B+hkM4AqCITx2fXcDOz9+eCz1ZkcYrQ3uWaKTuJk86lijX7CxbES+l6TqW0qUscYWRSxmfvBkz79L0JU4iRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134740; c=relaxed/simple;
	bh=jKpbFnjBBfl/A7a1XTqbDuzK3rscrbhWmlp4Ppr2BYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tq4AfAAbGCUVio0pAvb+FR5Mmy+GajSDzF+wJNV0Ov08g92siIG4B/Rs4oXj31RKdpZEHzN5lTG+w/nYJQMqqtFwDGyFRFL70Z3NxuT6Elj/4h5a67rH+qD0/ndmUCIq0CvkUnYXUx4lRskA8Wap3UOO4Tq+IMq05uKuCqqg5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NWzkxz2U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NWzkxz2U"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 473C582A;
	Sun,  4 Oct 2026 19:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791134620;
	bh=jKpbFnjBBfl/A7a1XTqbDuzK3rscrbhWmlp4Ppr2BYc=;
	h=Date:From:To:Cc:Subject:From;
	b=NWzkxz2UowVyirxx30d7wM4JeHpVKJxCjo5O0P6Ljm81/qkigj59G2YywMICN3Gnp
	 RxhvFJdWHUEcoOn8ZiU1zWbdXTcjflFDRSivWVFUYw7YbP59jPlAV+c0YrOyFY0koE
	 Kqaq4sijPcVPvj1+Wr17iSMIhiuhaiqxIwBFFHE4=
Date: Sun, 4 Oct 2026 19:25:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: workflows@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Hallway BoF at LPC about
Message-ID: <20261004172533.GA533673@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

In preparation for the maintainer summit, I have issued a call for
opinions regarding usage of generative AI for kernel development ([1]).
Multiple people expressed an interest in discussing this topic face to
face in Prague during LPC (you are all BCC'ed to this e-mail).

As this topic is orthogonal to most of the discussions that will take
place at LPC, I don't expect to find a time that will suit everybody. I
will try to organize multiple "hallway BoFs" to give as many people as
possible a chance to join. If you would like to participate in the first
one, look for me during the Monday morning break at 11:30 in the foyer
in front of the Club A room. We may continue the discussion into the
next slot, possibling grabbing a BoF room if available.

I will relay this annoucement on Mastodon and in the LPC Hallway Track
matrix room. Please keep an eye on the matrix room on Monday morning, I
will post updates there in case last minute changes are required.

[1] https://floss.social/@pinchartl/117320477532952626

-- 
Regards,

Laurent Pinchart
