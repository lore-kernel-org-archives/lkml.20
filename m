Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591503;
	b=gRmaFhV8C9xlGhwNCYzIlhazh8dHFCaV7LqUmaGhlJOYiMKFB7VuKLG48tcnlQCHGXiN
	 CM8ApDA7ZEGfqqpddZ86D1Of2YRdGgOPQhgee4KKYCqag5YuqpL/GUe/Oc+qkM+mV1YNj
	 OmXYfCsvqT1vrbmJAXuQA7iHNcs59nZCBuS1wG6FEDc3HDL2FJP+x3BIXgKyY/vlZ38Fo
	 YSADjFF3YDZw+LNtrNR04YDQDGciS062sMJQ3Q/oJ7qs5hO+Vx05h4EOFj1/zsdUb7b5Y
	 ZJ7plOANj5dTwYwz3jiCD8V43z3FlVN/c+Toe8Nc9zai4dlhaUBvMlr+tQjXUTINyyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591503;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/vEQn84gAZPrHx4pAFpxWuvDduXv3rV+YnfJj0Im7Us=;
	b=wYIOlW4ClvZw2bQuG0aLdYwCoADv5hsB5US6rHE0YByT//gl+OnNM1owbRhw192l1zBg
	 xFoN2/y5LTe/qm2W2yfzU1k6aSxNcW6/c6RVTMniXlZb3+jDtkCNnjVGaS/PmJyoG1quD
	 WkPM0ofRig50ItjHLRpnENb3pUvvlkSEol7ODFrsBh9PeqKsTYcaAOTRXgfjByxXKIKQv
	 MMGQf8cCye4rHHPmSBgqAGNPsyjQm2QTl7zdfFsUL4SBqi3SDtjHCh8tZ9UvmNS8WdhQW
	 FhemJ5ZS7pOnDqzwrtpZhhqIKlNn29fsDcUvIH5rKvMkbEMG9peuUgedyyR1FHUUGkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TxPzXIU9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EAC606D48C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EAC606D48C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TxPzXIU9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A50143D;
	Fri, 13 Nov 2026 09:38:18 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F1353F85F;
	Fri, 13 Nov 2026 09:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794591501; bh=Cjbcl8ElIDWqrJiJw2TSmOjKWxpV70lfEGVkWoLoSeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxPzXIU9otcEq3Hq6ZfjT/0vx7+pmj0aXDR3ihhQdaUmOCNXdHxAahFXi/KqssP6K
	 SmIf1LOcf32igdhKPHChMzTX3eN0bHR+2PHwAZZc4I3RPivqh4hsgGuorrIvI49767
	 a+SU2GJflKxi57gKxY1qxEybN1R+56/AllY0+JxM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: mark.rutland@arm.com,
	oleg@redhat.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a group-stop
Date: Fri, 13 Nov 2026 17:38:16 +0000
Message-ID: <179459121445.3758917.849284373049044409.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105113051.97810-1-zhaogongyi@bytedance.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
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

On Thu, 05 Nov 2026 19:30:51 +0800, Zhao Gongyi wrote:
> PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
> which calls ptrace_stop() without siginfo. If the tracer writes
> NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
> NO_SYSCALL before update_syscall_orig_x0_after_ptrace() checks
> last_siginfo. WARN_ON_ONCE(!info) then fires for a valid ptrace stop.
> 
> Keep the early return when siginfo is absent, but remove the warning.
> This leaves orig_x0 untouched at a non-seized group-stop and preserves
> the existing syscall-exit-stop handling.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! I modified the code comment
as per Will's suggestion.

[1/1] arm64: ptrace: don't warn on missing siginfo in a group-stop
      https://git.kernel.org/arm64/c/5306f124f317
