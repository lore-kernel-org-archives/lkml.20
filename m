Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C823C3B52EA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900269; cv=pass; b=dflJqxpVR/nzePZYLYPfwlx20m/sPW0F48qPXmBjc3WIDta7BMG2TvYFdYaY8zpp2gD/BOoHCqVpjBrM1nhuMioNX1dX4pBX4xZ6aj8Ajwr1OyBzlC2vEhfoyLe3Atv5I1Jp35LTVi4uke2Bz0aqXflvgOLrX8r6LZmgeao1BL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900269; c=relaxed/simple;
	bh=5pi7fFl5d9CkpMFuaL7iKJCS9k9esNIMTbygfQPyjT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oT0MlokcJ5zC7zDctvrHe2b4K8E+VvvRL99f4TwVAQ+OB6xzN8vWqTwlrQFdJNWKxFCd4q0CrWO4lbywOLmhjJelAAwVMgoMnzgYrz8h9Poao+to/sqHDi6EchDH35tBoyl5QCFyfcXFEOR31nRnK12CzJ/tE9YNlTkF+sdyL/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=JvrsRWQb; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="JvrsRWQb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69fdfd98eb8so87334a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787900266; cv=none;
        d=google.com; s=arc-20260327;
        b=W1QovyKMBQzEtBWLEFqzEkaTw3gyLsvHITaurC7G66CKL3W+kEc4MVLRqdWFRz8q8P
         iaQvSRKsvQShYFjlaIAzLcHrZof6fGMXYGIbwHXnpqHPrevVL9r991ylR427aMNkVxkt
         kz+8wU5s43aXlGePvqq8rbfYreHJ01d855YK4ZysY0EBytxoG86ZVesVS9OeKFy1Y97a
         G98Gr1uQEbB1HoKTHQ0/KLTUn2XIwx0HaGcIjEgkLyQRtZE+EmOxOwdXKtcUOErFEm7X
         aYN8C07hlXA1LTrpsQSt6ySvjVKMYPvYzZ+SF2YRyCsE63ePeYCIega7bWsMKloDYwt2
         sThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=biVRj6RyrYDWGOfQG4W6ncxtDNbl4Dahs41I0q/fYzU=;
        fh=QBW2x0FLdIzcVNAZY/7DF04FaZ+ec2tn9lPomYW0MhM=;
        b=TW0GcJ1Oio2l9BJNXj3c7P2PmmODKx2iSOgwYwMOplgz+1TRWbBRTrqSCi6ewoSQs8
         SgsBZZo7Ua6B2B6xOjmjebBIrgu7C7VxZCyrWJ8+MXucWnOGyOaAAMwf+jheWw7Tk2LB
         HhjMtYlfcIKVsqT1w1oQ2PM33zd/M4JNWqJPo7f9f3YWcfLgQI1LJus3w+4I0+j73z+b
         GLWWb6gdIs3uNZnt32AJdrY/IW84lkj1kQfJt5lCW14tFGMLWZ5nreI3wekm7/k3kSgh
         O5RyDAFmugWBzvvROslM1lDwdhoZN0O2cs3h6l1LQDF+S80OSU98axPOjSukKY0qa77v
         b2yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1787900266; x=1788505066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=biVRj6RyrYDWGOfQG4W6ncxtDNbl4Dahs41I0q/fYzU=;
        b=JvrsRWQbckhvfwwHWZggkj1KRTBs6wVMsRVFKbgZV1rk3PBPsfgNQUjVgP6RqgaFwN
         i/WkIgSUsEnfmtzDBypb9axJz8U6VmEg9QFZToVC3qJMMqeF0yYSX/x7ijsOtUX3V3Sn
         5ctmLF0Zpe1PqRmQdfJf+XTTH6Adheo7okCKmeKVWXYi20r121Hodym+Uvgg/Q5X2emC
         8iScwlZQljymmX6KaUDUfnmmtgx9ao5HSkvb0lLhM3NiOuNzhsmLaeMit+kHa2wwY4ZW
         h+t5U6fqwmRy2V3qiyAxtEGVGghO4A4KhrFkCqdxAnuBvQJEyQ+ZpnLdT0JvgcW0iUAK
         32qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900266; x=1788505066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biVRj6RyrYDWGOfQG4W6ncxtDNbl4Dahs41I0q/fYzU=;
        b=EB6oVwIf7p2YJ0QdZs/L1nQTUHv1elvTgWzvgq64Q3DbW7ACeXDKAu98SWHuFeXjrY
         tPAV4wmI22WFJaP2SvieNX/G/cMH/cdXJaCOGEaUBvlEc0suQ3Mx5MzkeyrUzPuSlYQl
         UtNouz5u4lEsO+1tp3kv6QXYkrvMnDdhKFtAMql8qNosq76ClQ5T7JktoKheEaiAIJ3B
         kvCxJmdFucCH8mexTGnx7eXW0kde2HGqPT1lwzSi9xLtnaGZqnTkwl/FlZLXJVy5dytV
         +WiHYh9iQUSC7y8eDtyedwdRSSZf8BVncMZ4WZINL4iuvm5vJ4j9uvDmFLLEv7/c1w51
         j86Q==
X-Forwarded-Encrypted: i=1; AHgh+RrLS5YDLKbYaYU8DIYmzo9Dw1kv6287QwV/EyJFYplOvNXROcaOy+gwFysqToBJHdXcbMHNYmEsnIV2g40=@vger.kernel.org
X-Gm-Message-State: AFuF++lHh28u/rTbUFOl1B1aARwka6oYTKx1jC4Wp0Yp7caExie/l3y4
	QB7hsDwKJm9AyGhPwA9AlvPd0rrH/PB6IRR4f66aTim4HJul41SSBkOnyon39lxNdtL2h1d57s0
	HdmOyB1w0i8zsagI2tiXn8r53kW+nPpBrP3s2w0sHqw==
X-Gm-Gg: AR+sD13EpvAxFFjxfhoJTFJG1JrZvIxwM5xIJv52RvEaQgKbaY1e791tf/O8yaPVL/e
	em7Ozt9VOSy9TTKjymNVvRyfDy9TGGxwxlj9nHgCwOyEZzCtaTFn5vU9pMzGx3pBKCT5m7c65qS
	th5rfcmQRjO1KevxzwhXOZVlLdsV97LgZ2zBz/np3Y6ooNpZdHOCDK5bFf0Pq4ZUdsTGrcr8gs9
	RPdZqZWh5wkbHTLNVI7uAuKT49UtxVHDP/pujaYOQmnluAtGmALKnIABEPP02SqFm7oILdKFX8S
	N48OgK2hUrqtXzP1QJmG83EbPtEtD3TiCn5fi6dPNujwPmHmxtl5v81ID793JOaaIL0BDVe8XH6
	ePw==
X-Received: by 2002:a17:906:6a0a:b0:c16:604a:b2bd with SMTP id
 a640c23a62f3a-c255741932cmr146374966b.3.1787900266006; Thu, 27 Aug 2026
 23:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCihE2_pxLimjmmR8NMz4g-ie8dvvq1jmAj-Om33y3Vzfg@mail.gmail.com>
In-Reply-To: <CA+0ovCihE2_pxLimjmmR8NMz4g-ie8dvvq1jmAj-Om33y3Vzfg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 28 Aug 2026 08:57:34 +0200
X-Gm-Features: AcwNN1VrhfZp_YYYRkwlkfKyqT9N2jCjAFzaObmAGZGcec2LVIMYMxZlFYy8fIU
Message-ID: <CAMGffEkpFHusGEe5ukWiO0kFjAiVaCj1WgO_ES4D7QZ-TjEYTg@mail.gmail.com>
Subject: Re: [BUG] WARNING in ib_drain_rq
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, 
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>, falemi@asu.edu, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:52=E2=80=AFAM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/198-warnin=
g-in-ib-drain-rq/
>
>   failed to drain recv queue: -12
>   WARNING: drivers/infiniband/core/verbs.c:2948 at __ib_drain_rq
> drivers/infiniband/core/verbs.c:2948 [inline], CPU#1: kworker/1:3/5056
>   WARNING: drivers/infiniband/core/verbs.c:2948 at
> ib_drain_rq+0x30c/0x590 drivers/infiniband/core/verbs.c:3078, CPU#1:
> kworker/1:3/5056
>   RIP: 0010:ib_drain_rq+0x30f/0x590 drivers/infiniband/core/verbs.c:3078
>   Call Trace:
>    ib_drain_rq+0x30f/0x590 drivers/infiniband/core/verbs.c:3078
>    ib_drain_qp+0x1bb/0x430 drivers/infiniband/core/verbs.c:3102
>    stop_cm drivers/infiniband/ulp/rtrs/rtrs-clt.c:1763 [inline]
>    rtrs_clt_stop_and_destroy_conns+0x216/0x1650
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:2210
>    rtrs_clt_err_recovery_work+0x67/0xc0
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:1524
>    process_scheduled_works+0x881/0x1170 kernel/workqueue.c:3397
>    worker_thread+0x988/0xde0 kernel/workqueue.c:3478
>    kthread+0x333/0x420 kernel/kthread.c:436
>   Kernel panic - not syncing: kernel: panic_on_warn set ...
>
> Our reproducer.c is available upon request.
Hi Farhad,

Thanks for the report. Please share the reproducer.c so we can take a
closer look.

Thanks,
>
> Happy to test a patch if that would help.
>
> Regards,
