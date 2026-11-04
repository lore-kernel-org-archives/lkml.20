Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797317;
	b=HEzjDFI8fQvtAU1UBNINJiRMA5zXUfTldcfKZer86YSCUYuqobU5jI+Ostfi9XrkxFPv
	 bM1d5Tc1ZjUqrbo6g33dg7lrOKJo6DbF2xpiTfuZ0UqJ2EBMMdND3msBXja//KbJF7AHb
	 L2IRZ5zlQlLAczXuEbj0lV/u4+vwR6tOgcYaGYx6Hgl++DcNQVpnKWee/oFWZg5XxOEjv
	 oOOjMSdKp31ZVGO07sa9XFdiavxnNpR3TLh322/SeNc0DHSe4JtZcFmb0M2Zn/LNMzj6j
	 JToECtLVGYi1vTvnhV2f5kpSjO63zNwwDnd6CfPEZ8abznMbrp8oHl4+EhnW6sfQh8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kNp1OKGwredcYBJajnfjoxaLNZXBTsBj+yElvIWNzNo=;
	b=As9W7+KsqDHwhg0l9TsWSOTz7kDdZ06KxFjYFGW9GLpMgOJYyswstrCDk+1jszMbp8qZ
	 GQDYEgs+txQSvSx4cq+Bd14DVm4GSHgqms1d7d1V8YXuCcwTcWFSbLMSrTpgFzwHK0n52
	 rHrjaVM/1c0Xz78j6WXK7zCxAWV0NSQM3+B8lsv5Arfc+70BQjWzuKBk29iR9JQr9tzPv
	 Vb8LXRCp5R0aW5qATCvST+hEHRJ3IzgwxkEEGwkLCrdRL9z2GJmXt+SLAf5j9twJx+Ey9
	 uIxoJ0hBBGiqsi67T15T7gTXWytJqv+oB/nsl3XNvc6MYEbBpJVLpJOmc2mICyw+Hdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Phc041Sg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C7606D817
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339C7606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Phc041Sg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6086885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793797315; x=1794402115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kNp1OKGwredcYBJajnfjoxaLNZXBTsBj+yElvIWNzNo=;
        b=Phc041SgLYCqrjtXEjvGfFGBR1JLA1eo7DWMT0alOPb7jg/IIoTXYM50ovILIggbrC
         vR9mAuAYJiXt0olkq3vNux0ybiesloKRlscheeep+0VA04qfBTGdnwVZPPTMKPAbwlc5
         Vvjik3M37dZKksZE89oaJ/YkKMYroBF6U/l85WGcSLYuylPfbbkHkshDRFHOF3lAfgsw
         54saGgWwrjXV+eSUFbvJfWe6I1VedSDuE+lYfjgDNozxxOgdJumqv1eQ2BCEUbLna1q1
         4H3zacuCoAIuhpx7LiSb2kwx2WeQN9zwxo196JBIdrVKy31k/hQ5PCwZMGIHKrHDYTsb
         khNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797315; x=1794402115;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNp1OKGwredcYBJajnfjoxaLNZXBTsBj+yElvIWNzNo=;
        b=Q7WBYN8PugujVlJihqraDSD83IobYaZjAAXNBrqSChNYnZVy5XnlRU9gdhUm3PG487
         IrtHjKQkuXGdtL4S5NFxleU0kYlwcZiiNmorehVQZ1I7Etccr7K5hVB2YXyioOazuLdJ
         OvceH84hB6dCfO7aEAqPeUkKzCmgYZ0NZwqSwOgBbEuqmAQsBznRpy9L5KtVqdkGohnP
         LBTc+kH1PcSJ31eaY+SjIR4N8bZ21hH/sXTmJQry++tskyuWso26qRKL8utUneQRXBk3
         /bqd6BDMMGO9O2eh116yBvyYlsuIblXPhiFnvyuKHwLJC5s5G3st5EQr7ktB74rX1yWd
         PDIQ==
X-Forwarded-Encrypted: i=1; AKwUvByZePbHd7K6RMhB6Oc0T4LuwTuRd4pnmTOTej1jw03j0C5EMIaqGdx91NpO//Ig8ftdMz5IiZPfIr5Wufc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x80nsCan2gdBXB0vtYNIbhGmpFdrKEyW3b0lSr4ukLyMg92K3
	5Iz+7aLoktOHwpi5u3atSUVeHFIhf6gvpEMlHySYmoPFelRTGwS9r8A=
X-Gm-Gg: AYBFou0xbumlztMyLsUjsWrx27vAmb2iPlSQpc4vSVsZloQjm3dPbCuFdHfB5dJJU8X
	7qPtLnRMVXqbtolTZXf5+1icglUn5d82vectqideLKVVKa5qtMz/Nu3VrsaBxOkHUIkqz5Rpu1N
	Kh0yl2bBvDOpWdJYCpPERbh6u+4rJmqk3wKSC+SRAiOKehhmsmxWYptkrj3SW8C7qgVSS9dZrKQ
	8SKT6Qxdp5j0rZEZXRCiWtKLZBtSMrSu+o+JIcDqYhdYP05cu3lyTDo3EKGs5GNqMCIAYMn7wY6
	L0wWETJQ+PfZDFazJ8D2+z/jBEAfIXGqzMM32Yv1rvvVp2TLssndwZSpXIOoF/d3BiJjV6w67L+
	PyayvAn9YsQeHcVeWBG9zKVFlQJsjQ2aMdzTDCgEDLyYtrMFo0pjdJ4kSsQFpP7pLg70wppidK8
	B/7XT7uZu7S3G1G1LYnBKrmKKQpeSy5QG94EiVW0SKugIWqk2C3NDUjt2FrzvXMZ0gjxoYOPG2Q
	nwAxJp1opPJaZidtGoaqVQ8KV6aDbzgYgVaWzqVSzDVYp3aSukJHUIY0oERR7VzOonNzfEIxA==
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr366339745e9.16.1793797315382;
        Wed, 04 Nov 2026 05:01:55 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm140292765e9.6.2026.11.04.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:01:53 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: robin@protonic.nl,
	o.rempel@pengutronix.de,
	socketcan@hartkopp.net,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org
Subject: Re: [PATCH net] can: j1939: fix skb refcount underflow in session teardown paths
Date: Wed,  4 Nov 2026 13:01:51 +0000
Message-ID: <20261104130151.2659605-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179376780412.488853.11738408007557929503@kernel.org>
References: <20261102155345.1267524-1-tristan@talencesecurity.com> <179376780412.488853.11738408007557929503@kernel.org>
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

From: Tristan Madani <tristan@talencesecurity.com>

On Wed, 04 Nov 2026, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Critical]
> Does this leak every skb on session->skb_queue?

Yes, this is correct.  Queued skbs carry refcount 2 (one from the
allocation and one from skb_get in j1939_session_new /
j1939_session_skb_queue), so the existing skb_unref + kfree_skb
sequence is the intended teardown path.  Removing skb_unref would
leave every skb at refcount 1 after kfree_skb, leaking it.

Withdrawing this patch.

pw-bot: cr
