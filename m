Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572784;
	b=dU57yKR6644+J7wceOpMPMmG1taiWk9CDB41kjMQKe5CeFHQ23tivcJB1Y+uW0L6TDDL
	 jsRR0KQdHcEgdA/BvKXfCZtTrsMSXyPAPi27lUl/NcS7dkfc1tlhY5BcJV+FB3ptSV51X
	 uvh7XDk0Z3W2vA2uPLtMrAShc/Z2HywwfSDLLLIFdwWlbkafGhbscBzyKyDzZFRSDQs5H
	 62cAKqXZvELW6sY1rp121lvUlJdkFVpp7DiuV8Bonfc2BhsrQ8+f3afCwyMQwJG49dn4h
	 Qhy5eh7dIwuFDCakpekF4leGgUPvvERAUqv2wRz4DUQKBBJ9f/vKzSvaGB70fz/UaQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572784;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=SZ7d8iHBSE3Yrx5Iw+4Dii899rcTylqgfWPZIDQ/CMs=;
	b=G9B7jABU8h5n2wOROJkqeEuqdcX1eqGjFFD+1rCbggJDiwbGy0zU0eV2vM3pvFyZUJnm
	 zwp/7FCjE3XyeqAn7Cv8BR+Qb+Uo8V1+EN5YTyk+d7RRlagWr8boWU/0FKiWgwAjNq7u/
	 ueXfyhBY+T1UoDfkphTm4zxEJuMWJH8C3xxHXOxkJZOCH7XlZZZUoJiX0WRPJELHfhkxP
	 gaP/BdzluNB0amrUxtkk/tNREdsVudRQ3O2EvcSc6CFY1UnbwUq4I6YMZ0qY5CRlFkb2S
	 nRpBECVhOlwKyZudeF1yPZiu1Uv4V6ognmW5+P6kcpFYZsGwmLFOLES3LtD/rxMUE/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mc7t9jVP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890B606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mc7t9jVP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB701F00A15;
	Sun,  1 Nov 2026 22:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572783;
	bh=SZ7d8iHBSE3Yrx5Iw+4Dii899rcTylqgfWPZIDQ/CMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mc7t9jVPyyVRk4QaAxMEqk0zFAoyH1m8YULkAjdOI3SGmUZC7CcIPQUNMCgVa+rlQ
	 22sNRm4GON533GT/4FNSWlOIg0iKvcs8eDcEiSEIxNVbb8dwyByIrQhzFkM+NHTQBr
	 J47+zxDbQPIarTuU5uGwkyAJmEGEfsHb7Itd5Rl+PfhnihPW9PSpeasYGxaL48Ceut
	 172Q2ODXoJnaqeVkBDKJzsnTsT8EomkIDstmtL3RLyIyCuxJSUKxCJR469nndqn0JC
	 jGhRyfinP+7E4u3I8oLSNA3mnqQ1hoJTq5MF8y5KvJ78a6SRNh9/w3MSBY6TdAxWR/
	 GempdmlBSsiQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4023B391AF9C;
	Sun,  1 Nov 2026 22:39:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V updates for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357278179.2624073.8401504518480908201.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:41 +0000
References: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
In-Reply-To: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 28 Oct 2026 21:32:56 -0600 (MDT) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.4.  These are mostly
> optimizations, fixes, and preparation for work that we're planning for
> v7.5 - there's not much in terms of new features this time.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.4
    https://git.kernel.org/riscv/c/1b8b67503725

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


