Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382114;
	b=iZZOqgTBLsxd8wylnqxcd5zUl5c+EBFHRMNwv+dkfNW/6lpu3z23DsOgi/z+TXtP6x4a
	 DD/lX3/yAp50cwWIkuScPpVod/1DdOGcgHhAO0EWaBWcCkvqXu7LSwIMzMl1EtPICTG5Y
	 Syn3pvJO2XF6OPnHiyzdxo4nwSX4bTPja0G1DKKvolBMCi00lGsHQKL6ErK7nT7K1BzdP
	 +lQxy1j+bl0qnj5aye6z9rGDbjCARmdQmbUtjMqaj+/8ha8HrSyDt6gNcCPpQruNjNKJ0
	 N1m+Z/+rtZdHRhb+g/7aawvBcIwSQGYkQyeSQrWz71ONUpGgqc9YH58qS9mAI5/vlCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382114;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wM6zMeAKLdvhkIpwxgAO3T4mTUK9pSOuQdsjhKR++rY=;
	b=AEYK6FOEAqFtwjMHIn8GzO4uM9Q9g7kgJGkIjS1lyhaYPJ5zpKaHiD+y96eBqi+7Ay7Z
	 9TMt99c16L9//0iUxUHy0AgDqch/OiOj53dQ8YnmDgQKpL5Zxmy27j4ChtstbN1rDd4j2
	 EcJVbUiMs8tMF4ylzphrkERnzgtUgY7D4AdOJjivGxOV1M6r5ZAVTWNrjFk+a2fNDIY2D
	 q1gXI1gsF9KgFSCk90fmrVNNtiPRiqhfH/vozWs00mvYNoG0DME0oxzsU05WuBAcsPztj
	 nyhSAAgsm24fb1uUWhUhUyYTCovoRK3ZeutPQe1SvBaDlejVoC7S954TKeYINggK3gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c+CWU2LL;
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1D606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c+CWU2LL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4r9aoLuyZuGjtmYUR9y2nIUFNZJAGpilVsCFbC4LjQk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794382109; v=1; x=1794986909;
 b=c+CWU2LLpeRf0/eaTmILa8H6V07zgC+rB7oJ85isthyud5xYC2xXpjyKcOSYxY7j6nvpLx9j
 4TDiZCIAUZ33OC0OIRCnwf3l7vrgUN0vfdEH4vktRWWegpfLpP05CHeQ4xr1+1pZl5M1P1vp4Ee
 gxvjqts5giRWzLo4QV29OUh0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8cfec852c9357b27;
	Wed, 11 Nov 2026 07:28:29 +0000
X-Mizu-Trace-ID: 8cfec852c9357b27
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 07:28:26 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: ritesh.list@gmail.com
CC: brads@mainlining.org, chleroy@kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, sshegde@linux.ibm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_powerpc32/modules=3A_Reser?=
 =?US-ASCII?Q?ve_a_PLT_entry_for_ftrace=5Fregs=5Fcaller?=
In-Reply-To: <jymk81uu.ritesh.list@gmail.com>
Message-ID: <80D9FEB3-9FB3-4878-BC66-74C13761CC9A@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 11 November 2026 03:48:41 GMT, Ritesh Harjani <ritesh.list@gmail.com>
wrote:
>Bradley Morgan <brads@mainlining.org> writes:
>
>> Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
>> HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
>> undercount the PLT entries the loader
>> consumes: module_finalize_ftrace() now creates two trampolines
>> (mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
>> ftrace_regs_caller()), while count_relocs() reserves only one entry
>> for ftrace.
>>
>> So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
>> walk in do_plt_call() scans for a free slot with
>> "while (entry->jump[0])" and has no bound check, so once the last
>> reserved slot is used up, the walk steps past the end of the section
>> and patch_instruction() writes the 4-instruction trampoline into
>> whatever module memory follows the .plt.
>>
>> Count the second entry, mirroring what module_64.c does for the same
>> pair of stubs.
>>
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>>  arch/powerpc/kernel/module_32.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>
>Do we also need fixes and stable tag here?
>
>Fixes: 7dfbfb87c243 ("powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32")
>Cc: stable@vger.kernel.org

Hmm.. could the merger add that? If anyone merges.. :(

>
>
>-ritesh
>

--- Thanks!
