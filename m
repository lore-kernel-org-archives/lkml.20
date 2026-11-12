Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486873;
	b=CamCgaUMpcsiPmkceBfKgcdgeSjNz2esadEXOYS+E51STFGgG5cImMXCzVdzQQq76EMl
	 ZYeA29IojAIgdBu56V0usWiZfA3FPVP3aFqOBm01gmBokuX4L/56OKwMsz3q2ufCzVDQX
	 opEAAl4cu7EetpqTP1cR/OiyC6wxZYEuES0zkjDXAPqYQNDyNoFxivZvx5PtipOWqRtYs
	 0I9kJbla6NY8+OpqblnKyHZyT/0vFXQePwPtrqYER6FpUkvUyHiTrg0Da/OmECcENPPg7
	 BI46o1xKWlXFiab9TN3gDo1oAC3i1WF/3SPCzp+qqUDyxueBbushvhFnP1JeSVuX/3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eNXeH5LCrfgsfYlStn+hfE2r3BpfJ4YwRHB6pNDWPmY=;
	b=vh80Rw6Ij9U/Li/cD5cIPzq0hv0wrY1D8OkDRxDqon0rMqpLSYG8WtUZrneZcSi0uTg2
	 MODfidoEAYtqoNrk4RtqYRAXCd89DHYjMgmp35Vnqap5MeWc0vKl+seLZnmS2X6VyP6x7
	 9iZ1n4QcuAIryccof0Qvh7px4fMpozwXwLP77k6/dWGUJhN3hjgQv8qPDTlq8Oe1rDQOQ
	 1lNkzdZQ0YipvV0mBVSNC920cIAcpti3ES9BzW1dKAjKEiq5rOBjxdSULdc8qP/0DPfvG
	 4v226gr3Ak47aUsNEmZx67wj7ITy/hTAMgW7BWIcLwRI/PJ+cyaO296PvgXN0APfdFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=sCPuYaXh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691D8606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691D8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=sCPuYaXh
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so6304075a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486871; cv=none;
        d=google.com; s=arc-20260327;
        b=scRSHvyjRKag3Gp3ChTbf5+lMjKHIo9DitOYNGC/JwNpqPEjEJMuYchMCDHQ+gi4cG
         teAVaVPA4+m8plGY6zYaX9D6C/SCh8SM5sKhkQpqWI/DobLIWzdzdnkPQlnK3prGXzPi
         wvDicOWibL9ja3weHs+0Pn98kwgNhSbjXFdvcpUjH30oybHC8Fws6XOTVCx3QWRd95lK
         kroZuks+Rvys/vd1IBXLW2ON1iE5dAA1qNeXFwRgGRZzbBK8ei3DPC8JwjotoucomWwv
         zJ5YjdEI1WAGGio198Eg0DPcBvURds6H6iXuH+jceME1I5ZxvfhGp/ZaEs7kK5bnJ2h3
         LdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNXeH5LCrfgsfYlStn+hfE2r3BpfJ4YwRHB6pNDWPmY=;
        fh=QCo+w8FeWbgWBN3CHiVMSe0GzwG36pJ3AT60Jc9t7lc=;
        b=G1Z4RHAJPq6ZG97zOUya3JfINpglb3LB8fj1mFyHKtCMiBll30GuVZciSsLPpIFvuH
         VI/e1qcYOhnyBKJqzrr6l/bdbkxu6UchL4dKlNxNkOh+FxPY/plWWrPZMPxRU499UYhD
         39rfie8mbjnC5FWnwyVTwBPKZ8mDaB0NaIvLazm327uMjaTr2Ljdx87piDReAYACwpP2
         buB6KfyWgMCC24sMKa87LsD0lM18n0BuDxFM9NUjutLRkrdpghz83dVFN/tFrECIpV07
         mv3a2MKY7x99wnP7oaftSByQ0oWb4NdMDRKFskbPIRxiRfgm5C+4PxeW6ktv2Z/CpYm0
         7qfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794486871; x=1795091671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNXeH5LCrfgsfYlStn+hfE2r3BpfJ4YwRHB6pNDWPmY=;
        b=sCPuYaXhuvX3OKDkIpxYBuIbiKheZ8SR1EBQVIL3zARYV4e17hLKFLTcb6vXqiQeZa
         l0dHGIT75gnoqD7nst/Bj8nmCNuP+3whj284/D+u/Qe1edeJpcn7gIqz3GQzzQnFiXgj
         J6nzTeTaHknSowu3C5i1X2QuvTDidqE2sy+QOUCb1/xCnXkgmODIroj5BddNzfLxPhTu
         3LE+Pki662mNfR32peU1FBjXyWP7JUavOTneDKFgMB+DTcZfiCV4CuBWm2fVS8p8Ml5U
         OOXLVbD2VnielBdjLss7W7xZ5IPtNwl9IBMY7Nb5KlR0EEefoAQyvMq8bXyWyn71Wxgr
         BLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486871; x=1795091671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNXeH5LCrfgsfYlStn+hfE2r3BpfJ4YwRHB6pNDWPmY=;
        b=2k3kxygw7NDBnS3ZcOmWQNj6PmBAaXS8rId8vkan9FcJLq/dYjOL1ElLkaB2a4YQZX
         8ofVjQfpTMklXQHMkhI5ynt9yOKBaWGnDArUe5UdfT76hUYJBTGjpWav2YL+5lWnfFLi
         iTZEEmgcPKfFL+VwKETHsnvmEmYYy4pfHmLijFFaVYeXK6/rooM8pk7BKOXqJ89+iwh0
         ssDETbH0U5u7Q7Cg43gN4K5pPyeBoBFd5+D6Wwgd+xORwBSlzujzuL/gYT2qPa7gmhYU
         qG57pQpwoFxhw667WBMhgrRLrKU+1KZ38fiYA+/acOS1LB0sDE93TUXAn0J+mHAR3lYd
         duVQ==
X-Forwarded-Encrypted: i=1; AL+hErEGDUTCDTdvPxcSfPd4M1CjfjI81l950oMm+XFDhj9O0Km58CmUJnSl/JzF+fu3jCviIV+il7u9DEi4KdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lxytFRZidl/xVYnoZQoaBeTTbdQ9Tjc3qnq/yvZ8bWksVMFXC
	sBTveWaAO3wwtYL+g+IswrYsWkYRZiB0GzvBzqDjkWPFh30QD4SNNNMng2gsHtsDNwGIWidxqkP
	9bLw+4TyDAxK8pt4M3zpnvzSf5dvBY5huExo+FjGo/A==
X-Gm-Gg: AYBFou3fAORlZzjzpP6WDBvNTOS6qRrZ2YiCeuxMwOm6CSH/nBq931iPogAiaVLvBV3
	pKvdQ3sa9W1VqDFCHxvkxjRhZr/bzUrJRoKssxYh1/2ayGGnGwvhWmZApkSVgV4C1orI3rMtPKN
	J067xLTqxmngCRRs14GP9z8iqV158sErVyY2MHHPm7nkdfLrYhLfAoDBFOakUBp1HTqmzu8DhbD
	ckir/prwVInUGTHZ0eXuEQjwW+OvRn06S136JO4ujkGYrqi81Z3+sdh+RhYpI9pLpiSCz/9zHoB
	yTeAkrBBjMIop4VdJO1l/eIco3C5doum+l9TGMeUI06B/JxijnB7u5m7Aon0EIrz6YmKySq88hN
	l7tMCbj9Hs40gQ5Ukxft/+mwb4j24LzALzGzOwNeNggoSAQQ7p8/P1UbgzmdnDmcbSLyT
X-Received: by 2002:a17:907:3f8f:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c506686227fmr432811366b.6.1794486870749; Thu, 12 Nov 2026
 04:34:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112004112.3059801-1-stanleyjhu@google.com> <20261112004112.3059801-4-stanleyjhu@google.com>
In-Reply-To: <20261112004112.3059801-4-stanleyjhu@google.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 16:34:19 +0400
X-Gm-Features: AclHuK9VdUPb8KJpIagx3SivUuengHjj43Y_p7OZLWE06PaZD5Va3YxyrQkDtm4
Message-ID: <CAKTNdwHj2YGwX6mGxCbsDv_H95y+ofKGit8R7aLiEOCx0RdWQA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] scsi: ufs: rpmb: Drop the unregistered ufs_rpmb bus
To: Stanley Jhu <stanleyjhu@google.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>, Jens Wiklander <jenswi@kernel.org>, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@sandisk.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@iokpp.de>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Shyam Saini <shyamsaini@linux.microsoft.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:41=E2=80=AFAM Stanley Jhu <stanleyjhu@google.com>=
 wrote:
>
> ufs_rpmb_probe() assigns ufs_rpmb_bus_type to dev.bus without ever
> calling bus_register(). Since commit 36f35b8df697 ("driver core: reject
> devices with unregistered buses"), device_register() rejects
> unregistered buses with -EINVAL and UFS RPMB region registration fails.
>
> ufs_rpmb_bus_type defines no callbacks and has no drivers, and
> consumers look up regions through /sys/class/rpmb. Drop
> ufs_rpmb_bus_type and leave dev.bus unset.
>
> Fixes: b06b8c421485 ("scsi: ufs: core: Add OP-TEE based RPMB driver for U=
FS devices")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
> ---

Thanks a lot, Stanley! Works like a charm on my Rockchip RK3576 with
two UFS 2.2 parts, FORESEE C2G071 and BIWIN BWU2A0526B128G.

Tested-by: Alexey Charkov <alchark@flipper.net>

Best regards,
Alexey
