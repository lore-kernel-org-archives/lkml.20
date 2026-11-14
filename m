Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626837;
	b=NHnvKDaV/O9aTKDz48yR6lcv2/rzoT/QQGHWu/exLwL4V9vHj5RtW6fA7eBNxIWVGvOR
	 J3Bvd+n1CPBEP5EZ2KfEjNkRcu2v2Cw/N+IKX2KG7gy8FSyk4bEgHV3cJemTasrDV3wZY
	 f4NQqnA8f4EZrTMSnzcV+xiIb1BJ/vGsmMMgdnTLLP/pusb+cui9y9AYUf+D+2amRFu+B
	 MIy3t8+8R9rqRbiDK/bAhC+BdP3u+j9ViSyfuPKaWu97B22vzIVpRv9bxJrmWxm1n1hSv
	 OSkK+tgmcDMrRz9d3mF9U6NL1AjMXPdwvCHSqXtKjRZdhzSeeJYmIcJjIgm6ukCh49w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626837;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
	b=0PazZYPvSGU2iRrQQLBrBpbJlrxt0VJNdTWV1wsgvL8ot3OhJYD+9o3+omBW7SR9txyF
	 jcRU6ZeQRf/a7lfggep5Serp+NBLQcCMqqZX2zaAhfu9dKiC+0GIprSBjbUIkC94jbBD2
	 XGW+85JRrpXCF07LA7MXWFVcGwFPIqJLb1kesLPap3KvqkGsZlFIkEtguEVkO0pozFmJ8
	 v8d9/YtQkqN9tJkfgwkP7Bti/nLroEiWczxxNArdPpKC2PRR/HIk9QHbLb5J+S2isV8Vn
	 65/S1QkFVKQa454HIDErdfDr05ZBBiEA2K6ZKjkUQVD3ufZc7d1sDSpSeYPaYSNh1+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dxT4BuY5;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D2606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64D2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dxT4BuY5
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso866881a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626835; x=1795231635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
        b=kUDFyAmIEXU7LDT3Id0VktLDUVjpOZOpVHJJT2Vk+xabEUgSaJ6NKTTssppQJ42PCe
         50bOYBaP2wXdhDEDO1AK5cREMNZCYWxp7RpkrH1qdUgSpSLJL3Pp/JvT/I3gaAYrDUB1
         QgYdZqmv0msMCa3p4GcI44fFQcO/xWUURT28L864pAASXwLwX13F5Fd8difD50TnBTxC
         Thq4s9IkehkdS+QcHBeXj743TfPOmX2PVqEjPFQRNdZ4CdDj1iK7B3XBFY7vKG2JnssV
         cVpa5qWuqEaoSTDuyma07MErGr6hCej0HjUg5ZrOB6Hh9rXGmHB3gUXRn0NTA6ktlnHc
         +X4w==
X-Forwarded-Encrypted: i=1; AL+hErGWso8zV5rNanUx90/85pBmtjIY0t1FcD/1k47U5otJj+VzXwLY6L4Mx5ZaZLlwr1dgZFJO3+T+1bd2Z3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R8X0IvP9Dc6HARZgSP8AuNQbZx4m4cbL6H5vDh5U2zb9SDHIe
	N4CCA4nBZE4WdMb5RlmZ1ftWq6DQQ3QfOiT/JafyeQA8hLJgV7zn/40s+AXsjLUH0rvlvN089G7
	YLIA5xBILhwOebxgiWtt7vgXXOE89mvBGtGkrN2YebDOKXvk3jdO7UzfatImx9CsyD6YdcmS3g5
	4A3g4nrZF+cveH/x6s6OvB/SA3yeeIMeC6HgCE2gmVIqvTdg9WDTqKqkzxjxllILG31HHQ6Q11o
	yqSCKqwZPciC48ZE/g7cPtQ
X-Gm-Gg: AYBFou3zLPb6cwkZ050Y8VpYP84S76jW3DlOYKDqxCkGN9HNv6++R/aQQonubNFEmAz
	C1OHalTORDAJn9v2yPFQniR6fsyXLuYHlf+JWrN/xxf5Ogt1Ueuyu4DzIRTSQOk8XYymGRPupIa
	q+8bNO0Fvqhd22jY5QLg/++RAMon55658zijcOSmUqN7cd7+RYwYQZDK2gyjg2IJ6bBhKdug9wb
	00JoBPVRvlL9z49v1UzpMmkvYVNuB9aQ4zyO7dwmYsu/DIm/n8131ayAO5EPZkQ1S1zAm5w6Fvv
	JjlugTIyN5NYQTS2RPHIHrMroMv8DA8GRWoxPmdcM7T70prTKHBd5Xfh92ri/u7an0uC4yMY4of
	sFds/2TocYW49CL4EUoYJ+QhM4yiMRLH/7kLfHzNUrb5zqgNSEBCrXP1Hx1F9T09BJ4Kdyyh50i
	PO6GLeSukPkGe2MmykBjF0DYRa++JuBIDN3p4d5e5Oeug=
X-Received: by 2002:a17:90b:574b:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3b1b0b8bcb7mr3863363a91.45.1794626835076;
        Fri, 13 Nov 2026 19:27:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197a330f9sm9239112a91.0.2026.11.13.19.27.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:27:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so1658488eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626833; x=1795231633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
        b=dxT4BuY5lYOccoIhz9Pl/6RXdduJznH54HA3Pn8yzoWvxTVJWyds6vz0tjAX0ZCkEk
         0GzXlxC5PRPkBsM03oxBYMoqA6+aN5DwpNTriJVdBLz8bUJbywgZxKzLk89+sg6w96Jp
         RAg5d3rD+U/c7Ut//HzEFFujr6tF6GhY8HCPM=
X-Forwarded-Encrypted: i=1; AL+hErF7gYC21wKWCrcUBGpEPjyqWto0Pbt2Vfdv4HYCy9jyQDw7OFFD90JmPAE4VeoX9puge60DDrxoULkvqCM=@vger.kernel.org
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr5998526eec.40.1794626833031;
        Fri, 13 Nov 2026 19:27:13 -0800 (PST)
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr5998462eec.40.1794626832269;
        Fri, 13 Nov 2026 19:27:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm14228212eec.27.2026.11.13.19.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:27:11 -0800 (PST)
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
Subject: Re: [PATCH v6 1/5] firmware: raspberrypi: reorder rpi_firmware_property_tag enum
Date: Fri, 13 Nov 2026 19:27:10 -0800
Message-ID: <20261114032710.874144-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
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

On Tue, 10 Nov 2026 14:00:11 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The enum was once ordered by tag values. The later added tags were added
> in a different order. Reorder the tags again.
> 
> No functional change intended.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
