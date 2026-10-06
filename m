Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C637269C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312121; cv=pass; b=gDmrqfbN39gWWPFhc+UfUfi/ggRS4Wkl77cV++u77a/2KTJfLC6iHpdjqKAz5iU5GaZ/Q7VuaciiMBF1thjmkcVZEYvcNudrOyKkcmNqWl74v3eiYfVd9n3f38Y+WTTkqIlD6B656ROlhzKCB6nyZVCPkHlsy3u9g8CRV2R01c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312121; c=relaxed/simple;
	bh=MpAzFgxVWCMOvK7jjl5NbxEMkYdvU1eQNoXVbITb2nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRTmYxmeVEbP0zE5KE826ZBAXnUmlSB+W9PMkM9DWEgUn4wTb1dAIMJ0Js3jGV18Zo9O083myDnrB1r8VF0f8etH8OOfiXEqMpyg2msQgCgbSCIx5azihvVkvBaT93LHqvRGX/v2oNuii1lNISRT41ZqrcqkHYakpN/TsVFTOc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6uV6t5c; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6uV6t5c"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-144e1b6d52cso1229c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791312110; cv=none;
        d=google.com; s=arc-20260327;
        b=DcGH1dXRhpJuyhmau3oEMTVdIol+Amo/RCJF38QSfAKqF9F9VAMg8MBXo6AJehQzHb
         NiubxSc4zPKBH+Fjt3N2qDI0fx6oGITW+ANy4YYFr7KczmmDrFfTQPvCb8LdcIoqsk3Z
         IFnKyQxkzI0ZEFeeLooh0VtbBZZDTI5/XrzzmBOwF1giMUY7bh8TW5Pwza4xI/w5uDHD
         qR5aX4hS/y2qrl6WvLKzMiwJJX24UBvnY+yOFOVTNrEYtF9D/kRp3cDyjdQ/nmhVuSQq
         QCLfP8ISBXixYjlm89GiQc5K38j59+2CW1ytGfTRF84l0xnkMqfs5XvXVaKerrzkI4Sh
         0tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ndOBpyUVrvLUL8/BucAq7YTN0AfiGwI+dPlm0Y1IOo=;
        fh=iMe4tpMnlbpUrIquNgyGWZG3sh29yw3Tc5EqJFhk6AI=;
        b=nWKP9BCui6ODSra5SsEtJK8Yk6qCVnHNMTZuub3m3Es78iwf/UIQDnHOhC1WA9nc2D
         OCc8CI71rEjmui4snPdo5gAF1KpjOnokJIjN12Yx/SxX832Q2ipSyd6lci/atCf2yE7F
         U3DRrqVi9tAy2LOf2zswjUX+JAiwSRfiQddP2oddDHhwLW2bOb+TK/2geVvVf6Av13BL
         O5ToGpTQlVATYs6qhCXlvEXsQx/X0iTGjdJf8lT4cIwxY00TcUc0IueYgkmxY6TvMMDe
         7/cms1GuIwxnC+vgDP23EK9JwcGpjrUwXbpNR48fBPJs4pNj05NTjhJTO60thccGgV2B
         WEtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791312110; x=1791916910; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ndOBpyUVrvLUL8/BucAq7YTN0AfiGwI+dPlm0Y1IOo=;
        b=D6uV6t5cxilTp1Chf4NYnLBewK6R7vOxuEO1LWRldrmlSaiUTlna2YczJ1QTNJMIvY
         7El3vroNyPVvrG+7wjJZyFgaamUB5UkaXsWiM3nE60rakNg0qunxyoaQ2CdbgcWUuY8P
         hamDVJLYuZPZqauhpItsZF6X+ejgclt/xSyd+FzrkznN8YiEEUsq1fyKcDf/pCzgrnUJ
         nImAI/7JEnJonvn2+/qgEbk+ui5C9Vw/snV1SGQmre57vIfglz2eCqgV7GlkZ6BJq2BC
         G497kaAIEIQTWgLrTqXd/nn2GimjJE1OmuMCXmPRiN4LbNJ/JfHOYtrpg2JsRdA/Xag+
         s39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312110; x=1791916910;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7ndOBpyUVrvLUL8/BucAq7YTN0AfiGwI+dPlm0Y1IOo=;
        b=cqagbsXCuj1imTDsBw5dmBlzsc0nEIyhHaH6EG7x3WhYWMfX1uaaql6Q6zd8FazBGC
         J5x3bXOj/WtT62WAVJ34PzixX55U5i+Et6E1gYF630zpxtD6YMKiuo/QAMl6/9i2y3wr
         1nI61txgHPnQNpLcYBy19Y0jSgv608iCRjJ/Tl+Y1Ja6aR9EHSn9rs1lnWYPulHGZIdP
         nZjPSwwpLKP7X8t7qXd/NedCzV+aYQCNUOly30vH7xkGTLIMGfML4gYwmWg8zxdbmxRq
         l/f566rj1gfLHRWbpe0gPG7/FYOUBfxtDMJGVe1YffhRh1Rn3lR0pEyO+W46RsS/dn3T
         YkkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoktIA2xAqbLklDcl+DWypv5jhtJyT709LMUW7x8NuQoEt4lBuOlRON+UXlNruQrIahhfP7nlthLpJC+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kAQvCsVOHQlAq4mcq40irDxcjMiXE5W7nbpufAIUAYzaLgmLmN
	5iNUwmX0Zs6bapdF5uSEdS5AaFSe8GNsHD/1HTuT0rBhAs0kXhtho9GctoVR2ZVUP/isxXQvQyF
	jA3+YSDDlw4Ad+HIVuu5kQUVQzQ0X5zOT66eFuRU=
X-Gm-Gg: AYBFou2iPqgxmWcg0bdc4YXvhBNn7X1E/JhS9Vq5rOlfZniTI+xs3UU8/BKwugS49zU
	b0V6rsF2UbwdZ5mHaW+i1gJy5b+8hZQ/A6gqAr76775xwpbrKsXAEgRjDBUQWXw2QhQxd1FGJbL
	pfv8HU0zlcbQ+vwU9UTHAhGiJT+P3xndj7Pmrpst7g0khkt6EuGJ0diVPHJLJXI5BdoN5v+VzWz
	Bl0JwQ9JdGZ+JlS+nyaFlg/jUbLXyG356G9HL9MJ76LHfBUZKpoF3B5F5+0nRQfk5tzAIeeUC8n
	VYpg6U0OeGCWx7cRmWSHOKx31DVGiXJZcQjD5jvYpUEwl8w7qTWrvUs5FqRgyVf1SifU5HtQKuL
	UBxxekighfASlH8DQg4WqMZQ3mhuFXBB4z9DE
X-Received: by 2002:a05:7022:28b:10b0:138:38c7:6adb with SMTP id
 a92af1059eb24-15df40d24b7mr384153c88.7.1791312109409; Tue, 06 Oct 2026
 11:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com> <20260924173501.856380-3-dmatlack@google.com>
In-Reply-To: <20260924173501.856380-3-dmatlack@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 6 Oct 2026 11:41:38 -0700
X-Gm-Features: AclHuK9FyS0I6QMmX8Zk3xjrz1tbTyWGWZU5DOqGZ_KGJ50pE4yWQNuil68MSKM
Message-ID: <CAAdrzjt51Rduf556+BjDb6-M2mfDEgnTsbxTO3JHn70uu7sr5w@mail.gmail.com>
Subject: Re: [PATCH 02/15] PCI: Add an offset-indexed store for saved
 capability registers
To: David Matlack <dmatlack@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 10:34 AM David Matlack <dmatlack@google.com> wrote:
>   - Each capability allocates its own buffer, at nine call sites (plus
>     one hand-built by a quirk) that can each fail independently. Four of
>     them (AER, DPC, PTM, TPH) ignore the failure

 After patch 1, DPC reports the failure with pci_err(), so at this
point only AER, PTM and TPH ignore it.

> +     *val = dword >> (8 * (off & (sizeof(u32) - 1)));

[...]

> +     unsigned int shift = 8 * (off & (sizeof(u32) - 1));

Nit: please put this shift in one small helper so the two copies can't
drift.

- Josh Hilke





- Josh Hilke
