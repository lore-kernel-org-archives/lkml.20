Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1894A4F00
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265829; cv=none; b=sCfRKRBI/Cwy3ZVY5yPwGoFqQt+fVB4fWXQC+DYRzTWsfKHYSwrqpLB45okpM7uTFJk3wGfdwHV0s+pIb/tfJfsN0zRlMQ0C+HJWlXyOPq8PDytxaZeAw4y90JqG1elweIWMWTZHjruUd6WkmCPxguJNvkgidu6F+vyJgXMVkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265829; c=relaxed/simple;
	bh=1MIHQqUrz6J+9YzsEjJ6TwrjRv0LLv73pcMCneaPxHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ieDWuR5EN8rt0Z6+XnKkw4G9mtgapvBD0xuMfXtpe2LtQUDXrw27tamzti4DONCqfWursuQMKxgeBK0bLCkfr+DRnxsm9dQH+ZVmlkBJsyWJhowCNQxz0xvj422oFETcZQUVZEKKf0OKeGSwFrcolreAlFjQjpOq21SwmoNYqlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P1firPTk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P1firPTk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E36A11E4D;
	Thu, 24 Sep 2026 09:03:43 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45F7A3F86C;
	Thu, 24 Sep 2026 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265827; bh=1MIHQqUrz6J+9YzsEjJ6TwrjRv0LLv73pcMCneaPxHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P1firPTkB2oQV6sARzno1Z8WJ8QJjqB1bOVUr89GzricFQpMMOT+UQjQ5XzUUpk7c
	 POUnawhGwwYmSZD+ljS2pg/Ca+150Bfelb3Py14RZ3iVXqXKscxXkUp1TKQNZyH/C1
	 4GOif+fBd7hJLSCcCBcsaK1IEX9NeoFXJUVp8DHg=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>
Cc: Andreas Grapentin <gra@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: Use proper include variant
Date: Thu, 24 Sep 2026 17:03:37 +0100
Message-ID: <179026581764.3570880.1246463318810507401.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
References: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 12:57:18 +0200, Steffen Eiden wrote:
> Use <> for including the sysreg header as it is not discoverable from
> the current directory.

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Use proper include variant
      https://git.kernel.org/arm64/c/b64f41a7ace1
