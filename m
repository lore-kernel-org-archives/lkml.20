Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676237;
	b=Hv1jVLYyr9lQqnHGZKKl6pKa8xaCmfCKxA9jsD4y0LdVo5v7G4dSeGWik/bVt7/eOeiN
	 Eb3C+GIXzF8lqnxuMFP0HSppvjWv/TwTCyWwr2+TWUToZiQRzIPbCJ97mIIlXMYh5oMXY
	 LMvOQMo4TPIgnDDdz65iWSzCCwb+7QYlTTSIsbBxqwHMuOW/oMgSiwpTPy/02XaB/5wp3
	 0gZWr7I13jR3Bd5w+Wv+yVn39L0lbFOBBxmr0Qb4oC0Zgxh6e4qY8evTjeBmRtX5Grxzs
	 5eG3pPYs4e/gYBJ9jmhzWmszwyepuz6IaTF+qX4guJNsxR+vV8jNoCcGcvBPi6C5t5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676237;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=guiJ4aBhyGq0bfn00zMCo/CYuhvnJTZBmGSJvCGmgy4=;
	b=TPBq7byI362c+ypkepFB+KzkWjzyRufzFWKxVKMxh4EadJ2sLmheBDbXhI34B/WoNMqO
	 /ozyILmVoHV6BwUW+W498QcgX1VJmD5NZGI3q6CP5dAYth5AVIWbbX8V89yI/RojBy90b
	 9ea8DhvKLgFGSgp7ALgU6Vb1cPDMsZsqPeJ9Qq1OwmJ2gPpJaf7xUztFm7rUR/UiolLOm
	 eGGRpEl3KnFWA+xnCxTUXvu8ZMQhatzUhhHxu5MZQWdtSM0kHj320grzXLpByybDH44z/
	 Ebm8J+vtZQfzJC0W2QRnlKzv2eK+N+CdJDbq7mnIxg+RBVJWYwtJQ6fD8RF8XE2MdqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqS2EOF3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqS2EOF3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AEA1F000C1;
	Thu, 22 Oct 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676236;
	bh=guiJ4aBhyGq0bfn00zMCo/CYuhvnJTZBmGSJvCGmgy4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dqS2EOF3Z2QrUBNCDGMnS5+612xBithuHVMX6RMdNLt/jTiAZFsNXQxsIjmPT7wKs
	 teOTq/3nlswzTSfmSx06jQ1I3xxmtH65Ou+qIxRapAkoupGwRbH1YqRi4qEVHou4FO
	 jyrZsPWB4P/TagrkWN0MgXAuFuwiHrzvMZnZ6qpTwYH/Ot97qs+2b3GgX96tlMeIu7
	 W+Pz5xIa05G+td1gZPD3uDV7PC+BeDYDC4rzSjwNK+rfnwsmr5YdyGfgJuZ5k4tChs
	 EAEkheql0xAzkPK5mnd0VVcBwPCHEN0qA/W0cmiIJw3gGI/4MFxIzmu90vum4iJogF
	 FY+Y0HVKNb4HQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Kees Cook <kees@kernel.org>,  Alexander Graf
 <graf@amazon.com>,  Changyuan Lyu <changyuanl@google.com>,  Tony Luck
 <tony.luck@intel.com>,  "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,  Pratyush Yadav
 <pratyush@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,
  kexec@lists.infradead.org
Subject: Re: [RFC PATCH 0/2] memblock: keep reserve_mem regions out of KHO
 bootmem
In-Reply-To: <20261021211058.83483-1-azpijr@gmail.com> (Jose A. Perez de
	Azpillaga's message of "Wed, 21 Oct 2026 23:10:44 +0200")
References: <20261021211058.83483-1-azpijr@gmail.com>
Date: Thu, 22 Oct 2026 15:37:12 +0200
Message-ID: <2vxzqzhhg8l3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 21 2026, Jose A. Perez de Azpillaga wrote:

> On a KHO boot, a reserve_mem= region that can't be revived (new name,
> size or alignment) can be allocated from KHO bootmem, which the next
> kernel boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG preserving it
> fails; without it, the next kernel's memmap ends up on top of it.

What's your use-case? Why are you adding new reserve_mem regions after
cold boot? I'd rather avoid making purely theoretical fixes.

[...]

-- 
Regards,
Pratyush Yadav
