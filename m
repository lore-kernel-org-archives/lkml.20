Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574359;
	b=uvYA/OYQB+rDnpMjLo8PUdiaDl07DM9FZk7dykArDmQaIGFqMF8HZLQQSplrGzOUHq3W
	 AqEl84jWHMU7X872j614iqilDG+WtaOIWFFeDuHMcyLcfoZVpBeeTW+G8hw6NWUR1tLNP
	 qv/AN3iCXTL5rocnkd82lqmjRaY4Rld2bIee2aHAHugcfZ20m/6o0wPAxMy9Rh4vHdQVc
	 EVNqJD5ZEVg3wKwCkSvB8zJBraONGFbuljtJoyI7PI7hsX0KiyKGqEwaJrg3TXfErlgfr
	 1G/LFsQ+SxZV+c7kTH+8ybnMs0Q96kC5Cq8XvNc/2n68JbMbD8Bzbu8qZ2A0TBTvKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Content-Transfer-Encoding:From:Mime-Version:Subject:Date:
	 Message-Id:References:Cc:In-Reply-To:To:X-Mailer;
	bh=vsvfEz/JXaM3emjEVz0W8hj1SjatUIAGiMufiOo3KXw=;
	b=bu6PH5OftLEZ0SM3rM/81VLFaRdHUo9JtWD2VfJW+bbtQBSPazzjiSRL03MZUIWfdcAL
	 7lpjORFHxzgXzKEYDvwBQ4RYRSLv74CCtYUP/oWbDfl2DSQQ0m/GbvR4i2HLucauGHVmh
	 eH2dEKLa7uWr5EgfmZ9fhrwFC7btE03PMNnp9xW0pU+cv6SmWhbs3iSd9yHi2uxM0diO5
	 4Dqvqi8lxeV97rsRz0ojQWo2Wf4kJZOvNN34KlXuQjCJecEcKaN6o9u+PnQmRqZmVLqoC
	 ZO++dBRA+02lL4bCTywxPR7qs2u7Z1oLxbf7YaGy1SiGQgp2/kPU8rEVK8NvvZ5iWnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=joelfernandes.org;
	spf=pass smtp.mailfrom=joelfernandes.org;
	dkim=pass header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=sye1zQCf;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5EC606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5EC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=sye1zQCf
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-537548b811aso5443861cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1794574358; x=1795179158; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsvfEz/JXaM3emjEVz0W8hj1SjatUIAGiMufiOo3KXw=;
        b=sye1zQCfa/2xWnnilpkHYYKMj3m86qO9jxoV8NCvPRh9QXDt3mmep1Lolke49cTAQ5
         qUKY7lv/YhiFoh1jIm0S2QudRTJ+aZFLJE5LbOYRMfQDxeGUOkA/M2T50YgrnPVaGplr
         x3qpIQOlSRHAdRKse9Er6DsXZZmgGvQYe4hMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574358; x=1795179158;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsvfEz/JXaM3emjEVz0W8hj1SjatUIAGiMufiOo3KXw=;
        b=VbL5bFRGKw9zj2lo2hsxgLCcfQco0Yfp5pUQIzKtUfhTm0QnsBGdkQiH5RsEkuAGbL
         Qr/5EWMzIOgmjroYzeDEt29aj7k6FcyAmRF586JooIRic8s6W6OjEk2ao7P1C9umwqD0
         dh63tx0qS2aYh8q4D4+Bo9PqboItZ8U34aTA2kpw3DArmrsLxFEfB+QsgxntufA1+Ohd
         bjHQWTr6Mq5gHiOOENKCUZQqMo68IwYhzTfM7fCuLOHctSr4tsPKx1OvHGJf+YoZ/2Di
         87A97orcqAEBS9LvgNMLAFj9uHxNKKmZrS2PDee8pg7ZaCrWjvBb9cDbZjaV2uW+x5JB
         zewQ==
X-Forwarded-Encrypted: i=1; AL+hErFU55nj6EWlai5T2anjDF/ScWDuLAe3aD01H0//5Li93msNA3r27Cmndx28Pis/ulPZ1H6Lx8Hbag8yO1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OrU0t/viMvx4GaBG12/xBPTBnIXZfCkhBRgO5hjXxA/3ys+Bz
	gJyBYO5aGsP3DWbufmg+2POczR3hDhTaONrPuN10CDRMesyXsC6/Kn+yUtS8T3Z3NYU=
X-Gm-Gg: AYBFou0TMv1slW/7E8n3f+m+JP3IT6B7qpA2i4UTs+OIejXWaFkSZZvbRQFznu8KoqM
	HmHacgZLLXJkbwB6twuE531JKUe+wDRb6eA9GtCnekMCObRcxh3CHwGb+Hhg/osScVNNBz6hdEn
	vedoj+YIhuiodVXedY01xEqr8Wl7Uit6MhDQYAtg+NUVdzPO6ww3T3yepZNzqW42yvWCvEWOkAN
	mzqL/KiQ7fx/qILelTO2DZEXqR4HWiiub5u0Cs9cOorQG6zR1egtp2GdmzOG3oK+am64pvigAqz
	2Ibx4VwgxUYy3kTbozxlhVEmwOVNz6pf7vvmRDHGXwTrYuv+IgHpNPy3InxwhbdexllQW9oaRAF
	MyK6+WJluWr5r4+8J3PpJ8zwMOFsfJ40VybkmsP2zky6qLxLRljTjlYmuGQBmMfNyHI/gUNPO50
	YSGSlcVulCKjFE8g8HWxr23Q3ZeCcGfZU6aYgf0prNysdeAZFcyfqEXzqxn4kSAe3D6KIzmDHMR
	a85ouX2uf2qF1XfVQm3erjp4eeM7rKj2tqu1fW5+/N99uvNcHzQDSue7jSeYPVLJ4tbgwfrLvoz
	XpcFzIoskM+kMb9Sgu565SyHWkulWE2PkVqHLTjq6q7gUu2nZ5vWBSjVj+gviX/k+Cvk06lJtDY
	M
X-Received: by 2002:ac8:610a:0:b0:537:6f12:69 with SMTP id d75a77b69052e-55ac888b9a3mr39211601cf.45.1794574358087;
        Fri, 13 Nov 2026 04:52:38 -0800 (PST)
Received: from smtpclient.apple ([71.51.169.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0f07afesm17600871cf.16.2026.11.13.04.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:52:37 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH for-v7.5 00/14] RCU tests patches for v7.5
Date: Fri, 13 Nov 2026 07:52:25 -0500
Message-Id: <13A75D0D-C6FF-4AD1-AB43-734444FB5762@joelfernandes.org>
References: <5F3EC480-DEBB-437D-B433-2361A5CC05E0@linux.dev>
Cc: jfern@kernel.org, boqun@kernel.org, frederic@kernel.org,
 jiangshanlai@gmail.com, josh@joshtriplett.org, linux-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, neeraj.upadhyay@kernel.org,
 paulmck@kernel.org, qiang.zhang@linux.dev, rcu@vger.kernel.org,
 rostedt@goodmis.org, urezki@gmail.com
In-Reply-To: <5F3EC480-DEBB-437D-B433-2361A5CC05E0@linux.dev>
To: Bradley Morgan <bradley.morgan@linux.dev>
X-Mailer: iPhone Mail (23G90)



> On Nov 13, 2026, at 2:28=E2=80=AFAM, Bradley Morgan <bradley.morgan@linux.=
dev> wrote:
>=20
> =EF=BB=BFOn 13 November 2026 00:57:27 GMT, Joel Fernandes <jfern@kernel.or=
g> wrote:
>> This series has the RCU tests patches for the v7.5 merge window.
>=20
> Thanx for keeping my tags, mind changing my tags to my new email? If it
> doesn't pain you too much? New email change is a pain...
>=20

Yes will do.



>>=20
>> Fu Wenxin (1):
>> rcutorture: Fix busted_srcud crash on module unload
>>=20
>> Joel Fernandes (5):
>> kasan: Avoid an unrelated RCU warning in the callback test
>> rcuscale: Consolidate per-writer arrays into struct writer_state
>> scftorture: Reject empty workloads before starting helpers
>> scftorture: Protect the initial affinity check from hotplug
>> torture: Forgive SMT-control failures in CPU-hotplug testing
>>=20
>> Kunwu Chan (3):
>> Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
>> Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test
>> rcuscale: Add srcua scale type
>>=20
>> Paul E. McKenney (2):
>> rcutorture: Enable RCU_BOOST where supported
>> rcutorture: Disable RCU priority boost testing on non-TREE03 scenarios
>>=20
>> Zqiang (3):
>> rcutorture: Fix suspicious rcu_dereference_check() usage for
>>   trivial-preempt
>> rcutorture: Make tasks-tracing support duplicate call testing
>> rcutorture: Avoid create fwd_prog_tasks for tasks-rude and srcu-atomic
>>=20
>>=20
>=20
> --- Thanks!
