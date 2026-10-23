Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771367;
	b=Lk0YlSZ5Vs9ECVrTTkeW4trHeIfMzn43hWWBlU0PLinfsIMmpzuAbH1fgQR0o6jMXWUz
	 qURZmEQ5+Nmco803tnUq4IkDOo79C79Xqmn/56iQLaIoddp95bgUsXHIgPSxW/P9Jwbdb
	 GK6d1/yN+qS3pTm8cf9owt84dycCMV/yrBlggjo4DZhk5RD9fmQA1Rz6QUwDO0Jl8zN1E
	 qBFkHrFSYFop6yNPd3rHCh6dy2L27yCxdhx727meCyWcWsFce9lHNwJfdVjpneGohJ3x6
	 TMjlMqgeeACrxygcJmmukOXGmO+lN35rn2pFSe472k0Z6VMhMm96XLIROKMje+a24Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=bA0Hsp5XXumXBy4rVBwW8fxcNqmGHi/YDDxKz56CdE0=;
	b=cs9l0eIEpeAo1A+ubnOX1ELXFyBw38Dce7lE/0/L6FRtqLm8fBWcRZ5myGod2UKm5Dz+
	 8QMxTnwxM4IfxHOORhVN7N39cgZAVCPkM5Rz8bmCPSuxQGdXmQtr9oIBX7nYbMLvIndI/
	 7nM45oLqOvMrgo11a4QA3f8q4ysAV4w8NGBZQw71kx8wG5d/wDChF/6/VWGv4KvXqSlSd
	 YA5I25ddgVxJ/UoG2C+KdKpsFQI7dq9hFkLlWZOZjlVcwOZBWr4NiWBa9ckRjkQj0uwkR
	 AN6LaVRLIo/TVE0yO/J5TGhYYmHVykW/XU+/qwi8E09HXYTBjJ4z8FqSkD1UXNBF9Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ioYawQ07;
	arc=none smtp.remote-ip=74.125.228.6
Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D9F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D9F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ioYawQ07
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc75f2924abso612609a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792771366; x=1793376166; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bA0Hsp5XXumXBy4rVBwW8fxcNqmGHi/YDDxKz56CdE0=;
        b=ioYawQ07vEYfZgiCUpuqQBf5p+5+N36D1zBPS7vgD8sADIRiwLMD6AhR4hv76wPZmJ
         BJ7KUBhSzyY00H4HMuzyc4mqZyqcA0mKasXmHCMft7amo2Kk2Jy48u97xC77jJtxfJ5P
         4R80ui1qypV7HIwZY+g3LbKrAdz/BZKw+jINiYci6ZGbk6IIteJnqsPSPq5x1xWtdEJ8
         ErrjDbMOZxl2xnaDrvsl3bayw/7bhtx0viu+TYr8HilXYTnaqQpSx+8aTNoilXA9p408
         4L6GYKnNFSn7G//tNP/FC2BVqEu4sfdttnV4ELlI1Apheva9qBKqV+aZmKLAueOemnO4
         /Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771366; x=1793376166;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bA0Hsp5XXumXBy4rVBwW8fxcNqmGHi/YDDxKz56CdE0=;
        b=AwY/4zREtoWo2uS9TXktfNsBHNgSeFolW8r2YCwtUR5ig+ntvZMTQ6lDHsCP3dEcxi
         JOEcFEk3dXit+SAa8D/m+RkmIPseqciNHTy8OU3W7tHbzBFGY0Eq4whmWMAQ9beCtlRJ
         1tFzNidayBJ+UInJ/PW6EbBZ+C7Z+PZ5nStqu8ahyrdaL06KbPmFaaoBXAgGqEQec/AL
         KeNFk7r9YkiIrTWwy/QM5z/FCJH4E3HjKmk+P8Cilag+HFffs+Mmkakd/Y+hjuLwKsQk
         cNDJ9vx4RcTi6BG+ZwSOqJh7mSBN+wuu3rgozW4tTs+x/W0yG0fPl4j/S7FTvCnIKYUq
         a9Lg==
X-Forwarded-Encrypted: i=1; AKwUvBy/fE2fOU4RblafYUGpfufjwbiza3GHL7usWym7Glqi4S/uXcxru75qs2RFSb93716G67si7Ex+5JN0nbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmgCRvR2hbOC2tYuuZxUnrfcvW2rExMi3f195DtL5oBRv52lGY
	2fqqtB+7fr4ySQolHyw90k9djHZawl8DMPqEj85b/Tw7EaiybfKwpmcJHeDEwUzXzSzQeZ8E
X-Gm-Gg: AYBFou1WmwS74Gdm4gZv3h15Qb0nqiuTJTeyLnPBAtkZ4bKFjuso2fw+JHcTLjt1cSE
	Iu1Wjk/zy1A4JMo5qJ4311L6QJfiG1Tm2M1ztGXKwZNYb8Sb3MdCxChCjvH4SI6hwfE6EOqLaYM
	P8wRdwnnXCpXf9SRY5EokvlOTZbgoiflmscbRiGYi8ZUzVBdKQIKE3sDy9/Tb/lFTKcUDkcly2/
	Ab32tmr0+rc/eGcKDXbD8LTYdvW/G9Fga9qU4a/ALg8reSZQBZ8mDGYItLFEvaKXimqLg7JUyXF
	TIL+WM/7EVTYd2PGLpyp5OeKpkMZjRlG8tto3+T6ifuenW8P4MXJnTtRrFuKjhX+/fT3XxNghPd
	ngcUSdILlLAQzG5ntTDkCKpPsTsCIcS48lTvw2cHtKppzyqD6hMhL+6ouCvrFGn8FxE/HzLN8R7
	uZGOkFkF1KuLI9rtXxeneERp705uWC292liok/3AbDE13BKBtrFD2w+xoHJCIEOgR6q7KZ5e+GF
	2CAXPJlwrVo9P3uaAe1YcY6N6bWo85VUcXLariowpSF8E0+koGUo0QT8Ej50Ja4GRTZ4CH4O/zx
	E0JUQ1oc0BQX4DXHadxG9omLOVJSoz9XN3o0ntWnhwslI9W/uQR6vg==
X-Received: by 2002:a05:6a00:4c94:b0:89d:faf6:c69d with SMTP id d2e1a72fcca58-8a2c66893d8mr2481398b3a.58.1792771366283;
        Fri, 23 Oct 2026 09:02:46 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a336e586f0sm165409b3a.7.2026.10.23.09.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:02:46 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
    damon@lists.linux.dev,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] mm/damon/core: reset watermark wait state on each iteration
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
Date: Sat, 24 Oct 2026 00:01:31 +0800
Message-ID: <179277129124.2.16132047926074873101.damon-empty-schemes@gmail.com>

Found while reviewing the DAMON source code that if an online commit 
removes all schemes while kdamond is waiting for watermark activation,
the scheme loop becomes empty but min_wait_time keeps the previous 
positive value.  kdamond then keeps sleeping instead of resuming 
monitoring without schemes.

Initialize min_wait_time and init_wait_time on each loop iteration so
the wait is calculated from the current schemes and an empty scheme
list resumes monitoring.

Fixes: 6e74d2bf5a26 ("mm/damon/core: add a new callback for watermarks checks")
Assisted-by: LLM
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
An x86-64 KVM test using free-memory watermarks reproduced the stall
with nr_schemes=0 followed by commit.  The same test resumed monitoring
with this fix.  DAMON KUnit and selftests all passed.

 mm/damon/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index eb1fcdabc007..f61ff763d4de 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3976,10 +3976,11 @@ static int kdamond_wait_activation(struct damon_ctx *ctx)
 {
 	struct damos *s;
 	unsigned long wait_time;
-	unsigned long min_wait_time = 0;
-	bool init_wait_time = false;
 
 	while (!kdamond_need_stop(ctx)) {
+		unsigned long min_wait_time = 0;
+		bool init_wait_time = false;
+
 		damon_for_each_scheme(s, ctx) {
 			wait_time = damos_wmark_wait_us(s);
 			if (!init_wait_time || wait_time < min_wait_time) {
