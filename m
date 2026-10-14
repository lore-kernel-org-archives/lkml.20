Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2B4B0E3B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992172; cv=none; b=D7FwG+TQXdhPhV9RI+SEEa1lsHvTMJRJ38VaS4dVnzeZWhEg0xIAoEbzGEwsQA1ZrSvKwSTjQnxY7jz9xfTPS8AJKg1sIOi2UmXdUlkmM8X2FF8wZiJxDIrmvhM13VE3vvBOxnVew03IoSI7QVhCouqTg2Fn9S/i5zWW/hgCQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992172; c=relaxed/simple;
	bh=xTFOZoct61LdXRjebq1zWH+KojVjnjneTECr47l3v4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K1XLyjfoyMEjWRVwB+0mUsBvVlpYbe89ko5WYFDNGZvCX/J5CTtRrnYXivegO0wSdoa06LIeUWrHpYXmLPoIw8z7Sh35yGA7pjtt6BNf1GOzlZRpg8AE75S/Qe6lPJd90zL+QyIKkRepzR9gpFskuj/hwJYIj1NAaEWeAO9ynD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3H5cKN8; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3H5cKN8"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso260907a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992169; x=1792596969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAMXxWVecBisExRUQtUNYk1sARRmcgk7oEoVaJAln/M=;
        b=G3H5cKN8Ms7joShUMz/BusG+BrTCsULcOZ6wZtza7xIGekdO6fJFNnsEpB0zHlX0va
         +SDOlFQYIOIZKkh5Yk6V7Gr8AjSLqmoVVDAjhs4JzxAQevqOmxu5LFmTWjP2Qmmd9GUK
         TfBqtqjwqVzPHmK5gic8bM1LtctTl5Dqo1a68ocvMIldAYla4nuU+USfTvecXoTKyihh
         6ROHD8OYbIOhhdsOj1Sgf5rPQ1dDUb4u+juDOf1lGLbabeMnTV0Wg+mul5OBPSaF++ql
         /Z1gKS73lynHBU/+6zubQLsewFpAiJ19rcYnq4wlbruFXIULBc4GIcxlvWejV0Cl9Z31
         emuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992169; x=1792596969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAMXxWVecBisExRUQtUNYk1sARRmcgk7oEoVaJAln/M=;
        b=krnqoN26Vor3tckwVVsGDh5K5Dz5ekxoLhRWM3trqlP2G9aFGkR1sgmpBG0f8qGBfc
         HWF5axFxJu7dk0BvR3uR3P23mVExJ+uKWPrxPRzdYs/IjgaSMApLBH2eyPZr+SbbmRgH
         Rjcoe4ZmFM2qil4L0D2d67DMEtB+tEnFiNhUmmxGfBXjimmiOFaNqBZob332poHYCm3g
         eGOrwQLSi92KZ3Yg5BOHM+xc713udvUsTNFdnIA4TfP81B2zuWDi3O4R45Cx6krmbfFZ
         2Zop+RFZ6HMcaretrukS6MGiFIND532pb+lNsJx9fqBlJ4pXQu93IVMRGvHsh6g44cmx
         /C3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxS6GCN9Tikrdu81/ytgppOjL7A7DjAESG8M6OmdMg6IyBkptV+9MUXnE2uyKjK0yLdtf642kV8bzmm+9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkYE8yuIqFRf2OIUTl4LY1by/JeaG0i+hp/IDsBb0czJFIAcZC
	fauCfKVTbaDdfKIVvjYd5L9fEVLmqfgqBGrp5MrtGBYZXfibeMXfiJA+
X-Gm-Gg: AYBFou1gWSy/T0uMMORal526PjoChA+MMqcx36o7YJlOjo7O8g5w1wlErvw6xdbz/ZB
	bDFfHxIARfFJDw3FZPUOYTL3fBo74bA+6f6u4jhHpnEfeQeIghe3PmG5T2AmOfnie/kl7LlMGmL
	wbje0cK5+uE7uN/kZwANfgrknJAPJ53CsSb8yn7AaMFrXBSYanLLhYOjJmZ57N/tyoRoKS9312J
	N4JT/9WvoRxcSDH5a9Obeo87f1SYyaZS4WZGWW8f9DR2yW9sT3uavz6iqjqYMdM7xiakgqv3GNE
	KEc2hwx/k/u4oGlGqY+3dwf3nFJm4UkC7Q57KS28clTbOomQ7QXbdWwzt9LrxT/Jr7fSIn9HGMs
	1gk/9meKn/W23Ry6Xa3MdQ7QQTD+pWcgTyZufLe+ZZZM4ej/kFFLjJxI50EzDrnQyyQO5ara3pV
	LtuGUhGRzcuSxkUt9bhJfx7dwctLcp+rggpUy7e92EHm3mcokQKGRXUHAsFwGMQcd6ikaDTYwlR
	TxCrHk1Z3HHLLnS
X-Received: by 2002:a17:90b:224c:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ab3a0218bfmr15319248a91.0.1791992169371;
        Wed, 14 Oct 2026 08:36:09 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f2ba9efsm4715588a91.16.2026.10.14.08.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:36:08 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: senozhatsky@chromium.org
Cc: akpm@linux-foundation.org,
	bgeffon@google.com,
	minchan@kernel.org,
	richardycc@google.com,
	baohua@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Date: Wed, 14 Oct 2026 23:36:03 +0800
Message-Id: <20261014153603.1365617-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013035201.2809924-11-senozhatsky@chromium.org>
References: <20261013035201.2809924-11-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on the RFC thread [1]: Sergey pointed me at this series as
the reworked version of the by-direction split I had tested, so I applied
patches 9 and 10 and re-ran the same A/B. Big improvement.

[1] https://lore.kernel.org/lkml/20261012123328.1138059-1-zhangbo56@xiaomi.com

Setup as before: real Android device (MemTotal ~7.7GB, zram ~8GB), cycle
20 apps through fg/bg to force swap-out/in, 8 rounds, reboot before each.
Same trylock instrumentation on the stream locks across all builds. For
patch 10, "read contended" = dpin_contended + dexcl_contended. Decompress
("read") is the swap-in path, which is what matters for us.

I use decompress acquire count (swapped-in pages) as the comparability anchor
instead of swap volume, which stays within ~20% across builds.

                      baseline   preempt-disable   9 + 10
  read contended      24,749     406               1,959
  read wait_ns total  239.8 s    3.78 s            ~12 s
  read wait_ns max    757 ms     51.7 ms           72-96 ms
  read acquire        3,948,150  4,305,078         3,510,610

Decompression on 9+10 splits into:
  shared (stateless backend, single-page): 76.7% -> down_read never
      blocked (dpin_contended = 0)
  exclusive (cross-page object): 23.3% -> excl_lock, ~1,959 contended

- 9+10: read contention -92%, total wait ~-95%, worst case 757ms -> ~90ms.
  The rwsem does the heavy lifting: ~77% of swap-in decompressions now run
  concurrently with zero pin contention - exactly the reader-vs-reader
  queuing we were hitting. Clear win over the two-mutex split.
- Residual contention is all on the exclusive path, mostly cross-page
  objects (which need the ->local_copy bounce), not a specific backend -
  lzo-rle single-page objects all go shared.
- preempt-disable still shows the lowest read contention (406). It covers
  the other half of the root cause (holder preempted/migrated while
  holding the stream), so the two are complementary rather than
  competing: 9+10 removes reader-vs-reader queuing structurally, and the
  ~90ms tail that remains on 9+10 is the preempt/migrate effect.

Happy to share scripts and raw numbers on request.

Thanks,
Bo
