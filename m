Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3993D5C32
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579919; cv=none; b=Vb7LD3FE+SbF8w9ffjHjD6X2i4R/2n0EK6faIIutE4vSYDcd1pBCsjlgtxk+ZYF5zA/PsmtruGlVJQN5KG/PZcuCZoTM1K+5rVZSDJK0V9qIaharLnZOxdJ9wPq35Wl7HaFb1y9ErdwMtCWXMRBXdNaqrOnI/qiYPUaxj2eCbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579919; c=relaxed/simple;
	bh=5andsTa8guQZkx+SfoPlH+n4TbEPX6cOtCcngDLHNCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=quPeKPY1Ygh/urAUWWZTnLWo6uNbuAJ95FGttPXWth1L11PvkR5JqUbXrPyQdjhBCVNBFdp3WeNDMEy/M2fzmbd9SIYJbW+61APZr94ukDQn5fNL/nDKPQ/LDdLbcZaVTVMQfkUaG+AkCG7Uqq9nt+aj73oQXbyaZgm4ctwKGYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a58sNPl2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a58sNPl2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c247f6687dcso44131466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579909; x=1792184709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6x26UZ+wvq3ZWV1vplJdUFrejcdIKhR4wACBzfYHUKk=;
        b=a58sNPl2kqpxmxXEvJoV8cXSH59JQ8QYsEi9aAbEmUFgoRtXROcL94ikEONSO+Z/Tx
         pZGGKd5gBzTKATrDSC/YlSFLsGTeRLRJXHjSdDEtMoWLfG7Lb3+KArWAVUWzBgT09h14
         c9wYRv4INcl0BQqoLxTmJuBegjY+4Oo7jb5JiSFfWQ0uzcSr3lxUAvS+8dL+afflwqkz
         D9qQ5/DcKhyUyVhcZEUMn0SPNxYWojaUKSaPckVFv7Kj+X6xDtpg/vymMijvm+rVT+gy
         uVXfytF7nMQ4qoe5HSjVUbvCulWxuOx++FQnwJ0yi2TTdDcov8dL44XE4ae8X3p5nOQQ
         8x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579909; x=1792184709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6x26UZ+wvq3ZWV1vplJdUFrejcdIKhR4wACBzfYHUKk=;
        b=cjYIcdkBgTI/5KpPJOcve8XtnPDpEw8GMSV1vgf5+4umbvUby9S+v/qD/RxkNNY9u4
         GfJ8iBA3KaZw78Ip0cye+c4lyLRtry3nVYrNd6nRoDpf/5Vyj/w5bxahwu4hTDD5UgJc
         P37CycSGIKUNgvLFCHTUV3V0mzKw7nVhOtTmGY84VWI0EW3ZrXiz17PTqu+WqP0mrD3a
         wHP81LydFfSopbeL0ddNjYx/m+GclRYarjNO49qJglOeWa0MdgHrl1k5P2Y3rumiZ/Iq
         6HsvTD50REOyGK9TP0AQZA0vIBthv2b2WuUHsCNNlCt46Tvm5Xoye6FD9sL6P0jOLYMJ
         u/Lg==
X-Forwarded-Encrypted: i=1; AKwUvBw8wtWFAhlR+AgZ3PZloiQ9mbPv+/vg45kKbhVWKqJlWQYLcKBP1KuUeb7gRLaOw3ytl7ZsMSXm60mAFAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6cz+IcJbf8V/yRNBaePnxc4yrI0+Bw52ioI6WegdMRetaWJDQ
	Zmx1FG+W6yVZ8hTmmLxEa7MI2OXpKM3ifdKzMFcqdVwLy448XgatBiDjN8i37YY4
X-Gm-Gg: AYBFou3LrITwlq7km8+BPVOVC/uK2/OB5GPt5W1fyDv5hkd2rZ84WC/KamBNgBqd1B5
	xXWuf6fMA+uWpReLlemd6/2QYfIKdyrqO6dZCxdeAEvL8mRaEfh7sS7uSX9Uo1Z8anlTmYgA9GA
	LNTdqiT/Tg2ob8BPs1hhFnK9yv3yTNOH9eUVe1fzjh3VvQdPomi/KGwjFkLLEcpfMLty2JeRx8t
	raaYhX75+OBbaEJC/xvbFm+IMZjn3O+GXawQKdr8NYEvNALZLg7l1eo47tlISIaaae1Z2dRRfzl
	NKT2Uxj+fzXohEpUw/oRGKamn0R3MOO/a7dlN364rVJfiaT33udt21wURwV54reRAQ2nTr6Z1jN
	yajFbucaAmm73i8cvpU1xc9B/wXd1J0DuZouGZ15T23gSnDwddTH3KRPKxlbBp1NXGrM4c8LtR5
	w+oFrYfhvPiE1/dW0Ozhg2JOJynKpnZyTVbDRTOguX5L40rzUnQPs75HY11obIwWd/kfyfnaObM
	/e7XphS/hGTFKuQsO/7AhR6kByDyjImHNRvvu2F
X-Received: by 2002:a17:907:6d17:b0:c26:1648:a069 with SMTP id a640c23a62f3a-c31aa08e576mr337775966b.36.1791579908651;
        Fri, 09 Oct 2026 14:05:08 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:08 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 7/8] alpha: invalidate the local context in flush_tlb_mm()
Date: Fri,  9 Oct 2026 23:03:52 +0200
Message-ID: <20261009210449.971057-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
References: <20261009210449.971057-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_tlb_mm() has the same caller-CPU omission that was fixed in
flush_tlb_page(): when the target mm is not the calling CPU's active_mm
nothing happens locally, and smp_call_function() handles only the other
CPUs, so this CPU may later reuse the old ASN together with the
translations it still holds.

The active_mm test itself is left alone here. That path calls
flush_tlb_current(), which loads a fresh context through
__load_new_mm_context() rather than issuing a targeted tbi() against
whatever ASN happens to be loaded, so it does not depend on which context
is current.

The uniprocessor implementation in asm/tlbflush.h already has the missing
branch. Counted over a fork-heavy run, flush_tlb_mm() was entered with the
mm not this CPU's active_mm 2934 times, and 632 times while otherwise idle.

The proposed Alpha hugetlb support routes hugetlb invalidations through
flush_tlb_range(), which calls this function. Unmapping or migrating a
hugetlb folio from another context will also need this local invalidate.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-7-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index a5a42ae4a7d8..988e397b0b8a 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -649,6 +649,9 @@ flush_tlb_mm(struct mm_struct *mm)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_tlb_mm, mm, 1);
-- 
2.43.0

