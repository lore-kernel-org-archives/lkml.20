Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670556;
	b=iZNqT1s2kY5VUZBw0rBH5UeBD5aHLNU/6bmGwv2ln1mO8RY0PDM0EytW+HQs3HCl6eXj
	 NTg9Sf6gS69BpdHuXPSvci/z/kxd7x0kFXpwOqUnNIK+3k8JwNwO8tri1rO4aYdMdilnc
	 jro76L/sVWkd/CJXGklJGz+Hk/zDM4n4Me1QEu0o9R+R7h0hsDNy0r3nCpLJvXT52IazS
	 GShUxrVuMdB9S2phb6LxrQfEE4gN5dOs4qTpWWzQxNdHUgrZUqZ1rkDoHjfXZQQ5cgbK9
	 EGzITGW63JKlhlHp0PE/XumK+M/L+6tzIwTL6a+r3TCXP/kBnEw91Tm9nfxZ0k4IujQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=JkIPtkRIMfFcSEfUGwxsTLNIjz/Hdrm5pN4sxYxlXGQ=;
	b=kbKGolCYaqbM/se67Pm9RP7c6F2Y7wfyq2/DaDKFwcM9Uqp9rU3hXPtSqLisvEVw8qxg
	 o4QVzGKlUpXcgVZ1FjxCyta79+9IwcwZ0vZ6jC9vdWJeRSjsctC3b2nKeS1BmMAJLdzAy
	 B2FPvr2gUH5DzakBgvhlEmITfOKOIp8L89QhCaBeAX3W/T1G5x7yyiEBs3yXwh5AQWGik
	 fP95FikPef6g8cqZlnK4m/H6sbgCVQw/79ocEc9QqfZ9JvNMcaKDbQ1nNCZBihHp5sgKi
	 XGlJrh9yn17yVT4rgDaJEgjHDY7xDF03lfUnZRdCpyyUMvzL8zQ9D9bsE4m2qoKsadw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7BJO4Lo;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46E606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA46E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7BJO4Lo
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2279395a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793670555; x=1794275355; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkIPtkRIMfFcSEfUGwxsTLNIjz/Hdrm5pN4sxYxlXGQ=;
        b=A7BJO4LoPpfxT6+H+ASpf8yGG9XZnj4GXxUtBiNX2dAZVoPB5KgLe7CBPmVM3Vgnp8
         dvKfDhjUDTRsKY170r6Chzx/5Ety2nC39hhwCg2njDrwCboUt+RtjVVKcpVWxcDZfkzQ
         KEWPtqMk+RC4F5tIsgO7faez614XCFe1pCoScDUC0+RXyytYiJBO0RQh53jUe+M3/9EB
         9dneUAlA4I40aRZ21WI3NNHBmQ5vORTDct/3PTlsqSy0vAJ24f9JSIGAqONzH7euyTuS
         o+YC3cMmYpmuCqLxyuVAwvJwEjF29hy7TWjUaZZ+aYjoh6TRwHRM6UFgg6a2hnuaA53N
         IMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793670555; x=1794275355;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkIPtkRIMfFcSEfUGwxsTLNIjz/Hdrm5pN4sxYxlXGQ=;
        b=FPrfutMspocdOdyxCNMwsm5RcJ+ZEI4P0kzsOaSMIeiafYg4SjuKLXKkQVIxKZ4jyU
         nz7ONaIEUYvv5XqL0gOIs5VS6TYQyXo6VOen/hFDETHHMhjwJYuBafxLNATCYXGy6Hrv
         Zw4LmKqjTQ4ZNedBmwo2aDUhtlP7rmE/Xv7PYjEb/5aG5CwiAkDTRjrCQkbSfVhArlfL
         9B2UQInpu/9VeQPWd3qFt34sGy66hexYtqsKMf0kPee8hMPqCfvf9aNMCvqAx/PmiVFD
         9hUolvJ0H/oQ8r5nVFd7owcJCR5DPvfUoOAKiCdCpohta+ziw2SrHesVmXVrauv/xw7/
         274g==
X-Forwarded-Encrypted: i=1; AKwUvBzuhKC4TnOj/3yu+SF7BvZ9Yx5YSppabqwjnVXdS4njF0+GX2A7xwW4uZVXRavGrTPwb8kFexyxaDoubCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EHSIIioM0i7tImm1mGpzyR3aWD9I82v+nO4NaB5RRGF81D9lf
	slZMEiKjkGGefCVob+O6cBwPcG1ZEs+cfvcaC9+IyKKDPStW0KVBJBAx
X-Gm-Gg: AYBFou0QZpz8TIqbFhfXRPnum0Lk+Jm5KQgNHVuc/lGOdeVDQqZ6Tbv+UVgNPwNaIeb
	RDv2l3uDYTJ9PXBnqZ+aWNtfaODhuCfasc8jAtsWDMAWTCxbCDq4cDwUlYlSk0CmgutGNTpaZZR
	s1lslSxsTLBty2lz5XTfhLQpwle4u5fzdQkx2ZP3EXIuGty0sH8ew/hP+QM97VIBPnzSkAQ3f+p
	asi9PEnT+moTjqdV8OCHNy2efpiY5SD/9hhPdPAfhwhhsUUMLmIWiHK3DyXTFRseoP7LQp79NRy
	nVsfnejqCW6z89y/Y6WIXlZStWo4qifES2K4/mz+1mAtRGr/lXUnULdH54PRqBBc0T/xNV/qwyE
	OudWjj0P1CZpZBGWJDL1eD1ssfSsjO05ULOpSMvY/tIbHPXuZfDukOKi5Oyn4V4yER5rDQUqbbK
	xcpkcmE62fS14UHYe3dGaT+VEQQmz/W6krRuGQN+GpqmdhDUWcs76Mm5lJp4Ak7l4GiF5mY5/OL
	0oq9LmP9/KO+T+9vKeUoTpiVDoRRwQJ17TKNRihwys2XjEwa1AZInBnUbpRiVAXl635dLdl9IEs
	o+mTqM9WgjkIKhgzl1vVrdkCtcO5FekmynnKItNhKd3+4cR+HIS+qNeCsI4wvCWivYGvFO5WV5B
	EDEGb/pUUP7aB+WdzoYbWHfdmyZOA3Kne4A==
X-Received: by 2002:a17:90b:2745:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae89776d99mr9290272a91.13.1793670555014;
        Mon, 02 Nov 2026 17:49:15 -0800 (PST)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm10375603a91.1.2026.11.02.17.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:49:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 01:49:12 +0000
Message-Id: <DML75890DWIX.EYB690LPBM1O@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mike Bazov" <mikeba@sentinelone.com>
In-Reply-To: <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
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

On Mon, Nov 02, 2026 at 03:24 PM Mike Bazov <mikeba@sentinelone.com> wrote:
> To fix fentry/fexit while keeping preemption enabled, we'll need to:
>    1. Disable private stack for fentry/fexit (so each task uses its own
>       kernel stack), and

Yes.
Then the stack limit covers the whole call chain instead of one frame.
It's 2 Kbytes on x86-64 and arm64 now.

>    2. Check recursion in __bpf_prog_enter_recur() per-task rather than via
>       the per-CPU prog->active counter (still blocking same-task recursion
>       and IRQ/NMI re-entry on the same CPU, while allowing a preempting
>       Task B to run).

No. I don't think we can switch to per-task that easily.
For your use case try fsession. It was added specifically to match entry/exit.
