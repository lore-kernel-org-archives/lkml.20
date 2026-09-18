Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569B5370D69;
	Fri, 18 Sep 2026 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716239; cv=none; b=D2+QLKNIUdSXHFXpuu0JVg+FABtvzot5ZJn4YRyvIfS2uRd8uFSaFHqkuQ6AJ5XhFOYPx0aMDVWjE4rDkwMH1h0JHMErsDLMTYXR6X7ND9+Yf15Zyr+kav+FZg2TYArW+w2Bhlm25ru8P1os4+SdkZ9e9ukPIOYS7ud9doYlpeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716239; c=relaxed/simple;
	bh=87/pdqB8NbPtZUvRUjJjSn3pnvl+ymXT3Q8hxNn01Gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OpG+Cx+2YA3BG8xm0L9uO1l50i8M39hvnAh6Ij7EASUEm6xp7D4gpohrtGSvVhPnkHc8NjqrLwOH+w6wMEurQcvEtCqNc4OrSJXxEdD8d/GQ5lKfUVuZBFe5LNK4KGdfA5RW427iPbzF0dE1wH5k3t+fZ6wAvEcNZHPU1g4+IZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlwaImEb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlwaImEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2D91F000FF;
	Fri, 18 Sep 2026 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789716237;
	bh=j8MXo79fJsTyRhqZQxYjNsag7jfTnv2nmXQU2RdxDMY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=TlwaImEbNtDUlgo8T9YVxR3Z5dcLcrPxuPt3CrvfR81YECGyG9vV+6Mzhzj8tO/qU
	 +Lv0wNn6oq9HCwA5eEy7MU6NyVSYCNNlsRGKJ44/TPwQXVDpXZYXHU2giFVTGKe9vu
	 QuEgPiboeXNAiXbNnjdi/vvLs9/baipo5i9x/4wDtyqdW2wpYw3x2Mc9TqIT/FK+Wi
	 wc9tnBnvQA7NzUt05nk3aEHo/yUj0FSrOpkMnHZJ3k/hgK4515ixIh9beaAnKLPYKw
	 iO0yOsYexPIpBI1f3oVCqfC23NXDyVS0/EtbiSOt4o3/+0E7QJZEChcz7Syr17E3Dw
	 +XRW5vrXU9JgA==
Message-ID: <60e88574-4a88-4473-803d-87a237555c74@kernel.org>
Date: Fri, 18 Sep 2026 09:23:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 2026 LF Technical Advisory Board election - call for candidates
Content-Language: en-US
To: David Hildenbrand <david@kernel.org>, tab-elections@lists.linux.dev,
 tech-board-discuss@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 ksummit@lists.linux.dev
References: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 20:32, David Hildenbrand wrote:
> The 2026 election for membership on the Linux Foundation Technical
> Advisory Board (TAB) will be held electronically after the 2026 Linux
> Plumbers Conference, from October 8 to 15.  This announcement covers
> both the call for candidates and the details of voting in this election.
> 
> The TAB exists to provide advice from the kernel community to the Linux
> Foundation and holds a seat on the LF's board of directors; it also serves
> to facilitate interactions both within the community and with outside
> entities.  Over the last year, the TAB has overseen the organization of the
> Linux Plumbers Conference, helped develop the Linux kernel's project
> continuity process, advised on GPL enforcement developments and the use of
> AI, worked behind the scenes to help resolve a number of contentious
> community discussions, worked with the Linux Foundation on community
> conference planning, and more.
> 
> The public minutes from TAB meetings can be found in this repository:
> 
>     https://git.kernel.org/pub/scm/docs/tab/tab.git/
> 
> Note that there will be an "ask us anything" session with the current TAB
> at the Linux Plumbers Conference; it is currently scheduled for 09:00 AM on
> Friday, October 7:

Captain, it's Wednesday

> 
>     https://lpc.events/event/20/contributions/2406/
> 
