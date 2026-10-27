Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075615;
	b=03vwL/OffbacfHgrpSbKgh5+sikiLbGJsw27h+Hb3N1Mq1gwHVmXCdPUJDdM5Qm6wlge
	 0KMF0qzmbqZ2fcb60kXfYsg0zezMwq6ZL5iO1dvwQEs5vsiz1yn3fJh9+491yXwzPwcRr
	 f+rGxe6eL6sBt6s4GnZwkw+m9Z8sWxBo6ugUsPJnXfk43CQh/jgMbJCJDVTbO8lJHxg+4
	 JHVlBpr+teIjAYyJ/8irZM0ec48WjZPGP6ID9Y9rFpInCQoHOlUSRIWJrE8vbtzvy1+Ry
	 uUnEsqbr0NtxQc+uAJVbugr/ettYpVkPAAxtGZI4R2shPxmCSaDOha5vNkvBYTJ2NDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
	b=eWxDtZzVE5mXv+aGnM/nVwZS+ea8+HxT/KTL6Q+nIPj0mOpvss2ZZBrwOiNUc+cJ7xba
	 A05ZPjOv7r9zxtTnxbYUfmDmx9qu4fFcMeQK5fUeBPziD9b+nxPjuGkrKfzIhNcMs4Ybw
	 vN61nyDwg9pGjVuKhe8075kF0E/e0Jas0UQO9g8cZkf905j0cWlIhjFboC80AzYXsWE6g
	 cXOvj4maPZ3O8wLGkY8EmGvd4z1TT1Zb+2W+gg+qhTL858WEOkciicCfIG1uOMVwTWekz
	 QtE9ag6UW5g43NlbcoL3MQBWZywFekUePRIKYD4MWGCPJZ5DAc1vb2MK/+neyQIQUeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jb8uNkHE;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jb8uNkHE
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso334744f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075613; x=1793680413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
        b=jb8uNkHEzsy7JBkCMHrrZsHb72SwM9lGWXuRvK9DBX+c7Gp804CSL2AfBacz1bS3pv
         QqtCGSu33gJWp7IlceOAB47Selr/0m8KnXYRNOZxXT1vIakBLP/9lV2f+up6JO9bTT/P
         RLtjMjP0DL4KKIxcXXahICNHAw+fk9hQUglCb1HuhhknTaZhjJ3HqARnjoRQsS8DONd8
         BkqPh1bS2PZyZlO+biHC5GINIsQhz2e9wYEQpMNq2eTuOrcq/kGR8VQ3pOx02VoA1clR
         JG2G+7Lhm8Rc8d6n0rSJklFX+wxyVEWTsEgF0ss5MnMCRRA1nIj532c71iepff1LcQqs
         79GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075613; x=1793680413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
        b=Hd9tEO1aziaQg2utS8l3aqf2O819RdOC8BnZaF4+bnU9CwmBJ9G2lUCKqsdL+j6hwF
         N7onaTEvXGYS3LwNZCYCvem/K2bfvUkrBY98hSvSXidhCqJwcps0mo+wnuje8xKR1vjd
         vu/ThwE+10oJGHUufYbFfGQEWFBGHY/xhOZYmxGnUQfPTF+pGxrKe5a/upY/b78aSKCL
         wUhQ3/vSPDtNbpW5EveO+0acdiA+dM9r/xCEpgia2uXMeCqJeqXtyqZUWMpp9MAAhi3c
         IMMzc73rqlNy6yLIA0oJ9WNVFRFSHkY/lRXqoWpn2V5fC+4YOXysTSwx89h36+v+KR42
         ldXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9r9rkJ+nUEK/iU28vlNaW9RLBAgHN8H22OZQFlPdTxDBgNIBLWl51T/Ut2Nb+PbsPp05nn0NUyaprjoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxiCIOj5zAy4MeDQgIwk6oMZCuDhZIPofVCOynaAypbL1ht9lC
	a/+YkA17bWle+HMpPExongI414uxYEDerqGTY/Pxjx+RgM7lPN6rNN4raC7JKL6qYhk=
X-Gm-Gg: AYBFou0D2vdcomYFZGKeKCQsqpJVMwZ0OqO82z3NxCnwNHFt7IWvDiJcLpbWDWqjNcv
	39tSAoQnsf+Rlwa1UgOGfAKwaLiHYzJdcLmCB+CJvMM5+gJEcSuDoWQ+yAlVcaQmcdi2oUVXDf2
	2z2jbkjshlW+EfRPbJHG1EbB753LN55mjx9XpnCnlL3xTyszda/d145Q1h3VNmyT1qF0kliQZ+m
	CV+9MgiewdR3bZGxWXTi1JfgAB0aibZn1onE02pmcXtc/u0Wf5wBJDmPemWXDpNCUFHaFgr2dzs
	sqlLAr6i30rDnrkmUKr+VDqIjSmbMzAp9SrX1XfYNRWQJIunA0xYaT5gV0j8WV0HEQ9x9gFMnmq
	MqNtQe4FKgXK7y/IBOTDgrVec54Qb1hcEKYrkDSV3JcmrrzAXzJUFDAqjCES8bO9iy0c6YIQgdE
	ZH3CQciClnB7ybjxSmFr+Sna1oTBnMEe00QtqmFUJAtYJ0nrdk17LI+FjvDgpJ3iYa8fzu7/ocN
	CTjuE+7NDY6n2oib8/DjZYTaOG38jMSwPDvRKDh+sNLgWQ+BfarjCAE5zUuKTKuj2jIbsKRMJ0V
	O6giqWkeyuGq2MxSkDMCMUQuDYtXruDMSPjSZdfVeBHIzlEV39knVEXlwO5IARJ/ZCZ/GJj4655
	ySqC+4qw8LsETtviF03JxwCSAiL3coknjLNge89/gwP86BwYiIKKU8XeGyYUNP3kc/eOyGlLZYE
	8NZSTEYe1tOg==
X-Received: by 2002:a05:6000:4008:b0:48a:fe00:ad1 with SMTP id ffacd0b85a97d-48e55a0afa3mr3439452f8f.6.1793075612981;
        Mon, 26 Oct 2026 21:33:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm20594253f8f.52.2026.10.26.21.33.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 21:33:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	io-uring@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] io_uring: requests can overtake consecutive drains
Date: Tue, 27 Oct 2026 05:33:23 +0100
Message-Id: <20261027043323.98916-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ecb6817b769f ("io_uring: end the drain when the drain request
completes") lets a request submitted after one drain overtake a second
drain that is still running. This breaks IOSQE_IO_DRAIN ordering for
both standalone and linked drains.

An LLM helped with the review and reproducer.

#regzbot introduced: ecb6817b769fd7d71af2c9f446188649020b2e53

Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
            (master as of 2026-10-27)

The reproducer uses a default ring and two empty pipes:

  1. Submit P0, a poll on the first pipe.
  2. Submit D1, a drain NOP.
  3. Submit D2, a drain poll on the second pipe.
  4. Wake P0 and wait for D1's CQE.
  5. Submit an ordinary NOP while D2 remains blocked.

The NOP should remain behind D2. Instead, its CQE appears before the
second pipe is woken. The same failure occurs when D2 is linked to a NOP.
An ordinary non-drain poll control still allows the NOP to overtake, as
expected.

Tested with QEMU 11.0.2, arm64 virt/cortex-a57, two vCPUs,
CONFIG_IO_URING=y, and CONFIG_PREEMPT=y:

  v7.3: standalone and linked NOPs stayed blocked for 250 ms
  d135ab453a74: standalone and linked NOPs completed before D2 was woken

No privilege, special device, SQPOLL, or unusual setup flag is required.

Regards,
Karl
