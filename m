Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403643;
	b=fvY5QqYYMBQLzoN52Jkt5UZpVth7ncIAVq03G5XcefHB/H0H9SfE5s9soSPd6ZY9AP13
	 4C/sJLjd7SNGSNfrn/9ABTZnib/XkLtDOBrPRLWRhGMzZHLgyBn0M0+x2YB9lsnSPYakz
	 6LHiPBtb3zRQYnETxK9LFgtLSs7DVRtoYbOp6O6IoeE2dSp/iPdnjCaOnLHtiXa0xRjJy
	 9AFTJpahTGNpNePlqZ8uA/O9BQpbbLJQy887VLP/GBsP55fyMcYLr+nDwyA4ouiURWolV
	 TDPGsfvVZzSIOJdEtcb8wl5+Vmct2GwIzByTtDYN8DNzGt6q3yyEZwWdwArYbRUcZsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KjhafLL1UZbKPOZNQh1cMzv8u8RveGg8GMhtLtBENRY=;
	b=BO/7wPeIV7tmOnc5Q41VilXGus9SCq9hEWozl5TUZyRUX+drSTVdid5xqm+tXCuKiIa/
	 0b4a4ymuMUP3+5KFpiHRkvAhc98z7gU8tNhCYCN81+WCChMTKfHcMU1JvTQI30boTP1SM
	 5c2WwF86j6gjYSLw5EdaWN6YNSgQ1gKKF/2WfyFglHQYF5EGC56t8YCNJmXs+RM+InC4R
	 P1zfeNymvmZ2zj7EirW6gTv6uNIyaZoNDG/PpQaKGtuNivukRfm/6tYj7DQpUKyBe9Hzv
	 wDiE0hwsfhpgijeyDb4i1HNuirOk3SxrtLdMFTKMKDH42h04d/e6RQ2/xMxhjiL07Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mvptNPQE;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E4606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831E4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mvptNPQE
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso1775097c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403643; x=1795008443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjhafLL1UZbKPOZNQh1cMzv8u8RveGg8GMhtLtBENRY=;
        b=mvptNPQEq/vtNOxrKTkNGyvTn5hcer5o67WHLqmXdXBljpmh+pwrb9xNdrFBu6uzZQ
         XltD0kBMgg5UUZH5w4sy7C0j+MTfNEXIdOlD+zX8fFPkXH3MkSD8dXNUGqo841u13l//
         5YXNx8otjWPzRVp9qJOzQnTuzodjfyeZBcvVB4Ej6eYb4NsQ1ac3Zedxwjy4is/aTrh9
         aeT0BRLR/D3LiHBQIbGtFLkEDkfgi8nep6pZXLijD8Rh0VRNJ7fXg/VyEj6VSBiNZ571
         rwR+sHkdqx5dRo09lIm5jruzRe2cavowOdQGEyDkTChtHMWxCfMsT8M7HqT+5E2e+vsV
         vDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403643; x=1795008443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjhafLL1UZbKPOZNQh1cMzv8u8RveGg8GMhtLtBENRY=;
        b=Iezj8mXjN5gCJSWQ+MDJ4XLNMVPj7V+jxWd/yk/pCfmvn82PLeSebSxP69UynVzDw/
         dmzb273xVLqPFhRd8JetDO6O8u8NQaVK/C/0uZsoAug0uC0CEQfWcHmsSo7DbK3lvZxp
         aqEtgDhovob5kqWMgZKI8nNYsccASxI+Mi1+0G4m8Vhl/jLfF1ZQwnkf+Y66cG4d+DXn
         0oO2mz9ggto4I/MetxFjuNocc1f7xbfHxZ2VAFapq1+fZ7GSpRHdf4MY/3AaEbqVo7J2
         yA6ljRj8miPuZPd+VNO1M1AovR+qj0AwUbyqBedxvP4aJjzUlrYkz/yvM6aXfZUa391O
         bBjQ==
X-Forwarded-Encrypted: i=1; AL+hErG5r9ejGVxnFn6kJMpB4eWd6k1ZP6C4xesxiGVLH5J60W+ySXzO+Fs0HZDfnpMi0rFf+KkKl1Ga/WuSDRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RISdS9LIDEl/RJuhMQuI/GNFlDObDzCaJEjJBvRzb1R/GZjlw
	xGj/ozOgsPpid/Fzl9ZIXWYhwy8qk89jieISceW5NYiYiesNOUhqJaPd
X-Gm-Gg: AYBFou3/l24Tq26rxjyhnZ1zkv2my03QbjOf90KbMo1WJqbQINaFss/RylyERFP0hoD
	hpNyRFrsilWKC4yEAXcqdN/5xKZ+sqeZpAmNa7aeHS2MWIv2zvF0nE4KfsBHZVcpcJJVKVLzja9
	XtS7hVFlfTFqsqoo1xf6gP0YhmpT2lj8Rs1pIH2cYqiup8MYBecrCdul4rt+HSq5H84qzOtx00n
	cKvN/GdCnkAKaPWePI5EHGsvZF6rfPz3K5QkmBJ4SLE/HWO3NyBXVfqc8W36TAFpSOCf9PrUW3r
	+G4HHnFTX+RVLbU7rXrFpwosyZ8QzT7xeOcM0sfkjP2GPTAgmRiMC6okmOF3PJaIV01BgHXIQeU
	bIAzAFGKyNj0S76AoLAy+aGDLZJ0BjNj/64y79EaaE5ksxX+mdpIM2ehZaVNruziQxjeOO/F5P+
	AjxHRP7a9Uz5RLlhX/1FUikvmn4d6rbRj2v7vgtmUkTdCBP7vmcXxvhKorQ2R9lxzjLWg87LG3q
	rMq2HUN2V9HY4zLVYnIfli1rCjaIXj3ykL/ZHmufB/FWEkPWgxX+OfERUPeHd+a3LG8T7VTOggu
	P3DZ++P7W957aaMWgBv9NBUMav/zmmN6yCn6oGTBem6iHHjWisFiYfTXoShaz5Sl5J41sidbfQ2
	aqhrt4XUdVI4CS1nBWQUkHkD5VgtFHfP/a3zQ7g==
X-Received: by 2002:a05:7022:290:b0:1b2:529c:5b6c with SMTP id a92af1059eb24-1b3c02f37ecmr2292070c88.14.1794403642285;
        Wed, 11 Nov 2026 05:27:22 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm16146038c88.1.2026.11.11.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:27:21 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: giometti@enneenne.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] pps: reject N_PPS on pseudo-terminals
Date: Wed, 11 Nov 2026 13:27:09 +0000
Message-ID: <20261111132709.5959-1-dennylin0707@gmail.com>
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

Attaching N_PPS to a PTY registers a PPS source even though PTYs do not
report DCD changes. An unprivileged user can exhaust the PPS source IDs
this way, causing registration of a real PPS source to fail with
-EBUSY.

Reject N_PPS on PTYs before allocating a source.

Fixes: a0880df0ccde ("pps: serial clients support")
Suggested-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Reject PTYs before registering a PPS source, as suggested by Rodolfo.
- Drop the stable Cc.

v1: https://lore.kernel.org/r/20261107211753.75932-1-dennylin0707@gmail.com

 drivers/pps/clients/pps-ldisc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pps/clients/pps-ldisc.c b/drivers/pps/clients/pps-ldisc.c
index fa5660f3c4b7..83f4caced0c9 100644
--- a/drivers/pps/clients/pps-ldisc.c
+++ b/drivers/pps/clients/pps-ldisc.c
@@ -46,6 +46,9 @@ static int pps_tty_open(struct tty_struct *tty)
 	struct pps_device *pps;
 	int ret;
 
+	if (drv->type == TTY_DRIVER_TYPE_PTY)
+		return -EINVAL;
+
 	info.owner = THIS_MODULE;
 	info.dev = NULL;
 	snprintf(info.name, PPS_MAX_NAME_LEN, "%s%d", drv->driver_name, index);
-- 
2.50.1 (Apple Git-155)

