Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013792;
	b=yQ3bajqVX68JlcHdA38KolFlN1p/B5Qoc70eZmSl1BlZBhcfFJyQn489tfbqC+fIRxYP
	 dZzrAsoXsT4Vp4ut93mCDfruPGL03MHQvUvhDvnZY5rWFPKjnci3oDpi2DNhhEXluRw5+
	 VnW4ATGJsZrH91HnJCwN6toZUWxHRcAedJV6W2J/6zWN5DvtJmMCpIC7wUvZZ1MW4mrL2
	 COnDHcQT6PSlQ2aHBilXnfY+u1BfkU/QaUeqWhZPSRSoZqPJGU1rNxEr1Hhpo3GbHu/To
	 RkqfrFsh1ITGpmMdYDiEz4XJAtBO/hsxLnOfJkelHGTZBkljwYxrB2dAYf+JjzJvyWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=Pt4uKwQ2JQMqBpqG35YVL83bINioR+SmPDBUrwkRSWs=;
	b=3u7sDfUzz3Rq7jb4eKpLvxUhisKVFiSLcVosIoJB1w3nFMcaHxtmqsn4/cjABZ9g0lhf
	 onv8WoK2nEMBZmgopOQtvdQd1mqoLHCcvik3/l5kFbuogJkrd7R1TXrOBNJ0Nx3gZSjlx
	 WN/UFlIUo2DjFgVY65NDDX/MARnK4fTJiaITrFoNQmy2zsylWWxk3XX//SOaAVykvyHhR
	 Dbg8o3efkOz9fY29US/PuSQze3o2pMh4gFcT793faHgbCayg4pyGvCMtg+EjkZzBH3vNR
	 BtSfD5ls5uQeCnJhxt7ELsmHtpMoTPr39ADOBxSzX4cCKL1w6Mp1jAwPZebaeg+EHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daGYSa8F;
	arc=none smtp.remote-ip=74.125.228.1
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ED0606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2ED0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daGYSa8F
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so300983a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013791; x=1793618591; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pt4uKwQ2JQMqBpqG35YVL83bINioR+SmPDBUrwkRSWs=;
        b=daGYSa8F8xbIMySK+Pca7kaOypuoNEpJVcyKqgAYf06C48zjDKxHWPSUsPLFvaLEX+
         M0XmVWpECqKwJNB8LRrAGriON4KPD6jl5qItXhnYCZ6gA3MgVVUrFsvbb4taXwGm2KkT
         mXarMeCKjnKudQe0uCBL0qHn9axr1wevGz9keUKeL/xmN0h9xqYbgp7YzS9U5hT5UqJ6
         u+XKl9FEF7/EU91K6g9X/GUOP/nyIe9J4EcOdZAJHlQQhpahVM0ZGZGMM0sPje0Fyv8G
         tkyHiAvqPTTxNZB/RLxiFpqm+MiT8KTEhZpbGSkEu2Kh8S8jtzco56ngT/H8NWyH+zFG
         /OyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013791; x=1793618591;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt4uKwQ2JQMqBpqG35YVL83bINioR+SmPDBUrwkRSWs=;
        b=zLicL1IihZ9yRC7NX7eBmqP9lMIfaauniujCL0+73lXy12yohABIDRljvhCB4P32sc
         +W0Mza7YaHVXrT0KY1Mpx1giE/XA6YX05tZYXee5F6k4Oie3SXl0GT/cdhzN2U+WLCh5
         gLao+7Ommzoc+GY2uo/2/0kOH63SCaqK6igT7fQjQHWG+YqPBoOhIKp5qv9hvHjMtNv1
         O9ePcd9xKQk1r29yHhYObXDDsuv4d6/eDS4WngfA/rooV2xu/Kzb+j1vZQQ4haa+//tf
         SO5E+F5X871rIFUgjVpabWWRt5b5OrQ12MZahffYRQcayNO1jLlrO6k7XsFIsd2U2ngZ
         NhQw==
X-Forwarded-Encrypted: i=1; AKwUvBwLZTwhrZ46BujjOedCsWggdDi4fpaO38/BTS1f1u/gbBq3XxXI0wvHNtEKNZQmiMIYCPF2G0U2n7FkcCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL04K4fr4PQI6K/7QspTGnr7mSBreDza5pL7TM/HViQhzZE1EEM
	pyIpoW4zXIVeWE3/Q77A4C3s1id4AAzvdUHgA4UB661OsT8oXrg0SQ2Z
X-Gm-Gg: AYBFou0+Tw5qVzhKQdV+ltskNF/imL73o3fyLw+SXwUXprR9QDATnCJRnJ5xxRUa1sk
	TgHYAeAKMyGIpuesA3w6zLDsxXlfCLMFCEoPRakcCFVTV2ZjM9F5CcHDIx0Urv9qvTlUA+FQWlf
	ZFFzcvLxvpkT610bSRIvT+kfc1d2SUoJNK0/E/LVJy3+1AscQWoQjCfPE0mEbB3DWza0VjZ0iL7
	8vBZ73XtMIkMHbI4j0vUS/7ay7o+43PXfbuyytMiGOqDBWZQF2AL86VBLD86c4K/v04LzJbhkUY
	1KoXOHxDY3sM0JltMyAMVvB2GX/YUcGjSghHtDe42z3FWK7EPEVC9NW5VxrPjyhtLKqKtGlz1n2
	yVHNymcsdjUa2OyvmmB/fj+U0kDqNB/q8ttPkrxL67Lpe+pdPmdF1Y98gje6hguWvunBF46Ommh
	YNJWOQbymWykOCytn7CAFSlvHSI3tWK6dcXD8UCNF3DWbgZAE13C1HR5Wcu/2J8cXnM3kp6hiUl
	3gA37VvPImr8qz+ChOfS64ZqCNwUn3PPU/6FeCMZLFPSPagCFvQkrGxTQYFrzxwQFeY7BHAEQCT
	iaIgBJIv1utwUj8yyZ2WCry2AuYrgX42JmTEy7x0swYtd7o9eCl4Ug==
X-Received: by 2002:aa7:8895:0:b0:89f:43e4:8ac0 with SMTP id d2e1a72fcca58-8a367824c35mr4636851b3a.49.1793013791296;
        Mon, 26 Oct 2026 04:23:11 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb2968esm1150041b3a.35.2026.10.26.04.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:10 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Docs/mm/damon/api: fix verb form
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
Date: Mon, 26 Oct 2026 22:14:38 +1100
Message-ID: <179301327249.2.1896995843401183120.damon-docs-grammar-6@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

It should be "All you need to do is include", not "including".

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/mm/damon/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/api.rst b/Documentation/mm/damon/api.rst
index 08f34df45523..1f330429b486 100644
--- a/Documentation/mm/damon/api.rst
+++ b/Documentation/mm/damon/api.rst
@@ -5,7 +5,7 @@ API Reference
 =============
 
 Kernel space programs can use every feature of DAMON using below APIs.  All you
-need to do is including ``damon.h``, which is located in ``include/linux/`` of
+need to do is include ``damon.h``, which is located in ``include/linux/`` of
 the source tree.
 
 Structures
