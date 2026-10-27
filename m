Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062678;
	b=JXzNghuqXO6hBszxkBSGvvB90cyX5gruSxQRn3kDj0VT+ihj0m5VP1gc8PAbWW5o0Ei0
	 rS68s5R2g74Ls9v+66S+LztHpAGKqYFN7xcg2v/XbCs6wM4n8KPTw208tm/4s3uk9/BpB
	 qO4LjVqh2mcRHDJJ4SngUcPxcpY11fJfZ22RiMbcP7oyZavfGmodjA4OWW3jL+Yh0dnMW
	 tdjqVKSEhsE482nBRabgfopKcZ/efsihl3qzJZyXGawKOqJ4YGX/PI/UhWwrocq2BWIlK
	 EFZHY8lGXulnUyYEj30X2zLz5wP+pFFAi0CDvPEdtN0gTxoJ96JYRzEkCaVvyAiqc9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PixEuIlz0J326DRKLzRZTRCRckMWEmO8LrFWZwm2Ojs=;
	b=1PObgZSR6GsK7E9WtiPPrB2XAqAsAuodf/nA8xOA641h1qqOWXk3iQHlx8K3/Q7jzBIO
	 gYV3V+sD0MTC03D4tHV+56o7+jIHcervEkpR5MqD/oZ/TPHDAf0Fja+AEHF0FewfhApRD
	 dWxa+4TD27lue0NlpU/mdnwms2n7mSFZpvH0dlmy2hL+iml/3wN8IfOdVzQIs9edy3/qQ
	 R4ntFchsv3L6KyyVGJGMoiwNa5eu/XbYMBz8krk5QENxxS3ZMwD/SQaNidPY0N7vEn9pr
	 cDgw7HJNRKenoHGVKL44+VOEGHf1dqiQOsXj2wo4PJIoSkbhiS8usWFsfYjqtS2ZwCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b+JD2N5+;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38925606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38925606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b+JD2N5+
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3fd91337baso512842666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793062677; x=1793667477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PixEuIlz0J326DRKLzRZTRCRckMWEmO8LrFWZwm2Ojs=;
        b=b+JD2N5+rYVooj8Ej/IvUFc1dN/wiaOUFruTy9kN63mrAIfXTfvhO71wV9X5nkq2PD
         wRjFzdbP1cL2mMyjlvzi7fQlP0tbFg82kYFbI00W6Q8xvpbRXz1boe0eAKHHfpEs07Hw
         TLSFRbETHdW7qxLZHEaTl0E6zFQed0As0r6q/xXozeJkVNdjH5M5ADoRsfD8xFB6jH3w
         zafLdnnkjqoYX9fTPaC6r2U1J1AW+bS4Fbt3cCsbY7EeivWpGTkNjNFqy90Gmec7L7+K
         nakS23YW4EcihM5dz8PR4wy3mHfkMFPrqKhRq7o7C+2k0BLyT64M2cju3d09MUD2c7yE
         6mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793062677; x=1793667477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PixEuIlz0J326DRKLzRZTRCRckMWEmO8LrFWZwm2Ojs=;
        b=d4p+CwYNlXzfeWFNbcwvmP/hUEDIJiUnh5Fn3Hr1M7we3sDAHuFwakbucSM3610W1D
         SezBoI1jpoFjX50m5j6eghj/FDw/L/rTuFjqcA0OEEjk4ffyzwWILKZRMuYYZdPb8dH8
         pM274x9b/sxoIhfnjnJ9m78CqdLR3Fmi4O0W9kqFDfXF8umlgHt/mQ8GDwQQrmNf+Hom
         BXHlvT4nB6O897tzXX/pN/42BT+OW9KAqlDBV9gL8Wt75F+S4UywrbS61ObULfuwt8pg
         VtFa6W3upfTgCOQhgJ5sdRMi/s0nzgmKPXzIE9eCAqqHzr2cCbMAIGXg7RVoi2WaNcT9
         rQxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeY3OIoS7waDtw4uHdWIBPGMvK0Lve20CfcPspMEEHEBKpzkNkWtcCGxY447tzWWoqhWmjsSjeNaDuzKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeUdS+9e+rtFaGd0F/3EYgRH9gyC7UvlQ/G0/CsfrLK8ZUPp6g
	8NuN1qiI+kmQ74bbiAcSY3SKPqiqpW1No7V6ikIVnugwt/Hsk2LOJQKf
X-Gm-Gg: AYBFou2FpiJkBnfV9/wmnH7+G8AAezZbmO9IutSbMATMaNwIqtE5E2sCbb+GU10G4mi
	b4z3swrICO2MzuMsTb3vK5RqFLIisL0rUca9BE+4cGy8oVf4mdmmYgYOGmdRVwLGofrhIpN+1Ki
	HAEpg4A/cVtrjfJxSbimvFnrfZ/YryXSi7u8HP1Fw8S8Z8DMx7H//lBUYYhk8lpXEjuHU6YHvMD
	L7B1dScnhUOXENbk6UCGROLE2i4Q6dFluktj2likWlAaBN322lxWn2mpDwsLtMv2Qu+EFFFTFMp
	xHDCd9HCpKC2fexRRsiIdeSlPgPPDTYGUKT7Q/aZfkc+kyD/QaU7O9aIGGzB32DFW7cxcniCVut
	RRoqXIZ5SjmIdoKaP+hi9zSfIigWL6cT5DYMiI7aKh+WCCj0mq0GTocIlfxuEMnQyGMdPLSf4on
	UF20XabysOIU5mcJzU21QM5hyKSlHVBvqYI+lEBIsuw3OqK3bI8+9MGiEy0rRq7dkz5tVl8nudr
	ggDRTMAqqVWreHsU4WrMASKS1m1KZXncDrx0uqYkMKm7aPQ/TYsbk2v8bpn1WVf03OwgS/WbH6s
	mKsGaXiqAVHXrliECyuKkIqCiXaC92lSlptAQYdtgH9RePzmcU5CCT3Xvby59ffhJM3Va2m5r6x
	lfFnwvlAr0ApyK0LOI5Ds6xH5FG9fp9bhv4ctXY1m6IS6htVqIRU8APx61m7ThHKKxwHokW5MV3
	xIuhA9QBjyvwPZAMQ=
X-Received: by 2002:a17:906:f593:b0:c31:8984:7fad with SMTP id a640c23a62f3a-c46bddf6451mr917653766b.15.1793062676398;
        Mon, 26 Oct 2026 17:57:56 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm4283637a12.11.2026.10.26.17.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 17:57:56 -0700 (PDT)
Message-ID: <083c2bb0-85b6-480e-afcb-bd2f386f2ddd@gmail.com>
Date: Tue, 27 Oct 2026 01:57:54 +0100
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
Subject: Re: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs
 stores
To: Ian Kent <raven@themaw.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 driver-core@lists.linux.dev, autofs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
 <cover.1792577179.git.krystianmkaniewski@gmail.com>
 <dc65c28e408d6b64d4b13b7ad30e5fe70ddaa441.camel@themaw.net>
 <4f56c93a9fc5fee152364974773df0a319c84af9.camel@themaw.net>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <4f56c93a9fc5fee152364974773df0a319c84af9.camel@themaw.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ian,

On Tue, 2026-10-27 at 07:11 +0800, Ian Kent wrote:
> Commit 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev
> in resume_store") looks like it's been around for a while so I
> assume the reproducer should work on 7.2.12?

Yes. That commit entered v6.5-rc1, so 7.2.12 contains the relevant
code.

I used the unmodified C reproducer linked from the syzbot report:

https://syzkaller.appspot.com/text?tag=ReproC&x=11c0f4c9580000

I also used the configuration provided with the report:

https://syzkaller.appspot.com/text?tag=KernelConfig&x=7d012d9c67977ee4

> What should I expect, a hang, it doesn't.

A permanent hang is not expected. The result to look for is this
lockdep warning in dmesg:

        WARNING: possible circular locking dependency detected
        ...
        &pipe->mutex --> &of->mutex --> &sbi->pipe_mutex

The reproducer records the first dependency by splicing into the
cgroup v1 devices.deny file. It records the opposite dependencies
through a normal write to /sys/power/resume. These operations use
different lock instances, so the exact reproducer reports a possible
cycle rather than deadlocking.

The write waits for an autofs daemon that never replies, but the C
wrapper kills the blocked child after five seconds and starts another
iteration. In my test the warning appeared in the first iteration.

The test needs lockdep and CONFIG_PROVE_LOCKING, the cgroup v1 devices
controller, autofs, and working hibernation support. It must also run
as root. Without lockdep, the program can appear to do nothing useful.

> Also it looks to me like the reproducer is trying exploit an
> invalid request similar to what I described earlier

Whether the string identifies a usable resume device is separate from
the autofs request. resume_store() first passes it to lookup_bdev(),
which performs a pathname lookup before the numeric fallback.

The reproducer changes its current directory to the root of a detached
indirect autofs mount. It then opens /sys/power/resume using an
absolute path and writes the relative name
"0x0000000004000921".

The resulting lookup is therefore:

        <autofs root>/0x0000000004000921

For autofs, this is an ordinary lookup of a new immediate child of the
indirect mount root, so it is a normal mount trigger. There is no
autofs mount under /sys/power.

In parallel, I am preparing a revised patch following Tejun's
suggestion. It disables splice for writable opens of
/sys/power/resume and gives its of->mutex a separate lockdep class.

If you send your autofs change, I can run the same reproducer against
it and check both the request and the lockdep warning.

Thanks,
Krystian
