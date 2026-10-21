Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540932;
	b=oCjN/4YLPaHKpCE6lU9uHCENuoC+wtdaiIucsVbmogNV1h9DULukUIPSadrRCgEdxULJ
	 7WsaAp1pq1OT9Qq0TOiF6Z6DASsf3ot/rrn8vudusWF6IRnWFta7Vyz/8YOcQo21QKrpK
	 +kuniTuO4oyZGFFlKRQAhnwZonwJukEKXkVzwdP8dxV/v0ubMwo22lniZFyL8ANnr+0sS
	 RjUFCNCpzLdb31WVrGYb0j3gHmofq/uadxyyT2sUQs58UGM1TXjUhCQ6zzJKIx1f6F5or
	 tBx4aQjR0uzSxIDd+LFObdix6uRqvOB1C2uinLbRan83yR41TSg0+DpYAmYK6Qm4C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=0Sjn0SBxkFVS93olNVmryUIhxh3i95NSdeHhlcsU76k=;
	b=dGldPrMOsnJG3MJaDX/7dXuCjGRgBwZ/1E5ZHuTZK4HwmI6Kb5Z09AKuebvWTldf4593
	 9rNyI6Dz5EVUvvKFATLIShxyum3wlF00RKimJoRAmgu+VWPpZJNs94nWJClYCEH8ulx49
	 YJ/pdfD9c6QzBfBhTghUPwLo/Bi0HbizfRN3mis9ak+dm58YQ2ViHz9V1w7fyva1eym/5
	 Zn3qHmnABvJAONLMkyw1Ky6GWg5N7nVEr+7nrBRD+gHDlIQYGh9a5kssu+OYl35KjJ+2z
	 9iVtmIQ8glrkWN+X6OaIOXGCq8ZtNyC/L2skO0nQJFOEYK2y/zalCAdrdXXGBZ7LymA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jx1UBEEX;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2708606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2708606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jx1UBEEX
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso634175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540931; x=1793145731; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Sjn0SBxkFVS93olNVmryUIhxh3i95NSdeHhlcsU76k=;
        b=Jx1UBEEXHx6Oxwwq3C+Ozk6aZBesuBt1JF9Acfs7Sqc85fhjRuuTPa0DI14ykGtP7u
         z6y7XjtyC65SxC60AjvrqvzpdzMLLSaNqp4cHP5cL1Z6kw/nS6JL4a3l7fhQYoMoPLuv
         k+h3yLDgjr3marUDfgTWNRXQOIwqnl3hOe19U5txNfWf9uKMsZld9oZmEmSgghSSDOkd
         k5hbdrtzZXwPFjNzjrHq+RdinmezTPRybN3V8LJGDMbuBo65rU9mbMlBz9zO53E6sI8x
         czAiQI1UnJzeshMQ91MrXryaPdKetz1ANCjYbdq40Wtl1PPtrixVbjyrn0hmOAiLbvAp
         krKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540931; x=1793145731;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Sjn0SBxkFVS93olNVmryUIhxh3i95NSdeHhlcsU76k=;
        b=Otpqn3YSmyvOPXUAdTwb8j6YL7j767Valmmpgnp4LTuSB1aX35gyX2eCzGCiXqjib7
         ZB7Fvr35stzlQQ/cuLPS8jeEQXMz8n1b2vllaRnTk2B0DNWutLIIfUPSqAupkqQhLrIX
         iAWsyff3Q64eHjMxXHFkn6N2IMXwcw+dWoEL6xWyhte/UOmvYGdVjHyxPub7yyhUH16O
         iYlRMqlco07sLfd7+cCHtMNeTN6Ib022849ELBIKW+Zm4kfTXHGHtenRcpGKSHoOiUH5
         NaR0DCp3uTFrrNbhVtofbumho+At3Vk3fkOIYVyRmDMVA+RHC6aIyt+p2/+VXw/puSYC
         M+uA==
X-Forwarded-Encrypted: i=1; AKwUvByppXGLfNy29d9kylfTKpliRBFm8VTWsj1uIb/tEWzSJiMbg0o5xOGEfGrceFRYRFnnZMTjn49yQAGiCbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtmxw4E0jHIxk44vbHytoC4mes529TYLE85Q2ZpoiiWsFEbwvR
	ky9ohQy+5qDPF+Ih/0a5SUttL4xFL0AnTLA9ePINBQ7nPNlljt/Ut8+5
X-Gm-Gg: AYBFou2nGgxoTMxsmQPMShkgkrUaXiwyfbJEQKKvp0jw/2xJcFRrN32vQzNX6pmjE/v
	sHOItytKJucem9n+66GBrXqiKVAy/a4QC36obpXwj1q80txF+MDMH+LTWBLC3eTno/PRrh/DC+n
	dqLDlbyC9xy8kKNG7vUSV8fam8O5dE4vEb/doHeo7Fh0eFJY07k0qt4pcFa2ZgnGHjhfJeRdKwR
	/9Nb77qwYRwb7J36QV0l+Vq2/465aPkjM+UweK8lqi+xbJMBe+2r4fZRJH6EHEo17h7jYQrzFKz
	1dbdhT+JxYyFGNxW0uX9kMM54zSTVehWz11IdcW+dIwSHFBFKxMwXg8RkVen4kWeCM7Gtf+e6iQ
	UGxWNDjVOhaGTKAd3Gm3Sy5Tigy8H8uFRw8WChqal9B0PbOjsjg6qswdlA0enMbao/3Hi9aAPIr
	OJ6LD9kgTVQ1TgaXG5izUONVXbWTd3O8SB2NVFyrXEmE8FaHEqMKePsXuH3dP1Z3Zaf6ZVFldHy
	am6u2Q1NXGg9DGvkedDQHSu2hVmIjLZmzpwW/a/Hwd66znKM/0LHauWmasY+BjeURKfuMHgdLef
	czBdlEWlg/O3pNYIeTZzdrYAQEsnYhAVjnUefUvV2iZLBGwsENy5H5ixpGI3zQ==
X-Received: by 2002:a17:90b:164b:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3ad86c2e5e0mr406559a91.5.1792540931285;
        Tue, 20 Oct 2026 17:02:11 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802957d3sm1538729a91.8.2026.10.20.17.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:02:06 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:02:04 +0000
Message-Id: <DMA2Q4DGMWPS.33II3DPA4RW0L@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Wait until the .data map of
 test_mmap is freed
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261009-selftests-bpf-mmap-wait-map-free-v1-1-96d066daea2d@gmail.com>
References: <20261009-selftests-bpf-mmap-wait-map-free-v1-1-96d066daea2d@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 06:49 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> The map goes away only when the program that uses it is freed, which
> happens in a work item after an RCU grace period. With other tests
> running in parallel, that can take longer than the polling, and the
> test still gets an FD for the map ID.

Pls include the output of the failed run, the number of workers
and whether it's a debug kernel.
It's not one GP. sys_enter is a faultable tracepoint.
bpf_link_free() does call_rcu_tasks_trace() and only then
bpf_link_dealloc() drops the prog.
Then call_rcu() in __bpf_prog_put_noref() and then the work.
Also test_mmap has no .data map. It's data_map.

> Poll until the map ID is gone. The watchdog of test_progs kills the
> test if the map is never freed.

It doesn't.
watchdog_timer_func() does pthread_kill(SIGSEGV) once.
The timer is not re-armed after that.
crash_handler() prints the backtrace and returns.
Nothing faulted, so the thread goes back to where it was.
That helps when a test is stuck in a syscall. It gets EINTR.
Here usleep() returns and the loop keeps going.
If the kernel leaks the map the test spins forever instead of
failing with get_map_by_id_after.

> -	for (i = 0; i < 10000; i++) {
> +	while (true) {

The get_map_by_id_after check below is dead code after this change.
Keep the loop bounded.
See wait_for_map_free() in tramp_prog_detach.c. It waits up to 10 sec.

pw-bot: cr
