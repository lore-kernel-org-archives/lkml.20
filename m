Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514844;
	b=TzOqOVjKaJMOnyjMISBcZUJt7QNgoqLOfmJjtYVnLA5y9+/lwpa5qerPKeT2LakMwLez
	 tJuCQQL+z5A6xpFlZ9raOjqXMAJXIsbXNYPbZVowW4gvmFYn/SCuhtA9boZkD6lmh1yY6
	 k+v7Xew1pOV0KtE5Kt41K86lDCFYLprtKzXOygLyoBuU6i/ggW1DxBAMPw4w9d7POAeH9
	 0fz93PkDQCByvbm8wqL/NOMNjWuhNgtCRLuf12d9KQbF9TLVPYEPr4oLXWwnZ0H6fu0gH
	 3mKjjJQYfgT/7PYTurf9nlHcmeg6uk6qdyq8qcpfToCE4tVRKMKn6fwQ2o7xUuvvexg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514844;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3Mz6UVuX23RzMK9sBDnIfn0n/9lxOQ67gJKXIYwI0FA=;
	b=TzTrEBMWDYx3V9uqNpFAy767M8O/g1HE7Zc80T3rdoyaD2PyDd0x1i9TjpvZoc5kJ5yH
	 3xHaxznJybBcEPdz50Qwpk6qw70C7gcppnJKoLvU9Rl1FZZu/vlbiy9YgrsnxbmiP4ZpL
	 2QUbaalwdqeZZPeXFtMzF4IPyZeH27dGey5xbMpgv7MLKShxysNsWPrWCqKDlMQYK2kNX
	 XUaj8maVsofD+YOVmW1Skh0fi6NMHpCxj4etJdg/udtJ8/fIBpMqzTBtJ6SJfglmzycb4
	 l+yqKOjdJyXyi1RtuP28YX7AM02LHVCSfIuujXnkzzZu+Nl550ScdUuRRgdp990VNNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4272560A2621
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3811F000C9;
	Tue, 20 Oct 2026 16:47:21 +0000 (UTC)
Date: Tue, 20 Oct 2026 17:46:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: shaos <shawnq1@163.com>, Kiryl Shutsemau <kas@kernel.org>, 
	akpm@linux-foundation.org, Peter Xu <peterx@redhat.com>, Liam Howlett <liam@infradead.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] mm: mremap merge clears RWP state from an untouched
 neighbor
Message-ID: <atea2DbZ-LVi5OUq@gremlin>
References: <20261020110748.959870-1-shawnq1@163.com>
 <ateYC2eXPHuy3HK1@kernel.org>
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
In-Reply-To: <ateYC2eXPHuy3HK1@kernel.org>

On Tue, Oct 20, 2026 at 07:34:19PM +0300, Mike Rapoport wrote:
> (adding Kiryl)

Fix patch is at https://lore.kernel.org/linux-mm/20261020-uffd-remap-fix-v1-1-0f34fc181f0a@kernel.org/

--
Cheers, Lorenzo
