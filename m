Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348654;
	b=pflM+ZrmY4oCS8f8DZoXye9mJaGIaXqLYfMtOsViMlBn1j+/b2zMZM09zY0kSMUyFgWW
	 sMv5WVwLTKrugQvN5zrMNULRf3wakt3E11NBDHZTvrgzfFpHvwAj5iF+qQ0OFilmbf+y/
	 UiSl+GSZTFAweb9qtTq1pyihQ1foN8zCf2MfUMJAc9e6jx2joAiavRQZwrJ4H2h6la4Ky
	 tkGgc/yq0lKHZ4Kyw+Qw9HlBXB0C7yBseAZHbC85l3GBSp4HYEWm8w+XjXCWTGhYfy2YP
	 b0FENA2w8FOjxu7AhSANNP4W+PUCsk5rRlNFiNKjCTQTZKliF4wFimG+hiOiNMfbY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Eomz1+Wbpaf2im+RAxB6LnI3cINy1wmsYIQIhmX9l4=;
	b=LIJ1tWJidaSgcZ1jXXlPnGqoQyL5T0V75jJw0VzutyuzC1V+2mBdc1aoXJOUvCPxMyTT
	 wmrc4LET10BbCHpECLL0ibxLfh3/BtLSKByrO8Xob3MvXmuSXMO5Po1IsDu4S6I7cOP6Q
	 GRENiJyGGTr2P5ATeGS7VVxduTDO4jIi1ViNa+zufu7e3h39y4bGxHWWkF/oxtMJ7r3CZ
	 nUaU55gbKYwR07+c4Ykg3cEtw1/WK3c4xhs2hxA5xPaEjxD8kXcOX7ol8utDvRQwiOJOY
	 YZvNiXETtrkulzcnQBx5fEo7bCukxm7L+5Ve1AV3Wp6ehIVk8192guR6N1jpF4zEKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLHN4GK8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3EE606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3EE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLHN4GK8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso977237eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348653; x=1793953453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Eomz1+Wbpaf2im+RAxB6LnI3cINy1wmsYIQIhmX9l4=;
        b=gLHN4GK8lCzlYxDpyxRbKCa+pJVlsdal2yg1k9wCGlcmXoKQTAI8UoGGxHaWuSAdb/
         Uf9N7lDPlg900GL4AjwV6EZDcIvr3IItI6NiTA+pfM81SwDmB9Glhs7rppC0lbYbmL7l
         hhWBXGGgVrFpnKs3JTPt0AVWdHwTvg83tFTJWCmQ5RDAhVJGNaVCkfbOyDvBReXxqm8w
         cvbF/VQN7wrC64gLxjMDC/VQZW6W/lRVUzdCUM78eaR5huUxMYfN1iTgyQZnF7jTVlp3
         v78/uPBDcLFN8gSrBpFstai8V5TgS0h03B4tsb6Gmln7j7cD4RC/ntr6eRX5szQqF6bL
         WYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348653; x=1793953453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Eomz1+Wbpaf2im+RAxB6LnI3cINy1wmsYIQIhmX9l4=;
        b=PdQ40xNQHwsTotd5vQzZiImfZs3JevM8r/3Mi62vAYdjYQRw5KoJdgtIV0zzX02xcj
         OjkyonkAW1ymlfAr0aGVEJZ+gIPNpZs19R+dIf2dHCw3ZcJeINPr320kkW9dEws7hcN8
         J6uzv/bj0HB9+sq36fW1iVcyp7XTTfWfiPcigCs4/w3+jJHAp3gIXFkC0See4mLgoUUk
         CJame9cBxWOFiBNrPYZ+K+fyxII6N+wppWnMeMxjlw5hi5KJqUT8R6pESCe5cqr8lEKw
         46KyLGCD5XODEskktrK0LQfSBi7hZuDgu4+sm6l+KzP8LA78er20+FNcM31umMcODliQ
         2pPA==
X-Forwarded-Encrypted: i=1; AKwUvBza/giUTjHNZoqVFVyQtDnu99X+XswA4UvogkkCKjdJzVra8MKtmasEkxKIgwhgzzFoG1qhifV0XOTwPRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVldcCU/aqK+yKieTITQMAali9a+uiKnNoIhHZpx1Y6L5tmiXt
	4qi+ALPSMqr9YjsPQOyTa6Et2xD0bHjo6rrARh7kC5f/38wuNWW3XoJR
X-Gm-Gg: AYBFou1qUc4cS3If3rHFhT1kNqasvrHq6gzWai1/ctS8FjSEwTv+Cq+AfpOpkA9ziGt
	Sp2TJ24ZVSMUDoUSrYMvK/j9FWvTUoRMOGiAB0j0w/C516auL1oS1WXElGW0akYtF0I3YLShZ9c
	DhKzo51/EDWI2f8q7uYXM1bcDIiBOmuRrvvdkIWaEjhZyItzo1Jyp14B21wYON2p2hxEwzjtWoc
	BMMFzKRaUwdM8jVen0h/1IAusDh6fE+B1Nt1xhiPKWo6YM9IJyf0N58T6VqHwlTW8/dslrbXjYK
	V0m9eew78TN5nJerO6Rs48gAyt8i1igud8+ESprdzMHbTjU0MY3AIRmXwUuKzZcCyCIB5zkcS5u
	PnJYThoYg5uJhWP60lU9a9SFPI0ugNfbWkhgr4oRXAyhOfOdWW5IB9DaA0JZ4ZQ0xE+/0MWWMHk
	0rYc68QSf544T+gE7dqmWmmN7sNApN8SVzvVIG1Oh7QFj7eFE9Gn+O+tymUT6fNKmF6H3MTYRlw
	RNkiP6A4kggDq4+3QvAsk/Ra7Tn9iWHJMf8ciw3M8tGYQId+yE7Kjoo+A6p3ar/Sxq82HS+X7ob
	GztcNGY+4VcuThSwipI0XsEQTgYMl1w6kHxusDPs57XIBvVJJul6iX/o4zT+0NyJXA==
X-Received: by 2002:a05:693c:87c9:10b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a4241985bmr2650980eec.28.1793348652996;
        Fri, 30 Oct 2026 01:24:12 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:12 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 6/8] platform/x86: ishtp_eclite: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:53:00 +0530
Message-ID: <20261030082303.284271-7-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/ishtp_eclite.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
index bca7e217878b..d7b10ceeb52c 100644
--- a/drivers/platform/x86/intel/ishtp_eclite.c
+++ b/drivers/platform/x86/intel/ishtp_eclite.c
@@ -585,7 +585,9 @@ static int ecl_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
 	dev_dbg(cl_data_to_dev(opr_dev), "eclite-ishtp client initialised\n");
 
 	opr_dev->ish_link_ready = true;
-	mutex_init(&opr_dev->lock);
+	rv = devm_mutex_init(ishtp_device(cl_device), &opr_dev->lock);
+	if (rv)
+		goto err_exit;
 
 	rv = acpi_find_eclite_device(opr_dev);
 	if (rv) {
-- 
2.43.0

