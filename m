Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211161;
	b=AycMRo1qwdjej11FxCevBIYqywmZduTwsWNCY+5iFBlGc+igHW05qhwTEoTEpMwppRbE
	 xKzoYM/JHlLf2+v4SjNuWVd7Jo7kOcBYRjmwitN5HXaqANXGNnUKXdB04L+GWXDW3Zat1
	 kZk8T9lehbqO8lht12RGTqSium4I1CV6ZartvuYqzutdXUe6291kvinsl6QzDGa1oIY1N
	 SpP4meRgLYIQvEG/QLDHQ6A0JYORZjwv6eS1JyMTVqcXeiO34doO7abOBaOoQ+iXByiE4
	 ysiqu32susDFvXsjgcPI2cYXxxJSSyaNTRDEduOkhm8fzxmvHUn54ZgBb+qgFk/oJNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=halThLpFR9MA/xSJWhg2nbRX5BJT0ocg9O7I/oZTep8=;
	b=IrmtBLnu/z3Z0g9AlKJHX0/WDpPw8UIlSCM29p2dT2dD4mqdXUfD366z2gNZP5oCMC7m
	 sWJA387mW4ArjTDt6JZwEYLzG76kV1YXV8j5kUHlXG6IDyuiJdEyLVl3ALT0+d2IUIAuG
	 vIzg8KUsVcMHBKIj7ZOG8nzBALX+7xpnxYQppjU49X2j+M5ka65NTw6qyTt0O9Yb+2xMr
	 GR8rq80OxJ32NXj4Ysk4grI1+loJbjCUd/N3p6Z6RXDl2NLJAeM0aQr3i79bGIJjc9qov
	 ldl5L6hLEks9gFa3cEwpr6VsRDn+7uOxlGSDJMXTDqBOlHEZedQI/2Tfcszxv+X8gqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjZzAV+O;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60BE60A3808
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60BE60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjZzAV+O
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1810146eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211159; x=1793815959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=halThLpFR9MA/xSJWhg2nbRX5BJT0ocg9O7I/oZTep8=;
        b=cjZzAV+O0Vwxp04eP7Q+6VVIoWd328QqSN8vm0N+SXrH7QFIDfkdAwNHn06soKWe86
         f/KBcsaIL0wobkehF1Sg31pBXx3YL75y5MN8BcIL3xeJCp4IMV0ruirfbGVtHtfN4Jdo
         THDFokqyCIpZZQDTpeQBVtEs5H9Ifgfh5+cNdW2O65MV0AVHxKFDaPFBrmttLEnE4Wvx
         TU5y3MCosHXqGr81EhroYVxVW7MQNqZTvgB9Pzd17FThOpm1MHRjRTMA2ZCniESTabkP
         FjhRhEbPgpZ4STMCPG8gxT8SvqlPeVMM4o5zm9SXR19t97+PswsyCrTBUmV6rSIAh/ZK
         1N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211159; x=1793815959;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=halThLpFR9MA/xSJWhg2nbRX5BJT0ocg9O7I/oZTep8=;
        b=iegEPIcHQhBTacxlfXB79QuIq5PDgHfbdgLDjLLoRmPYsp7LXxuBs39nCZBexhHAHy
         rTcrhYd84MoBSIGwSg4PRNDMGaOxTrpl4nVhggbeWtVIwNmaWWcV6WVOig1eGuOtKRrF
         iUUUJeit21xXP9iuqXS02CajIggioS/a1/6rFiYrGeVsMXv/dqOGnhPxz40sjtZMbr8Y
         dAiOvvaG6WKMIzSzbnzOPI9q8OxOcF2BWBt8AoT85gim3lBnw3zURrT8vv8SrY5EAtbk
         2AFOaOsfLzdzBRN6yhOeQtswgu302ElWbwttsF0t2+Ro62l71XL9X5zlGKS5yar7m0Zc
         0zZQ==
X-Forwarded-Encrypted: i=1; AKwUvByj/fhM3zz1ua1nNdop62GZIdRx40FZgVZFdxtSFqBQ1Ppz51qqGa6KWeJBhggJ7ZU8DyVxHo/9uyMZzbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWZVBCsr3Qbrq6pYWDg8UFXiDFl3Emt6S50KLeHJ7GHk18Szt3
	x5sLHekxAG6V2Wf2SHjziT/a88me0a8o+nf0plhmKjnPt4M7HNdjMu2T
X-Gm-Gg: AYBFou2kABAaZo0mdFLkkgdyiGz9JbDQuq60suJ+FhAqfXn+jSQ2eOfNpqoo/AhBTgr
	UbjwK554l+6E5AWlIt0yKPqQWL/5pN6/UjRKO4X4I60YwP7VD5tazdHK7p1f2gbMR1fsVwzBMv4
	yLMbH4OIxkO481rwBSeIkItLS7YejgbbwQpw6/Y9x/j3cKSjfeLx/LD4gxDQTBWMgVYfJaDi06O
	3V+qaHrXBUKIfr0Pjzw8x3LBPvta0ZubhyhfOOVsWB9IQTrwqDFrZ2Ua0ptoQAgRqdvTZD0KbEk
	8+wv7jXHAPwejO0+BGHyHr7COcJapiJdYZzTXC51vBb6E37Q1A1/0erqDMDroYzIPUsJcHE0PSU
	zjopg7b7IyD343fdDUPBnY49Ln28FMwPkjyc0tUzBQgkXimbxrMRA9+w1Zp63WTf/GElI8FHj96
	4an2FKS2zRioK5EC++82+6bYCmgWwhanRx27VYPqCxPp1Of5mxuaBMO7LSb60crBvg0y2QmB4Gc
	i6dkXxTt/wcQaabtsRPw5d6QrmkpUWlX5askqctW4lZDuJ8l4hfSdPszhyEaF+m0silRUbQULZ+
	HrOxA9gFBZ1FIa5wQwmdzMw=
X-Received: by 2002:a05:7300:d706:b0:35c:6ffd:e91b with SMTP id 5a478bee46e88-36a2013bd0dmr5935780eec.40.1793211158462;
        Wed, 28 Oct 2026 11:12:38 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm8309394eec.5.2026.10.28.11.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:12:38 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	netfs@lists.linux.dev
Cc: Shyam Prasad N <sprasad@microsoft.com>,
	Steve French <stfrench@microsoft.com>,
	linux-fsdevel@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH netfs v1 1/2] netfs: preserve prepare_write errno on reissue
Date: Wed, 28 Oct 2026 15:12:28 -0300
Message-ID: <20261028181229.1408342-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028181229.1408342-1-ivanrwcm25@gmail.com>
References: <20261028181229.1408342-1-ivanrwcm25@gmail.com>
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

