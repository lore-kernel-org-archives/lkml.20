Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A030ACEE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219620; cv=none; b=KA/BWXVOuxC8UM426Wz5vwjqZr8bxODM1dOmXWhFGj9onrMEaqvYlRL2eE6KBb3gmwasfvVknEJrszvQUXeWYE+GJ7c2VDU3eOIYfBfs+7qIkEHrEWFHk2yX01LcBI/RQTS9Z4BnsNu3lKE0ShRYhYLVJKRMskFohw+ZISS4w48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219620; c=relaxed/simple;
	bh=fVEvrqt6WjDpLD7k0EEIJMqpIf6dLHVhyJBZwjn0ds4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tGwd3dxeYhr6oaXrlB6R9auaCxxZuZ91hcOMAiPhRIS8IOfWJEoMiT88YNtR3118UcjOA9B86rWiI34/fuKMQHkCD3Hrxvp0X5u/xRZAwwob6fRbDBdCZTPLPNd8w8Mrt9ovcSunWtyLGuOf7pzHz+11Kb6Qf2WgTiIRP+R0luA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eld28IbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eld28IbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435C21F000FF;
	Mon,  5 Oct 2026 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219618;
	bh=k678DWlUUZ3k9HwvntazIqDsfedGb7Bg2oWOWK4FHPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eld28IbSGRFsMzZt7XBnJ3a+L1l3olWRiA762brUpoSe0SNT4UO8VFzHx5hIdV4XI
	 pMIu/wYK9OJCwcahBFziB3uzhTc85K1kJRZf3KqrHzDBH2u2LZy34/agz2UcJgQQ/8
	 McGubgH2ZtnrY3OK1gjVMKHpVqmHxbLXCaHpFFcOUuQU5UJ46k3hT9uzgOT+F3JxIq
	 wFZWyb0WWafnnww2gWQhvJ1S016mXMlKKy0fa59QKCXV14Zt5KS5XQ+9JoagBt2Iaf
	 vnO0wUA1zXG00Z60DDTAfsKCdAUjXBBtUzgMcMq1XWR9zsMjLOkux+ZWCmi/Zbspdy
	 FimOu+ef98EMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A30639263B5;
	Mon,  5 Oct 2026 17:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: crash: Add crash hotplug support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179121961677.1813719.4405826480158733209.git-patchwork-notify@kernel.org>
Date: Mon, 05 Oct 2026 17:00:16 +0000
References: <20260910032619.2477279-1-qirui.001@bytedance.com>
In-Reply-To: <20260910032619.2477279-1-qirui.001@bytedance.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com, martin@kaiser.cx,
 mindal@semihalf.com, fustini@kernel.org, kees@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Thu, 10 Sep 2026 11:26:19 +0800 you wrote:
> When CPUs or memory are hot-plugged on a running system, the crash
> dump's elfcorehdr -- which describes the available CPUs and memory to
> the capture kernel -- must be kept in sync, otherwise a crash after a
> hotplug event would produce a vmcore that does not reflect the current
> system topology.
> 
> Enable crash hotplug for RISC-V by selecting
> ARCH_SUPPORTS_CRASH_HOTPLUG and providing the three architecture hooks
> invoked through the override macros in <asm/kexec.h>:
> 
> [...]

Here is the summary with links:
  - [v2] riscv: crash: Add crash hotplug support
    https://git.kernel.org/riscv/c/dfc0c564b4b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


