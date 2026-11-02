Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602122;
	b=UyHbnoa9HZMypHscw6ujvk5uGV9WtNUchLmIo8DrlJ6iOZOfFjAws2qnTxzbsjuDSpNg
	 6KAhejhwP4ynQjzcuWqrf6gGNLLWjRpOlXFfCDe9reqHQS3tcDqB7i5VWpDRBS2jMiG3+
	 5A4wbG3DE9uV+BO57U9lS1+bL9y8x6lIv2laTrNFPF+1JB5Z2S5EaItJJq7lADif3SUwf
	 ICwyncQE371/EED33fOTFaZEXgwi+PJXa06ytKcIN/I+0suhba7Y9oyW2JuXsWM+24GBR
	 5aTn0u16g6XnTMWtMk3aP7OCGjt7OtJ3y1rWems3e/Fy6TlUC219EySJ8lw0rBkHKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602122;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cQ0KOhOmSQDkNolHmMFJWJmZM+FquXs2ctisOx90x+o=;
	b=mdT6Y2e1B2omKRo8/IY7EftnvCKuKcAxcIxrLa+eQyMuCAU08mGq7ANxOJZwpXkdZ2uU
	 gR93m4BeHProtab7RSNMiLGQ9xDVXuo84njM084aZoFelUmLhm3bh261z+i8OdxEm6V+g
	 fgO/ctu3KBAaMrzrxbtBEm70ffv4OnLhaa1Gd+RiTKTFsELL8EBDQfzYAjDthGqoTBkgr
	 GaQsX+mz29npGDsKfvq+j4GyXf7sdttcqRglDNOB+olgLyLAgMKN4rgtogbhypgidXH1d
	 h4TIVNqbNZ7ZeH/OCXD7o8Sd9K97QrBOyCIWXZBlnc+sq/1dE++b174XAuEC45tDhIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=G0Oa5Gb9;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=jVlhY70Q;
	arc=none smtp.remote-ip=185.136.64.142
Received: from mta-64-142.flowmailer.net (mta-64-142.flowmailer.net [185.136.64.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD9B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=G0Oa5Gb9;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=jVlhY70Q
Received: by mta-64-142.flowmailer.net with ESMTPSA id 20261102064832d1d6185ddb0019fda8
        for <linux-kernel@vger.kernel.org>;
        Mon, 02 Nov 2026 07:48:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=cQ0KOhOmSQDkNolHmMFJWJmZM+FquXs2ctisOx90x+o=;
 b=G0Oa5Gb90h93j/tzgmyxz9xb3rRBjbHN0NduyPLjun8vFnNqp6tXiwzpksTCVcouUJp3sP
 lupGOcQRffdtu/uHPKwXlxFDmRRNq56SrPSRBcF7kxcXzHK6+QmiODA0+1fFhmlWCx2Gx52e
 UQE6elYMiG+lGlKUVFHHeXW1Qj5Qk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=cQ0KOhOmSQDkNolHmMFJWJmZM+FquXs2ctisOx90x+o=;
 b=jVlhY70QPk7b4E1Ki0uc9sgm2iaJLt0OTrjIIJgJnRZ/68TUoEx+6J1Zzfesmyltho6evD
 5BlkNlUZTHCQktsJtgqDCBEgrjFaGBzH6dxs5CV5OaWk/W8UXa9NRY3GHJiD2a444QnGXRAg
 ewF46yDTc583OGTAk95rb+Y3Y9mwZffLEhIVscTgzjq0ffw2KFlMUg5Z0ypFHwV9GfdiM31r
 g49xSN9awL8ayPyMyBEpZpoA5N52Lpmqy6Qu0L1om5a3X7Kt0FhhXDH5wQjzgSz/NuHyom0/
 GxN8Hh/I1SHlLMsoUrQD1OUSf9oc2/mdpAO6tBNafFHIuVCfpmqjYGyA==;
Date: Mon, 2 Nov 2026 07:48:30 +0100
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] lib: Add software mul/div helpers and use them from
 nios2
Message-ID: <20261102064830.slncwl4e7x5qhhrt@dev-vm-schuster>
References: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
 <802dd722-fab6-496c-a457-c1533ff96132@app.fastmail.com>
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
In-Reply-To: <802dd722-fab6-496c-a457-c1533ff96132@app.fastmail.com>

Hello Arnd,

thank you for your comments!

On Fri, Oct 30, 2026 at 05:50:58PM +0100, Arnd Bergmann wrote:
> Just a few minor things that stood out:
> 
> - I don't see a need to add the files under arch/ first and then
>   move them to lib/, just start with the added files there

This is an artifact of (1) not wanting to touch or drop Dinh's patch
after picking it up and (2) being quite contend with someone with a
current Altera affiliation doing the initial Sign-off on that check in,
(even though this is, of course, not strictly required by license); if
you don't mind to much, I'd prefer to leave it that way?

> - I did not expect gccbcmp.c to be needed at all, the kernel
>   should handle the string functions internally. If you do need it,
>   there is of course no harm adding it, but probably need to
>   build with -ffreestanding to prevent it from recursively
>   ending up in bcmp()

Good point, as far as I can tell it was not part of my "quick & dirty"
testbuild against upstream libgcc, either. As that had passed
allyesconfig as well, I guess it is indeed unnecessary; I'll retest and
potentially re-roll into a v2.

Best regards
Simon
