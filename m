Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4F4582CC;
	Thu, 24 Sep 2026 23:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292108; cv=none; b=ssn9KZc1G4IgTJwc7dcN+hsB77uWqoSrlIpMn1tN8J8XN5PSSENa3uh6sIm9VyiXkO3yBKSFGa9LJ1ED8jLnTDAfXnC89G7nuU+cwQAc1Zw9smn6qrR99J1bzgvQPLsNPk2NgDPXkRyYCKm1qmT+rrDcG9/s/KUcoEWa7csF6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292108; c=relaxed/simple;
	bh=zjm9WHhqnzUGC8OpvqLpb4EhBDy+h9FJQtvsPJov8hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYPvz4LZejEUmQL3F0nAl2apOgf83WgZFcAZvwpB//3Vd/DF5D5POMUxPZquer2WViXJTgn0f7bMsLuz6oaETVHnK0fQMn8mB7KBPcmP+RO+mUutT56xh+L2wg3josPrFBPwgm4qm3cwCZ9iRq4LsKGnAQYmggQ1wpVDK2+wcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xAt75sjo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xAt75sjo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=v0mBWmL2VrrVFCNBRzfbd5T/57AcILdbyrmTf+I6w0w=; b=xAt75sjoutiCYcHH7GmILodivB
	YIriTMTzClU/lIfN0yOTrjBHtwmZU6kN8risGC5OEF4DZ3WsixEHXcjGJ6K7m6RFSDYqEFmQHOMux
	kHU3W4XFUtKKv9rav9aorXPMrI589QO6eAcDB1W5Gn9j08Z2fpfKV3Kwtk5Rsz0LiiTs3xIRUVUXS
	gmoJdGS+AX6BZ/497ETDIZKVn461VXns/vnGMKTksUlMQSjH8yHhMBq28GURAepezCuZuQc2uTPhN
	NkzgnqItywFWT81fKGCPb7lBTo0DZJ5/jl1PdFjaU6POQFUXfmM+x5Sb37W+6iJ1o+sVc6mk4NdTZ
	MKbARS1w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sl6-0000000CNP8-1ypk;
	Thu, 24 Sep 2026 23:21:44 +0000
Message-ID: <20d75a7a-2e7a-484f-a267-c21db82dd922@infradead.org>
Date: Thu, 24 Sep 2026 16:21:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 24 (htmldocs: include/linux/tty.h new
 build warning)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <arWmD5B_Nt3qcBXZ@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <arWmD5B_Nt3qcBXZ@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Johan H.,

On 9/24/26 3:37 PM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260923:
> 

Please add kernel-doc description for @break_wait:

WARNING: ../include/linux/tty.h:243 struct member 'break_wait' not described in 'tty_struct'

-- 
~Randy

