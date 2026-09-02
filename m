Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF5472F9D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362964; cv=none; b=eFEScGIlFssU2k5XhXw8esGtPnlCzzcGhogwVJ9NWI5P0H/jeSCUZgLmyuP/vhLPACPdXFn6zOz35126gkBnqpdBU441lFMtIM0zCnVA18IES3oDd5MeEFYqkwfKkFxHqRklMv59Z4m1YZHBzVFwvF/gfVEgOZ2EyyEptZnsARs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362964; c=relaxed/simple;
	bh=N/jNGj/WJtc9+wCYELedsVpK1emR5Ptmhiof4ApIdQg=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Ez5+hUDTSxkLvEhvMlFVWurnRMrDI9sBi1MHd9auimSgBKFXNXZl3swNo8KDAszPPJ8Z2ImH8BfmKh5s5hMqjIHFH/JmK0vK7B6G0IoCmF/Tnhuu2GwF45wWzMfw9k0v3SOwf3bWAHqMT9suwhUZcWEJ07LfIyXyZ+8+BA3YbXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=k33TDilE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gzhBYxSH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="k33TDilE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gzhBYxSH"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788362956; bh=4f0KXm8cDE90V81Eg4FbPAE
	wyy5dVXUBt77qplRE4X0=; b=k33TDilEMwvy9sMZLPUnfxoKMf+I+JxvR0vxJqtlly2wGGU5rb
	baGVAldCWpAt6FG3NNYWoaZ+EF5n3U2T/C+WekP1Aj1UCtF+mopARxfQP3jPcz3Fw6M6AZw+mrN
	BoV27Ojb8c+jlMIJmGLfjvd6fWpNfdrOtCo7ZaM2uO5fKBRqYwM0wG6eDKIATm0lSwyhCfJiQCK
	rDNf0NJ9zMmVTCFfrI4ByOREHYqjuqFMb2cQbAVp8BOpQCQrAX5xbOdyAeungASLmt4tIEGtJ5/
	ShAFsQEiWPjSe+kjWHt1LmKWTDbrMyYE77jE/qyUeiSYRJvPifFS3UASUAWRHRfcT9Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788362956; bh=4f0KXm8cDE90V81Eg4FbPAE
	wyy5dVXUBt77qplRE4X0=; b=gzhBYxSHRKhn7V5pVk2xMaN6sVxB+FKjO7Z/y2tXbHj3XSFC8a
	6wd4m1rtEm7xrc7VU8RDGABWEyBhhcBoFKDg==;
Date: Wed, 02 Sep 2026 16:29:14 +0100
From: Bradley Morgan <brads@mainlining.org>
To: xry111@xry111.site
CC: ben.horgan@arm.com, catalin.marinas@arm.com, fuad.tabba@linux.dev,
 james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maz@kernel.org, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_arm64=3A_MPAM2=5FEL2_and_MPAMHCR=5FEL2?=
 =?US-ASCII?Q?_are_left_UNKNOWN_under_arm64=2Enompam?=
In-Reply-To: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
Message-ID: <452D9DEB-606C-4B54-B8B6-27E03573A9DE@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 16:26:55 BST, Xi Ruoyao <xry111@xry111.site> wrote:
>On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
>> > not, could the caveat go the other way round: arm64.nompam is for
>> > systems where firmware ignores MPAM, and should only be set on a
>> > machine that does not boot without it?
>> 
>> Yes, seems fine.
>
>Sorry for the late reply.  This is indeed the original purpose for
>arm64.nompam, a dirty hack when we have no other ways to make the system
>boot.  If you think it causes an inconsistent state I'd not complain
>against adding a loud warning or something.

Sorry to impede in the discussion, would you like me to submit a patch for
that?

>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
