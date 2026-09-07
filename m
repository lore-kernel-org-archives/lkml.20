Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753A46D2A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776669; cv=none; b=ClV/eKJiMDFndTx/3uTUNCl5pNXCIwSRGHeuoQSofTm9nEBz/THGAoT+oxEaDrUYbufnlaAMwCWQzJ4w1D2mF/X9CS8bklbZN+l9HcAa8PQQR3KgPWEHSm+17pYEQp1a5wlMUtiJwznAcSG4wNpGaxdqm9qEYkC6YBEFeCJfNCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776669; c=relaxed/simple;
	bh=Qdrm4DNBYm5dX7L6mU3n6kjCzAA9iq8Muamy4PiEFn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6M2IlnMpLFNqcN1UUX1KbD4M7ATBTkVefSm9DfDtPUBty/FIzLeYyVOG37rqpBIzIaL2TvqGO8GRQamD1cLXfzmTlyEBbD1O4d55U0io51nHg+vhKQeGoFdsQCGrypXxkivL4/XuumK6bYFoRR3+3N7Zys2AXs5S9UvZarRaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jXPzfFxX; arc=none smtp.client-ip=91.218.175.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jXPzfFxX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Qdrm4DNBYm5dX7L6mU3n6kjCzAA9iq8Muamy4PiEFn8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788776665; v=1; x=1789381465;
 b=jXPzfFxXodFwCehoxicliV7n6rXK8tL10JO3L02fST/m0SbITPVMsFqJt/5Ew+Diy0YF9swX
 LyvcK9QLMGzlnjvP4pyGEZ2TB9tZWbF7uJjRGRHogD6/4UgJ7dYgzPY3XXtlCW+3qbXDG17P3FK
 +CE472NHNPt7+m/y2R31wvR8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06a3db8f22e82ea6;
	Mon, 07 Sep 2026 10:24:25 +0000
X-Mizu-Trace-ID: 06a3db8f22e82ea6
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	changyuanl@google.com,
	akpm@linux-foundation.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Kexin Liu <liukexin@kylinos.cn>,
	guodongtai@kylinos.cn,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] liveupdate: kho: calculate per-node scratch sizes before allocation
Date: Mon,  7 Sep 2026 18:24:14 +0800
Message-ID: <20260907102414.18958-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ap3IFd2FVvfKkHkV@kernel.org>
References: <20260904025101.9959-1-dongtai.guo@linux.dev> <ap3IFd2FVvfKkHkV@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mike,

> This reads as LLM-generated text. Please add LLM attribution as per
>
> https://docs.kernel.org/process/coding-assistants.html#attribution

I'll add the Assisted-by tag.

> Can't we just calculated all the sizes first and than do the allocations?

Yes, I'll rework this to calculate all scratch sizes together before
allocating the scratch areas.

Adding Sourabh to Cc, since this relates to the scratch-sizing discussion
in the PowerPC KHO thread.

Sourabh, this patch prevents newly allocated scratch areas from being
counted in the per-node baseline. It does not address the overlap between
global and per-node accounting. Could you review this approach as well?

Thanks,
George
