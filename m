Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411878;
	b=G1gOy6O91iMFXoPKDc+NgAE3S9xFHptkfk0meG70mtfx05oWVncLdXAaPoNJOZMQTFZ6
	 wgW+4OllXIF0YjycHtfMVMVxRAHRfWvaUReS2YZJu97lNhhr4vGfnqjXjZxkDZyK8vkzd
	 OVijZYvOfxOM9izE4AJ7iqeCRIp3RDlQn8yeIqUwoDMSz0c6ETwzd3+mc+vYWorlQgP3j
	 D1WWIm2r6WxEv0e3fhxWKQ3cR9IonWasB1707PWVc2AELPBh5b3ySJV29mtUwgLHtsY4o
	 V5dKqvf+oD7DazdiNj1NK6tOKcpCMFKflcBfiE4+Ug04EixB92bKGbQ/a5Le/VG0IWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=JW9NRbd1yObMC6jDLBg/nqkiPWQhNDyNhJfsXYnn4pU=;
	b=YnYAJ7Mwdo54zy3HZT6CPh3fhgg/31DKhJ6Bklol6HdAL9lGc9xLdjoysUr8wCAabO/N
	 VLZEp3Gwk9MoKcBErzHE7X1Wwdm2K4M/VJAYcYYYX3x5NaFrEEHrX+Hfex9R1HDTy9AbQ
	 SAJvtcHPBVkdJ5jgQoeaLgzZaVivdJO/O6XvF4hZmYfXXeCVbJHcJg/tJeBsGjbMKSxCi
	 O6/Exl3TEgPpQ1/ezQhg8RI3N7V3Dvs1u05m2i0twifZ2xGnuCrupU078JyYYn9kLLoVD
	 clfEq/zzylEnkS2dm68z83ZYfR2cfg2dSajRsr5EKI1yPU7gI+0HuzosmvnhxLysF8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izoDG3iG;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE5606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izoDG3iG
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cddac941ed1so135960a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411878; x=1795016678; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JW9NRbd1yObMC6jDLBg/nqkiPWQhNDyNhJfsXYnn4pU=;
        b=izoDG3iGHFixQivI9rRvqjmYWQKXcAxXMKo5lrr/FgD+7cIps5M+XwXbaEzZjEaFbC
         Qfp4MbEFbtoS1YQadMXi4QUzIOvIVGNCdYmY4VmAGRwBGd4cGcXlRFF2NenrcmNSE/Qw
         MuO1bVS8bAiEcAEx6cX8s3pmw1aYOPUbPuMkZ+LJ1Y4GlbmcYI47m+aPsC5sLCMtP+ej
         7bydn2DN0wJ/ZD6al1gR5WNqbDXUEHJJkFixf8Bejm4/n/zJQUZFXfOSRTZ9IH5c48wJ
         Be1sAYk+qmq1AZ2aOK3f1madscB3bA0Zdv/1GEvxpp+51mI6nYZGAty1SMg3rHTi63eq
         /JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411878; x=1795016678;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW9NRbd1yObMC6jDLBg/nqkiPWQhNDyNhJfsXYnn4pU=;
        b=NDa8IDflAYj626NuL+8rg3j5VI8yoiy6Qp+8n1LWFb3NAyDrFCepVqw1x3/REUJmba
         Vt1UGwEEQTzqCWnC7xlYz3lsuzpr0aogPg/gmUnhNN5eGhi8HxwOwaqsLqdeMf+NfQke
         iVQQhekSYINOYZqwBNLhRNm2UZZ0IbtTbhCmdEh/DqgM0XCQfTv6jniq2R9FOZT1t8RG
         0kIQfqScW6w5vDElv9ofDlreJ533BQXDfqJZYlum2WnyT0CcDjjfsuq7tJhHWgFqWGrm
         4FgHZ5TKFhio+qU8COECcX+5jgl/BY8KaoyhHzQRd0t9OJesNOgcXdQDYLI40bPp+/q2
         TM7w==
X-Forwarded-Encrypted: i=1; AL+hErE8DiUgHMIH/pDBRFWR7VK8VV/bqZfr6lnEzxWyFNR5EwDGwyAMXv5fVt6kAE7HZloK/KKWbbxGiiJk4Fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Aub/EvUKj+5mIZsuyajoFh040UhiVDlGn40kIGliBa1v3N1T
	WyR7V2VJ1XYrKVx1tqlx3hgJkgmml9OUNQkAQa63czk8RFLuivPRi0fj
X-Gm-Gg: AYBFou1C+xIyZypHmnk1H0JtNHwNBJ+X930G+gClp3lRUbTY/6SwXeXkdYEmBrfoSAb
	WTv7h5jVMTEAIq5LSq5DEUpZdJcnIVxC14GHNWYfJq2BGMaTAYlc03A6ynQGJp6+VWd9KN9oosE
	Rq/z8gw7Qe6bD7B/S1wRedAD/Ad0VXZHPe9szoL9YUFLxyasoyPdlO2oVN3jAj0GQyB4OM07ROb
	oxI20J7GY2TTdjFPoBlDTx4Nfq2m8hVrijzbfGFDW3cFimKVxVI/oeWKwV3jNpEl3qxGzSczpdf
	njtdaDjZbqFth2r5lHySgnSc7Fd09e+CNF8+0SOH2P4eYpAofPGBxyS7oZLUTzS05fwHzmVGwxb
	DxgVrFVRrZT1ikVPGJqwQxmvv9XA4RaamCIgEkgnP7DcyvZag1yVt6EMTJOG+FnWJypb979mW5D
	05eO/cyXdWWFKX41y75pwWrPIhDjGCZDQl/8ohHFhF/82TrODXzvd48jfqnVgbem9bt36Q8lj8m
	APIiGZUCt35jPzwro56Z9BIkFoTND/AWIklMAmedN91SDRxpcBmmcKZrNFymLGZY2kX8jLvavkf
	v/j59qbXP3PxqlRowj+X2L/9St7zPhrFg7jxySKuXS8oWaCGygX8tq59LHvDILZ2zR2bXYLcTKB
	/l2Ra+QRRojO9oNVD8i4stLv4GsPauWox6tYFCjxX+HNxjDJsjHIILUGT
X-Received: by 2002:a17:90b:4c82:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b182f253e0mr2786337a91.48.1794411877445;
        Wed, 11 Nov 2026 07:44:37 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b18142fa70sm4663040a91.16.2026.11.11.07.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:44:36 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 15:44:36 +0000
Message-Id: <DMSHX7SU7M9U.2YBBRPD8DYGWN@gmail.com>
Subject: Re: [PATCH] mm/bpf: Add bpf_mem_cgroup_memory_events_local() kfunc
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hongfu Li" <hongfu.li@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <jp.kobryn@linux.dev>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton" <akpm@linux-foundation.org>
Cc: <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, "Hongfu Li" <lihongfu@kylinos.cn>
In-Reply-To: <20261111-for-bpf_memctl-1111-v1-1-8b56784d9e5a@kylinos.cn>
References: <20261111-for-bpf_memctl-1111-v1-1-8b56784d9e5a@kylinos.cn>
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

On Tue, Nov 10, 2026 at 10:56 PM Hongfu Li <hongfu.li@linux.dev> wrote:
> Expose the local counters to BPF programs with a kfunc, so that a
> policy can attribute events to a specific cgroup instead of only
> seeing the aggregate of the subtree.

No. The prog can do it today without a new kfunc:

  memcg = bpf_get_mem_cgroup(css);
  if (!memcg)
          return 0;
  cnt = memcg->memory_events_local[MEMCG_OOM_KILL].counter;
  bpf_put_mem_cgroup(memcg);

memcg is a trusted pointer to a struct that is in BTF.

pw-bot: cr
