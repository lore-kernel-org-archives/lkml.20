Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013478;
	b=x+f/XacJDtfsj3bOKJgZCKYF4n7iLGhmoFNlpgwT4KhCP4O1Z7HcpkmmMvVEUAYtxfbu
	 B36w4B0d49/eb4liblSG3yXRKBtRR3mrsgEuojuw/QQutq8vmTEDb6E9fgyKv1dzPQI5r
	 2ZXVn9wooHzO+120UemjyDTUlHY0ErQ1WHtuUaNTsV5lZmELFYinhz799QXX95Sjf9Q66
	 Dcsb9U/wmAUa0CeeGFuVNUqg0+0ATfz41VXrMVeyMLyx5DHFXlOSNeDyCLCIScCPGcXLL
	 TBQ0kbpqZpEcAjjgdAfzsAmyzcG+cnjUmMM1+WnY70R3FFgoXzl9X7Cfbx7YKGirQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=NRIkuKUZUAgjI71v50t8xrAuxWFu9ma5GeG76B0scz8=;
	b=WwCH9JTNK/ygEeVZFQNEhnrkvrVop2xSYlvla/LBc20YnCtCVGPslN6JetVuimDXbdd1
	 xN1P8dSjEUenBfFTOizp/90dC0zh70Egip4z/pLMFW76fntu9fDekRTs2l6TWmo9MCiW2
	 kkqFJkByWS2UKWIkqm9pm3a9iVVePNyC5cUoKeGfSQg+TlEIavZH4l1vBAfIofEzZurqC
	 j8lK8tP3y9fw6nDejeQ1+TWIz1sD8wH2CedJMvalYt9enQuBI206g5t5KEuldYK9N0orL
	 cU7lLa3CIy4kNM7jTF/HIELPx1kVvtrh1RkNn6D2SaDeY3jsxrk0KWQVgIXchPEMpzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LXB3Xngy;
	arc=none smtp.remote-ip=74.125.228.2
Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0020606A337
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0020606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LXB3Xngy
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so371741a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013477; x=1793618277; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NRIkuKUZUAgjI71v50t8xrAuxWFu9ma5GeG76B0scz8=;
        b=LXB3XngyrN0kmxx3Y1iT64RUtaddWXLeKcQrMXaBFct1KQ4MMCaalvTiU+Zz4ai4nv
         kthrr1nNHO95LblZPV3whXJt2IDdi9L6DAuQfP79FNpzEVw30o6xgLB+J5YcfPYdnVHO
         eFX+eIQ8qgxOmmX4E9vJIEODDTOuuHUi4dVR4p3eoTiNrATc77phrzzMplpWrU3kOY/h
         Cp5C/c5lb1/FIGbucSYyg+hZalcfeC1v90Ldn1Bf9Ts3D/Y+aJUDjIZfZXABesKPxRxI
         7u5luoM8G8OPUFZZblF4Rwf9fcHs+lsvXA2vt0m9pHO5MOKJFcsBGJizWMcbQbmfZRhq
         8bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013477; x=1793618277;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRIkuKUZUAgjI71v50t8xrAuxWFu9ma5GeG76B0scz8=;
        b=tSVR2G99DJHLB/4Vwo7DVJ5VC9r9uUkIKmA80Wm6eQOqaBTOX0xyjJrgD36WbF3Ovd
         cMvSiYztV9zALLuxxgdjW7eeT1WgxESIieF3XETqCn/AAnbUm3bGGlhVe0EngXdkGDMQ
         maVOXN/hmqy23xWXGBP5M2W1zhoGYfKsbFRaAOjJlZex1lO96JX03CzPDycEud9p0ScG
         hdRDX/E+W5umxcjB8OGY6PI4uTvY+6Aw7YASKS7IGdwBr/4MRnUTw85PZdnQ1nn7z3QW
         j/LcCFgifobl+lYEB4jO8Te3obLQisFs2n/V0ngQYs0N3DDrLDJoiJcWzz6QHLiCpCO3
         227Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1hSCylCp2FruHFGcwZGTA052Bsux38kWi/KcOa4x5criZjPVYD0k4Cw/OI4wciNBtHnMDsKQVfMDbP3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv4F0RutLqsuJZcRVG9h+ix8e2wRaV0JnT9J6J3W53Jq/HutZG
	KlZxTEky5UOx9MF8lB3BQiqbK3IG/yStRiGUJrSkxyZh9Uv8hnHqhkme
X-Gm-Gg: AYBFou1fpDju8EAleQucmqqI2mmW5hodVFBLRSTOT1NZOSJpOITQGZwOCsSrSPWIcW1
	Cp3ydTSwEFud02bjbWFTgHF4twQZSEnXZA5PYkl6cf9EYuuwxvcdBcXvmJ4WjpLFhvSaGJqx/2G
	olL1Lj01oAiXD+tb0YPvHgqY9Mnv6pBL0inZsTrEfccQnS038myOEnBldDDzwCQIgNsESvKiE28
	EkllcfA5lN3pvt9B77Kp5Kc2aMQhEuyHYyj4yGMpyd1TG0sqSojwSfhMYdksqkWeeGzwjikD7zb
	pEh9pELfQMRl9T+AIaT8dUPqpD/N70K4/vhEPCePhkC2kZpRsci6RcLsiGVDxctPuiC8+BG2yzg
	oeITejqAEbcEedQMuwjS4YpigUCBLgDXYa12zcPRPTX4S2xS3yJa9t4Zkt5yuq1oRXgpBKOx0hi
	jfN/o4uJud9UuXjE//YfHtSvkjhsdpbmNXF4YZp1oGhwDCh4xoGpNG0QTFIUYpldDtu5WB1rPbk
	QMqdiTFREJUdptLArBihYNJQL/GWcc2pO+0hoFRlpWUtzSOIb8onqr7wyrw32iLqY/qYt+fIkR6
	hKNgueSZoJ8SKxI6k2DQrPYPljf0WWTyfTb0LJd0tGRZCVRoySWIxP5tLWFqUlKEPqFsaStBPps
	=
X-Received: by 2002:a05:6a00:4005:b0:8a0:2914:5d27 with SMTP id d2e1a72fcca58-8a369168952mr5053901b3a.44.1793013477084;
        Mon, 26 Oct 2026 04:17:57 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36acadefesm1240756b3a.19.2026.10.26.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:17:56 -0700 (PDT)
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
Subject: [PATCH 2/8] Docs/admin-guide/mm/damon/stat: fix pronoun agreement
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
Date: Mon, 26 Oct 2026 22:14:34 +1100
Message-ID: <179301327249.2.17530814278215474568.damon-docs-grammar-2@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

"converts it" refers to the access events, so I think it should be
"them".  Rewrap the paragraph while at it.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/admin-guide/mm/damon/stat.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation/admin-guide/mm/damon/stat.rst
index 4a9db755a526..a93609649a5f 100644
--- a/Documentation/admin-guide/mm/damon/stat.rst
+++ b/Documentation/admin-guide/mm/damon/stat.rst
@@ -68,10 +68,10 @@ estimated_memory_bandwidth
 Estimated memory bandwidth consumption (bytes per second) of the system.
 
 DAMON_STAT reads observed access events on the current DAMON results snapshot
-and converts it to memory bandwidth consumption estimation in bytes per second.
-The resulting metric is exposed to user via this read-only parameter.  Because
-DAMON uses sampling, this is only an estimation of the access intensity rather
-than accurate memory bandwidth.
+and converts them to memory bandwidth consumption estimation in bytes per
+second.  The resulting metric is exposed to user via this read-only parameter.
+Because DAMON uses sampling, this is only an estimation of the access intensity
+rather than accurate memory bandwidth.
 
 memory_idle_ms_percentiles
 --------------------------
