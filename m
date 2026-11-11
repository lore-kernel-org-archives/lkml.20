Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411665;
	b=D4C9i1/0a0nDlG6UmLsHkO7rEqwSLqETYG9jAp8qr9e1q71Jk8hI6h3Vc66GOcsbsWfM
	 PCx85Rao4oEeexFArcmb+UfEUZ+cmSP59WA2FSZXg37qPxwPcEg+qZQPrShfsGKZb9uJn
	 UAA62MJJ89KgSMDl+jDsmvjSu8Nsn0EloPiwKZcbTt5N4qCuOjbxA7+q6WBHyKSV2MN+J
	 PZOLFxKRLqrQV908elo507erb5k/6ocrIv/K4DwAUzokiCTCc5uGFcO21dzmAju9CE+Y/
	 9hjQFqPLebI7kJgbS2v3NY34IOsEzYeBPerxXuvrfhunaVUbQTBK8r67ZEOzHabbMrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411665;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V2RK/PzuSKL2WWoPvMWzGQDcrRR0IyUh0nU/ByMaJ4Q=;
	b=qtu8WoWNTeovavKEiHigHcvgn9Aicx+6lZww98EsV6QvCKhKwR7bnR595uqnuOxCQNbn
	 fJnQkGQ5rruVAqwoC38QB+mKSpVc3GmD7VzaxlWUdy/4Noy+sijU5xIpWdy4liqkGzdZf
	 do+qULB+MblVF0gvJI7AzEgVSaXUWRPINDCMPfRXgqRpkYBRi/h7ONQ1fZ1y9i5wxzzyL
	 3qxl7y1/tg0MvQLhnq4s2N37P/WQVbwYjhhhGpHNZO2lz1XmRUp8//dZQfrun19Tdgky5
	 wHEgIh7qlcKDfx8MEeOv89u+6aR0U+DjeFNA//+UN/zDvIh8JTAmr6ri73smr8+9dww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O4WjbTiC;
	arc=none smtp.remote-ip=95.215.58.163
Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81676606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81676606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O4WjbTiC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Eu89BSEwRX3HTJBZoUqF/4O/mFGX7rsk8i5L0YqInwg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794411661; v=1; x=1795016461;
 b=O4WjbTiCDcDDTMdSJmO9z6O9LneyWgZ7wTbeHGWbKKuIKNOs6rfmNleYSG+vuW3v8RyTnEak
 O6YENCmg/1/bgm7J7ogOmbEriJR6qGxGoQff97MRQxlRFymbc/LfsIl3ZGEEnU7zE5ekGAIspQ3
 mpWeT4TkDnsfoYbA/tmJTA1o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6d4ac561fa4402f;
	Wed, 11 Nov 2026 15:41:01 +0000
X-Mizu-Trace-ID: c6d4ac561fa4402f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 15:40:57 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, ritesh.list@gmail.com
CC: brads@mainlining.org, chleroy@kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 sshegde@linux.ibm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_powerpc32/modules=3A_Reser?=
 =?US-ASCII?Q?ve_a_PLT_entry_for_ftrace=5Fregs=5Fcaller?=
In-Reply-To: <371108c3-0314-4015-9ca4-d96a11f1e597@linux.ibm.com>
References: <80D9FEB3-9FB3-4878-BC66-74C13761CC9A@linux.dev> <371108c3-0314-4015-9ca4-d96a11f1e597@linux.ibm.com>
Message-ID: <23E9A6DC-579A-4B62-B35C-578A8E3389BD@linux.dev>
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

On 11 November 2026 11:58:28 GMT, Madhavan Srinivasan <maddy@linux.ibm.com>
wrote:
>
>On 11/11/26 12:58 PM, Bradley Morgan wrote:
>> On 11 November 2026 03:48:41 GMT, Ritesh Harjani <ritesh.list@gmail.com>
>> wrote:
>>> Bradley Morgan <brads@mainlining.org> writes:
>>> 
>>>> Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
>>>> HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
>>>> undercount the PLT entries the loader
>>>> consumes: module_finalize_ftrace() now creates two trampolines
>>>> (mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
>>>> ftrace_regs_caller()), while count_relocs() reserves only one entry
>>>> for ftrace.
>>>> 
>>>> So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
>>>> walk in do_plt_call() scans for a free slot with
>>>> "while (entry->jump[0])" and has no bound check, so once the last
>>>> reserved slot is used up, the walk steps past the end of the section
>>>> and patch_instruction() writes the 4-instruction trampoline into
>>>> whatever module memory follows the .plt.
>>>> 
>>>> Count the second entry, mirroring what module_64.c does for the same
>>>> pair of stubs.
>>>> 
>>>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>>>> ---
>>>>   arch/powerpc/kernel/module_32.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>> 
>>> Do we also need fixes and stable tag here?
>>> 
>>> Fixes: 7dfbfb87c243 ("powerpc/ftrace: Activate
>HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32")
>>> Cc: stable@vger.kernel.org
>> Hmm.. could the merger add that? If anyone merges.. :(
>planned to be part of my fixes PR and will add it.
>Thanks for the fix.

No worries, mind changing sob to this email?

>
>Maddy
>>> 
>>> -ritesh
>>> 
>> --- Thanks!
>

--- Thanks!
