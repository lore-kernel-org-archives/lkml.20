Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049174;
	b=LUjwtOsSB2aAKCiOw9SblTP3D1sxkL+iT3HFalVvMKMhVINTTLcURZYesTjaVEsGLYvB
	 0D7Gr0R2UNJ5RutHARQGEMPGPyfAsgvTEDZOmwWwhxlzekH9qSTS19JPw20WYoxgauu2F
	 KjaNjn3UrXV0/YEsEp5ehZw86X6Hyyf8q9MBRxUc8+BNpxDHkdGyfFHnWZbT3wO9da0a9
	 MbCFl/2/Bv7FJeLicE9D5orgbHo2VhHqJnfE9JYkz14474hq+yKxjGpNAoH3PUUBR/BhB
	 G4yJMf6eU8Yxx2/FZSlvwjLXgioKAcwGVbfgb3Qf9m44KzYxGUMC4LmkQJhi9OHc+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049174;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rDic6n19p+tKm6gJFnHdWsLjkBC8J9A48hzVn2p0tWE=;
	b=cs65y89hPUXjwDXRBL3truy61/B2BuYsZFjioqsz8TOrzH8NzW8x0F6CGhHrnoxYBC0l
	 zblVu1ngBEBdacbmOHEbpQHWLEos2G4qWrj4JUadMK/MLVe4mD4d1VtcgN06pRYWF17WZ
	 EqXu1a0uod9GlXk/2qsctBWHHThVuyCl1xCKnl38hOVcvluQNG0ZpVsGzbYxOhg8aSYv+
	 +tHAGe736rr15d7cdPs60PZNodtwAfhCzQ2atlIXeROtg2BUjmMI/O7dfI+nUG84F/GHD
	 UE+CsjxgKwCKMbLzzZYiBKb0Gp1XMiGUNEgahJ5HCpu5nKxEvMzdGdGpKH0lGsqFO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTWOVJsq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA533606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTWOVJsq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB361F0089F;
	Sat,  7 Nov 2026 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049173;
	bh=rDic6n19p+tKm6gJFnHdWsLjkBC8J9A48hzVn2p0tWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dTWOVJsqhmVHIkNdc9lhq8nOLai44lu0V2WeVfW9gl6t3I7xD0yUIQwDEr36UwZSi
	 1790g7LlB9CVojVs/V0Xk8rk+AZWZ4lgLVJOfUz+xe2Vf/YapPByxkmWZvcznfp7td
	 yFmcnA/YTioNEdIvWa+qeOyWMO4zZsze8dETZs0/jBKMMYZv496Y0FW8CCU6OF2OeJ
	 ycKToyQ8GqcUc3l7caQsFHWgfETCZGqUTvqL9p2wuUNL0S2EwhGISaUA5CKTTEvLa0
	 ilurnve3o0c3suUa41vAwtpH+00CS4z5dPQQmcB8MNb9WWu4AiEo24pw8MZCmCbljy
	 k+B7NOE+I1liA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	jbohac@suse.cz,
	david@kernel.org,
	hbathini@linux.ibm.com,
	leitao@debian.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] crash: keep crashkernel CMA pages reserved if activation fails
Date: Sat,  7 Nov 2026 12:59:22 +0200
Message-ID: <179404912275.1474561.15279136626327905378.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104145600.3708886-1-usama.arif@linux.dev>
References: <20261104145600.3708886-1-usama.arif@linux.dev>
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

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Wed, 04 Nov 2026 06:56:00 -0800, Usama Arif wrote:
> reserve_crashkernel_cma() adds each crashkernel CMA area to
> crashk_cma_ranges[] as soon as it is declared. If the area later fails
> activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
> inside it, cma_activate_area() releases the pages to the buddy allocator
> as ordinary memory. The range is still handed to the crash kernel and
> excluded from the vmcore, so kernel data that lands there is overwritten
> by the crash kernel and missing from the dump.
> 
> [...]

Applied to kexec-next branch of liveupdate/linux.git tree, thanks!

[1/1] crash: keep crashkernel CMA pages reserved if activation fails
      commit: e2b6a999e1df5bda2100262397260664655cd47c

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-next

--
Sincerely yours,
Mike.

