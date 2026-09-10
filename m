Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C83ACEE0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084279; cv=none; b=ZCvSZNLY1bQvqQTj77/lAFgXKjlFbYWjC+fl0RMvQh6tNyB1QD1ZouNPQ3ySFJkS9lWUX+oy1qPFyXY2KmHZqLAnQ0k0+w2nQmU9KcAJKKX4TrfqfoRqtJC+8Z7N8m7dp2DtJnbDwJwnFBiGsRMpcdG4kgqdC1BG2IwQAOO8cd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084279; c=relaxed/simple;
	bh=OCNiS8J/vtMzaYGJaTFJG+hDAr7/vODQZ8hG3+Sh0ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcSLz6GRptNo3iFHaqiND7BLjCEIctpcV9FB7xodA7BYoN34574ANuxUkn0FRsN8mepFKg0mNz66+q1HVljJ8LbeBNW8Zl4BA2fY0WTiujJiEsZRpa8URhbR11TJzgCGrslsLYlK7YBVCBVSHEwOXMY6ddOyy/ApQLXmKpF88A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=SvtEZn8L; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="SvtEZn8L"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db3305f94fso4097915ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789084276; x=1789689076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+O46wIvOTz3djUW9pqtLqktDx+oddxG2jyQv83ES8M=;
        b=SvtEZn8LL2fhWKS36//StADSTGWLfMQpN1Ufr2Waw9qAT+xwzIT3pTNYCbhJfo/Niu
         oNmBJIH6jJUryFdvh20M93xKUpFdmPja7EAc9NnN5xHKzVPE+vj2LaKDFZrbhcVe9nKP
         x/zQK0mNSRsH7OMdJVxdiYxNxB0fqcsksCDN3CXSqP9BOKKL2PGTKzgbPMJp4e1cqP/n
         NNgmepXWwpR7Rveue7O2OlpY958mESQkQlgCM1XVr9S+gOUzRhi3QPgEHdB9ycLfm44+
         wBku1MWBQsjIhRaOjAPbzOEVa7syAR/70mkD7Z2UrIj5Qv1CiW6VduWx12dcuGHOYKM2
         lQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084276; x=1789689076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+O46wIvOTz3djUW9pqtLqktDx+oddxG2jyQv83ES8M=;
        b=lenp7Nt0LSbTsBCfsxUvbNdO6lkseyXzhqHD6mScbReEAaD958Fekg0gDQnngeQkcu
         k/hkm6lx43n3GelAWUZUVannO48SJ9DiroTFyZvwaJnTcQKpmdnJe0yWPM+VD+8zV/Yl
         pCYMdyicDSVrg6OPWqFh2Jcmxpf6s1O6W8KBo7/oO7JryCbsXtBgD3zJriqOJOd5Fjxe
         qN0EnBpRsI3PsxhwGmMOEhym1Qx+iduvaYRFpnRCpWpA+pNcF/awYTuIRMwMtHo+6S35
         P6l7lu1bNZ8vVIuJvzZDaAOj+BH+EvlLH5ZWKWxL8jB920k7Qf8p7B/qwfEQ1VZzSu3O
         8Jqg==
X-Forwarded-Encrypted: i=1; AKwUvBznlmGGp0LxhFOlp/OxdE1CwCZDQQsAW6kQjRQe7uAs0jdK4+e80ZKnukYkj1oXRWHWl4PcailsGUsXEsw=@vger.kernel.org
X-Gm-Message-State: AFuF++n773fK6ApW1FHr2Yngh14h+wmOpSQlH1WUu9QenEF6BdAhrGkQ
	82ldzdsagfiOsXurIAS44bDkTWAvxg2Q5FomB+XkmED389VRoK3qDwTf1nL5fbbKQg==
X-Gm-Gg: AYBFou1UTo6p2uxX74x7PUiGoZb0OEp1+vlV5N7+q0nhH2GT/ywVDqoJ0EdTIGNLY7y
	v/37YAqCjeeOEET2yT3rvEKelDdxm9KVppc760si1Uov6Rzt48SIJF0rvjCHUx3EV3bSIdquU+y
	fUaWeOh4zyA9oX7TVqtReQL14XyZrNWFl2i6gEM46XBwTzGME804W7ae2pUELLWSVsSIWhi7yBK
	zmxsFr2Zffy0agXTClBQlRuZ+UkCaM7M8eMN35krILMVT2z9iTrHEaJWY2xNRFUvfd5MmT7AraL
	sS1XraN/suOJX4BE/K7t6gK16AF2iFR/Qw0LxVkxdMZmrgETf3+HrCZS0P3T8YWRZW99URwD5Kw
	Y0muEEeracjVbvbGeZYgBcVfWCUlCNZhDLiuCPH5ZzKouiAnw18A6NJ52Q78dKamXmizs8vHgzY
	H8e+3TkTsZf3qies9gnmKbGspcio4WQb5GgdAWHFUCK8x4aWv2JUsTpcvmlSPXJLojH9Ro5q9wc
	NhPrHsuquyMxwvdgyS5JsgrCQfVl+Rs/N+MXs5xsAczMWZz
X-Received: by 2002:a17:90b:5388:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39d9c0ac792mr2047057a91.15.1789084276484;
        Thu, 10 Sep 2026 16:51:16 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1680718c88.11.2026.09.10.16.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:51:16 -0700 (PDT)
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
Subject: [PATCH v8 2/2] fuse: return -E2BIG for an oversized SETXATTR over io-uring
Date: Thu, 10 Sep 2026 16:51:10 -0700
Message-ID: <20260910235110.3922068-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910235110.3922068-1-xmei5@asu.edu>
References: <20260910235110.3922068-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_do_read() returns -E2BIG when a SETXATTR does not fit the
server's buffer, since the value may legitimately be that large.  The
io-uring transport fails the copy with -EIO instead.  Map it so both
transports agree.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v7: new patch, all that is left of the v6 bounds check
v8: comment on why -EIO is unambiguous here; add Reviewed-by

 fs/fuse/dev_uring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..460776cd69cd 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -893,6 +893,12 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	fuse_copy_finish(&cs);
 	if (err) {
 		pr_info_ratelimited("%s fuse_copy_args failed\n", __func__);
+		/*
+		 * fuse-uring does not use pipe buffers, so -EIO here can only
+		 * mean the in-args did not fit ent->payload
+		 */
+		if (err == -EIO && args->opcode == FUSE_SETXATTR)
+			err = -E2BIG;
 		return err;
 	}
 
-- 
2.43.0

