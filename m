Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418953;
	b=WrjSl5V5apX6GKPoVo6Y7QPtIVCmWfhEae1LWRuPJct+lNt4SmNS+x4D96fpLWxFrV8+
	 e5Gt5MmT5zqsGDARugAlKsSm8qVGveB+9pr2EsyV8k630tSaLwIa4Ms1F2ciG2tcDrIsH
	 wmBF6L8HzmLi5/zjDEU7U29kBOF3k4VDvHFMnuOUytXa0fKy9afabbxOUzD+Cg2lmbWrm
	 ZxQfaiO9l/xqGGfWfe2rtiGWo8pT2kz1fEwZTDXHtciJPlol0dqpUXKb61WfYeYyOCgnc
	 X5IWfLFd36ow65amYasPUB2lRwQcT6rfSH/OB5oUZNfobO/NfVvdAIZV6rO3vOAY5tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZtiosLYJbRApO8KRSkyBJePzfep1nH8y43FCo0J139k=;
	b=pVQHutbPn5WQhMYWLDfxWJxViQtmlQi/l7ZDB0tBuEJ8DCLufmFlXgRs1mwAvI3bVmlg
	 qhWvFaVSTNHOSWeQi/HsgDHc0akxMipca5+Jbdri5glhcM54T4AKggWzd2DX48zMiN4mh
	 FZSS7lLgmQu5JWPe3V/Pu4/On4wQHyLqa3Sh5GSnq5E4iRQl9+afE/TWHrGbPEPdFVPAH
	 MZ79GJiVzswhCjoNRrwI/t47WO/DN+fVc/LXdcGS1qVfy2Pw3OzO7wqcXv/XzsdkKCOPV
	 YCLI07/4A5xevje298CGhEIDHba1Q9YW0/Xe/E34p/IGB2I6xRk5S+U9zGXrYnwKECg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kKpCpqG3;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EDF60A2610
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EDF60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kKpCpqG3
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso69805eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418952; x=1795023752; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtiosLYJbRApO8KRSkyBJePzfep1nH8y43FCo0J139k=;
        b=kKpCpqG3rmAorQfEdCe9wtKvgY76SGpYSKqHZJsR/A2SOUE6WNZmAlKaJeJZUJmqJv
         8WsoTd9vWp4gSZAL76p+wmC0ZR9OhhUb1tMPY5i+vYxZ8z5BoDjPM6wN4IAb0zaV0vez
         EmCKgtwol7CiG2jsBVo/Tk3k+zRqBWNwBtqCmfhbX0RLw2+0SKOGfLGMWfa/kzjaHOWc
         OdIAYW0W7+gW68x7Ha8LHsB885RDqoYAcPyooDHcwY+JVmWaXtv8HXr1JHcrSHb1Z/CV
         7Fz3a8Lqa1UtajdchUeax3kYqRIt6vqXOlw1LSj/rgZWgBeFaxQRey1UOoT25FLyNcdX
         SbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418952; x=1795023752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtiosLYJbRApO8KRSkyBJePzfep1nH8y43FCo0J139k=;
        b=MSZigdh6yhKvBsjR7+dF56VVf2zKrQIrfvFFSEdnrBYgV2dCvJIzNon7S5NV/uBXHk
         VOO92yZfrWLb2rFFaQANBCHQv0oY63fPs77+/v7akMFTKgM6GBONImrCPOBwFKZPnI7g
         yni+SesIexGD4TxLWrsLxx3GLLanxw1M38UKd/t6foHjMdLyPbKKQ+PJPVtIBa7Czhqe
         yfNMxpy3bkPFROuROB23VZKZLR/p+RffSaY5BkcxqP5aIlEs6VkBvgblVpT5IqlJNELR
         CkDZsA1F0RZ6jRfgryUTt3YoMHeg2cPTni9kadovMEu3QrEcLvToG4s1lyi0+sYZNz0l
         rz8Q==
X-Forwarded-Encrypted: i=1; AL+hErEfMECKrahAGWnFI6ZeudHmwRFIZxyEuA/R9wDUoud8OLFiZj1cSEGGxYOLej0esX7CTjOA1fJTOMVczZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HJUaPSof/J5Rn7+O5wWbEXIIXQR+rWMDXiGQ3A2H8yat6a56t
	i8i0AY9NdrKL/KmhN6O5SVQSRpTp4eASWGuOVjHS/PnVxtq+FhraNezdRCBJDmxh3JbIo78v3Fg
	6COI90PUeYA==
X-Received: from dlbsn12.prod.google.com ([2002:a05:7022:b90c:b0:1b2:3bcd:9068])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0e:b0:1ab:90a8:87a2
 with SMTP id a92af1059eb24-1b4f5f34a37mr121144c88.11.1794418951516; Wed, 11
 Nov 2026 09:42:31 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:58 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-7-irogers@google.com>
Subject: [PATCH v12 06/20] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.542.g3ef89b7020-goog

