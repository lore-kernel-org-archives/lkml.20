Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655D4F5E0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140113; cv=pass; b=TSW4wDMO4EkG1vLTSZ8JBQVM3/7p25S2sI9SAFUDXxz0+6zIorlwGyTEzwJ5gFU/zeOdpRvdK7W3eIiJ22QAdSxbEGedJP1oJ53KuP1maPXt1uUcXd1rf8NclfDc4NDKX3fKdLYptpLU6dL5C2WjhqPx043pgNnbRdiBiL5M19M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140113; c=relaxed/simple;
	bh=cB2sc5yKJ7HmR6/2lG/C7XnsFQ0C5I7Ug2pwrO9CCDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8JUklue2zGHXVyvmIVLAj3Y2rcF7TxXHyGYFBIsclQg2fY/LNUFe/er/RHnG+hUzCQB5+sucstHdm0lAvakU4lofAXLUMqsn/EcSEqlBG4HPVaALr4d3nUiPFltqQ7z+HA8XCiCCOuu7lJpZdnSaEEz8lE+0ibK+6D+grAtr/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=stellman-greene-com.20251104.gappssmtp.com header.i=@stellman-greene-com.20251104.gappssmtp.com header.b=UC7GFrTc; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20251104.gappssmtp.com header.i=@stellman-greene-com.20251104.gappssmtp.com header.b="UC7GFrTc"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cc107c451so6205996d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140110; cv=none;
        d=google.com; s=arc-20260327;
        b=CLKIQgs+lw6EgPGDJlP3DvZ9U6j9/v/sQF8X7YjiHPo0qu8N5jo/xm95dV+2KPDcDH
         ggR9gDSbNgWUCh0rdNwMguk8peEcx3k8LZDV1nYXtt7HpDbQa1ePv92YBLAkRjerDDdP
         In4xVpFhMV0Sy+6SOCqQjU4hA93IrdI2EVsq5X71RYx4fdPD8pv5Lb1h7EmVv7yFqsvc
         RnNF8os1+Ru6e68vm6zG7Giaof8rpBJjjmxUWByQYkFTWxuzw5S+kE7nV9AQ31v34Ov6
         EQhtj+GsHXW7mKzXEz8vSe9p4lszBW3HgRVsqNM7DV8uVI0vcdZyjLR7PJ4tRpMv3yyS
         lIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZQhtgmYJbGnl4jzEgaW57/yVc/C4uVNFXjb6bqrdM/Q=;
        fh=oF4SPj2AQEgDkERPhUSXSCpEZV5c2hdauIZ81zMi44I=;
        b=LfQCQrO8Aww6FcX2ieS0G+2M24fH9Z7NLHkRPQ0IFDc1ImjoS6oaanJuoZhmDjgoHS
         kYn7+8YCMyVsfajC6zV7fjQdB3g/bhCJ65BLDe6pGIYsHN2vZtF1tjYAiBEYtkOC9J6X
         LCa3k4c3U8nPaWOKjul3i5qZhDfkWDPzVIIwNV5bpQ/tRaXtbP6Kofl901b0nm3mZvD1
         4nVuUeyBBKYbgQqZx8eUVWH4fRf6I97pItiIHxIODItEPTVgFPUtmdetEYp4PYywPJPM
         iM02lgjs0KQLFRmAikNn6GvvscYEVfpxjQocTCvur8DOqgf8523YvnQdObk+iJ0/fXb/
         BkOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20251104.gappssmtp.com; s=20251104; t=1789140110; x=1789744910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZQhtgmYJbGnl4jzEgaW57/yVc/C4uVNFXjb6bqrdM/Q=;
        b=UC7GFrTcXAx4aIafBdmf9E5kC4NQzkqyfu46id3AAHc6JJzX5+pCBEUEtmY8bBjEkY
         Ml1YAozXDM01O6JLXSGPfSayiSG6aeYH768Uug2/w7/yTV/XtkPfSqXyjKO+tnEfCIhP
         +7dO07C/HdQIaPCFnjX6Ia0DEru+ZwyVKJFTH2QSB7KChCTAsV81+O2yluhAHZywyrxR
         /R3nMxTk9Bwargu929KhDSYGvLJFwG1ArJU2ZB3qvyISFmZi8XHALOVDiH7r2PPpU19P
         YLnNRVCHQ4q7jW6blAgRBVtCjbJATEKhOXtkhZv78XK0rQubVCA9D81J8PZUN/VYud1f
         McrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140110; x=1789744910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQhtgmYJbGnl4jzEgaW57/yVc/C4uVNFXjb6bqrdM/Q=;
        b=MXnc8snK7nWdcmKujq3RqnKRvo3C+HD87ZSXlHtZ29Dk6N41E1jzTUhxZliNPcHmfT
         u0yfZRzas6EigNUFPyWagiGFK9+BeDxq6AX+XIal4Tr3DTZlq8Yh2iFDfvMtvA/AmqMG
         N98NYU50sNCP3LIAEyhCXl4L2rUwmlSs885PNSU1WMdq4gL25VFOMyak98dM0EiZutgn
         asNljDsarQDPDIJyfmO2830RrHhiaizoxYgOXoH5wkTITP0vBw0qUKFaq2lsHD35lj+c
         C2Q1YWXZwTm8gVarj5PXz+A4gqn0MIB4/HjajBIoV7OzcfBbkz/vDETP7/Ev/Oem+kjW
         YHpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvnk70w8ujlM8eYmsYC/oEewR68uiNIhFdlqBCofYc9Qk7cUdMgmH+nWwQCBNJjb43pvTAXdwqo3AN55g=@vger.kernel.org
X-Gm-Message-State: AFuF++l5Ak8nON42cvytKmptPa9E4Os7DrvxmwkJlYfWI6k97aFGponk
	KDhFPzkMBEY0OlsF8W56Iedf3xxziizodibchjqUnocv1d0ua056VD0KqjI52/l6j+r/5KfahH+
	sQjwLAvngmT2nioWdKn6JcEwufZ4P2T0=
X-Gm-Gg: AYBFou3XoFFb/F+lJEeiWE9ZLba66ZpKYjvbLMQKc60B8Lk9OmT3oYFWtCxj0yIuw7f
	boVKnKpCzjao45amhXg1HARTXsMnivK+3gW0QeATA8qACNrhO+VNrM7ereHd43EFHdpJCcfycn7
	jOyMdYKfcvTstWpiHmceuq41cVC+psxLKcR+nOxJ3plc60hAMxTKB15LJYkWa7zB5AAYugpgkS7
	BZL2DWjK6XjSq+V+Q3UBbxQWj5LYtFwFQGiLuP241Fmj3VBfW6x0dmvTUt/36SsXhtQLh6VC1NG
	CbNSx0ym+h7MjpkiXt9hHV3wEVvz58gZfNqaD5ifwKyN/EvyQSJhP8x+imH02I5h9ftsiKKbCQ4
	/bh2drSvkIvtd/CXmh3mnIEsjxRvxR3IBGLf2VqF23JF2Yp7iKigfuqIZ28uXC95oE6XGCBK/Db
	Sm/clhuQCdL9NYyZMioMVoUu5qHmuHAg==
X-Received: by 2002:a05:6214:d65:b0:90e:9dea:82f0 with SMTP id
 6a1803df08f44-9121208ac38mr58638816d6.15.1789140110377; Fri, 11 Sep 2026
 08:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910180056.81257-1-astellman@stellman-greene.com> <aqQZQPs7KzBUVbgw@kbusch-mbp>
In-Reply-To: <aqQZQPs7KzBUVbgw@kbusch-mbp>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Fri, 11 Sep 2026 11:21:39 -0400
X-Gm-Features: AcwNN1UP2cM_C5j9v0JZaDq3Dx9ytWa2AHbHOso5NtFvykWS7wXXx1m1jj-DEXs
Message-ID: <CAChPuV_74cky=JBROM7veVqmYTJBv+vPuPVCX6d+OBeL5BS-fg@mail.gmail.com>
Subject: Re: [PATCH] nvmet: derive the CRTO property from CAP, not CSTS
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about that. And apologies in advance for my equally long
explanation on my other patch.

On Fri, Sep 11, 2026 at 11:07=E2=80=AFAM Keith Busch <kbusch@kernel.org> wr=
ote:
>
> On Thu, Sep 10, 2026 at 02:00:56PM -0400, Andrew Stellman wrote:
> > nvmet_execute_prop_get() answers a Property Get of CRTO with
> > NVME_CAP_TIMEOUT(ctrl->csts).  NVME_CAP_TIMEOUT() extracts bits 31:24,
> > which is the TO field of CAP.  CSTS defines only bits 6:0 and nvmet
> > writes only RDY, CFS and SHST into it, so the result is always 0.  The
> > same controller sets CAP.TO to 15 in nvmet_init_cap().
> >
> > NVMe Base Specification 2.4, Figure 36 (CAP), says that when CC.CRIME
> > is '0' the TO field "shall be set to: a) the value in the Controller
> > Ready With Media Timeout (CRTO.CRWMT) field; or b) FFh if the value in
> > the CRTO.CRWMT field is greater than FFh."  nvmet reports 15 in CAP.TO
> > and 0 in CRTO.CRWMT.
> >
> > Take the value from ctrl->cap, where the timeout is actually stored.
> >
> > The Linux host reads CRTO only when CAP.CRMS.CRWMS is set, which nvmet
> > does not advertise, so Linux initiators have not seen the wrong value.
> > A host that reads the property directly does, for example nvme-cli's
> > get-property.  Advertising CRWMS is a separate change.
> >
> > Tested on 7.3.0-rc1-qpb-cc-crto-base+ (unpatched) and
> > 7.3.0-rc1-qpb-cc-crto+ (patched) in an arm64 QEMU guest with nvmet over
> > NVMe/TCP to 127.0.0.1, reading the properties with nvme get-property.
> > Before: CAP reads 0x8200f0003ff (TO =3D 15) and CRTO reads 0.  After: C=
AP
> > is unchanged and CRTO reads 0xf, so CRWMT =3D 15 =3D CAP.TO.
> >
> > The issue was found by Claude Opus 5 running Quality Playbook, an
> > LLM-driven code review tool:
> > https://github.com/andrewstellman/quality-playbook
>
> This is a very long explanation for a simple protocol fix. Just say
> something like "The NVME_CAP_TIMEOUT requires the value from the CAP
> register, not CSTS." Short and to the point.
