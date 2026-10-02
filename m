Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ACC4A35
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966942; cv=none; b=br5beTiWb+zI4geTFJvZQ4MS+Xr17bQ1Hin322tyUsIB3hxvmsA3h0Q6O/Ajd2KtTevlXmh9UdF4ES8W1VpMjwkAZmAODlqyLQ9sjrnHkdQ6GCe9uifiORby4Mmb571JC+Y+74R4AWDQHvzz8RgXooCTUmYn/yzvV+kKU7a6CpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966942; c=relaxed/simple;
	bh=sK5tYxknClWdAbipyaHWWd/2P2JBuzpdG2B3l1itnTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tk9PS9qlb5xF7bLyr2PS8eqg3EubwZ4bTNn/FFKTkrYGkHFRt13QmeFp3pWm1OfVg6My8sCYP+oh08hErfvo9hP4L8b0swk2CishbTtEBhGSaQ/ZtWrnCwfBXKBmNneF8xjnMPma/5cMw3ZuxKnnEl5IgsSuBY3doVJlWjA65vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J5txP/ih; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J5txP/ih"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754962F;
	Fri,  2 Oct 2026 11:48:55 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D8E3F86F;
	Fri,  2 Oct 2026 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790966938; bh=sK5tYxknClWdAbipyaHWWd/2P2JBuzpdG2B3l1itnTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5txP/ih8bck06EuRngr+7zB63Fkc7cvc79d44Ech54BBRMQgq/9iRxrLautn8Gcm
	 CWUllr853SSvrS/jswA+HC5OYsctGlnrsNsj36dp28dEkInrRpCdJqkRpGfNpu7YBx
	 5OtLz09foehOym/HF++cccvkWoJWNTIGSNg/CIRA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	steven.price@arm.com,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	mark.rutland@arm.com,
	linux-coco@lists.linux.dev,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v19] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Fri,  2 Oct 2026 19:47:14 +0100
Message-ID: <179096683483.2356212.14994831758332175382.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930164930.1388438-1-suzuki.poulose@arm.com>
References: <20260930164930.1388438-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 17:49:30 +0100, Suzuki K Poulose wrote:
> If the host attempts to access granules that have been delegated to RMM
> (for use as an RMM object or Realm Data), these accesses will be caught
> and will trigger a Granule Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by:
> 
> [...]

Applied to arm64 (for-next/fw-rmi), thanks!

[1/1] arm64: mm: Handle Granule Protection Faults (GPFs)
      https://git.kernel.org/arm64/c/27fececa00df

This is needed since as soon as we add RMM activation, the kernel is
exposed to GPFs via at least load_unaligned_zeropad(), even in the
absence of guest_memfd.
