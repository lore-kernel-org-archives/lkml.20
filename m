Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307115;
	b=o6rHx1mDGo5Ru/Qwd4DpW3scmXuD478Hu3/YrUiyQ1IOrY4ltjsVvIKs6QVScaQ1Px39
	 qY09ZH0YQHgE2oKOoVOEc2USqoh+k+u/c3Oi6puaQgpF4gH9dnuZWQ17xcuMHQ0ksqoc2
	 lVz6LZxfUP3x+6mSP5OsadAddUMrleh5jtVONsfKYeuvvZDA0+8HYdL1pi2ZBioPusnp6
	 DBptWvyoThlXqyOYKTWRAKRIT+cokAZyqxVvtF/0EvWQUXTk6S7rf4Mcp/inUblDmzSSy
	 E+LO6Jn6PEERQ0b5cHMl237vn/77b2h2ZB/fc9u+5dLHvRN+pXTOIvph0xdsQQ0V53w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307115;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=b7RsvI0hOcJh521Z4xHa3Ewqq2iR4xhkA+9avBbw1hw=;
	b=Ar0Ocq0BIk1Hk6Pf+6syB2eWIp299dQ/vVoECp4HhEWJ/GXZUkI78JeVtxr3VNXHnW/+
	 1Q3b/U8FZlh7+Gm8jLd93PHhzEomhTw8QxuCPrFc6kfnM01esEM+RpoNKukYoOIqY+Keo
	 9TFh8TsCFLfk7gsT4NKCgXtcbJqFfkTc58diI+QheZAGswggZ/WX9zgyaDBw+HiL03Hzj
	 g34Cs4BPEoyTegdee3R+dZgFOfli8tmoY3KbxyCroj7oLjMYZ1sqN5Dl8Pm10aQNV6jgW
	 Vtzr35HNJMeZlLAij6rauNbS4XFxjyoSsyjuA62dBNaIco1IaP9EG6kWqyPlLpDP89Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m6bv0c2x;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170BE60A261C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170BE60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m6bv0c2x
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qSCjsS16AB3q8ughFksRp3XE14xTUtnLCcAS81y8Ffw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793307111; v=1; x=1793911911;
 b=m6bv0c2xZn+pdnmXJw6QEQZn/I36tV4xhY/9qF1d1sSjgZJRE85Qgip7x89afom81tclXaxl
 l12KD/MaDxE+fjO/sAk76u8QG8f1THY7dniGKJOwwvigVDWV0v1JZXpElLy4+qHm0q2VrUJhdkk
 nEZjjIex93Q7NciJD4eJMQOU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 12e923243a9eb27a;
	Thu, 29 Oct 2026 20:51:51 +0000
X-Mizu-Trace-ID: 12e923243a9eb27a
X-Migadu-Flow: FLOW_OUT
Message-ID: <3c020a05-5023-4aa9-98a9-b9cd1de3b2ae@linux.dev>
Date: Thu, 29 Oct 2026 13:51:45 -0700
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
Subject: Re: [PATCH vfs v3] bpf: Allow bpf_d_path() from filp_close_sync()
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Christian Brauner <brauner@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 NeilBrown <neil@brown.name>, Jiri Olsa <jolsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261021201400.5409-1-ihor.solodrai@linux.dev>
Content-Language: en-US
In-Reply-To: <20261021201400.5409-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-21 1:13 p.m., Ihor Solodrai wrote:
> The d_path selftest closes its descriptors with close_range() so that
> its fentry program on filp_close() runs.
> 
> Commit 056069eb2b66 ("fs: make close_range() synchronous") switched
> close_range() to filp_close_sync(), so the program still attaches but
> is never called:
> 
>    test_d_path_basic:FAIL:close trampoline for filp_close was not called
> 
> With that series, close(), close_range() and the closes on exec and
> exit all go through filp_close_sync(). Few paths still reach
> filp_close(), dup2() being one of them, so a program on filp_close()
> no longer sees most file closes.
> 
> Allow bpf_d_path() from filp_close_sync(), but only from fentry.
> filp_close_sync() drops the last file reference inline, so by the time
> an fexit program runs, file->f_path may already be freed, with no RCU
> delay for NORCU dentries such as pipes and sockets.
> 
> Attach the selftest program to filp_close_sync() and keep triggering
> it with close_range().
> 
> Add a test rejecting bpf_d_path() from fexit/filp_close_sync.
> 
> Assisted-by: LLM
> Fixes: 056069eb2b66 ("fs: make close_range() synchronous")
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> 
> [...]

Bumping this, in case it fall off the radar.

bpf-next has the failure right now, we apply the fix on CI.

