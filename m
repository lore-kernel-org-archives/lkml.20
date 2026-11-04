Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793787882;
	b=kzidYOI2WFHMpbAzKbl9VXyxHzCxSFNEc1HabKf8ZTtTfBWs/gIeUylS8yqYv6amt7kU
	 rFax2DLexlGgc0gZ8VQEs69bKueMdkA29BS2uF23L0YHzRk6VG5nmj2M1WJ0XJ+he3/AX
	 U2MR+6DrGAs20GJQKbdFNLrQ6kzq/qUVcbenf7pCfQqGMbNJ2OtteOpunJN4UjQcFKd3h
	 KFy47PEWoVjnZ3/LSFlEAzpk4nrmoIztRtL+SCu4KnQ8KzTe3Yi9/LYdvIM3M+fxwWawF
	 XY9cQtL+eSuJbGRZhynf/IKh08ahWRKhtsZACjUg6mp3PIcU5At2D+cy6ftCKV8Xf1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=+dcl/erqXSVMqWlciMAxF0/KBcxrMf17dIv8kW6c+wM=;
	b=EJ569OocSvGl9yEMHLkiVToltA3G2P16KUf+Gmgpvlfs6/PyZ/tIkBQSU0GkaZKJfxv8
	 /BzylQ3VAzXt0KHLzpRdaQZ/pSs4Jc8Iu8fKCjMiXR1gLBOvkmVwOH+bSE1L2sBVRy/4f
	 /HfGseWpr4hQ+dNO9/iGeh8cO0WnyYbI3DeuiUuIybqq4hR7uomCh9tZqYmMKgfgw00Jn
	 loV3wAN5wucQcK4aNmlxzjDBp5SHIDqAt6fHPKV7RIfzdtK1QD1OpHx+UnYZfPK6c7v3b
	 ZYJPk4hnaNvjBDIQRoBDn2nkzraah89q0WcQFJWdtsimohokUNLph6PXAkGJ2Msi7BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B179lsik;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A7C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B179lsik
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3aae7df0971so3881271fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793787881; cv=none;
        d=google.com; s=arc-20260327;
        b=Vj5o5DUBT6LU9CzGTcLk/gtkE5snGUvNTOjNPgTchn6AMRE2BB+v1RqJGL/lEnP8nU
         LqI24sUQFue4rU73nkBxbV5oy4+tWEufTmLyQk7UUxKP5TGEu8Udxkt0vPfd1xrL+S0C
         RekVwpI9EtRz6NKP/9Gq6prDIO7sX1o5yd8AGnhBVu+GnXJ0oF+BloOLy/4fQdiFiQVP
         PO8uQJ0CL9zbAywmO+wGX/l+NmlP3xv5eE6XT4xRMpP8cmDpAa3gdax07fViFj2N9ZOi
         7CLDwa8OIcUO3YUzwhfAPdJ8cEBKpDWMoOaY0ASE+aE6xuRQpDtplKiBzocTwvTIyrVt
         Vb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+dcl/erqXSVMqWlciMAxF0/KBcxrMf17dIv8kW6c+wM=;
        fh=Tb0kcc9eMlwgVWRFBr1oS1jztLRJyzdpmw0ggcgRKZY=;
        b=Eq9w0/aTgk8bgGw7woN7nJ+ne3kKu1wfjplPOyMbgorMS4sdPeXq5OW8Um/9uU4fvv
         XsBnOXXgbbEWkZgU53zPjBHQ+gRbqqRANbpQCq4a0KNtnNYqO1NDuxD86HVpZ01SLBEx
         YoaG+flbW0CJwyk9xDLCIcX8Z5eMsmsJJcR123Iy5/146eaTgK6ED7GjzF+G2Amvil8X
         NJ0Ep87dsdp/0UvTc1gC8Rzdn671GO3SAqqfHusFCXnQLcvyP2L0uC1HKiTI+t1WStW+
         XlOEOCNNWZAB2VNQmY/hQJo3sYp4yQ8YT8spqpRJO3uxxGahboteu9id+Fyie/x3t9yw
         a4wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793787881; x=1794392681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dcl/erqXSVMqWlciMAxF0/KBcxrMf17dIv8kW6c+wM=;
        b=B179lsikAo3MCoRa+xYIU4+cZtrZXD43+xWjXxmmK7EU5jzixchIfy30KlADnrT861
         iOvQoQm6BBNZdCJEH0Q4WhyLpdI8kZdvfbbQNXoluGnrGFoHLA1WtHksMSh5Z9uI3/N5
         ClWvmr/7fzJhhdoPSfUrsEdt2Vms6hp0PmDFXu9ly9n+lduev3vRRHwF0h0+YmYTcai4
         1mysWtx6OwwvhVco8qHIUWDnpfCe25Ijst9ZbEymg41mIAehVIGkIL/PVYWeT+FnL5zw
         H64u/RUyB3pt8ygIkFMF/DJdsTmn9Q0smb1O8dPO1Ya6tWfIYpkI/Y00oMahoPSz5fH1
         r5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787881; x=1794392681;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+dcl/erqXSVMqWlciMAxF0/KBcxrMf17dIv8kW6c+wM=;
        b=JmuL2V5OpGzuqtyZX9JJ+ymzuTSFrgANsCoitxaKx+MY22YrhG9RaDdiUl5Pvc/+s/
         XbvXH7Wf4ARYqkWqWiGzxmmuEiIdx+SukCfnvaoghBKTQEil4A0jyTkjAobcZRrevaz0
         vwHyDpTVdkz572eXHlkT7ct3F95bTJqL6igW7XR5uSTDNuLbrfy+r/Wd24Kftp8T51wL
         7wjfRZCqYu6tf6F+d/q+PkAYhiyKma4d7FH0CSq+PR5imBDSK6xw7IhXhJJS/My/v8Uk
         /OV75a2+/2V2BLH75dFue7oRWxbFOxJN9qaR91gOI3jSFwV4xzUOvAmixJbqEJfPqP41
         aOfQ==
X-Forwarded-Encrypted: i=1; AKwUvByPuuEHVKgNgjwKA9pviYGz3xSA2nF9j3SVvHT7jUeeXguqXEd8QLzBBsSR8bU+AFyCl1pSrDbVdUiYXDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BbV8o1eCh71jbrUh0stunr1psDW5j4jK6dfdKXvMoGVOu4ibn
	9cB6dreWZ7nElLIQtd22TFHAG8/aJVp5a2Dm0oyV/x2Q4G+7SCmQf/1NsUn2ksWxiRJh1K9WAQ3
	XjzmMUi++qIFCGvV2QGrXMOlViRwmB9k=
X-Gm-Gg: AYBFou18W/bx7BCqLGb6xixkyhA9xxF1aS1bPG2PCgI/z6nP+4Q3AiaoW7s3Ap/r35z
	Z9qQkzNwUcGcMS+0fSCYSwgTvIaZqwvltkG7gqLoBhfVdWTgCCiC5Ylt6vpZAVM0VNvFKBDuPzi
	IFimUkPN+hVT6Li2zrLZ9dlAvzC8NdnvPrnpANKWC6qY9O8w1ZKiQDJJ76tYfeM5BW0daFpF+W1
	23j+8kJBZFEWQy7A4Qhm3ZBueiRzNHL2Ezlxvv4pOf5EzejQvKpLDh8munvySh3ZVUlgLTVQ+Br
	C4VEsA9EDFham6O30ncf3Z3Eyo9hM7Zpj2Wan3cOpGU1yeAhRY5si9Q4F5Ml/ALr9JHo05Bo0qG
	ghLbtUYbBfR99rGKGLoLTELOhUUhjkI6uPVlIyd92c4rDsEWY3mSS7QmkduJEt3jtBg==
X-Received: by 2002:a05:651c:a345:b0:3ab:3f60:51be with SMTP id
 38308e7fff4ca-3acb7b52404mr37108141fa.28.1793787880322; Wed, 04 Nov 2026
 02:24:40 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 05:24:39 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 05:24:39 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: zhang san <shunsheng1218@gmail.com>
Date: Wed, 4 Nov 2026 05:24:39 -0500
X-Gm-Features: AclHuK8mKYrOLw55T5M7eaMYFOVlEhEP6K_xnwt_-B3_tP11Fu0SQdsrg4zyZZ4
Message-ID: <CAGTEBTZ5teYJyMk3o8-FZ897OsSgwVdFDpvKoKdfA9vR=Bi=-g@mail.gmail.com>
Subject: [BUG/RFC] target: PR ALL_TG_PT traversal can dereference freed LUN
 during removal
To: mkp@kernel.org
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

We found a use-after-free in __core_scsi3_alloc_registration() when a
PR REGISTER AND IGNORE with ALL_TG_PT=1 races a concurrent LUN removal
via configfs.

Problem description:

The function iterates dev->dev_sep_list with
list_for_each_entry_safe() while dropping se_port_lock inside each
iteration body. The current element (lun_tmp) is protected by a
percpu_ref_tryget_live() reference, but the iterator's cached next
pointer is not: if the next se_lun is removed and freed during the
unlocked body, the loop's next iteration dereferences freed memory
through the cached pointer. This manifests as a general protection
fault on a non-canonical address (list poison).

We reproduced this on mainline 6628e7d4c6b2 (v7.4-rc1) with a
KASAN-enabled kernel: a GPF in __core_scsi3_alloc_registration() when
the PR registration races a configfs port deletion. The reproducer
uses controlled timing to expose the interleaving and is available on
request; control runs were clean.

Attempted fix and design question:

We explored taking a percpu_ref_tryget_live() reference on the next
entry before dropping the lock, and releasing it when the iteration
advances. This prevented the observed use-after-free in the tested
interleaving.

However, when the next entry's tryget fails (the LUN is dying and
being removed), there is a functional tradeoff:

  - We cannot safely carry that pointer across the lock drop without a
lifetime guarantee.
  - We cannot obtain a live reference with tryget in this case.
  - Our prototype stops the traversal (break), which may skip later
LUNs that are still valid and should receive ALL_TG_PT registrations.

We therefore do not consider the prototype ready to submit as a fix.

We would appreciate guidance on the correct approach:

  1. Is stopping the iteration when a dying LUN is encountered
acceptable under the target core's PR registration semantics?
  2. Should the traversal instead restart under se_port_lock, using a
safe way to identify and avoid already processed LUNs?
  3. Is there an existing target-core lifetime or traversal mechanism
that should be used instead?

We can provide the prototype patch, KASAN traces, kernel
configuration, and test setup privately if useful. If a fix is
proposed, please CC me so I can test the exact revision and provide a
Tested-by tag if it passes.

This finding comes from an AI-assisted source audit; the source
analysis and injection-assisted tests were reviewed by us.

Best regards,
Yaohan Li
shunsheng1218@gmail.com
