Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499990;
	b=DpfseSBZYyr9P0uSj++rOlPdeR1yyvSqDOvD2pAdyX9XTvg9TIwyMSyIS/QKxc+9GBsB
	 6WjUPtCZYzSa0CpyssnG3CatrG/qSIHnPRMz17hewmaEjSbq+XAUbA252Tk1I9KfLlUk2
	 p1QPztdXV9IClKvtJLc8VkQUowPCXLitdcXa11hOJC5Xi0nhsm57gunw4P6elzvKHKpg/
	 HjmyyHCzR+jYJmw0QXQwjfzsqWGtVpa6kTENVUdUwyXALENiG84GuN7vjLk7bIk+Mc+/P
	 +ddDRNAwAFFxmm9KEe+2CSBXGB7F/Q2uDJsZcVy/DrdKSi3QyODeN+wWkDpxZl0xDMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
	b=Dv+er/mihfWqC2ka8FW1XSEyxn1mY4OczvnT8cRi/Q8q4b6GmutkqtPft0FF4k0fOjs8
	 adcD6x1aqy4WN5lE88PbUu4FdY3QdMDdSlKo3ZlCys6Jia4idJpiL1mcLvHEtzqFvOHey
	 +9dzwgddC/BQ2UqhWyMhJ1aFu6xRqhGPXHMZVJ58+OL/GcN7VT25MGWTdTXvK/kcPu4c+
	 N3D94rbf9OoDq3+QoBG5XgeHY5QOSWai3aAkQjMEFSw4NtNUE/siPUVv8bbvDUItn5EhH
	 QKU9GxHOu9ODhOhp2Bi4T6LFXKZlbZsrxnCJFCojbswAwBQlGouc0HHL8W4FqQPm4tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gckgA8by;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F79606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gckgA8by
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c45111bebso1990131f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499988; cv=none;
        d=google.com; s=arc-20260327;
        b=qSlvwN3uLSSSGCz5EgbgD9yRNAtqadCupsJ2YHmQ+IZZUm1Ekf6a4SbuBYj/WM61k+
         L7xzttekBi2K6uUP2utT8wDaXqlEI/Vm51pPLIWEdQqZCbWtyRi+vLzhHfLDI2+PYEC8
         yEqAESihpu821H2nde+J2jzYeWbamnqQYC//5qeTrjmVwEvzlVwfxkESELG3Z58Nmx7R
         VKNscqwmtOVi8vyeVeyhM40pnMiZP/O+cErQw7a1uvW3wZ8mt7/C2NefHYaWV/w0b9Nk
         ISCj8ys5EDQm+H0+736jg9UebWHGEJraK9HJZFtl86u086qe8bjYnpAz7n95qQFzqgZ6
         kjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
        fh=w8DVwzX9ZpijILuEhV6yPskB5efJC4JIrYeU0Z/urXE=;
        b=OThqwPAig6+PUxdU3gp1GXDcj6by7oGLqH4KFEGLgZGDx2Ig6Td8ktmBW15PFhQD4Y
         vlC7CwTOERczEHYBOf8RY6+wEaiQCarr/deIqdh0cUtR4s+vSLeUHgL6tdp0MFDkNXnr
         l/wdZJvuUgnItGq7OPXfsun4jnxxxEaQJ/zJ/SN8RVpuytd1UNJj23CcY1Nq1tgvSbHs
         xe4fZviqJI3V4u8utDZ4/4GtA0Y5zc3UhZu2AWovfkoWjaVlgIr4b2e/26+jCusvHra8
         0eUYAqakvPuHdQmzSGDfE/+bdiYIffsjh7KPGJwKtUza7PcQrAcr5keJ6dmeioYF/Eyu
         eEOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499988; x=1793104788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
        b=gckgA8byjsGEdVN8Oe89vE/KvG+6bqzWUIfTn8joJ2MQKIZ/t1PNErPtmh9OMAn3vC
         P3eKQmb+TvnrYRWdfSArFZDfukjYzv85mZWJWq9dWaG82DFfJowJo/MZxMttJ2kJjLys
         53CbLDxXimjFQpc4ybWTbYWQ1PHhDweE4odPk0bAyytyCvQXygxtbucjPnonKjYpgD3s
         ohFbDFbampKm/vVXv3FUy+1qzb+8QxK+Qu7yMV4dJ5xU24dVnjmPhO9v6MoCxSbJEKnL
         A/v0+5v2iqiQJL7lcDUjoV7ktIFPiFWO+zzyXKi3gXQakae7FAnBHpUF09dIr5/QUShA
         1CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499988; x=1793104788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
        b=eAsD1mxy2KZFlI/Ea52cuaYmZDzi72mN3grY/hkJ0rRKPS0bTGK6EHrGVb/1/XyFa5
         ybZScHV1Pa+zZZ54oYTD0zmnAOt0u2LY98+a6kJ91Q75ChbG5y0Px8/XYBX0XLQU79Xw
         LgecGpNJJeRr+36hOXZg7Af5CWK31Er9T/8kX564NbPvqC9+Ud0GTtHzs3+Vss4vdhod
         8Ppn4Q+SDHl2w6svU2eA/NQFuQCfNf5okFr6i5fh9lw0KIW3ptNw41YAPktsI4cKkq/X
         9x+XTo48JLzuTgjBb/zIXYYorfmg3bc4vnFZFssTdUgFHCUkOV175MU70FFDK0dfsTL9
         zp3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRx8nO2c/jrHmuOeXVoEftIEnasY6KLaUPjzX2IBsrD3FIaFQtomDZY+3cyh2RJusznljMQ4ZBpI5ugOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkw5iNHn5iB4khXCzeq/pVVyG6aK1Pu34gFUaWIS48VTItChsc
	fd35fgP/r18AEMIcNIJF22w3Bwha/i1cd0MTdpzZRq0a3Q6uDZ7E0HaJ4bRbd70mhk8+4Cy03qV
	CaC+RKf/n9ZrK0L61qmSSmYEtEay2/xlpqhVecqw=
X-Gm-Gg: AYBFou0vmKJy8cw/7gS7imZWCCiNFu8rqhKavUgY6AoC2KGFzA0kRS3Y3aEmHFYqqIM
	DCOkHkkTpaTScDwv3DejCODuG+2Vuhpy0+VkA93FW3+DhNrpa2GFsm4I+NFdRHyI9NV1/nT4vlN
	r5dAHmrmq9JO2UP7SWgphvm9pUlSv2bOkuMdkXw3R11KGtG4gwPUo67bDWlR8Rdh5z71ltjj5fL
	4b0SnaJQm563FLfPmc+yOkuKSCf6M9FhytInh5rv0T5iQLlncgeWhh1nm86yDkemdwvzRgXmALO
	7e07KnsvTFUpytHWo7Hgae4P02wyJYOZGTRYUEkD22S2o8WXLlSS6sVjyQXQbBk5NBE=
X-Received: by 2002:a05:6000:26d0:b0:48c:77ad:d52d with SMTP id
 ffacd0b85a97d-48e20fbffb6mr3084270f8f.43.1792499987813; Tue, 20 Oct 2026
 05:39:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com>
 <2026091034-slicing-same-692a@gregkh> <CAKD4hN41w_bRPAY3i9=tD1tWQLag3r-FGsngD5U6igM=FWe-_Q@mail.gmail.com>
 <2026102052-stretch-craftily-e3f8@gregkh>
In-Reply-To: <2026102052-stretch-craftily-e3f8@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Tue, 20 Oct 2026 17:39:34 +0500
X-Gm-Features: AclHuK8QNNfi9bQ6Wl4hOpfhwScE0HF214wRGBmecZbXX8hu2QyD6SP0CGAeWSI
Message-ID: <CAKD4hN5mFTS6OyYjDdWjDs1b2Y99-FZCGd4AkXhEOZ-gF94Ovw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies for the confusion, As a first-time contributor, I am still
familiarizing myself with the patch submission workflow.

I have addressed all of your comments in the v2 patch, which was sent
as a separate thread. Please review the updated version here:
https://lore.kernel.org/all/20260910105359.12915-1-syedtayyabfarooq08@gmail=
.com/

Thanks,
Tayyab

On Tue, Oct 20, 2026 at 4:39=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 20, 2026 at 03:49:29PM +0500, Syed Tayyab Farooq wrote:
> > Hi,
> >
> > I wanted to follow up on this patch, if anyone has had a chance to revi=
ew it.
>
> It seems you ignored my review comments on it?
