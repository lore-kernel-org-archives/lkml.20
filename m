Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794765;
	b=aWwfCbdQ832W3roDyZoUXWTTMWc+QmThwg6c9F29CbjPC/G6EBSqEYrm+zJzmUYpjhEQ
	 Il1WOdAwlo1Tqngr8YUzf66JuExMrG943N6j4msVj9io0DpXqUwT4nXIwIPc/p/wowZZ1
	 R54bSNgPQRRPmw2ZvGdw3hE6lZ6a2VaYqmvwvu+m3NA7wmjJ6aNW/QixJfW7iVIkUJZZP
	 dDbrxa6v0djeLIcVLZLmmNE+VNjcmU5V8onRJauMqNO7cqQdyMFMSyzL5EZJT0nE4tW0v
	 YoC7bxTRc2iDwWh6fG8IAE6gaSJ9uq5iM2sMCDSfGlYu8DaiZdwHy0n0zR376RBBDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794765;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=qimrld6Qquu3/RsDXXsu/ihBQCwzuzT0jn+pZL1CadM=;
	b=0FbcH1MzCli2rO7zTYBB1A3J5PEeJSkdaFmNhYhRPxCiMqec1XnAaJ9oLqcJq9sOkShS
	 Vl1MkGJawDLLnR7ovk33rcj3wrlU2pdp2ybu7xXsbx2bw4YorbMcq1E9CYLzxi6u2oOHm
	 R/qf85scp8/eczxH45dHnwRVL2zfIq9FAE8DW/ox8X6fG8qyYbNr2MSo4V6MbmR2H3g1P
	 A9iRBwSivchuTE79Ynmz1062wqnNWoVUEMGUgL04HXQP3FqCTj5glMOEc9sTKrW+ZwWOT
	 ZdlHq/G/kuBtOZz2HXtmqpLOpqCO0f19xOjQypy+yOM++WbFgcgfVbQjyS4MZ61qvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b4/4svk5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C9606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4/4svk5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B771F0093A;
	Wed,  4 Nov 2026 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794765;
	bh=qimrld6Qquu3/RsDXXsu/ihBQCwzuzT0jn+pZL1CadM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=b4/4svk5xILGPqtP0/hwSWfdCQyIEn7TvGLMRqs6SVM2qgtnJStNRGARXPHXsGO/W
	 JbY1D+VPYxoXvMZmIlWgfmJ3yVe14wVT6w08BHZTT4TgPKvw/xJlozDoibhyjndx5x
	 z6/QCycXlGIj4lV7LBOdScLxYtYkgITbtLogDDXqe8DG5AMY7YzqQCdY4pGVg7g77k
	 z/L8LNVlOQn9lueTtR6Dxl3fqSQa5pLTzmcN+FTmzmE3uDIAmpHRv/xNTC3PE6CQ6w
	 CPexOQidh7O5eMEfOFfg8ShJFNeW13SLdMLDCd0GA+SVTueP6vY/QYGWfRBvh9XvTx
	 byUQEBEzPkFxA==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Andrew Morton <akpm@linux-foundation.org>,  Kees Cook <kees@kernel.org>,
  Alexander Graf <graf@amazon.com>,  Changyuan Lyu <changyuanl@google.com>,
  Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,
  Pasha Tatashin <pasha.tatashin@soleen.com>,  kexec@lists.infradead.org
Subject: Re: [RFC PATCH 0/2] memblock: keep reserve_mem regions out of KHO
 bootmem
In-Reply-To: <70686061-787c-4c99-ba5b-ff982c8cc2ad@gmail.com> (Jose A. Perez
	de Azpillaga's message of "Wed, 4 Nov 2026 11:50:02 +0100")
References: <20261021211058.83483-1-azpijr@gmail.com>
	<2vxzqzhhg8l3.fsf@kernel.org>
	<32dd1f28-db55-4674-99bc-74d9d3ab25db@gmail.com>
	<70686061-787c-4c99-ba5b-ff982c8cc2ad@gmail.com>
Date: Wed, 04 Nov 2026 13:19:21 +0100
Message-ID: <2vxzfqxglrg6.fsf@kernel.org>
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

On Wed, Nov 04 2026, Jose A. Perez de Azpillaga wrote:

> On 10/22/26 10:16 PM, Jose A. Perez de Azpillaga wrote:
>> On 10/22/26 3:37 PM, Pratyush Yadav wrote:
>>> On Wed, Oct 21 2026, Jose A. Perez de Azpillaga wrote:
>>>
>>>> On a KHO boot, a reserve_mem= region that can't be revived (new name,
>>>> size or alignment) can be allocated from KHO bootmem, which the next
>>>> kernel boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG preserving it
>>>> fails; without it, the next kernel's memmap ends up on top of it.
>>> What's your use-case? Why are you adding new reserve_mem regions after
>>> cold boot? I'd rather avoid making purely theoretical fixes.
>> 
>> I don't have one, I found it through the TODO. a different reserve_mem=
>> in the cmdline passed to kexec is enough to hit it.

If there was a use case, I wouldn't mind fixing it. But I'd rather not
add code we don't have a use case for.

>> 
>> if it isn't meant to work across a live update, would you rather have
>> reserve_mem() fail on KHO boot when it can't revive the region?

This sounds good I think.

>> 
>
> ping, I can send a v2 either way.

-- 
Regards,
Pratyush Yadav
