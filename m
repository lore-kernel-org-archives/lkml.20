Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521176;
	b=nqoDnJ7EgWU7CBdQyF7VO6Trped4FRGET4FJJnKNSaSBEU1P66/jreEqkx1L3aGH7/A/
	 MwQuCViYSbgTQKuWkaRpX2xvh64IMfKIcNMs17AVKFseezm8+PlG8FnCDixOimL/c1iwa
	 HdMOloZ1ou82ObWGMpRYshb/GjUKj8/EQ+Nu8at0lDeCbT0htJtaHhP/KAbJClhpjMv43
	 RLRKBkf9AxVVG0IMv7kI0o1KxSkGd6E2nYEsK/m8B1rNWbw+q7ycd6ldfNnXu4faImjtA
	 GbdDsb3X0WZy4y7dH438KA6ElG9192D0qSHw7RxxJ3v6cRll3W9Ea6J9qxo+zJ/BtbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521176;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VVpuWYwkWD/9/HNw8SQdi33UO4JldlQknYGbD5fRVbE=;
	b=oU+rvp7PzEwCevJmXC5FiPMz5qejURvE/z1IrGqNt7pX9+ZvmMPtJkFoYVRPYu9FxDlG
	 eGRwaVLD8GDoMdTDc26hmSFytET0xmT2kFQx5srysyV70ZTZqgk5FbIO8+NBnzLXFXOf7
	 mWzIXlypM10/3Q25KQUKnCwr7GCSUe1E90iQZHq+GfAfLMTapuXxFV05ge3MZFlIOruVT
	 UdfVyTfhdK4ovMMk7qV6fmoIECTTKLAAZKOd3FXe6S4qVqztbqw0Ns35V7PAv8QB3D+yb
	 Tz7pmvf4vvzeFwpdMu5jP6plKSNtB7PgPxlKgODlXXcZu1MB3FxkMI92oxvRQtyYg/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eiFDJWYL;
	arc=none smtp.remote-ip=91.218.175.10
Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eiFDJWYL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZaL8y2eN1FweU55DX6zD7cbfGbNsVefal33JOq2RRQY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792521173; v=1; x=1793125973;
 b=eiFDJWYLuxc1mV1IP/6Y8R94SNfhTmenqK8tTKp0K2hezy4gu/ZrXgBdJAADVVtEFhB75pvP
 zN6s7N5vafqm5BmR9EdKwQu+tB/WK88I+7VsREfiEkOMTrB9BFv9jjg2JsNnvATwOHqNPSldGji
 jOJUmvJ2cG3PBQTmcftZ9xdU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2e1178afebfa25aa;
	Tue, 20 Oct 2026 18:32:53 +0000
X-Mizu-Trace-ID: 2e1178afebfa25aa
X-Migadu-Flow: FLOW_OUT
Message-ID: <d2369629-846e-4fd8-b567-a0fd8863256c@linux.dev>
Date: Tue, 20 Oct 2026 11:32:48 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 00/11] bpf: Scope callback arguments to their
 frame
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Amery Hung <ameryhung@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>,
 Nicholas Carlini <npc@anthropic.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261009202759.50520-1-ihor.solodrai@linux.dev>
 <DM6EVHTVM3IR.3RCFLKV9WC80J@gmail.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <DM6EVHTVM3IR.3RCFLKV9WC80J@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 9:42 AM, Alexei Starovoitov wrote:
> On Fri, Oct 09, 2026 at 01:27 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>> Introduce REF_TYPE_FRAME for this use case: a reference owned by a
>> callee frame, dropped when the frame is popped. Tie each argument to
>> this reference so callback return invalidates it and its descendants.
> 
> Another idea...
> The id is owned by the frame. Can we keep it in bpf_func_state
> like diag_frame_id ?
> release_reference() already takes ids that are not in refs[].
> See unmark_stack_slots_dynptr().
> Clones copy parent_id and slices hang off dynptr's id, so both are
> reached.

Slices are not reached. A slice's parent_id is the dynptr id, and the
walk from frame_id finds that id only while the dynptr is still in a
register or a stack slot. R1 is caller-saved, so the bpf_dynptr_data()
call that creates the slice usually clobbers it.

This can be fixed in your diff with:

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index bc12df55d2e2..57859c3baeeb 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11470,6 +11470,7 @@ void mark_frame_scoped_arg(struct bpf_verifier_env *env, struct bpf_func_state *
 {
 	if (!callee->frame_id)
 		callee->frame_id = ++env->id_gen;
+	callee->regs[regno].id = callee->frame_id;
 	callee->regs[regno].parent_id = callee->frame_id;
 }
 
i.e. the reg is its own parent again.


> All setters have callee already, so no need for patches 1-3,
> REF_TYPE_FRAME, frameno in refs[], the reg that is its own parent, etc.

I don't quite understand the concern with the series as is.
I'm guessing a new weird REF_TYPE in refs[] which is not an actual
acquirable object gives an ick. Or is it the plumbing?
I take it you agree that we need some kind of frame-tied lifetime
tracking, right?

I added some refactoring patches in attempt to avoid growing
bpf_func_state vs v1 (Eduard mentioned we create a lot of these
objects), and that is what you've just suggested.

frame_id approach is fine with me, just want to understand the choices
we are making.

Thanks!

> [...]
