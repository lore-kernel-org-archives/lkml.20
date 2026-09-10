Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521937A851
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007119; cv=none; b=LaeF9VtFW0eZh3kyf8oWIBTanb89VyBfCHbNoukN/MVE8fpJlEpAXk/laucHLLJ5DuKDFZPTCiO2Ca6HWEevrdVv7rAR7EhRwfHEfswS2zC4km/IFKB3y298wDH6p84CjVUgFvRg9BIqALkyiIlZFE8k0thBiIdns5q3nhPvaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007119; c=relaxed/simple;
	bh=h7jlRf2IsDI9qQdqGv2bSdvzHPNhhTR1Nonfg/W40cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/n0B7Z5CL0naj71Z12YfsabCk3ksLnFPSRCCpdnJ5CcuRJI5BVUBKi/3JyP2GDE55Py+yK+ztRQdFRQGIIs5YVUSFAfBqsojbZU2VpveTBCf4Q+4cvYUgeXpZOqE97xOwxbqaGYTFCmzqtkYnUnmpRycRK13mwGXsSPUKTZYYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=L2whPWgI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="L2whPWgI"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso4353892a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789007115; x=1789611915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mClRprXurGsMr2UxPPq1/QlRUj/VLPAMpoAcj6a2AM=;
        b=L2whPWgIXodOTfJfr3JwG3F5vO9y5tCMyLCBh7Z4vmFpj2dt7DB6UHuxwMiCCmP+Yj
         q/WaU65CJNtll58G8iWi1U6FmeYUpgzWz/BUqnqvNxzNKeWtuloSvajiNxFWTX7kpEQU
         tH7hWa7bSFcizXwOH7V/EO8GksAhwNL+orLBq6K6SVD82LTEeiBmmnKoyqzUgEcg4fYr
         IO64HT1l7kAjd4MyCZufmvWg1rmnh1NFZGrxgyWX1pDGTvf/oAJs+2nIgZ/F4zTK4q4l
         WGW5yWIeffU/yGjcnyn6FWu0ZlZdAH7EZkURia20epwBhGaT+OLPmm5qNNjTt1dYW1cf
         Xd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007115; x=1789611915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mClRprXurGsMr2UxPPq1/QlRUj/VLPAMpoAcj6a2AM=;
        b=Lz+Txa+RJn7CHUQktV1fOp48LtHY54FrndJfsXLUJD5TI8AHY5ymGt5SqZRzdMQWk4
         OUzxJk1xDvllbH2RjdYdzUINBN80rRBqI3/GisrcGHgM4nEw2BA9rUf+hBbR995JZJbi
         b3YvJ+iBOVAT+OsdxTGUjDKKI3wYWUh8NNDHYiVZhptEe/lBh1jmThSD8ilEI4rj+vKg
         yJr8VakMPhGieXH2POx5Isfd6/bAAEwVWPwdn4juj4tCOIuQje+/A9Zs0/9jknmRfv1Z
         zVCfxh3RGpbCnxivs4lzSbeji22hBK/qYl42p9WQpv4orbd87k8TjwORZf05/EDWGjIo
         PYoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWQkzfpmSADRiY5unl9zGm187IqO/Qvf3NfpzDLTf3g6UZf1jWx1IaZkolS/krUKrSOPozkWmz9OzIpTM=@vger.kernel.org
X-Gm-Message-State: AFuF++nLk+w5qfDJrbmNoqYpH+lQhjaKJhOJCFem2DB4u5DPRqXHvAKs
	j87UBxiCUYkXZ/WQfdcSlIehDXz/8VW4KP344SxN0nrnyOEvQ4m7tKF84vlmDImOVg==
X-Gm-Gg: AYBFou0mwWMl9tC5frJv3/rPlDOyAFa3AiS8QytjbHNhOvOlhqz/QpKajexryjo2PpC
	2GHBUXFTC+sFaVH8idGzoZn0LvC6OepywFViLM2nfj+dlVkjWhf9OnwYY7xbMpURwBsdfuDyMK6
	BY4Fz4UEdU2f3HEgR8fodEUBHIKYpf52fHdG4UQcKQzyxSubWnud3XsyVPWIGeCu/LPn8EZufDt
	rUxZbwly3ii0lQ3LwwNJVVNCA9jr6aW/2fwI2kdHpXtj8lsUrc58uuxg47WwUJ5klERPYt2B5oD
	QL/GM5ZCKoqmW4CKQW54ce6O8xR7hZhWD71zrN/AYvUfbeqX2VWl9LS1Vel88opwTNgTmOFh5pY
	AGzRq+SMOLVxQV1qGf779p20yYt9/8GTMQX3YQHebi/J/21jmpmItt0I4BP1NmkhiH58UGdwhgu
	z6D+dHxiHfopbgsPK+pIgxpBfuhDpk0kqleWTSQxpdSPDx+1HfGcmBaA7TxjPVyaF53fOU8ev8S
	wh4SlqGKsU8k4tVOUAOrK3QoDc5MDL+WlDrPZmEboVENg==
X-Received: by 2002:a17:90b:498c:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-39b260d3351mr53425599a91.5.1789007115401;
        Wed, 09 Sep 2026 19:25:15 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm2688847c88.1.2026.09.09.19.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:25:15 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v7 2/2] fuse: return -E2BIG for an oversized SETXATTR over io-uring
Date: Wed,  9 Sep 2026 19:24:42 -0700
Message-ID: <20260910022442.3594649-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910022442.3594649-1-xmei5@asu.edu>
References: <20260910022442.3594649-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_do_read() answers a request that does not fit the server's
buffer with -EIO, except for FUSE_SETXATTR, which gets -E2BIG since the
value may legitimately be larger than the buffer and setxattr(2) reports
that to userspace.

Over io-uring the copy fails with -EIO for every opcode, so the two
transports report different errnos for the same condition.  Map that
-EIO to -E2BIG for SETXATTR.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/fuse/dev_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..6351f2470e09 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -893,6 +893,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	fuse_copy_finish(&cs);
 	if (err) {
 		pr_info_ratelimited("%s fuse_copy_args failed\n", __func__);
+		if (err == -EIO && args->opcode == FUSE_SETXATTR)
+			err = -E2BIG;
 		return err;
 	}
 
-- 
2.43.0

