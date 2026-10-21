Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554893;
	b=zAgZcD4LXZYa1U1ukXS266aP7hxMoIrHaaAkjsuASowbuhRrY2uyWcd9HWyXaMPp9KZp
	 aAhA9O7KHN69rVtyBFLBGLSZmkMVVHMkbRWDAcCV9kvBcHHt6G+esIHtASOW8AJgR/lBl
	 GH+pu/36+cahiVprLd0TLzHxj4J507NIkjBZjMcyiIzdGQz3QMfNb8zT5rJGO9BmrQSDn
	 BDYAFc/oyQ5sbN44LGQpdDHhoXeFeenHYJxs2qyCqfc7xfB50feQefb0M+i5UJsrPe3rl
	 5mG8q12xcQxXI5avdiPcbxaKDdDme2gmKoymGFBFgKp9UwDCiQxKntEogC+gNjjYsIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Rr1gddCtUYSoNXnlne3L5Bk98geG27nFLDDMlOBWOC0=;
	b=21LE+gSMKW7KJsKomtJ6PeDowAPbpxrmZVZ65iSnvifRf6k/a01XuXF4jdo7k6oGlbO5
	 9Hf8mrTOhTyoLzBT3t6HqgnmlqJO7EHSWFMc39vgcgyFoFqmSmBneaZHBsJFDUYRYjy3/
	 VzPLLK4ivhr2vILcaA3zyiJtMVLi6KU48urUaqW3xMNGlwDHwjE41i++hYyjPe9w/SSVf
	 Q5GxMHYQfg1xcXjQGbpzfb2pwtwak2VkOxYdtN8DhdHty4om5JGr6139/NYwDrfVfLEZY
	 GdHkNtIMQygeDZ+NIXzCWIP8D4wu+JpShXRQBLfgBZWzUX8brzOcmAISPxDTNeR84/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A240606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A240606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso198014b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792554890; x=1793159690; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr1gddCtUYSoNXnlne3L5Bk98geG27nFLDDMlOBWOC0=;
        b=qtzs0MTZsqmHMANRE7P7S9YfABsEJxi0UF3Vl8eay4R9tfgsP9aB7R1u1gSr8lkB/H
         Ek/XPIlB7YY9Pt5TdmGCEDspIoXLhU6w4SrDuhC6TrAzLO9fTFenBKlgQoCfDFEomoJ0
         XAX1sQdz+kUob0yOdqX3NQ4LVbR2gG//qI8JB9T7UpJsB2ZhpBtlvI6EOvjUuCIhypbm
         fR859g2kOz8zt0PM9JeEphAuLFDy8ftTPWJ661mShF5bn/2ixAz/18ONwm9wdf2Dbanb
         Oc3qIBpYGwpcTvZsZsBqlcO6mWb1tB9sv1utRGnTEPGIknMwJQQUF6+x41VvLLvPTvoW
         hDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554890; x=1793159690;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr1gddCtUYSoNXnlne3L5Bk98geG27nFLDDMlOBWOC0=;
        b=qtlrOVx+d6oJ5mxzMdRwVfNQBINjcNleO12eB8nRyNVl8ZpK/W39Z9FqshIO9iXw35
         BDaKIXyruezvEyupq5mcZ+sv6Bx505FSjh6RYCH8FFFipfQZXWNSTPCrS7l4WizlQWkS
         Tkki2DUY1b1edzpE2jmpdcPD6zwQED8/DRWVPgZHvATgw3foxusNGgn734nfHJZU3j2d
         eJvQbBWjjUHCkp/3zIz3S2/zzj14dvBS/GkyfiU4nAsD5Jn+uK7Fv0FiHg+B28xaY4nT
         wIGzGsMmFhWyFis/n2yaVV4Nwg58BnA+bmuvS6I4MqC3lAgfFdQ5K5SlBzBURPEfMfrl
         gBlA==
X-Forwarded-Encrypted: i=1; AKwUvBxIDn4GBJWyO307ussnpSBJTIxoej+6USDhThh/QQxzocprVhC5pMTLHRZ5xv1yixcGDoZkDiMFyWT8we4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPcz8YaldrEmV5549Vpsyvby+LP0+RdBukaklJIp8m9zLSUqi9
	w8Pus8gDE4ErMcps5BOv/OeqNDcTHc+geOxhW9fFUnKBtXZ2K182P2WrF8zS5o6W2PIpRg4QLU6
	KXJ5c/liR+wQGukSs+uFSqA==
X-Received: from pfnr27.prod.google.com ([2002:aa7:845b:0:b0:89f:ee93:28a6])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:908e:b0:886:4070:ceb8 with SMTP id d2e1a72fcca58-8a089eeda16mr734413b3a.56.1792554889480;
 Tue, 20 Oct 2026 20:54:49 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:54:47 +0800
In-Reply-To: <04957492-ed95-426c-a5e1-5491ec749c16@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <04957492-ed95-426c-a5e1-5491ec749c16@acm.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021035447.3488381-1-stanleyjhu@google.com>
Subject: Re: [PATCH v3 6/7] scsi: ufs: core: Fix double release in ufshcd_abort()
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/20/26 1:13 PM, Bart Van Assche wrote:
> This change is incomplete. "err = SUCCESS" is missing above "goto
> release". Without this change, the SCSI error handler will escalate
> error handling unnecessarily to the next level.

Fixed in v4 by setting err = SUCCESS when
ufshcd_clear_outstanding_reqs() claims the tag. If the claim fails, a
concurrent ufshcd_poll() may still be completing the command, so the
handler keeps returning FAILED.
