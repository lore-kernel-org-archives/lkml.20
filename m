Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561538;
	b=H3EHQ8j8Rl+K+2FQuGW8wV/verR+VQflMqyTKZqG9hf1LYZlQefsqekv4oBhaouQ9PTU
	 6EF9e7PQcKjye9JaG5sK9N43XKflkLREEMM+3qmg/WOAuQz8httg9i0QfLhtdFhUyGd7w
	 K3Nq/0h2lNTqlDwyuI2f7Z77/QBERdPelT0ba00QEItXG05GP7R+xqknQRg/Ns7Tblgxh
	 Ht0SZ8Am14nixEY7ZL1LFpfEUUfu2xn7aY3gMDCg7aTOQgxTmgqv+04dapfRQAz1qTMJ9
	 pl5n+p6z92guzH+Yf879mJO0EnDsMHPjiN5KGNHa9o1qfLhR5ii9L8PaoXDt9APJzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=szFe5emWnAit7KZ7yNX1R5l07ApZz83BJEZZ2s4QdVo=;
	b=Thk46Eu9iSc7u2LOvPJtbcNLwtG4MdLH0+XbgC4SMZI9POEhHwu4eFCnxSSTWXkgn5YD
	 EtAO3TWeI/HcVST2I3TmCksY3Rv1qpk6SoWTtX/4gqZSUwXXt4IHsGwo/uPBlf/2IWbUY
	 3Ep6EWDVoxFLwD8B6d5cIsbvbkmQJvvhuYqBrjW2ul1T/mFrLF9FoZexvOuhBsuSmi16c
	 LnaF4CYFBeGIhCrJadNfHDfCsNtUpd8D+7Bdok5AHdrk4BfzVBOwkKwGMXmv1IWwC+2Jb
	 8M95N80DUmSTTjIUeBJdNDNop9BUi9R05j/V23DgRftN8qiDKt/V1+Gys0BjuSrI7Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHFJiDcR;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8C606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C8C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHFJiDcR
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so363643b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561538; x=1795166338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szFe5emWnAit7KZ7yNX1R5l07ApZz83BJEZZ2s4QdVo=;
        b=PHFJiDcRNQSqQKKC7TVZ+1/OL2PkZoxHM+3kWCawrmCha1IkcbMM7fLPDYD35ioJzr
         yWXTDRuMEQRyNS79bpzglIfmNtHopcAK5svqbIJqu5fp9xf0H5EzPGhF2Dh+gpebJqSz
         MI1+fxVkBWwiigXa2buE9SFDY08LQIyQqSaXfs+t+1DYG4mTY762yFLoZ92qi0DjvHD4
         CPZG3ySOYvA0QicVVLjhumjp0rtIUR1IpsbCXIMX0rGMsvgMnBKXDXcyGgwxnm2ahGKC
         qDVxf0vku9+aATAWwwV+P7hgQ9KTUx0wzwg4HXSiEmyO+OAV7+JL1VlBQ7f1el3rxeql
         XnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561538; x=1795166338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szFe5emWnAit7KZ7yNX1R5l07ApZz83BJEZZ2s4QdVo=;
        b=yrcz+5kFgtXpv6T5pvvAOwEaBhYT/TpsXB3M8h1MVlrPc83VgQbRdq5BvsMk39VsCW
         oliv9FP5gpPimLrWyt25uU+oUHWNmGTYg9bVWgGf9bxOhKHWmw7Yy/58qYCgvDaA/uyj
         t4VIr16eLlUWIgSA0kXw7NGB2sJatahr90aKcrycxsR89F6gN0zrTAlYueSkSSgDx5/6
         sNly0FdnADc0ZbsE4w2H3E7NTKG9gMkW/KlXJ3DI5QotF738G39I7E85IdMNO/OcBlHD
         QUFIqoUzcBbkNDPhpbUDi2q2sIeXq0LkwttOfJ06g1sX4oYrMcNICmGPymmtQ60L2EOx
         UWlw==
X-Forwarded-Encrypted: i=1; AL+hErFG/D8c5zp6xiHWawW93/3uINWJPH+p+2khEX4haogc0ofpjeqAirCYAg9jo9xXWfuz8NvZfFbw+yL87uU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8phwB2nbnbXQ+SqrVLlcG+oiyMbBH7tHVeoIzo3BmK8wmPIB8m
	aRxJgZzBfsVfFdY1l+WU6Z/k2esbPRRZ7aAeCHPvj9AWknVstTEBJ+TB
X-Gm-Gg: AYBFou00ckHeXSXL9ONqpb6qjpWACKfbrpmPFT2HbfF107CWcaP1uJ2bXeCxp1dJDY6
	FtbygGz1lw9/wKsrsKcGjFq6L1kpta1inzot8+m3ONbvEwwk8atESx0JKVbn6hWhhPqOni6N9uu
	b5JsWIRa9KIaXC5x5QyGXVZDbocz97yfWimy886PZySqOP+UMBlBqdPkhF0BudS0WeYE9+iWldP
	0AyS/f8UCUpLjqSxP0va0ayMkYSIywLBL8iKlJvHDZ2nJWLub7nRZh1H0Oa5J9ZO15Nu2eYM9xV
	oLxKY/b44a12l8JjhzgVALoLuXUXAYsfgtDqVINDqkLPbEmKWvx05JIGGp/j9m2D1k4Ea271LJh
	NFQbJtAX9wFH+metawkToOGzfLj9nVxjikulAgdvKthayvp4nT/Iv6KpxEVnK8Zgxd7KFFBq6Lp
	JFaxo0IIYBXTbI44xTwcafYFaEv/1IR0oQPTNZDk/u/YHjnjDhmpXPoJTRvCvcc6aPoYkxAup1s
	bjjws3FLz/PMGVNEKVwmeRDmAQ2obSJxxplNV0iQnR63mou42L9HxGMV1yb7LNr6U2P4McVwwY5
	G8Wsj2lJ1EQw7osDC2lwbAv5kGbgTyjnTT+V6oQ6d+i3UT/I
X-Received: by 2002:a05:6a00:bc04:b0:886:46c:8a1f with SMTP id d2e1a72fcca58-8beb6c6bac5mr2268997b3a.35.1794561537969;
        Fri, 13 Nov 2026 01:18:57 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a7edbsm810541b3a.18.2026.11.13.01.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:18:57 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH] staging: octeon: fix asymmetric output buffer pool accounting
Date: Fri, 13 Nov 2026 09:18:47 +0000
Message-ID: <20261113091847.117705-1-singhpriyanshu9838@gmail.com>
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

In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
(err_tx:) and in cvm_oct_remove(),cvm_oct_mem_empty_fpa() is called with
128 instead of 1024 as the expected buffer count.

This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
false warning ("Freeing of pool 2 had too many buffers (-896)") upon
draining the pool.

Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
constant across cvm_oct_configure_common_hw(),
cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
and deallocation.

Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
 drivers/staging/octeon/ethernet-defines.h | 2 ++
 drivers/staging/octeon/ethernet.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-defines.h b/drivers/staging/octeon/ethernet-defines.h
index c060374a3da2..3ce7c125ccfd 100644
--- a/drivers/staging/octeon/ethernet-defines.h
+++ b/drivers/staging/octeon/ethernet-defines.h
@@ -37,4 +37,6 @@
 
 #define TOTAL_NUMBER_OF_PORTS		(CVMX_PIP_NUM_INPUT_PORTS + 1)
 
+#define CVM_OCT_NUM_OUTPUT_BUFFERS	1024
+
 #endif /* __ETHERNET_DEFINES_H__ */
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index dea5696a6642..e0e6d40602f0 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -162,7 +162,8 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
+				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				     CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 #ifdef __LITTLE_ENDIAN
 	{
@@ -974,7 +975,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 	return ret;
 }
@@ -1009,7 +1011,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 }
 
 static const struct of_device_id cvm_oct_match[] = {
-- 
2.53.0

