Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502582;
	b=IFaVNUQP9ke7MQPVCHsMFFDH29xYAV8scVuIO7JB8/eVS7VA0Oe6lHf6exKApyT05+w4
	 cx3bcbLTEYrCYSquNtna9Lqb1BzP4EVUaa8wjVkCaGFA/zYolTxIBJgnHB88gl3zjHrjU
	 Oq2oEgclqkPio9uXElLB0hiqfWHkzh3pXThcKuJoNymI9NsPp6nmJ1faQw42DkC+EJP7N
	 FCBqa7ajTBUt/lgSLcvYjcu9NIm1Z3YwjBFt+c1ROVV7eemXNAeSnLxhwc2Ab5dodBQDu
	 oDYIZxeLo8/aE3IzbINp+aGRyK6JvrPXlfiglu/F1NW3SbFu1DYw2N5l0EDrCsWzgGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
	b=lAMI7rtIeid6/Z7oxxS+atEWkS1YoxuB0sCqA5VHzpVFEsis2+JuKy37TgdE9jRfq+hr
	 tAhV5RQAjpqgW2lFOEuRLaZxjDb8AP02Lk0MHfrDDTC+Tw6dVI3HT90rkOas8cCkPYAwY
	 qhOl2EgqblhRh5+KJylsN/XhKTl8y/MieMQg/i2fDF5fK9I4/6im/pStXAypXI4+7ew9N
	 yMRaVn9cGbQz8e1V/PYPxAjzA8ukt/WNzf3es1PSWxAeUJGLdbiCg7Ak9SnkF+ZCyrkVz
	 4Oo8u5uLeH/ueLmaWlv+V9o1V+SAkKX78T4ax2aqzpLlIpYqr3nh++vAOx64odKggbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+Mhg9mZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8452606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8452606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+Mhg9mZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso26097855e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502580; x=1793107380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=m+Mhg9mZb8UlccKw170zoEuX8/ZL7ukfx0g8iEvMYstd7cHKgcmPKKzvRJlMM6JsR+
         Ohp53zAk77A2AeQBMcY0hz2PiUdDHq9Ia1uYqcTREBRMz4yLH+zxb9EzDS/DIETtkNW4
         LIrKe6psStaZJSX3nYT6z5MtVWJN+t1rrirjPbXSD17FVBaiEGT3dyZp8y+fUifA4ytz
         5r/TLI0Rvzhs4Te3tt5Asg6pg+xZX+yhCbu/Nn6NwRYbxei1LLc74Y/gG2bvPUs3I+PP
         sCTmq+OTr4qFoY34KLmhK5bv9B6+WuLIxgS6RcRN8kIO8uZ9QP49Nm5v+7jaRdkxpjMN
         FNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502580; x=1793107380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=iPSKfOxUUqHDS7SfSrnDgmn3HEUToMibubNsqtwRqnaaLvT2LfVRo1fTREjH1SEs9r
         nwllUYvVkobAJfEjU5Lfq2mxwEZsNwjlsQ98tjijI4pRcT2E857z1Y/FT+Hdo+bSMBp5
         Tk76ER96M7wBBczwTvCW9o4K1KAO6GwtC8i1+pgyVSJHMvTZwxUk8RkjpYT5Gv2wGkh9
         owwsrxTKRdSGjOqvfDebcI/JCCTKaqYUTvvTaWNtW1JFdObnRjbv349knIqbLifjyysH
         NQ1Fy6erLLrerOrjkxt4xc4kEEVLWrgj1gufx8ungHgLHdlbjp/zD0RkvdfNazEVEOce
         NVzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwka69wqjKSMUE6qXAOLzU/GXrzRAFtvAcl6hrmOZJbVdYwSkqLHTi8ijrkM4Kj18FpXwmlpsityyJu870=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRWRnuQrVh6r2X/FjBLMRrnW8k42pZKQRd1kozevdTs/zOPsiy
	9wRmqiWpK8/Aw6prqsUbfnt591QFyMjUCDmy4XkPw1n4rDCJMGMTEIZE
X-Gm-Gg: AYBFou3yAi/RUCRQK+2T566BCTkJVCaIgcx1/rRUtrd3vVAmIoo/iPLo6QayBcifiwp
	izONBjcn+YJZMa55DuniYEwu7KUlLiUDwi+FQx6ZZSRUJkeY+2CmOv2EfD2Bm/JBrpzimaRgaUc
	3e/WCs3daIc13xtp/ezZsx3Lk8fitIlRZcemukNAr8w92IqMDvA1JUsYvAFzLdBegrboqlApFh3
	t53VghgMi3fQkJmophx5zi0o2emkFTeHrr/5dw4PRlPD8Wc18tdAr+97nvNXXExS4ZDc3PB/U4X
	ubfMKJP5qj21j05mSKg9T+nqiNtZg7Ti+7rE4TTXWtqPgNQ0ueaXxiXNeT6B7wf7G7p9ohTnIyc
	ljBIjkZX7Fi+FLFwp4e5MKo34n7E8N7LitQmbZXtVBsfpqQGXySEKRBgFLrDzLkMVz5V07HjdLI
	ncwEJHOYvxUn1M+Kr+i7BiXUVCK66nZGfw+0b8GCzrlTtT+Cj39PdFJIYWMbeHT6Ktg6IIjg8ad
	FkYvNskkJPLaontkhTYPefJzQ0oeeqq40at
X-Received: by 2002:a05:600c:1da1:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1d7614e61mr244276965e9.17.1792502579898;
        Tue, 20 Oct 2026 06:22:59 -0700 (PDT)
Received: from Ubuntu-vm ([154.192.10.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fafdsm6352877f8f.9.2026.10.20.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:22:59 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH 1/1] staging: greybus: remove unnecessary goto
Date: Tue, 20 Oct 2026 13:19:13 +0000
Message-ID: <20261020131913.5171-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..284935fded12 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
 	kfree(request);
 	return retval;
 }
-- 
2.53.0

