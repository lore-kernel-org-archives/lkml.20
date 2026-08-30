Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BCD3D73
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788069413; cv=none; b=VpjLtxBGdXxFT9X7+/vpYpfrbBqXfkOEJjnP0ca5CQHvgh4Pv0sfQQbSIDTbI7hDU+4atZgnLFriLMS15J+iJ9mECIkFJY7FXKg1sk6fqroUNP/VMscOQksu7a2V70dnLeXTAkqUE7yU3uGCHt4BVn0LIcE7dhLI961at8zaxtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788069413; c=relaxed/simple;
	bh=VENFEYda8DHcCLRRSHauEG2drDSWCGQP9BHN/lvHuyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E5AhvMHc5nPGDQi0rvDQCTmqFSAig1y2PCt1eEHy4Hf4HvaLKK8JpTCy+71uqCH40K0rwf1NtDDUJggeMMOD8LTBZ8/fEOLSgs1euLbYLfV2mPjtwNJsiCrfhycgHKOkOQYK8kBNOpWh+CAMsLZx5o2oPShgwsHgAILTrZ0UR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmhrAjI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmhrAjI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1B11F000E9;
	Sun, 30 Aug 2026 05:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788069412;
	bh=uQTC8zg/NrdKdpqhVB+dwQU08b62SCLTrV5YmBbHqqw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TmhrAjI8b5efU4eUBw2br8PyIXFEPkgZ1juvsqyFuO1r76EVkEPGvSIqetapfcVhJ
	 yK3OSnR/+84wqG6wcaWHMnlS98iA9D1tq9lAoJnQ7vZJlJh3wCVKCUdmzdd8TrgdA0
	 nZUOOSvv3XLivL3h1lA0GTqonuFtMXnIe6Iu+/H6VVKhB92PPr07QhCP5/wMippgg7
	 +TK9llXElsme+7wly2taUgS8hejMiR+G3bIpg3U0cZcooYVrrfaEsYQV2llS43SoD1
	 jK5hUcDyDEtQZIf3UW6MOSiOl34ZU1/IYnmvNkzkyeG1xOW8uEiitx8bO2SwCuwVJU
	 0WpGeApdDCyrA==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal Pecio <michal.pecio@gmail.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Subject: Re: [BUG] NOHZ tick-stop error: local softirq work is pending
In-Reply-To: <20260829201401.2b107cd1.michal.pecio@gmail.com>
References: <20260829201401.2b107cd1.michal.pecio@gmail.com>
Date: Sun, 30 Aug 2026 07:56:49 +0200
Message-ID: <875x0sduce.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 29 2026 at 20:14, Michal Pecio wrote:
> I'm getting these warnings on current mainline. Quite reliable trigger
> is I/O load (like md5sum /dev/sda) on an otherwise idle system:
>
> [   86.082138] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  117.959975] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  121.054544] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  121.988208] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  143.932445] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  156.083120] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  156.685222] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  156.789911] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [  158.986070] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
>
> I see it consistently across several reboots. I also did two v7.2
> boots with the same workload and these ran cleanly 10 minutes each,
> so it looks like a merge window regression.
>
>
> It seems bisectable, but maybe somebody has better ideas?

It's likely the issue being discussed here:

   https://lore.kernel.org/lkml/20260824105523.GA4121620@noisy.programming.kicks-ass.net/

There is a revert queued which probably will cure it for you unless you
are using Rust drivers. Plus a fix for the remaining Rust specific issue
is on the way.

Thanks,

        tglx
