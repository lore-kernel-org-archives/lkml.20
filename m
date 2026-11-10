Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286692;
	b=CKFqOl4vs3O8cdbL2je9BNb2DJi+zo08OkUmWHXwDEX2RqzMSKDc7yfzLfwAJFEOsCXi
	 jENqG5k8wt+jSA5x9g6qZvnIwG/F5xC3x1Pj7EOEmWVWO8/e+1tdKgbpEjCdG7f/zBZSA
	 PAT7kMgrxqVLTGhs2vjAx+xHBPTNaZwVfZUwWc61SwKzp4isvDOCCegxZ8ngafnGATi7C
	 YqPOZdCE0i80uC2YMbzO/c4COiNu/THm91h9j8pkuUn3qLIhrqyrPTsrH26aG/O6dn246
	 vOWcC6cycRQ4CTQCoCQwreZ8pTjO5Ro2oWF2Gr4KKr+wWPqFCg56byoZIwD681hQgOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
	b=2Cjs4W033jKi/KY0k2JnY13RRl1aOQYivxBf6H3P7LRWew2+VCN5lFumXaaBKslp3JVs
	 la1Y+U1nK39VOODtMtzcsbSVlqxr83UppPmDzt7RZMiLlLU3lk32HTFotZBGyofdx5mcE
	 JHEIwyuoNuKEHUewMTJO4p0hJ54W85rHpHNtgLJSfUqS8zRVJhJcRmiwc2Vy/+UJ7O1xJ
	 2WLFfEmrYT2TateLKGWTsUUWZHLXRSki2bWNbvU+KxgKV5tDokHNj4V25DhMqgaHANtFj
	 5fgHlL9boflycafpzNDIeqrL6gE2MCNScraoEJJADb4VNp9AUJUb6rhiLmvC5wJkYWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQqqYSWa;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718BE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQqqYSWa
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ea0c05c92so16322696d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286691; x=1794891491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=KQqqYSWanyzanYGMVvJoVq1Q3OSyiciInnp7CmpNy/ELXu01iX1FI4OYQ05vKpykpM
         fGcaW0bgvO4uXo0J6dnIxdWcxok5LhqgBkaymyXd86g0dKW1lvbG4QDToSVke2u6s5iz
         1nNu4/LYguDDsUXA6J1wnJnrX5Y7VuKYTPv2GHP7bznh9Zwp1kcGo6UJVJ0CMvI57gSQ
         79AhOnexbBi6XgyzS5tS+JACZ8rfTkrk2Bswvu8illsbGIztZDmLfYsqe07HT9ZenwjW
         mtyEpJOHOFNbRVL9ImJCY3eMOFGCAHNvzstmz7ytqElhbL/FMZxvbP2LkpGfA/KzuHTd
         lDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286691; x=1794891491;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=I0GfSuGiw7QRdIYFYlYYlJbG8SEGWPfyxOXxAIefD/axK5cyPdNt3D3fdUVClqDexp
         dOlJJibbL8Jsj8j17htFkPy/Gq0lQ6lvaOuCKei2Gl8q5MpuKAHgUqqcykOl+t5Wsydx
         rHTYe9knJm9lilMtO7JFN93kdPiPIERU75Kcitx7LTVGGw6PvpdTM2+Mk+aFKZVekm7c
         CBUTyD2sekK/UOyR0Ad8RnTShPkMHk6tMqzaLUwc0/o9iysN4GPUqlRluKBndNOwOV+G
         D6fhrcELvpPqplt3hoCJumsLO/MICXr1DhofBMc8WDRjCTcCIdMQNlQoGF3zr59k80+0
         Ui+g==
X-Forwarded-Encrypted: i=1; AL+hErFUx33cxiqunWkWyJ4Iyzg1y6YSmcD19gWJqqO0Okr6hfUIeda4q1Ddg2V7nHB0148TWNC6erRkUTIo/lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KjTWOj2/plbxbSsrU83m9OSnW1gVcTQfUAlE354F/tZ8Yto4j
	49+gucdAx1lu+G6/OyjQ+ACm9LOhHHXB9ihoimsh3audyZXn2wPqT2s=
X-Gm-Gg: AYBFou3SmPlwvx9QvYwsTBYSmzX7ii0xQdK2Lsy4gzMWEu+eDncIMv+vSA5wx3Uwbuw
	KK1T5UnhPZPNf8G2IXgz0J48LHVwIOOFOYojh/u1GKedl6uSUQpRaeWtkfuRKVsPzXKXwkW9K2F
	HhhVRk1amcFTIB1tWcpr7g1giVHnivhA+kAA5VOSq2GLBYGmVHla3GA1Rk1fXAPBWCzmWv5kuTw
	N9m6xpXHXWIAs6OX/6CRIVEkn2BOX2L03YThHZINlSaysQ2EFp3GwuCfp9nve79IDNJJg3kI/rj
	c7bhfssajrOsWKauIIyqJNKndK20qT0puceVgZc45XcfG3zbNhInP9OS7YXZ0ZgdCi5NI0VK9Gw
	cgeUWF2gHy4Hr7+LcGjxU+chSN1tIrW3oyU7W/zJDKNZ+xD+bvb8rF4XTxJMmknDYp+U5FRGTl9
	hKcw+7kgSzIVwuCDQ7nKP2JPrrYwo32DEW8fgqQvgOTQeTdLQdJGZ1Jf/IzOMXj8PkfipnlnKRT
	oxN+VX5S0qNdHtCTd9uVAo3fftFhgu/w0Sdlh4h/jluRJZcfHnTFjgZ/VCqoZTQx897OlpDSChq
	CVaU+tm/qasMjKV4ndlUhTiTDYk8yRosIcDfQbZVTK/WITuSH3iZeONAMM6m+NXJ8swyTmi7eOK
	EX9rts/5B09CDceQZ/7+ixiFm/s8s8GBfcAvglc6sjFZ89Dn7oILPWS/PP6E0S8bd
X-Received: by 2002:a0c:e018:0:b0:91e:c6ec:1d9f with SMTP id 6a1803df08f44-91eef9a214emr27070326d6.52.1794286691211;
        Mon, 09 Nov 2026 20:58:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:10 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 0/2] media: aspeed: order probe cleanup and last close
Date: Mon,  9 Nov 2026 23:58:07 -0500
Message-ID: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
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

This revision requests the IRQ after its dependencies and synchronizes
IRQ/work before manual probe cleanup. The second patch fixes last-close
ordering and keeps the engine available until VB2 release completes.

Compile-tested on ARM64 with LLVM, W=1.
No hardware testing.

Changes in v2:
- Rebase onto managed reserved-memory initialization.
- Remove the research sentence and Assisted-by tag.
- Join the IRQ and delayed work before manual probe-failure cleanup.
- Keep VB2 release before normal last-close hardware shutdown.
- Drain the IRQ producer before cancelling resolution work.
- Balance IRQ disable/enable within stop and check STOPPED before power-on.

Myeonghun Pak (2):
  media: aspeed: join IRQ and work before probe cleanup
  media: aspeed: drain IRQ work before stopping the engine

 drivers/media/platform/aspeed/aspeed-video.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)
