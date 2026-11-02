Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632030;
	b=YOL/2ztZ9n8/00AXV1DYeKs4JtaquFFmxoA4i8sDXLLH/uBkqqdC1by0MWuIeGehPCrV
	 tm5mpM/kGVDG9EtcQqXPMRW98j/V9SwIvQy1KPhCayFJolhuztkJyMjBE9dZRuKBoyeB/
	 8hRdoNEJjWy2a+P0TdFmUQ4efaReZt0a8CmUJOBLIRa3/DYquHFd/o84Z5ndXSNKskNmD
	 pJWiDkrrPj5DaX1tCi+MC7ZmQsNEZ7OtXeb32RQ3nKTJkIpyQhXOGdMYeZL43BCKnA5Pi
	 UjRNiUdx95Knx/JxZoklMcUz9wkbwLd2G6mgjw0HzB1WaC3RkYf3X+Q32DslhPRQsdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=halThLpFR9MA/xSJWhg2nbRX5BJT0ocg9O7I/oZTep8=;
	b=zPmuVWJsBsdu3llgtxCwbchNkJNGFAPwkwmJPIT3eiu69t/2Q8c3WkK5lvb4tq9sINUR
	 BIzt61WEN0ZJJJNrnkKoxrd2UZ/t+BeIUQyMCBCoo4zlXIaqadfSGFqEst5BpHROPckmF
	 VmSHRi/AqyAM5WhuMS3RwKV2XUkvPHDp9NUg4pJqfFkfgxBA/HVGqE4X/lQ6adoxBlhJY
	 ElRcqqbopSqiVdFbK9T503shDSgJM0f/t4fc3STYIEjq4Prhna6d5MB9ev9TC+CQMjZok
	 wkTGXPdZY6NomERSj2hJMojDozllmjtNRlRjB0jCAmyr4dAmvGrR2ZPyAtwAt99Ya+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLxbPHVa;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0F26072C5D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0F26072C5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLxbPHVa
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so19991165e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632028; x=1794236828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=halThLpFR9MA/xSJWhg2nbRX5BJT0ocg9O7I/oZTep8=;
        b=YLxbPHVa5cOZpsGQyxC0GLuZjjMWkOCxx6h3WvnFgwj4gBVyLxZy5IA1n5ICpcucBl
         rN3i7ER33XzYmzC5v8SeQrvP/BvKSTSvXM8PeCfNmX3RzziIOZcQF+3k4NbX2I++BUya
         eaG5FlrldV01wdEfdtXMOHzfmhZ13T3wIpCT9+aEAQOxMdgKpt9pJ4d8VesuG/UH6tSt
         5bjjSAQBvcMK70FM8wXFv59tARo8qmj2tjTBP/9fgN/G68c+ONeOoOVEHHAxKIKLe6NH
         GNFEvjMWXcmjWU58twTKOtoqK1X66eBUJweHSNBmYXxPMdJN1IYviiAhkMOb4K0hvasb
         PPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632028; x=1794236828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=halThLpFR9MA/xSJWhg2nbRX5BJT0ocg9O7I/oZTep8=;
        b=BGeXlqB+6tPNFz7GgGVdLkli1NEIoUYOa6svK+Tc2IrCIM0GVSyvq91ao3H1hdBN6v
         EIi058Zo2OI6PGVn7Ij1gHc3itFrhwJfrbvKcfb6gvzizhhvszHRRyP4FXiGbK45V7DE
         qCvAzbgYjU6Y1hnIycsTd8tL2vJs4D1PcQeUIWkyvxz1UcNC+gPywk0ESzFsjbrIMdBI
         HBdqbDV2h0SaLTB/JNyxgdnK1z0CZZrpL74J0FMlf/dZaFi3p2GCyQwBw09nX7UoILay
         kQZmcBX5ejMr+MhG3ydgf0pMKEN750ilyNVUwwX9wGjuHBROV/F3JFylvXZAKyuh8EjD
         sCPg==
X-Forwarded-Encrypted: i=1; AKwUvBxhMCKFH+rLiMITeor5UCxwLHI2yZWu3ADBfFqG8mhk9c2jL6okNlA2JVUiYj1SfouIxqvHx8yveOaQLRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO5Y1gNiUnzwkepuezWryy47sU/C5f1P6Uz1/tGxSkTDwIkPmH
	Y5niOMI5QbeXKrqFZoKTenMxFcZqvieqFZIFDNhnuPHBgqappX4veBLA
X-Gm-Gg: AYBFou0nKEqdqUxsluZeOP63fRk2d2X7L34Xi33pwcSFQpPwZsP+7vOJURn3r6Qphtz
	C7jaM8kP52z4yy1aQcN1RwSp4Du0drvOwrEzOT6Ljlwl3BTW+TadgCN/kSYkUvM0VVgO5qn482I
	RNiMrBlNyZ2kX14ax+kCIwZmijU5h1KeQzMYBDuI9peRgy/Hi57RIYlK4cEX+QTnp+bscOuS8zs
	JXmIWc8ijUUW6LU4vU2LgEaNEuqBdhkvm02Tc6qerTUAIMy9DGZ1RpxTxTY+XMSWyu2D4SMR4Qq
	v325DEwjoIiZuYBiWnblBlg8ya3kfCWxTbTW+HPtqc3orh9dPueeCDv27IcCyORx1ixIwVRpW9e
	0ZCZOQNyOvCGBzwaBFFqd/il3H2jONWpRKj/I/n6sEXnAO0nvrj25Rb/TVvGnhiSA8iY6hdVMbQ
	Hc47AgfYW611LxFHX/2BogimoH76qx0SrJXzXJY7mC15719X+J7dNY0cUiNo0Y+S1clOEPa/JJ+
	AZ28LHspkwfUp1yhFre9EPAiWo7z1HyDNhy+K8CMpLfsHrqls6TLgm5fogN+3Qs2FYxM3mwO5WI
	invRjwR1KvWp8vwHxmTQ70WnON0lg1sUwU0aThEOZ3cA
X-Received: by 2002:a05:600c:8b55:b0:4a2:1655:87e2 with SMTP id 5b1f17b1804b1-4ac17b2b023mr254051745e9.19.1793632028227;
        Mon, 02 Nov 2026 07:07:08 -0800 (PST)
Received: from localhost.localdomain ([2800:810:84a:dc6d:d32b:1515:b2a9:c74e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm395629535e9.11.2026.11.02.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:07:07 -0800 (PST)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	netfs@lists.linux.dev
Cc: Shyam Prasad N <sprasad@microsoft.com>,
	Steve French <stfrench@microsoft.com>,
	linux-fsdevel@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH netfs v2 1/2] netfs: preserve prepare_write errno on reissue
Date: Mon,  2 Nov 2026 12:06:54 -0300
Message-ID: <20261102150656.207612-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102150656.207612-1-ivanrwcm25@gmail.com>
References: <20261028181229.1408342-1-ivanrwcm25@gmail.com>
 <20261102150656.207612-1-ivanrwcm25@gmail.com>
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

prepare_write() may call netfs_prepare_write_failed() (FAILED + errno)
before write_retry calls netfs_reissue_write().  Clearing subreq->error
to 0 for a clean I/O reissue (82e8885bd763) then makes
netfs_do_issue_write() terminate with 0.  The collector copies
front->error into stream->error and mapping_set_error(), which ignores
0, so writeback failure is silent.

Skip clearing error when NETFS_SREQ_FAILED is already set;
do_issue_write() already terminates FAILED subrequests.

Fixes: 82e8885bd763 ("netfs: when subreq is marked for retry, do not check if it faced an error")
Cc: Shyam Prasad N <sprasad@microsoft.com>
Cc: Steve French <stfrench@microsoft.com>
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 fs/netfs/write_issue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index b8237e1314d8..f23364116421 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -268,7 +268,9 @@ void netfs_reissue_write(struct netfs_io_stream *stream,
 	iov_iter_truncate(&subreq->io_iter, size);
 
 	subreq->retry_count++;
-	subreq->error = 0;
+	/* Keep prepare_write() errno; do_issue_write() terminates FAILED. */
+	if (!test_bit(NETFS_SREQ_FAILED, &subreq->flags))
+		subreq->error = 0;
 	__clear_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
 	__set_bit(NETFS_SREQ_IN_PROGRESS, &subreq->flags);
 	netfs_stat(&netfs_n_wh_retry_write_subreq);
-- 
2.43.0

