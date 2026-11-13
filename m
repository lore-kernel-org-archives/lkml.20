Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585458;
	b=IkG8OgV93/rHlUjoM/AAJNNyLFOP1WTa86y6e8QyIYHnq/FEIrCTWQ6lp+kngI7+IRGm
	 Di1JvfizmMDcwORXvhHbgzPpJ1Xr7aIYjVstpTYYBJtrkxNAhXbu2gVym9y03D49IuMRw
	 BwHAKExhqTrQ0RuclnBNJTlxFyieqBNhBYmEBWk83qgs7D6lM1O7EAjdfwaK+xTDO8EhK
	 s7zrT4ElZVUxn4lrv3CiQ8uwApWfTsH2GwnqfRJAEtS8FyFuJiFbXydQY07TCcd+aVnN/
	 t4x+AGkmm7cUWkfJhufwgsggHelBeLxYF2SyoFsbguEc197VCXIWbU3fAhvmizFb9dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585458;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OLPlzBmIGcwx65jSMq2uJ6Gd3E4PNgtasDmsnHDmw6c=;
	b=H0gSxYv6fW53geG4sgKSYBmJz0Nw5TQnvJbwKRnzA7uE3yfD3GFY1pRFFTO2I38wcj6V
	 SPwPMnO3PcJrO8QPbrjQmIL0NZt5diQgcNnezVCZjf8meEHkCY/IHP4E2qnDoZplHBhC2
	 qkwJeKA75vddzqDdTdpNx7HvihuVMdkaxKvkohLcl7upJpBA7iWj/JPiifgknYs2N3Knc
	 PcPCnFrQHMGvTBSfsRPWtD+ivaSzCmOJHzHVQh9ziv047gAZ+eCEb7FkVru3b+F87XWwI
	 mlgc8h9GTXpLCJKb3559xRYpuOaIwQGteKVIe7evz+iKZEAl8Vde9Xm8ycX+7MJty3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IK4pYYxX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P8JhzZpU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327860A6F4F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E327860A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IK4pYYxX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P8JhzZpU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794585456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLPlzBmIGcwx65jSMq2uJ6Gd3E4PNgtasDmsnHDmw6c=;
	b=IK4pYYxXt5iE0hJfixngdZ4bVWvTW+7XXVnvoQHI5A3gploaeMLPFLPCgG8KVMC7vziQJF
	0z+AZ69ZyNNTkgz5wwomg2V4WZkAEApkJcCbFcQttMlTQ27G1LEerqpOyngijSTFfLcU7y
	JyyxubQqdS1EPhpr3yxJw7/T0dTAcLQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-5w_IfNZ0NtyPovfle-uEFA-1; Fri, 13 Nov 2026 10:57:35 -0500
X-MC-Unique: 5w_IfNZ0NtyPovfle-uEFA-1
X-Mimecast-MFC-AGG-ID: 5w_IfNZ0NtyPovfle-uEFA_1794585454
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49205554e17so624204f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794585454; x=1795190254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLPlzBmIGcwx65jSMq2uJ6Gd3E4PNgtasDmsnHDmw6c=;
        b=P8JhzZpUkTOzDQ4ODmJlWq9olowdwxwlVSFdM2DvBI7aQR1Zr8KlAvqaIMvyd+HWCX
         i10udXX9k4NWB2b1UBy7Fvrt10klAqOdnCzfewpIiSgfr1CtyNIls3XtDRuBQQVJhoEx
         g1pxYycHTW5g4vcSIBLJ86WFsSGbdObQac8ruq36xUk95BQcHD3fJphvmxBbwFlYc1hM
         OzW5tw3X+60fDaSxTrhMfkfzA22jds8fZasaQLQ8hqbQVE2j2FwZOA64XXLe2TgJgDkx
         Esnb9MA7D1+gdAeIyM7fqcSr+CwZs57C21Jjd6Y2vTORU7PsZsYNcCcba0AizVXRJrkN
         PR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585454; x=1795190254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLPlzBmIGcwx65jSMq2uJ6Gd3E4PNgtasDmsnHDmw6c=;
        b=rR80tpnDDDtO4V0nF37idtR5cap04PwTJH6E4+ReOc4lj1O2oKiNfGFplmeIEjH+H4
         LPRoJZH2gEo4pPSU1g1c0g0hl7J/6lINxsdazj1GMS64l71ugHwE8/OFqX439rRuT9uZ
         KiTWyYe/l/o1VGr4GD7C+ipQ5pNWsoniJB+vOlr6qkkrmCzibmHnJJlcluuPuxLH+dEn
         PzEGzos4xl37iAJj2rJr+ntjxnAMajevAregnHLIwhVgcfl3PqhvrvWKuA/2XKEOHx5N
         E5NF0J9UTN8UI/wPRclpIYe3D9hYO2FzCNRUx6yAqCdYywAkHzPB7kVuzp6Jbf2AScr0
         ZZng==
X-Forwarded-Encrypted: i=1; AL+hErFSDogMhmyOW46hzfBLbxVOTq4tnHBCEBvwiJXO0NILA13iWRqh1/KvFyWzpjgoPXeyPbqRyspicr9xPDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DLD7/SRtm2eleKG7bEdnRqUWNdoBRqOp17sCZ2Lmq5t8gyBRA
	CvcfSwJ6XrR9EnGuzcGBzGst7Vm7HFe0B9q9Lp7EcdFYpdxXvTt4WFDYrEEw945saamHrjTn+Tb
	nIr57m3VI/rfkINOkreoxR1dB/k6xvWbTRPGRlSYKR37CX54HZkX/mz7XEMTxhFHjJw==
X-Gm-Gg: AYBFou1KK8ANolzkg8Bxb0TkMS0BbbtOJBWLD8CeK2xdZV234fhdIxJw7yNF0/akiN0
	LE6BE68MVwIvuCOMISqvl+XrM3dH+N13VGN90GgkTsVQZo1wpwdYpuXsXyQML/pWFXxr/go7xtK
	HAmiBSm/LbKHSH4/S+GlAq3ibD2/6e/BFKm/32Vpcgkf7lOEvBXwW9rnuiHjwaPTo01f4P7N26Y
	UK4DcsiuI+gJCWzzBj05LF/8PjHjEajyeCZ4x9RmnckpqIeEWwnercyu0hGYaGKDdFzB2AicNqj
	uE2/llCvHUZiPJ3JpOJKYvE/C5QhXeb+bj1qlKCFN4knndPmuAu3pSYqibRJkH2uZO8UFMOYJdy
	rJNRDN+qBbyw03l/3aObXwlVeb+tzewMcb016degYClOk2h/CkTq32F4IaFac9TQWNz7xLcaKgC
	Pjtug=
X-Received: by 2002:a05:6000:2613:b0:48e:3085:7cf0 with SMTP id ffacd0b85a97d-49c7467b551mr5465785f8f.51.1794585454110;
        Fri, 13 Nov 2026 07:57:34 -0800 (PST)
X-Received: by 2002:a05:6000:2613:b0:48e:3085:7cf0 with SMTP id ffacd0b85a97d-49c7467b551mr5465726f8f.51.1794585453647;
        Fri, 13 Nov 2026 07:57:33 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60116323sm5776550f8f.32.2026.11.13.07.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:57:32 -0800 (PST)
Date: Fri, 13 Nov 2026 16:57:29 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 20/29] cgroup/cpuset: Give back the bandwidth an
 attach did not move
Message-ID: <avczaaXEh_xUhxpa@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-21-mathieu.desnoyers@efficios.com>
 <avWEta7b9X4K6hF7@jlelli-thinkpadt14gen4.remote.csb>
 <e21aaf40-b929-444c-b707-3200e21d7301@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e21aaf40-b929-444c-b707-3200e21d7301@efficios.com>

On 13/11/26 08:12, Mathieu Desnoyers wrote:

...

> Three new patches keep a deadline task in the root domain that counts
> its bandwidth:
> - Where a CPU is picked for the task, a CPU of that root domain is
>   tried first. This covers a CPU offline, a mask change, a wakeup and
>   a rebuild.
> - A CPU offline fails with EBUSY if it takes the last CPU the task has
>   in that root domain.
> - A write to cpuset.cpus fails with EBUSY if it leaves the task no CPU
>   in that root domain. cpuset makes a partition root that would do the
>   same invalid.

Makes sense to me.

> The bandwidth of a task then goes to another root domain only by a
> cpuset attach, which asks for room.
> 
> With admission control off, nothing is refused, and patch 23 still
> moves the bandwidth. So an administrator gets past a refusal by writing
> -1 to sched_rt_runtime_us. The two refusals are new behaviour for
> user-space. I would like your opinion on them, and on whether that knob
> is enough or a dedicated one is wanted.

I believe we already have (maybe broken in-kernel) EBUSY on trying to
hotplug last cpu with bw standing?

About a potential dedicate knob, Sebastian is proposing it as well [1],
so maybe it's time we move to that. Need to sync with him I guess. :)

Thanks,
Juri

1 - https://lore.kernel.org/lkml/20261113-sched_dl-v3-5-a76ffa1cdeee@linutronix.de/

