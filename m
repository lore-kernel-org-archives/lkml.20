Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459168;
	b=U6gQssgAka8HaOsr0rDhuUVVpycUBQlRHHKKpU0MgIQOD5NRqRfSMNjhPcUMbDbYFq3u
	 E/0MQWgFEZP63NPS7V8FCBfsycRff9ZyQPqMF1RlcgUd3ZskIrAip66D1xiXciCLcEWts
	 bMYvGzqrRuw4Xx5sPMmF43GBa6I+h0EK7rNbXySlrTOB49/lH16gG3EUHfYSmUMEcaAlT
	 2kc++4SyW2oHBZiEU+NyFr9ittz0EP9lZgH6usa+lEeoAdS6LrVVtpQ17Y2Ot3P2Hmmjk
	 dKvWhuYsC/QFHIXeCFX3F2h2bSnXRvcfvqKAUnaRtswzYvfknzwmC+/akGMA4TBSe3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLCqWlTLv5zUj1BUTyM/Ud/mFd3BD01LgxIiWW/VVWs=;
	b=ZNhXmOPtGRj+fmLBIxmh2ZJJ094IZm3MSMSdgFFFcy9+F7WIRNN/cowXrZpEPnMowVSF
	 jVI1dVH0W0zW8HiLNxV+AH9QYRcFD9biiDpBD0jgkpRv/jWfLIk6+auWKwwnpMAduG8d5
	 6R8UwQn981wXcRLGVgodTd3fOkYmFmegYGdhDK3Bm7+iQaGFZ7lsYMOHq3vg7+zKvSt9G
	 F+FT/0uFgGCl8KDqlrt1HsbSxdkNvoU8UNaP9LNldXsG02smruMY+3zLQW5r5HH/MqEI7
	 0dNU36Awqi33LX2Yu0zd4zArahYFLt5/I0i92OEj1t3FlVTAsQQECFFZDQzQw2gwxCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgYkWS91;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1A606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F1A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgYkWS91
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso408414c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459167; x=1795063967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLCqWlTLv5zUj1BUTyM/Ud/mFd3BD01LgxIiWW/VVWs=;
        b=cgYkWS91Ht9ZcjTwpuDEo2DfmxVNaqoN9+94ev+m6sCB5GbCKRqt/Sid8ohUVtxNP9
         sjTVmiz0Ot+4k485OrG6OYVAOX/xnJ1tfB3DBfq3uRPHie+p+A3WxF25odHiZOUANGT9
         J6s6l8X05k2iHsXWGhjJD9VbiImPAT2ozJec4r4xulPvoDE88MQ6odjhWhh37p7e1gQL
         +6STwwAaMemdRYhxFqbmpZ1Xi35D9bWKDq3z1WRlUdUXu2+pFVCOZIuVLXIImdvqqEH+
         ikN9+Q9hRL5ztxidmI2VCBgue4Bs/EiUkuOn7x/jEVJ/kz5yrgoN3BAU3UWvpSUoDk9V
         n1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459167; x=1795063967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLCqWlTLv5zUj1BUTyM/Ud/mFd3BD01LgxIiWW/VVWs=;
        b=nO6SMuL81gSKkGKS7E2RFFR6FhLfJ72GgLNd0IKXm2upCMjfoQcqauz3GUhkyKP5p7
         XNh38/hGgyyL2EVwkzF5+TBygLnp5c7jBiqgtHQ1cOHzi6pAxOOQ4DNpkdS+QPPdxhLv
         P9EHgjP9RbOLPmTyFpDiSqgjxP1GA0/1KU4nXqHjv3Pu0zD2A7/i53kFR6yfMN2YTmII
         ESLWPknG3KxKUNL8rhJSq28PHA8SQjiOlwmWLvq6umv7zqzLmaCyU8Uy7+WBHavADY3b
         z6iKFPlhH4CywlxjcqtDsbuH64mTnRb3UYfVh3Yoh3p5HVr5/1C63kQ8RP8utLGfYSGh
         4vsw==
X-Forwarded-Encrypted: i=1; AL+hErFp7zHWYskXNsNCplD797EWSuup9RBwIRF46bvzsxEH3ynpWpQsYiNYygD/7I+gtxdeE9OfA+A9/IkPoY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U63NgOj7WkQx+14Tt7son7gZ2CJgT94HCDNN03znPUNqnLPdQ
	zOFi7+zitM7HQRAsUDCBaply65gxqQ1rB6Lg0nfc6953xU0yzhHmkV5Q
X-Gm-Gg: AYBFou3gfsiDNrXx7QWRY+C8JB14+B0bGTeOiMBJTO1gTzNchXr+mSHAJ9aTSpB2syN
	03Ryi8Cr4RQMxvfEoZbSP0ZEZpMvW0tifvPZGXmvv4JssLnfytu9Gh+rmZC+gSoiCz3NVHh/Udc
	hFtwXDuyvQNjnRWFJZyp+KPh1cUEsCV+kpx9WFNpswGvlvkW31wSSKO9N9njETuYMB8ARq1wWUG
	Tnlbsfp358P6zGZo3bV3bckUKP7y6PaaKkTpR85lgESq38CV6SYtfMvhl3UyKfCwrvTqsSyL3gU
	6obO/2OFDirp/8aaQ4bbTJJYHejEkA+y/6OVQHRKecNRjZwwybtKpsc7jTN4SJOAHcTmIVrN2z/
	vKw7N7G4c+y+DoFcfC4imt9mRXpiS49zaP57Y45h22rvmUTvnPJ2NxQ4jn283YYcf2r8hPpTp/t
	dFDodIJ6J67a0xHnj5j9veW5k1IUIA7QclfPCf5p5ezj8EsM0af0nunx6jPWdkX3vnK7mqPuiIF
	TtN4oyURuuz3+qq1B7Wki3AG33FV61tnTPuVaudtX/c6vHoAhqbgxhBYwHWxE2y+LCWdjiVOm5i
	H2RReo/M+vY0itmiqzdYpLGnmuhvIwqBigVxnM8w9f1Joozh5d/5MABAMRsDaGFLgukQWzIZoU/
	mOSB3LUTe7e4Y5NYF8Kc8dKvTm/3Qlkxd9XsrLW8Sw3IxbA==
X-Received: by 2002:a05:701b:2313:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b4f5e7503bmr1295818c88.2.1794459166892;
        Wed, 11 Nov 2026 20:52:46 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm5378660c88.4.2026.11.11.20.52.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:52:46 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: icb@fastmail.org,
	linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: Re: [PATCH] ksmbd: fix out-of-bounds read in expired-session LOCK check
Date: Thu, 12 Nov 2026 11:52:38 +0700
Message-ID: <20261112045238.4688-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <MESSAGE-ID>
References: <MESSAGE-ID>
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

On top of linux-next 20261105 with the four newer ksmbd-for-next commits
up to a4277e7b7682, under KASAN, with session expiry forced by a
test-only hook as in your notes. With well-formed requests on an expired
session, before and after the patch:

- an unlock succeeds and releases the range; another client can then
  lock it
- a new lock, and a request that unlocks one range and locks another,
  both return STATUS_NETWORK_SESSION_EXPIRED and change nothing
- a compound of an unlock and a lock returns STATUS_SUCCESS and
  STATUS_NETWORK_SESSION_EXPIRED
- READ is refused; CLOSE and LOGOFF succeed

These results are the same with and without the patch, with no KASAN
reports.
I did not test the malformed request itself.

One difference, for the better: a LOCK with a bad signature on an
expired session now goes through the signature check in
__process_request(), so it gets an unsigned STATUS_ACCESS_DENIED instead
of a STATUS_NETWORK_SESSION_EXPIRED signed with the session's key. Patch
5/8 of my v5 signing series fixes the same thing for the other commands;
the two patches do not overlap.

Tested-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
