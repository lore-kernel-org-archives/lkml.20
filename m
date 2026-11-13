Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556926;
	b=luCoxbeOtyyd16lEyiEIRn5cIWlncCGst6doMov395AeN4rnnniV1sRe7ZJIUdkUx2QR
	 4aZ2fnMTknPCv4K7o3TeQ6QPHX9z1yPwBxl++e/OZMgFVhK1SsiOLGpyvJ8bkVoI1a0wX
	 BEaz/XFfhHXRMdEAaA4faDxT6VfrlT5hFZEBZ0XMJWg4W8d2tafbkPswXrTLqY8P8yNRG
	 Ee+EI5EBR0zFCYPsUO1mDH/eKUT72xrxYoKI0Y48l9EuE8RRwTSs/4mzkwBFDjYvP11oK
	 ZxRV7WbntW9tHGCvaDJeVVNTWjuwdX3ub+Igq6vy7hNJFCR5wkvAtGWmLroeqHK2GeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
	b=tHGo/Sfy1xGQWLYrDm1EliUjMuPv9ox3Y4/gtiOSkOglnXrn3WoEuFZLxRDmzHHx7E5h
	 Eh8NpTkiazgHD1+/eVcwOBSXg7R6PXitVxddoyq9bRrQwwo9DRx8qEK8dWsHYQkfibCLo
	 yFnxrvXdCvK0kSW32/IwtoPxVOJXSND1a+j8MnNEzidr1yfrDc7BPDkGwHY/ARoOpzorM
	 dBSUE6iLIHC6MS0SLBy6eDpeJmuLfFQSR2z+xgND4rSfngOt3ecPrmppiKtNI6N7Z/1jd
	 +aXuYJJ7IqM9cGosfOT1ELOP/0JyTxBRJt/MTIUdQBaDJZIRpicCa0LDKRVVpRWXbSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTIYH4qx;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C21606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C21606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTIYH4qx
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3095465e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556925; x=1795161725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
        b=zTIYH4qxkd/UVxtwx/nA4llgh7bESZeGQaTm2prdn7irBT+NII+HvK+AbhWvy4rdyy
         bYKhIfRmJ9GflhYQE4Nmct3m+qHljveeJJbUuliL3S8spo8t1HrXd2rQRIETLr2SDHu5
         rlCHeYrkuksr7oUerEBI2GJebaIgDOaZUv7fYxsplA+DCFzWW7kM7wNsKY59ehJuaO9y
         EwOcgpCz+aeujkXZGcwcKp3jPDVtnAEwCbkinfXL+hAYv6au+gBt75XxGINglZuKzWnY
         RhucEJ7oA+h58Nlk5miFoKMfz8TFoOQ4Mn4cuxAqU8clBxCjhc65T1WK6xbgzu72gsFK
         Wd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556925; x=1795161725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
        b=sDlun/tos8LFNWi5jbdvsjX23rjZ1fD8PryK5D5KyPW7hupJx0U43lsRSc0SwCf9j+
         N25QrdSsZZbuM8iN32ceraZFwVFz3uXL6hhy0CbnC13aoy5FOaMX7kdIz/hMyTVQwAwD
         O3dK+wgBrC6zoTutx7w4EQ5MGuQArxdlKqUHWgqM5/FmJgq7sa9S9TvHxTTc8k8D7MCU
         S++8/NfYeSzMZ2ghseBe1/TKGreS5zfBaS5CMhVz+ZEFeV/1WniCyxqXMt67mIfu0Hyg
         rdb8m0VM7EYw6n+D83j+x5ktPHveOLko1CQI5wF7Tx+dDmF0zLWjlycY5xtPB0/pbXV5
         mjxQ==
X-Forwarded-Encrypted: i=1; AL+hErFh78Xt0HUVQQzeHv+MZEow+m6/drj32oUfCjmkuFi2xEOkGzE6HIxplaIUMV4yL94vrQGEdFOEdgkQ+Ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wf5Ak/2IvDBULBovzEw6Y9yAm6AUuk7GRizzltt+ImttvP+/q
	mTGti3ZBJiIZ4W7HkCztTgsTB8lJSAaaIPjhpyDemQx+R74AVTF1FRVT
X-Gm-Gg: AYBFou0Yk8oBhMK5nDP9iR1xg3ioXyx91yrFjSfeq2HBQhP4U1yoz5hmn+if3lMcA7Z
	EnkbyS3/0gtOauqCeyCTwp4N4v5lBsl3qOO0t2vMWCQTwDTF++ZaXeFCDVQhFSE9AMn2RmU3CXM
	DqY6M0a8Q3MiZyKqujDjy6gTbmC0vj0CwfDf6WTFpPENdIHG7ke0DnzE6b/JMELhcIbcmVw4oMA
	awrQMCMO3jslxnC+DPuCbZovGPjjH3IxDSprhbfUwXWXoeNDUYEHOK1oA3MYUR7O+d+n/7YR2qV
	qhVaPZy1sF1ZfjcCIAH9u+5NXTIoCBGt9xmDZcA/kRC3xCIGoKYd2aYVwnzQn+pmeXPX9omK7eB
	sVsaiBoh4Rkunf7Upr76/qMFt9cdOWjQ9OWAImc9jdEGkajATA9x8M5CqO1SXxMMTob1Obg/ZmQ
	UY2MQOjWzRTzSlBukRKQeV0rvX+vuiXpPaGg0XPulvzP5CAa9Ap0GpPpU0vQyCUYPByBi8msCPu
	iTS6dQg5iksu0BlojatpyacTJuO2RtVpeFHEh0ScEziNt6c8PzBgusLei9t+c+DokjAssp/mjE4
	PCUGiWqtpRQTr66+GflZGf60sk7ewYNbldCU
X-Received: by 2002:a05:600c:c4a3:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb55ab5526mr35140005e9.34.1794556924633;
        Fri, 13 Nov 2026 00:02:04 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm121590835e9.14.2026.11.13.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:02:04 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: imx: two fixes for a DMA write that is not acknowledged
Date: Fri, 13 Nov 2026 09:02:03 +0100
Message-ID: <20261113080203.1046422-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: 
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

A correction to the test note in this cover letter.

The v6.12.117 kernel I tested with is not plain stable. It carries a
backport of commit 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non
dma mode"), so its i2c-imx.c has the interrupt state machine of
mainline. "The touched code is the same" is true for that tree only.

For stable: both patches apply to 6.18.y and 7.3.y. On 6.12.y and older
patch 1 applies with fuzz and patch 2 does not apply, as the interrupt
handler is different there. I can send backports for those trees once
the patches are in mainline.
