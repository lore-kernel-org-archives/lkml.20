Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740433;
	b=fE5SfpRJ4erPXf3pn0qcG7jhowKNfREW7s2Fv5GqsUZSx32n9ggQBZzxky0QgLhTaFwL
	 n9h0WVpIvJ7uJYHO8UQ3ZWCY6+NfqE2SBPXBXy0N63EUu9joB8buQmOiFh4LqkTDHf3vd
	 7Y4MASrjEMhNYkiE/hn81lolRV+opduuyuVyL3wKJdy88Qxualul1fv11bwEgRV52ewQC
	 K40aem5udFML94QzWcjqNRXg1u3hDHi9fTL7tU56YICldMbKWMPqx649CQRAHuwBmPM5p
	 gr+e4JiESgHyu+ek0DvzlQ9lj4KKkSSFKOFyIk+9xPCdqLTpw7WVwN1dons7RFYNpug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j+CzPDafxCj9fZ8Cq3DLaNwMhYmNWGXJCSroxfgm+X4=;
	b=GZYYLS60DX71R+mv87Fvg37ehUIMouZQfQ0SY2YE3t+r7q2i+meTLII+Q6CDRB0fW6hu
	 DBfvf1LAIdbjQu8+2mWneGcLgrSuq6sy16/3c6c9XdHwkRvcp4APRaMQRuh3MmyHsDsm2
	 EaOLisqZD0FWT+Kl/nNS+bYoGed4f01xn0+7ZHl2fKaxX+s6j/P3RajpfojMMMGVue3um
	 9lCXZ8w8ogGcPhb4Hr5BU8hYsstiNVLlr4yTryr6U/JakOz3zsRlmu5iaf3HvkXwMk57+
	 0qKOqxDYqgvM0tN/kG1QW6k51XGVV8pKxUnvAmlaTd89H2g/Pu3VbtzgIp8b8fjC7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTsWmL3Z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D0606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289D0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTsWmL3Z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47069115e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793740431; x=1794345231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j+CzPDafxCj9fZ8Cq3DLaNwMhYmNWGXJCSroxfgm+X4=;
        b=wTsWmL3ZHIIOBiHw3gbuOC52/IfWm3h6XXc4PQN2CH78Q3UkowvPO5Kog2uQbB7sOq
         CWruA8GaUHCyPy1iczpY4gXbsgHDHpdoCxNHz2JbFS/1n4jzxteldQaZ3u71PlsoeQND
         PCewtlMU7XT+tlfbL30Nkv2LIUQ014c0DZu1qbyG/7zByfMapztddxKoCovFnxHAVKQZ
         LTGQ25H0i7zYbKYdIAZ+QcpMKqpBQFtRSQBL+T857cNAPal4c3mCcw9xJ8nEYGDwanyn
         Tc95G+8jQzNnXB/ikhBOB6ajViTdAczqTH1+v8m9ypBocwyuEbRVCGSegkUM43ZuEk/L
         W+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740431; x=1794345231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+CzPDafxCj9fZ8Cq3DLaNwMhYmNWGXJCSroxfgm+X4=;
        b=P4wqrN3y1I9HnumZtavZmHzH6pvkMVp3Q6UvXn474IbpO1J5HLSGy5bdaRIxe2RJdq
         4J8NF4bjo0/JwKJeKjVs67++tix2GU3tYGjzvV3vZHDD01xJihKhOo/wgNaTQ3z5FrzL
         lQ5yx968XHEJ7wj3YIwvh7x8t+D2o6JOXaC+zjmb17ZijD45MoLYHpZF0Qo1j+yzif4Z
         dox6IrtCVX69/ydTF66hmQH8KhDJ/KPhEV1wHkDNwAp5qgEBPZuCyCIlyOlXaZ9mkqlx
         /mrGWSpl4PG2JiegT4CMCVzTr6Q9z1AzX/p2kisEjzn4SQ/fSidXyII1OTCk5WleKDgq
         Lyvg==
X-Forwarded-Encrypted: i=1; AKwUvByC383zyziHjfwUutKqq7m0hvH5caXLIszgEV0jafgIIY/5sYpcEqD0ni9228A2PkguQ0UQWGQQl+dWBOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/alNx+QzZMRL1aBIT3GkA5cPHkIRFzDfGu9Rf1YBxfZdYXfpXk
	XZ63JZcFo4mVYkAIZUyHqj/+htLxuOGTpLS3xlAxBQIKkEAIkZ6a2Wo=
X-Gm-Gg: AYBFou2wwjbgzmykRQ9bdxCjiWCLUwhUep68sPUlCZ6WISk2nQfuGPcTBhCSY5b8lvr
	UxFWzZ2/f4VWe5O+/1i5TZYhHT4RTzhcRFXApeI/J43v9p0yWgWO7cq9MayTDdBn+C2NRWvTkMG
	NcNBU4khRpp868sxzKgIVPZ+ewEu8ATDKSKs7yNqATr3a5h503OPIbK6ULKKTzbiqo8yhx7yuHD
	G+hQXsNiUD+RywrwyoAtbWMc8ruu8mqNYjN1TPIZ3DF6ydy9LQtzzH5BIBHgv0HwrL5AAV0DVju
	zwQ9pl4DSXFuXQMS4U4RrbKjyeJshlB2nNCqcH10x3q5Yo3VohV27qOOGJ+w8AzqWYBc41fnE7Z
	ohf6Vvj71XX3hLWK1LOP5ancIwoxgZI1s269nvBX1/szr3EtNFtFpQOAzVT2ZgeOcM97KaD4sku
	v0351uvlAtPQUZ2tB47eZRGQ5tnovAsDIBPbEs7cXwRI8QGunXdA9dt3jzDyIydXPSLNCPpTPPa
	EP7hqn5maKUl7lKHkUEd1IPkH0h1o/HNbhZrNqmkUnyxkn6/t52HmPQGifpulPS7GO2cs1wEjVC
	N8xNcx1CA64E6EG9SNzRY2saOEV9W6vxBCvPUYw3zsw4qh/tMiq9uw7XhvqoH1tzZFq8Srfpexw
	=
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr364511255e9.11.1793740431324;
        Tue, 03 Nov 2026 13:13:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:8109:9d9f:2700:6d31:a289:bf62:2372])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm125728205e9.15.2026.11.03.13.13.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 13:13:51 -0800 (PST)
Sender: Akshay Ubale <akshayubale.dev@gmail.com>
From: Akshay Ubale <akshay.ubale001@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Kees Cook <kees@kernel.org>,
	Matheos Worku <matheos.worku@sun.com>,
	linux-kernel@vger.kernel.org,
	Akshay Ubale <akshay.ubale001@gmail.com>
Subject: Re: [PATCH net] niu: bounds-check phy-type and model VPD strings
Date: Tue,  3 Nov 2026 22:13:48 +0100
Message-ID: <20261103211348.39521-1-akshay.ubale001@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179253979539.3290.9924821446681218748@kernel.org>
References: <179253979539.3290.9924821446681218748@kernel.org>
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

Hi,

Answers to the questions about this patch:

- Discovery: manual code inspection. While reviewing unchecked strcpy()
  calls in the kernel, I found that niu_get_of_props() copies the
  "phy-type" and "model" device-tree properties into fixed-size buffers
  without checking their length. No syzbot report, production report,
  or static analysis tool was involved.

- Triggered: not triggered. This is theoretical, found by code
  inspection. No symptoms were observed. Triggering needs a property
  longer than the destination buffer, which I have not seen reported.

- Hardware: not tested on real hardware. The change was verified with a
  SPARC64 cross-build (gcc 13.3, W=1, no warnings) and a standalone test
  harness for the length-check logic.

Thanks,
Akshay Ubale
