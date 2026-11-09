Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238755;
	b=uFh36pn1ewG0+DzKG1aDpciaMAYoteMDnVOQ/BqA/BOJH9WE+W2QlyxrBs2lKgr4ex7Z
	 9OTAcyAMBGWD50wncTirnweik4N+bKE/Aqt7Z2lMHNR0awk6QFNnIHFQTjJc9sHsTU26l
	 3ewQNmcNbX7EJJxxjI4ZMoN41FYQ2AR5mNK2qL4hJJgMHm8OD8YL526VNBLGC3MbxM2OA
	 J0tlNOAwf0w4p/4Bm3ei5LGTTYgufaW8h4+dLBi8eQKWqIqbhB1emYDQAEm8mfk/6i+St
	 o9qh+7rQyAQlhQYHQ5whibilZz5qAnAzrj+WIjFoqDIH3/qCi8AOxIZP1hep1G8dfVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ucJzEIuQhPLqhVZPFT3+82Rere1QwP99Naonf6q25LA=;
	b=hPObVMVYlnFicNpLpRvTzXL4Fi37SAtjIZUaxCQJi1864a4jhbnfPvfw/pqTNQatOL9o
	 yCgk4bqeg/DbmtU5iHlPAbylQNridk7YtXFwDV9vfX3vWnmeH7PeoaiYFMhlzQllZt4Qw
	 wDMGETN2rUM9ETI9T6H7vrNscQ71p+ILBTAd8pOh0Tfyex/tQJJ0e1FMUN0B4c2uobKFF
	 TkFTq4nlGQbzREBY3gujfO+59Ow6pW3kPA9xI+Tcwz6w8nP45hW28o4sf/8cXsA50puYm
	 9CxBZhPqoRUra2hxzfSiR7EeRIvr6RqrZ/2c2lVpxcdOL4pj+ZKYXBKX+VyHgZDR5LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s0w/Tzza";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0w/Tzza
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so568446a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238754; x=1794843554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucJzEIuQhPLqhVZPFT3+82Rere1QwP99Naonf6q25LA=;
        b=s0w/Tzza1bQR1JXhoNZKQJP4sdFxLbY0G5ZMDIo+57yFdQVpmlSzpG4SBIHdSSv3N8
         +FAHwbA+++lAj6F3ee7KJENw/+mnyRqdMj7GYianIBpp55QAc6h2Eq6IjLYeE6zSaTxi
         9TwEomBhhFc606IfAunOO9sEyF96Hi6l0MS3DznSpQ3rEVZRkOxEKSeCefD4Do+fUmxW
         x7W6FAoeP6mA388pZ3EWoPTctbMLoXFUfcGpN5lJuKWd2b3p5FHQplur3wAt9iXeifHc
         N1e38OWZpHNT73nwJSBOAYWrws1EpXfmw7CnzYdLH8Rrv2n2U/dBVjyuH70tt0YL3xkh
         w+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238754; x=1794843554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucJzEIuQhPLqhVZPFT3+82Rere1QwP99Naonf6q25LA=;
        b=tjJfUyQd7cYVGb/hFB17nYM7aRbtvr1Tg8RtScAvYyJadAzgGIKXjS5XrTuoEfeG7R
         yEHuMB+9i4uk2dASvndCcEQDR5SJaNPrmcRCrpMKiJ8pp3ysfOoKMARZOa7FcHDbxLBG
         gx7ReNE/aWq/XfO+gTRaCy4Ecis8HDv08cki3eAeH1R2KMlmGUW3kEMjDM+iTcGRQCRa
         LvGpNmtgbCC9elX52FYCmL+n86+FOkK0ukCm5UlGk8GmnuvKjFbLyqVmCK9U+e7tm+6h
         k7Ne+FWfZxsSbWSHLbYHO/jmLwzwkRQTBcVsEKi8l38yZ0R5WaC89wCcoefl+6pbZCeC
         R/zw==
X-Forwarded-Encrypted: i=1; AL+hErE1Ui2LNV+e/N1X7a4UWquDDXySeEK/r6tEKXyNTBUb3/JP5KNbE5ex/lYobxFYNiKm1OruTkkmkES/O4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s3AsX3iWh0bEz0gXE0hvTMAd9V6RuQKRj5dGqRBKdcx8uZpWj
	BoeKVJgfU2qKVw8ZIJFjMnAQUYMiGDCkqPggFf96dIQ9qJMCqeXov4Y4
X-Gm-Gg: AYBFou0m4wg1zxQ3GbKLl7wIaJGGAt0GARzysxCmXoxJmlLvysaidO79/FY5pkrGwTZ
	7lnZYm+6nB9d/Hli7ys4ZmSDB1gK7bR61xWQWK5sgCY9oTp6ZFe/wxibArM+Syy68htEwBVLsOt
	ABGnzcN9QOtoaEj1RYjAGiEQpdVJZfE/QjYSH81jXZVIG/+odohnLH2258DDPe8VQEzj0U1+lbc
	e5fHL6fNMHXkroJKszEiqY8cZOdaGqyVPW7+EnWb+OFkKKtAjdXV0lN3+etlXHsIimcmDKdPS3/
	8H/NOmBABUqIshEO4UQ7lfnw1dJ1Yx23HSuvd1f+0lUGZfKM852IvKdkauRifTV01cpNb6e73H5
	Dn2M5JkC/pUM6T46Z17+6OrIToqla8gUQnW0uQVTU8VuACEg5mxjmJ1OfCthuHvW4n4ZibaYRNK
	nZjXAa0wVLMxeJ0iF7ViXiBVaH+G/6x6MVfNpSB0emq+PkAXbJPsxciLzhyWQP6gBYi2GngGfVM
	ev0Z4O7A29CPAEdgu9EZSkhSTYtxlpkiqDje0QYgDUOWWsQ17GVegxjdgxnLt9PLjqcFz/g3Bk9
	7TVL8oxUGQQsX3N02yQOiOHHlkReSvcdpuu2d//6wuVET+qlMiF2gLz8Wdd+vXEpv3VVmLhT9b0
	IFCY=
X-Received: by 2002:a17:90b:3ecd:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b12d3e71d8mr4395338a91.42.1794238752545;
        Mon, 09 Nov 2026 07:39:12 -0800 (PST)
Received: from 0.0.4.7.1.0.4.2.ip6.arpa ([2401:7400:c804:b668:b272:9904:c32b:2ee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm11062029a91.0.2026.11.09.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:39:12 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Yifei Gao <gyf161023@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 4/5] memstick: ms_block: keep the power off during a full msb_reset()
Date: Mon,  9 Nov 2026 23:38:03 +0800
Message-ID: <20261109153832.7377-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109153510.7161-1-hjf3108@gmail.com>
References: <20261109153510.7161-1-hjf3108@gmail.com>
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

Keep the power off for long enough so that the card properly
power cycles.

Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/memstick/core/ms_block.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index e373eaf92530f..66672235a4584 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -740,6 +740,9 @@ static int msb_reset(struct msb_data *msb, bool full)
 
 		msb_invalidate_reg_window(msb);
 
+		/* Allow enough time for the card to fully power off */
+		msleep(20);
+
 		error = host->set_param(host,
 					MEMSTICK_POWER, MEMSTICK_POWER_ON);
 		if (error)
-- 
2.56.0

