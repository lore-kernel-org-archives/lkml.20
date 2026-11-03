Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715572;
	b=gR1+vF4JXBlKBsH1p3nuWDXKYHu/n9Wh8xSCesX8w3y4+WTHhztJtemaGEh8hb4WLPtf
	 DRXzZhmwQM7KR4ixiFuD6uA6HJCz9HgrK/je4h8Qo4LC6FxA9l+tct5m3QcwpUogDaNwq
	 bBI/4zQyqUPvA0eNyHJQu7GI+JWYY0IyOX/f/z+ywWKCFCqnqjZC7ngQ4/kyV+99y4Mxy
	 qKX7zWonY88yZZX+J/Iw461owVjyggxkQErrKV/G39TqsSgHb7G5AmqPIZu1Gz1a2WHGt
	 EYcQzKd8ohWF2wfiTaHEMVEBpZVUA+7rWbxlGkQVrCEX28OdncuWudzleu2g1OI81rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
	b=bG6t7mIVr5wdbiVFUSHuRMIRa5h/kcQxaAIlkIMZc7E6Pyk6M6DOpvhfYLWsVVk0Ntt6
	 1Cwi4JjtjcSUClyjYR3rI11R0IlUkOV6TAKDNgBTOJmF2seOlO2UB42ufPvGeuRn24RFI
	 n+wD0hNfIhvy/0fvS/NpwA3IuXKqfQN8Kw43uIIOArPTYmI3tsKbHy9uyTTOsFJppnzYS
	 l8Dx2Z4KYOM5QsvrnvAyYQ8oKnSW7xjBXNj/0AyjI+0cEWpueNpyLK2a/jYGR6gW5FSQL
	 2B2TkOe1DyhBI3EbNTBiII+3xc696bNJ8pX/lAyaouvz9+MQ8w1Pp2BkiJTl/jnkaFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYVuS7oN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E1606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9E1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYVuS7oN
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4fea434bso631496e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715570; cv=none;
        d=google.com; s=arc-20260327;
        b=eef3JT0b6GV9UYh9tc1HMFSEDnGFfuJGf3cuPjpfinerZDFTtu6dFidldeb1jDSVGs
         Iwg71cJ1U4g9WQInHCVMRLHyViE+w2MyuJxNsWljE4bcpWRTU0uehNywB0j6H90S7bTh
         ioXxQ5LsQ78RoL4A+l4Nywb4fVco9snulMHISyxhhxKpLf4Hqc4GfXy154qdY4ddHgHm
         EWJbwxTxJ1DzTTFaezwTipwpmxXKc5xEGijrDGy6LSQKS6qBRWISbsSCAYobxrujUZcB
         Oood43KejhmB3/rD2G5KsF9R1Wo/z9DqhI5niR3KV7h3kDWWSEBOGaFVxiFS2mtiNlkw
         8VRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        fh=WDj+LhTgFFi1ykKGVnSIQ6uKa/MIEd1IjNDu2ui5r8w=;
        b=hJnw+Njxdxqn0S91r0NSwtQRPG7OXAExXWlY5BrswhaUey+T8Sjs7JKmcBrcUY8uuy
         5HOUjA03+mDTnOhMRsyt77W1UUglpalOkAIEbwvvvk1IGVoyxPH9mQ+351jHsGvmIW3l
         Si0asAiZGboXWZzM8U6GkmG1FTlXj0mHFN3qVndVFdmlS+IIaaBtDtthnrU2HWWaIeXh
         SHOPwTBe+4n+q3FhJDIOJjMUSm574XbNu7j/92iJ6ypusgZ91W80e5wIFce24c5fOAPI
         qs9H7KmVTz3jAhv8xQX8OXdBY2pR/qWRaMivEsfbvxkoz7JS4yayKtdymRb90UaP9kJw
         nLig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715570; x=1794320370; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        b=nYVuS7oNjAC5uc7MgThJnLihQh6ecZjNLU3BG73OcVWyDUz/zUpCmKWRdP3Uw7XMsU
         oyjqxVh7rNpgq2yeuVgz346VhA+PrdpJSYX3reNs0H+YTX1Qrt7Atx4AGdLblnf6DXGG
         QUQzf8Gy0xw+PKLt5C3B1MoQFqqGyW3skmOqmH0avdWqG1m9nwVwXE1maS2knPLmckGJ
         dBobYx2IV17qf4yXHSfQG32nQxeiCXnfGdLwQe3G0kJ5mxE8oH6XcqlA6uCDdGdPO7QO
         OWDpjVMnu/9SCrw8VCHgJSW76JtDOenWUU4kWrwMoWCMsSboev1GDzWn5fdoRGOtrOfu
         Bh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715570; x=1794320370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HpFqXDcZjRJLrcm2pPsLXGktcBKbRCtBWwGzeKIx7/g=;
        b=jR7pPl1lCWKjicZ+clv4Rp6ZBOk/A4IQjzVIezOsIc8F2IJU3MQeMRVFuN6H6AmPNj
         Nt9tP0md4HJ7MlN3fgjlOv/kcG87nkQ5TA+aQR4MRg2mGqFZD+LrhEBMyAXIxaahtzhc
         Am2c1NeYMDsJWiR6GPP6mfNZt4RZjQg3CMSoaEyFOOkrQCEBwaMs/oBv+FJzFyoqtomP
         QLbqg1JqnmrnHJO7tT+qhLdEOEmzIHAEtJeTMBk+7G7fKvCwtoYpn7d8mEIIApN6GOZ5
         +fT5yRDHTVgG8E5/SP4O9UzmKVO932q97Wxj0csoU1P6aM3hGDeSN7M76/oyeHA2upCg
         pgeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+q3d83IMhdsVJmICe9j2arpG7uUkdDtJ0gvhfHhK5jTsbcZFK4LaBeP4IsaQsHnV3KTOG7Bog+ZpFiYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0OjixMbbmp7PDFFOVXP7lfoENHJvbgLdPPQ1OiXEFL+lEtYeB
	6gK78rS1OUfHIiDFuhNWiKCzV7t7FCfiNYV+3VQdqabVKlLVPLaR3H5cwVWDtGiMspxe0EMa9gK
	ez3BcJzEXq1+PHsxwvr7OS+3D2CtYdec=
X-Gm-Gg: AYBFou1OLB/c5MLNhNGrAkbnjnKFU7SAEzJPLcYYNbytFQG8rwLBsTo4CM9BfAEYbjg
	BCbTijPfPqBcByse+OovWxo+LmyrVyf6KFVh/zH08stbMxZMBVrZTjRGMkHcjCVIEMheV9mBL2K
	eGfZd8SMSfgE53JpHypUxipwI8Df3wLPJT6ZwqPxCe5RUOHGucNNVFfdWSXVX7jPKLjjmOrAyCr
	vF7pupXEIaplQtHLEiWHP+BwGmfe3ym5CBpjjsGX192qfMrVZV5W5CBSGkUZb44TEzYqu8DFLZK
	nHjGwLFGmuroqNDf4FB0msygoBVB7vw/zgJYXU55Y5z4OBUGyow3eGLXhF9yAUEc3reA1YRrXLC
	BAqDGJVQMyrt1B84robtVHUFsV2yN+FYOvaGD/aVLT8I/IaO64z3L6xRdfHaUxm9lQUAVZlcNNB
	kIjN2iPLu4Cleucn06rC9740AOiawGiyDhuUq1Md4nb3u2o6pjJOplwO6Y/uXhEjNSCRk30toJy
	IVl66l3xaEpCXyZ0r6n9I8QmEQ0rcQBZ4Bs1f26Mhby
X-Received: by 2002:a05:6512:361a:b0:5bf:d2aa:abeb with SMTP id
 2adb3069b0e04-5bfd2aaacb1mr3055248e87.20.1793715569649; Tue, 03 Nov 2026
 06:19:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com> <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:19:16 -0300
X-Gm-Features: AclHuK8iuWx_PT6P7N_TCJlCYwfej936uif1OBa0Pk_vlcx5ZLqlhS-8ZHFWdXc
Message-ID: <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Subject: Re: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
To: ekansh.gupta@oss.qualcomm.com
Cc: srini@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 01, 2026 07:37 PM, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
Hi Ekansh,

The document reads well. I only have a few wording and consistency nits:

> +The driver binds to the device-tree nodes described by

The kernel documentation spells it "devicetree" (no hyphen). The same
applies to the other "device-tree" occurrences in the file.

> +4. **Context banks** (``qda_cb``): creates a platform device for each
> ...
> + They are created before the accel device is registered

"They" is ambiguous here (the platform devices or the context banks).
Consider naming the subject.

Thanks,
Daniel
