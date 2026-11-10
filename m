Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278036;
	b=CdyNF7LuuTxdGPXo3GgctnkPZw//v97xGpxfjEm4ycVCE+tXl0hfaIyybwVPTWHz9kit
	 +fgIz8ZxQRJIeonh51RiUkxWCQ8X/dUQqVUL6X9k/09rVs2ej+byAKY/wnNskaguE1dEt
	 p96KZtdvX58t/ToDJpasCLVNmre4zTsz/QBaQb3SzF6v1/HbXQJBOHnVloZ1idNApvkyG
	 9fVCX9hc8IXE4thbvE5y5HmnAP8qx+FK8duhBM0hdF1FdRLc1gv1X2qdRGLDa9By9Wy9H
	 StLolHSzT77Q3az7SYmT3vBLIfzzYspiNwASuIgMseDwrg0rx0hJeLoQG2jQO5n0cuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=onDRaLguTUW2a83jMl1YZiAlaHNlpOxn5ahgZIssCS4=;
	b=GYBdkbXGkdMx/jI404eCVriOhr/3LKPVtx03k3AWLIWh6GR1VVjqqsyBTkkuNbY7PATy
	 FItTTVakAtb5szsDvuL3eXr6IMz4WUfeerI/8dkpzVy2KpVdvUGmv077Wpd244yqTRvCg
	 csmbJDMB4TXtrkDgiY7liwueJVBZeKuhctxJEPyitOZhzXJ0rD8eObQsOyuGuIz5W+hbe
	 oLSKRFyveMe3Aybag6lYifmy84jW2c/d2bPbegCnXIjOEdEpIjO3pVHKfF1ra0986Xb7C
	 87Pts7RaizUorafwUMC7jEoIMUNOV6HU8aTY4QGMrpCGwdoDYxysrrtXbhvI10FjDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1obDVAS;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89609606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89609606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1obDVAS
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2d1b4a83aso467347137.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278035; x=1794882835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onDRaLguTUW2a83jMl1YZiAlaHNlpOxn5ahgZIssCS4=;
        b=G1obDVASqefxB6poYdjSmxCFHjae9eYxJSNGGnlEYlbaEUEJivW7JDtmuGERQcgQmN
         jLQt9g2DSx1yyia37PP/ykKwYVfjHoNMpAsBsWcx1xnqRLrrH9i6dHgRXVgwLRphQ3mg
         Y6aMvkPKSa0PJn/FT/cPJaxDossiDDXv6D6d/28oQy6ndp/q9nQBiOQYer/iTR21B9JE
         Xr+gk/exekmfyJoJTVs6SVqVjtObZYwFB8IzkdhjCRTYi9wYeI0qdVL1DDvdM8XQyPki
         oglumqrNc6J2a2pRN8Z7kaLNm6XEJZwSAv7/NPRMsrQ1PX8GwtTNfs5q91PjawEY7Mxj
         2T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278035; x=1794882835;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onDRaLguTUW2a83jMl1YZiAlaHNlpOxn5ahgZIssCS4=;
        b=nidR5qw4bDj/h1PtUpXG84+g5QeHjxECxwRg+bCajpo64dulfOoWTgSXRJSNu7a2VG
         cTIALp0Q3Km+GCEGAgVsgefOi6t3oJRsdZnNFpKQcJizhqjSQ2XK0wWX6rOJKAL7gzUy
         LR8LC3nirH9HQrByHSaJpWvG4DkHtIkSrBN+bRPopKplx2Jom0bM+cSCUr1jEy17Vesx
         40aZ6PwJr9+1LlWAIkx6mpLQseV+Et+ijaCOSFXrfjrhAvbc3WDs0GqhdhzItNSKDbNp
         AfRYbeXpk6sGguvqERQtmsbVZFFavcuA1EWCXFTJQxJ/wERu7T+ZGUcF7A+8CV88P8LL
         9JIw==
X-Forwarded-Encrypted: i=1; AL+hErEiry8SwnRv9nTCQpAjnxOHs1brtniB2bljh3hIP9PHcmO0ltIvFdrCqnrBQ7M7HHOHUZyeVb5hN1lnEcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MER3R8eaFIm3sUxhy8dshXnLxN1cGH1cLRe9500UxnDACSpV1
	fHwHrKJQd6f+M6A/dBVCIqe3b8ZsxEbOnUTshnAxXsoizaQXJJfZZ6CP
X-Gm-Gg: AYBFou2d60sRgS9U09Z70YrXlhnWbPkDeHFPTvjmEYgqYcnchU4GSRko/Ew5+IZaR6j
	FzMfznMLITVmNa5SE2unZKLUENyGaZlJSUWhDrxHSWPYdnPxsSO1VirVrK6kYWIhXSAvlmdKkoG
	y65ylDu9xTyq2ypqnNLM1HsP7EtxnHmNxDkLEZx3atdqDvJrC0EU7ADnTIZOKuTiTA89ijHbuT0
	g4uGrnXjVMrde9zPUkOluP74pHtGUyxAuNA78g9xuA4tigOLPu5vOFsJ9Pm/qB8wmWs8YLwFROH
	c9AssXz5MxWAeX35Z9dmNU1CsWhNvEeNdXv0pR7d+plI0BslC3ORT9zjP5/E4E46v0d1lv9g1iB
	MGMW0avQfbuu2BvMWncKC5Np7rjHrncbxaIKlSq9mxT+FWgCFHAJ1/lxTu/+GyD5ZsdwWQK1D/6
	bf6NlqZoWoQYqpeg/nZbBMWWkO5Y3+vv5m5d71iZovBWSulw50fodXluVPmuCt2RCS/AKymDRay
	UWabJW2yyn8LNfD4gKRzuscuxmkXE+8ztjh+9WpCZjvCTIfkpYpcqiNAVD/3C7GtSak8otun/yC
	ra+UrWthhXyooFmEB9D0TyZ3EgjvqGJ5aJPbnfE1PWWPulLpw2+3IwD+tKHhdyVWb4q+4IZ0hCf
	vIDR495oUgP2wlewkR4Flj5XNnJ4m3dipl/ujQrCB15T5WMxT6uTtueIHcWFyE5XC+yaq6PI=
X-Received: by 2002:a05:6102:2912:b0:7d2:7c63:5a0a with SMTP id ada2fe7eead31-7d301bcae2cmr373574137.23.1794278035436;
        Mon, 09 Nov 2026 18:33:55 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302359221sm877564137.6.2026.11.09.18.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:33:54 -0800 (PST)
Date: Mon, 09 Nov 2026 21:33:54 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com, 
 tpluszz77@gmail.com
Message-ID: <willemdebruijn.kernel.136b3b685931d@gmail.com>
In-Reply-To: <20261109014400.9025-1-yanxia@cmss.chinamobile.com>
References: <20261109014400.9025-1-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v3 1/2] ipv6: fix cached route reuse for control
 messages
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> A connected IPv6 UDP or ping socket can reuse its cached route when an
> SO_MARK cmsg requests another mark. A packet can then bypass a prohibit
> rule instead of failing with EACCES.
> 
> ip6_sk_dst_lookup_flow() reads the cache even when connected is false.
> UDP clears connected after parsing IP or socket control messages. Ping
> always passes false.
> 
> Only read the cache when connected is true. Ordinary connected UDP
> sends keep using the cache. Ping sends do a fresh lookup.
> 
> Found during code review of IPv6 UDP route caching. On UML, the same
> connected-socket selftest fails four IPv6 cases before the fix and
> passes all 54 with it.
> 
> Fixes: c6af0c227a22 ("ip: support SO_MARK cmsg")
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Link: https://lore.kernel.org/netdev/willemdebruijn.kernel.1e0038bcc3ef8@gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
