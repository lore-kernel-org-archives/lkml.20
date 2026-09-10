Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D96472080
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039351; cv=none; b=l5QPPMzUpMJoC93FMLgVGaeB1EXqV/87gzU6DY+6X+SMc0EX64ETPRUEBEZAgNWkqOhNBlKzHUxvbapWADHvobxjHZe+wwxP1djmkt9EJlP5v3sEk/LqcGLHkI1aru/jU0uvGkPntp2ntGhzMgsuLnEcf6O5XbXV8ql2rkgFUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039351; c=relaxed/simple;
	bh=AUBJWJWJkve3e0pYxDXtyEsmvYME9Ru4V70ME25n62o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jXy7qqerngs51+GiIPCxWCw/Q+fCpSzNsuregXIxy6LSlclVCNMHQhTDIS9Avrhk8DFStzcGiS+b2ON+4jvVOsTm4cAcu/PEcKBshItwfGx2TYlb/AcN/K1pPzauaR4a1dz+6r3J1ShkYFakuI6456vBNrMdpwUxNCIf8/jRqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCNMzlHb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fjcbd85h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCNMzlHb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fjcbd85h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VW7WG5gI3vGojP7Xj/wxG4Oo1lstFTv7nlO/pfTslGk=;
	b=OCNMzlHb7CLIbNldHDIx+qQeP0fCgpfAz0AW0BCEu4PlMNUh04R8KS/Bq13L6PsivVEkni
	lB6SCZXySXVdpyKc/CqOIhoTnJhi/gIddaqEvQZk4oWzdaOCGzppvcekYr2GP5aHggo35S
	qwWGmJfygh48ibVrVp396I7Lmt4zykw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-n_nsEZrdNG27NwgJ2PM2PA-1; Thu, 10 Sep 2026 07:22:27 -0400
X-MC-Unique: n_nsEZrdNG27NwgJ2PM2PA-1
X-Mimecast-MFC-AGG-ID: n_nsEZrdNG27NwgJ2PM2PA_1789039346
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso4705635e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039346; x=1789644146; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW7WG5gI3vGojP7Xj/wxG4Oo1lstFTv7nlO/pfTslGk=;
        b=Fjcbd85h46KdsVRF35vSD+EN65X+OSVJXakJyiei+K778e/v0qh7lv8fuM5feNNxOD
         npQV4LJOpqZ+ocjuW3NRIrES6qGN6q671BHnHFp+sLjeTngwijW4IX37qs3w1ThIiuXp
         I2BMxICzcYWuBsRrjIaZyYNN3lnfZg2ojAEWnMDuu7slM+FO9OtIYJ8TelzzUmCvsnYC
         4I65oNnGw6XmxHmMIl3+mCBid7+8A4a1wQYYhc58RUR89CC56FVfXJJCsdJg9tmE/J8r
         n0MKcwdecflMyW6SJHyKwyvYPrTT6pcEdPGhtzqZiRP+Vt8gISoGmxXoUgsttoS78zKo
         ZTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039346; x=1789644146;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VW7WG5gI3vGojP7Xj/wxG4Oo1lstFTv7nlO/pfTslGk=;
        b=Br/5Y/gs55r59DaOwl2COZtNWOav8BxiXy0C1jPmywuf+gSvJCDVH35ip7YTN515hd
         LsqN9LGOg/xk39vT6zOoukKAIPv0z8AH/5HOim9Y2HHTU9RhrJMrqcxoaXE1CgqXS37I
         pxxX5kftIZH5hz7UQ2KDbER4q3f9dLh5Cb19+qnXZLc9VASKEUHoQ26j1GFTp5HkjbSU
         QE49yzrWypQ1zNjDwK3UadgmoTLs0oCZD6X1r3KTmOf8B7EYV0Zbb2iN51xzTWcmZLaq
         p9ufkyuhskfJ9tNp+36J7s33T9Zc/ztJZOdzwftY/DcAdaUZQg4X2+HzdXxM+syxjRWW
         b1jA==
X-Forwarded-Encrypted: i=1; AKwUvBz4mA6BQJOmFJYq5FWH3ea3w7DvqEEjCUU2CAF6ZBNJbaZQSlDOFvxxm+9xu8Aiem/E64D8+874Qke71O8=@vger.kernel.org
X-Gm-Message-State: AFuF++mXw0r2j6Wik1zR8C/8CTwsKBMMLOwMTY2ycLCXQzntNZvpv2S7
	q8SObbP0zFd8+kX2MmDvAA0YD3x6luYtYC59xgHm46SeaKOLO0G4C1ULwXFob8nq3MLTurD8UcP
	e9YcdKlHiiCHZ6v9QyU1dWqJOpbRruU8A7xX0qfZWSiNGl9fHxykMRn663woxZgAtog==
X-Gm-Gg: AYBFou0SvMueusL8LjVW9m6oXt75CJjAylsFQ5Ph5bnFgSwCjcBNvHZkZocEFbV//vc
	V8ZBt3gasq+O0OVSRkJkNy68Fm1Mnw9EOJAhsHTjnQZToU8FVSbBWQ0vPpd9wv3yU3tZiGeWs7S
	9oYcZO5nGCRZUuaSRR07RK8zuyIC0Pl8QIZO3sEbCBQ/hu9zUhJ68dGMrjrI4DmyxrC3ClA6dYH
	hY7ALWdbkSdZXyZ3CMiS/jKz35AtpG+a806cEB/f7UvTPtwjlVSezoQINbKxxtUFti+ttnyRlgs
	Eg2HeIsoXJg/tGxn4PHoycPcfymNsJfVx+svWSwt0ufOAwf2PdY7a+OT2FI0tbz3cZNcNtDkdYK
	2KC4SU20txfKUY0UjPOWtYxL2okpQUJGoCBKM/2uG2jyJqc+JA2uTBPEJdg==
X-Received: by 2002:a05:600c:164a:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d26d863e3mr29452495e9.3.1789039346119;
        Thu, 10 Sep 2026 04:22:26 -0700 (PDT)
X-Received: by 2002:a05:600c:164a:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d26d863e3mr29452165e9.3.1789039345750;
        Thu, 10 Sep 2026 04:22:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm65309185e9.2.2026.09.10.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:22:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v5 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on
 top of ssd130x_write_cmds()
In-Reply-To: <20260823111959.17029-6-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-6-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 13:22:24 +0200
Message-ID: <87wlstl5an.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> ssd130x_write_cmd() and ssd130x_write_cmds() each carried their own
> regmap_write() loop over SSD13XX_COMMAND, differing only in how the caller
> supplies the bytes.
>
> Turn ssd130x_write_cmd() into a thin variadic wrapper that collects its
> arguments into a small stack buffer and defers to ssd130x_write_cmds(), and
> move the protocol comment onto the latter, which is where the loop now
> lives.
>
> No functional change: the bytes sent and the bus transactions used to send
> them are identical for every chip on both the I2C and SPI transports.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

