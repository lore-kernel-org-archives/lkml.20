Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42F450F2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896135; cv=pass; b=aL/fj1gxkIyfzHvd0DCD7wiJBPq+BF1tj+j/s5pjHriZgZQY6h8RNitcwZ5+c9wg/ZZ69THLGAdOqvIvKqgJ+jIKPPb29w+oJjLphCepOhCvpGaONV4lgmAYjY4GpjAfiFMBdld/+a6cQaID2ajiid5bhK0VwZ8Tekuia3AdviE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896135; c=relaxed/simple;
	bh=QZcZIYCT+Re7sKM4Gb3CgS7BkE6WBbGG4LvAQn5P0Gc=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ABM7dXxJ7pjVFFklot8INiRc5b50svmMbLzrkHRBsPWJtTTFmCg+cguc6KqMIx9xbDj7mZPsH7gM53po0ocwFBiLfTe6vfm4rn7F+mcTwm31JHqZHWgSSbEdNYPa+S18gh0ZIuhcXPCnPXQwcrZPnIxXYKnChB16JdideDzOaaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=KtLvys0e; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="KtLvys0e"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so729519a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896133; cv=none;
        d=google.com; s=arc-20260327;
        b=p1flpbmhZkFMXH9nV42M8WLJp0N7KZitrQYJs1sZuhfOxj/DgzP9R5Ei0fkkq9rIsw
         xKV1nNZX8skFzS8q5RtSry8p4uU+1DGUkRxCb4FkVz6EAO1YmvTEEQy/vb/cQTy5AMiy
         c5nsvrTqVi+MC+33rmn6gavEF/xjhgvFS8UQxSVvTGkz7sKokJDUoUOoSAbJ6Km7qECZ
         v/r8kDeLEOAVJQCpqDuNxsZpP7J8a2fFRS3K3yYwll29hIccOtNUUUx4/a4JMTnZtGEx
         hE0qOjVzMjjl79Yo50S0cmTJTSh1McqHb08W4OgGvTpLHZrOgmS0SEnV3Q9OjDdAoWAm
         F3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=XGiqvAKih07txWqwNMygIXFEXpvBV7V29xEbvP7fW4M=;
        fh=0Y7wcxYuFG4nPciSgGW+2ZSM9klTqOUpAKBEuZzM6tI=;
        b=PklFzpo4+Eozp9tcGnMwcpxyQ/FUECkiAGtCfukpwWQB/v7uQ1plyc9QS6TJmVHVaJ
         t1JqoFJJ18cnVFCb0ZPMTzoj97AW8yBwk/4e2nOd5uXDB9f9YzfHfOEF11+Zuo8D8krL
         FCL3zhUDh8UOlvbUYM70X6ZTuy46sfTqvdPLUuQWaeqE276RNsJ/NUuuOGinMGbr/v7H
         3aggTncxbyRqejvgfy46MgzeLFgmUR9T6c3WenKF183f4kcow/uA/7rxPyRSR70niGOd
         LHw3QoUkQ3Bs5xOo8XkTLbeCSj+H5TYrqClMpfCHQ3eGUdRKHlPzEPXk6VyIo4plkjG9
         LAcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896133; x=1788500933; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGiqvAKih07txWqwNMygIXFEXpvBV7V29xEbvP7fW4M=;
        b=KtLvys0erzE5TMYNiHelAvjCRsWGATW9zco+Y0shnzgT6SjmMJiv31Ke5+wXXB6/QM
         mRqp/In9MlxcKNKDAbJ+BGih87/8p/iXqLlK3qHm2FNX/Ham/glsyPzVX9DYH9DZABsC
         csY5CUjA4QBhsAtWtZlw1w5DUzi/L3UrMYDwNuwFn+i1bh3l0wObOl8FfIirQCqFO3R/
         4knWVfj3FBftRcjLA7jMklqXF5cRjauwN9H7rVERcyvLT5jAA5TWpmKXsty44pxQP/a+
         9ShJc+XZIBLtRkY65qP8TKUIw+zPKiW3Z/XCVqe5vdOwJrnXLJwdLeiQ2EOUXW6D4KdV
         pHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896133; x=1788500933;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XGiqvAKih07txWqwNMygIXFEXpvBV7V29xEbvP7fW4M=;
        b=fxlUFuF3/cKtgvzvF3StL6xWuyy2yEUd/oshvAzxtI+YBnnhvRiLuLaY4xui0DXWCx
         49jdg1bfaKh2j5QJnuy13tspArPh7Ol6/ElP4jH0mjTCeSV9qqjqJGnfkLkGmczCyHvf
         CZR/IkaxLTE91mE3wYzqW1pFMN6z+D+JyitZ9UvPljAB2pOKcROinDJtgZqUw5BCstoz
         UDylwOAiztCtNe1X4W2dEqrVAvt+Noo1rahFDCLDBm7yHdY0HmBpug69+aGBs6SXlZfQ
         enKkf0F4Ri2EAPzHddMkGP/Vnl4Mb0MrZHzixjloP+6u36BUDHQL4AZ7vRSt3+jcdfEL
         pRcw==
X-Forwarded-Encrypted: i=1; AHgh+RpYTL7jl6Djwv/JffTHzKXnR0qpgNtiu2K9tKInzFuFoCtJqsbTqbKUoBBo53NdjYmukEH+DXd1g9KCjT4=@vger.kernel.org
X-Gm-Message-State: AFuF++mr7iFIdRW8Gbl2T70uFaGIINJhMS+XHcn2Rs9QRFmRHxfcoQ3p
	zzqyeo/OptjNVR1eQkq4qcMGmphis/kTNOrhGcm+JtgEOLzW/EiAcaprv0VunlfsqdRqnVgkaN5
	hBLVD3oHKTwdGrHJw2WlzYese5WTqvskWJT5XcR3X
X-Gm-Gg: AR+sD13nX9n8kMQ0KcwY2x4lLxMpzWr6GQkjsh7YovfXOJ59+eBPHK7n3zyLVTBOH8P
	eYsEgtG0drkXZ83AZ6uz7IEmGW/peom1zzvujauTmzUsmOKUiwhMw6tKTS5oylAPe43JedbzV4X
	Pf8LXeTL14PecgJz1LKz4LYEOb5QIQKf05T41uhipmfXMejZe284rvjqVshdalyq1+92l1iWjOd
	DJcQNaL048j+6aW64SOBuh/USeiN+YdBksVVBLMyAGjPMSscOdhjtFvqGaFyWbDJJvUBQ3gHkcR
	X7VIAFOQMe1zatXgf9EKVAYJyzw7d/kX5heKHLp6fkj3fFdd4lXUItvxgVSSTIuBZyqUwlTqzZG
	8gjyp2wr9lD8ZPuCNNdHN10O/rITJ6C14rw==
X-Received: by 2002:a17:90b:1d04:b0:38e:4cb:51f with SMTP id
 98e67ed59e1d1-396d0f75f2fmr9434380a91.11.1787896132569; Thu, 27 Aug 2026
 22:48:52 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:48:52 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:48:52 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:48:52 +0000
X-Gm-Features: AcwNN1VegKfxy6tXl_M334rwOdANRXO1AtXiatObd5RyLQjD6NlT09EXgv8WeTo
Message-ID: <CA+0ovChS18paCd=ZE-7j_M-JtFF-N6+A75deKUqJ0Yy7ux=h2Q@mail.gmail.com>
Subject: [BUG] WARNING in lowpan_compress_addr_64
To: Alexander Aring <alex.aring@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, linux-bluetooth@vger.kernel.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/182-warning-in-lowpan-compress-addr-64/

  WARNING: net/6lowpan/iphc.c:937 at
lowpan_iphc_compress_802154_lladdr net/6lowpan/iphc.c:937 [inline],
CPU#0: syz.9.76/13660
  WARNING: net/6lowpan/iphc.c:937 at
lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952, CPU#0:
syz.9.76/13660
  RIP: 0010:lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952
  Call Trace:
   lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952
   lowpan_header_compress+0xeef/0x1ef0 net/6lowpan/iphc.c:1242
   lowpan_header net/ieee802154/6lowpan/tx.c:234 [inline]
   lowpan_xmit+0x4c6/0x1420 net/ieee802154/6lowpan/tx.c:282
   dev_hard_start_xmit+0x23b/0x620 net/core/dev.c:3904
   __dev_queue_xmit+0x11e7/0x3250 net/core/dev.c:4870
   packet_snd net/packet/af_packet.c:3082 [inline]
   packet_sendmsg+0x3d9b/0x5150 net/packet/af_packet.c:3114
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
