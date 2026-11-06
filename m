Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983788;
	b=hKlNn0l6GBaoCssjVVE4c63R20cP71CzVFMl4emeseAz6MkqYu8Xpsf1ZAO6GbvskxZD
	 r4J8RebjeVL+VpimMk5VGqNLT8v14r75NZra/LUUPAhBdV2vhB/sUxDsYamO/Xx11Fgnh
	 ExQCq5b1Pj5NuBnEnqA3OnbJiFWq7z1PCyscgEWWSZQ5eqdIvm3UDeVw9HIfuqYjDvPAw
	 kon70srDtBH7+yqlwnNAHFSMrQFVgfmBTdDljdValI50m4ho4OdaqCqdbXIqVeZLxDOaX
	 AaXBxrD1YrUefK+XDDKvKxFOkrrBos7IiBLhcu+tqqSYQYnF1yaFcdAkiOReNKUPclQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XqDNg4W7673UpH/nlCNn5xwA3tbLFD35COXqGvji1qM=;
	b=AHt62TjAvHAojoZz+8HB414xVWwsvR0QUT7pQXwkyAt1ryO4KiH4Xim4LGOpVKIObbSr
	 xX0OQ6YoflUTweLF+ZQEqH0/lAADaB+I7tzeBuFT/9whsHlrp+GNBVdKusO0hR8tufuf/
	 lXmrU73BlUl5Si5KW4iHyi1NGwlAlV7SznH3x40EHJYNL5BViCudLz/3GDAKVnjqAhRjC
	 DF8IM/vn1WQds1yaGBG6/E6Fqm/pq8NFF2ZuCZiCF8iq/D3d+30uXvpb8tcrhe+RE+VQ8
	 ZZITfksj2+qxpw2EIKzV2ft8z0AXDtQSzjArMQ78g0kv/dRCBPGbXsOfkfU6iQkyaNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=Z7TODvfW;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F222A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=Z7TODvfW
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso354084a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793983785; x=1794588585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqDNg4W7673UpH/nlCNn5xwA3tbLFD35COXqGvji1qM=;
        b=Z7TODvfWLWlnUBtrtersYwQUYVhj4fzJY9Lc8GcTOeZhyHaj0S5aWlEYl50CsTmACb
         /r1AeD4v2ND4j5tOdAfUCPmzu8ccWt4YtViOXR9FzMWWZi2wSIzrG6s94uVSYdUJRRbg
         W3kQ3dJH1ToL7EK2Xk+/lFTVhum59/haUf4Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983785; x=1794588585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqDNg4W7673UpH/nlCNn5xwA3tbLFD35COXqGvji1qM=;
        b=OgS1jpKZ2E58d1zmxWzsmKv3Tr8R0Qiezkf5Y30BlMf5/QmaKu73aMCwDb7p9PEHjg
         todK6TXewhQW/EPuXCu/m+s0gM/CwMKfQRD+6kOpqr3muo2bh7moiwECEo2rN5Zcm3Xo
         e1IGt2LDtUGqZKBNg95UvXl17M4LqJdpJBhWg8xoRWjo9IapROaANtnBjQLwEjVl4hRt
         6zPAssmZ1tPIAAM+iCIgNzgZvIgzhZ9Vh0byGN6VFiXB7jnOhyPTJSdByq1c6p/w8By7
         w4LlUpvHdtpeVgt4DIDd8UX5oiGZXNacPcxxlHB+B0PaQBXhwKc1SjlNZUUzr0xXO2hE
         zd6A==
X-Forwarded-Encrypted: i=1; AL+hErFFBltrAriZuCJKRueZPSLe64RGJWTVhtx3e90AAnAQ0hbbIIfQUjIrn+tZ3UZ82beS090NzvGiru5OQG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kVaTE4LS1zsrx950kWbwfc1L7cb9C70BeY+u9679vHaJRKqeP
	lr5pEZTuSBUjRhQ7w5ovHM4nnNSvxtMr/+ylwW/Th/T+BI2A2pCOnrOGOh4uOXD1Ag==
X-Gm-Gg: AYBFou3qDmaGhX/u4AJ4wexuhjiFOeyYskM9WgV9zX91Pl+57kRt2W6T7yZiO+oZceq
	P042tDnRVKxCY8uO/rT6WthP5i2UwJXi7u9TrZso9v0RS/MxNCEZmYhLro1hERLTLsn3uyo58OT
	zmHHgqsnig5iSF4eecW0ccS32ogs2HLLCkB3xkvxRPqGcRIgGBAbUymQhlikAWduba0WDF2e07Z
	zXn5Mioldo8U4BOqlsDk8JoLwwWUhz26s0gediOCs21Rofzk/X4NnXvQRTH4DGek4N6sQXn3xmD
	iwXEkkFIw/3bea45FLIbPzX93eu6mrmVNhO4JPtD7AsJAt0jEVuulY4wlaxFFWqEi9XE38I8K+v
	+dIOvUX4KY22KvScdJ+b+4O3ggmNeYk4xGFcpvAs1bXZOwSFVl7EFbp9zk2CTC7DUa+3IFDhS57
	bGUqchfE7BGSFWGfTPrE/4+8RvGfH4BlR8OiH0XPFKZJYktjyd5gsxNeH5l07UT5bzvx1rqYp4d
	kjPow0bVwmz+v62JtO883bJxvmPogvBTr3+X0FVPArSQyGe1vhrGOoZB3eX+fUC7GQyvIdFWycH
	7KgbyhwEp2q7N+MNJCWAl+1LyyVRBCfedCogxhepWgRj2LGhAyXZSw==
X-Received: by 2002:a17:90b:540f:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3b0db6d7586mr3040386a91.14.1793983785266;
        Fri, 06 Nov 2026 08:49:45 -0800 (PST)
Received: from fedora.bitnetwork.com ([115.245.53.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc4dc7a8sm264494a91.3.2026.11.06.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:49:44 -0800 (PST)
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Subject: [PATCH] staging: sm750fb: constify g_fbmode array
Date: Fri,  6 Nov 2026 22:19:35 +0530
Message-ID: <20261106164935.18502-1-btech10487.26@bitmesra.ac.in>
X-Mailer: git-send-email 2.56.0
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

The g_fbmode array contains string pointers that do not need to be
modified. Add the 'const' keyword to lock these pointers, making
the entire array read-only. This allows the compiler to safely move
it into the .rodata section.

Fixes checkpatch warning:
WARNING: static const char * array should probably be static const char * const

Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274330..47d2917cc1d6 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

