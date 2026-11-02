Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658663;
	b=wKvxkOxC1p4E0F1y7bZhzuCfkMze9qmCarqSbr1FZa+GOB41pn6Q/pYzCsiph6yGfFbX
	 IpCtf9szp8rAdu9sUxN/L/7lT9aYbqXJyTxUtXXEWJwWhyVsWHN1eHy/b6yB4oMXHssVI
	 5XikfaxJwdH0GPBPc6ipfn6RG4IP4ZvtNq3TwlOZx7KhwSDoHGoaJmkm44kgMU2r9huV4
	 9Zk7OUtryDqTQGLFi3I0+BiY6NY7XCdiStVkjBj+J0aRWjrrH43M4fflZB8HX69NnBNju
	 CUwcrXBb9nyaMw5UjL6Hxxdk4hUpSXsGvgpDbserBU6edlEmdyfTqnJ1re8QPaYu/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658663;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=KWgnR2G3RV4vOX+KxmnS5Ld1miJ5q+014e6/V05033I=;
	b=eGKzWzSci871HYskhRBvGU6EdRM44ZrsKTdqj1btIynicWWcXuyGdsZNiGKrdCjt1IQn
	 E2PQ98hx1eAuneYIztdHiuMLp00dKPFlW0gzm6PCBndo9MtWlIFQJSdI9TRDD1SEEfm94
	 qJ+pQnvsaXRmop2+Jgjh+qQRLJdQos1qTSxuzzBaj/ulVbLJnsAzL3UO1Jm9BGxeZkE0W
	 p2biP+ore6khB/zNcLLS9OOszZQA3FVXI8mqLJTNMAxgixFdpAJF7unznh6qBRZZ+VjbA
	 cIr62Huhivd9U1lExXOat1hg0neOJefcKx0yIeKpJvsctsDp5GmrwemvNxF/gnvPT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=O5bl7xk4;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6035606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6035606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=O5bl7xk4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KWgnR2G3RV4vOX+KxmnS5Ld1miJ5q+014e6/V05033I=; b=O5bl7xk4VoEfY6gEmSF+BWCfr3
	TQjlQHXaiHrC0VPDSReJ7+Js75X1okvwh2KCQbZN21jytbhIfyvOQi2XmDgMSG26H3VM7zmgnpbBO
	gj+WW4bY5s9nJTezkZdiH6MfupPrNQGy7Z4anG7ODhC+6kd9OIAp0aDjRITcwe8Ke2QeWqZXbmcxi
	dZuMuZJyDh3Lx6HgARLc44Ucy46WeR1hlSRPOByenABxbPEt5ne4Z585TWlUSbqi6nHNb2lCEcoWv
	xO0KOn70NPM60uekBoh03cYeT2tW6i8jc+nz6N2jxMWa3Aukkvy9XLyytw43YeczB3/QEvK0nfuja
	Br6SFijA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xO0Y9-006Tjn-1n;
	Mon, 02 Nov 2026 22:30:45 +0000
Date: Mon, 2 Nov 2026 14:30:39 -0800
From: Breno Leitao <leitao@debian.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, kernel-team@meta.com
Subject: Re: [PATCH] x86/sev: Fix kmemleak false positive for the RMP segment
 descriptors
Message-ID: <aukO-_uELcL15JnH@gmail.com>
References: <20261102-sev-rmp-kmemleak-v1-1-e6fb2eb96e79@debian.org>
 <036145d8-46b2-4389-afd7-26c897d09ce7@intel.com>
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
In-Reply-To: <036145d8-46b2-4389-afd7-26c897d09ce7@intel.com>
X-Debian-User: leitao

On Mon, Nov 02, 2026 at 12:48:16PM -0800, Dave Hansen wrote:
> On 11/2/26 08:49, Breno Leitao wrote:
> > Register the table with kmemleak, so it is scanned like any other
> > object.
> > 
> > kmemleak_alloc() registers a block of memory with kmemleak, so kmemleak
> > scans it and counts pointers into it, do it with rmp_segment_table.
> 
> Why don't we just kmalloc() the thing?

That would do the work as well, if this is an option.
