Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793921752;
	b=c7PC8E8bqqElx9W3BKMUHR36/cZ0czF3m4AKPrCRYsG6ML4bD++iVV0Bkwpl62Fdl+tZ
	 Aj+S1jFq25qXKIlJ+zs2wnOucuHIf8eZ2Z35rLfsVwB1HFzcY5EFFQt8f1b03nt8wA63B
	 9YtLSqIIMgPqn/XQQAzCcz8G29K7MH8RrkTpCQgp5HdX3Blh3Funmubifol9vw0wmRYuQ
	 LwMPRNLpDvCa7hjHR2nZcMjuUFupggwQCcX1G+V+RoUHlcav+jrAj1jw/ZXQQ1GetzJg4
	 JBWJS4HHIcCs/0ZrJ1hZYcD0gPjFrccMPiJJ4q6080SXbhTDW/c6Jza+u7lmLNu5Twg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
	b=RPXAM+dDp+kFDQPuXFu7GA6hSyw0EDBXPBxHbyJaQcIUU3T6/kCrTUzvmBALdgAF4hUE
	 v6aHGdIqqOaVvndIpNy2lTB472Wcpm0UP6yCHTEc/quphx0sx0t545WZHGeNBDAond2iF
	 TlzRFMWsIiSQQFyxrMAtKghBwea9vWPqCzuTZhVMjM/CAp0BW3lC+OOazcO/h19uV1O8B
	 FnkQlk3U4NnOiIKCkFGY0R08FYCwbK0u61vsRITIuNken41oSea44QUmYb50FmH2zJovz
	 KHVenqLaj4q+pT9rxc2QEPrxinxFWfLtCAAipNWMucDYyvCskd+onOFN1sEGjhi2OLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=KsafWJik;
	arc=fail smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA0606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CA0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=KsafWJik
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso14915a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793921752; cv=none;
        d=google.com; s=arc-20260327;
        b=ahflYHhJEsKQUSm/if+pCGUzbC2cK6AKq5do6ptNOmZVwzVRzBjKeRK55tdXxISi3w
         QISldfCa3tctnqx0FiGxqheDqlFdH4uftkMs+SGZKNaUQr38iKo+Z/PgkDxWCSDP7rUU
         qBo36L8YzPZn3WF0iwZDu9cpN23Y/zGJzZf+jiTTssSCCmLDNOWdhV48+/s0LFUbSImI
         rOLSaP41EiUWDJPjFpeKT6riaEHHMQPCbBs/+VNP5zxK5isDo8xHuNlI8V9GYo6PSj/9
         oSe8toVF3NpkUj3xNf7gYgWBZm5ixinkL48MnpuDw4jI/qVOMIiE9YX+vilKNXMJFK4H
         njMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
        fh=PC/jAIAtoXIzhwpW25/b/mqJtl+tXD9DKuiW0W1uhNg=;
        b=NyNongNa8HjQlb5uF/rhrXkHLqOwmY9ALmmWHUXBVzIBKeT6CwKfgH0ytmgBbI2C+u
         a+cq8boSsRuapIec9X3H1BNngFnkwk6dw6tbigZb6HMIpzHHi5pzUARqH4NAffqeRqID
         5SaA/fcNB3UQ19BUqCAhzmj4Nr//E+Wwd8cdNXt3hjE5jS5zi3sfGTWu2fDHS2yHS9hL
         AhyeztKasWjdrWE6VLpXfwK/OS7xEWjOKk4F5gQtDCCFqfa91QNKNAlPE7I3M9XUbh5p
         XGHFaXgtaVcx4LLA3PGo+g9vFTguSCsBWMT0b+eljARZjfC9TfpF/wbq47ztrOgLYnmA
         wezQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793921752; x=1794526552; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
        b=KsafWJikuo8FptLtf1RAxBqfXSGGJ/r8dS8Az671M1Xt4RUwVxO7wVepvIlQnOFBBf
         /MzkoiTn08xLX5LP+ahx8pNdH/6ukulK1QEWgZPxxWAEft9c9IsiuX+R0D0I4uOLWlvN
         h6pHrdaWzf4HfMYbaqATPgSoUqq3x78g0hsNakpCOrJKeWKkirPTnilEf/VFX37U2BZr
         89ylElyZXLuhv8PJRcTSqT2qOarnFkl+Z7Efa0cGxSAtBsmcQDPO5MCpc6I7B3NkdWmc
         LN/wvlS4dg9PvAVF4tguXMFlLKQb7alfujZj1CKStebBAsAb55nxUXfk5nOT3kw9FSZM
         ItDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921752; x=1794526552;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GCw0Dw3/6zz6nZRQ9tZkZQrpsY84tJiBfsLr+6sG1As=;
        b=mhkpVH3cRmHKZ+EU+n2UgLo5c/u4w69SM8ke1bP1fzCbNC/VpLJrXaBapHxtS9wFtW
         F1VzvHUXMROkl1di4skYVdyIWGxzi6IjfAM0CersbhxcvRon6MBOK2w0ZGS0g0Y92Y+S
         zVqwbSX3AvKkGy321GBzplMAvjHOZHHJzSesipgBneSLZ3jBn4EXyDDJ69NmzJU+OhZi
         NFDp5DgB34XmIaOSJd9og/Qxbnvb4g+ltiH9AKs+jtNjMryDvlQ0ZiKoyXWzOgN0pAFL
         K12CZsz/j9jRs/tid2Gql5/6f4JZaWvz5VB4q/KlPBJH6/YHzYGNwZY1ULhRhw4//03r
         k/wg==
X-Forwarded-Encrypted: i=1; AKwUvBx9uHJIGpJU8crA+i1sRmXHugpzRMWdczGJtSsPNFJnBXoFIpxsz00zJCp2R0akwX842FOKp83HYrdzIjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z953yTl4CjuozIucDdieKxSxsp/LyvmeY4SCeN2ZQUdi06IqVYF
	fjobKrfdM+irme6A6xZjjPGTa7jg13+O2B+PJPKOOvGGTVZwZD10c99BY3RXK+buIHTo6g0kEp1
	gMCAX3CjqicbS118Un6c4ZKYtTvaLhRqA6+hxKj6bvg==
X-Gm-Gg: AYBFou3XP1lql6y/6y9C7dRyLSMVCGdMVwh50nX1PzWdYDnQ5VsOlyQfd/2Wom/oZGG
	qo7sC0oqRIYiP7WitlEuegS3yDzqgyZ7+5WP5UrlUdKCDx++WQ8j8hbyJew2QDUIB2cUePGWFp6
	zMk/LVkQDZybK0SleDj6MgkJaowGtBQ2/cHOKTIEBtojbppWEVUdZElkJKWmigUNt3RiStI7vCW
	jVdpJ5b2W+o/fGz+fFYsl+SAFTKZRdLXkOxiau+EnFWdH+ArtmPvvTdaNGSLVPY6UR+E8iKyBQ2
	0Ri7/IBiJeuL5dWkYJ5qrWPfNksM/cxDsDze/54yYovyW2wovW+78CAFgMaDS5H3vGhj6yk7EX1
	bT08PxaEIQBkTOC8iiw4ZGKe6CDvBMLNR2A==
X-Received: by 2002:a17:90a:d883:b0:3ac:9e5e:d1a5 with SMTP id
 98e67ed59e1d1-3b0db70872bmr1109408a91.6.1793921751683; Thu, 05 Nov 2026
 15:35:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
In-Reply-To: <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Fri, 6 Nov 2026 01:35:55 +0200
X-Gm-Features: AclHuK89NvSJapqCJ93P1wxW7lFPP0JUgKVanIyU8NMBiBOqz8MX0h4pCCAe_No
Message-ID: <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: JP Kobryn <jp.kobryn@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu Nov 5, 2026 at 5:14 AM UTC, Alexei Starovoitov wrote:
   > Also try NO_HRTICK in /sys/kernel/debug/sched/features.
   > That may be decent workaround for now.

   The 7.0 numbers I posted were already with NO_HRTICK, and either way
   our agent runs on customer machines, so changing scheduler settings
   there isn't an option for us.

   > hmm. you really cannot tolerate that small drop? it's tracing at the end.

   For security monitoring each skip is an event we never see, and the one
   we miss can be exactly the one that shows an attack. For stateful
   protocol parsing, one skipped sendmsg/recvmsg can desync the parser for
   the rest of that connection.

   > let's try to think how per-task counter would work.
   > I'm guessing 128 connections is 128 threads servicing them,
   > so 200 cpus will be hammering the same per-task counter which will
   > cause real perf loss.
   > Gotta do better than per-task.
   > Also it needs to be per-task + per-prog. How will it look like?

   On Thu, Nov 05, 2026 at 01:26 PM Peter Zijlstra wrote:
   > I would strongly prefer all BPF programs that attach to known
   > preemptible sites to use a per-task recursion counter or something of
   > that sort.

   This is what I have in mind for v2:

   - Every trampoline and raw_tp run already has a run ctx on the running
     task's stack. Add the prog pointer to it, and link the task's active
     run ctxs through one new pointer in task_struct (other prog types
     don't touch it), so each task has a short list of the progs it is
     currently inside.
   - On entry, walk only the current task's list. If the prog is already
     there, it's real recursion (the same task, or an irq/nmi on top of it,
     since current doesn't change there): skip it, as today. Otherwise push
     the entry, run the prog, and pop it on exit.
   - A preempted task's entry stays on its own list, so another task on
     the same cpu is no longer blocked by it.
   - Cost: the list is empty unless the task is genuinely nested, so the
     check is one load and one predictable branch, with no atomics and
     nothing shared between tasks or cpus. The walk is capped (e.g. 8),
     which also bounds nesting depth. It also works across sleep for
     sleepable progs.

   To keep the per-cpu guarantee for existing progs:
   - Make it opt-in: a prog load flag for fentry/fexit and raw_tp progs
     (like BPF_F_SLEEPABLE) saying the prog may run concurrently on one
     cpu, and that it doesn't rely on per-cpu exclusivity for its own data
     (per-cpu scratch buffers etc.).
   - Flagged progs get no private stack. The verifier could also enforce
     parts of the per-cpu promise if you prefer.
   - Unflagged progs keep today's prog->active check, so existing progs
     see no change.

   What do you think?

   Mike
