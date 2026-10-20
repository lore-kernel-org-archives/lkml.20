Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460966;
	b=BpMOSXwDSuOQIeYE1wu3w0qWR9H86X3EmLEBT5PgCdLBh/4KZvBXBKsH7VkIFclSEYQT
	 6mTR6cUgYNOg7BmulCl/xWKaFYI42x1WUZC1xp07xRghPo1SWCsEf1EUC3xUrMI65Is1e
	 XQOP5mGXUzwk4MjsFwum5zb3Ejc0uVlf5AaijPBsNveoHe0ew4sy0zJFJlyuhNUO/b2EO
	 5gJDkCLonhZi99oxi05v6oJmPWskSKHqiQ54ZMUA717ZlFX+12rUV511EJSgG8vuA5MY5
	 QnjpEASILMe9g1GDy/U2QD942m88x7nOE38WKojO2d292h05wiVY9st3Gc3ned7W2ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
	b=ZVKGlg8pTcPv7jTTs6KSUT9PwK5z7ydsTlQattBkOMm8T2SMDiZcyDt//adPrBwQuiOV
	 eedNUjgbJ7yp6OVC7BWI7+qV+f/5XOeJbJhA8TXOKtMQUD4n7BLNs3Xn4J3XVLA+O+HfY
	 VtxRSNaOiYqX/Hq3/BwWFF1SkCb4cztGSB7G0qMjWZI2inmP3Wo9twiTMJL0OqwI3X4Zk
	 LlqdwRQRXTS3t9QX6oTHYZzFgdFNx46nu6ZrTEdi8CEteJyfyJm9cTv/Yy1sMuyufC2UB
	 oKn1hAUPk4fR8wYCCgV9t7owHcZ5RuzKSuYhCUajIQ3sni7tNpsmFCE5u+Ro5VHv7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5Zy+06H;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B82606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B82606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5Zy+06H
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so3802504eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460965; x=1793065765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=j5Zy+06HYvqYPzoaj9knMK1wL17L7UbkhFY08X6bji2CwTZ2KbbiifP/KVdX3Q9z5W
         i+kgyZBG44OKtizVXUD99kmzJp2OvnzAMYVWr5palMY9td9/HrRCXsmA3eMzEdxDu5Gk
         YK9u4n6eohz7cYvcSYbcO7NsQ9ybecgkZ+0xYWkmdZODUJ4Sie5KL+wi+UxjZANDgGcc
         Atk7lkyfdFm525ZM7UNE2j75qevy1ibAc1HiXz8Kw4GCw59TEFlMvo8VfV/ujbGlds0K
         7RhpU9WeZm/cHO7MOIqBM/lrAxknTs7UruX71kWhte5U62tSO5m0qdWwsiZdzwfsaR7N
         187w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460965; x=1793065765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=Vh1YCbTzvjI2S/5z6746iWp8Ws91/pTDt4OmAJag4tNm0fbjlpPRKfsNV6M0CehTzw
         2ysNKWhLRjtHCJ8oDbCydKJ9po+ritjN9s9UAJ6bA/FTFbVi87lHyRlyu46mBRtkxbry
         pwx1Nuh5B4EKYl5Q3zlZkWnKixAX9+Qpfon5n5dcaqvoM9o2fm9+rfy1dEAtJ7s/cGso
         ZrHXvOP+Glqd5w5VXvyPR5HRKGGoE9Y9ikr2+57kSTYUCF6VPV9zbGOTDod3xvBhE2CH
         UNIjPpFP/gkBQLbRxrkSBmNC7ltIKslOjHD1PpqXnooDEfNFEpdVqM7LHYILB/JbkIaj
         BNrA==
X-Forwarded-Encrypted: i=1; AKwUvByqWgkN/ifX9n2c0nFji8Bn8/dgzD2FZGmbJl+muqRzNXP5w0zJ8NJwHkAhvNHm68Hen5BZPYDrVdo/WuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3PJz+kaeBsU3rLppqJHZyIjHnD4RsfGpzMTJ5IzdN65Iepeki
	uHqx4IaWCrzO8U2JeAWKBuL+1F8pxZ9vhuROjFAsE440TRyoOfFFYlIj
X-Gm-Gg: AYBFou0m6cpgcAHzngy+T0CsZjYv7+ffAHDPAjDr9WDQTz7VDJrenqkrJEDvLzjEaU1
	Cchrw2RQRrYrDFLzH7gs0FsysixRm7Tft7QkWgfyjZs5xqpN5g1Sw4Qg5GMABOar6wwzJKmu2zF
	A8oXEIhkt/HSoCO7p1UKkVcICb1OL2PLREl7AnpQPbtfY2tHyMoiKLiVHU+JMrDje+zh3wK+cfb
	tyRUhqan0w8Az5owL06EJs3fqmc6UeneHHj0mmm7XnDOaFKl+Dk34IWMOLjXgYptnRih/GtU01a
	ISfeCTQMfl5eicDb3gQcklE6zheIJKxHnUOAf3rM8Qm5bjeqEquNuxqgteEYO57WdbcyFRgecZe
	xeXSi9T1rhDgOUNQOc8nH9lr7DJhioceYxVx6Ly7O626A8ZffF3+inOlj0JwSgnDJzjkGk+Itj5
	hxC+Fjm7E6VE/7tIhenYborOQSrym2DGYtMFjVJ9hW/JRt1cnsieMJpu0de4BVp3RRsVvdIbV3D
	A1G6unBqSKJ
X-Received: by 2002:a05:7301:271c:b0:35d:b452:902a with SMTP id 5a478bee46e88-361a2942d31mr14312652eec.34.1792460964928;
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm33941191eec.22.2026.10.19.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <0ed8c1ac-1f9a-4cc0-b914-6b245f86d296@roeck-us.net>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-10-pmazzini@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-10-pmazzini@gmail.com>

On Mon, Oct 05, 2026 at 09:27:29PM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
