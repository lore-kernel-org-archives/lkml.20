Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124303;
	b=VTPMoAKONOlsxPb6yNTYfRXaRRO6D6bGiakbQ3RR/OySelHxciua3gy2BHR5aTBcXDK0
	 HH9Q97ao0mz1j4lcbdaP4KzIMB/+JxWvwOaQEcfC3ifcY/8IHnRtxzTOwe4Uwm1sl2Lv0
	 Rw553xGPV0J6vCOcsqk+xbq2TV8fOxVaMnXUnBkDvMqLfWdUPMojpYmNwGFCa3RgmAvuN
	 cBDLSDowM3IV8dbtKkfyVguBS0cDqUF/aIYUyqRdm8/mY0IBIXe5FjtTJKbrIU50b7x8X
	 B7IwLZiLixGneEvlxCY7iVYRvM1GtNuJLwmTt4MiKsUIOWg+TZBg69/01rR0eKZJ/LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
	b=d64otfKxw3IVSYu6lhNs+LGtiaD5LfhRB80arJaSoWeQ+8Cd7BioXeBcQNAyBPnvt5/+
	 p/KaIU57n5HTuqGIYwbIzdN8Kr+rwd/4XNAtwNcoruhEqvj5aXheU4Pv5e5pSb7WreqFN
	 BQYQpfD1zdbyU0ZN8HpDef2+88iwK9vJ8nEfiMK1w+QolOVsTWOhK5r+WBMv/ngN/Kwq4
	 2PhGquYo8U7KOpX0aUAcFuR8ONup+0LkPb2bSg4cqZ/fc6xSj2i0LiMq01zvzgdZB62FK
	 mkL24vn1jtPNXi1gSIKu8Son1uncLKNXVkgKgrtTNl1ZbvuMi+kI9f65Dy8K937mkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MtzztlPx;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MtzztlPx
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-81b54d0cb17so170272a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793124301; x=1793729101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
        b=MtzztlPxpena3EAfVqgyAz88Sbp07laf8cENHY2dlnwAIB4CXoWS12FazlnNBex/tB
         iCNwPM95GEYjfQBTshm+Z0lMaK2s/XjIJ9so7jUUZY6aYhjJjayogqs3VsJtgAkEKX2V
         XFVzXswLlVbP6h+8BPLz6m5k9eAJQjJtcu+fR3pLOMsb2siVFUlVgoQjG/bxKXYigN2v
         D6FbCsaERrJVP2rvU9WLanVHBoBuxh8QLnFqYPs/SKkPr9g+4B3JPCh5lzHApDsS9j+8
         oAYgcA34G67mS3A9ov1j6Yh4G1bU0sCMht0+OOC/mwIYWrBwNEjjGzzrp2o2wwFjW+pB
         EVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124301; x=1793729101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
        b=JFFKIIiD4paQ5RJwSDCFE054qPDWmffU4V0CXuSv5FvuvwGWrfcyudI6RufLxgxMsY
         nYSHDYDxq1rhR7VMiEBq9eSWx/W6gobrJuZ1kRzoQvw2IIMJp9++MOMNmE6aIY1eqkzu
         SlreYyxSN70uTfQkUx9xbGQcskI00zzpBBJyVpooJ9C2tKauCcXmrAzQQemK1r5N5Brn
         EX0KzLP/cNwJ3WsWig0IS76UeGg2GSNePbP5/HI2Nr5k0zbSzoLpFC6y5dHvrU+tq3Y5
         RaGIH6nUq33KcKoECLu1z7iwVc5ewQNhwdlxrXqjgNvZUT0OxB6h8IeflV0isq57lzBC
         PgGg==
X-Forwarded-Encrypted: i=1; AKwUvBzHBP02CWbI3shmIXM/IlkgSPclTPVv6CrgDiWoyRJm8oumbbWCVTWcCk4KYjHS5kMcmRHahybquaYthNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZrHs842EMyRztVPVUYnbvEYAGvU1BVePrmFp4+IRG8rLMz2dL
	rKnLbfWKcR+4hQg2Jzok+PkhU9tdFK6NWYj3XVN4aWMKwCbswlOqjWw3gIQ5z9Le1N8=
X-Gm-Gg: AYBFou0TuEcZUqKgc8jhDmviGy/56xyrrpLCuM4nbF0rOgCpFs33TFrTRhqX+kvmuet
	tAB5QJbGO25wZdVtMWBl/rDmQ4UhFzoKjdOpK0zclUARCKecJ2yfWeFp/b9CsGErqpiknj+XAbY
	saBk5tKt1UdklZ9Xv2BAnM6K1DTs279u8XGBPQT7JIeIWNGZQooFfRNgz4p3U3Mh1v2Xv8KZPza
	E+j8HglyqP1BZwYs6NFgeQwVGgkdq2FNnY6w4peIvgOyPpwebalBnoLtoma3n+SQ6/6BYLWysTi
	5Jxa88fr4ugw/Zl6gcin2jdBTmt1xO/ubz5FfaZ+WkL3hkmDajhARKWLCa8QMwX6c8N8/a6d4c1
	UDBKIoZKTnsUcJ1Ntcw0YC3tauxobzykIs4lMu1cnnUTQSxueinZKrlWMHNOYG5vQH2TxYcD/FH
	w0+SYvPBSulSb230hHw1kPCw2kwlgff3wDM6wtZzgxsFdGS0RCaE7+7zodNO6LZoTFDZ7QPBwVk
	Ir4/xkv3QxMIlzb62AIafvshQ8Ya0t34V4It2C0DF/FbUMFWwjgkq0uVWQhh3cTVI1UhFX2M5CO
	5R8UjgFYPK3uJ56zGD389D5w8bPlkhWBr2yUB/yCMoMjnb6ktI0XG23cRQ==
X-Received: by 2002:a05:6830:2b22:b0:84c:85e8:f922 with SMTP id 46e09a7af769-85abe8bb899mr253687a34.26.1793124301049;
        Tue, 27 Oct 2026 11:05:01 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11949803a34.24.2026.10.27.11.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:05:00 -0700 (PDT)
Message-ID: <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>
Date: Tue, 27 Oct 2026 12:04:59 -0600
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
Subject: Re: [REGRESSION] io_uring: final close can hang on a stopped
 submitter
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027043521.99446-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027043521.99446-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 10:35 PM, Karl Mehltretter wrote:
> Commit 13d3783a55b7 ("io_uring: wait for in-flight requests on ring
> release") can make the final close of a shared ring wait for task_work
> owned by a stopped submitter. The close does not return until that task
> resumes.
> 
> An LLM helped with the review and reproducer.
> 
> #regzbot introduced: 13d3783a55b758a9fa05b67835afa7e216476c61
> 
> Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
> Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
>             (master as of 2026-10-27)
> 
> The reproducer uses a default ring and three processes:
> 
>   1. Submitter B creates the ring and submits POLL_ADD on an empty pipe.
>   2. B forks closer A. A inherits the ring fd but starts without an
>      io_uring task context.
>   3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
>      then stops itself with SIGSTOP.
>   4. After confirming that B is stopped, controller P tells A to close
>      the final ring fd.
>   5. P resumes B after two seconds so the test can finish.
> 
> B keeps both pipe ends open and remains alive until close returns. This
> excludes pipe HUP and process exit as completion sources.

This is working as intended. With the change, close() waits for
requests still in flight, as otherwise they keep files pinned after
the ring is gone. If you SIGSTOP a task, then that task can't run
the required work to complete it. A fatal signal will still kill
it.

Unsurprisingly, sending SIGSTOP to something may prevent it from
doing work...

-- 
Jens Axboe

