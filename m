Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431612;
	b=DLhs0zKWws1nBxgc4HgNgEUiUtUT4Gb+UKAB78Mhgiuaa8ot6ITtMBZ4iPUksnuPE1Np
	 zlSjVUvSiMtZ6rW6nbQ3MTG0nUVOHNzI3DY3I0n4goPYAM0G9dv5AgQ/clRzZb2HYILYp
	 flzRTzY3EmaPfnr/wlf81CcE6hWWmpsWcGT4siHk344g8eGJ7I0TcrDIQ9kOgDq2Rkbpu
	 pfp9ngoElqF2jS2UO5eoBNc3zIHp08p7jem4yuEXSKZ+TB965LKNoAvwbufpRzFZNkPFj
	 hfIJXYdcx5yRU7bIhWBpW70PEFb3O58CuDcKienye9h9nU9OgsH2tQz0absSiXaxSKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
	b=Z/tWJN4BunQ/tiUaz/NoXMbkNsI3aNSP/BIaGFEhlUjuMv1EVYVFj4Rbc23wVZNny5iN
	 /jY+O67k5I57QHe0SksQLcmB8wTAMbVvMFjCpwzV0giKD8AZoBxYZRXxm/bOxxMZXHgTI
	 XB1EabrRX47PtKOqMidvOqwHr5SnnoiTc+ct7Iex1YDvohwlxJHb5Qt3tYJ61nBnddE0e
	 0PVuu/BT5uVghTcDAJx6+jHtijRBLdgUckSXk2yn0gpN++F8qkJgoWGAXi79p74MZdgY/
	 XIAfPB04kLjEsedfW9KuAjUROUwrH9bqrZ679rHZ8g6YsEhLLL/eKhybVxGUj5LBzsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lOKYDDEa;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377D606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6377D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lOKYDDEa
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2367794137.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794431611; x=1795036411; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
        b=lOKYDDEaWLLmAvnd3LQM0bZSGO0Yo4zxUjhMLVMO/5rygvi8q8nMWDBolKHpWEnZ7I
         8IjHA09+4z1l6wWIPKTnsWvBSjL7gYDA3ctTpeAx6z9ZK337J6Uf5jjqFo6G3+wBdeY0
         dsYm8PuwGPaQ1azj/WiNEYekFt/Vbp40p4yon3qKCZ+EUmprRGmN0dxN7v8AxfFM1AFa
         62G1cV6MN0GEOuYVWOf4swqYwLcEmmyAgk9tMyz+iwa/jiUA1R6LHxWtIcgpkT9qAnD+
         ulFbXBewxvne7l4vQnGgmrXU4rw3c4cxc5H8SCq+zK1ahVJkKWQMH2F8eKWHTiT1Odli
         f7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794431611; x=1795036411;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
        b=t1l7jT1uBlpBLW5tdt0OQGp4kAEzbD37XmZ87YJkNiAFHyCqR4aAf/DcT7y+QhF28R
         1pPH1jgrvBgMHUiZDAnADt4E//nXa/h9wrnfdB8X3aUfbDnrKdNteC2h8ztERw86fMEv
         XXUUHcP82HawB7Gatk0HXcMrlu78w/iF5CHV8om8yimp7KSza/4CFfJb7blc0TBQFwzx
         VhMTljktJiZ5CbMOfKHXqKnvmLa05xhqqrSM0aFl7D21u0TjYBsqe2XD6tqTYeiK6gtI
         d7Nind6eSOl2YjPF0IkaMbUTymnSxh1VoeYbqDS9tYZ1iTtED8wTE0mZZZssEOsoOFP6
         2kng==
X-Forwarded-Encrypted: i=1; AL+hErEto+s/UY0358EtSbgTr+/ANbCXbrTp+yb3jCyF+nzCjfUPUl4RPgyns7vpz6I8EwkVsHa6piAoZwltfuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0H2z5zyfo63U6UpPQuE4r3F9LMnD5Hd33zRnDJopVdwnnBfNV
	2wmhALMgHSFy4hP9FfCvIZn2zCFu9V30AjqjavoHLsP1xSncVNGf3GxvtGVOsi6u8NoAf6htqcs
	cadB0
X-Gm-Gg: AYBFou2vsGEHbfy5/izASSepYf0egF08KthMKW4SMqldj6YNVCKLQCmUn9dJmGKKIOk
	zPYzhtx4SktgU+w4vT3cHtkYjfyeIpJQC1U2pY36nNp9iuWEwQwFSNX04Ieso8/7WGjdl7LSCmd
	muubwFKyBqgmQqHKv0uce/dobs4Wrl8u2y11q7P/QlzlnIrhFwhfYHJqAioOFMV7JaNaws6OCQH
	2H2a62EFE2zzF0e79DmCIOvb+uhh4E6xD7aHXPzN1zpxrTr5fYJj4/OVrf616UAzKeRhazl2xBM
	KcRmuW39PVdIiypD4EIYCtWJXvTXOVzFiwjCLfTCLx3UvPZKtIDRIbs3oBhU9w5Mvt3DJ7H91pv
	/5loLGQxtbUhrzCZjDR2F9787ef0/RfyyEybQzqtg3txGAYwJ+sYIqjciiUZE2N+r4bW/2PGyFl
	/o2v8Nv3I/U23lwVvOlVUqbzsbmVzDrqkBlphYLM62M8Hwa0l7sRKUkuNKfFzou0ofwlmLQXK5U
	y0+cd28bEqOKPS1my1QOFiIr40sB7mTF1xeczvSQxu94dbmDqM4loVT0DJOTirmagX2OKGINbc/
	fgOMW1U366HMx4TJ0olaWQlGVDM1PlfEMbv15ZbMcDnZVzqfxYXl5NyfqJnuSpNOd6L7/kGny4H
	m0zgv+1GSQwWXMiiJ0QFV6M73LsDg
X-Received: by 2002:a05:6102:2d0e:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d4fb2577edmr1659351137.11.1794431611247;
        Wed, 11 Nov 2026 13:13:31 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023838a9sm4907083137.7.2026.11.11.13.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:13:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 16:13:29 -0500
Message-Id: <DMSOX12JE1BL.33ASGRFO04NUM@soleen.com>
Subject: Re: [PATCH v5 5/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-6-pasha.tatashin@soleen.com>
 <179439592041.425130.6098227055493441109.b4-review@b4>
In-Reply-To: <179439592041.425130.6098227055493441109.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> Currently, LUO sessions are frozen automatically only inside the
>> reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
>> iterates through all outgoing sessions under global write locks and
>> freezes them serially during shutdown. On hosts running multiple
>> workloads that quiesce one by one ahead of kexec, userspace needs an
>> explicit per-session freeze point so each session can capture final file
>> state under its per-session mutex as soon as its workload pauses.
>>=20
>> Introduce LIVEUPDATE_SESSION_FREEZE on session FDs to freeze an outgoing
>> session early. The ioctl runs .freeze() across all preserved files in
>> the session and serializes their metadata. Once frozen, no additional
>> files can be added to the session, and subsequent freeze calls return
>> -EBUSY. Freeze is only valid on outgoing sessions and returns -EINVAL on
>> incoming ones.
>>=20
>> By default (flags =3D=3D 0), session lifetime remains bound to the sessi=
on
>> FD: the session stays frozen while the FD remains open, and closing the
>> session FD before reboot (for example, to abort the session or on
>> process exit/crash) unfreezes it via .unfreeze(), unpreserves its files,
>> and reclaims all resources. During kexec, already-frozen sessions skip
>> the late auto-freeze and are published into the outgoing KHO subtree.
>>=20
>> With LIVEUPDATE_SESSION_FREEZE_COMMIT set in
>> struct liveupdate_session_freeze.flags, the frozen session is committed:
>> it and its FLB dependencies are immediately inserted into the outgoing
>> KHO subtree via luo_session_publish_one(), and the session survives
>> close() with full ownership retained by LUO until reboot. Once
>> committed, closing the session FD (or another session failing to freeze
>> during reboot) never unfreezes or unpreserves the session, allowing
>> processes to hand off preserved state and exit prior to kexec.
>>=20
>> Update the uAPI and core LUO documentation to describe session freeze
>> and commit semantics.
>
> Please teach your LLM to use shorter paragraphs, focus on why and don't
> list every implementation detail, but only important ones.

The first paragraph explains exactly why; however, I agree that it needs=20
to be more concise. I will address your comments in v6. Thanks!

--=20
Pasha

