Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA73AAF64
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963478; cv=pass; b=XzWKLtf3KqzTnoDilFm7gCZm52iVv7oBqzVLWOvg1X3Aei1HWsTqDDl7L85CFEq7O6VFbixL3Yn2zc1C7TAo1elMRp9EKMT6HeV9pAGAgnqFaNTGgdXEbyQvOXbC58Oj18SfNgJJ9nAgl0JtRiNvZUz/Qxk+wl/DvUueWqohH0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963478; c=relaxed/simple;
	bh=nZzkVN4E9BSqcDIHvzqxmjz4QVuzVLP/YMY/poyCrxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDOeEWbtXL6w3u4MwLh4GJ24faXpdXkaCAb0y3E6UINhmxcFsUZFoMfUHahFdV1zNAPTSvV4WZyADANoMYzfgODunbbraARGVsLGU4noZ0t8ExljlcMLNdiDhd15goas/5lbNrxg1NoZlZSoh0zhbkCxo3AyTU7a2ONGCJ2kcp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=fZBnIU+n; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="fZBnIU+n"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a006d3fe83so722685e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790963471; cv=none;
        d=google.com; s=arc-20260327;
        b=X+W+uXN9kV0R9XfdefW9DkfSvAY/JPsFFRFxR9juFLaYhOby9g/biJmqG+FbToe3f3
         bBJlJvzWv3mLjyVw7XIwHDtddk4w5Ghc889VIz8F31LwgXoehkgyG00FZYrhCHAkdOHV
         n0nXucX/tYm5+2MGgE5T/nn4oRzrfo/mjTa7C3W4D2r3OKe2kUC1iKRQmvYGi62o4zCU
         QojhDN/u0PxFL8zRK9FzHFTYMrViOYPkrPwKJOMQVRPVFxl0zYer+pB/IemjYHkbhC2f
         bwhctPKyvYyBfTMuN7lj8vPtxmAaGt9d+NhQBGEi6LL7lmlIacIBzUG5ZgYZSeHiTQxP
         UCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjRLkdydNH/3hEGomUeQ+SayV25kXcztDM+0WcU6ndM=;
        fh=6yYZ+n06vesLXTNGCxhmN+FPMf1XFvYWJcgtrRezr3o=;
        b=hfN9W8zdb1ENWpmICt9IFYHvXyaHHTeD9X+iiyCNJUAaVkof6FXn42j9Pul48jeOuO
         K9D8NoPMGcdHxD2XuwDqB5T6rPMS+dbllv8P8Ee4yyD2Zf9/kvNjol8BCcsJd0bGy7uW
         +cWww9uKRL9bwCK2+72xXU4gMP+sPyXuvkTgi19VuVlEMkaFl+faT0TQ8pbFIlDQFp1T
         2gkkhxi/m5J+5ADuDl6f6R1XQU3ePyHjmxrjpQlIa3NAlo+AIxudzpIQ4thkUhcAacUf
         2TBaRFpwYjMcWjbpRre1oB+kvd0GFQj4giBk9Kj5ADX90TUHC0HMrVg330w8yAv1bz3R
         lhfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790963471; x=1791568271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjRLkdydNH/3hEGomUeQ+SayV25kXcztDM+0WcU6ndM=;
        b=fZBnIU+n11krhpzVwUJTdIeMx48YQOoasgu11dWqDQSBeFutdTsb6BFXfmi5oojz6q
         kbR7VnmynxieKV/K1dL2jnNqoCJP/ILDktjVVdsQdK84JQpgkc7QbpVJWKa22WoZibfO
         uoCuzRw+QzryPoS7edqVT4vVod5Z+Fe3muAcoUfEaDJSjMX9NZSBolm5eiBa33KAywWf
         FzLBi6w/2vIV1l0MRjtmP2Dbs/E6JlVKPXw3j4+Sn+S9Sz/0PjKy4b8PcPxyXQkGDttt
         D+JIlIbqmTOU5mIyzufleCuZvvO5y6aQrQxZokF5LEhvlIUiFpgtH0BiZvwMlHeCkPxo
         pB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963471; x=1791568271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjRLkdydNH/3hEGomUeQ+SayV25kXcztDM+0WcU6ndM=;
        b=SDViR3m+i6BKwXbGOrpfjnyyyehDUDTsP1QrwzrVue7ui5j7ysn7FgTDUgHVZwBGHm
         lNraieSEMT5vRF2o/bkUitMF1aBS+C1olmFCnl4Ew5igLEoalyiEQkGWhNDBz8LC29D/
         OIo74DSFcQmfqz4TEWKfbwR4aT9/rHOZKhVjw5PKRWtPyjFd2JoZA1AQ7qLECBNlG/Cj
         fdPvfLMBjCKfobLLTmIsB3cNkQFlGYKt+CyJqp1sL3VTWFGwg7f7VNxD/0FDVXl/pu54
         HcQtHJA+SA3f8eWP5UzlgpK1yOJj2KyUXnIAzi+XUCEbUdNEA1HgtaiR3eFJorKkqt/d
         6yDA==
X-Forwarded-Encrypted: i=1; AKwUvByXAIOlWHqzkbIhNfC5Lo1hLWQEMIQ9AfnLsirVRx61PooraH6SylehM523bzvAsa5Xa3SFXV9nIuxGVDI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/Rk0ijwp+/WOcP58xHq2bdqfhHfIi3x2pbM3aOeoslFjF0tHQ
	0pbAhE5Erm0sjYLMAjXw7i6LTPCXo/MvyA+te9DY1DheTCKUlcLyp4xcK3k9Fs5wh0kDNvKy4Ab
	1cQ33RpqApQonks/NNFm5FFCWHfGhRe/EUrK14kRknw==
X-Gm-Gg: AYBFou1I2Vozz9VbZdny5pSDNnde+nA1euFixxv0GJAoHc5QUrtC2UzIjf9AHVgVyyb
	wUgGIRxMACvqK1MXHxMONHnr5Mwm7iO95oN0WoyQyZH99p+KkJPS6oY8q/BEHC3ZHfLLy0mur3r
	ZkY8SB+APYG2lnuNH77/YOfXXrLKomrgxfPjt0yIbJcc8bKk5/b/lNdVcGBwKtkCyEYP0hR0Np1
	HekUm95yvqJM4W6z15ABvNRLzVHp9uffQJ18eOn+qKQiMwCNEpltlEw+NrmnRcpiEyF7filWWIQ
	QIr6gMGr+4VAZZvayMd1bMqCATPFoNVoihHPtC82KSM4p2p2TEVI5XsoxPwjMI+Zmdn4oi345UB
	AjpAF0pwlynTsYjc6i0M6Y7hSjyWw4H/YWODw9zNeHsPt5w==
X-Received: by 2002:a05:600c:5888:b0:49f:d742:97ea with SMTP id
 5b1f17b1804b1-4a01eab3237mr108637715e9.0.1790963470511; Fri, 02 Oct 2026
 10:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930024505.96440-1-artem@trailofbits.com> <2026-09-30-1-daily-reply-0014-lpfc-sfp-info-mbox-timeout-6-6@kernel.org>
In-Reply-To: <2026-09-30-1-daily-reply-0014-lpfc-sfp-info-mbox-timeout-6-6@kernel.org>
From: Artem Dinaburg <artem@trailofbits.com>
Date: Fri, 2 Oct 2026 13:50:34 -0400
X-Gm-Features: AclHuK97lTiqaebg1I8sTjOuQdYcc3iS6N5jctNtVuQ2foq17QpUfDpnDgfMSbA
Message-ID: <CAP3zxaCrgUA4tAtd2nS=b5sn3xSQ3LBiRRFwsRMeCGvHrhgprg@mail.gmail.com>
Subject: Re: [PATCH 6.6.y] scsi: lpfc: Handle mailbox timeouts in lpfc_get_sfp_info
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Justin Tee <justin.tee@broadcom.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, 
	"James E.J. Bottomley" <james.bottomley@hansenpartnership.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Ely <paul.ely@broadcom.com>, jejb@linux.ibm.com, 
	martin.petersen@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

Thanks for catching this.

I'm working on, and will send, a v2 addressing the issues.

While working on a fix, I also found what appears to be a separate
mailbox timeout/completion ownership race in both 6.6.y and current
mainline.

I do not have proper hardware to validate certainty, and can't emulate
it in QEMU, but I do have a hardware-independent KUnit test that
reproduces one of the failing interleavings. I'll send that separately
as an RFC to the LPFC/SCSI maintainers.

To be clear, v2 will not attempt to fix this newly identified
potential race. It will remain scoped to the existing backport and the
6.6-specific problems. If the RFC is accepted upstream, I can submit
its stable backport separately.

Thanks,
Artem Dinaburg

On Thu, Oct 1, 2026 at 9:52=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> > [ Backport to 6.6.y: v6.6 predates ext_buf and uses ctx_buf for the SLI=
3
> >   raw payload. Restore ctx_buf to the saved struct lpfc_dmabuf before
> >   testing LPFC_MBX_WAKE so a timed-out mailbox's late default completio=
n
> >   sees the DMA descriptor rather than payload bytes. ]
>
> This isn't safe on SLI3 HBAs. When the new 60s wait times out, ctx_buf
> is pointed back at mpsave, a 40-byte struct lpfc_dmabuf, while
> out_ext_byte_len is still 256. If the firmware completes between 60s and
> the 300s mailbox timeout, the SLI3 interrupt handler copies those 256
> bytes into the dmabuf. That is a slab overflow, and lpfc_mbuf_free() then
> runs on the corrupted virt/phys.
>
> --
> Thanks,
> Sasha
