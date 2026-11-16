Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855514;
	b=HgISakmzcv17IgMo+TMnnD3B7vtv+HkYOBn1XzBpcrGwrpLaGCkOkqvITCTN4cG2Ho4h
	 eZvVGTa18FCf5nteELidykOFIYiEGmt51dUAlyC9OwiwqBmhZGKpV7NNjAUduuDeBM4sD
	 aOYsVzPGSmiR8iGHj8VA5vyR9cFnyAEPxRGx9H5sqHPpzcBu3cj1xTIxxwQGBTMet28/Z
	 dnvmFFzHby8b1DOM8e8I+0OKvTvSDUCWOt9t50WmgbDKpuZTIaL85k3LG7VnHoKUWXWxj
	 33g9ihj7KEgEnVHEqcBRwysuxXE9Nyww8NlpBAL9ZSyxLn7cKuQzRIBRg0J0QIbdCIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Yq+81tzcvFtzwxZ9prKRvoMvynZEIyPdQ3g6La8LcCs=;
	b=2sj2B6iVrO0s4tW5hxXuQ/0oVMJ5Rtf/3/LgCK+O1fgawOvE1s7q/5scgX0aIiXx5ccj
	 xHDNQm03PS69iAZ7qbJfTyZl68EvdU8+OyC9XgsEsdZvMuIXWNBodPa8LQwWlCqK7rFnk
	 Byyqx9FDyNAcLzoJirKReM5AOyCGO42Nj9CQa9XNSsY2tdTPSB8VY7rvXLaIzYpuVrIoK
	 dRy137sD7ZTH4I8TgOV6yJ/ozdODGCOki2xZ57qh5G9WhPQsPwN80mpp4ABsM3SDFz9x4
	 Ar/3UG4DHVhs0zRspURlO7M+kyPaX+VmjBFZAevytFxqFIPEBMxJZBGH1ShnaPIz8Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHH+eLJJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F599606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F599606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHH+eLJJ
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91f0b9f0b1cso49334376d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855513; cv=none;
        d=google.com; s=arc-20260327;
        b=pouUyOUXfMkw5cRdTH52obpQ+jY0ghMTpAhoeC/BNQ1XfDKWAQmp+KpOOYxdcmiXzc
         3KVrMHAXBkVLQX6MKKksDVzguCRnBtyKZApou6/tOjX4TQ4ADbw+QrBhZnRyTZjOGS+h
         TX8EdqAw8LjU/tcdlOMwYCsta4ANp2QJ3b9F+UnAB39luTlm4cjguhgHXHZaKNne02U1
         hHdsoV0Jy7a5SYD1WJG7dQ0xJeXA3OqhI9VZk84Dd8mwZIkMbL8R7nfcUm3yCeBmSzGQ
         YKt8irmf8Zt2RV9rWNQnpBKPQVsnQ3KCag9DoBJsYljCC4FUobt+3yOx+NNMqP/C8g35
         epqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Yq+81tzcvFtzwxZ9prKRvoMvynZEIyPdQ3g6La8LcCs=;
        fh=TFjadq03qTetsPIRWZ2rAi8umdS/UM0St2ofVr3CrXk=;
        b=SQYqEa1bmM+qoIhzBmKVZ5mYfSYmkkcVOR7oqHuHrIaMbsBw5pU+pCTGvri11JLAXD
         RS5ZB/F8xKUO5MWntXBXeglCWjmE09XBYcNpHzW0Oudiys8QmsKikLgmCEwX7B1uGhsP
         rGhpGGO8kv9QOdFSYw8w6ch+aSBs7MqT81edQg7mNf0cSzM5D3uciEGUxmu0kXNGjAiQ
         CHDfocy1S5IiIO/jyvq3TH2k7fxis0s7qu7lnBpYJ5/ykQlAMak1lJeFmpAM0orxly1P
         j9i6dT6BgMQC6BwuNrb26gAJGx0tcaFaIbubv8AoA9htM3+tois27jXacET8s3M8ZJwk
         TdsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855513; x=1795460313; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yq+81tzcvFtzwxZ9prKRvoMvynZEIyPdQ3g6La8LcCs=;
        b=VHH+eLJJiXbDqEMUkb7dZiF5nj0ZnwBE95gu6v1PG196+/v82HfsksXOIKt/aB0JXL
         KVnoKj0d+8220FihVM0inkTru++yMuAR6ns6bQo3mGNma90hmJa7MDfVZrk5ywXPzscG
         FfVuWPnYyngfD8jreLR3WnfEVuonytcjQCfWQjupbrhr/VXFb8E22RFEN/SIbl4udKZ3
         FTwiSqVhfrrPJDRAQz4/GGHbA/e3j0n5RsCOwq2MexsBtW3uqaxWK3GZ5zChu3T4Kg5Y
         nYw7LtZUeXNxzCZhrnChh+/OB6cgF79THvpiThvvzi5UO7cV9l3rxxg2vlt+dgurFN2t
         a0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855513; x=1795460313;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yq+81tzcvFtzwxZ9prKRvoMvynZEIyPdQ3g6La8LcCs=;
        b=2rCFIFDasrFruVRfMRKk5qGSDNQKdSKvl3ToUe4siUeDHIQkZPR4XbkzjZl0KnO5LO
         xEyJIV68VhRHBAjARv7R2CJLU/9sMOm733lsrPQVikCYM4ixZEhFB3AFWeDo9vVR06AA
         ic8hk+a2tXb7oeBAdx/UMaJhdb1q2a77j96HsQyC/ytDmvJ+uNsiWQdALj5likMoEAMa
         d+16DZiZL+p8t+wWYb6EztMEizk10U/ggGG2N4fnS0JQoEWqzV1NJBNdAy5dve9OeJ12
         qVWXEyrRcEercEpaV0OL3fgKjFwkMYSD66rfiIYPuKo7N1t1FFJph9G+RvAI6U2ioqEU
         Piew==
X-Forwarded-Encrypted: i=1; AL+hErGcY4a+PWJdqxwqUjKfAvMSEqq3Bv4KKCSveTVG2xOPlMfbnGWrYaIIBpgCIv4d+zBonlE0UgJ97ldjMUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nm3ZtZ8XwgiqsyxFhS89VjoOIYGXYNcsDd9eZsJUXSeM3BeY5
	SATtR719tR7Dy8YIpYHKHOwTU98HC6v2euv+4k1G3/ioGPmEABKux/J6vQWVsSAvSUjzv6WuTic
	tY5IDgWZ+AW6jeK41MSRMLIVW6rRdwwY=
X-Gm-Gg: AZFdTZcz6bjAmMrRdW52nCpLldNgYyQU8RmaiNI0R+m7nQIsAE78kx2J/0Zi6+pHQWe
	KhljkQ2wJOhuAfSj91q9ockad3CDvOgH6YuLvs2aIGY0AHMxLhw99/E/gZ3a8sqL6s9wFe25/Ah
	7t8qvWgTrwRWeMBC1oy1Id5Morqvt7GRnWQ6Pfh3t5Lfm2/tYrfb+cEWHk8fh08iwVuVsnM/thg
	EDoGfwlJD2ijHMZXw9hFAaOY6HdTBHmZ2uxmr7awcxiLUj2sbYdaRG9zpNTc3xNavHa8U0cpFvA
	Op82NhCBRghvI/iw5tvP677SCSec5BuFnJZuQIHccP+yJqg9zQAJnAHu9xMTBUPsLvDKpA9Dk6w
	fbm1rCllYgpLEztShTZut3G/+GdK+hUM8aiyPp+Om5SSpFS3Da/w5fl+9mAGJoSHXZg9VeLpPIA
	mwHMucGsu/kc6nybSRDhYQ
X-Received: by 2002:a05:6214:4018:b0:91e:ef33:cdc2 with SMTP id
 6a1803df08f44-91f241a7a6emr188876636d6.22.1794855513218; Mon, 16 Nov 2026
 10:58:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Safocl <safocl88@gmail.com>
Date: Mon, 16 Nov 2026 22:58:21 +0400
X-Gm-Features: Aa3M54q5kHAEdDuwv3JJRzzL5mPma-Td9UEdd9f_nHYJwYBGUZ2MQcbf3rVqFLM
Message-ID: <CAJtzy8+-aWrOwsmodx0912j1-TkohdKxfF1m0HqvOh4NcQUeMw@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drivers: fix duplicate extern declarations
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Safocl <safocl88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

thank you
