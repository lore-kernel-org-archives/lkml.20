Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093248;
	b=iv1clrxVtysH/CiNobdl55uLOtc4Hd4zzp/AgJBGU6+fe8glzz1GieHTFQF/0Q+E0WYh
	 cGD0aBwCFkzg8vD5AKlnzzo2kyBVTMJl8bw2NZv7ZrkMgdW9r39EAyHOAFOeWXSIbGXBD
	 8JinMkqMJBedWVYNkmYPYaobC/dpz72OqqNex/bshwa8qkXD2qqDmdIMmLciY8xk7MKmx
	 s2z+FlwrzEQ95OlIexOaHBSLb1YPKoqmP+V5O5GnwObo7j8IrM6vEBYvyLSgGvDASsX4a
	 3CCoMNv372JWwHCtj3abbzSAYsZhxAgYvRaGmsgTKuFz+UPQQbiSEEd47PUzYXvYJpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NO/PULJuoH8GueUl87hWZsGj557aWTq0iq+P8FZEMew=;
	b=OXz7vszUVJq6pBAuI0WFdcrz8i7iO5o1e+596SouZNANv2VNuHdOKyWB6Ov7BsFp/6rC
	 BqmcR0wlmqP3hXpFDX4kosBh3YT/0NL/ymzKoccouxA/USwzUytKEO0yUrXBwMuEW5UR3
	 12OOJ0sExhIgEPUqlHGc5xVjyQ0JjvB9PkHozBs5iVoxI9wGjhTtskAEhYCYid73mtEyd
	 3a4r+dC2RFPDNAokNsx6LedVHn+Mhv+G8S+ynQGO5IqOPmfCPyE36XW2s68XhMIW6vlLo
	 PXaql0cvBOo3uLnMFdOprD4MtpPAy0IWopqQpZ8QfYgiujLgssmvB474+5qjxgpnQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rtA7yWz/";
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF5606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39FF5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtA7yWz/
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so4814280a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093246; x=1793698046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NO/PULJuoH8GueUl87hWZsGj557aWTq0iq+P8FZEMew=;
        b=rtA7yWz/OJQELSB1HmzDG3zKW06pzYRIBoQhVr9HylKEpl/8BpK2yi87g1x16ip+Pi
         fL7L7LTZU/P+LP6tqSBF2kn+T3PkbIfav6AB+p7jJfqohB07r1R3PbJj+iHSDOfA2lkC
         Zo98+IGjED3QcvcZfTPyx9AkDAhssqZbALgRPWpyzhQ5XfYz/54hiiM5bcbgRREcz91j
         r1fmiKeQgLmKHQGkRW90lyoG1oL9Fby0BbWxiRMH8PoasiIzLMc5HTazYLRzyjMDVEYa
         m4F2fy6M9vyjirx33RfXRrSwve2RUm0QyLdHG+qFq6/zklsWGKJZJvNL6FZccBRQL9up
         L6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093246; x=1793698046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NO/PULJuoH8GueUl87hWZsGj557aWTq0iq+P8FZEMew=;
        b=V3PF+KWI18cSKrWneOvPhb914e/lf9qxWyGzzYNre1aFstYMF0L/Ed/Rdm16/XZHFD
         VDXFbWN/tVugpHKph4Jm79HlNG/YEJt5DQBSz+jaKPg/r78om4E0oGzQWu1dYjBj7u9W
         9Z6mpNXZ1IXhwP4NEamRrxN1HDkpBq4/2SUXvdEOXdCIvlyKem3JmUr7bfZluwz7L2Wj
         /VGfMWcLMvgAwyxz5gB5jbKRjkx4U6a4wmKTPPTV+UxZS8ktgC386OJ4MUHAGzgqoYjP
         wZyaW8Pp3CKPeHYer3KZr3qzD19J3YDuYqowksMMAqQKW/N5AkgY2LOSVAprvJKN1I2V
         xayg==
X-Forwarded-Encrypted: i=1; AKwUvBzi3ojX3eNXZUmFUefwAR3mIImlNCSzjJztfEoXb1vkKOuj1wNmzOvp21713cMeLIIUZdT/j9ggzcG7utk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPMEQjEiVzg07B+e1D2DQatq6ha9cREwWiUk6zh/JoV01ycnYX
	aLoN4DiV2T4OESNq9hJkhPWcUIedO6d4zlAIv0L3KqaytpoEXtZTB2qw
X-Gm-Gg: AYBFou3hAMBaadAufNXGO81CrsQ8p+nT+xVuhw8QgMwSJ5fEaNZA7AmDXYNMOhgJclW
	URSxNXqbDS/9Cc1qv1gOIruq02AtY5O8a1R3CSAOOClaFTgKSMXTgAYAmq097s9yfAPQFpRd1HN
	RSvkf4mTpheZTbxHWl/QqV8eSkZlyHa1nexRACr+5+WKyIsdHw6cgWh7LvU+AdzMsaUhoQnUSGE
	l9+SERnxL+uhYCZ9p3LPxLKQcRg6mhWMG7r7/jBaAaFYL7qz3ss70KIDl87k5ndLt4JONCk4QCW
	Ll5jujDNlDyJWyhkrlg5Bgkzi2SNCV9+M+39BplpXUTeb6HF9ulQK8r7rRXGyKx+75LIMpip/iZ
	1yjT1bCGfAXgS0kHj/iM2Hmz3cJF0L22ykiWA7YTxcQeR4VZu42hZVnOOoJQzioZqF7nyRXWw5S
	YuPU5QlIwW4/W31yO6N2oEOeRGbxKhoWANGzbHiuDJUoTqxOnnP2OJItr2bWh7EtjJ8UPB0W6Wa
	Yk3LxU4+F/U5nD3QMl//ShY522Bm+FVBErcjy4eADHU+Vzqy1ijhCuj9RNu0Wooy+ylzRpr7viG
	+HSYQ3HfQMfP6ANiFH7vP+BFuQJUJYurcfIqnzFEZC8E8E68bRHcBsFJ75URlX8KfVdjnh+eqsb
	88TF/Mg==
X-Received: by 2002:a17:907:3fa6:b0:c41:f29:72b1 with SMTP id a640c23a62f3a-c46bdeba202mr1042190766b.47.1793093246326;
        Tue, 27 Oct 2026 02:27:26 -0700 (PDT)
Received: from CCM-PC (83-233-221-133.cust.bredband2.com. [83.233.221.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984f5sm417942766b.77.2026.10.27.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:27:25 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [PATCH net v7] net: dsa: qca8k: preserve port state across MTU changes
Date: Tue, 27 Oct 2026 10:27:18 +0100
Message-ID: <20261027092718.266370-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179268501671.3290.6623232109527554630@kernel.org>
References: <20261022155837.760-1-yongzhao.derek@gmail.com> <179268501671.3290.6623232109527554630@kernel.org>
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

On Thu, 22 Oct 2026 16:03:36 +0000 netdev-bot+sinfo@kernel.org wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The original problem was found during development, not in production.
While preparing the net-next RFC v2 [1], which extended the CPU MAC
pause in qca8k_port_change_mtu() to internal CPU ports, I asked an LLM
agent for an adversarial review of that change. The review found that
the existing sequence re-enables the port 0 and 6 MACs after phylink
has taken the link down, and that phylink callbacks can run during the
update.

The problems fixed in v6 and v7 were reported by Sashiko on v5 and v6.
I reproduced them, and the original problem with the unpatched code,
in a userspace harness that compiles the driver and DSA MTU functions
with mocked register access. None of them has been reproduced on
hardware, and v7 has not been tested on hardware.

Sashiko's review of v7 is a separate question and is still open.

[1] https://lore.kernel.org/netdev/20260922202653.1153-1-yongzhao.derek@gmail.com/

Thanks,
Yongzhao Chen
