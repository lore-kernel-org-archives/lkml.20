Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876617;
	b=laliUtJRC+m0XwrX503cTEFo9RL/Xz9XNAlfZRFFycqb/jnmWMuW0FV1+Tjfd90zrq+k
	 eR1h8uJ2PqVOs/MFCalOWkj+xJzlx/GrQZDJg7+wUNFlNxjgpNtWQ67cH5bcOK9ErGaBY
	 I0xz3rbOjUAxbsrEgVD88UzmsoNQGibDMRGvH8BQ/llRAOH7QNxsIkoqYA9KXKakxMzNU
	 iclAV5iorwJyNANF32JkFXrNeT4Txh7Z+QYO3lUvQ2+XP7jh2A1GMylGOJce2MDZj6E9H
	 bJslKmG1Mgxzj42lw+zsx29CZDVLS9R7asLKW5nhQzxiY4cUSOqC6yub54LN6HymLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yX5s7D9zQjVJIVM16uZ610BYYXHAt3Bx8DUuT1rWOwk=;
	b=AgMBwVJep80mTkCslQW2ygdmrjhSaNDQ8+MHDTfgDrGwPPIFZhBs6tdEXkvnGEUky89U
	 WyU64iEpu/NYSDC3O/NjPhNaDoK04EmPlHUAcm903b0KRTLUFO9ya5EfbU/D30hScz9I1
	 bTNf0cT0LGvdOSLP8r3arF31oFatxQmdXh2fSVH6xwyRflqoSr5+gf8FV7JwP6wdtJmIM
	 nfdV7/H+tmc/czxLl3octLAJLCa7pUoKn/eBzVxmFP5X+6R308QAg7gvwFBS+84F50nAS
	 1iL2/rSbslWv2ALcEwnjFFFHVKV2PzmihrKT/PW+WJ+NzxJ7RTviQZn77Wo5cc+y5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n4HtF/wU";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17FB606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4HtF/wU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so341912f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876615; x=1794481415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yX5s7D9zQjVJIVM16uZ610BYYXHAt3Bx8DUuT1rWOwk=;
        b=n4HtF/wUtAa+dXD9MvE3PvN5R0dmBuCwH8LXJ18qdQ/5bRA+4dbljhoIEgom3+FESK
         2nWh85oVjoLzpZHMpA0/L3sovQe7ZiDCnUTPEDhbMWDazfMNpbMspUxPucnV/qZDKUJl
         8t0ZZjmaoFqt5WNAK22Q2C54f5/ouNIv40UZZr5dm2jPlet5q+6lu8bHzaAfFcGqbERs
         zAavqTu8AWBewo6LC+jrAb31ehj12KXi17xfOSS8KIC2fPTyEC6KzgKy222X780JY2Ax
         zG6OgtpeUgrFI7pqPjbNjdvkucbxKIq2fWC68+GcPMaC61Y6aswfopL3Zkqildj5Xa+m
         q7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876615; x=1794481415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yX5s7D9zQjVJIVM16uZ610BYYXHAt3Bx8DUuT1rWOwk=;
        b=E4uVrVWsVnCBrMWMbEk0CD+mMjq5+lR9cBRi7nIXbB9LQGKe6vxeYb977Eg0uk6aHr
         73t70o1HglsSmO0XE+471Zd1TEB1moLswslq3iT6iK2NPhlshfkB0JG/ZxjYUDajQrYX
         cfq3kOywOmZI8FKLqrJue0J5gBbUMfb1CXcVvTw8s590lWj4EdZFRFP/nPzYJlhGIj+D
         dLB2AUmx1BdcEbKSGCN0gy+3oLkVGbY6AU4hZH3JkIfZIcEWBYIioj1SUbnl5DLL8+E2
         ++mwbys/79VwjPTGUFZO0WWQTa7rJTC9DQadOgF/dwzYWtfzlgYN6X/V6jKeIrzjyQ/v
         ecGw==
X-Forwarded-Encrypted: i=1; AKwUvBwgxNPWbOAAllxogyYBy2p/YoaaDVfTpyLnxiSQahtZsXAzuo1sViPCVcb5Rt3F5ghIEopbqX27RNcgUlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nYaTYplV6fJfgCL05lJp9MPLsgpw5JNBabI8eOqIrngyjUnkC
	WqJq3XppMyDd9+iSkTNcbnC5cDJ5glukjMTwMigUVthClhHNAnEsUYPl
X-Gm-Gg: AYBFou2heKD0CDJmwtPX1JnM5YBrTRDMBKP5oX5po1O0+e/HmqzQQIR8/WVjnDylSWm
	P7S2vN16E+lbJVjt6FV9HeSITM0oEi7q0jWawCpPdTCAspOGQ21+NfnHMonaOLPtjHIFORS47y3
	pvEndWd7opXZ2fuOnlaKD2eKsJeCIYw4WecLueLv3fF/4dkgSfysDEF8lqfgUpfl77o+EWdEJhk
	aYMs1UbC+ME83dUOSxUhzpZNz5aULdKNvJIO4EmRXYCmdK3AelyBPY/Y8JYAAk1LenP+aIVP9jO
	gmeUq7tqqDO8rqdyBLDZsqi2/Wpr7Dq7fewUYFtLvUA4ewo6NkFI2pAR4KWYUfGNVe2f+OgmO0g
	eDY6uRvaDY5iCjSH80B4FXEqUqXX/gcVl4agqhpW/CZNF99s4ISPch+mc1THNCih2FYNAQJJeT4
	fxn/yGliBO0vcYyjOG/6UmjJ7EkfuhB+7uyMsUHOpLbE9UV61oXmOCJG7x29nFeFsFdGmaGa4/h
	Jojee99f1iy5S5mjEZvBJe/qjeYygGHF8TlVP40JOKuivt098CcKWhNDfH/h1HP/Gc047Mjsy3i
	QYLeBcrNYC18kqZPHa0i8kTyFSltkh2vg5x8ZIfpXNjiRYWUhufIs4aBmcCf63TP
X-Received: by 2002:a05:600c:34d1:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ac183d136dmr405416325e9.24.1793876615021;
        Thu, 05 Nov 2026 03:03:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed084f92sm9474430f8f.29.2026.11.05.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:03:34 -0800 (PST)
Date: Thu, 5 Nov 2026 11:03:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Beau Belgrave <beaub@linux.microsoft.com>,
 linux-trace-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/user_events: cast pointers through uintptr_t
Message-ID: <20261105110333.0fa21741@pumpkin>
In-Reply-To: <20261103163913.640876-1-sashal@kernel.org>
References: <20261103163913.640876-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 11:39:13 -0500
Sasha Levin <sashal@kernel.org> wrote:

> From: Sasha Levin <sashal@kernel.org>
> To: Steven Rostedt <rostedt@goodmis.org>,  Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Beau Belgrave <beaub@linux.microsoft.com>,  linux-trace-kernel@vger.kernel.org,  Shuah Khan <shuah@kernel.org>,  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org
> Subject: [PATCH] selftests/user_events: cast pointers through uintptr_t
> Date: Tue,  3 Nov 2026 11:39:13 -0500
> 
> The tests put pointers into the 64-bit fields of struct user_reg and
> struct user_unreg with a plain (__u64) cast, which warns on 32-bit
> architectures:
> 
>   abi_test.c:182:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Cast through uintptr_t.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
> 
>  .../testing/selftests/user_events/abi_test.c  | 10 +++---
>  .../testing/selftests/user_events/dyn_test.c  |  6 ++--
>  .../selftests/user_events/ftrace_test.c       | 32 +++++++++----------
>  .../testing/selftests/user_events/perf_test.c | 10 +++---
>  4 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/testing/selftests/user_events/abi_test.c b/tools/testing/selftests/user_events/abi_test.c
> index b71813eaf5c04..21e1e3cca1979 100644
> --- a/tools/testing/selftests/user_events/abi_test.c
> +++ b/tools/testing/selftests/user_events/abi_test.c
> @@ -179,10 +179,10 @@ static int reg_enable_multi(void *enable, int size, int bit, int flags,
>  	}
>  
>  	reg.size = sizeof(reg);
> -	reg.name_args = (__u64)full_args;
> +	reg.name_args = (__u64)(uintptr_t)full_args;

I'm sure you can't need both casts.

David

