Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C803AA1BC;
	Tue, 13 Oct 2026 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891058; cv=none; b=CaW9G3a33TY2YqJ2D8UxeWiG8xjEt9qrcOZzpaa11kKqFoVbjfHtXKhRGkGOzg8q/A4hEgSLkyiDQOHNK2nP9Oz6a9tRO0M29lHN6WffpPUsJ4VRWndozikE6My+BbiBcuuG0/qYd4QRhzg1UZLDSqFjTLWS3vEnWXOer/sogtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891058; c=relaxed/simple;
	bh=RnkN4bY2Lk20tMpJYmBIHo2tjqMfj5MnirqzRA7j+1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhjFDSt2jgrT5q+xsYLrMuaNF1Thre8Ga1t60MvGPrLSu7cia8ZCWPH5uML8e4q6JdIugGMkuZLrQoUcEDo+F3dD1g1v3XdH0RfvC/M+qmNsK6oRoUe5YB8L6f8QefT9zyqM3RdIzbEsD33pi870Kvko4jTG4Cvb/b5GJSYdzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhfxtXBi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhfxtXBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1A71F00893;
	Tue, 13 Oct 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891057;
	bh=FTbF7z9gNlrYjkSRi4s6iYQzDYzP976uZAEpq2p99Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hhfxtXBiI6XRMT1Wi4jgQehRoZatyoXyOcDA2bejwphZAb/uZdRhCctvs/wdgeIJf
	 2DlCunDQknuJMaweO5HYTYH2rEfDynyxx1bBE/y2oskkqkeulgP4aYx0N+ZvfdJwa+
	 5dhPBfPWf9s4ZXHAbGZrZnwEm6gwjvgh0WT8dGPH9zMUce38inlBPxw+NIjpN5+Yq3
	 yBHvEubxAEBjh2/WdXahMMB92Kns8R/MResKPAPda51FytFDORQmQqnWzbdaMoBHx8
	 G3ltTijY0k/F2hexpFe9syoxma+bBqKr6P3HYgO7+uG1opGoXm4XBYEwFicKDZf4ko
	 oYWognff4o7tQ==
Date: Tue, 13 Oct 2026 07:30:56 -0400
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 3/5] agents: add a skill to determine stable tags
Message-ID: <as4WcN0UTSwC4Iy3@laps>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-4-sashal@kernel.org>
 <202610122057.6091D70BB@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202610122057.6091D70BB@keescook>

On Mon, Oct 12, 2026 at 08:59:31PM -0700, Kees Cook wrote:
>On Mon, Oct 12, 2026 at 05:34:50PM -0400, Sasha Levin wrote:
>> +A stable tag in the sign-off area asks the stable team to backport a commit to
>> +the stable and longterm trees once it is merged in mainline. The tag syntax is
>> +described in Documentation/process/stable-kernel-rules.rst. Deciding on a tag
>> +requires knowing whether the change is stable material, which released kernels
>> +contain the bug, and whether the fix applies to them.
>
>And I really don't like this redundancy either. The skill should be
>strictly as short as it can possibly be and then aim at the _existing_
>documentation. If agents are getting something wrong after reading
>Documentation/process/stable-kernel-rules.rst, then we need to add the
>changes _there_, not in a parallel agent-only file. I would want to see
>all these skills designed to give the framework needed by the agent to
>find the _existing_ documentation.

w.r.t to your comments on verbosity/duplication on a few of the patches: I'll
try and reduce it, and will run the local test rig I have for this. I'll see
how we can minimize them.

-- 
Thanks,
Sasha
