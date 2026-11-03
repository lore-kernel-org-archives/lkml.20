Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749596;
	b=saoh7Cg+G39s2HhCezrSDoKusl+N1I+EcjNgKzmdY8PGv9P18hLkQ7OmSHQ6kGsmeJKl
	 RS6EBuxrBxL6zEd7TXuruMzlaKtLMqkEsUwE3HGrqlB9Zr0M0+3wtOtlcz/uflU31Ks7q
	 Rwr/tXt4N4aVXIbi+7AFs4iJB+Qp/55g7e0pftZzU79t+bTD1qBP1WIp15Ux204fG0lOj
	 5QDCoHGs5jDaW9Ayb1/1bsZOHHkbQUuYHJMCNByql61fepbisJ1RfqGqcbJVoUNbmkyo2
	 Kz19d+oBdprePLCVWk+/pJDQqZm2kZ7eOyAyGr4nJe0nEzaigZZ9X/Q8Amv0bovxE/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749596;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uPirOmTrSzR+qJbbu6ot8AJCfXQYDzCgUX4JayMeJqY=;
	b=FrtVsuOYsILQMBlA6McwdeI2ouoycxIZM46A4QCnc8wg4oKbvFMmHN8597dX8o4VJp7U
	 DOlOb55esEVRtkP7HQpaiXGcPec6lPnxJJWKz1VAhh561/1c2c7ECFomiTTdYlJ7y7C3h
	 ++zyPIYdnCH3pAuoEa8gpI5hEBPkLuwH/p4ieut22ggFXYj9rvSZy64sBD87OqhrjkXT+
	 PMlVG0O3rgwFH8N4yh7Gk6ZTKsPDqQtZVnafJdAfPr9HqoDWujZ3vjmIBelQfyi5nCzhg
	 RiEOg4Xe1x+AseEsbvqtCpIYNYhS8Kl24d3XwLvJx1KbNpiTxW77P2qZJLCmThMqmfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KpKAPSYG;
	arc=none smtp.remote-ip=91.218.175.155
Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B9606D83E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8B9606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KpKAPSYG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1mASqXNaXoMjNQ3SMMIKGa4jpTD7lgU+gHYsGfukTD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793749592; v=1; x=1794354392;
 b=KpKAPSYGEs9xzCE/nniJ+D+PcFDzoE48xaJeKxYfna/UkNhwiNx6iPbsfUjBnSZo/KSk4gWZ
 MXzJ0L9NeSEuA80HOG9jmGCXPRSBuyMsKn7W22a/6aB2cG9U0B/iqK9LHyKrgdFA0fyIwbzVj47
 yZq0Pma41EhlOOBJnBYTiYTo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 353126e08cf0d14c;
	Tue, 03 Nov 2026 23:46:31 +0000
X-Mizu-Trace-ID: 353126e08cf0d14c
X-Migadu-Flow: FLOW_OUT
Message-ID: <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
Date: Tue, 3 Nov 2026 15:46:27 -0800
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
Subject: Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption cause false
 recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 mikeba@sentinelone.com, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
Content-Language: en-US
From: JP Kobryn <jp.kobryn@linux.dev>
In-Reply-To: <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:22 PM, Alexei Starovoitov wrote:
> On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:
> 
>> Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
>> preferred fix for fentry/fexit, or would you prefer a different
>> mechanism for reconciling preemptible execution with prog->active and
>> the per-CPU private stack?
> 
> No.
> We cannot disable preemption, since progs are not short
> with may_goto they can take 1/4 sec.


Seeing this issue as well. This patch opts in ALL non-sleepable programs
with trampolines. Alexei, would your thoughts be the same if there was
an opt-in approach, like a libbpf annotation "fentry.nonpreempt", for
select programs? A patch like this could then check if
program->nonpreempt is set.
