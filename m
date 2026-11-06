Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009586;
	b=oGTQYGgmXFRdGVlAJbjRxUuGTRjHgoyNJww3/sWU1wTJuD6kSZBnS998Gy5knx9P8LLm
	 HdX7TfuhSDGuymzxh11eWZBQ5eweOGydHBb44aqN6fjvvX/puXuSxxKGxdUQ5T+Swd33C
	 ODQp+a7SEoz4efxqEqH+luy8/dINtfqBeNOjuxA+/99A9zUvKGv86dmSlxNnRyN2mSihE
	 nOTXauXoIS5dwFKXWDQkua4h1LqOD+VPmyR89EM3jcQK1GJaWXW2e05eONhgp7tbYWgoy
	 JYRauzc2HJmAjOkX7enDeGH9dGZiKfs24Ec5m5TFf36j/psKfnaE7zTrWzw1hIGAilQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
	b=CAbAmp6kHAGJok388Bd9w6ItR6a9aD7RMZCgEpTRiWyDRiVShmg6eMeIgZ4j6yEQaDaR
	 pO7hfbw4NbcZealUw5ZVak+5AToZgy4BvumIY1lT1e6ib4N3yOozWh5sLH9v7WRpd9sVP
	 UsZsoN4LDfQsavyFBXzLt5Fx2HkmsbIVbiYiVkbCBSXHED/GZ3or5w9YhRjAgKXfVr6+5
	 0uFFO1SNwyEZdlQFJcxHtRmNyLOLF9/pyoGHfe17ddyBUNhcfq/oe8G8RMUqqLMZ6Yg/T
	 gPZo1af3Y54fH28ocT1OAn0AyntLw0mH4YQ7vR5U4rD72aYIBAo754roVUQWYjYETQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/ICyHcG";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D3606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855D3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/ICyHcG
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so962388a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009586; x=1794614386; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
        b=h/ICyHcGMWHc24f+MituXdi7xwjGLeaO5ixga8lv5LhPNuARERbus+LiCh9/WbcdnL
         JpKYROxmeWOC8j8Zp/ry1ei1nFhKcJL5WcKf0jc13ynA/FsAIPy6mNFVlr+ll03o+F3c
         plY7RF3Y0KY4BON5W+HhLYmbGYUOoSGkISKCNmd+zkN+qjo3gaGzS/K9PO6cWDxeK1U5
         RXLE0qONQprr1Uocvf2/CgcFfMuTU9nQxbntCEKvKCYV4nT6gtWzDCzzXfUkoCEi8f9C
         i3flnmKQ65DDmln2n60CaEYojKnRboVcOyUuh9UWceg2HHdZGaJ3IQHp/RwHIaD6D+Mj
         AT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009586; x=1794614386;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
        b=qHhUq/cF485JKiJxaPKF/Q/bpIMk0kVVyMEF1E6AWCygW8F37hC0G7MhW/fgPAmAWd
         ooclT9f083IqrJuEaj1agfWFuAwRidtp8n+EWCOS8NCf6dlZvt/HjB88BhQJLBizruhH
         LBx19JaGr36tTOu8T3dEtTLbxIFEL8QTxOFASUMxZc28AMQr/1BmiWwgdFATzT2B4O3D
         iZOI6muyndTpyO1dDe3LtN1mdxn8E76uiLMZ4Q85N3U91sRtDk/WRH0fQNAJ+jef2PJ4
         /HQdihbgEliAnWYVEQvEpoMgxeZ4wDoDismQEljzJeoyXULJRM3IU8uMX19lISkNJqps
         0vsA==
X-Forwarded-Encrypted: i=1; AL+hErGv3Bb9McQfjSsYLZ+MCSwnzfaneZnsaEy0CrpiVu/3sILnYHIB3bTZufdAys+4edrx3zK1sCrvPtIPF+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LUOjNN05TEq+jPu19aWnVeS0xlh0zLf/6pYRyqau2tWG1p4EK
	TDcuWlk96zEwVNjcjYd7BouHHja8F1tvYnQqps55gOxNOSXZfB2GmKwk
X-Gm-Gg: AYBFou2JJ4yNj9Dwi0CqrbdYHIB76NM3jrVEOdZmU+E8uq7SN2GyKO+2lWvIeukOGrY
	GSyrRkJq9LNXoJWh/ZgG3PkUVWsZqe5IriGioOte68K1gZQOS0razfi3bblqbtyE1ViywPDotG9
	XCqT3qMQAiCZqdCYlyQuoGtttrnrQaQ3ohE8CE3PFFxwTDynZz6QvZX391H56IdGCnqeDyCZDZC
	dBmL6Aqx4zb81mMh5uvnzg4LydZJKoDCVzMyGRlJNJpwkgGqzHsLHhCUp4gKx2hZeYER5Dmg6EO
	Y8r8k78H5PCk0fpRrXhUBIeUju2tqSR4rzW+M6hO4XJG/Zmzh1N1YgeiJyGttTPV3sqoN7z6uwI
	FzeK6padRlguXx6lAd0XQYCQXyztmUA5nbGe0egmGBDpCQOUd7L0wuX/0iGvu6BEkaS3eB9OpiF
	odN8g3Jg2bo1SRmA/0R16fZFA8hpvAyud2tl/U8MUhWXh099emDRfLd9EzDd8+2mJneuh7edeGM
	2w2Xl1ROXggYKcid8UQSYwpffbapxtPNzeCglq5deBnw/crwBZ5
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr4130726a91.25.1794009585770;
        Fri, 06 Nov 2026 15:59:45 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10581caccsm750767a91.10.2026.11.06.15.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:59:45 -0800 (PST)
Date: Fri, 06 Nov 2026 15:59:45 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
Message-ID: <duplicate-notice-20261106-takano32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Please disregard this copy -- it is a duplicate of the series sent
earlier as <20261106234541.1474324-1-takano32@gmail.com>.

Sorry for the noise.
