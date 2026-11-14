Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657338;
	b=m8CFJuGdVwyxm2XYcpjjr0nJc2hLqWJG1pk8c1G25OtBTfhQ+saKsKdbi1rDeBwHGmuI
	 OgcthrCMIHVNCeUNt1bs30hVOkg3jCTtNkuewakLHJesLIaF33KMsE58SzkqQB/2Xs2GL
	 BJtgsXCQsuCarP/4sM2v0QN48auCKf8aQTtoR92eCASsQjao4Nur5vkzejquXhzIgjIZk
	 muf1fCdN90vG1wV8nIzk2A9H0oR6IrHOSSBjjjy7IW3BueWyzVc7F4y9BQw6sPYN+ybqL
	 NQ2712VwK1Qi0uFQeuVhpRfNhfz79v1rnWhIIxd/YCIqHH8bCKWDiRgcq9hPov8J/HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
	b=KiPwkiHxxyErtpKoNXaYCJUuw/q6Lum1MjNGiI4JLTbizryqePxejpp91KQFDhM2tCsR
	 kMOrJo+lnWyko7dk+L1DdWHxaH5Qbc9O/rA7NjBmZA4VHRp4Jji5mbnMJdhb1XfQ6HMER
	 WqjUiWYSKz2pjwd9d6ceDjpjqoP9FVdfldTrezFCfQCFb8+sv7W/aq0c2mIRqtDetgMKe
	 RTKgX2ngP+5ehL+VW+9M6+NyqNe/WDuppaTjjj+exU9IFIcJlXlP8/RB+Svm7cWdxbroj
	 4Hmb4bY/EL+l27QUfeRaGFe7Eqo0nWcUvhsjYPm0/7qc2SQa7byhLAUvnLVRd5FkANg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D6606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0D6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so338682166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=MrTBjpIEXzsSZaANjc7oExJhwGnF+j3pBQoJGLV3AozjECewWnT/dOn8PoCfUIeYGI
         mRgldWBhVoyoY4kjpOu/TkcCPMpetn8bMN74Irqnk0JnK5MAQS777TE3iVfENO0qNvUE
         8qb82pxhdLikkA/6tATGUpByZMee1vHTbdl6A6vtosorr3+hE9wD/mpuH76lS1WAZqyn
         nUdTyabyG8UAyWqGnpYJGfY62DgpvBldD5kNADP5MARyaYxmHHJYDsQkr6qVKrnaldzF
         KHIyaxdpU8Pcl80WjVwUUXXw+yU81KD0D8RdN7wE6Dhf//BzElFXAKq/AgQBu3vGzFII
         7JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=vIt5gDScZI7R3qcefA4oaYFrSfa26BwqBCLx/ZZ2P2dLF9h4pJ46gTzPlWVwWQPKLa
         p7xWDl/kUUZXMOUWH1IFpJ5CLsmRD34yQTakrXS6ZtWZHkXs9Pz1jLjOfR6hzLOtSC4H
         9RHVLZBa7QwvgK6IoAVPxSG3X+pokbV3mXqG2r+8/ZlshUlveM/msrcVrQAiLfwJq2d9
         nHRHuT0g2+nhUDv0h3iHTH5PnJ14C4dY+uc9RxOM0JKt5Eg8SQGM93d01Aj3/bkQfvXV
         6h6wNFyfomsQjsePyjNTnYupb4c3D9udIEPS3I6lh9T1+Fhq959Jd06J0M5AaGoWiWEt
         VkCA==
X-Forwarded-Encrypted: i=1; AL+hErFCRsx95roJUZkphVbu3PK6NFzGDqtBOPNdDaJ4NQDio2E3oWwX7YiPIa4zOv/Y/OottlAt5u88L0evrg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L8pqDYvY1pfbG02Oc4+uUTbsSa1CtXzZVneuL0tBKvUfWMY1V
	VxYXYfYl3AKU8aHaNpGgu+GDV6jF+e/ZPw/hH0M26sgvRAAT1MbxDQ4I
X-Gm-Gg: AYBFou0Zff5tWai+M/7UYsyqOltgrAFLCUHMEm/PtbcsFbDLUstsMavdmRk5l9r4gol
	6nZ44fLorMLuszDAz15oZ3IX+8Fx67YgetrJSYnu7IACjJKJVhp8iBFfGHjMZcQeeii/Gh4VWVr
	TG7NmKCo5cj6LnkDCaJDQLlcwnl/osyf8LZ4kX4x0ZtecTtn7P5eiIw15rWGc2gAbUaNboXMafy
	ngP6Hxcn78TA4kLK6zcvArmT8CoEMTpheVgoUsIptald7CmxhBKfrstoPLL59iNUwQFyAQHpifS
	JWu5wN185d/pk5F90aktaSuGzq33wQOcg96PItrRv9CXk4/O8YTXY757/sGNrEH+Eqd+rJFkpF0
	aIk8FgoHzcgrEao6xFEFF6eh2conJ4Kuil6J9WwhiCyepCDog9vqz4G85hZfzlw++js/aHCySnK
	1jaKKQ3xbrhTbVXBVUt75tBopE562x04mhGI/tj7VpP1YG4qlaaXeAtc+0/gu5dBjuFvj+aEyLu
	G52G5EE4POvll3Qdo4BZzncUQb+seVbN+ET3GOO13p7sx91jWB7iYt9md7pjjZi/8/WC02No7Zo
	0OVBKjCHFc6Ue62rOHPmJXkJUFFja/uqBOUyH6iRXocVMY4+aQmc+8W+J6q38WtkNTeMUMKT3ed
	rojUZcLs07QU=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.
