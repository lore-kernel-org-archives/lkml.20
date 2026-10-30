Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793393939;
	b=IMg00Vxl1/OTlUR0bWzTZvxeG75Y2vOV/8sIXZX7WhK0QAl5PxeBQIyDsMQJo5Y2bN2Y
	 IRNQ007A8Rf/5vP8mqFzVtrZkHh5faBxF2+0O4WjWh3DFV1ys8mrZPo2oTu8fag9gZqCZ
	 FDmDtIPdplqZzw/pabB3VKo+O6YRqJOeOno7SmXu1U7gu5GcrsNjAOlJD4RDBvK49T336
	 p6ao4NgYbWtRZZyhZZFB3wjctVwE3jYILrmVMluPrO0lWDBPcFJrujUmEwNG3pes8tp8P
	 /NOpfYPrRXF1zMmj7vB0/kS2Fr9ub1e8tjgJPaeDuljGSdDJJMisaxpNHo0/s3Npt4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q6USGcPBbGiibCPbj0AvZUr4XyMx+DULAeB+QLoxL6Y=;
	b=pEmYmMiRZh+6C/uUv03kF7/UNHU5vwuX3/831vY0WiDO2RsSqMwfcpqx1wE1mF7Qi1op
	 lIRxumrLoeGC6cFnGHHa99ONHv6gcQspc3jVlFVlsa2w8W6hV7cInmhZmiEqbIbPaYllv
	 CO3PbYy+aVChAKeplAm9tEysdc+OB/WoZeGohld7uxhEseOO3ifyrzFMb1fnkukcJJag+
	 C7Pqr/nRLlUC+uBRxmeEsBu23Bm5TM8JML1fo00+pxkndtDGeDeKDOkJO9N0P4bt105ey
	 z3nFNdTAtLm7lTjKMhjNmwjaGE7f6EjuckVuPVCXfOmwI7tSJSWbCRdXvsmbfacCNPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LgidBgt1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LgidBgt1
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98c6e050c5dso644866241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793393938; cv=none;
        d=google.com; s=arc-20260327;
        b=dDfyXcxJDhKG2S/ZvPenbU7kPrUDyTxwo8XKkqu1eoKU1SftDcS6unT3cZaeevEneO
         3pLJrdJNOrsdirA8hqGP0P3lQzAJ60oUsqniPKj65CZPewPnNZPpzjRIBptiQNsZ3Ywh
         2XRziHw62PUqe8jMiBVillGyxH3YpcowhTtHyU+83p2yB+qmFw2utbPXpF1f++ehwfGR
         xNVxa1hkIprh9shlSiG1jHkOFRfHVAquO3NLbJSYnGT45Exu8k+yGpvPcyGhlaKBmReY
         eiz1xFahdOIY9oIY9gfz8KYaMd37A2EWvEjpjQqrXI8jus0gPTeBmZEylEnYIuZ8jtyG
         nk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6USGcPBbGiibCPbj0AvZUr4XyMx+DULAeB+QLoxL6Y=;
        fh=r0xXbOvI+uCjvJ4cRHzwBfkSjwK+JmJA8WxB0TjTnoo=;
        b=ZTNG3H4BBcmocukOlGhkLW04qotIhEidTmZT6jVPjWq2/mTEbP3DUGxISWV1XFgaN7
         Ar6NQwyHi0wuOadi+UtQrf3lSQQGiLQHptSVBT2s2LUXoWt2qrEt/iM0TJabxh8XBm4s
         y5gUslNyV+2NuuBojMrkFn0L+4g/8EcIXiV02pOfp3AYMuIXdqUDQQcw2/xC7tMB94eq
         yWXCXNvaTmFRBJZRbtsN0VymF3Kr0gC4tWq/kawISqBbYlbaSiOpCgVy/mgkvHh4nr5/
         8+cRaT7FkuM3ArK2vBln4s7XT8YWeectxHqQ5YvT9lhzjH+G2sQc/Z91QRC3L8aQbpxL
         1+8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793393938; x=1793998738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6USGcPBbGiibCPbj0AvZUr4XyMx+DULAeB+QLoxL6Y=;
        b=LgidBgt1Xhffb6Cnqxf1ygkTe0BwOEvrcNypRfJTvb7jmNGIdEDQaMl+kzij/RZ600
         5RPEfEWqfu+5eSDdgQ9dznI1Hu4clBvLmNlaiz7ZLQuGqyJgxKTKGQyzkXRQyCEyBN0g
         sWRpOuoYNjb97JEcGcL6a3xMk2HacH4/OEmBj2wSDK3vgXHO49oLqIg2pbaEHZpozPgZ
         1HZPWeaA/HE0MDJ7jHn+ZNLFxOsSxPw15Y2Un9qviYLRNghYRRQ34yLPRAW25cjVGIfk
         ziRIcqqs6ngQZHnNOOG9xAqxANdj+Ip9ryIVriva/2eJjQl4MjpYt3EQH9EC0L0SFG9A
         +e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793393938; x=1793998738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6USGcPBbGiibCPbj0AvZUr4XyMx+DULAeB+QLoxL6Y=;
        b=2o9hftpEwjt7u/tLF4SjeY/dUWCDUd4GT3tvGWk9XkWQdAmpXGQMawbTWA0iUaZjEw
         9rLB0ZvVUjAjIDDOMWhG4Hn0k6kDtbkmGMm8sDgHYCni+o7ofbyfZbFNty/CHRcAKvTo
         cst7l1QNqvDRHZN0f6QRcL8QBRKrQl37fNde7STpaXn6IEj5Gr2qzyk3getygsdY1Ipt
         2gj3sXtBwqG+nb6TM0LSmd/xnqwjIubgwKD/7JLUrMGdtFUuc/SM+ABNjKsL5ADy/Uew
         rzq8TDynKkYU0idOtxFUlgLizNpgt1zEkmD6NElRW0v/uYModwYwZsefA2D24vnxY+57
         5Qag==
X-Forwarded-Encrypted: i=1; AKwUvBwL9RRgnSlX4nOAu+X7eBdF9uD2p6cFP6vlS5wRhzG4h1CawgD3uMR+8+twE7Kwlxxtf2Hc7o6uPwJyLB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnFkh6B4SUItbj4sF6P5ThjQusCxaTC2VrpjJvWNjoLb6AWc+6
	cIlwTmJJVwY0UJ6CEgYwa/gh+XkgBsfgT0Xs49O/diJFoiRSdfui2IL99P7Krk5xZNW4g/XAS9b
	1vQgEi/84FEGf9onK5WHHc11mhXiLQWDGPE1fJl1c9A==
X-Gm-Gg: AYBFou17iyU6IEkVr+3PzhEdon2Xgj+QClaplJUcXLuZ2ZaYKY0rs+/9uS8ya8EvwvC
	8jzN4iw2jPOMKp0aRqC709JU6YjbihmBzEfKgbXrm4r4PMEaMYF58M5ZcZCVyswGPUx8Zu8e0ms
	Yi1wBghqxuYJkPichUVOSHIne3PGfIGKKwedjq4eHH5liyInS7nBqaoQbTz8olY1wrhhW7BKRu1
	ZHDxysT1ZmffLBZi5XhMW3iTlQ+P7aka4aDQN7u042FIRwEAv+O6nTpQn7MQ+ulz2iuQ5M9o7mt
	w8q0J2xrfn7PJHP++bhOSMwYq9FbnD0/EXg4ytoaLr9oQUNGcE6RHgamqKhg8gt2pTT9Z+nsOWC
	UwO5T0qgH8zKx9H5qZrnZMxbx9J9NrSYjpvMBe3coKS7/KMxj5rsxRsjPLCSatydF0gdOgw0+79
	PmxPN8KzcAwCASkS0VjVHB5Q==
X-Received: by 2002:a05:6102:4422:b0:7c3:7286:c291 with SMTP id
 ada2fe7eead31-7d072c3e082mr2023245137.19.1793393938021; Fri, 30 Oct 2026
 13:58:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260920182936.2317916-1-mkhalfella@purestorage.com> <20260920182936.2317916-6-mkhalfella@purestorage.com>
In-Reply-To: <20260920182936.2317916-6-mkhalfella@purestorage.com>
From: Randy Jennings <randyj@purestorage.com>
Date: Fri, 30 Oct 2026 13:58:46 -0700
X-Gm-Features: AclHuK8X6zhh06a0byCpdwLnjr3WBz6Rb-me0_VFRdAQiql9ckylY2x3JwQ4rBM
Message-ID: <CAPpK+O3+eF=9WOVqDJptwfGdA+=XwFeTx-sMatq=bQLUPhMvVA@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] nvmet: Send an AEN on CCR completion
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, Paul Ely <paul.ely@broadcom.com>, 
	Hannes Reinecke <hare@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 11:30=E2=80=AFAM Mohamed Khalfella
<mkhalfella@purestorage.com> wrote:
>
> When an impacted controller that is the target of pending CCRs is torn
> down, send an AEN to each source controller that issued a CCR against
> it. The notification points to the CCR log page that the source
> controller can read to check which CCR operation completed.
>
> Split nvmet_add_async_event() into a locked helper so the AEN can be
> queued while ctrl->lock is already held.
>
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index f5d7cb9c943a..69491e8e52ba 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -218,13 +218,19 @@ void nvmet_add_async_event(struct nvmet_ctrl *ctrl,=
 u8 event_type,
>         aen->event_info =3D event_info;
>         aen->log_page =3D log_page;
>
> -       mutex_lock(&ctrl->lock);
>         list_add_tail(&aen->entry, &ctrl->async_events);
> -       mutex_unlock(&ctrl->lock);
>
>         queue_work(nvmet_aen_wq, &ctrl->async_event_work);
>  }
...
> +       lockdep_assert_held(&ctrl->lock);
Is there a reason not to replace the mutex_lock() call with a
lockdep_assert_held() call?

Reviewed-by: Randy Jennings <randyj@purestorage.com>
