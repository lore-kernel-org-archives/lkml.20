Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539302;
	b=1cq0gwS9B6JylgyA7gAnYGOKW0NcfpGYe9Ozy5yov8xC6QpKCvKsuuvnk8aGFQl5g2ij
	 Bw0aAq2v2w+xw5OfQ35mmUwGKFEtOHCWoJChJmFgaYEL+eeM+Tc5yR6l2/py/ZwNlmfJ1
	 FTPz3Xl/oA/yStzJbd6bBH5jYA32Kotka/ZkeQnPnbxkWxV6UKYufZuTA1b/QBgWW7Uzb
	 w1Vvrx5NJJJ7vcMpmEk75g1lkUVKaWAcOH6VQ94LUEV3/9BG/ohpSom9Y3rG1CbLD+xLb
	 G9np136M7FvgTgeO/2z8ZtLdWA2eXfzrl7gRUEPZmYLnHeesUHNi5YbiyqTeJuv+UgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WwFBADymfX8ovpyKegb0e90Tt8M0vYJIxJ9ZTAJlmds=;
	b=olvZuxYsIG9O6GzqjNfEUPm0eoYKh8EMt8H70xhH8nmfOreSbe7eqBIV/R50bxU7QNKE
	 VhfXd6XxnUXBRJHkGntYg7FcUNEP4xaTYH80ZBKnwmOswyoAdxgb9Uhmn8XOH4vIa0ZLz
	 gSraXN+oqCmkUMuYrhkLqOmIFuQnA30ofdWvNlo9LpDmVhhgFRxKvQlAidTxAOZgOIRIr
	 SgYM17wU0jsfRDRI64KyBOQK/qc28Hkj/hztCnnKOT7Tv4TJXV72/2OyoHPhnlDSJNh8G
	 W72pWBYoNF1GS71WZ9RC2ymWrMcrS34avbx+npPGEeafDa96oGIbEd9QjLpPyB0JMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VLfrzNQE;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB08606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VLfrzNQE
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso72678eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539302; x=1793144102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwFBADymfX8ovpyKegb0e90Tt8M0vYJIxJ9ZTAJlmds=;
        b=VLfrzNQEaXvhHebgyJi9HQ3LJu9UIw5QOEdw3LZu6jSCyU9rj187TQ2fqy44X6vOxY
         AniH4aStjLh309KZbfY0S6pfUzKwxNDvfpH1/EhxGZcR6xFyXtUb5zr+NrcHmd5NYz5X
         z4taRpmbfi0U3a8Oqm8ICnaTX+npSxJwrlM9p2lDOj99MYllJYsZ4YqkHAJ+AkU/TL9i
         C3E4ZsRlCYMZgI8UygxKWyqGqlr5KIFX5F4FHexZvUyimDHEqNkliDc3pyxy09XRjZ6o
         aF0yqiXXb+eXGUmZ38zXjoRsB+nw1e/l5qo4GkqoLtsIAcMP1wFUeWFgWa17A4wsYv3l
         pKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539302; x=1793144102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwFBADymfX8ovpyKegb0e90Tt8M0vYJIxJ9ZTAJlmds=;
        b=2Sm6n3lpypNQ9Hrq+Z/JCQXZo2XIlYmUMqMFiFcSq5IyWfPmndDtfU9/ainBj4ahTk
         alifV1YSzDvVDuobgDd3rfa7eoLxaLJkwfRTDPr3kFGjgeAYY2G3mAErg08tuAAQ2a4C
         r3RCv1nx5EKIB+rHw5ubTJE2HhTj+AiQXAWTjCrJelz8V07EOk9kaF3QZJo1Cf2tar2R
         mkSdEn+NVAI1zzUyNXUesDGVUtHHVHwV0G6Wh/kMUsq0/bb5b6NfrY9wjjyt3i5KSUq8
         CqLghM2V4NJuigYnxI7c1+w61SVaVbpbkudk1nooVhTQConV3VdeHqf4ks1kQ4VRNjeG
         vDUQ==
X-Forwarded-Encrypted: i=1; AKwUvByDhkjLmVyfIFrwguNG/rO/il75QhalWya3iF7Ht/h5oNBTq5Kk4y/oQel2T9gUS284U+2ItmXqeQvfJ9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL415wJAsf8w+2sNWiaid9Nb3TAUGvazDVGmYXjCTF8qXljlJf9
	tyYXC9nmuT0rONhcnjE6ZNhoopSkFwsMYd+MGHdk8Et4qbujRWbGfqTF
X-Gm-Gg: AYBFou1AaKCCZQglwJgTKFa4kXsgd1QM0hI0Yq0NtIp0yu2PwaIEKbPMsSLSiCdCMMf
	aVDh1u5awGBLhhwDkRtFYP3FLiNV/4DauOMTrnUP+9e9qFbG91dwyxMAh7jkYkY/74+zAWSUjku
	mJKgSHEzfZGdxKDCvvOUzMNV/mHPpRB5QFyfxiaEsV+1usoasKGVFBVkvaxAdlXLHW2xNBQO+Tx
	oaOz0aDsXPVEoCw5fx7iKLH9B0uK2+gAcVN2JyXWEWwKzpdt7IHPlRaBh3jXlnEbxO85c0mhF69
	HtOHPmklY9fouWunaLRAMTrJw26n08GGEwB9xnxunVbthUwY4wZ8aHK2kSacV8XOPwCyXqUooUi
	gU4uYws1Wa1fHkhNRSSSqE5dk3FRd/Fu40wo18rih5xDIR0PmzDShCDs7nQOj63mlLGEkPvGaqx
	/7O6Q9VzFPrjFedhBMBu5r/QHbFDpHsdYznkraEsZCqGmvR0JFQajhUIkcIyWF18AWJ3a+o6pO2
	WlbBMinPU94RnF1SKqNnwytwGl/f9I452RP
X-Received: by 2002:a05:7300:e60d:b0:359:bd18:aab8 with SMTP id 5a478bee46e88-3674a41868fmr1503977eec.5.1792539301578;
        Tue, 20 Oct 2026 16:35:01 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm1825134eec.13.2026.10.20.16.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:35:01 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org
Cc: tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] time/namespace: Fix overflow when converting absolute deadlines
Date: Tue, 20 Oct 2026 23:34:33 +0000
Message-ID: <20261020233433.20997-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

do_timens_ktime_to_host() subtracts the namespace offset from an absolute
deadline and clamps the result to [0, KTIME_MAX]. A negative offset can
make a large deadline overflow to a negative value. Since ktime_t is
signed and KTIME_MAX is its maximum value, the subsequent comparison
against KTIME_MAX can never detect this overflow.

For example, with a -1 second boottime offset, an absolute CLOCK_BOOTTIME
timerfd deadline of KTIME_MAX can expire immediately. An absolute
clock_nanosleep() using the same clock and deadline can also return
immediately instead of waiting.

The earlier tim < offset check already handles the lower bound. A
negative subtraction result in the remaining branch therefore indicates
overflow. Detect that result and clamp it to KTIME_MAX.

Fixes: 89dd8eecfe961 ("time: Add do_timens_ktime_to_host() helper")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/time/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/namespace.c b/kernel/time/namespace.c
index 3aff27bb0a15..635f7e544bcc 100644
--- a/kernel/time/namespace.c
+++ b/kernel/time/namespace.c
@@ -51,7 +51,7 @@ ktime_t do_timens_ktime_to_host(clockid_t clockid, ktime_t tim,
 		tim = 0;
 	} else {
 		tim = ktime_sub(tim, offset);
-		if (unlikely(tim > KTIME_MAX))
+		if (unlikely(tim < 0))
 			tim = KTIME_MAX;
 	}
 
-- 
2.43.0

