Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279331;
	b=juzdOgZFishCt3GsBRxZPch9aZYdEvvHpl3BMAmDgicVyO13EvpX3LJ0MqYT9pSmUwmy
	 9u8yyhIjuQqIL211xxjYH6SwUnnsVHzv/URHDzeMh9CzesN2TapupNaKnsxCXTBYX7+QZ
	 O1Wb1RXN6zXLXRPgrT23Dkbco09rvHFWYXXl4B4kAiNw51IkknFh0XNqE9XNLnQNMajWF
	 6FGGumLhPMNLT6ow6skWQCxDafV6MsfT1gnSmI48RaYs/KUc9SdBCMhu6U6o2c1QaT1N+
	 JIuaUGEcrWiVF354YAcZQIMeLuCXZZxjMmlvYg3IetwBHOQolwyGGJOXOzGvvcRhSZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279331;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ulnoR1LuZXjO1PLYVItAnFkqaQ2zWr2sGxSL2AW3noU=;
	b=yi/CXFxNu0PoTXZfiLaJUxYz5EecFQW3tFguj195fSVelK2bXFPCLnDEY+lijZ9UVZTw
	 zf0lpyx/DV8dtLYKQeRih3VfaKjYkiNz0YdXsEjLb3z6ZL15dTRaMIXjflauZ1o0ezomM
	 7H6BYxCfDWRVp3xuW343nHq8LMerwb28coPMHyi67OtRbYFQDg7tChUdkFJltJ1CFmirj
	 iQPu1vMd/jQ9qvCI+QN3G25b47LsesCKheRdiyBej37Q9KFm6uEiL3I5uJCOs5jgDgQ8L
	 9s/FR+VlWh5TNkNjEnRNYaLDUYFERJ3AhSwFaCu71x+V4QANlRcCGbtz2h9x6BbroJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1V1+4qT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC7606DA9B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1V1+4qT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBEF1F008A2;
	Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279330;
	bh=ulnoR1LuZXjO1PLYVItAnFkqaQ2zWr2sGxSL2AW3noU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=U1V1+4qTzzbt1zK0XSTUpnLil+us8nYD6oyQqQTH8gZF258a68FCJ8BkJerBPcTcn
	 oo/oBqv9vIu9uCjOxkqbUoC1eKyQSxq4X6dA7GpPMxXbuGjf8EQTvY0Fud+YpazT9V
	 vQn/Ev1TfGpO8/IePLsUatt1qT23fgPARYlxETKwHPE4oESYz8Fdp7T/6IVY1aoFOu
	 WAfMEI7Z812D4TAwkS5qZHTcIujEPx85u3Mxzb0uc9peCLGfUNNaNXakTGqQ8hrCn4
	 u1kN8DthNJHvUKHzsGSHyj7DN1u/Bs7DGRtsUqfJL5xsBq+S9m1uqq3zywpFvRq+47
	 s3zmc2kw9RNUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6311A391AFCB;
	Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
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
Subject: Re: [PATCH v2] riscv: signal: protect regs->status RMW from
 concurrent
 preemption
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179427932911.3612825.4959198191364939243.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 02:55:29 +0000
References: 
 <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
In-Reply-To: 
 <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tchiu@tenstorrent.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 20 Oct 2026 19:24:25 +0800 you wrote:
> __fstate_clean() performs a non-atomic read-modify-write (RMW) on
> task_pt_regs(current)->status to clear the FS bits. This RMW is
> unprotected - it runs with preemption enabled and IRQs on during
> signal delivery (setup_rt_frame -> fstate_save) and sigreturn
> (restore_fp_state -> fstate_restore).
> 
> If a reschedule IPI or timer interrupt triggers preemption between
> the load and store of this RMW, __switch_to_vector() calls
> riscv_v_vstate_set_restore() which modifies the VS bits of the
> same regs->status. When the preempted task resumes, it stores back
> the stale value captured before preemption, overwriting the VS
> update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
> remains set - a combination that should never occur and leads to
> vector state corruption.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: signal: protect regs->status RMW from concurrent preemption
    https://git.kernel.org/riscv/c/d1a8d411533d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


