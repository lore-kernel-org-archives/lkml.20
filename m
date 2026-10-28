Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211158;
	b=Ur2Ril8eBqZnPFyL5W4aNYkM5qAdsOfQaJMeALRBlevJMYRNcnDCxhNjZ1sLwFIhvtRU
	 rGTlUyUfp+mZc4vpELrIXxye+VqFLwjgh4TJUjJjnLZr1ez/BMmrg/uUKq4BTkyhlRPTG
	 mboXy2ucIV9NAqGIIH++N4PyjAz/H6uMzo2SN62x68F1GL4Xme+COxU1HaY7sTNO1P7Hp
	 Bjqo98LrsRlDcapC61ljWXkOBrDrTjvGH4wphYMILP9zQ66MVvxb8lNKdepTZBG0iyfE7
	 t2RNJAvQNUhaOP0IQ8i4B6izaPnHjAfUssEzB8aypjiOAhFcW1tEFW7jYVIP1JN6O5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q0d6qWi5B+qlp69DsFDkPKiAVkLkzeJOiKS+6AQfdW8=;
	b=UdF2K+SOLqhpaNgKZUkcn7t3G2KDdvJr2I+B71/9djKhlwYiY1AyiZlaq9/PdpUOkok5
	 ciiI78qZfHUbQU+vukixy1EjAvmjEFtcOfaXM3xgBi39qyO5TR4iHE4/pg/uHHMoRO4MQ
	 NXKdNUMvr0MIvg9mc/S9whzotBMtvk1dGQB4qjqrdoX3kNnimzK3h7BX5TikwCwtlgfiB
	 3Dk+fbysI5jWYTHCC2/5y7DShmVi97X5ayPN2aT6dAksqn6QjfCt3zSEYuboxvL+HaREd
	 Y0HUH5XcX8A6nCTd8fzHgeCkMeuy5lN+drL2BS0A6Fvo+YMyUf2iVzeX0AeYZ9r8WGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MiYCVVyd;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A960A2624
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91A960A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MiYCVVyd
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so2459095eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211157; x=1793815957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0d6qWi5B+qlp69DsFDkPKiAVkLkzeJOiKS+6AQfdW8=;
        b=MiYCVVyd0iUPLIbBaMBLfjLz9Pyk+GNlyEwErmRvOBMFSxaTqWEMpXfsAAUmbQKZWi
         IgkOLYW4JN/ahhmD2MJ8B1ZoXPhIdvr+R2VqdkldusRPsQw8FRvE9//JsMF+XG41kPOZ
         7E66ijleJQzigTjB4riNeiSPqAAoD949EqH959h6pptjo62UWrauiSITdVT9caxTxoht
         dGBKljUrs1X470XcmMSpgxWJ7MzFfdueUQF8sA4tcnhaYdy4gr5a1AWh65NiWfvygbC+
         oIfgJ2HUxC28k7uBmSqBj3uyXqcX+SwOTfbJRzuJ4uKGjU67wrX8G+4i3R4QSFL200uz
         WN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211157; x=1793815957;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0d6qWi5B+qlp69DsFDkPKiAVkLkzeJOiKS+6AQfdW8=;
        b=R9aCK0RgnaWEXYMVThX/nsBJhBfuBEEjKDq53A2e5HC0xXq0LNaD/8pLPquKfqCOsO
         0tdL4emSO1T+HGqp0nGYSdY8guCIwFLeg+21AWkTO9yTbTi9P4JwENH3kQ0AeW1X6419
         R49KSpBSrY0Nlm/UFO1lAMy/eIyTObaMgV2RQvwmgUrwmdPfjQJkY6yjl9Q74EV3awNg
         DVMw2aHsFlCbU75Ph1MudL2clOswdRGlX4BjVjVMHw07ksSwysGlX5JgkEzifG0lpntL
         21KjPd0ssiZ8GtSxqAPEw5D7s1mlUer56JDxgYn+0fSAv+8RH1JCa2M7/LBS0H4gr6jU
         iM9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1nG3bwWSCAwaFi+9bTQGr8cv/cC8drBAhYzVmMNX7ZZ7qTW/RtJGdk7/DOeM/hWnIJ+7r94rWHd7SBkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC7jmDcSQev12k+b4jj7a6D8tj9HB6FRKqAXwOpMvnYtD/Uq8S
	NyEQs8xiayNRp6M5uQRbluDY8z9Cj0rayV/DU9hnr1+FJdtx7u2Z9LKY
X-Gm-Gg: AYBFou2zTnGqX9OVyl211DvpNYrUsz7j8XhJWGf10OtN8rktWbBw39AQUceTwgAZQ5E
	v3kRCJuXJtK2gipgAtNEqMyj3+VNsIIQot+S9wovsP567MHEYipoZmSCcGieZobyrfSsp0P/0ni
	R+C9suaq8VdkxJU2fR1laacnWcQTvz8jlLkxiz+AzmqX3nEcRnYMwN3pcDHfg/LT9ohaL392VB0
	zxdG5wq9Gkb9UJAQOvnpD4gTkDoOe92vbuEwDu4WZAAB4IiiX7UFaFkS6dof/AH+0CoclWg8XVx
	PdS6aT9EGZz1m2xoL0jC1t6pm/OYt6I5ykMfG7TygV67tdI2FJPY2kVQvzN/9MQJPSBN3x1eaae
	1n/mf6MhYit/h8tU62C3nnkWHktauqexGt2fYYYrYFHOH1bT3AWJ1ZiEEiJb39vTwz9FFy5JJvo
	qzuwGLqwH4wYiE+C5tXxbtZKn7GBbTysgdI0MoEFRYnITZVS7RybydJQD6oPkrvctph2NJQvkDY
	/vWMvGDJV9shHxf78b+mp4mwPgL5Fu37nZU27Sp9ot1tzHyOaD/aDw6uxuHJPj7S8GrVSrDlfAf
	EnD3qy8wmmOvCq2PsafEgQTH
X-Received: by 2002:a05:7300:a230:b0:369:a113:7578 with SMTP id 5a478bee46e88-36a1ff4734emr3881706eec.1.1793211156240;
        Wed, 28 Oct 2026 11:12:36 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm8309394eec.5.2026.10.28.11.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:12:33 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	netfs@lists.linux.dev
Cc: Shyam Prasad N <sprasad@microsoft.com>,
	Steve French <stfrench@microsoft.com>,
	linux-fsdevel@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH netfs v1 0/2] preserve prepare_write errno across write reissue
Date: Wed, 28 Oct 2026 15:12:27 -0300
Message-ID: <20261028181229.1408342-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cifs (and others) may fail in prepare_write() with
netfs_prepare_write_failed() before write_retry calls
netfs_reissue_write().  Since 82e8885bd763, reissue clears
subreq->error to 0 for a clean I/O retry, so a FAILED subreq is
terminated with 0.  The collector then does mapping_set_error(0),
which is a no-op — writeback errno is lost (not an infinite retry).

Patch 1 skips that clear when FAILED is already set.
Patch 2 adds a KUnit stub test: FAIL unpatched, PASS patched.

  ./tools/testing/kunit/kunit.py run --kunitconfig=fs/netfs/.kunitconfig \
	netfs_reissue_write*

No prior lore report found for this interaction; surfaces on top of
Shyam's NEED_RETRY change.

Cc: David Howells <dhowells@redhat.com>
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: Shyam Prasad N <sprasad@microsoft.com>
Cc: Steve French <stfrench@microsoft.com>
Cc: netfs@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-cifs@vger.kernel.org

Iván Ezequiel Rodriguez (2):
  netfs: preserve prepare_write errno on reissue
  netfs: add KUnit coverage for reissue prepare_write errno

 fs/netfs/.kunitconfig          |  3 ++
 fs/netfs/Kconfig               |  9 +++++
 fs/netfs/Makefile              |  2 +
 fs/netfs/write_collect.c       |  4 ++
 fs/netfs/write_issue.c         |  4 +-
 fs/netfs/write_reissue_kunit.c | 73 ++++++++++++++++++++++++++++++++++
 6 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 fs/netfs/.kunitconfig
 create mode 100644 fs/netfs/write_reissue_kunit.c

-- 
2.43.0

