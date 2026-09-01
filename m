Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96473C10A2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271567; cv=pass; b=o7UsbuVdQxXaqhvYpgsy1Ym/YZ7pHIwEcIn3FBRG2q5HzQgRE3/RYBmEmaIMJl1ipbEBpp/waAtHX/Y+h4hwqranAu5KCYROHlZgev0ojM4Lp3MBxeER+ha+1y0c0dZmzvYNwOCM6OQ2NdATTVBOtKAcnii2kDH8Dub7quySx+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271567; c=relaxed/simple;
	bh=4q6iuHKZ/050PNB6y0beFVr46SQsOfuApu0ccHHkTuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jfz6IN5cOsz9fwctxwBF29P65T1FbR3fHLCp8QK25v1gtYWLT4k5CDTWhKiVo7pEJoFrDAQCZEQJsn9okOTpbmQyPBlB/OAfDslUhJXfhLhnSEqV72NUeP9cKjED5Ck9A2uEf0st+7MAUH8mxyzsqlt3TFKj0cQMUbyXL9l7lwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=AJkfkWHF; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="AJkfkWHF"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7466771f1caso268644137.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788271564; cv=none;
        d=google.com; s=arc-20260327;
        b=mS4OgU1TTgbYVgB7XCeLczeZSh+QHs1BM74km1smwYDEVp7rmctEi4m0wWLL+4lMhI
         aHD6umMO9cyyYH6UiqjOB7HoZEsJyOrMJEaeS/brVpFgucKALqmoPawC2qyMtR1SEyQk
         +VkbmZGufnpCB6eE5nsodx/xdXnuvcYdjJo/chJdq7cJs5U/E+cKIVTrH/12xOdWko6O
         A4CgTS5+cOv3n37RNzOcP69HR3prOAXXpYO3PDBz6T7FYKDtgwZ87A9ddZ69XoZq43ku
         dKBACLThLDwBz17ENtoc+3nz0XgyFYJc1rC0aXto5YRtaAUg3V0N4dOydihmHoftZlZK
         wxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoBjSKSvVy1UEYsxbY/vRWyWBXYVCJ0DS+nH66eBBn4=;
        fh=rOvTuGzqWiz3r3rR8gLAa0fOflPKOscpLdA0oo0T+3w=;
        b=ERgaBmMqP2XnitGV0UbI9bkEWN6h8v8bXc0iH310YXnisCKqc89A69q9XFkh6ZeFAE
         w+pQ401VmdRYJ82GspE/LEydHsIyfATzLK3wgq+aQib+vAL0uJ7iTNcPbL5bcuqbnUlH
         HIAbGJprJugfcp4A9/U5ZCPU6k1DoJjaWGGIlP3IHY0Uc3PHr7tftW/xlqVkIhMx4hP0
         P7x0HAiVC32p/oCXhLM6S5OhSqCUDAoiMkpRoAF5pl5wJr7IZRDmt27wefExHghdUyvY
         7TizVJoNfBU9bClwh/0S+MxGF7/AEKMTVO0aqURqfPy1IKvi9cjHL/TRvpta1OunmrLf
         5Q4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1788271564; x=1788876364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoBjSKSvVy1UEYsxbY/vRWyWBXYVCJ0DS+nH66eBBn4=;
        b=AJkfkWHFgouF1QLMw4p9x41XAUYQKXUJL6PS9Mxs9uzWanuHafqwN+S4ZQloiAiPQA
         U7afngQ+LPJd9mTCzKCmJgPgrT5S8zX0OrV3IjJrpjqXCxW/z8sUe48A+YSeP9YNFjUu
         D3eZyurtL1w0/Hd4CSP1CBCWA4PpdWy5nVs+gp2z81M/QahGpoknp5tRrjabEtFesKci
         OfQ2VIhC2f3lKJXCwcaA/Ugo+VMNLOezXTCLEYhzs1eDjD+6MSPl2Sj9omXmQ1HIEjH1
         /c0h25tF65tNtMqo0nbC+dV/oE9xcGwR0NlElIRCWwvU73CnyyG+8FyAbyBN1+s1imAL
         kRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271564; x=1788876364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoBjSKSvVy1UEYsxbY/vRWyWBXYVCJ0DS+nH66eBBn4=;
        b=CDM/kmEZ6ouARYH0918MDCqu3yy4FQ6YH9wP48NrJvxZmrHQF4yo8CQDdup1ZQRtFu
         t4bVzzHtRWba/5/pk60H+rty3Pz0z42nObiVHsB+it7PA8qs19zfxivHfbCps2ubioSO
         WtU2x3PWFPO7a8XqveSWJusrgIwdqXE/EaVO5rgWu7D7uq/xCh478N0r4eQNFxS0ZXPu
         VUb0zSZdLw865uGjVbjloXKGYagx4npFgwazyGx1aZ1WjUrZ2AE5F7Y+6BuLHFYA98HX
         EHmCRdMPHTu7D4/k86ibxTjRYDDntpseS6vk4u5rZrzZNo4PGq0rm+qEjVpEoVnciEvm
         WZTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA6gddRC/jrLxFiW9mckR3JpBXB+TMQL6G4dYQ/RhNgsTxiLqeRER5QnzHy5xWye3aEBPlIsLBtDYh8hA=@vger.kernel.org
X-Gm-Message-State: AFuF++mI2j50N5yv2nvxcjczQxaxprXyc8U324RJQdLEfEyO67Yfn4VW
	MC8sSvtiYEP9G+7NWeo8v0sYErRUyQL0agxdOEf58LTispDrF+vTdsj915Ws27uI3181CM7gItW
	hpxKxGWil/gtY3XVJ6ohtggOulu69IQkEu0VL6ZzoDsY=
X-Gm-Gg: AR+sD12FzqFQk0zdTK+bZ4yVGX5tuH2A3xKkCheYDr4r7q+WeSeU0PFW3D1GOFOy9WN
	Xz6D+74fmOoq9KpYU0fQSH8zh1lmMgh4uxNiYVMqsDSa2v+HT3PcgMtzXfg3miCtQTP+2GdLeMl
	DepRZItb09FfywVrtiz2jOLo+YMScwkyo8F1QT3of+q8OC6AIGpCRi9gCi+yqsh23GjhPjKLZi9
	vgUZG6FUnr/jNWqStOkFAyLZBPCwXTSN7I2E9c9dSuI9mJLylfFp7uUyrOJ//7BG8wexmVOzgkL
	UBxL4ZCjKdhT3twS9pyFKnemPJ4dVMDWb1QKTEfSKA==
X-Received: by 2002:a05:6102:418b:b0:778:721:53db with SMTP id
 ada2fe7eead31-7859426191emr10137186137.0.1788271564295; Tue, 01 Sep 2026
 07:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828150203.1419003-1-diego@bynar.io> <20260831125045.479576-1-diego@bynar.io>
 <0abfb2d2f99e54aceac4cea63947b65a@manguebit.org>
In-Reply-To: <0abfb2d2f99e54aceac4cea63947b65a@manguebit.org>
From: Diego Oliva <diego@bynar.io>
Date: Tue, 1 Sep 2026 15:05:52 +0100
X-Gm-Features: AcwNN1WU18vieHng4ytPQGO18uS5XIOEm5pHMhikRsNphUH1T23WWbWetU5SBiQ
Message-ID: <CAExJZk2r1wycZPrkvmFpUBM+3vyOBpj4+FAqs0uZ-ZUx5a_jcw@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: reject out-of-bounds DataOffset in CIFSSMBRead()
To: Paulo Alcantara <pc@manguebit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:15=E2=80=AFPM Paulo Alcantara <pc@manguebit.org>=
 wrote:

> Shouldn't you also validate the minimum response size so that you can
> safely dereference the above fields?  E.g.,
>
> if (rsp_iov.iov_len < tcon->ses->server->read_rsp_size) {
>         rc =3D smb_EIO(...);
>         *nbytes =3D 0;
> } else {
>         unsigned int data_length =3D le16_to_cpu(pSMBr->DataLengthHigh);
>         ...
> }

I've reproduced the scenario you referenced and confirmed an
additional check is needed.

> @data_length is now unsigned, so use '%u' instead.  Also, print __func__
> in cifs_dbg().

Will do.

Thanks for your time!
