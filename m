Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389004;
	b=DL4vgoWHUTU2xXXjDn7WaUlezCQkdXJEHz/yvF+qBtIDs3mYKDbjM8vXnusZsltF/ZpX
	 pcdwavUbu2WwFaJ71cUEroJFE4MdxF2WwdtNHRyuoR87WyPATVpfTgHU3IUmG5PEI/h8Q
	 kNrfQJv7NQJRjocf+FUQ2YUVDVadsRKxQ22F3pDW6ZbmmBIYRxTcK7Bx6Fk3T0jTyWv10
	 Oy9OfkHWWD+00x/fMo/HEE3hO2A3K8qeMv9m5qofpDd0wLJe9RDgRW+8O7fQNSy5MfTNp
	 qM3+kIuqodecxIx64TshvjDEafStSyLZVuPyL6otYjaSJZv5LiolrY9+5/SWrdEtVMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AVaau5y8hwo+5sTMNM/it+5IuZGWaaPTl9DZXOLv2/0=;
	b=hMOgTudJeVxq7M4LATo0YBxFxbe526iiHdk/o8EmDaC+QATUZAij4+5IeyBS3EzSD89O
	 DATmGhfIzelz2jB5id5cwy0qtjrJsBZaVYTXHKHJLR6g4tci/nQb0ItCn88m9VnmMiQfu
	 PlY68JB5+Xzs/kD/3a8Nhp8HmDcOCb7+AOUprhyPvcZLhwBkRygajTuaKl8fYY35XQET2
	 cBWVnudDqllPqjQuTIjlDZT4Kwne7nWE435vPeroXWVpfFisrZyS+SHEqmykLrb4SMGr2
	 w1mewM7aAizm6iRO3Du9/TpXPPC06U06b8PYqhsJRFtKpki9Cypr23IBTEm4YXWfyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ODxpJ1bH;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ODxpJ1bH
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9d52f684fso10977865ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793389002; x=1793993802; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVaau5y8hwo+5sTMNM/it+5IuZGWaaPTl9DZXOLv2/0=;
        b=ODxpJ1bHMzzUwe5Lx+VKgMzYWIxYluNtfud6pQLLq8DH6sEfdgAm/CqcVSIJb2SBGe
         pLWYr1ssNy9i445gE6+cEssKgYQZY6H7yxItGsz8NXjcrgTB59OeklgrAuKE4jZHKtHF
         g2nsrIqsS33XTW8DcL9hFwtr1kFbtG4DObJ5d1LCFnSFndyDgYJAHn1HCdw+u2dUtiCu
         ccaG0nEDXpC8BpNxRcXp2w3yb984ghIRC2OpmRnxpj+vaB+OeB4/yx0rdhpfSw+csdyy
         3E/JnRRM18tSubKRxhe2S0GXSe2apZqgwMiyTbtpd6Ki1PY/sJiqy4vn6as1YRSzK2q4
         1ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389002; x=1793993802;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVaau5y8hwo+5sTMNM/it+5IuZGWaaPTl9DZXOLv2/0=;
        b=bi7QLJ4LwQp9VhTwg0+Q+kObUDUH7786wngYTxgDNrsPmpTqxtVBWWCPUX2QHYVE7C
         AXrdAD2c+XRHFdizMM46rEhunw7MUH8llrrjKNwMkbaS4z9geiyjyqKpnz5j11eQkOym
         1edAsFaSvGU1ebrkNPrCM+BzTGA1dhe6IdhNe11oN65qay7+KEE+z6753GNp5oBPnSS+
         s14Qc3ojaQBAQ733JEm4F5NHwJm4WjITfoAkv957ylapzYkxymxdceJWYjS5APJLhDbP
         aZRUJCrsQHN4rA32iVq1jJ8rskTov5YDcXY4kdPB+VZLOLF2Q0wNcxRhRDT4sUOhXcwg
         PKDA==
X-Forwarded-Encrypted: i=1; AKwUvBxkZrGPbTZgpkxY0bInocRlorEkJbvWKXrt+fGN3DPEM2NxIl/Gdu5nva98bbufrKrBCzjzndYSDeJYIn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhZqu4YVxewqdA4QOsfzDO7/vnWR/Jww3G4E0ubWGQt7qTzTSW
	qxJyZ1SDAiPqfo6i4cd9ttmxMYkC4RIoNUKC0As6e9RxEK1Adu/I7KMbjlq9jftQMrEKNg5d1aq
	ZTOaVKE/GWA==
X-Received: from plcy11.prod.google.com ([2002:a17:903:10b:b0:2e5:6ae7:d701])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ffcf:b0:2e9:a782:bb82
 with SMTP id d9443c01a7336-2eb364e93afmr30322805ad.54.1793389002473; Fri, 30
 Oct 2026 12:36:42 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:36:37 +0000
In-Reply-To: <tencent_6FF2EBE4EF5FF4F324C8DC4AD0F39588E505@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <tencent_6FF2EBE4EF5FF4F324C8DC4AD0F39588E505@qq.com>
X-Mailer: b4 0.17-dev
Message-ID: <179338899796.2590875.15337207674245295434.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: configfs: NUL-terminate extended property data
From: Neill Kapron <nkapron@google.com>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-usb@vger.kernel.org, Neill Kapron <nkapron@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bingquan Chen <patzilla007@gmail.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> Unicode extended properties account for a UTF-16 terminator in
> ext_prop->data_len.  The configfs store path currently allocates only the
> input bytes, so ext_prop_data_show() copies one byte past the allocation.
> 
> Use kmemdup_nul() for the configfs data so the source byte implied by the
> terminator-inclusive length is present for both the configfs readback and
> the descriptor conversion.
> 
> Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descriptors support")
> 
> Reported-by: Bingquan Chen <patzilla007@gmail.com>
> Link: https://lore.kernel.org/all/20260421141010.5607-1-patzilla007@gmail.com/
> Cc: stable@vger.kernel.org
> 
> Tested: x86-64 KASAN configfs readback through a built-in RNDIS function
> instance.  The baseline reports a slab-out-of-bounds read in
> ext_prop_data_show(); the patched kernel reads back the expected 0x41 0x00
> bytes with no KASAN report.
> 
> Signed-off-by: Yingjie Wang <1075151112@qq.com>
> ---
>  drivers/usb/gadget/configfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 51df6d1d1487..c302e8dd25a7 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1351,7 +1351,7 @@ static ssize_t ext_prop_data_store(struct config_item *item,
>  
>  	if (page[len - 1] == '\n' || page[len - 1] == '\0')
>  		--len;
> -	new_data = kmemdup(page, len, GFP_KERNEL);
> +	new_data = kmemdup_nul(page, len, GFP_KERNEL);

While this fixes one case, won't it cause ext_prop_data() show to report
a larger size with the trailing NUL?

The OOM still exists when switching types in ext_prop_type_store().

Can we add a couple of small helpers to convert between the raw payload
length and the wire length and use them in ext_prop_data_store/show,
and ext_prop_type_store to standardize and sanitize the length?

-- 
Neill Kapron <nkapron@google.com>
