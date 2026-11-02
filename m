Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615472;
	b=flrBU0cgae5O0nOGuPLwPj08BTMRVxs4XDYXj7uIClZBWQsAH+2Zrkge+5CNhRL1YXcv
	 mSfNnwmSFN4fjpfZC7fLzjNp8JBsgHTxOtlWYc4ov2WEaod+XTc29P+HS0zseyXZF0/1Y
	 WtlqaOJ8BilMb+uFa7XBOcy/UvPREa/M6Ym9sZB/0loJTKRC963DsT0bNHmqw9QMoKY+U
	 4pkj92GQyV5WwXWZ0mABmSsK/5QG8VpDEJA54s2iojNLhI8lGpHivUIC4b6ujdlg5p3uv
	 76oPKE9etWBOWMutefRxbRrLTBohuUxvnfapy/SR7Wlmw5/hc6SNyiD8WyUUoSkjMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TG6233zEpb+rSVfSqflC2boy12f75HN0PuFPajXRgoQ=;
	b=L4kQzYXyzyE5MRwfbAfG4ofAGlN3GaHuaXbQMZelUNXBX/cjYM9grdhDuVLFlymWADkW
	 6DoVSC3btXmKq1ETTIKZp+wMBUXVIWxeVPRLfpAnF7+v7DOE1tPb8DLaOFoUqNJ1jn7wP
	 upPgYFKa/ZVTA0rZNMWQlSp+pTWFy/eBVlQE44TgoeCW7d3T2H/khyvKCubVmlbq64pM2
	 KwnpOpqKagyJaQrCJ284WYZ8/IS2hLir1WcPJz+CTJEVoRELDVE4Dz3rqP5qOcbSS1V2R
	 8cGYKbunALktnbxAh6RnCz8kmNlq97BDziSG9vRnoDo8ULvB0Ns0GSJZR9PHN0CgPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dl7a7ixk;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC846606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC846606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dl7a7ixk
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so459286666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793615470; x=1794220270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TG6233zEpb+rSVfSqflC2boy12f75HN0PuFPajXRgoQ=;
        b=dl7a7ixkBmvTd/Bl1qpeE6XGKZRBY0qGhsEz1ql0KEb/u4+u3nMCKFRwrA9NdQ2eCn
         8gjseojxGoGj5UUZSlXfJGYsz4MDdEZeauqsoQw4jp3/o1UYSB6DIle5MSmh6z+Gc+sU
         URKgsnZa7uMFIXfyh/NfVutFnnNNWZro9Xqy93ZmSATA1vNNPzbgCT/N/LHZnjr9NguF
         0LN/CDPRzgNY+m19bNb/QRpmKtQCOqMlDwkCSColFpjmE0j94LXNHzgYmOI0owZ1mS7W
         YXEZdVlJwpBll0/J6NlL+ULPNSCbPfMunMUyWOO15h45sPM3iSQ52rgftmf3mSVhmxSO
         ZdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615470; x=1794220270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TG6233zEpb+rSVfSqflC2boy12f75HN0PuFPajXRgoQ=;
        b=sVCuN1/WMgjGOUttXRIv6cuSEBDtllNemJg8UNALNp8fJ96zLHnxapMEaW0qazIYI8
         xcfODkv4IN/nPh2bC1nAR/L2dfWNsLHB0fRjVYCQ3CEPeXcY+Sli2lJPLa0/B5V7zUrT
         oQgBwkURRPJGfiURYU+NQDTSbIYC/5DFVcjjwF1yobXXxh0Rr5La0ZyqHHkS/cd1k7lT
         XxQ7iOL3R1crogIZxdZ2W1N12550TrVLiEItKFHL/CC3npo0VB6t2DoQuhOBMVIlNkXM
         Pc9EVwFxoBQh6tHWZj/BUWfy7fzuKoanqd3wBnrCjEy+I3xzQyqsHXJ3iw7F6kxCU1EJ
         Kd0w==
X-Forwarded-Encrypted: i=1; AKwUvBz/oN1pdJHKpDEjj8FmwUo2EY3rRdunna5BBQwABrNbyvE+xP4lWugTMqSsWXJ/u6/ijyqgE4dQ+FNF6PY=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ptdEB5+GBShFZbhZzpt53DFYBmuk37L2eW3AsXC609VFK3ws
	YR6t/7shbRLT4vVAGnxP9H6FXme6BG6c0xYfYL2rhTqgE5dsdwWkw2vaLjKAtmmcDRA=
X-Gm-Gg: AYBFou0tt8JQsmX9ow8glTijHmeLyWDoZruSybPJIixciT+GrnXuDzlE4pqSUBqPQlL
	Q8YNXyyvrasWEAx/rRnpdseNG0Qv0tWdDofvy6w3w9GzbtRCbo3Z10hwofkbnOtnXzOkQu5FdgO
	HPmNLLUlBVqUo0x2/7h/NFRqMkgV+h/hfiGTZ+kUbbb0zl5bb4taHZYWWCNVhcGX3LEErvIUBoK
	obuY/5CO2wzt2Fl2pqEYU55rn7A+CD8Ro250jK65t2RUpAPiQDynLHaoG7bntPanqk7JRz1CIN/
	qASOWv2pTjcXIbn65ryDW/rAlOvBktrC/f/V6rAhIxjvzS8R58vYXw+fhYPScI5pa4iovH6YYho
	5HC1waYAy661+pS2nIIEYcR6AThmqJX41zusLnQKxVPp5kc5AgmLzG/NRZ/Xx4SGwTcHffYVMFd
	m+NlBy5ueyQXdK5ruPfcdbVsaMwapTQxRSiNZBgbSW1+K63icz8e74dA24rl8AKpRYX9NUaRu+7
	tle+Ix7aPIBpdndKbhXeYEoTea7mqHzrjZook39Lstx/IRvD+HAEiU2LERdu32wF6KevlkpnesU
	G03A7cUCmVBkWuCiYoIc24/GSXRHi8Ib
X-Received: by 2002:a17:906:c156:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c4ca7ac537bmr772991066b.35.1793615452931;
        Mon, 02 Nov 2026 02:30:52 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabeb11acsm371161266b.70.2026.11.02.02.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:30:52 -0800 (PST)
Message-ID: <6682e9cf-8350-4410-8acc-1fbeca638e64@linaro.org>
Date: Mon, 2 Nov 2026 10:30:51 +0000
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
Subject: Re: [PATCH v3 00/14] perf cs-etm: Fix bogus branch samples on
 exceptions
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/10/2026 15:13, Leo Yan wrote:
> CoreSight currently models exception entry by changing the preceding
> instruction range into a taken branch. This can give an IRQ the source
> PC of an instruction that already retired and overwrite a real branch
> immediately before the exception.
> 
> For an untaken B.LS followed by an IRQ, perf script currently reports:
> 
>    hw int  4000f8 => ffff800080010c80  b.ls #0x400118
>    ...
>    iret    ffff800080012284 => 4000fc  eret
> 
> The hardware trace supplies 0x4000fc as the preferred return address.
> For an IRQ, this is the architectural resume PC (Arm ARM, R_VBQMV).
> B.LS has retired, and the saved PC identifies the boundary before the
> following MOV. Using this PC as the IRQ source reflects the
> architectural state at exception entry:
> 
>    hw int  4000fc => ffff800080010c80  movz x2, #0x1796
>    ...
>    iret    ffff800080012284 => 4000fc  eret
> 
> The IRQ sample represents the transfer from this architectural execution
> position to the handler. The series synthesizes exception entries from
> exception packets, preserving the preceding branch and its outcome.
> 
> The supporting changes:
> 
> - Let decoders supply sample.ret_addr so later instruction fetching cannot
>    change thread-stack return addresses. Apply this to Intel PT
>    asynchronous samples as well.
> - Prepare packet ISA and instruction-size handling and share sample
>    synthesis helpers. Mark untaken branches and break history when
>    instruction memory is unavailable.
> - Add a thread-stack regression test and four AArch64 CoreSight tests.
>    IRQs and page faults must resume at the entry PC; SVC and emulated MRS
>    must resume four bytes later.
> 
> Based on the AI search and test on my x86 machine, this matches perf's
> Intel PT handling of IRQs. Intel PT records the next instruction's IP in
> the FUP packet, and Perf uses that IP as the interrupt sample's source.
> 
> This series is verified on Orion6 board with "perf test coresight".
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v3:
> - Introduced the pref_ret_addr/end_addr union (James).
> - Clarified zero-size A32/A64 exception handling and why T32 retains
>    per-address instruction decoding (James).
> - Retreed missing exception pairs for up to three recordings,
>    then fail instead of skipping (James).
> - Shorten the IRQ workload (James).
> - Fix FIFO argument quoting and remove redundant ShellCheck source
>    directives (James).
> - Checked instruction length before copying bytes into sample->insn
>    (Sashiko).
> - Retried MRS checks when instruction page faults may match the opcode
>    filter (Sashiko).
> - Rebased onto the updated perf tree and collect review tags.
> - Link to v2: https://lore.kernel.org/r/20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com
> 
> Changes in v2:
> 
> - Rework the fix around exception packets to preserve both exception
>    entries and preceding branches.
> - Add explicit return addresses and the Intel PT asynchronous-branch fix.
> - Split out packet/synthesis preparation, record not-taken branches and
>    handle unreadable instruction memory.
> - Add thread-stack regression coverage and four CoreSight tests.
> - Link to v1: https://lore.kernel.org/r/20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com
> 
> ---
> Leo Yan (14):
>        perf sample: Allow decoders to supply branch return addresses
>        perf intel-pt: Preserve return addresses for asynchronous branches
>        perf cs-etm: Break branch history when instruction memory is unavailable
>        perf cs-etm: Centralize packet ISA initialization
>        perf cs-etm: Use the recorded instruction size for A32 and A64
>        perf cs-etm: Mark branches that were not taken
>        perf cs-etm: Factor out final instruction sample synthesis
>        perf cs-etm: Centralize branch sample synthesis checks
>        perf cs-etm: Classify exception calls using the exception packet
>        perf cs-etm: Synthesize exception entries separately from branches
>        perf tests: Check CoreSight IRQ entry and exit
>        perf tests: Check CoreSight syscall entry and exit
>        perf tests: Check CoreSight abort entry and exit
>        perf tests: Check CoreSight emulated instruction entry and exit
> 
>   tools/perf/tests/Build                             |   1 +
>   tools/perf/tests/builtin-test.c                    |   3 +
>   .../perf/tests/shell/coresight/abort_entry_exit.sh |  32 +++
>   tools/perf/tests/shell/coresight/irq_entry_exit.sh |  36 +++
>   .../tests/shell/coresight/syscall_entry_exit.sh    |  32 +++
>   .../perf/tests/shell/coresight/trap_entry_exit.sh  |  39 ++++
>   tools/perf/tests/shell/lib/coresight_exception.sh  | 164 ++++++++++++++
>   tools/perf/tests/tests.h                           |   3 +
>   tools/perf/tests/thread-stack.c                    | 106 +++++++++
>   tools/perf/tests/workloads/Build                   |   4 +
>   tools/perf/tests/workloads/branch_not_taken_loop.c |  33 +++
>   tools/perf/tests/workloads/page_fault_loop.c       |  37 ++++
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    | 106 ++++++---
>   tools/perf/util/cs-etm.c                           | 246 +++++++++++----------
>   tools/perf/util/cs-etm.h                           |   6 +-
>   tools/perf/util/intel-pt.c                         |   7 +
>   tools/perf/util/sample.c                           |   1 +
>   tools/perf/util/sample.h                           |   5 +
>   tools/perf/util/thread-stack.c                     |   5 +-
>   19 files changed, 714 insertions(+), 152 deletions(-)
> ---
> base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> change-id: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>

