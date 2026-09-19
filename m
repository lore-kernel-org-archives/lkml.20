Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78461390985
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857274; cv=none; b=p/rQG27DgobMLHVrEF4eThml49FCkA6HlrzpBQvCojra2Cjofwy+9O6AwSBBZgoTFql6igayLwNqsTwhCtjCEHmtm9fmoBTl1HvmkKV4OJdLfMOF4g/VY6XkHkNnKAb0zDiZ20teXatHRnh6KtxvfeNzQ9emxWwk7Op6SB2e0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857274; c=relaxed/simple;
	bh=B4GdAMoCwiLRsDWwbKoMF3OGxfJiyMCwoeSLCf4H0Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JD04sGqWsBZV8Phtlyb1ODKv9BQbdsfyV3p0YaRzsYf8Lz1TrgAIG7oV8N0jk38PhAwwxe0hqxiuZvDovPkuyQ1AiNsiT72lX33JoMhDBUePG5aWgzsqu+kWSUakSEZUKjvDiZJezH30M7/lehiygHwacSVxTo4g0RlXTe3Pw+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxZgoOdE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxZgoOdE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1864088a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857273; x=1790462073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xZ87fdrDeLo7wrehSmNDX8WxnxSY6Jc+Z4ytRNTHoA=;
        b=bxZgoOdEjhWG2FBBTZ9SZuygYxmL0DdLPXKLdXuaUeDihh3rbF2EZwN4Z2Z6PhRLVb
         zygRTdmX23s5QAyWo5NbkL0X+gJ4DEpOlQrSf/huVGp8wzL5HAGHSGTBv8JQCJyEg3pa
         MlBbMT0YlcUqVdvkB8mH/cIqYpNRv0dJGhaAyv29G4W8bkPC9Is8JP9UPii1wB+pEOjX
         3OkBb6YIZSjXoDGYvP81MdLN1TW9hfxsEaOSWKZRkTZWD1eJGFNuH9H8UmIDXgkJUOjY
         qFD5qcG/n8PrNhJ1wgvgfrV6pQQexGvxRsdkrPTbDFdVSPTHwubmDt8qVrml4aP7WDa1
         A/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857273; x=1790462073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xZ87fdrDeLo7wrehSmNDX8WxnxSY6Jc+Z4ytRNTHoA=;
        b=xQPJeyyEY/HhBjE8le5q11Xqx1BWVyDgJ1KxQKg4qH3z5HPENDn7ri5w7GNY9zsrIa
         rG77fZ94EEwrIradagqpAYulTO9DfE02W4KMjIWIUSIXeTqA5tpx+RvjT5eqm1WtXHHk
         o0bNaBUN0rOY0Qw8uKTN/Dh86F8R34PRnp95bp47BpPALfR762J9hUl1Jz/+Bp0GXyGL
         rue5yyNiK1PFwc/nBcOsDJ9Jwxli7ny+wwZMlFSPxOONSMnDctk96fj8dEc/IMDpghiq
         B+S9OrC3tMPNFRVV0RHO57rr4aboYBoAE/wxIjiI3lhX8nTyCfVPmMZ0OlMAZUslEpK0
         cjOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAnZLFOnyWtU+jDnSxxmNElX/5wvgLfpYj1ZNJMP8i8XhOGvWxwjrZvPNmok7wKwvrZWWvXUGQpHYVpgs=@vger.kernel.org
X-Gm-Message-State: AFuF++nNHvJY9IJAYcDNjFfj5OiWGOU2Gzlb83ylpupeglH8hqKhRO+e
	iVyRPWrh/xD1rN49tTtjHAWB+sVZpgU6vv4LwRy23c+2uXmO2tiwUbwm
X-Gm-Gg: AYBFou2k/4ror7fqqwIqazFtrJ2WDlVZtFzXN6gw+EnusMJvVLdEzOp3HssCbmt1sRl
	SkCG3VFgiVekVtMcqvp3FyyYS0mhrg7obS3un6eB5/Jzrw3YWcj0w0q03PJm1Dr8/TcwH3dlqme
	SEFrEktsvEw4Zm5YF0JTIE8HZFNQ9Ptj2BBOp0dVvp0+or8YAQZcAFZvIsRJi7ztc83/89ggxg1
	qVyEvFDBqWW+jQdYQA2Y1whQYu6I01UBA10yJlDo1QtEB/VpKxv1QYSbJHELW8fd1mB97MePvAw
	eFVwKTNwrMes9QRqLlI2FsyJOl1ThXcl86Bgph1WFwo5WomPc53kzDJlG+zwIKEFcdW0X3T6tgg
	ZwCfw0muY0q+ca6b+AXMNJl1+YwujNFiu0AFW6dJD/RCW1cTMFEUtbPh2CKRyCEQXZdSQKhaaQI
	8yVuzwWiAtTbM4HgPs/JkOWATIml7+P1iztU7LWjU9nqjslT/afKat4+oXTlykBl0oBl/4FgaD+
	F3MSXC+6uJmkYf515MnQ6Fiu7EgnNLH3359z/8d4b77AtWoehgKc5DStQXwwEQCCdcC23M1Sal/
	lYLiDCZ7oQ==
X-Received: by 2002:a17:90a:1c82:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-39e6795fcc9mr4171272a91.19.1789857272930;
        Sat, 19 Sep 2026 15:34:32 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm4702234a91.1.2026.09.19.15.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:32 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: slip: fix out-of-bounds access on short CSLIP packets
Date: Sat, 19 Sep 2026 22:34:31 +0000
Message-ID: <20260919223432.3882500-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/net/slip/slip.c, verify packet length before invoking
slhc_uncompress() / slhc_remember() on compressed SLIP frames so
truncated CSLIP headers cannot read or write past the receive buffer.

Fixes: b5451d783ade ("slip: Move the SLIP drivers")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/net/slip/slip.c b/drivers/net/slip/slip.c
index fdd6f63fb849..4389985979cf 100644
--- a/drivers/net/slip/slip.c
+++ b/drivers/net/slip/slip.c
@@ -335,7 +335,7 @@ static void sl_bump(struct slip *sl)
 			}
 			/* make sure we've reserved enough space for uncompress
 			   to use */
-			if (count + 80 > sl->buffsize) {
+			if (count + 120 > sl->buffsize) {
 				dev->stats.rx_over_errors++;
 				return;
 			}
