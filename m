Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA5498E3A;
	Fri, 16 Oct 2026 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173997; cv=none; b=bV+eNPpsdcHMFOvlh+rXKFRApIKQCK4qiKkVvEk/WO8DPwWWlUBSZJB+2NOL2LS8Wj1LCb88GIa3EL8E26H+7n3pVbLbr+BciT/3Ytov4i6GllnfrmbGLk2o8T3azyWU45nszWfEC1GwbYgwaRUJhor+1tjHH11s5y8HJ7opIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173997; c=relaxed/simple;
	bh=rwKq/ZCSJMl04TN1T0VCYSJS78pUuz4BQmP+tdZUY8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXQf3NxR9uP5tDCra/xmhP4Oy/MTja3nt1gSggHFeLm30picnZd93WUdJMUQ1Qyn/cx5oUBlB5r184rOP4GkVAFbpqpmdEG5SJ2Bf/zchPzNjss3fAavheUAXiZxZUcS3fRlIQJBCtCt6N2mG+FAnzww7lJT3Gw/RDXlzavQL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEKyShtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEKyShtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A011F000C5;
	Fri, 16 Oct 2026 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792173996;
	bh=5y1KEx2GD5VxXPZX9aLZNhemglYajFbdAK4OVSP18d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEKyShtGYrgGKZDgNMIvGxuTF+VSoszE5U7FAXXHtuBWf9DoqBS6xWQvWU/ASlvsW
	 RrWmDNODdBd2SjqVdZRbgo5BrDR5JWOXishy9yaG94o2LEs5cLXVXHBAJaFfTsma8V
	 CHTQ+4T/AaTjVGoQxhY+/mYBjGa1obF5TOW9zOvbG3ED7spFAPnqUEsdP7+oqlv84n
	 WDNSDzeWmEiHSLRHkSd88FXkn9JTKfiWQYNRSQ/rXfJABqgLOz2KA2V79er1imUPhP
	 /zYkoZPfLkfPhilor++9+Ebe8XlZyVpC9fkL2u/GvceRxnfEqzV/Z7Tka0/CSBIR3J
	 z3uauO5D7xs3A==
Date: Fri, 16 Oct 2026 14:06:35 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
Message-ID: <atJnq_ssIAGK-OSZ@laps>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-5-sashal@kernel.org>
 <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com>

On Fri, Oct 16, 2026 at 03:58:53PM +0000, Alexei Starovoitov wrote:
>On Mon, Oct 12, 2026 at 05:34 PM Sasha Levin <sashal@kernel.org> wrote:
>> +Each confirmed site is a separate bug. It needs its own fix, and its own Fixes
>> +tag and stable decision, as described in agents/skills/find-fixes/guide.rst
>> +and agents/skills/stable-tag/guide.rst. Sites in different drivers or
>> +subsystems usually get separate patches, possibly in one series.
>
>I don't think it's a right message to send to agents and humans.
>When the same mistake is made in N places the interface is the problem.
>It should be fixed in one common place.
>This text tells the agent to produce N spot fixes for N maintainers.
>We already see this issue on bpf list, let's not amplify wrong behavior.

What I had in mind was the kind of bug our scripts/coccinelle/ rules look for.

I agree that fixing the interface is better, but do we want to push all these
agents there?

So I think it should be a balance. When the skill finds the same defect
in several places, it should also ask whether the interface invites the
mistake, and if so report that the fix belongs there instead of handing
back a list for N maintainers

What do you think?

-- 
Thanks,
Sasha
