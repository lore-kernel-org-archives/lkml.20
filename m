Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DB3B71AD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280200; cv=none; b=ZElFOZhTgRyBeT17Tz9l32xJW79FFhaZsihZQehS8iZuVr29esljYQdRwlgDdZvlFgfZIwlEBt3ahwaramEKswrq8yTBEQGQ7wwvbnCKaZ49EFdSB4TQuVOkKGwKTud3ffEQoMzHsuqG2WQacKMluSft+U6hImWVmABKNsjbHT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280200; c=relaxed/simple;
	bh=N3hn6QbtIdIIFPeRYp8HqA7gKHKr1qmaPyk2pNKf27c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+fmQAUE//aYFZ2S8Rgq0iYgK47Sp4iIvifsnQFmjhBkE8sYgGHRVKLw4y8OSpbcxYb27ck6BMyWunds/QXeN/5QmDZuZ8UUjINfRnnQYrNHz+75sOdzVWWEG7ws5/18gZ7AjxKV5at+v2wDzHcdAmlnFKIYKcKHPSjDnXTp52U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKrPK958; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QgzNTwB+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKrPK958";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QgzNTwB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791280198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTOEhug/kDsTgsg0MW8NZpuSM30bTStxylqUNCEJaPk=;
	b=JKrPK958Ogmk1lN40ymDKFV/PUkeH9aZiWDelTyt8b9Sfx+OCAKIibWDaCtn3WU3sywFSr
	XVkbmO2FKtJYMKVFVRrW9r7U5j/DMbzEgLKFZ6cMiB0BkfdhxDcBai41NO5dMHgBKMPDuV
	cDDlrvLyNdT1prtjPju9UOyjYY+2O08=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-SpKMdORIOKC-eD9cCKqgcA-1; Tue, 06 Oct 2026 05:49:57 -0400
X-MC-Unique: SpKMdORIOKC-eD9cCKqgcA-1
X-Mimecast-MFC-AGG-ID: SpKMdORIOKC-eD9cCKqgcA_1791280195
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a166a9ea21so22906075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791280195; x=1791884995; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kTOEhug/kDsTgsg0MW8NZpuSM30bTStxylqUNCEJaPk=;
        b=QgzNTwB+Vfl/bmbOaUI+X8gRWPq6ab+1pvuDaq/4TNsIc1jZfhexXkKNmezUnRYoR2
         1BhMQ53IOmkoNsguPqk9p5hJKIOCdYUeZaabVE7XNLuHGWObdavRlxtu7nP0a2+4vio/
         ihjFp14f2cT/pF67S5MaRZg7YL0KWpmAqEZ8FfYU0vBdG7XlQhwkGKVjgJiucu36e6/7
         eq5RataxDb3j1Zpiu/DqPe25PvQNLOxkQ/LufhzLVjnnjFoXqnua05SNEjSVMAHW3cVB
         dMxMrIdV2zzwYlk3XIJoArOpymbg7s++sYwH7DR+RiFpwNlWOzdVir1XXFp/ZlEgnM5H
         IHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280195; x=1791884995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kTOEhug/kDsTgsg0MW8NZpuSM30bTStxylqUNCEJaPk=;
        b=w/Mz7IWbEcp0H2PCgn4uq56918HGWMwYY1rZPaYbPzJ65XR6eQPJ7aRWE7cbwFHPxS
         tFDSLyISa/XRjbah6+5X7TR23YrCTakc01ZYPLMSAof6RMZuhn82AtL0I8XC7bVqbpXS
         Mp0eJqfAG05bRG6QI37BXdVpvOcc8aJ7bdyYHVyOAIphBTU4bIR5ITiD2L/9aG3Go9TP
         XNgJDKpr9q4OikUUsJmserMcPWJwz4ya2G0EiNsVQ1JHqNazC9hPKl7XkwVrRRw08Fkc
         5qn1BkA43saNfloHSIa98WAozKZIuq9ywjPtKdWMB+1xu+6HNWF/0l5jYl9Uc54RRtkd
         zxRw==
X-Forwarded-Encrypted: i=1; AKwUvBz/0MT/APRymjIMY+cRmIhaefdeeS4WuK6YNpRYso8Y5zmryEdL+Pr4NKxoYgA3ibPABcJu1QftfFWJ49Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nBTjxwyiNxIgZj1Tx2z3z63Sf0Wp4B3IXcvUPmEwvKaUaCKl88
	Clij2+aWRs6/rQoOJcD/vp6WLRM5T6uzoA6a/MlWEKrRCro8RNvkpjQU5dtQP9HxWDb2GWWk7Bf
	xUTr0AQAFDoaypo/Lo2I+YqoCRUclLOmutthMHK5t0Un5QBFT1hhl9fBaASMrokVQzQ==
X-Gm-Gg: AYBFou0cpxjkQDimrwU1qw9HmZMeGABiq/jhygOp3rCzPG6JalxLdz3XQrpUTXLb6DS
	M9aEipMy1By5kqZ3nbESCA2R5cabRHXfvOHQ3msW32duYT4JQHt/7m6TQGdz7pfbZv5cR+C3nl8
	AAPPpoe4O4eDT3mMy2s5E54JXXjLZ3nEpFQH/GbVI26XFgoTvdM6cbwuXAOBOoMHCytjS5YECuY
	enginj56nCQxPjQfX6TF/SoTLLyYnnDQa/TGDmk+gX9yvRo2psH8KU8LXhlHq3xhok3xae1EU7W
	/Z8F8JBzcMRNfR2t33Pnx/5w9Obho8F7bXNTKXEeAlLsgkEToMwHD//D+Oat1PSaPrgd26o=
X-Received: by 2002:a05:600c:1914:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a17b52d449mr14318155e9.9.1791280195269;
        Tue, 06 Oct 2026 02:49:55 -0700 (PDT)
X-Received: by 2002:a05:600c:1914:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a17b52d449mr14317745e9.9.1791280194697;
        Tue, 06 Oct 2026 02:49:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17bfeb65bsm13352265e9.5.2026.10.06.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:49:54 -0700 (PDT)
Date: Tue, 6 Oct 2026 05:49:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?utf-8?B?7ISx67OR7LCs?= <tjdqudcks0424@naver.com>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	Jason Wang <jasowangio@gmail.com>, linux-scsi@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: [BUG] scsi: short virtio-scsi VPD response exposes stale heap
 data
Message-ID: <20261006054845-mutt-send-email-mst@kernel.org>
References: <20261006091138.827988-1-tjdqudcks0424@naver.com>
 <20261006052300-mutt-send-email-mst@kernel.org>
 <96622e4086e5fb77b8148631fa6ca16e@cweb003.nm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96622e4086e5fb77b8148631fa6ca16e@cweb003.nm>

On Tue, Oct 06, 2026 at 06:40:54PM +0900, 성병찬 wrote:
> Yes, that is a fair summary.
> 
> More precisely, a short successful virtio-scsi response causes the
> guest kernel to cache bytes that were not supplied by the device and
> expose them through the world-readable VPD sysfs attribute.
> 
> The guest-kernel heap disclosure is reproducible. I agree that its
> security classification depends on whether the virtio-scsi
> device/backend is considered trusted in the relevant threat model.
> 
> Would validating and propagating the actual virtqueue used length be
> worthwhile as a robustness fix?
> 
> Regards,
> sungbyeongchan
> 

I think so but please copy all relevant maintainers.

 ./scripts/get_maintainer.pl -f drivers/scsi/virtio_scsi.c
"Michael S. Tsirkin" <mst@redhat.com> (maintainer:VIRTIO BLOCK AND SCSI DRIVERS)
Jason Wang <jasowangio@gmail.com> (maintainer:VIRTIO BLOCK AND SCSI DRIVERS)
Paolo Bonzini <pbonzini@redhat.com> (reviewer:VIRTIO BLOCK AND SCSI DRIVERS)
Stefan Hajnoczi <stefanha@redhat.com> (reviewer:VIRTIO BLOCK AND SCSI DRIVERS)
"Eugenio Pérez" <eperezma@redhat.com> (reviewer:VIRTIO BLOCK AND SCSI DRIVERS)
"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com> (maintainer:SCSI SUBSYSTEM)
"Martin K. Petersen" <mkp@kernel.org> (maintainer:SCSI SUBSYSTEM)
virtualization@lists.linux.dev (open list:VIRTIO BLOCK AND SCSI DRIVERS)
linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)


-- 
MST

