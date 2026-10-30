Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395984;
	b=w28IIPVeHdvBrQAcMW1tfOTcousL07jMO/gfiFwbfGw6C9pA8DXCB+rtcAFJauEXLuKl
	 KSHZXO3pZVYPSSse3yLCkZxhTh1wHtVMqUB5DFiXJ6ccAb9k+GOgweAaG3WI6b379VPCD
	 q49Ok4R2KF7HraPOvrt1S8NdnlIxh2a0Vg+PK/VCOg36kik3DeQoJfN+baClm3FqUipea
	 i0t8LIuyiUhXyX4z2RRQOO3XnYY87H8sseEHrPr31V3NKBBmMe1igV4cCiZ0rITWUFdIv
	 teP27LfMeOM/ZotSyfLdTu6XuDJyC6yn5vQDrDSxA/MRSVPL8X+IS0WN1AgGkBiCi9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=KYQVknesk/PjoruS2vxKw66Tfbsl/Qf3EhfTxc7KSpU=;
	b=5F5+WSyH85RYV2q2fTa3ccwwtu+rFy3YkeJWB+K1RSNXHH0zjOM9wnrdIhA9udE2yooX
	 dtFqtw9+hQTWMm6iZXQR2LRcPTK/FY+HXcU81OAxfuJFhYlMKHdzcGvB5UJLsKK5hABW1
	 jtnbahe0mJOo5daYyG53pUFRCSYNfKgSsPGfcw+MKywWNr3hVxdsmkujqFffil+QKdeHb
	 L3z801gNAb0kIifM8fSLXX4KJS98TAoefBajWEyBZx/EKQ6RdC0EOW5Pgq1FUl6CXzOLD
	 LT5NbpXlFQ9x60OitYsKmrJP8fcdwwkP75OukqA+BvGdMb/WizgE7g/06BbzUnp2aYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Vp3hU7pB;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2293C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Vp3hU7pB
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so219677c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793395983; x=1794000783; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYQVknesk/PjoruS2vxKw66Tfbsl/Qf3EhfTxc7KSpU=;
        b=Vp3hU7pBJ74pKYM9lvEmD9/2kPsQmguCtfHXe2et/QnH74JUJQ6iIKYKnAvFNNSmJM
         +0xlDYN9AYLUMaK9d2wcYcHbPIY58YwYRsxIwVkHctg9JbSU2KfS4gBCtbJelM/eTNHz
         kAzCLPM9yMrMqLRWNmI3B8cjjP3h2bizIwFoeTm8D8BltY/Fwb/coDNFJ9J6W+VI7dvr
         522Jk4bnTFHMgaCchy/prGK0xfl/lZk+psl6VSeVPHPeEt8EuEONfMGXsmcwzX4xrqGL
         Haykxwi1Q74d5jbpX0LoIFkRj2TlmnxutLpAnhFd+wc8GOIbuxl1Ypw3RmeqKOFCENch
         84Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395983; x=1794000783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KYQVknesk/PjoruS2vxKw66Tfbsl/Qf3EhfTxc7KSpU=;
        b=JzpUjb07Jige6YTluwG7ZH0c1l/rsDfIwb2maQBoXk6E0HtE9hfgt7dEwKxWipgva/
         Fcz21bNgfBB1vcYqq33q+RujhEV2VWPWK+hdZmXh4dpfm71//+CrDn3R4KUMsadNY9pr
         Mb8kn86WG5RhuZ2dFohWxz/Mld3yZRzojN0OWIcZh7eLplA7MPAWsq8wLkoDl8jeAves
         P4rRcwNZYkaf0/Unuykq9PvbQW3zjiy51DPZoW3HjSRiflMfcy2vU3EFRX/cypR5ZLYQ
         Te/dhLMCfPpHAOPbZtVJCOaliIXAPbcVl0UnkFTmtp66Gglg1buh8zmgJfX2IXNw+ZQR
         Qb0g==
X-Forwarded-Encrypted: i=1; AKwUvBz35prodm4J46qxgQr+orUp7LDReXbEN5N2CtI8DDxJUTZwqyhd/+GhIQmtLV0CUm8dP26zUmzOB/w56Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBqQmf6Y+nQuFlY8y2ocPZAraDY6znZ6EFJ7+VMgdwRuOZXgiU
	oxm5p/+/ObnbvohDENKhX1FvKGvbA3XwjiR+h2POW50/VDc13kt9VmZ6My9+ukqrebQ=
X-Gm-Gg: AYBFou35E1B6lN/lWiolC0NheumD7kjz1zhY4M5O7LTlDbzudWN7T+NsZ5bIInnschk
	fP645ndq1XkI38ehzBK2V0sG1c6Clg+ksENHJWUmQT1GuQfokWbQwYb36tqC7OvuHQrSsv8GnlS
	s2hhHNQNQRdmu3A2dZfBB+0VktDRycRjb1eNWuL6o49EiL/zmdH9/dDbfMVJ4dcRgZyxfziRaPo
	G9c1KGJEMTVOCbBWqGMLaccRpr9NEQL1AxxNy83YD74nqgy1eLQ+3yQcMTrnNKtsDh2mMRO6uJF
	32jK2vu4oxarbICL8u1ydfm31Bg5ANWbE9zOoiYk0zqBeycsT+VO7sbzILfif+dEtqdwzsrZw5+
	nmR1tft9x9d4IsX38KAx/60HH3IYT//NIoiNJVqEKYE+FXPHzRv0EdvKWSOtdwFo9/iu6b3GlMx
	6/IgJHhV3mKRz9ek7ILjjbDNOwMVUj8lP1Y9P2uEBAbigA0qcndeNeQjSVnA8LAPnHmgN09xiXM
	+3G8IUoB8/zEgMm5IPhlQOAxK8u7zHDjmV4I8o5NbPhbI0HI+8X5jsfobayPPrpAt29S1sZIQG3
	Dx6aK9es+IEbrmHVR1Zf1cK9ckhIZgHK7e2tM9Ck2bafPf4dGcRCgpcnV4sjESEh12Xkr/o=
X-Received: by 2002:a05:7022:68a1:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1ac5a0b5af5mr6607314c88.9.1793395982862;
        Fri, 30 Oct 2026 14:33:02 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm208169c88.12.2026.10.30.14.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:33:02 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:33:01 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Randy Jennings <randyj@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 05/18] nvmet: Send an AEN on CCR completion
Message-ID: <20261030213301.GG122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-6-mkhalfella@purestorage.com>
 <CAPpK+O3+eF=9WOVqDJptwfGdA+=XwFeTx-sMatq=bQLUPhMvVA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPpK+O3+eF=9WOVqDJptwfGdA+=XwFeTx-sMatq=bQLUPhMvVA@mail.gmail.com>

On Fri 2026-10-30 13:58:46 -0700, Randy Jennings wrote:
> On Sun, Sep 20, 2026 at 11:30 AM Mohamed Khalfella
> <mkhalfella@purestorage.com> wrote:
> >
> > When an impacted controller that is the target of pending CCRs is torn
> > down, send an AEN to each source controller that issued a CCR against
> > it. The notification points to the CCR log page that the source
> > controller can read to check which CCR operation completed.
> >
> > Split nvmet_add_async_event() into a locked helper so the AEN can be
> > queued while ctrl->lock is already held.
> >
> > diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> > index f5d7cb9c943a..69491e8e52ba 100644
> > --- a/drivers/nvme/target/core.c
> > +++ b/drivers/nvme/target/core.c
> > @@ -218,13 +218,19 @@ void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
> >         aen->event_info = event_info;
> >         aen->log_page = log_page;
> >
> > -       mutex_lock(&ctrl->lock);
> >         list_add_tail(&aen->entry, &ctrl->async_events);
> > -       mutex_unlock(&ctrl->lock);
> >
> >         queue_work(nvmet_aen_wq, &ctrl->async_event_work);
> >  }
> ...
> > +       lockdep_assert_held(&ctrl->lock);
> Is there a reason not to replace the mutex_lock() call with a
> lockdep_assert_held() call?

No. There is no reason not to assert ctrl->lock mutex is held when the
function is called. I updated the function and added the assert.

--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -210,6 +210,8 @@ static void nvmet_add_async_event_locked(struct nvmet_ctrl *ctrl, u8 event_type,
 {
        struct nvmet_async_event *aen;

+       lockdep_assert_held(&ctrl->lock);
+
        aen = kmalloc_obj(*aen);
        if (!aen)
                return;

