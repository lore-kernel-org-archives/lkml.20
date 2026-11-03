Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680271;
	b=SnLMEzqgW4P7wRvxGmtMMaRSkjgbWAQwEEDQZti9SnEk66/jbqwVDlykKpNWuNoMSGws
	 M4baekPVP5ucrG08poXfDnaGCnfnHkjsUzkkzIRV7thCzWV3ThbCfdtOxttdn2GPLRc+C
	 Xk2Z36FkmPQORdYXMJalL4Gqum89V+PJmBYdUfDB4m04BmP6fblKm7zSnU0jwgM09/0BH
	 XGo8MKVOu14gP/kpw/eac9QDvmPEVWO1GzAhKeZq3W0JhdUcMkTJ8r6LkKSjvtGa2fJu5
	 TDNDss9/rjNJJOdzVicVIN2kKnAqJIyfJAv8/LkAvnC9GkSOOdtOQDEM14TfxjysV6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680271;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=Va7VUUxo862cFCZMGVkvXVoI4j0lxFWSFMjOC+ilN3M=;
	b=4Nroudq7jfIfZNYAZ1ncA/GHohwmPsLxwjxlQBWX43CieFSmFt0QlIvR4qnwytHQwQqB
	 jtyJgZJ2O/+vNoXWk+v2oOtf2uE40ZT04PP4LZcnshWkr72wNJXjT9hUWnXhF8Z6opVAx
	 69NsvmOp9PlHho3muCS9WzGmlMVA6NQdg4DyARhSh2+QWJ0NXw+d9vdjwuUBUzDjxKRrh
	 zL1TNiNBeSeWfA/11JTrwc1Y3aTglk+FpvvorxNSMkU6GUodhvP2MAOwWqlJSVRFX+v9N
	 XVe1La8OB0rHsX3roTem40kHR+zDb20yKcQ89NPXKUmEamKDUsIj2TvnBw8ervqT3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEA606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CEA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jJbHK3YWkz5BNS0;
	Tue, 03 Nov 2026 12:31:09 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6A34V2UU027426;
	Tue, 3 Nov 2026 12:31:03 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 3 Nov 2026 12:31:04 +0800 (CST)
X-Zmail-TransId: 2afc6ae963888d0-292bc
X-Mailer: Zmail v1.0
Message-ID: <20261103123104319tX_sQcNY56466a6yZeEgg@zte.com.cn>
In-Reply-To: <6ff71dd8-84e0-dcef-01c7-1bb7e341ccff@huawei.com>
References: 20261102214935612btR10gHRJy3yrzqeLcnE9@zte.com.cn,6ff71dd8-84e0-dcef-01c7-1bb7e341ccff@huawei.com
Date: Tue, 3 Nov 2026 12:31:04 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAzLzVdIHViaWZzOiByZWplY3QgbWFzdGVyIG5vZGVzIGNsYWltaW5nIGEgdG9vIHNtYWxsIGlub2RlIG51bWJlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A34V2UU027426
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 03 Nov 2026 12:31:09 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE9638D.000/4jJbHK3YWkz5BNS0

> This check could be merged into previous check:
>   f (c->highest_inum >= INUM_WATERMARK)

Agreed, the two bounds belong in one test:

	if (c->highest_inum >= INUM_WATERMARK ||
	    c->highest_inum < UBIFS_FIRST_INO)

One side effect: a too small highest_inum then reports error 3 instead of
the separate code 24.  If you would rather keep the two ranges apart in
the log, I can leave the lower bound as its own check.

Thanks,
Shao
