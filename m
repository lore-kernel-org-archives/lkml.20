Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048422;
	b=ARwG5aL7RLo4dllGwSVxvy20PoiE+20ETvCthoTptMXNGJPlqgMLkk12Q2oTOKRzePFL
	 KBs/DQlLXBrKBXU6K6Sq63d8NwDjPkW1+hM3AK7O0Cz4IeWxraNpV1w87Dyox3C8eUKyt
	 4ASAkQimSeSGE5a/XbyDofDceAmaYKZkJQJ8BGqoC3pDFsgSHix4LHYBWgqVU6N4McmuK
	 J/eKnmnisnpBEAaZtTP4kMkDCZBduMpNqK1P2NqAKb77FF3G93T4kDCHRFSKhL3dfdEfO
	 j+HnC6km7MUFw6YLI6kejuCStacfapFgduBRGIa7zhtzkThsz/REzrR5MIqmI5b8Suw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048422;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=wA3dkvMx7ooBWGULDvPGpqjcybJIGnUId/tTDSPNZFU=;
	b=uTUiCNUPifaleZiFbcs6rv6T2oFdtUQIJ0ZIgKR9Q5Cszie9T9XS04OnxsNVFeKS5zWz
	 FetS6nlAbbkLGaoFKhJeg8cOlEo1rbsowAHL+5DXHjvts1vwWforhwVkvJgYVV51Ns6Ge
	 kkoR0RQO5qBi9C8b2QY3PpweiawI7bEqX7PkMfKER+LfVhMH5H1rW6KKLf+nj4Fu5xSNS
	 bB9jRNrJs05mWzQynNrsJRQz8W3XXpvz0QBkd57dKwok5veRxBgzwh2CfMM22VdpfNw73
	 R/8qTtcm/d0tnHqnSBIlU+3ORqUjjig2O7pQp2GgN3ijESd5q26w9jURIA0RaMMwXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJKONane;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1A606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJKONane
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D881F01825;
	Mon, 26 Oct 2026 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793048421;
	bh=wA3dkvMx7ooBWGULDvPGpqjcybJIGnUId/tTDSPNZFU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=cJKONane6TgSXf5vGWGaYINEYaq+YA4RduLwQ2UOnSEX+1trRRfK8b5Z1FYUHEbQK
	 SEGsTP4AFI8seBnqsBa4UyPsLuPy4yARBuUCKGKv6lfReFlQX3PjXLfmU0XJgkBXL5
	 qgExk3hPfGsGispwHC7yiI/BocIbhricKHLm/6J475yVnu5MoBeYW87gf6IWZ/GJB+
	 TTtcYMKKuVGKdy+Zx1+ygf9Fn8hlNUTY0e9P0cpOIM32JiIO4BhlR9ATbSTfjVD3P4
	 R736jTI8DFsfu8k2BcTr6CDbPjwKW/aCSDYvhsQDsL8gl1mYbiMXLsrInn/3rcJ++6
	 OpHH7Y39esZnw==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 50B38198003A;
	Mon, 26 Oct 2026 17:00:19 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Mon, 26 Oct 2026 17:00:19 -0400
X-ME-Sender: <xms:Yb_fauslEmiAHdP0RB7krplIAliWtujTUxUhZWFcwn_cX_UiErcEBQ>
    <xme:Yb_fauQa_jc37pCZbQscW_xN-QpchdRiKr3c0a_voKlv7P17-aY6AjovPbmtMtu-X
    X45jnV_rHlRLc_rSTxah6X8SAOpj5a7ZGtKvucPTCFplqftPc0uiiA>
X-ME-Proxy-Cause: dmFkZTGafdPjgwFd1AIrmJXuPCumIjgIQd4biuJOiOqTRtJoWwbuMpkjRKGfknjWslcVMe
    lq3xRE+AA7UgBD4ulzS3m9aDamXRe2Hj9FytmQSF0qpzie4owzbZU9qlVpufYWWMtNIGw7
    eW6ep3epm6tIVw1+yBUA4swczz2oG9EolqyaBAyqwfrw9cJ3PUamYy8SZGkMZoh1Epnlah
    cpYNjscRtVDlPA475kujzKj0Xs1Pu1Cr3LBctsVq43q9NHWqVj/aUrcdufoJs8rZcI5pss
    n+513xd1e0MfvSYr47/fhGSeu9a/0dqzfwoRBHEMbKdIcb+A6ahQ567AhL3n9KVt81guee
    Lqt9pDbci5XAx5f+k/slUBMpiBp+48drozgd5ScQJksMAm8NNJ/ekj8aJFqipA+U6jD+VN
    q+V9risGO39k71WDqJkKImlwQNQLBlpdfQd6xlq6VuiiD84nYeIDIe8lr0XdIKQoy6W3DT
    CWPK0rHPXOUgYNVjMccKS4VkDkipMvALt8CGG+RcfdymIDDATugHmn9xRpgT0Sc5sY7H0Z
    P3t8ylAp4iaZOQD5gbQO1yxdPOtQfTAjFXc1aa4g767BderS1u9fHHOTCHHjxPjriwJUXk
    azr6FFaJP78ndf9pyQS/z9zbZEnBvCPFym7DMnqA/+3c6L/JfoTgKVGzkbDA
X-ME-Proxy: <xmx:Y7_faoZ-t8FEEenwMbSXt73lYfaRVfiz7H1v5LinrGMqDwQ-l146Jg>
    <xmx:Y7_fasuyQhIs_aDG8v2XXY7sJn9nuljH67q7V1jZYzYl19Qrfrtgbg>
    <xmx:Y7_faqNRovaovvehOlpJS3NAT_z7GJGDwZeEvMIdrKAPdGEAlFpaMA>
    <xmx:Y7_faj5T6QOePWHtp9aP6HViV6BaO_MqLPdr_tVc3E6pQPC0mmYc8A>
    <xmx:Y7_fagScUtovsQu32V3KEUrwXg_n-NjL6ZhGU_Bs4PxE-vDEFlpD6sJu>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 95A6A2F8005A; Mon, 26 Oct 2026 17:00:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A5TOieuUj_0J
Date: Mon, 26 Oct 2026 21:59:57 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 linux-kernel@vger.kernel.org
Message-Id: <bf2d5ac3-42e1-4c08-ac8c-d3b19fe5049a@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2610261935230.42255@angie.orcam.me.uk>
References: <20261026120430.13238-1-kaloz@kernel.org>
 <alpine.DEB.2.21.2610261935230.42255@angie.orcam.me.uk>
Subject: Re: [PATCH v2] MIPS: c-r4k: Flush the cache error vector before writing it
 uncached
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 26, 2026, at 21:00, Maciej W. Rozycki wrote:

<snip>

>  Hmm, I'd be tempted to call the hook flush_dcache_size() or suchlike for 
> consistency with our existing nomenclature where "flush" stands for WB+INV 
> and to signify that this function doesn't touch I$ (the *_range() suffix 
> is already taken for interfaces using start/end rather than start/size for 
> the boundaries), although our naming seems messy overall.
>
>  Any other suggestions, anyone?

Fine with me. Unless someone has a better name, v3 will call the hook
flush_dcache_size()

<snip>
>> @@ -1743,14 +1743,15 @@ void r4k_cache_init(void)
>>  
>>  	flush_icache_all	= r4k_flush_icache_all;
>>  	flush_data_cache_page	= r4k_flush_data_cache_page;
>> +	cache_wback_inv		= r4k_cache_wback_inv;
>
>  Please update arch/mips/mm/c-r3k.c accordingly.

Will do.


Thanks,
Imre
