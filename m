Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279633;
	b=p2/oSARVcC09cuarLmrjfV9OBYOoWRdX/Bkk6bM7WnIcWHcfpiREMov51RUZTuK4aUFF
	 o1Bphn1xnVp2e6DNzFaai5jaS41TtPNfUSZobDpqtRBmMOFatthKMZQBYia4vw8XhBAO9
	 v465YYkMQg4ee5zWhj1Ches0eooDzhUjPdq1Ype+bIANFckhh1TaQxHg5DVTAUJLL+l+K
	 opmx+dHes4pMTr9DIkcqI6fF5P1RGbIJPzAj79xL6CgOpfoHv4u4EkX1lTox+nthG2qZI
	 lrdz6Z3WnAGm8IpQ3F/SzKTTQu3ebx0boRyHSgrRC0L9lBdEwtJ9TuKyfRsNRcX0UUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4wBXUZ6FpdwTYkG0jag9ba1skQI+CQfpR4wutPYZULU=;
	b=jOu9anjvG3c7/7/0glu4rOtQtfU12ph0ZpcUuKoxj/sy9KdxYV8gYdTyAEQ8wzq2HqS/
	 vTY3TZCMy+XPcat0DK+jr3Jmcbn6ZVp8tvWoev6YJLy7R2vO7Um5G3y4ZQNUrJ5Yd40xx
	 JWwLWn+txoDFbq1UxkkzosWmOohUQgV3NbKtQc/YuwOex7sGBIHvpoEDrCCelf9oU1ON0
	 Z65jRUfxNePAThfHwDayInrCf92in8F73D3yYTrm6RdWlScYnfrDv16FnYohOwmauZA2K
	 6ms0wUo4Y8joGWrW3vRKS8oc7bR4+o0jexQsmxoey3+ApSsG6xeZ5SY44X1W796EJhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=pQmSb3gf;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E429606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E429606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=pQmSb3gf
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e63ee7b4cso140591885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794279632; x=1794884432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wBXUZ6FpdwTYkG0jag9ba1skQI+CQfpR4wutPYZULU=;
        b=pQmSb3gfLqpuEfsLBm1LR5zUz9XYLmKQzpAiD5nGQZQWa8EMFU7bkUSQtaCJmU+Pl8
         hUFh39i7QuRUOPA4YnZjm3jVwIGvrn12Tjruy8C/94/6dhkHViwJlNfAenaA2GDJN1HY
         5pABHMLSWRgX/3mAXR6HOrozb5CcQgK1VGmbClFLcWLtSg20aqNFbiE8gaOLy5F4UPn8
         FSOnDl5z8LlhZNPWePXLCXP20aPpPkYIEp6HPP5wBdT0v5EXOm7tTcA988JHZEPhgHeY
         ZRU2qe/k40k5cNRwyFipHNiVogP/rgC+sP01NEv5otoocKnfI2PNSnq2A8Z97QHAYjLq
         cQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279632; x=1794884432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wBXUZ6FpdwTYkG0jag9ba1skQI+CQfpR4wutPYZULU=;
        b=ZVvLmFlyNJv/S8elpVc2ZS7buSAqqdut2Bpx2s6SkQHjbUVsHuLxtpWyOtIfgvFKEN
         RbzNVcoR6QrMwkC/SlMakavIJqBgiKYItOsg60YyP8yYUIaGJtYsLz9iTabpaO3a+HEX
         8w8+kRb/vxTldT/XMF1YjOd4JUqmSXWdSYdd2/pyRRmJ6rKKtE/U+VOtrNchDCp2VNFa
         adeoMyc2ca2MtlxbLRl325cPP8jUOn7VEv8tzbAQEB9NEeyvaJIMtCh0Izj4RmqlZzkj
         Td0hn/jH6olh3+7kvbTUqrX3jXlW68hQD9l/vYC6j5VtO4suJV0ltEk0KZ2z+4HALbVx
         Fe6g==
X-Forwarded-Encrypted: i=1; AL+hErELDSVyrrNSqNe5+7ua6tOcGzLqMrG71cI364c3auyUC3giE0y+1e0k2qR4sxpTgOaAmIpAqDYlcPmk4X4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rBZzXlSQJdTEZUrsBTXoVVzKblOEvNIf2B7OLwxre7g8xjcH2
	Dmjl34un8x2qeD/M1gFW2Hb6YJyrNHKM9gPwe6tBhtZEdfnXKQvIeHzbQoEN8sFkMQ==
X-Gm-Gg: AYBFou1+GqpRAOxMN0yRnXJunj4qsw2qWF6e5NcbTYYGD+wo1cx5d6xeN1v2mgd/08m
	cZSX7iGlbp4bYBYTHH12KPc4TJGhwBze02y2o1T6ljCwJ6ha4vKdYstyh97+l4jP74vV7KIIOgf
	WJmTxkuJcIC7qDAu8VjWZe2xdeMuRXb3m08rYXkPy0rDbnA7CGe8LFg2O/Ci1DyB+No7cUH19PG
	DFTFpJyjmip0pnBeUOs7BNdu2bJspet1bZwdFfYyDXET90gp9EH3aTTUkWCYJBPUL80oHt7v/lz
	zf4CIIbB/Jr/Bss91USG2RrTD7xcSbTKxrNg6GEP/rGVFkOT+vaKoGo0MnSj6tW0L7ckAFRKZ+A
	P1Rq/hdG5Fyg6EEtWbXqaWC8+oOFHJoIv6Vq/I5GVRxgL28TWWWQA4PeRsugGFvK73u7EBHVyT/
	/Su1AFrS8Qo6V9JL+I0y3xgU//24H+11grW4F7KnhssxPwDFfRFEuSZKNNg5WBehQnU6433Fdnx
	E2RX3/j9QW2/js9jh6cxzEFH8JkqIetd+akVmp+Zmg1AyUe8IqNuTJrG3wwu3jdlg67I6OxzK2N
	pVdzB+/Y0W7fB7X6THFIUyP2dCGJ
X-Received: by 2002:a05:620a:890a:b0:939:5cd5:e243 with SMTP id af79cd13be357-9479f1b9ef3mr232773385a.6.1794279631842;
        Mon, 09 Nov 2026 19:00:31 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ae756sm121214985a.27.2026.11.09.19.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:00:29 -0800 (PST)
Date: Mon, 9 Nov 2026 22:00:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, xuhaiyang5@hisilicon.com,
	xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH v3] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Message-ID: <1df531f4-380d-4762-ae01-4554acef2c89@rowland.harvard.edu>
References: <20261106031625.1824732-1-lvpengfei20@huawei.com>
 <20261109093935.2634235-1-lvpengfei20@huawei.com>
 <3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
 <20261109213437.5c693895.michal.pecio@gmail.com>
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
In-Reply-To: <20261109213437.5c693895.michal.pecio@gmail.com>

On Mon, Nov 09, 2026 at 09:34:37PM +0100, Michal Pecio wrote:
> On Mon, 9 Nov 2026 11:05:30 -0500, Alan Stern wrote:
> > Not here.  And not inside the retry loop -- ep0_reinit should be
> > called only once since the maxpacket value is changed only once.
> 
> Sashiko pointed out that xhci-hcd may not perform ep0_reinit() properly
> until address_device() or enable_device() is called.
> 
> So it's either this kludge, or dependency on an xhci-hcd patch which
> didn't exist until today:
> 
> https://lore.kernel.org/linux-usb/20261109112846.04bfeb0f.michal.pecio@gmail.com/

If you're asking my opinion, I say merge both patches.

Alan Stern
