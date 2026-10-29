Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274786;
	b=vVCfIpuc6/wvCFhYPjfTPeU8SXdD/JyHifx1d4Uxu+njt6mT6lD03LAL1r469XJpvc5Z
	 B/sXyFLvFS+rsVwOICJwpXBNJp1Td5B7jkkEm5dS0BJ/a1cGiPXklXX1C70JgsjIHd2bu
	 ICQr1Rkfpph6G0BsXlV/z+/+jlwQCXJnQssZSK51vU25CyR4lxGTTeOYdSUmDHVvdSWA6
	 ea0Md2A2h9PNtgKgFVszMcBqhk/aNzxZiKK83hzwtVr3JVaZGVmS83F5l1gQ+JHHhPktp
	 qssoUi3pO4Bu35Raff0yUK5mUz/Igm7WEXJi6CZIe81WTxOjGzh/TaHcZS2nnwCD8Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274786;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=B6fFfQE7RrEN57mIZD+kdgqs70BufHGSWfMzjOpwU+U=;
	b=cxwHXjgQlHkn7KEhdPvLz2mMCeYoBgtJinvOxtdsbB4Om0eQ9r9LSrW4VeSUk+Xp9OCr
	 XR9t4AhAEMZ+CoA31x4jJZxxNK9RxkiWhMSkSjyC3TM+jX9m9jqp7Dg/aH4Q6CxsicpYw
	 DoE9n/cEuXxjxfp75s8l5ECGm0WzkoVjhq8AY1Rl9oau5l3l3YBKQguNLj56NMpifCr59
	 5mJODD+nWT0x042SNYuudvihDJo5I5eWR0lmwqY/mM8QFXVUI4Fv45YTPeBKFaQx8ROpL
	 PokY/pNyhrrqBUNVBP+Ym3qRrNcUr+aEmMCND1aaZKqGlhoib2+blmTS1L1nLONsV0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GqzIuOBU;
	arc=none smtp.remote-ip=95.215.58.186
Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B266606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B266606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GqzIuOBU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lS2RsKxNaMi6eyWMVxwMVQS/P8x6d1KNXff8k9wBiKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793274778; v=1; x=1793879578;
 b=GqzIuOBUOLrrFoTp6swnjL58TcaG22yxSt2Qlg+rHlOgFnSdLX+c08ZFntQ8lnzU52pTYQyR
 FoirYGwy/CyY4nYzzGH04t/5rYgPd6f188HropH8V2UFlLSH76LwOCrOO+NyMOcL3Ar3V8Fk59F
 ssY6JhE/K6V11uxbW4il1vvs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e413e8c6e9ff3dee;
	Thu, 29 Oct 2026 11:52:58 +0000
X-Mizu-Trace-ID: e413e8c6e9ff3dee
X-Migadu-Flow: FLOW_OUT
Message-ID: <eebfec12-d0dd-433c-9332-f1e894fdcda8@linux.dev>
Date: Thu, 29 Oct 2026 19:52:53 +0800
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
Subject: Re: [RFC PATCH 2/4] ksmbd: route WRITE requests to an unbound
 workqueue
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, senozhatsky@chromium.org, tom@talpey.com,
 chenxiaosong@chenxiaosong.com, tj@kernel.org, linux-kernel@vger.kernel.org
References: <20261022092514.2590010-1-huiwen.he@linux.dev>
 <20261022092514.2590010-3-huiwen.he@linux.dev>
 <CAKYAXd9Ow2SeZ1EjR7UBF3rmMn4=HKZrKajNdFU5TAnLVf=THg@mail.gmail.com>
Content-Language: en-US
From: hehuiwen <huiwen.he@linux.dev>
In-Reply-To: <CAKYAXd9Ow2SeZ1EjR7UBF3rmMn4=HKZrKajNdFU5TAnLVf=THg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Namjae,

在 2026/10/24 12:26, Namjae Jeon 写道:
> Since this improves performance, why isn't it enabled by default?
> Also, I would like this setting to be on/off via ksmbd.conf.

I left it off by default for now, since I've noticed some
regressions.I'm testing more cases and trying to find a general
fix. If those regressions can't be avoided, a ksmbd.conf option
would be needed.

> For 4 KiB single-channel WRITEs, throughput drops from 219.55 to
> 193.01 MiB/s. Should we add a size check here to keep small WRITEs on
> the per-CPU queue?

I tried keeping small WRITEs on PERCPU and routing only larger ones
to UNBOUND. However, this did not work well for workloads with mixed
request sizes. For example, a workload mixing 8 KiB and 64 KiB WRITEs
still regressed. Small and large WRITEs share the same connection and
send lock, so a size check alone does not avoid contention.

I then changed the send path to let one worker send several completed
WRITE responses together, without waiting for more responses. This seems
to work better:

Single-channel WRITE, 16 jobs, QD32 per job, tmpfs on a 128-CPU server,
Throughput is in MiB/s.

Size       PERCPU    UNBOUND+batch    Change
4 KiB       228.12           248.89    +6.96%
64 KiB     1797.26          2091.17   +15.34%
1 MiB      2188.42          3330.72   +53.47%

However, I found that there is still a performance regression at QD1.

1 MiB WRITE, one channel, one job:

With schedutil:

QD    PERCPU    UNBOUND+batch    Change
  1   1945.94          1021.28   -47.52%
  2   2844.66          2567.18    -9.75%
  4   2338.03          3547.42   +51.73%

Performance governor on all host CPUs:

QD    PERCPU    UNBOUND+batch    Change
  1   1974.35          1785.16    -9.58%
  2   2904.12          3038.52    +4.63%
  4   2418.45          3659.93   +51.33%


CPU frequency scaling makes the QD1 regression larger.

The main challenge seems to be balancing CPU locality and parallelism.
Keeping the work local helps QD1, while allowing it to run on another
CPU helps when receiving and processing requests in parallel. I have
not yet found a suitable policy that works well for both.

Any ideas about this?

> This walks the entire channel list and sets multichannel_seen again
> whenever an additional channel is registered. Since the flag is
> sticky, all existing channels are already marked when count > 1. Could
> we walk the list only when count == 1, marking both the existing and
> newly added connections, and update only conn->multichannel_seen when
> count > 1? This would avoid the repeated traversal and stores.

Agreed. Thanks for pointing this out.

Best regards,
Huiwen
