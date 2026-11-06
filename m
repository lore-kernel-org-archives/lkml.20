Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941518;
	b=FS4vRtuty9BEQJ6IrWGp8/JFTJ7oEOr/KLanBz6foGXTTu8Yc6YMHeuPROpxtdkBqnmo
	 Tc7JXJCeY1LUVBzDZnRzmPQZntwdQ/XJhisv4QV6fU7y+9tq3mOYXY4Hj4rJDB5/iHx17
	 M332G6ONDDc46D8z6QL5+Hu6u2ZGz9CFv8FaVwDYH/fa2ewcTUHsc5B4B22omOsu1cwfK
	 z5dRxWhZOlYNkfi2UbpikkxpI+vK04TM57T6Im0MDw7O9SB1+jreQNYWqMyiVMu9Hw95f
	 zJIet7Gsu1xPs+pW/daLNrj0ZkH9pDD+sAr2l7ucDu9JIhXrWd6aTIPFmAcHWiMPcRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pspHsxwC+1fZ0eWgExmZb4edg4s0MDST/6bYFdzne0M=;
	b=t8v9nrDKc6+P9kkagHQ6Plg2CiVZ8DJ0S5CjBYlbTz7SZH5zcaPA/s3qaEZyS8e/CZfv
	 kK2dzZIqCzVFNG6EhMH3schAhIhI0oLi5jYSp9oSD7YmODfNqbRFYoWLhs8NXwAfRhy0k
	 PZpIvkxvoohdy8KBt5W6D0Bo1gpqWWZhEwUnbrrJF4jijDtvSOj1kNQHjtc0htC2jgat/
	 1RR+LvA3POWNL8OzEQu5n5lfhXFsY1HKeD0eXLLGMnxDTU0PP9cUvGhbhlQ/rfh6EdZv0
	 S5y7vbtqZH3iwycIKtt0YXkxkUBuzCabwOq8nwv4bEytQjP8FivB+s81ina4TJMDb2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9xEbZc+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAB0606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9xEbZc+
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5383c97c8cfso29011cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941517; cv=none;
        d=google.com; s=arc-20260327;
        b=SevaM4u3Q8qqhmuIo8qOQS8YXnXlmCLReyx7izkUxkpCdedLiRsqLBbQiMzgjCVWIj
         ZHQY72qsrmkpvTHbeaeiZXyVczDai8abLjYCyQLBybSV0GPfWB3Ju8DM9LHwG12ko0+m
         DawXQq+sQrUDv9JmFTZbnSx/nFAt9vfdNalfhlg0JYZXleK934ODlMhi/HCsKALFIQWC
         4mbDVUbe+LKmLIT/lPN4W8AFBG07fn3vkKuGAZTFiRrgR/A0+lksBS+J7gCvpPvijUis
         HIBxIYySI11yzl9UEjrTUJL9VMm3SLZBq8DDexdOiKmSyw5FGf6bAWcgZtPFZcId9ttG
         9nAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pspHsxwC+1fZ0eWgExmZb4edg4s0MDST/6bYFdzne0M=;
        fh=a0Pjm2BSRhaY3BqGqQGVA6G1xORPT+NTPKOHlqEoF9k=;
        b=q+RWYqr0nfPL+mBu5FfHCas0k2Ses4/5UdXRE4Q+Phg1ph0QwLWbBjaLPZ9rFyYHnF
         W4rk1PV8yvet78iyzd/mKAvxAHmQgwPIx2JjghW2r8SxaHPCmIpbtQcpjcZNToEvVVEB
         KsnmDYxL+1n3Weptez/YVh/pWjWikt/mKUbagp5LVuwyUNaK1Oxbr7sA3+1GTmSLpV3y
         NxKspp1aX47TWoNsXvZfBEHvemmrfemyKrIHYyFUqnpHM9X+RvboBmYeGCTKPeZiczEJ
         kYdnYsYiIdRnJIU2lermF+4jHolNhF8LqRqoJrv56zJF8TvTmVB578s+69BWCAa1/68T
         MxVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793941517; x=1794546317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pspHsxwC+1fZ0eWgExmZb4edg4s0MDST/6bYFdzne0M=;
        b=T9xEbZc+DwJsTIZJ5kRLvQitoKGARhVX9+FfMjxC5ToMew5+z4yZqWm1MXg5HZzJ8P
         q7Idnq2Uza6VKP4NVIJFQfZfXm+4BJ8pGqN+GjsCejEfftMg7PkH3flJzv+XMoMsMRWz
         Szv5py7JQwiVfTFSbwJe0EbWkmYFj3ZPM+w7LUmmdny9NQkBVe0ie/3otmNF+/dTKSdg
         XT9yHhVLYe/jo8Yst3WY1Sgj/q6XU+IRF++RaC3jV+Cmxzk5j65I2Xm6r6UYpXZfU73u
         nLhiExVdoRmWctIOxkyDuZOS22GG3mN5f1uNVTPvQhArGc6RosdnTZghPOw9PfyHpZaW
         OJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941517; x=1794546317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pspHsxwC+1fZ0eWgExmZb4edg4s0MDST/6bYFdzne0M=;
        b=gkOBziQGiiNu1ORZZLlR0Io1pDchgyoBvjHoTbceGp72foVvSwSnH1CxdNRtn/ngys
         yqMygD14ZwauKofCKhqjXaMceb6BxJYocGBCbS8x7OSg0TPM4RdWM8yvMS5JOpmsVGwD
         uOTIzZczlyYI11l8S+js5+4+yzkXozgtEFMGCQFw2lm06vNR3tQG+o9359GBQftYL8Za
         4uSiBlF2LvJl8+8+2IlxKyw62akO9VrQ6VUlKxLl3UuK4qKmbChIe3TvmoeBDJWbq2t1
         77s8WXLesNR6eSqFPO7R2KWZrl7YsIVNmCG3UArwX+AJyimkXrVbFlQRC/ND9SPnd9HY
         yweQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj9StThIDkwZT19UkEsYSFoTYR/ao9j3zdtgBchBm471UekxTgrkcd97eOAEb8JW4MX3keI3Nuepbkw5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xY4ws3nTUL154HOP4YQMzk/KzsjtW6vlT9KOtSQ9fhgLR/A7b
	UqzYC5mzeug5LqTuFBHwuFtLCaWFLQyGhl04EGNwBgbZkGxW/cOTmnE0HnMgIQTmu5YC7F9FKjr
	z2+KdlhasdrLLGNwLFAbLPdl/qqgSHWmRtJzXVTSj
X-Gm-Gg: AYBFou0ZWgA78LswxowFbQmFp8Sb15LIGJElW5wL2cdyV7Jw63tcfAB9BztOCJ0aOme
	BC0WUoUP2ltRirT0a9oBkOuGUW3tbEUkbbn7XoQl3v9x8C3j4ts9am/xBRkqn7EvkWv3mzBSjAA
	Y1Viq+3yaYwGKfRMcDLSnhX+o0yloo4pAyy/r+psYy4SEtZz4vOTb8qju5rnULinRkawpXT+lDm
	4l2k01Wu75tWJrPYX6CkIVjbFlLTkH3LeAqYKV9lCorj39RuyCvxFHUYaOym2+5TXWzQ/EEPZq2
	8orxJ0WkUEZWP6BxCZ00mzX+Ywdnd5uwGRRqyXcm4VgmhpemsaS+7EjV6+XQ38GQFYeJwtzM5tG
	bH1nC3fw6dcgoz2Xgp4Bqh5/K8ymxh80Slbr889rsp34BvtFLnLBpJoIWCXvIhR/GJi0sRniLWd
	TZqUh1emv6aWEz7MT8p03m0MuQ
X-Received: by 2002:a05:622a:4894:b0:534:313:9b4e with SMTP id
 d75a77b69052e-54e96052d51mr2220171cf.5.1793941516495; Thu, 05 Nov 2026
 21:05:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-18-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-18-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:05:03 -0800
X-Gm-Features: AclHuK9lPryylgvZTsZT9okEXT1mwwp0Ro2hcmwenAEz7x0RSOlOJWzdvOWsQcM
Message-ID: <CALMp9eRzBd=wqOkL0o7f8utDbBm7Gturhyd1tirVKbeSw5=S5w@mail.gmail.com>
Subject: Re: [PATCH v8 17/20] KVM: x86: Expose APX foundation feature to userspace
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com, 
	Peter Fang <peter.fang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:23=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Expose the APX feature to userspace component. Update the maximum
> supported CPUID leaf to 0x29 to include the APX leaf.
>
> On SVM, do not advertise APX, as EGPR support is not yet implemented.
>
> No APX sub-features are enumerated yet. Those will be exposed in a
> separate patch.

Per Section 3.1.4.3.1 ("Intel APX Feature and Enumeration") of the Intel
APX Architecture Specification (rev. 9.0):

  Any Intel processor that enumerates support for APX_F will also
  enumerate support for APX_NCI_NDD_NF.

Why split leaf 0x29 across this patch and patch 18? And if they are split,
why add the leaf 0x29 plumbing here (where "case 0x29:" just duplicates the
default case) instead of in patch 18?
