Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990202;
	b=wIeMTg8u6Qmr88mLBkmVbEFkvqNXWOvQS1bXrtPmHFrVYpJW++TNPqCaOhVBFs7c0hFu
	 SImY3pTevr3jedQUar8Lud5lRoFNZN8HM0rtnOUH9Y4gVipN2iqhW2tun37VcNuUV+1LQ
	 d1XS4v2Lx/Ys/koekqq6PH+0tboDMUJ8WVx1fgoW3xAQkzrImxE05rJ/azMsNplyBCXAS
	 lKOcIYqSEfXGvi7ogQsJEFlvgABHxZBmWsyj5nfRg50d8kgUJ6y6+YPRerg5idKJXFZ9t
	 Ac/fMxTM8KFFElLUxvbj9P+0z5CpE6JDlF4L/kLHxvtAgPgQDL+YgmzT7eFs13YIkEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990202;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=6/HJnC54xU4S0Hwp09zNKNs21RBXVSDeqUj8nn08OOw=;
	b=DVbBRhyuu6on1uv3J2cNekwJOwheUeae9rlzgPHLGr6GtRzpX1c+UB7J/vWE7mO/47Q2
	 wpcAPSmXEHMmtAd6zhG3TPb3xmIdhQC0Zx/AJHdoK1w2x+OiQsPNmbrhJu+OZBaq4R9mR
	 jgd4n/7CCqaYAoycX9nYrAiEXMR+Q+oKchuIK4oFmRzXalAgFCc4Q0xN/mes+dxPAJaif
	 Vz06gietoVEn3yDrlc8ofIJrWsbe0NtznsOn56dPmgK1dbpXFqKRF57NJlIshwvTsk5XF
	 Uzs1HZ+uGlOlMvzeYm+QsyIRiyURdN5k6h8UqnYmIxLwcWduRBRu5uttDZi0cDfxp8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JT+SQu3Y;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27789606D836
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27789606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JT+SQu3Y
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 179C91650;
	Fri,  6 Nov 2026 10:36:38 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135CA3F673;
	Fri,  6 Nov 2026 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793990201; bh=DJjEZhP5Hy5E4GIWKPZ45otGa4lVGkLO7vzlBu4usdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JT+SQu3YQ1o89rLEfEpFBY/gtK5kQSw5qoBcowIssxFIvLXuWcY/Ey6WtPOSCFI0q
	 yikpABqzrNIWL+XIgFGxcJLqcH36TRP6JcTQviG17Bsfw4iL2tgs9774t/Pj69P9Hd
	 x7F7WYaMjFsHJZ2JoVMv7JPgqQgGlbYBcEUDe4TU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kirill@shutemov.name>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Breno Leitao <leitao@debian.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Huth <thuth@redhat.com>,
	Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: sdei: Handle exceptions taken inside the event handler
Date: Fri,  6 Nov 2026 18:36:32 +0000
Message-ID: <179399019204.2520879.14405140378460696016.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105120835.3321912-1-kirill@shutemov.name>
References: <20261105120835.3321912-1-kirill@shutemov.name>
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

On Thu, 05 Nov 2026 12:08:32 +0000, Kiryl Shutsemau wrote:
> An SDEI event can land anywhere, and a synchronous exception taken by its
> handler breaks the context it interrupted:
> 
>  - With KPTI, an event that lands in user space runs the handler on the
>    trampoline vectors, whose current-EL half is empty. The exception
>    loops there and the CPU is lost.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: sdei: Run the event handler on the kernel vectors
      https://git.kernel.org/arm64/c/9bf6ee7952c7
[2/2] arm64: sdei: Preserve the interrupted context's exception registers
      https://git.kernel.org/arm64/c/58c1eb84e977
