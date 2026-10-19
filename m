Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452937;
	b=T0utKoqxYnoQEHKgjAYGQRVyHEvLVQtHmeBznibQ6IayPrnk7mUGmpRQj4nMbQ4rOIRG
	 EfrXybsHzsQ6/b73vNoZ7aTXfY8snnJ1NuLkuTv4EfmDI0CzlgbMXURmyUCzcKJ1VQeTU
	 G8/89O+GmD/OnZgK2Cy//UISn5mTBa1iSN0TTD9I0Ucd4Wtk7zpDE5Ik8U51/bRGeAAMw
	 UTGROmw4lg2eB3YNpARyJ2a4wGmMArruwZZYv7/HMTbxBOWHaDdPSZMvXTRnS8v+HQarC
	 nG6tfiN2BjkcAZmF8byVRW/uXDw+kmUarMFu3WSOCATA4NlSNkTMXMGCqtsW5frDodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=m5R66mz9oDZ4V5MTXt846nwHi/Uv89TbwYD+eg/h2p4=;
	b=LVTCievCNFAa/JlnVPxWG19Csd78406r2Gr++PR1pYBuXKaD+KHNAY8157oviVESYej/
	 +Up0KjBNbSKVE+RGa56Axq0nXYnQYP80v7EP/QI12V1tBZmQwsSyS6hXmYjYw4vqQSP6H
	 cfkDhrkCrrnbPm/tjX3DB5FEJw4HOJ5xRjw/svPbQSUIfgafuJ5Fuhl7CsHi3JmvDF0+k
	 rFWrd8KrMHtlVxK8lWI+whfBwnhf/q94xZiinFiKh3yjupzbl66y4NEQltny2aAhpad+8
	 0Rb99ehzNsu2tPRurujxfGQKZfO9NlSyoluIJsSAjRw19ON1Ia2xbSQ9JBuzkLDV8UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=QITzcmro;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67969606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67969606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=QITzcmro
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91befe703c4so13867496d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792452935; x=1793057735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m5R66mz9oDZ4V5MTXt846nwHi/Uv89TbwYD+eg/h2p4=;
        b=QITzcmroCN29Q0equnjmUpUTAoqe5wgaRyWOKVEDe77irhN53xOoFKUa0+kgJAiGY6
         ZoQEJ1PYmVV90TEba4BbK1YQ+uRjHBB9kQuC0MSBiI1C2JOubsMJo2TfHq6vyiAoot3F
         auiAXCLr4+YYGRZt/RtobS9/eeMFWI6FCuLWJgiel55mmoXkR1wZqgkN+gh7QVFjz55i
         nzizUdb09hruNUHFjHCFnIPm7z++jnBLZOjYb9kpQ5nOOnpJRG/T4ugXCkmji9cy4u52
         oPpHRzru5QIMIm68AyXa+7/ADLdGONGFwdUcVMfFOj/tNMO9QVOk+TZV3CvCob1trtlf
         o2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452935; x=1793057735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5R66mz9oDZ4V5MTXt846nwHi/Uv89TbwYD+eg/h2p4=;
        b=f3PVlumwhVZGQUOXUcxpzKuXXaO90ZokKBjBepfWBEin3Q2ikMrr+IPhG/jeaM4uE+
         xYtlz6xL9JrfGayESY9f3LlyR1cJ0m1a1JN4/IRa6BGm2KgbivzPKaWPkv+KE+9BUswV
         U8eI6BhK79X8OoxuOr1wjSODHLYjQA0yRXoQkhc+WuCfbJbUdXsG2h0oFpTeb1bvLl2A
         eDGOXF78MGJA9PD/khHcWMKBhjuUEoSDY9yloBRx7uu/fXc3lH2KaBIVWDyVyTtcKZVm
         qpPFOVnOMbIj0S12zVvhdmHIVGwvETmf9MNqpf8CX0R1LP9XNMbte0gxfTWCNJxHFL80
         xE/A==
X-Gm-Message-State: AFq9FYJAALkfFYvXEYS11Ex0J9AuLtQntLsU8T/kKGf7O5kR6HajxE/m
	1h9ZPD4aiyRL+hV2Ha+XCkY8Gj6lg2ft3mq3LwJTcN7u3GbiuHHmx2fiVb4tkA2mc5U=
X-Gm-Gg: AYBFou26laPnlDHWng7MKEde0gSLLX53PUEf/qFKKQsfvKwAVn5FM4a4tihrxDnUM3O
	pJweqsV4a/5WtcxJO/pWn4hIrQAAchWvTGWKvLM26mGRB3UPEP2UYMGZgzMXtBjspX24PcBso+p
	KyOsLwgwsdUYvZdbDM1EvSRdk3zNIutKUYW2Cz24X++Iw282/rz4GaDLBSLmfd2GrRCgam4HCz+
	5Pk+cbefymZkFl8Tdvwwh2Hb/HIfoYrd/w295ZZ69WRDwg0xei6/QeieHGRCI8ULaF/XEsbBKll
	RlKJbIiFHaQ17bnJYY+o+UbXKrlFeDO0+g6FkjukS2vQ4EjCeggiULNzuZ7YGrOFqQg2Mit/J0N
	TKC9ltBrFBGIq9QmGHzl7iVK5fTSpqOw3AEG7U/k1Nt9GKFU1ZvEA6BsTFPu+YziOWDNfHLHlGI
	uljf3YnkVlfP54PG+pK5nDdO+/6oAgaaravXyumo6/hCqk6tm9+m/hSSK7zB2IiDis3rt9aefrK
	9cj8hrR1RQ8LEchOhnGkY+G2peD+1jFQ3yfX9UU6TQVhFFKbliw2/DkWA==
X-Received: by 2002:a05:6214:3482:b0:91b:f655:4e4c with SMTP id 6a1803df08f44-91bf6554f9cmr65063266d6.47.1792452935159;
        Mon, 19 Oct 2026 16:35:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c04088680sm9297256d6.16.2026.10.19.16.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:35:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xIwtA-0000000Ay8i-2UGX;
	Mon, 19 Oct 2026 20:35:32 -0300
Date: Mon, 19 Oct 2026 20:35:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261019233532.GL14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
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
In-Reply-To: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>

On Mon, Oct 19, 2026 at 03:14:32PM +0100, Yeoreum Yun wrote:
> The Arm Confidential Compute Architecture (CCA) introduces the
> Realm Management Extension (FEAT_RME), which enables the creation and
> management of dynamically allocated, attestable trusted execution
> environments known as Realms.

Same remark as the other one, this is an attestation subsystem
driver.. Stuff like this is *exactly* why we are building that.

Also this is weirdly structured, it should just be one driver under
drivers/attestation/ that does the measurement register part of firme,
it shouldn't have two components and some weird firme_get_instance()
thing to link them together. That isn't how to build HW drivers in
Linux..

Since ARM has bundled different concepts together into one SMCC FID
range, it probably make sense for the smccc_devices to somehow spawn
multiple smccc_devices for the various internal software aspects
rather than have one driver spawn aux devices to split it ..

Jason
