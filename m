Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738110;
	b=hKhpot77F8zfYIQlUoOW6+hKiCHEVdXyGHDPYei5bCu2C+tJsJBBWVZzZHxWM5k47Ujv
	 e2WMSbevxHptoEFiiK0lTA7IeuhSgG2SviUaIKx3Utisr53Y4An0sxm3KRCEBasb3gRFW
	 Z6s54NmlZZ23SePc+MR1niODF8RQzlwZmUT8e4SQcxGBJmzwjMHzElMG4fEKq5PNX19zW
	 zIPZr7/FN7ZCyJWODMlgKdURsIFCgVTlfNkb6eG8Ip7P+qeOuD+bPxuesrEDEnMa1HWzq
	 0taLwd8AoN29VuenKYrG868HgX4BrI+ont5q2Mr3ShKXR+3tLUKazXJOJ4UwU4JV9ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=q9fnNuB1Wct/8OEoZPHjnr7HEm078IbGQ7GxgW+ue7k=;
	b=nbc7zVk+/zMw3NtjtKL330hYGi9FldT98Sa9zAsDgxc+pyU7bLgBh2Rt2QsJht06JLQO
	 8YnAknMPQuLNaxEmLIL2X628cccKgWRf4p7fbOkTTaS1z3PLdjvIyJr4XsQrjk8Dg7CL+
	 b4Omyvf02O+QPMKOy/bAupud2A1MAeIaqtCln328vVrxLDqJ179v0AbFrVqqwX0uUOzTh
	 +Zv3bTJA/LWNHAwVvomM8MIu+BI4nrVFU0ey4QTt37y+51xVME6ZBoOSW6WaXYTuuFhSP
	 VneErHeJerRdsQ/Q2EZIn7JKwkh67U0W7Zex2q5jj+C7cypAHcSK10NL6KKIYMdiC5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=gz3R3zS+;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC577606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC577606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=gz3R3zS+
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1512067e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793738109; x=1794342909; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q9fnNuB1Wct/8OEoZPHjnr7HEm078IbGQ7GxgW+ue7k=;
        b=gz3R3zS+wfqcCvUU2UbpHcg+EsPxlDILs3vJyPY1yPV8KluvKSeaO3gjDDCa2Pdbwl
         g0nuQNzedWXMxkGyjwp+TgpRS2XQOCJBqXMXg8xiyNmO4c5zpUyZwAbhf35IuCjOphJ9
         ZO3Uew+4rTnNBOMMGOtXj9RB3264llqqEfDwWhK1Mnsj1KOcuCOuAkIkz40dhSrXODWd
         f8BSwBZuRotbmSRfU5ylg5xUDRx5BJ6vVr71tyvgSWfQv3DRy3cnc5esp3U64b2HjLhs
         mrZH6ywWEqr7ag58nFqDG2ICp2gqzv8m1IlLdGIyX1V50g1ePtwJgO9hNM4jskGnZhwi
         BEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738109; x=1794342909;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9fnNuB1Wct/8OEoZPHjnr7HEm078IbGQ7GxgW+ue7k=;
        b=oZX3sEEdiz1z4GRGrVcn2+xc/GcaaAxA9jshUHIQER7InnL3BLm+2mHFCQUhuJ5jB8
         eswN84OCPkxgoCBhpRwuqOIDKyYEobABKMVFYiQUuOtHizWXFDspsvLFOjSRN989+ENE
         TDtPuEsvFYh0IAmLssy8AIa6ZKHqMk8G9nLhA8ZNIpa3fH9N+bsPl5m9DwxgjeHCLu6e
         vxmNamjK6geeucNQd+BygXt+fWwMH+oBb17H9+zVMUbaqbofnQV9r/c0GBYki/NNKW59
         5Ye0x+bUm4kmBd2R3M+fLFi4T6MZ0A5zKHjI4Q+nz3XsGCluMr5vjdOOjFdo6Kwwz89E
         fj9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4z8kYVffGJAjulEerMiaPwxBAxtb17oyCjgd0MzoR/fz2Uy0chE844xpdy6+hQOzLyyimCtCdKgaaubI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rp8/Lc5Ag5NfYigtXdgoR9W75BUnuuFaIFXGADxlj17pIlpaN
	yjNH6aIGYxMBMOl2n09RqkOpwN0+4FWYO3J0OaI9WeaJL2vckx/EFNWShL1nRCFZCPM=
X-Gm-Gg: AYBFou2fhyAuJzGZLdy0bLzGUemoaohNeynO8vA5CHDJ4vSZtkpaxog6e2st8ziwHBH
	0T/SbkGcmwiuN8GzEyVaeSDkCd6N4a+UDEILXG4ThOlTyRhrLF+TOGxutjOOUTOLV6YJn/QB4oB
	FqmPHeIV/tG6TTlfDOMXXf1s9Y7Gpm7Yo+mGyC+lpvp5ac6U1Hg0PMRjyTkd+Gy8n9SAE8/oCS+
	tgL8Sf1TLtRrwOrwlR7ZndJYNLPwXri7jrND0nniSWeBZsIPnCq3EeKsvy6Ans+fWvcgBZoi6Jb
	pAWLhQ4bx4fhnxOL7QH9CnIIOPdY2HUs82z3eC96u/ZHE2+eHMpm2AVlzW3IhaipciyLDCpRicw
	l0Htwp8ySkqYKQhw7Rra9qbiMDwi+DXwOXoR6oUmIL5/KE85Li6+HGJkU9GQToB0S4yWLhyCFDI
	zksWoUnOTeCQqy7ANnyFAU8XfJf0bTFsRBW2uLFGgPqKtWPy1zq4lAzJauERIAE+84N37Mzl6yO
	I7y/nzOMMVcgE64V8YenY5R4V0LqBQL/JdIMT5pbfnmrgVIX4vYHygsGAQdFr90M18vQKhC2jT6
	G+tIfCAvQi6kxv+B/bCNwGeUzIWx8KEcqD2D62b9PTetK+khegTV8DB32bOeLueKDuuL/tg2FKx
	bsfdZRBncneAaNav0E9jmQ9bZWtlwOkzoPny/7/Qh7iceS9szoKvX/4Aroh0sd0DOnU6Q
X-Received: by 2002:a05:6102:689a:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7d072c18c5fmr5571067137.17.1793738108579;
        Tue, 03 Nov 2026 12:35:08 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d212bsm155984241.6.2026.11.03.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:35:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] liveupdate: luo_file: allow keeping private_data
 from retrieve until finish
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261103181916.2462825-2-pratyush@kernel.org>
References: <20261103181916.2462825-1-pratyush@kernel.org>
 <20261103181916.2462825-2-pratyush@kernel.org>
Date: Tue, 03 Nov 2026 15:35:04 -0500
Message-Id: <179373810485.663454.14095082591432581397.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=tHMyOi4C3Mnre2HB0bf7Ye3Kluqt8+S+aPWfRyB5xw8=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6kV7B7E4arxmHQz6//CViXirnIcDK3k6F+IF8
 G2RMjjNCuaJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaupFewAKCRC7dyhM23N6
 3mpPEADHu6Ct3CLDFw8h+kmZSVru4v6jD1/kPyqBbFgPi31cJh1bTfQMXGCjDlEzSOivapKaQN2
 2v/pdI2q2vwigrPI/DlXzZeWXZPTB4XeUFZNYc9LOkOHGjIgA0kqQcQe5wvgxZv93gnSG7U5MCe
 fNeJBdLPFe4VyDYlD8PPXmI8y32szJDuil5a9xrCoUKTnT0TicuuhdzsohzBIIa82svYrXJ2jhA
 m8xLRbNbsGzvGBH90ZRBeaAmOCpk4VPmTTDROI/y/X+fqMbWkk+niFXnHSjDgH1ulybqaNifL+s
 e0O2oS8tujnsw0bs/Ztt2yo4EvklFYYwbAgzPtbRvmo+pk9DIpqYb5kcERbmU0rB4zZvll2ARp+
 JgRcXoU+h2FD0f6GZACwh7yKwiffUv00MwWqxAtPRjtDhVpbeS9cXRHX3RZ9EpFeJHcXSXDCJsN
 VTrUwITg1oTg6nnzpJPVn+bVu60UYx8kd26BJSKbfiieN3W4xaEIl6vZs+cTm9R3RO8LbBX/8kJ
 aJaXh7hl56jKrQ1mbIEePSvABtuiPTQA2ZvFaPa086+0VDvcpIvuF8Zr5zWTG3Ps0MnuJwj5t9O
 GGbbagRNeTMAhWqjRv4qsStCFg6gcyAMeXHrjuvJUbQTIWRNHwzM+D+zUuhkLYZV8O4gETBtydR
 X57ZvJBdSqeDlhw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> The private_data field of struct liveupdate_file_op_args lets file
> handlers keep runtime state that is not preserved. It is set by
> .preserve() and passed to the later outgoing callbacks, up to
> .unpreserve(). But in the new kernel, nothing set by .retrieve() is
> kept, and .can_finish() and .finish() always get a NULL private_data.
> 
> Handlers might need to keep runtime state from retrieve until finish.
> For example, memfd will need to remember the folios it holds on to
> until finish so it can release them there.
> 
> Save the private_data set by a successful .retrieve() in the luo_file,
> and pass it to .can_finish() and .finish(). The handler must free it in
> .finish().
> 
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Link: https://patch.msgid.link/20261103181916.2462825-2-pratyush@kernel.org
>
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 63ea5417de84..21caff8a98a7 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -36,9 +36,11 @@ struct file;
>   * @serialized_data:  The opaque u64 handle, preserve/prepare/freeze may update
>   *                    this field.
>   * @private_data:     Private data for the file used to hold runtime state that
> - *                    is not preserved. Set by the handler's .preserve()
> - *                    callback, and must be freed in the handler's
> - *                    .unpreserve() callback.
> + *                    is not preserved. For outgoing, set by the handler's
> + *                    .preserve() callback, and must be freed in the handler's
> + *                    .unpreserve() callback. For incoming, set by the handler's
> + *                    .retrieve() callback on success, and must be freed in the
> + *                    handler's .finish() callback.
>   *
>   * This structure bundles all parameters for the file operation callbacks.
>   * The 'data' and 'file' fields are used for both input and output.

Please also update the stale: 'data' argument here.

With that,

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

