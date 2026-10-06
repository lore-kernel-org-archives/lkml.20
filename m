Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A173C3434
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327391; cv=none; b=HWu8fSN9S/dTya8k2GkykcPARpQKpeiaNf0VlaK5MoRutf7gKHBTV5LsD9Vl4TED9rUjuwx2H2PNZ+vqc6ewqyPR3QhavH6rAynFgkusV1ME1ReSVX0arRJT+m0ReT3h1/+Kp6adRW/4+5dKHL8dLt5nbjvKlWeWuKpQtBciakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327391; c=relaxed/simple;
	bh=um+qIoApyaVnaKhorlAM0Qp4AS2ODk/T4799912pnYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I36NakhUnMk0Q7p1tr/A1Vyn2ocUOAbmFpgOZ82GDU5HMd4aAj69nNxg+Y6HfM2bCcuHQwln8Ftk5psgp3ot1TnWMyyiO3Vs6rQ9zAcpgUsdxzYMrNKPuEJOw0ZZIRNWQWE+9CLgdYOW1A0XUssOOsiUdlHcnbDma+lPyNGWx4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QOLSlafT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QOLSlafT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC2081477;
	Tue,  6 Oct 2026 15:56:26 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FF803F86F;
	Tue,  6 Oct 2026 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791327390; bh=um+qIoApyaVnaKhorlAM0Qp4AS2ODk/T4799912pnYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOLSlafT7TwqL6NBkHzEg5x7Hp5ODbn3MF/9GoONUcO2PVGu5V7majSi3CDnZKrX6
	 0++2L3X2D3eqXJuKp2tiRzC6g1yZU/kyBbBfm4R6pnI8LxK+m+A5w9f889QH1PI5//
	 ON1Wec0fv4S2jNfosRGjnpbyeV2EiusyT9JopYuc=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>
Cc: Will Deacon <will@kernel.org>,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL
Date: Tue,  6 Oct 2026 23:56:17 +0100
Message-ID: <179132737741.1340208.13691312291433081062.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003131208.2023223-1-ben.horgan@arm.com>
References: <20261003131208.2023223-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 03 Oct 2026 14:12:07 +0100, Ben Horgan wrote:
> In mpam_save_mbwu_state() the monitor values are read using __ris_msmon_read_locked()
> which checks if the configuration provided matches that in the hardware and if
> not then resets the monitor. To avoid resetting the monitor before reading the
> value that needs saving only clear the configuration after the monitor is read.

Applied to arm64 (for-next/mpam), thanks!

[1/1] arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL
      https://git.kernel.org/arm64/c/197a7a41e6e0
