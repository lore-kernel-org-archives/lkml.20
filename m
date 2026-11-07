Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070646;
	b=CxOrpJd0KQdeeHszTelw0epcPU8lqaObJXruCpb1w8k62tkeZL/4Yae/5j1dvg6xE5LR
	 5rEp7Oq4y6y+7Y4BVLdg90pNMhXQRNSg6hYERZsv++0sBN1AXKoStQblYIAeihlUwZUSu
	 hiJwkB14jet+caHvrLpKkucTE/a5SNKRD2QM8EOFctQNXtlCtnKqgI6Svggkvgs3yrXV/
	 wQ7pgQ7Y2WgQi8pjPA/VwSzdK0JIMNH2RlBnY1F0idi68J4B8vvwjpnIkWt8T4ULys2jj
	 xBhWxQsb4/65wMuGhxxGpAI7NKaOGW7DbZjkUh0cboNsip73tC9dtQMsXSi91yoxB0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
	b=cdmWRKoEl6jdoMsGTia1RNRjdaBIaNNRa5d9XLs4jaM9Flq990bUser8UTb5NSTCe3Ah
	 sE23rxQQqbWHK3U1lw2sZC5+Ter9dh+15Lmt5IGEebjvTQ/wcwNjsqNxGVOOhkLc79Bjp
	 nYbouC3ttW1quAKSPqDoITqvaPjKYi+FONn33BekQr6wEnm/CfAdZiLy2UmNv4v6rsRwm
	 3T9Y2LtLlASNC1aYR77JJR6naqUrT5GpcMBTzJbk1BEBxUhDfBpCxxbI5th3v4SDQ9xkV
	 hvGDhDrm6siWYTiOsvYMvoQk8Y2N0McCs3LziJG8TR4OkMAXL+NH6E2AK0tC4F1wzAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf9aMnGZ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE1606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AE1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf9aMnGZ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so728282c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070646; x=1794675446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
        b=Vf9aMnGZ/fWhaWd+BfyuaAn71YYiA2n74dfBULzE/aGwLjp8yB6/k7O4/jnA/yZPm2
         gV3otOYoSUp02Fm5NHftU919RIR68nN/zT1gaUjUH1/Nz/rQyqdk43ke4eBPM399RFAp
         fxZwlZGyJCe1lWVaGiAAB+Qzoe5/vZDzHxzU/mZ+oU5yDPm/Cye6Q6Yfp/F4qvGUgl5V
         DXZ3agQp2n98TfzXXMw7pY+5kuv3SbZksdQ45/iD5ka6LHUqgulggOAfqRZprjq0FShf
         xcaw1iPnYzE6C8frfdC6R2WsAL96+LJduExq0bGHMQlIheOqfHgVYg20vabyOWJgv2Yy
         YGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070646; x=1794675446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
        b=BIe603Cv0Bwjc7wXvfs0lrww7d+GLNgPp4DNMF4JYexbc8VvLoyco83rQQwc4fx1iP
         i6FBIi+/Rj9JaLg0VqVISddh3qEx8ieoMz3EaGIyY/Aw7r+b4CXiGR4d3mPvF5PIzriw
         38y5AZxEbPsLn01JFNdPWLlaaXrUC31L4Ng1QyNoeJpNwRz+2mB2xVDmxqKY8wYlq0NF
         Dkh7eQX2oAbKhFXxuPjXacCLK4sJ3Vucow7jfu4gRfmCcto95tehIXkYYz0n3aJh4+6N
         rn0aWqoe0D3TRC9B6MJn2vxKj98fdTiobEynFEWIoDC5LkQrSXWfi0BNbNJAzW4Gl97h
         f3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBznlMPrxCb5mCWIZZJiuJA9tIynDY341lB+7QdxISGhAdNoRCpltYpxpxQwlUmESX/19zFDJSgBn8UIcSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bzy1LgZkBnfzwYX/xFZ7NqT3NM1mt4V5xqrm2Lbk5BioaRr3B
	Ybvt2SyMVz/bq7KWZyqbRKP+oZ7kcFgMAeQzqOT6AhY0BOtoWfe4MWI6
X-Gm-Gg: AYBFou3cdclvqfFwHNeHTkI7cp5Y/Y0Jp2gqTjCFiF2QZomThhqAloWcNfFP/2SwtcG
	mC2suOPU9mv/9VIrpZ239xhUv/gqvhkq0PbbtCcqg329dEffP4fUOFHM3wul2856uK0vvq+F19q
	hlAd9ZZbwSIsF0uiDddBRVSsU3yfYM8vx1O3yYNxqAUxqBM2qrZzpfZF3OtHq1OdbSa5MRZ5GtU
	rpZLii4oYlRsiKV3jU7TKhT00PrM4KDWX5TwPQOe8jr2iLnHbTZAx3gwL58CD9rosnFuxr0s7V7
	J+UKBI6wP6kfyTE6NfY9akSE0bErLFLZYMmHOtV1Ovb7j9UXc2ivPP+CoMRAoHOVlsslU6Uftel
	hnzwihNYc/j7wtv07dDEJ+IBWu82fDUCwf9UoHu1ZoAC3NEW1JSN4Z9DToOY9Q31Fiuc3uJ74xF
	dpokwZ3fquqtHQKJtsnjdSOYSNoHHLH3d+tkvruzQJ0gPvYiI9y59LFItENA4t8Ttc5zjoR277h
	5alK7pOyWcmaFD+OcOLRpW/93m0PCaX7k/Bx13V82ukBcclXvHEiFfvgWYhrR2VL9+1P3cajg9G
	8oVsP0BsWwsoUfb/7HxzkX2q
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr6932727c88.10.1794070645481;
        Sat, 07 Nov 2026 08:57:25 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:25 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:02 -0500
Subject: [PATCH v3 3/4] selftests/mm: move waiting for KSM full scans into
 a helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-3-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_start() enables ksmd and then polls full_scans until two more full
scans have completed, so that any merging that can happen has happened.

There is no helper to wait for a number of full scans while ksmd is
already running, so a test that needs one has to copy that loop.

Move the loop into ksm_wait_full_scans() and make ksm_start() call it
after enabling ksmd. The count is now read after ksmd starts rather than
before, which can only make ksm_start() wait longer.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 515031b8283da..1c2bac54696dd 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -984,33 +984,38 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -errno;
 }
 
+int ksm_wait_full_scans(long nr)
+{
+	long start_scans, end_scans;
+
+	start_scans = ksm_get_full_scans();
+	if (start_scans < 0)
+		return start_scans;
+	do {
+		end_scans = ksm_get_full_scans();
+		if (end_scans < 0)
+			return end_scans;
+	} while (end_scans < start_scans + nr);
+
+	return 0;
+}
+
 int ksm_start(void)
 {
 	int ksm_fd;
 	ssize_t ret;
-	long start_scans, end_scans;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
 		return -errno;
 
-	/* Wait for two full scans such that any possible merging happened. */
-	start_scans = ksm_get_full_scans();
-	if (start_scans < 0) {
-		close(ksm_fd);
-		return start_scans;
-	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
 	if (ret != 1)
 		return -errno;
-	do {
-		end_scans = ksm_get_full_scans();
-		if (end_scans < 0)
-			return end_scans;
-	} while (end_scans < start_scans + 2);
 
-	return 0;
+	/* Wait for two full scans such that any possible merging happened. */
+	return ksm_wait_full_scans(2);
 }
 
 int ksm_stop(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d4327..7e00030077d2f 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -162,6 +162,7 @@ void *sys_mremap(void *old_address, unsigned long old_size,
 long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
+int ksm_wait_full_scans(long nr);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0

