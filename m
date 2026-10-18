Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B483C8728
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338970; cv=none; b=Sz+asOsSzlgsG1/mrUReiCIxNyN9yoqnZpWgWxAI6djOJ2GC6ljZqbR6+5s+OCo/QmVeyfdUIO8TWNizyXrvV58R78IlHqNHrjGUp+QiEYH6Zh6ulTXTMMInhBHVTfN4uaRC5z0ars6ATvXPwmwygtrIZKECemDrH7Z6U6powjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338970; c=relaxed/simple;
	bh=+kCuaqYvwXGbWkpGE6rk6i0yD5km7LI6frQMx6b77q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqlQXKaLH9y4GZxIvdreEn601TZDr6G9jNSiOjUorf3aQx7XQc0nun2Jv/XtS9OZoFNZacREcH97G0JRJVNvl7B+f59yzBUIDCRDS0zEuTPv74ldGBQVX8f4rxN928E6yvkDZfS3aI3td99v+b9+Zxkyx59wPvn+a93GgiMlRjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbctBC7i; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbctBC7i"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e9aff12fso22316266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338967; x=1792943767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6X5sTX/gBkk9ZMFX7ZUc3TThgaRf0NfvoIWKdsJ73bI=;
        b=nbctBC7i4nP4Pz4yUNVHjYaKLCgdcCmsbu9T/0a37D6dA/PF1JQtsrs0z+Mi9wPr8L
         AuOy58guEMCTGHoxOLWxyRjkrSDqo7IdPLR0PSSO371j1zCNT3NTb4XXgQolWhfvY8cG
         eXdPDVMhOgGBmT+0BsFaC+r71lfu4Z4rJ3cR1irBcVv/akrcmlys1k9pF+Axp0JnhMfs
         1MIiKPbSVvb/NYmRJbQ0z+nqoLFDFHC+kp9PhTTQtPP6seUjDB1in4hnwAIn6FlGPl2y
         YHS/X/ailZ9YLIXfcfhWTB2mqo7sFVcVaM96MsaorexQTbudLC2jfYviQSOsi9AtN+4M
         e8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338967; x=1792943767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6X5sTX/gBkk9ZMFX7ZUc3TThgaRf0NfvoIWKdsJ73bI=;
        b=wzErl1/170X9/1IWU6zv4qPWtWCkInV64cZg6f3sN1FidxqExSpDRMUnW0phb9PbeF
         CMXhAMsDGQ2fw4C/etleOZjMnrBn9Dp3Uw9591pkTatwFOM2XtvNFSf/N0UOc3kT93k7
         qsLJfHQx1vGJho703lbInryl74Rro65vGvr1ARWMVUaB+CNdzsXUMCuvIqhI5kNhiTRt
         HyFQxjt1ED7hAnfIRSgecD7PNQhPlLVkIMA52clEXPA3mwcmkJJw0qVZ/UrMtJcd9GOx
         32vHbE0jg+zhagexSgW4XJZCpeVXSi250JmAZ7oiqHA8dXIA9mnUpr0u4OneVzcC4OUD
         W8GA==
X-Forwarded-Encrypted: i=1; AKwUvBxuxIttsrjZk47pw+7iPXOO5BixFJeF0j1CWlOXIE60ksPB04l9bN1kLG6mFyDhT7LOLbJneg8Y1GohyGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOlavkH/Nhlyyq95XUVRuutP7kc6yzdjzxLZUnho/K8S5vEjLQ
	u58ci7+ZPAMg4QgfCAKq5lm6iBRWmRCMidlj/XG9aCREXKy7yoXj99mHPmSgYw==
X-Gm-Gg: AYBFou1+glf1yA717eXwLNFotvB+qrgWvoo7kwKOAndRRoPyBmf8sSZcIhKewBiFSkZ
	Hvn9bbzV/r1UDzNEPVIwzII3Ge2NR8K7zRqFZF/JUgOO+ky1EeLbdutMtTQJSbCFGGtu10DsYNg
	Pn3OByssuO51OWEzInuirByO/CeoV1ryjCReLhZzmBF7T1PmoX751p/3Rrzah/LMALOczmvdXns
	Y8yW0pxc8fezvoaglo/EJNXapyjGSMS9JomX48lzx82hi0RMXiskoilUWeEX6+LxqZJ7uI87uRw
	+WO+xdr+uoV9/IQa4+Y/uoR+U5Ks+iLK1K1l2KszkBLETxdhtQX1sWZbRG8FZyr4h8yn1LYcqgg
	Km0QDh7Bx+Pa1+kQXeQV2Sr+PqrP3AqjS2rYNZDxvRknz8Xn8BvfLQo7gDOrCfHck90hQRodXs+
	8s8g+blP8OPQbESWA0ke03EoMYJKq7zBxYVo606lT8o4Fpu3VKPU/wG+csEja60FAMQfXUm9+E9
	6HjkbAsFS4EH9C7e2IQnektZYyJ6FgcjgA+uLIekaYRsv3VJm08Ice4vLtOPIPL2wKw66STNTAH
	v0vsGVkhZwhw5JQWvrzvj5J/qz60dGEF4U+iy5IwN4pdx44Jk+QE85sq1fEiqnf682s0ZsvliHB
	nxk/o0gRN/LblJlBUTL9GvAwamgMSPtPyQjYH6dvTYo36q171Scv3p8dhfhah2XBy
X-Received: by 2002:a17:907:7213:b0:c40:6ed9:b962 with SMTP id a640c23a62f3a-c419ea3724emr380357266b.26.1792338967352;
        Sun, 18 Oct 2026 08:56:07 -0700 (PDT)
Received: from systembl0wer (brn-rj-tbond05.sa.cz. [185.94.55.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm277769866b.78.2026.10.18.08.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:56:07 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:55:58 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux@analog.com
Subject: Re: [PATCH] staging: iio: frequency: ad9832: use guard(mutex)
Message-ID: <20261018175558.71739ebc@systembl0wer>
In-Reply-To: <20261018102604.73380-1-melihemik@noirlang.tr>
References: <20261018102604.73380-1-melihemik@noirlang.tr>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 13:26:04 +0300
Melih Emik <melihemik@noirlang.tr> wrote:

> In ad9832_write(), manual mutex handling via mutex_lock() and
> mutex_unlock() necessitates error-exit trampolines (goto error_ret),
> intermediate variables, and deferred returns. This pattern is prone
> to unlock-omission bugs during refactoring and clutters the control
> flow.
> 
> Modernize the locking by using guard(mutex) from <linux/cleanup.h>.
> Scope-based resource management automatically releases the lock upon
> exiting the lexical scope, which enables immediate error propagation
> at call sites, removes the error_ret label, and simplifies the control
> flow across all switch cases.
> 
> Tested:
> - Compiled with W=1 on x86_64 with zero warnings.
> - Verified with lockdep and debug mutexes enabled
>   (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
> - Boot-tested full bzImage in QEMU with initcall_debug, confirming
>   successful driver initialization (ad9832_driver_init returned 0)
>   and zero lockdep warnings.
> - Disassembly inspected via objdump to ensure mutex_unlock on all
>   exit paths.
> - Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

The Tested: part goes under the ---, no need to preserve this info
in the git log.

-- 
Kind regards,
Joshua Crofts
