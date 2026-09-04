Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C73448B84
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520920; cv=none; b=iUMiQZCRnBNy9qXJpcDSA55cjCWF4NVPJpwBfdTTwYO3D4C2bz5jtolp0uESi6IiCXikYnZOoJNka5WvdCTvn+jpo4+tqYvxlm/Z40UtdlPBXH0hVFhW1zaE4v2Juwi/Dn/XxyTBtumzF9bf5Ge1M6tt5oRlcKDWXlpMXCXyLsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520920; c=relaxed/simple;
	bh=Wc6pgt7YhERBx8wee7jvDtqzYFDwXexGEaDpDSo98GU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZLt27tiSjLbBJIyHN+taxrZQiNAzkEoq46igwYtz1ENyiKLqzIwmMzhkqlROX8m+hAdaQliKahJkB0UpcolVCHRyNm0znth7nUFdD+63HefTqjJi8S+BNtCtk1lwv3zoyYqW+QRtCeYz+Po6JShBM0/twwhTV2vKyy8toRzBtkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyseFi/y; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyseFi/y"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1467479a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520919; x=1789125719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YpfeOJNW2r8GlKUp3djYiRs+6CRfoMBlInK9gOtGNZ4=;
        b=SyseFi/yibuyIuWHxNbyIjbqpKlDzbq7EtUvmpC76WV6YvUxxQixBD8Dv7LmATAYa1
         baXcGmxifDGydx9/UxJnTxG5QQLgfXWxWm0yBWyj5Urtemp3G3lwNXw36u9dwFCkItgO
         gpYEPZyu8xvy2DtAOkcsytV8tuQtdzQDcPmmzMS/BBk+b9s6g0kbxLukeddkmD8qdhBq
         BqsoHLfW/nF6WHleNfdBdPy28qkcU9wF8AvbyFvVMiSZbB7LAr/1UvHfCo16I03J5ezN
         yttDpj/HLpvEd4DEezS8BFDb0jo3RDlGekX+RoyWz8Ke3Ymkcdahuq75aM0zjF+VJXVh
         TxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520919; x=1789125719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpfeOJNW2r8GlKUp3djYiRs+6CRfoMBlInK9gOtGNZ4=;
        b=cutEAK28be+7ZhBau/xO2osh+C1vVqelbphoysJVWN4GZipFfYA+ZAUnvzOerwdQ+K
         htea4n+xHVjR7Rz+Xm9ttF6+eXqUD8GpO+A0fA76LO1nVMh2KvKxmY6sewp+1hCpWGb8
         iX6mC0XtdU5PQ4yZmwqJAYErkRn8iq6vzBivcs6CZfVas64zUQ6QuSZgxJ+AUG45IBe6
         vf85OrAPtal5T6XJ6KVwfR0sXPR1An5mN6WipVrveiPu9hYgfRtmthlLyEbeaMWa0dlI
         sy+LkZOazLixYaV9XOk1wLf4xsOyRaeb83KA+gpJXWRzj6JFEUXXTUUpX7dTpvX6qlmB
         b3Hg==
X-Gm-Message-State: AFuF++momBITkftsW/0vLAwFxGagjjC4XKR5EPByjLrIkd8ZFpqVhVnV
	R7gsnlD94Rex6OBIRGCwEAi4dGOspnckpz/+Rd8I18J8yfgQuddI3AWL
X-Gm-Gg: AYBFou0PJHdtqYiGCDnLOUiWfKxUcttOSkzwDezS/II/Sh8ENkW1BVKdTBZETxPCFfN
	42lgTjiaHi67mLQHZvWuG9Ig63TQBabESDtgXumENP/UZv3jVjQyyBHofzEWRSP5E+cN7ERDe4F
	NbRpovWrx0y5Yw3k7MtBa9u3Y2D8rUC5XRFVkRltnvam1SZd4ir8vqn69ghPPNwn32BnWMgSzXc
	KqZZTlP7MPlchJQkVIydgLrivFQCaKqgHdRkQi3RI4nect/8wDSBJx3sDJsbA8I0d0LBsPl2ZBx
	rf/KEAmpslLSFGs50xBtQhiq9mAg/I7EBGUaIXjnu8ERQg3Y7/MSGp9zVLuB2a1xSy4AClt/Lta
	PXtpALU2qAcLah4+gqfX+SpEBx1NDKqq5Q5HFqf1R3fBAJNPvdBZusJLtCEKWGSUjQsAlWR9HDq
	oQb+3YTnVC9I+m5SensAYrzTiMjlGieAkkVUFpgA63XA3QBALbft1eaE8bEKic8+uV19SAChxzw
	wMUE+G79Gd6Jk8=
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr16094570a91.19.1788520918783;
        Fri, 04 Sep 2026 04:21:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm6121711eec.26.2026.09.04.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:21:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH] fpga: fix repeated word 'if' in comment
Date: Fri,  4 Sep 2026 16:51:52 +0530
Message-ID: <20260904112153.35820-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'if', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/fpga/stratix10-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
index b8ec2e6f615f..c08d60e3c85f 100644
--- a/drivers/fpga/stratix10-soc.c
+++ b/drivers/fpga/stratix10-soc.c
@@ -286,7 +286,7 @@ static int s10_ops_write(struct fpga_manager *mgr, const char *buf,
 
 	/*
 	 * Loop waiting for buffers to be returned.  When a buffer is returned,
-	 * reuse it to send more data or free if if all data has been sent.
+	 * reuse it to send more data or free if all data has been sent.
 	 */
 	while (count > 0 || s10_free_buffer_count(mgr) != NUM_SVC_BUFS) {
 		reinit_completion(&priv->status_return_completion);
-- 
2.48.1

