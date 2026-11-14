Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627097;
	b=dN24TDpI8xvK0vNkXGpGXMy900y4gczH32CgvQsSgEIVB6atS7HsWEoQAF8QsXR8MCbM
	 FH0TY2xNGPnixZQiYraWEMG0n5E2tdDKjXEgNMkhaM57pF83izk0SoPSP0bsr4pcdWDOh
	 GZW4EHStMarMRwNoExgZxFIu/MSZx1fxH2gNU4NTrLa46cx1vgPdYpuIKtr7HfnfasI9M
	 sIN6z8m1/iTojgHipay0WPL6YsHbK+nt9JFHvSPOEMhl6u0z1PrbfGEpiiBMIffMkcEqM
	 dSOuu3g1+J20ggzSO49XCBbSnLaVw/Jh4d+RGVUt+H/3in+95afn4Mu/LN++Nw/6GYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627097;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
	b=WHrfmnwjJ6cOat/kXYJ910flQlpxUxWS80O3z28XpnEsHfNph6ZOE8VmKCWy5kqfgwNu
	 mT7MUjaamT5R0At8rxCfR+POtEHbitU+nmUi00kU5FLWRloLCaQkzbq/qmq7HRbMecC6e
	 q3G0sc6Ipk4zps99Kd9kDgvoNA2E7TLM/KV+lDtrCfXuE406Y3TRfqcKs3j4ycyEwB2BA
	 PofilRXXu0B8xfo1G+18vt2SGYzv0BDx7vAMs2cRATDdos8+K6E02xxjMKzuWfku46q+o
	 NRBHh67m0et6ccqXBB99FUjB1ePD5wvFZciLFxqFnY7H093uvYEpVDR7u9rihUl4/Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G1a8wPGn;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F605606A88C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F605606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G1a8wPGn
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so800334a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627093; x=1795231893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
        b=RyK42WtiReA6+0otC4EWdUIASsM/VPUcRFCdZd5uOEhl/9QxYPMUIS0VvILX+ZFkRM
         pgSzdxBCrHdsrrpIjvkZV3bwrxY+l8+awDOsNL0CjEPsXEwaquDtCS/dV6XKAk5Iy38b
         zgk2hNG6R4VopUAYaiZcLAYJh+UjSSpL1f6xRfUPSqDZvgNSsw9rNW0iMQLK3+bFGoG+
         +N0RFkrH19Crz/SPrVwy1bnNxebmHMBIxYm+ecLxoyJuhyZ8HirPUqKWKkQWaQ+oGDPd
         ejpGIZBUa3h5XQ3o3RfuYoVQ8moMAJNGUu7uSc9qzQf0t7lPNCyYBRlbpA9rAfPpZNWi
         Kykw==
X-Forwarded-Encrypted: i=1; AL+hErEXcX/gmm/iSN4mrZGOAPJZRyCAAnH+bpEIDhtuUb6FW7SgBjOXXFy+TZYesm5UboOClm/IEO0zD9+xSMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H5YDhamV66UUIYRSwVMzqbQFB4KErGdRIZ4xd6tXojhX8t6Qm
	LLTfvya/IsFg8f0TrTY85mVSlUOGyXkUh0NweDizfKjEga4vxLLI262Xtj9vQgeVOT/52JkcvBa
	RbwOocp/8n00HI0hdghnnRME3hTbjIpoK//wvYCwRIIMRNeGcTjH8f6pJJw3YFjQxn0pHyRIxKv
	W6wn3ImDqc/Fvs7J11k5TMStMrnyF1MWNJmvhGxCmohpD45b+KugExTbReLFsstOAZS9yj/SQyo
	pzogrbvM7UREhRuQrIX0XTZ
X-Gm-Gg: AYBFou1MAoJ2TFEbJ7YT6rgLobU3wxJSlI9IEvlhBr59jEhmSMxKS/yTlUj6PTU5LRe
	dj7KUTuO1cw38zshy1AIdcmzQHBkWvbdGKex7w+rV4iOalURR7w0ycH5qL+DtsUmxJxftAp5zRe
	nUvMfj46KLPEGrZB/Wn004Ub1GKDqjrCSaGVkF5nVdn3W61OvJ4SzQtcbj+0OMKUCmIZnHvoigS
	pbr4HmDaYG6P2U40P04VmA2kNXnnkMXVy50CbWZKhBYEeE4fP6GHNdBWDLqXHJmfYnwVISBQZrM
	QYHsPbqz7+DOGu+U8FBwKnkc38IYQ24Kc+FgrroFJ5tjUAO7W52FEeRXtBVUNTcIXeT/TQSEO2G
	Ym2Tw3TtpUX8rVmEn0fCjB1fqNCVFvebmrTZ4ps+G1pTdW2MXNHUBPHc19Rd/SA2ZmuUOlrhJt9
	b9mPXCvgXBSN4IaYDi+sCMrPZaGTJMLiKlcaW5dLjl
X-Received: by 2002:a17:90b:4a48:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b1b0a44a42mr4079131a91.28.1794627092837;
        Fri, 13 Nov 2026 19:31:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f125sm6354620a91.4.2026.11.13.19.31.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:31:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so816873a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627091; x=1795231891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
        b=G1a8wPGnMSQ3Hv7smYwO0Ypht23EAhgjDOhNcH9AJul+V4vx8enR+NJKjGW0FtglD/
         4WkzbmXRs3Vj82sF5OlWII3U65rOZNmDeLpzxPgRkumwC7d8PRy+MTtII4gw0PaUIh5i
         oiS2oFNk5wHfiAagZ90rFOWzynYl58H84FST0=
X-Forwarded-Encrypted: i=1; AL+hErEntfNXVInRvBDEAZRAI1oCCvD6sfTQYVeMKlk9/VlE7LkdFZrp5e8th10l0G8Lu8eA94+lN1yincdel9s=@vger.kernel.org
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr4288825a91.63.1794627090739;
        Fri, 13 Nov 2026 19:31:30 -0800 (PST)
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr4288800a91.63.1794627090341;
        Fri, 13 Nov 2026 19:31:30 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm7343308a91.16.2026.11.13.19.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:31:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
Date: Fri, 13 Nov 2026 19:31:27 -0800
Message-ID: <20261114033127.875742-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 10 Nov 2026 14:00:14 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
> this mode and normal boot mode to the node.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
