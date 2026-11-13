Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591528;
	b=vs+c4RHppDhRGFbQmfj68QlfffEWq2Px1jOPj5tDKzeZ11AvMi9NzwF9CJxzk1WRbE+M
	 jssZB8Q7htLmcH/BeosE8PzddxAZdhe0u4UYzk7TTFMhtwr6OqoSw5ddS+T8dOlO38LWm
	 mYc+I+qqHs9o61Y5/8uoD1dLX2IvWANeSvraAn78jm2Jo/VJLC01LP1Uey4mvLf1PBdrA
	 VVfqX9eYGD6DNvROki+lduR0M5NmXAboENu/VfXZGO825Rdpl+McvsYQhSIFsqSrOwDgp
	 k0lyP98juGAov28KZSt2WNZ9z77owHhglb/gRDiUtQX0Q5pykuQKdMO7o6NPpSdF0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591528;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wb1OXX+yliqJmjn2ESkgHuebZuic8EqdBrdlJXh89ms=;
	b=U/ERUQxF3RSek/RvR3g3YC5WEAIiGI4WaXe8zIY7ZLOTOpch+5tBa2ySSQELeDIe+4ww
	 aGyZ22EG6SCSF7t7BNJx5auZZOd6cc5VvynoE4uSolQtFmoP02Q0Fzx0KXjmImrDXVJRd
	 gFFL8NNR5+sZf/oqjU7Ouxkeq+pfN8mhOV1TonWgXnboI6U2s5GkHbPHxrphoA0Ferx6a
	 6CwnlaVI27KlzIYMyX6d5rwHUgJeL33i2zLV3kBr3xkQMAiBaniq+01FgQQadmw/9wZAC
	 CsyznHUCbrd6nytBS/Jx7r8HiwPG7gmswguwi4zbOv40Xiqa0NPQaqJfgG6uzfIZW+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZaxXc6dg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744FD606D4BB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 744FD606D4BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZaxXc6dg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D082E143D;
	Fri, 13 Nov 2026 09:38:43 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45503F8C6;
	Fri, 13 Nov 2026 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794591526; bh=p3PS1SVNPQdF2HUhwZLzdl6Jo2D89+v/wFidAgUFVFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaxXc6dgXkbZA2sirb0dK5VwB39J/16ShYuz27ReoHwmF9e4cB0MGPPYD2JomEZgb
	 QwIHeCl24QntfFH7fZNvp8tUf6tZ+srD+EdxYJpQuDZt6sIOQ7m0VihlmwQXCHShcO
	 rMccEIa1A551K79aXv8Q7YUe4erVYGZra3eVoBSs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: syzkaller-bugs@googlegroups.com,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	syzbot <syzbot@kernel.org>
Cc: ada.coupriediaz@arm.com,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	ruanjinjie@huawei.com,
	syzbot@lists.linux.dev,
	vladimir.murzin@arm.com
Subject: Re: [PATCH] arm64: suspend: Only track cpuidle context for idle tasks
Date: Fri, 13 Nov 2026 17:38:41 +0000
Message-ID: <179459121446.3758917.12081688129224269638.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
References: <c49d0138-9e6d-40d4-b46c-518240685bf1@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Nov 2026 20:19:45 +0000, syzbot wrote:
> Commit 19235e472798 ("cpuidle, arm64: Fix the ARM64 cpuidle logic") moved
> the calls to ct_cpuidle_enter() and ct_cpuidle_exit() into cpu_suspend() so
> that arm64 cpuidle could keep RCU watching longer and manage context
> tracking internally. However, cpu_suspend() is called not only by cpuidle
> via psci_cpu_suspend_enter() (which runs in the context of the idle task),
> but also during system suspend via psci_system_suspend_enter() (which runs
> in the context of the task initiating suspend, such as a process writing to
> /sys/power/state).
> 
> [...]

After some pondering, I decided to keep Uladzislau as author. The RFC
posted by syzbot does say that if you reply with "#syz upstream", you
adopted the patch and your sign-off will be added.

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: suspend: Only track cpuidle context for idle tasks
      https://git.kernel.org/arm64/c/ad3fc05c7e65
