Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103646;
	b=3UIkwWk9TmBlWB4K3PZvT2QoAUMI10D4ZAfUYVYkETcHa3KU4sO00essJ8NlsjGFZLVl
	 NIrGFp5/SyPB//tM9Mrestv2gru1ewL7HycmvsooaJsaJmX05JjyNFwecWF69KQZBGwtZ
	 /3YraxUYpvi/UzFNPxsZLzRcAk62WFO+y475Z72Nu3YPeQwCpPEJ/lbzh/m3VXUKHTHXp
	 NFDkzcwygDjPouVtJswAqst17joVKlFajOg/FXlYcUDJeLdb/oKlVGHs/AxNSLBdbAi+D
	 rJLnkF5ElZR+3DSUtUB3xBEmpbD+Do22tOta6ONSFi9tW9yEqhHgqgBQ+9ws620XM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103646;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DJKH5fyBpHe0bd+2YhQRujgA8rtCXUKuCcn6zDzbY90=;
	b=F1NciY/Z+qfOe8gHCUO0p05j1Mkf+subssIqxyr3eOfUT41d+TZDQpD0QdicrRQyoRNS
	 Igzcbd2ENVRcSRsdRZDB22CM3QaXCC6N12mTcJodCTp5dTdf4rZ37twHDgZhZvsrnLQcP
	 pna2vJ5Ew88AiCcr8owPLv5LxfQ9bwB78RHi+PeiccMUjyl4Fb+XDjqC/O3lv0sk3EL5I
	 mfimmnLL9NMlg61LObSlTvFDCS11l7C2/YhZQ5f/MeV0lXuY4Yv94NLlnOT2pNp9eWSYF
	 aGO9O5GNCGPPZRRuBRloU8krOci3ZJ1jn0pTASgcHBuhA67nWk/5C7BE7qVa1k/32yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="SXBivP/L";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=erf8uDo0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33CE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C33CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SXBivP/L;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=erf8uDo0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793103643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJKH5fyBpHe0bd+2YhQRujgA8rtCXUKuCcn6zDzbY90=;
	b=SXBivP/LYxm3sVcqlEd5iV9Henma6upr2INVm6Jj0rCkhCnIL/yo171fxjQro0Nt43u9OU
	TK5v7OcIT6GpdAyMvjv8C7fxTScz8lBsuec5XYJVOgaY8rppMtnqajhCV/c9TqAlNmr2wL
	2UKSEgRxuI9zrIXC8xnCUuSpBcyluaY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-cKZ4Hx4eOHWQEwP9eSZ_XQ-1; Tue, 27 Oct 2026 08:20:32 -0400
X-MC-Unique: cKZ4Hx4eOHWQEwP9eSZ_XQ-1
X-Mimecast-MFC-AGG-ID: cKZ4Hx4eOHWQEwP9eSZ_XQ_1793103627
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42f98f351eso436752066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793103627; x=1793708427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJKH5fyBpHe0bd+2YhQRujgA8rtCXUKuCcn6zDzbY90=;
        b=erf8uDo0TVRQ66yiF/mqn2Tv7WIYpI5XCqRieQ3aoELaJsiyUzN/or+5x4vAeO3cwf
         f3vaPjAreMLSG38t34FKT5Zzx2qlwuoR5/e6OsFlrbhlIWcv26s5ItZGpOlyYOnhDUB4
         jSB9dMjfOr76jbtEX0Abvikkdrjvqshfm2Y9Dy/9u0z8JPompPucXAsh2K7wScFgGvEO
         Dsr0Yno2uMFs0UXWz4MAJyydEBe+7tBNnmid9pwSjm7i1OUaoXc48nX7e7RGT8nazZdK
         j9kYTGu0f6wZIzNNc+rdzWvr2a8OAzO50rhRfO7BUHG2Lmsc3tvtJrfXdvMcI9JbZ3DM
         bP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103627; x=1793708427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJKH5fyBpHe0bd+2YhQRujgA8rtCXUKuCcn6zDzbY90=;
        b=A4PoqwCGuHFvSRX0pap/BjpHsJ0AsRDkWS7aFmYNnm1kBIjH0/e/gB7o7Es695dGLf
         9+RFyUs+/Ivo77V+fyJzQs7QMxUp8aE84IWfyyJSfKeF/K+xcHO041Oljh7IhdsptDng
         bPIhKIxhDa8XRoyP20zuGRRfhkvvVRqnyzHvhrtwkC2uZmFc4lM1NssQvANKUNJ9LLuD
         0KDz/tIjHt8CqtNRvK4VcTC5t1baBkIHbEtKJLObWeKFN0v5orShEMZZiYBSGyLmDOYI
         jhYXRKP+bNuVdtnWgXrdyfM+tb7VdI2cO5RRur7hr7/3ObnjnbNtRH515whCgPB0nkjM
         GRfA==
X-Forwarded-Encrypted: i=1; AKwUvBwPQtWy/kTcxBMmID+xRqtRW+6AinaZ2BMzU2uqT7m8RJFCzX2hJ6JkEzopw/nV98rtlP0bFCfifkY1Pjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjHIqDxvsqC9cdnf1BDCsZkl0kJFQDkLh8VN4DkBuAFPzyDSAg
	FNaM6ezcicOVZ9wML7pVsSAQH7Sogu8bpxRmM2pBkwXI5YnCsoYUsUDwc+bLA0SM3sGByOeaMTL
	FfLOU+UlNm1+5TCWacb37KvA/Kw05PMrv+BIgSay4yQgxkma8mZSaUFEBcptGc/ebUg==
X-Gm-Gg: AYBFou0rqkjovf+ZjXJu/KTQ4stcC41imz3+6pVd7uiMs5jx9q3WL2XVwV+4gJXXrDD
	3IUH5PrvU+Up3MLHd3XE8EpEdU+OhwWGfPXiw8VQP+UD7sCvtiB8t2+Ob2Zp3W3KZSzZa9SeWP+
	FA1SserwD5t8B7Nq3UCiponNl+7h+jUDPhMBiHULtqpI2EnzW1ICVj5ZZmaSo7TWKqalYZHenYU
	P+HO6eN3pBxrH6IILTsOXDLO2Y55gRE3lzWVQVIqjTTJiqRwAwi0DHeeqlm2+80QHzaXvcPVzpg
	PYD048+tQp3KGEs2aN3rTaI+Nz14UUwrz9SNOmEsEoov8NflGTGdwtxlxkwTExOj1XpC2ZhqdOn
	vqJ1YMHYhg2A7FJQMXi4rsV7O8qxP+D9BpCoz+MmC2ltXFYSjMeW1MK6BCYGsQPhyqdbuSqqBDw
	==
X-Received: by 2002:a17:907:9409:b0:c2d:bf61:24d1 with SMTP id a640c23a62f3a-c46bda57206mr969338466b.1.1793103626412;
        Tue, 27 Oct 2026 05:20:26 -0700 (PDT)
X-Received: by 2002:a17:907:9409:b0:c2d:bf61:24d1 with SMTP id a640c23a62f3a-c46bda57206mr969333866b.1.1793103625653;
        Tue, 27 Oct 2026 05:20:25 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm22251473f8f.14.2026.10.27.05.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:20:25 -0700 (PDT)
Message-ID: <129584ad-9434-4403-aa0a-48abf9966dc1@redhat.com>
Date: Tue, 27 Oct 2026 13:20:23 +0100
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
Subject: Re: [PATCH net-next v5 0/5] vsock/virtio: reduce RX per-packet socket
 overhead
To: Jia Jia <physicalmtea@gmail.com>, netdev@vger.kernel.org
Cc: stefanha@redhat.com, sgarzare@redhat.com, bobbyeshleman@meta.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261023075140.9613-1-physicalmtea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261023075140.9613-1-physicalmtea@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/26 09:51, Jia Jia wrote:
> This series reduces per-packet socket overhead in the virtio-vsock RX
> worker.
> 
> Patch 1: separate socket lookup from locked packet processing.
> 
> Patch 2: factor out the RX skb metadata-budget check.
> 
> Patch 3: keep one socket lock across a bounded run of established
> STREAM/RW packets for the same native socket, and reuse the locked socket
> for later same-flow packets.
> 
> Patch 4: coalesce default write-space notifications while that
> lock is held.
> 
> Patch 5: defer the default readable callback until after the batch
> unlocks.
> 
> Performance:
> 
> Tested on a single-stream vsock connection (one Guest receiver thread on
> CPU0, virtio-vsock IRQ on Guest CPU1, fresh QEMU Guest per state, with 16
> balanced AB/BA pairs per payload for each baseline/patchset comparison).
> The host uses vhost-vsock.
> 
> For throughput, vsock_perf runs on the host as the
> sender, with a custom single-threaded Guest receiver pinned to Guest CPU0
> using blocking recv(). The fixed-64K table uses a 64K buffer; the matched
> table uses the sender's request size. The virtio-vsock IRQ/RX worker is
> pinned to Guest CPU1. To normalize run times across payloads into a
> bounded, deterministic window and avoid long runs being skewed by host
> background noise or virtualization scheduling jitter, transfer sizes scale
> proportionally with the request size (64B/64M, 256B/256M, etc.), capped at
> 2G for 4K–64K. The custom receiver keeps the recv() size and count
> explicit; vsock_perf's receiver uses poll()+read().
> 
> Latency uses a custom user-space vsock ping-pong tool.
> 
> The measurements below were collected for the RX batching series.
> 
> This benchmark does not run vsock_perf on both ends. Instead, it uses
> vsock_perf as the sender on the host (vhost-vsock) side and a custom
> blocking recv() program without poll() on the Guest side, with the receiver
> thread pinned to Guest CPU0 (and the virtio-vsock RX worker pinned to Guest
> CPU1). Plain blocking recv() combined with strict core pinning gives
> audit-level determinism for tracing a single-threaded TID.
> 
> With all patches applied:
> 
> End-to-end RX throughput (64K Guest recv() size, SO_RCVLOWAT=1; Gbit/s):
> 
>    payload  baseline RX  PATCH RX  throughput change (95% CI)
>             (Gbit/s)      (Gbit/s)
>    64B        0.1290       0.2489    +92.91% [+89.31%, +96.58%]
>    256B       0.5780       0.9727    +68.29% [+66.14%, +70.48%]
>    512B       1.1688       1.8316    +56.70% [+53.85%, +59.61%]
>    1K         2.3059       3.3377    +44.75% [+43.39%, +46.12%]
>    4K         3.8787       5.7310    +47.76% [+45.20%, +50.36%]
>    8K         4.5983       5.4575    +18.68% [+16.42%, +20.99%]
>    16K        5.0806       5.5615     +9.47% [ +8.05%, +10.90%]
>    64K        5.4842       5.6423     +2.88% [ +1.13%,  +4.67%]
> 
> Fixed-syscall stress test (receiver recv() size = sender write size;
> Gbit/s):
> 
>    payload baseline PATCH    throughput change (95% CI)    recv()
>            RX       RX                                     (base/patch)
>            (Gbit/s) (Gbit/s)
>    64B      0.1384   0.2532   +82.99% [+74.19%, +92.24%]       1048577/1048577
>    256B     0.4042   0.8983  +122.25% [+113.06%, +131.85%]    1048577/1048577
>    512B     0.8056   1.6035   +99.05% [+89.34%, +109.26%]      1048577/1048577
>    1K       1.6030   2.7158   +69.42% [+63.22%, +75.85%]       1048577/1048577
>    4K       3.0194   4.9586   +64.22% [+58.43%, +70.23%]       536799/525225
>    8K       3.8316   5.1255   +33.77% [+31.00%, +36.59%]       274864/263013
>    16K      4.5702   5.3808   +17.74% [+14.87%, +20.67%]       144958/131332
>    64K      5.4736   5.7118    +4.35% [ +2.79%,  +5.94%]        49039/32938
> 
> Request-response latency (Ping-Pong RTT, 10,000 requests):
> 
>    payload  baseline mean RTT (us)  PATCH mean RTT (us)  change (95% CI)
>    64B      224.148                  224.151              +0.00%
>                                                          [-2.26%, +2.32%]
>    256B     222.037                  224.499              +1.11%
>                                                          [-1.66%, +3.95%]
>    4K       225.982                  227.026              +0.46%
>                                                          [-1.15%, +2.10%]
> 
> Guest CPU1 aggregate cycles per received byte (fixed 64K receiver, with perf):
> 
>    Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
>    64B        65.282    57.843  -11.40% [-13.77%, -8.95%]
>    256B       14.710    13.813   -6.10% [ -7.89%, -4.28%]
>    512B        7.709     7.188   -6.75% [ -8.79%, -4.66%]
>    1K          4.075     3.862   -5.23% [ -6.80%, -3.63%]
>    4K          2.034     1.887   -7.21% [ -8.67%, -5.72%]
>    8K          1.664     1.568   -5.78% [ -7.83%, -3.69%]
>    16K         1.450     1.385   -4.48% [ -6.08%, -2.86%]
>    64K         1.338     1.317   -1.51% [ -3.21%, +0.22%]
> 
> P1-P3 contribution:
> 
>    payload  baseline RX  PATCH RX  throughput change (95% CI)
>             (Gbit/s)      (Gbit/s)
>    64B        0.1285       0.2462    +91.59% [+79.74%, +104.22%]
>    256B       0.5909       0.9666    +63.59% [+61.03%, +66.19%]
>    512B       1.1817       1.8350    +55.29% [+46.76%, +64.32%]
>    1K         2.3252       3.3600    +44.50% [+38.93%, +50.30%]
>    4K         3.8436       5.5661    +44.82% [+40.30%, +49.47%]
>    8K         4.6609       5.4115    +16.10% [ +8.91%, +23.77%]
>    16K        5.1196       5.6399    +10.16% [ +4.07%, +16.61%]
>    64K        5.6095       5.7062     +1.72% [-3.19%, +6.89%]
> 
> Fixed-syscall stress test (receiver recv() size = sender write size;
> no perf; Gbit/s):
> 
>    payload baseline PATCH    throughput change (95% CI)    recv()
>            RX       RX                                     (base/patch)
>            (Gbit/s) (Gbit/s)
>    64B      0.1446   0.2540   +75.71% [+63.67%, +88.62%]       1048577/1048577
>    256B     0.4211   0.9061  +115.18% [+72.13%, +169.00%]     1048577/1048577
>    512B     0.7980   1.6112  +101.90% [+95.30%, +108.72%]     1048577/1048577
>    1K       1.4965   2.6986   +80.33% [+68.93%, +92.49%]       1048577/1048577
>    4K       2.9384   4.8590   +65.36% [+60.17%, +70.72%]       539544/524982
>    8K       3.8170   5.1887   +35.94% [+27.66%, +44.75%]       274857/262991
>    16K      4.6856   5.5996   +19.51% [+15.36%, +23.81%]       147518/131351
>    64K      5.5182   5.8800    +6.56% [-0.83%, +14.49%]        48492/32910
> 
> Guest CPU1 aggregate cycles per received byte (fixed 64K receiver, with perf):
> 
>    Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
>    64B        66.728    61.220  -8.25% [-18.99%, +3.91%]
>    256B       14.363    14.515  +1.06% [ -4.22%, +6.64%]
>    512B        7.792     7.578  -2.74% [ -6.55%, +1.23%]
>    1K          3.988     4.032  +1.09% [ -1.64%, +3.88%]
>    4K          2.063     1.973  -4.38% [ -8.23%, -0.37%]
>    8K          1.702     1.667  -2.06% [ -7.99%, +4.25%]
>    16K         1.473     1.475  +0.17% [ -5.06%, +5.68%]
>    64K         1.385     1.358  -1.96% [-10.61%, +7.53%]
> 
> P4-P5 contribution (combined):
> 
> End-to-end RX throughput (64K Guest recv() size, SO_RCVLOWAT=1; Gbit/s):
> 
>    payload  P1-P3 RX  P1-P5 RX  throughput change (95% CI)
>             (Gbit/s)      (Gbit/s)
>    64B        0.2449       0.2463    +0.55% [-3.86%, +5.17%]
>    256B       0.9649       0.9931    +2.93% [+0.83%, +5.07%]
>    512B       1.8205       1.8260    +0.30% [-4.27%, +5.10%]
>    1K         3.3431       3.3420    -0.03% [-2.15%, +2.12%]
>    4K         5.6541       5.8428    +3.34% [+1.10%, +5.63%]
>    8K         5.4280       5.3364    -1.69% [-15.55%, +14.46%]
>    16K        5.5935       5.6701    +1.37% [-1.41%, +4.23%]
>    64K        5.6917       5.8351    +2.52% [-0.20%, +5.31%]
> 
> Fixed-syscall stress test (receiver recv() size = sender write size;
> Gbit/s):
> 
>    payload P1-P3 P1-P5    throughput change (95% CI)    recv()
>            RX       RX                                     (P1-P3/P1-P5)
>            (Gbit/s) (Gbit/s)
>    64B      0.2553   0.2575   +0.87% [-3.68%, +5.63%]          1048577/1048577
>    256B     0.9069   0.9183   +1.26% [-3.96%, +6.76%]          1048577/1048577
>    512B     1.6048   1.6459   +2.56% [+0.98%, +4.18%]          1048577/1048577
>    1K       2.6939   2.7357   +1.55% [-1.35%, +4.54%]          1048577/1048577
>    4K       4.9168   4.9678   +1.04% [-1.84%, +4.00%]          524965/525283
>    8K       5.1476   5.2005   +1.03% [-4.02%, +6.34%]          262926/263156
>    16K      5.5964   5.6609   +1.15% [-2.86%, +5.33%]          131311/131475
>    64K      5.9439   5.9073   -0.62% [-3.00%, +1.83%]          32875/32937
> 
> Guest CPU1 aggregate cycles per received byte (fixed 64K receiver, with perf):
> 
>    payload     P1-P3     P1-P5  change (95% CI)
>    64B        60.281    58.258  -3.36% [-8.74%, +2.35%]
>    256B       14.242    13.648  -4.17% [-9.81%, +1.82%]
>    512B        7.547     7.211  -4.45% [-9.73%, +1.13%]
>    1K          3.987     3.853  -3.35% [-8.52%, +2.12%]
>    4K          1.983     1.880  -5.17% [-7.97%, -2.27%]
>    8K          1.665     1.620  -2.75% [-9.03%, +3.96%]
>    16K         1.409     1.346  -4.52% [-10.94%, +2.37%]
>    64K         1.322     1.281  -3.11% [-6.49%, +0.38%]

## Form letter - net-next-closed

The merge window for Linux v7.4 has begun, and the net-next
tree is now closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens. There is some uncertainty
about how long this merge window will last, so please check
https://netdev.bots.linux.dev/net-next.html
before reposting. net-next _may_ reopen on Nov 2nd.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

