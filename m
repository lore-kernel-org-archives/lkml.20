Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928070;
	b=WkZ0PVK7tZ3pngsVOEoPxDO0IDO1BGcBWcjD0D1iKw01De3qudp6vFByZbsrXQ7oVCxM
	 PX/3tPZtM0Iq5huKWSx397FeEQ7ATe/ZF2bn4SbFBva/TY+O2Syt+kTZDfX6MjPIRD3jf
	 xE0hqe4OntQtsiOpiv0+6Jg+CPJwnX8446Fz1mO6V0MnYkuv+4gfye2b1JlbnRnHb0X6L
	 tQUqLw6h99Op1ktJn9pYzGnX4vxyzgScQ/qtCV3aUwnUlUNbZsQNShw2r68iB9UBjiMgs
	 xV7efiXWmux0LmzvjwXC+sn4eB9OQp7tJfyExZx5hoD5OGwU4eRHx5wP29AxdUgFD2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928070;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZPn2FXf8wRtQPu/fYDQbD47IkGLvCOhsivsvxNGUt5I=;
	b=KFATVB2qhNNj/uQaPkVVh2z4L2Xyj9kSlnaIBBSQ3TV6N6V8Z1CXh+p+maEPQuGAY23i
	 DoSx39FwFc++I2PnCSuwqL4QZd/0JplM1C6pZNSyGnC/AIrhn6LAn14RWu20/z0zMxDRA
	 4yy3ByIZZQGrLjNjfG8uC175aaj3mPJBiKGkMbU4sr/FnNkcQfaMf+t+tzLlZGqSiWDSG
	 ihQFzQJzTp3BfXyC64dwoxNzxKfd7/VLhi21xftQ1/w1NX9ZDm/VhnLEoSvnvYoou1DBd
	 f4O6kAhshjAgB08AY2VLLvTsakIX9DCUoZ9zKVf3ugZgl91N6unJM1dDQnZL5E3JMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRRHrh85;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8C606A31C;
	Tue, 17 Nov 2026 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRRHrh85
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA471F000C5;
	Tue, 17 Nov 2026 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928070;
	bh=ZPn2FXf8wRtQPu/fYDQbD47IkGLvCOhsivsvxNGUt5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SRRHrh857S6A3MqguuuG8FaD+W/SmXP+TWQNtuZUkaI+h4FRpt+EB4ggsZ1Bu/fxp
	 Irxg+EGPmQeDlfAHUkVFdmaCeeVaUV31q7qXBCjAyfhrY+bDRAsMQK7DPvRwOJqcJE
	 7QgXLCG3Z7IWKLzs96d5zsF/9OAzD1/RYFfCJWd7U6SlPzbacrhIU8EzRzsBp+GkiT
	 s0w20s5rijZiv4hImBq8lrMN6U7gaIp1iNfuFSlCgjFLpJO4CKq7TCHLJ/UU6eruj4
	 NP9sdGXf4IMJxcuyW8j+G4ska7It28NGsN4cMf9ex6n25E5KPNniFGetM6qO61mP5i
	 irzZjDVR5c4yg==
Date: Tue, 17 Nov 2026 10:07:49 -0500
From: Sasha Levin <sashal@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <avxtxScVa9KvUH_K@laps>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261117092723.GA124972@unreal>

On Tue, Nov 17, 2026 at 11:27:23AM +0200, Leon Romanovsky wrote:
>On Mon, Nov 16, 2026 at 03:05:15PM -0500, Sasha Levin wrote:
>> "Describe your changes" already asks for the user-visible impact of a
>> change, but changelogs for fixes still tend to say what the code does,
>> why that's wrong and what the patch changes, and stop there. Whoever
>> has to decide if the fix needs backporting is left to work out what
>> the bug does to a running system.
>>
>> Say what that means for a bug fix, in two parts. For users who aren't
>> looking for the bug: what a normal workload is likely to run into, and
>> separately the worst case and what it takes to get there. For someone
>> triggering it on purpose: whether an unprivileged user could do it and
>> what that would take, since a race that no real workload loses can
>> still be won by a program written to win it. Give the paragraph a
>> label so people can be pointed at it.
>>
>> Coding assistants are told to commit a fix with a message that
>> describes the problem and the solution. Add the user-visible impact to
>> that list and point them at the section.
>>
>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>> Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> Acked-by: Andrew Morton <akpm@linux-foundation.org>
>> Reviewed-by: Willy Tarreau <w@1wt.eu>
>> ---
>> Changes since v1:
>> - Split the bug-fix paragraph into users who aren't looking for the bug
>>   and someone triggering it on purpose (Andrew, Willy).
>>
>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
>>
>>  Documentation/process/coding-assistants.rst  |  6 +++--
>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
>>  2 files changed, 27 insertions(+), 2 deletions(-)
>
>Sasha,
>
>Since you're already making changes in that area, could you add a sentence
>asking reporters to provide the full dmesg stack trace?

In this doc, we already ask them not to [1] :)

>Many AI-generated patches reduce it to one or two lines, which gives no
>indication of whether the report is genuine or fabricated. Early in the AI
>era, I saw some completely fabricated stack traces.

Is it still an issue? We could add something explicit in coding-assistants.rst,
like:

   Evidence
   ========

   Every claim an AI assistant makes about the kernel's behavior at runtime,
   including backtraces, log excerpts, test results and measurements, **MUST** be
   backed by an observation from a real run.


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n760

-- 
Thanks,
Sasha
