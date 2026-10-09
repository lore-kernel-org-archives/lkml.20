Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E299A4E36E1;
	Fri,  9 Oct 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555612; cv=none; b=KNS5XDVdSdj+p1qRAB6zB0zae/xfJE1/lSZyCyhntmB3vUAMuZSmwMSRPqFSXPQwjYAzWCZbdVbwZ4qcQfiv4XZ+oLdQfdJTZGwKD2V1MJRaf3vCLfp9SwTW6csYMFebaKZ0smKys/s/MOqaxxaDApArFg6ckQO7C6xPvSEL87s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555612; c=relaxed/simple;
	bh=OjGKxXpJaFjdVOG5Ol2AwyL+NtDgFBCAiso2ZYhyLTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd7P/4i0dT6fRB4CaPYuzZUbU6/4YTfQhaVj61Kvt3YVwvuXYhSHTdnkHB/EOWH5lGGJCrkBnBpm2Q00HlO5MZmqzUFQ/Qk0mCQvO41r0tkWgBBS5dZMuwAm+2CK+Nz3Luy9EIKfsMKf+fOkZ6G4N1uVCcjC0Re8snZI3q562us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SftOsoAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SftOsoAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D371C1F00893;
	Fri,  9 Oct 2026 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555607;
	bh=hfizGw9RYkpI5EiT+JchxQEGoEgZV/MvZJPcW1lwzbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SftOsoAXny0HftFV9n79w8VZ3lZRTXm4UVRgeApKYG5MCBK4wtn5zbWZ5Ebriq9Ik
	 xz99DKPuRLSMgSpGE8kDMCRG3UiLOixlzzS8y/hlPWUzsVJ38T4b2pjt+Ijv0or/yc
	 LfSdsPg0nsQCELmJ6XvSulEeTjO3s5zjhL3X95kEOzGNUAABN5qYjIPc3bghiNQ97A
	 8j7wnt/VzrnOBWP1YlkkR1DY3cuUZxYzMzyDlO2MrQflDqB/HRbV6GAGa1PMPRkKym
	 sbIU3pH8sYItJY0tz/6Dw+l2Pi513lW40XlzgSSGidEzvKLeVd4YZ6dVnPT3EuKqLR
	 bSkcq0pnAb+sQ==
Date: Fri, 9 Oct 2026 10:20:04 -0400
From: Sasha Levin <sashal@kernel.org>
To: Leon Romanovsky <leon@kernel.org>, konstantin@linuxfoundation.org
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu
Subject: Re: [PATCH 1/2] agents: add infrastructure for agent resources
Message-ID: <asj4FCbBoca8TUK6@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <5dfafd6f79165526fe17774c55b553b7dfe4b3fe.1791499378.git.sashal@kernel.org>
 <20261009134025.GA11438@unreal>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261009134025.GA11438@unreal>

On Fri, Oct 09, 2026 at 04:40:25PM +0300, Leon Romanovsky wrote:
>On Thu, Oct 08, 2026 at 06:54:52PM -0400, Sasha Levin wrote:
>> +AGENT RESOURCES
>> +M:	Sasha Levin <sashal@kernel.org>
>> +L:	linux-kernel@vger.kernel.org
>> +S:	Maintained
>> +F:	agents/
>
>If you choose a separate entry instead of adding this to the existing
>"Documentation Process" entry, let's update the mailing list to
>workflows@vger.kernel.org. This is where all process changes are announced.

Hm... What do you think Konstantin?

I remember the workflows@ list was originally created to share our
secret/magical workflows, and I'm not sure that this one qualifies. We can
start a new list too if it's easier.

-- 
Thanks,
Sasha
