Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E143C0A02
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376321; cv=none; b=gn5iOSsz4Ti4RayPR60bGR9/GrwglCOs8MTXcW6EqXAbis3KOPhPEJtULhBDewl0ee48zZiKgaGJ349X4u1+1wCSKdbPMzYcjvgI4u7WtredXA/KtrqHM68od5i2JNyHQkhW1gidoKl2kWXHgtrc7afKbeFDbD0ehrcO/plXcaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376321; c=relaxed/simple;
	bh=kJ5ncMSvegAnNhdbhRVw2mSH3KpS7DVhK/tcxbmT4LM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HZm0CAvJO1U7PTdEdicAxKPkw3CRItApVx1AKE+E0exglru1TdXKZSXMtUwjFpvBi4mNG028dbOwIVUzi6Tnndqr1WhCW1FC4sau+WWZgY6U4+BZUzjotGec9tjTbDhfK59nQzFdC9Je0MRqtX1zRLbbkwuwC8t43csicytD7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDZiqqDx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDZiqqDx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a6cf104827so1114766a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376312; x=1791981112; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJ5ncMSvegAnNhdbhRVw2mSH3KpS7DVhK/tcxbmT4LM=;
        b=iDZiqqDxNH6YZQHtJD9OA3X13numpAH3B4akc2a2a/S9YF13oKXN1O6KcjClEb05Wd
         edzd6PjJA6YVQ/bLmKpg4eZk0jufDo2GiiM5PmxcrGf/8lhEQ7yxmhE7M74BZkJIcT9J
         YrW04iBBF24JHksU8K9eFlEJo4KsWk3LwxheJ72PTRJg0yn2oReghAqiHbic2295t1Bf
         Bbh+y/NCCi8KBsnXKWwemE4Rm9DJ4GO99fraK5HCZvsWf6PY5B7Ft8GaWLR6Ruc0JG0E
         QE6reY3AUf8JDD6pxC2vgygA5CM+UfbV+TPVaepm9DQABrEfg1n76jF/YzIAk1a0mjAn
         hgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376313; x=1791981113;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJ5ncMSvegAnNhdbhRVw2mSH3KpS7DVhK/tcxbmT4LM=;
        b=tl0GNwk1x43KZs9ho1zA7TnsRGkK6Hbe/45qjXH6mmK3zfZ0e623rGUD7mMZlaPD6a
         lyxAPuiCVMdmeKEIsb8RdWRn037EoZdmVr1x++2Vv5Ii96GDvw6YFHdf1x5lOdZQe2Hc
         II3AXAaIZmYxunOa87tu8z0d6i2lAJ9TdYv0coZS3isdLC2YWwqlFTgyqSROkyxycBi4
         76Tx1zkUpQ+mF3miLhSz3miUqYgaB0d/+pJusW7AIzA0DuWyeGsjqb0c0R/O2NvN0eCh
         dIw8mtqrZr7SyfRgBjNZPv4abYPSEVSgQ5mI5TGHUwjBrAz2l0EcGkxz9tXqXSDyT7CK
         YiVA==
X-Forwarded-Encrypted: i=1; AKwUvBzoX4MntZ0mIIKZWuIIBKqyohl+D/n9WAqRqMpgNvqH6zucDyg1yPGZgJGxGWGdUkKtvzQK6aLqfYde2nc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKqPkoO300kZdziqTjxzrjnWo6E65RN8MBUFAmLn/SuCJuCvH5
	3IKS1RlBeX4CKVg/2DPj8RmSGVOagfetQkKe2paUevYNCevdqbs7agxe
X-Gm-Gg: AYBFou3rcele93KiA7KInBLoBHPI73UbYrTX9L5De7Y4tA28+hITWUPHciC2VB1jWzo
	AaPNXHAsZ8LldEQobXZGQ1D1oyoFE0lXCRHY230FzIGcRTaHQ6JbLhYBSqSjPwdr5jOVJnWf/KC
	gXNsL+9W2iI9d6Pu8Cf5CmtVGd3UYfZa3j3O8bAJVbou8Z0UMC+wNBpBSwFqqQrvEmoDm+fIg4G
	k3KIc4kXSL6HqfiNJlSDyjvqRtEe8ZPbA5//ACV0JxZF7t6xTo4UD2kIDDNVORSB8rJ8TRlPazs
	yLy5mhXy2RxdK6SeipmsEm2ybUijn0nTWoCRYN0meACDimsUHxLNOs6wj7y/tEej4vhQUFRNx7f
	//Nz/wN1xVfdRBuavSJvxyHqIlF3XfP3wzsopY9SDrhqUvoMZWxsbOHB6MJK4sqNICDRQiy/ff5
	k/uw2ZGo7TSv3aeoXdvnCPr/6KGSJmZiJXpgBHkBITo1vuCP1YeGRxnbr/NHh87Ovv5wERBM03H
	wiOvl2w
X-Received: by 2002:a17:90a:1057:b0:3a8:bb56:f450 with SMTP id 98e67ed59e1d1-3a8bb570f55mr527249a91.41.1791376312526;
        Wed, 07 Oct 2026 05:31:52 -0700 (PDT)
Received: from localhost ([103.103.208.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b7727a1sm4555003a91.17.2026.10.07.05.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 18:01:49 +0530
Message-Id: <DLYLWJJD9EC0.3CLCLL4O7K9KC@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: replace uint with u32 in
 hal_intf.[ch]
From: "Pranav Desai" <contact.pranavdesai@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Pranav Desai"
 <contact.pranavdesai@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
 <20261006200751.819332-2-contact.pranavdesai@gmail.com>
 <2026100644-willing-nucleus-82ce@gregkh>
In-Reply-To: <2026100644-willing-nucleus-82ce@gregkh>

> That's very odd, shouldn't this be 'int' and return either 0 for
> success, or -ERROR value for an error?

Hi Greg,

The driver's custom _SUCCESS (1) and _FAIL (0) macros are currently hardcod=
ed into the caller logic
across multiple files. Changing rtw_hal_init() to return standard error cod=
es in this patch would invert the
caller logic and cause regressions.

Replacing the _SUCCESS/_FAIL architecture requires a driver-wide refactor. =
To avoid scope creep, I have dropped
the hal_intf.c changes from this series entirely.

I just submitted v3 focusing exclusively on explicitly typing variables in =
rtw_security.c. I will address the
_SUCCESS/_FAIL macro teardown in a separate patch series.


Thanks,

Pranav
