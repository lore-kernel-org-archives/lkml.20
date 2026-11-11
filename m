Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430848;
	b=K4zEqsgxJc6TxZ0w/vbTMRf19NP41PeR7bE2yr+ouUraZWrVtBNY0+HOVIJ92h1NQQXr
	 22Eq0oxyKZpNanzjOKtvB4B5r60Tf8lu67/IkHMeJOocZH9Pq78/NZilUmJi6dm2PuV1I
	 O/xziWVYwdbxoiKubTYdLI7DnZMKwsHoP5MQwdoIquzSOqF5rci41UctPO4kpx5fx4212
	 kw7kmgzIzxQgNJI2SJwG4PBIvajgKgnPH1AxF0vCE14giGIomr5HzArl64a9eU6Sjc3cW
	 9ByNwosV1tRhqwbyAwCw6/7uL51R3VvBNliQkfIgqPJ2w9Pa3+9pSFRz6TVQoyRhsWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430848;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=UiXqhrqbmglfZobN9GIqHYTdJesjGb7wUn73x2yWjd8=;
	b=BnXSZQBrw8jzuS/U2bAQ5KqvKAHFaUj7rEqwfN5AQQTWCLX2I9cjg9bYHG8Uqwyou3Vn
	 8w+J0iHE0C3wCUi5VG0j2fosqsC40sbtWVY16lIon1GLGkliLYaa+Oo20h+1VBJCSMSzw
	 KjxyCSqBH6r8sDoQYr0OnN1mJHiM16i/ClYlCrcTy8e7q+kO3ZbaOmsE9o3xMvjatv64P
	 xbp+tE3p9s46tdZbhhL3PnY7o9gCzUJe9WNqXzVYuby82KIxal3Io06bUeqoHOui/L949
	 QZEy4ZGDLjQ5jLfCtJO6P+LpmOn/7IaCgn2c1uG9WzbD5t85jJ0W6G9b4BFQNpiiTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F3606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601F3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso4381986b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430847; x=1795035647;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UiXqhrqbmglfZobN9GIqHYTdJesjGb7wUn73x2yWjd8=;
        b=TodR7ACWdSuTZTrbfq2UjX5SbzAL7VuRpRQcv9vUrq6E83CdhWEmiVQWfg9qqCKVxr
         23pPn9IEr+rAsxmqZAj4LTjiOZoBcvIksBTl6cf25gdCh0kdznMB6jWKmvkXj/ef5AXe
         JpvXTUS4sorgkeawc/6s+Od1G1VxjEeXjV5UGfMgFAGMW8RI5LlB9xbriqMHT46BTxCe
         UaDaQVSlfLqa/ueVwLos+agOKE3BWcMQOQojTms6HavdQ69WJ7WN2JpIpeAaXgKznTb9
         3rltVrDeufIoTaVFh3jDb9zXPICCHJG3MrfUNdKnIoSZxm5ZlkR4ENhKQ1Q8RswDPnuv
         K6eg==
X-Forwarded-Encrypted: i=1; AL+hErFbwC6G0MD5PXz/+pMraYSNiCqCpPoByFsldF8SomunG28v6EyalfzZsNcafrf6+gY/BtJ/aMQMZFwv8Gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AEUXrAN+RCk3m3JjmEtHPNGFTdYoBIRtnatruJw86i5tTQ2oy
	FjghsGzdpMvMxs+2RQXHBdZtrW7sh1DJKpoTEpnavHNZcKACrPwBM7Xzy7d/RHzU4M74u1nr9it
	e6XE0cigNmxn+zICsFnpyN8Tzv/5sUoAiAgC2gKgG5KkDe4sqRUeX6uJ6F14=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:150d:b0:4ea:686e:fe86 with SMTP id
 5614622812f47-56b98227486mr3327304b6e.63.1794430847269; Wed, 11 Nov 2026
 13:00:47 -0800 (PST)
Date: Wed, 11 Nov 2026 13:00:47 -0800
In-Reply-To: <20261111210000.302485-1-emmaonana18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af4d77f.b1d299f9.122b8e.0001.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in stack_depot_save_flags (2)
From: syzbot <syzbot+1827030ed7bc886dd0a5@syzkaller.appspotmail.com>
To: emmaonana18@gmail.com
Cc: emmaonana18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 90c52f2e0d3f4..da4dba8b40bd3 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -299,7 +299,13 @@ static bool depot_init_pool(void **prealloc)
>  		/* Bail out if we reached the pool limit. */
>  		WARN_ON_ONCE(pools_num > stack_max_pools); /* should never happen */
>  		WARN_ON_ONCE(!new_pool); /* to avoid unnecessary pre-allocation */
> -		WARN_ONCE(1, "Stack depot reached limit capacity");
> +		/*
> +		 * Exhaustion is a handled resource limit, not a bug:
> +		 * all users cope with a failed save, and privileged workloads
> +		 * (e.g. BPF JIT churning unique stacks under KASAN) can reach
> +		 * it legitimately. Keep a one-time notice, not a WARN() splat.
> +		 */
> +		pr_warn_once("Stack depot reached limit capacity");
>  		return false;
>  	}
>  
