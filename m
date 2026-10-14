Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149A84D2EC3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977257; cv=none; b=hlfUYIrHQT/eyLods8RNqEm6an2yS86msf2lTmRUWYRD8f2SJw1rwwjIUd11Yn4egd+6OUUo8LCqx8x6s1HO4aPHS0Lg/70SClHhu/dvSXCUJmLIehT81WscQxKqdQOGAvnXDG1zHvI82fC0KxEBqTqlxtjWYnnAY3QdPT2ZpvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977257; c=relaxed/simple;
	bh=zuv6pOOWeLAKZmBd8Ansq+o08TNWLk8Kd2TVb0TmpKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFR43Dvl3bEIvR/DRCYxsJRJz9H+Bvf7oofZlGHUzuTb08KYKB5HgTSpUlnA893auCvXKT6yziZnGpzjZv4VkiyMdP/03bxWc4mOlXV85lL/8OLMus2XyRdS/gS0kzoaC8YRnHgZ5RUQDLjrXPWEY//tTx+CS+dLMJQvMhUxk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ORI1kCjs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ORI1kCjs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAA201595;
	Wed, 14 Oct 2026 04:27:31 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5AD33F673;
	Wed, 14 Oct 2026 04:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791977255; bh=zuv6pOOWeLAKZmBd8Ansq+o08TNWLk8Kd2TVb0TmpKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORI1kCjsFOhguMPKfDxA3H0tlWs6BladvmHWBa1oKwZrm/ardftjBtzcb+3SLZjDh
	 zGp+h0d/LtL+UlmLz07uvvInVHM5aiXUQacSJus7c5+A2FkbeQ/lAqmUbJoq9BlycI
	 6Ol+kqlswpmnOCOMwWh1u65eBjz0gDe5e1jllucU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kohei Enju <enju.kohei@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
Date: Wed, 14 Oct 2026 12:27:27 +0100
Message-ID: <179197724762.2616400.14263026474127319284.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
References: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 11:43:23 +0900, Kohei Enju wrote:
> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> realm_config::hash_algo is currently declared as unsigned long.
> 
> There are currently no upstream users of this field, so the mismatch
> does not cause an observable issue today. However, a proposed series
> adding support for Realm measurement registers uses this field and
> exposes a bug caused by the incorrect type.
> 
> [...]

Applied to arm64 (for-next/smccc-bus), thanks!

[1/1] arm64: rsi: Correct type of realm_config::hash_algo
      https://git.kernel.org/arm64/c/c83237edf0ad
