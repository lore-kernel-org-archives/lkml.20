Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793673466;
	b=SMGTLojcFDA7RFHIzsyBP0VNbjIGlnvU1Je+p97ujnk98Cy/Gdg6Wl5D9c0bLvfo8cjH
	 ozAM4Sxc7PXzx4Tjgz67ODXUEz5DkusHE9A4hn59ygg26VeWJRtm1IQFBp94ZcIguDkv3
	 Utj+GQrAWvBf5wxFEKhXQPbrvXUrz3qxpMafSO+ieP4rPiRgEnr5NpFyx/UkEoS9R15ks
	 UgGlM82Er+oC3N3PIx2Q7HNdtTnuccHCZRMqBwLs5jFfCwm6GImeS2ar+crnAvwAyr+Qo
	 ev8lKgvCgpMWVfRjdGQ5CxsiHt+SpoMYR7rXnY96qq4g3qr4SdEEvAwHvzAPygJLeiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
	b=DL3F0TDMYicbuFUPlLuXOtfevVEFhcYVqp1Ad1UfIlPQllm5l6iMRETOkFbI0zs0umTu
	 q5eVS30nF5KWaMHYqVFiUZ6X5NHxVvNQGPCKxq6wbS5eHPhjt8P/drhCeyBEls1LNOrOX
	 4lSEWpAelUCxz7jo1LwEVAWj2ScDieKKi72n//DVrFtAwup80tEBilZ3oZ1oyLdVzbnat
	 Ik5EBnEjfLh8YpE565KTYb8bfunBdXCkoGh+HaoJIqUCzmG7bY3E9i7iZg0kIdiinVSjk
	 61CqeUTEhVdJOfppTusuuUdmhwPyXEOHDiAXTF2ICePPghRk/iZDACz1ZNvUioIRV1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCtrHkQk;
	arc=fail smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B82606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B82606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCtrHkQk
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5366463571cso45847181cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673465; cv=none;
        d=google.com; s=arc-20260327;
        b=itS/lOe8nQNYnd3ulvY/u7EF+N9v8my26AqLsFuo65qy84x5+ehwqCID6TyJQS3zGe
         QzHJp0JXQz1QlRoK3adTymBpGgTF79GS0GgvOise0/D/BRUrdYm96CuQaSDZR+ISgD1o
         aM25vmt2g4JXKXldoYYXCSd3GOSb1aMvcVxQni8nzsvcL2nXaS7SYsPsx9NyUS0mzUVX
         vfcK2LsLBt8rwivIT/cJ6F0qxJzeXfM/DZiWxlGVdCMpaEvd1YaeFI4aU+a7WzBjrqLh
         dpi9WZB4bX5of3fADgLJUWN3q9q4w0DETltOjMU+O3zJ4GZOhnQI+JlXMJeXG37e9FDO
         /8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
        fh=k+FDUqCBh5qJQLWSvMH2yuchI1386fzuvXFHJ1sXhx8=;
        b=cJo3zGbpMx122n1Icxp09x+nBi23rYB9EMMoc6IblupSalFxrN6FyS7NWfy99cM8mx
         23ZiCu+m3aAO9pYzH7EiufGZDlHNqiLikdd/ScTAcdXqpZTecxeYZLQO931GKVBIZQq1
         5VpL2oa+T7NsZ18oVYMtHaA0iE/YShTJmF35eN/HDxNY9FYkCv2xYtpsUVgZnHWmxb9J
         IOOdbc5aYtzagA0PLi2djJuKlw7N7OPds9zK3/HmbcI8UZ8JT815vCHASmB1J0pY1Kc8
         nzmVIg2nQbcB23TNLjbd6a98Js+eIMSmgcb0isEvQJGe2Q1iUGI5JzCFBtOODDSQw0Rh
         6h6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673465; x=1794278265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
        b=LCtrHkQkks1Vc9cShisAjTrT1zXR6O1/JU2MG8G6pnGN/yPwb+XvlQRQiRBwZ9sd2T
         8+v9RZTK8VR4nxCdjRI8QiDPCpy23JOPdjE9EqctaKL3g4DA86sdxjHQ+QS+VI+H27tD
         Sj0Sq2KQtunKPPtGa+NHup2tIOfq5bLQRfPba2o9aoRgbbR03inxQmP5oIFYVz5VPLt9
         n6FAtnnnIzWSkNsLDnOdAWwFPLFnGWpYaK6ejZwfVmvbqqt6gA4AQHahrXvg6hhPVyJz
         iSaugX4vZ3NfTz9+SPDq16DDQ1uwDr8Pkj7iULljNJjQ9suBqYK4x+AfFzCDC725RwZ4
         J8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673465; x=1794278265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
        b=khran8tSBoixTNDvmOKobHSQ/oM029DUCyWdB3WDa2mbWCIZYpDYfJbFqtjegqpClL
         w5S+5Th98w2K8d43CXOVTxfQp0ri0qH9Yed7Z+tr1WwbKfKoKtGWzDzaxMJGXEW/SFRF
         OamHx+VZivEeQW19Z1l6PagExaZUy8kYtL9LmoIXZCXCPpN917OIpBE1Ed94oQYGzu4x
         yR2HNA4TXWPVgIgSpmHwwWwViV3oDLp5Wa3h3XYJmmkkEnCmlbGPHqb7Xx4vnmbXz/gb
         1wsrkhpqPoemR4ReioTJ7sg4b28nqPvcmnoWtcy4VePUjSHlknVM2vEGrY+9Sm3w69dQ
         S6rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjKFMK0Ul/GIMSOLsB7cv6Kercp7A4ksGLnALqqZ7xi2MYevIUQU7tl4HeKsutfToyxom19b0uR350eXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JkDn9ERbcMzNmoWhCcTZeI+PH5IidKgOuNiXkCo7J0Zh1fSBI
	4lW1Imuq1PDc0+0KZL6FH0DW9MmTQouvGqb08A4jMVEBcxif/OCgsxg4kMRFMJ/MfJIwGmRRI7g
	XyoQjnJb7wdJpWAwarAxNaius7yOeO3Q=
X-Gm-Gg: AYBFou1vYDr52ZCt3NczHtsTrioofC3kgzqr+1hx3qAT+9Ija6r4RN8PtwveOTCIXBj
	3HeZNEJm9rCaShVTMM5Gw3MkY/zJefwWYv3NlD2hCGadkcVhHeCp5A9TQu4tWzGBIRiJ9GKiHHa
	7r8jWJRQZVt9aMkeg9HdC/AX05xnsMSIU1ioz2S0nlFzEJfTcbtqcVOF/npCn+wKA/UquyvLx2c
	SbawoiF31GUdwd0svixCd6a6MmBX/c+p4s2Sqcdt0SsIa0Xgutdda2wBiO90FUVrD9mqnOxVB2m
	/dk8jNDqYZWyg7iWAbtDC+phWWUYJgdKOWlgRZNp3FObPChDXcgXv2tjvQOxCw49FhivOBI3F8X
	qFvvgGYE2/VSIO0yxHKfLKneo3USkrBUcu3weDwlOmGUg3Vr4/OGWCpjazRymvk3Z8XUjDUh80p
	bLKjl4oJePiCNnFNy7T/ReZoFLBFKu+rSSRjHye7TmJ8yyEVTdxYXbD1LwRp4syr7mC0JYEc4EH
	dkb25BkwKIs6M/XLyWdycmdOcmgWGO5ydspmuap33RTspA=
X-Received: by 2002:a05:622a:1b09:b0:533:a8fe:e430 with SMTP id
 d75a77b69052e-542b6593777mr202082331cf.14.1793673465209; Mon, 02 Nov 2026
 18:37:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102150757.93058-1-sj@kernel.org> <20261102150757.93058-9-sj@kernel.org>
In-Reply-To: <20261102150757.93058-9-sj@kernel.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:37:34 -0300
X-Gm-Features: AclHuK-Jg7-xraD80qWPaNaA0iIrhVFnMpsq1hNuG58d2LObr6cS1Stfw00xqhY
Message-ID: <CAMAsx6epLXuUjaV3J0=SWAuLvajr4h58DTM9gL+LMmaCyjcxUg@mail.gmail.com>
Subject: Re: [PATCH 8/9] Docs/admin-guide/mm/damon/lru_sort: fix grammar and stlye
To: manuelebnerli@mailbox.org, sj@kernel.org
Cc: corbet@lwn.net, rdunlap@infradead.org, skhan@linuxfoundation.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

> Docs/admin-guide/mm/damon/lru_sort: fix grammar and stlye

 "stlye" -> "style"?

> Fix tenses. Split long sentences thereby imporove readability.

"imporove" -> "improve"

> +suitable to be used as a trustworthy access pattern source. These situations
> +including reclamation target page selection under sudden memory pressure.

Shouldn't this be "These situations include"? As written it is a
sentence fragment.

Thanks,
Daniel
