Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978954;
	b=FlXuxzoV8TVcN8KEskdkVT8Dtblt6Vt43L7qElL/hGpreUKg6jvWUH3CGsDDUPOzxU4C
	 bQl+EU7wanfIel9D8HPJcf+UboUz9i47gygbuJBW+HizAuK2yPnyWM/gnwOtLAubZJSWj
	 IpU/tj5TRLBRUSeaVlR0wIcPEtq7F+gdTpfbskhaAmBi++F5yUxTXSAibnOn+vpdvR2Ld
	 fFGjYnBHAXKODvuZHckbR0eFuqy7fiboJGFd6xCoBlm3dwpGGl9luoHIoOjdm/9yTQECM
	 uYkG7DeI5i5irKsEeW8J6CWmf52meUtSpDNJR/2X5ONW1/tiKfP2eW3N/z6Yfte4nZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978954;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LmTzqQweiyKU6xuO3QveE/+1/71DKsDi9B9HZdawRTQ=;
	b=QafiShvfqqGHkszD79TJo6JKlt/si7MBhIfylbGMK1PfuuMjLnG1uWD+F1L8YwYM321U
	 yyGLxvBdIKXWzcrWnH8hc7dzDt6xncVbHWuanlQJmIMgTmr5NmtxZYuaWuacjlcAkpYw9
	 Eh7n3PJ17S81qokvwXRFyHd9sSZtfY8KJviEpQEHUrYOZwSTxdywibufJXJKfn8RVMAJY
	 u/VYgXfTh4Nrx194fnAhPMqee6Nb4IEknk+seX2dtWNgA3JWGZS9WqH7pbXvNzqAFdivV
	 5KV8nRZtJ1nUOC36UhysFU+9cGldp441BYI4971rxaKpvELi1wamRHfMC5tjB/d9VPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="CbNih/AB";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G2wJ8ZcA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0685606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0685606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CbNih/AB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G2wJ8ZcA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793978952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmTzqQweiyKU6xuO3QveE/+1/71DKsDi9B9HZdawRTQ=;
	b=CbNih/ABIS1CIje6DmbwaVPvpzYFw6NY48DQ/ZGP8RXbSSsqbpTJpFmZ0ZiFUEfiRPlrhk
	cBWGWuH4U2DbbRUGS/fDga/+pOKvKXJAulGsNteQSAf6azT/W1F551r+i8Fhbz37HX/cOb
	bYqqNuCtwKNmVjN6EezVOBVr5UBL0Io=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-ISxEqImWOYO7QzC5_dUF7w-1; Fri, 06 Nov 2026 10:29:10 -0500
X-MC-Unique: ISxEqImWOYO7QzC5_dUF7w-1
X-Mimecast-MFC-AGG-ID: ISxEqImWOYO7QzC5_dUF7w_1793978950
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso6322585e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793978949; x=1794583749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmTzqQweiyKU6xuO3QveE/+1/71DKsDi9B9HZdawRTQ=;
        b=G2wJ8ZcA/NufPQnB7KolE4QYqOSKr0STgzeNUNBsjXMOPHiwV4tB/mdTnwI9BYs9Z+
         quF5mH2vBRGODL4tDAg6wczisjatIE6Zq7X6yybfiQNg6Oaz8D11X6slRzw1J0EAtb8v
         OryiQ9Qqdp5Up/dGlAZYXYAWCcyLHNlcPiXFKZqKf9QD8Hi+GqF+wSYN9gNhTNpNSH6H
         5H0GSB9DZw0uQ2MXYAdyr21KscmCgOf5CNKB1GLMSTBfV5yGIQVwZv6trNwplOtb0Dsx
         1TCflw22CKcC4VpLRQED9wpE8gOJGayWSMu7eDUpH5qUXWpeGmu1/L91DyG6xZTs/XCe
         vMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978949; x=1794583749;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmTzqQweiyKU6xuO3QveE/+1/71DKsDi9B9HZdawRTQ=;
        b=szVhLEsRPyCw3XvC/cVPQysUZpEjcpdq6/1djpnjxMGO9npsdWhGFli5y00A3qRDzo
         58nKwxAUvLKgzhPnQ+A6Ni8ivzRcaTLY1mP+epJhsw3MMOyqS2nOYGJbuDFeJlucDbtz
         YUwjZwRhTpV7nUcNrdxhWlS/qx8wYb1F0A4flTp/4WOmGJtWeKu5d4mu+AxM9jf2ovp7
         o+H1Fm2Zs87v/E9LdSLIDYkBwlvUeC977NUef1MxfkSASspFzO4t87WOqYu8cMAqktF+
         f94Hz2NYExUXAprN+wOhI7fH+0PEs98m3bScmU2r6ItnEPxXB868hSVrtoFprrEiHvkx
         U7zw==
X-Forwarded-Encrypted: i=1; AKwUvByKEiCFeCQ0+sPTLG14gN2YZ2Pf+hs6/Cki5cHzFeiimnciakaB9TjD3ChyQQWFiPKxLnQkLIxu8Y8S/x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WUCz9TmMzjGN6cGqk83F7g/lgENc8VI/BwAjF2VnyJEqZZjf4
	k4hOt7td+4+Nebx0Vz8V1dPUsWw49ReqlsX1sgm25vLETeDW2457B8lmC9sBlbw7+wpBbFbdUjz
	xGcwxCDwJvCh7Umz5eBfdBCefsKrDjf7O3PRc0IQjq8SfF03QT++wvYGPsKTkEdSURw==
X-Gm-Gg: AYBFou0uGI0ojFxrb+U6vJxJHvlyUEupyafSvTGr6NpZx7hd02Xs0Cn29Pgo0e4T1gr
	CGNLxVTinB+Ayz8340jMaG6DCst5VUNZA8VGuoI3czAgG41NNApmbFdw8v6SpCB9HLNUf3/TL8w
	OoBz8XRdu8CcQlP9c0j6UMQWj5DtdvkGeAyih62W/+jWJeD0clS1PlvtmpmmDEDYawmJBZKBCwh
	YSJCvXvCVRdMvHtOu/fbYfcKOGnL5mU+AWtLdDQiIUXoiPIPN+zA2WLIPLrbUwrUNv7LSj0cVHA
	jS6zDGnR+s6yHU5MoGfdlNuKW13rLmoCqOLxJYJBhLvepu3H2HAhi2sGLpzIKgcI6p+30jmAyMW
	29IzmMaugGnJ6AU+BPLE6XSElMWBv3hMR7VvVsb6vLTGXJpiNGgYvW8FHqKHCbuHVXZDFgrLDit
	SOrDeJ26ms3gGwjldqhdmSY3GB9XNuqqIibw==
X-Received: by 2002:a05:600c:620c:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b6dea6881fmr50781845e9.11.1793978949657;
        Fri, 06 Nov 2026 07:29:09 -0800 (PST)
X-Received: by 2002:a05:600c:620c:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b6dea6881fmr50781475e9.11.1793978949328;
        Fri, 06 Nov 2026 07:29:09 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm127063625e9.4.2026.11.06.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:29:08 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de,
 mingo@redhat.com, oliver.yang@linux.alibaba.com, peterz@infradead.org,
 rostedt@goodmis.org, tianruidong@linux.alibaba.com,
 vincent.guittot@linaro.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
In-Reply-To: <20260821171127.1061494-1-cmirabil@redhat.com>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <xhsmhecjg38no.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20260821171127.1061494-1-cmirabil@redhat.com>
Date: Fri, 06 Nov 2026 16:29:07 +0100
Message-ID: <xhsmh1p8you64.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 21/08/26 13:11, Charles Mirabile wrote:
> Hi Ruidong, Valentin, (+ copying in RISC-V list/maintainers)=E2=80=94
>
> On Tue, May 12, 2026 at 06:16:43PM +0200, Valentin Schneider wrote:
>> On 09/05/26 11:50, Ruidong Tian wrote:
>> > task_struct keeps growing over time.  On architectures that compute the
>> > per-task stack canary offset from asm-offsets.h and pass it to the
>> > compiler via -mstack-protector-guard-offset=3D, this growth eventually
>> > pushes stack_canary beyond what the target ISA can encode.
>> >
>> > On RISC-V, canary loads are emitted as
>> >
>> >     ld	t0, TSK_STACK_CANARY(tp)
>> >
>> > where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
>> > [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
>> > the build fails with
>> >
>> >     cc1: error: '<N>' is not a valid offset in
>> >         '-mstack-protector-guard-offset=3D'
>
> Thanks for this patch. We just ran into this exact issue during a CKI bui=
ld
> https://datawarehouse.cki-project.org/kcidb/builds/1639782 and this seems
> like exactly the fix we need.
>

I've also been pinged about this exact failure;

Peter, Ingo, do you think you could take this?
I couldn't find anything better than to add a LUI instruction to stretch
the immediate beyond 2k, which is a bit wasteful. This looks okay for now,
until someone smarter can come with a risc-v specific improvement (or the
architecture grows scaled immediate offsets).

