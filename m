Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687059;
	b=YPiyEmqgGWUIONs17d9uIDjHQcV38sihieUHj1P8UbMptvqx7uQvrTaxm+CM4VDf1fk0
	 SC865sPa7DNUdVtnJ9biYUmaD2+r9gbVBtx315H/7YchOk7e+ui/1DdzIKxa8kbyEd4LV
	 x3/Rn0Cu7/DyqoLTSkIgzzAp+fE8SwO8qZw2jHRxTuPJd79Rny65LjUFRqJAgpzBLHpHI
	 R0FNkw2U2bgcJCtUob/73R5k8oPspqS+NRmlljqR/0Dl8wMHQBsMKgqR2EnsIvDPoMZ7m
	 /WlFj2NHGeSc4oLCs7eSt9uvreURcu7krnM7hHs3po0BvWTFDEbzJyTtSJqitI20Ong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q1YarXMG41jTbZALuXo8AzZfZMlmVAmtGfykhB4MycA=;
	b=JK/fU0G5TMLJyDHt5QlnUpVvrs9rN/Yoo8BB2SAhSDTYmHyG3BsjUPIqLi6bDXwL9tFB
	 rYe1OL/DFkq8nL/A+YgVVXibkSn/BEwKqA1Px6OeF5UPgSfBWl3GgtCyY+MqbPkrlRMmp
	 TJQhmeFQDxuqCdpGPxlmXOgdbVHZ2SV3TYbCuzzGHsxT2tYpJg0lHgrI99RHhT2I16hDe
	 6ugabsrxRHoYPaCHWuX46HCoZOz1zeBjQftJDb/uLaEj8mhozfs1x1vswxK5gK2+zCxo/
	 27RyuboGxnpzf2DScRnt0e3cyw8IVeR/8lBB3iTMvOMLfMkRgezh7e1w6QHpGrHN3fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BT1HumBE;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC1606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BT1HumBE
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f22a8515eso264392085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687058; x=1795291858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1YarXMG41jTbZALuXo8AzZfZMlmVAmtGfykhB4MycA=;
        b=BT1HumBEm5CVESTkzmoL6X7tg1NZGHm7gfqxegng6gX5yy/Ktn0eIVo6XVF9++xyjO
         g/LuTm2K5WwJYUpqhg0+GtqxCzesnopsvPn7tbBsPlMun5HQo0DdC+xx9E7RS3k/fjoO
         iZ4kz+pxfB63bE0YaLUt3EAqfpYGXt1+wV5wWoN3ESio33ZFbGXnCCqt5VZNZk6q9oth
         w1IypezPutOFjF4p72AqGe6RJ9c5V6fvE1xbaSDOkNRrJ+0hneCr9x6RK1svWdWK/CRw
         YkCfuV9LybFp/vKZFccBvRBmMmqfb1EcpCvxY1nCA/i3Wo6mCRrfm10PgZ+xioBxsJLW
         /DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687058; x=1795291858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1YarXMG41jTbZALuXo8AzZfZMlmVAmtGfykhB4MycA=;
        b=SpetDG18qndZUa/Cr9e+G0y2fIBnC+iZfLex5sVUywQGTZs+P6xVjWA0bD/XxuLQO9
         klSoTPoN7A2/Gy/O3r2sOZ3ytFMvarfVjB/AqGCIv3ixcGVbty46T2yjX/Km7dikPeUF
         9BxqucOKZXzfRs8z9fL3ZbIjP+0W9geZOiAT2CudO3Z/DYCIaPFTbOrc7uZof4tfD7jv
         V3xBVDMY1Lo0sreYG5jYJS1innuVVHaCBG+KlZbNFukxTg02DZCW4nmMFiQdG0vGq9/Q
         osy3BpWRdyesbcUN6hxGnQ97WSXCcEPV00EAp9baWUQIZipYm3BPOL/TsJZL91RDg+IP
         8PKA==
X-Forwarded-Encrypted: i=1; AL+hErHAysivO4dWJ7a2vidUBGbRdaOJFRnF3Js7YgxUoG7aV3eThdmVCMLlRljPE/XSW30ftV43WNsSdZma4CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sModm3NN6mlFG4V93aGhhauIZMsCDR1Xvf1xIMnkBhv7StciM
	nZid0kyQlRCyi2fQO46jr4R+LxCbxd11Wiy/+GWNoq6YIXZjs+aG412k
X-Gm-Gg: AYBFou00mldXX19C9JXaD/hxZ1yWk431tG/qWrWPkJGQ08WfR8HZwQfu/jsrGxysP0X
	xUz0A2cCqiQXkaYj9gWT2q2K9CLms2181W2rneqKbZIRhvuUC2s5+JlMp1XR6l+pljbuoDFmSV0
	oY2fLvCd7PxIFrJmfluBOiiMSwkRLsA/nDCtdc3fCF4quVAjm4dIbgffqTmsZe2WjUTFOUEQvK2
	O3ObnKRxFXJgflo5gzDBpZTYMKaxCP3/OUaSbWTVJ0tazbWQ5oDa8Lk/1XWcbur+2AdZi9/gNEm
	pUSdlwoj9F9TYEg1fsnvtjLsE+K/noAlzS7i6rg0KsaQCEkhJIA33aQ70h96ldW6/5Y2nAPn4wn
	c1aWiDIlgMaQRNGt7o16xie35UMjZG1WDW40WNuSwBOdEr0Q6Cu2sFpUDHcIIAPa22yKKRIVeVO
	iCab8mARb19oArUmuioxQMq+eyM/efdv1txsSb3Zmw/RRDeBgFOsfZ55V1GO6mOolp7saAGjKBu
	gYIuqvhEyi8Z92TM9QKsIiHh2hvFlXFtvyvObAHBdcElMX+XwHgA9RnGmxL18omQ1ykRtnMTUky
	WXjTBQQby2xCBb9ywkas27VBI08KI0Q2JaE=
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr644160885a.39.1794687058217;
        Sat, 14 Nov 2026 12:10:58 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803afbsm476303285a.15.2026.11.14.12.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:10:57 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a command times out
Date: Sat, 14 Nov 2026 21:10:54 +0100
Message-ID: <20261114201054.975225-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-4-mehmet.fide@gmail.com>
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

Hi Miquel,

Please do not apply this patch as it is. Sashiko is right: when the
timeout hits the raw re-read in vf610_nfc_correct_data(),
vf610_nfc_read_page() counts it as an ECC failure and returns 0 instead
of the error. I could reproduce it by forcing the timeout there.

v3 will return it. Patches 1/3 and 2/3 are not affected.

Thanks,
Mehmet
