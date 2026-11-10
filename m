Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308506;
	b=2FcH3f1yfch0CGWNKPzxwWEOUgBtODPVyt3K0AKLBGizC9EyZqTEUVIyO+uJoqtqFcLI
	 R1rbunPmtrlzrbGz1CMLLmaibRlboFfKSV8NGZqXPVmHEciZD1cfnFtWVK4hZijWKVTbo
	 3n55eeWCFw34sG/oZPcVOvL43RQ+vApkkYOwOI0ncc2l5ONOURRWvRTIv8uFITg5mdZO2
	 nKwiksD7ttmQjzUbQVWVds+vjlufvjp8OEu4uPsgCGxHQDBvt9Y1o8V5req0A3zx2pRhS
	 IPYelFhKH5PuZW3MgZdgOt19H/fSmacpwG9jlwffa/bkA5Vkm+ECTfgGtAdojhAW0Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=u+pnAEAogTXmyhvTk/a0K5L/Z3iUQwLe7oBpKWqSXIY=;
	b=m2njKn+k1qvGCxF/RqdvKlIB8sLflbuHDrjfoD10dk3oEGAADjho2EbSzHiFN13v6skU
	 OBseRLyQ86/LybBoJ1RPbJSEBG8MCOEBUUIrzYUMQ7qiScy3QdXCntLjkujzRfptCieOX
	 m9bpfT01NOtAgn7OUaLjPHHzfPz/6knvJVlkCB3Zx/h+btJFmPkY/h6RI4wWSUPbmL0YE
	 eNyIOHZ50RpRIdg+tFyPqOnM9LQIDE3ZzgPQm/+u8/uKBaLbu5ag5R1i9Fbx+llpyxRkR
	 ORPS8W8Urm7ZiE6qz7UmK4xsDp7kTCFHXghpD+gJXNuG8wmp0IXWQkFBi7dJW14XvIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6CpH2QA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21440606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21440606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6CpH2QA
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso11046565ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308505; cv=none;
        d=google.com; s=arc-20260327;
        b=rf3dlnzmJz/UqAkPsKiKH+hFrfs80Lir4JjAAEywkieYhwdeFiFB7fex4IpbIisuMI
         bgNehuBMYiFF3tZCJGkDNOKO02bHeTZ3RTirytFJL54t4i0KGa7cZiBKMzP+7rXad4nP
         omSSAmPRY6cDMb6sNBTutQn9vQi7Hmpx840A+FXplwc1f20IKBREThNQRuC9ErEMv3os
         EU2hdbtjUdpWHQW10fpNRCda1hGNhsL+8Tg8wdukivA++oalq4npfJQYbVeQ57QZjT6S
         EhGqoEGW4kC+h85zF3O4YPyYwG2zvsP4HvWo3PP8ZVOivJGiggKrE34gDX2VmOGRlRiZ
         x0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u+pnAEAogTXmyhvTk/a0K5L/Z3iUQwLe7oBpKWqSXIY=;
        fh=lZxFHXO8lPsI9BfknkpmIYDWUGphWIfAVwyCWNl/gkY=;
        b=XPwPfpMd4eZ+hYA4i9/CYaNvuUs3wcsyLkZqHPzFN70pgkzKsloxppyrgJ/tXkLMcV
         gXj3O/tZtcrd+/9oRI5wu1oFQ4INf6fDfFZp1i4qQmQ+h9dPcacaHfEwlz3AtkSuNQg6
         +bn+rzuczypXL3nA13bw4yWRA/X2ZEYig/Z/bChCdGxSkEBSmvh/s6ir6HBdmvJ2akx7
         aYz2PaUnh5gfTRBgrZCr5xUcjkAYjhrG4nYDGmP1+2g3SjUcBXQ5QqcxVnOBkiCHUVQB
         mZOAuuRCzqIVUBy97GnytPzDRXKbMcLKeLq6arZu3QoF/hoCoxrhkCPEMi7kwwJRwM/9
         jjgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308505; x=1794913305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+pnAEAogTXmyhvTk/a0K5L/Z3iUQwLe7oBpKWqSXIY=;
        b=K6CpH2QAdWcnrcYFW7uzbntgNHVlc2ZPun+RNte09gL6keXZnCG6LkK5P9++2uIX2G
         TZSWKv3arrwywERbr8QJwD23gVplqEJKBvHgFMrtx41aqBBBJT0Jr37sMHj9MggJaccy
         oRWeQ9YfjJhUn2jNQo7JF4HC1AqKM5/xyfp3+ZvRVsZaGt0nmaSIbD1wa5ZvrCTodEkl
         WJxOyHa0tcWnnxc52gDsbNQuFmWiOg8csI/F8ruTFjGzPkIk3s3eLVlKs34Fngoo4v+1
         L7kjfoiXBDq8mEahFFIXIaMvS+MJA2IuKdZMpmvBXvB+fWAVQVi/sHXoT0Vn6SwF1bV6
         B2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308505; x=1794913305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u+pnAEAogTXmyhvTk/a0K5L/Z3iUQwLe7oBpKWqSXIY=;
        b=oPBie0E/Wt8RblJC3l3qBTUCsv76/Yctopjs8diaABaoHBxnHBGibVUEbvBRDbuaV2
         QfJosbakm4yKM36Lfx9qHohOAR48CfsmbnJRhlrQc0bVTnhJqkT2nTq3d/2oHV24Bgam
         vB2aVhkc12mcukr6ejNQsL3QUxnz1leujPxdo2aEbZ9TQIye1OwCAYwG0sdTX/D5aIbI
         PpcGhVjOoqT6ZzJ66xI9IjjmUDWFEgJ3fpIUKfsasjQqCxHM/9AFvGGWzIhDony3KAh5
         /azRbGRNEi/o7bCBQbCbaodvVsjuIfY5qxGEzHbS6Hqwm/ceMPhluLt2y1V3lcqDdHu+
         7mOg==
X-Forwarded-Encrypted: i=1; AL+hErEL0v4ZnhzFh9RvYPU52YDUchxtvBSisbWoHQpAO0bTk3uRE0OC6PTOguVPwngnaWe2f7lGkZnp0FqtfIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z//KDDb3CO85qzHj38RQB5KrPpmPAz0hdO2KyHZ5ocxDSHUFd5C
	+WCOh0rty8DUTVyLNrWpUwA/c3AM/I5dy5kfLX48fq4YnFg4LAocw8OkyTSAzbjZXvpN6zswk0L
	8EfSUHXjizBRk6xUWk19xn2PuHMjo3CQ=
X-Gm-Gg: AYBFou2FF2t0Yqa2m/mqMFvARdyNY1zhltrFeZmfYE27rDCnWW++TOaHkdhhgunu1+o
	wFGTLhnHLDQOtRvVmqD7lJLvVDWvNXLd5mo36G4IKz+nkyWSnckfH7/SxJwn7qzE2i0ivwQAk1r
	BdMo1dOm9hWVNFh4T5nGgxEcnbbYAHvuYPwMHX//7q8pjWFbrGLbc1lXpAuueinBZInyTxN+jXx
	4aZYLN8ar5mAQi8+jPIVc/hNJmBe3NqgVr5Da+prmaXxbpVSj6rgfBW2+NSbBFRRldheRlJkg9U
	BuFGZ8Xl4pzU2a6al0vBNcP0peS2fsB5UQmCwNyVBTqBn3M+A8sZ2XVR1fki4onz4PwjcfgQAs9
	kcWAXeSbrhDUuDOZx8+KrpmuTk4zCgJ40fATcRdcDAPuWeC1gwm25baSXxAlSYQTueD1YR6TXZJ
	3t1xq4Aw1MC1ItoOXTF0BPWN4SA1DSciVzdNRNZLwFOvuQSHlsbEPz0NGfajqp2GfaH+t4Aw==
X-Received: by 2002:a17:903:2282:b0:2e9:5714:6079 with SMTP id
 d9443c01a7336-2edb91f238emr22931735ad.31.1794308505437; Tue, 10 Nov 2026
 03:01:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109084342.51865-1-phucduc.bui@gmail.com> <20261109084342.51865-2-phucduc.bui@gmail.com>
 <avJV68gHL_jvZ6dZ@ashevche-desk.local>
In-Reply-To: <avJV68gHL_jvZ6dZ@ashevche-desk.local>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 10 Nov 2026 18:01:32 +0700
X-Gm-Features: AclHuK_WH4hOWPrihC_Nnz1Ye8k0FcFOdmrzVk9_s62_8IblVFD_31IpCmsJblg
Message-ID: <CAABR9nHZ2XVLj6a3NG-0_fhDWvqZPNa=AX7gJosc2NEofaXfpg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] counter: ti-eqep: Fix runtime PM leak on probe failure
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: wbg@kernel.org, David Lechner <david@lechnology.com>, andy@kernel.org, 
	dlechner@baylibre.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, m32285159@gmail.com, nuno.sa@analog.com, 
	sozdayvek@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

> I'm confused. Why the PM runtime is used (and announced) in this driver at all?
> Do we have upper layer (like a bus driver) disable power before handing over to
> the device driver?
>
> TL;DR: what's the point in runtime PM here?
>

This patch does not change the runtime PM design. It only fixes the handling of
the existing runtime PM state and usage reference, ensuring they are properly
released on probe failures and driver removal.

If there are concerns about whether runtime PM is needed at all, that can be
investigated and addressed separately without mixing it with this cleanup fix.

Best regards,
Phuc
