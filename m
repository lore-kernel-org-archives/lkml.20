Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653401;
	b=ewgbTkcPdcn1NQJeLnnX2p6OV6e7pbDsz5Mtat49BuvjyGOyQG0UKlZj+95yUPEsbDao
	 yKEiqfdSB4NBIdqcLnRHuNA0M9n8NZ2s0y7JrKS+Svo98YD/DwSSV1CD0ILzbSGiPgdAS
	 QOpNGeKO67ib85Su3uul3ivkFRtFkbklaHiVzv/6iWedDYXwBcQj9IGB4+QYDBcha5NlK
	 hM4u7X4ku+fZu3DDvqlKSGR4G0zesnuTLL7jRwE5GK0WEXzRJkXsaQ11TCoequk2RDdH1
	 BOygZ3pm3GSyQuruaRhYXzQQew4/yox6rWBKXuKl8IGLK/rfDN4BrvkoRbqK5A1BvTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ENsxoMePPaNpj45xMew1J4DNmbZyl2G7RIxxd5drqLY=;
	b=UUJH4b2392HkPwRubJgJ2v3ZbvRC1Muj+NURyggellUIiICJHQlqAn47ZYsGc/3ICLzf
	 uN9d33e3T+VoNJ3+YQgeqb9WpUVwixk/3csoi62IxnQFNGjVFs+8AJRoaqwKbWBwYth0X
	 2Ly6WEgeyXdBbabBPuu4bBnLYjT9g4VsR5HIpoc8x/b0L9MsrzDV5u2lQI1bhUKvHtSBt
	 vWOYCnzGvwmyYRLfy/ryIYdXp6WKNrCZV4I+QZfDDVzu/QhXkfd+WZsifLGws5GM1UbET
	 JDGBz8HfPl9Zv1659ItFh8JRNDPxd0YJBXcbLWiDQC/ZDekCYn14bXi1noEswbYPUmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=truenas.com;
	spf=pass smtp.mailfrom=truenas.com;
	dkim=pass header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=IodGbgUs;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09A606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F09A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=IodGbgUs
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1638900f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1793653397; x=1794258197; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENsxoMePPaNpj45xMew1J4DNmbZyl2G7RIxxd5drqLY=;
        b=IodGbgUsJu5UggqrylEtwTw9NAiGD3h+xVhLtdiq17ognU25AC/NCU6YmS9ItqBh9b
         AWY29MfNVxw3nRhep+UzxwSFqjEG9o38902DRnT9yUQcWeNJkmwVkzPA1je8G1BQhpie
         /u5MUh2HZeofv2yYUJcw9itZgV8zGMySNWx5KnYUVTVZGRxJbsG/HoL6k2wg5nUHANqv
         mxvAKg/W7tfblQ+xjzNweNIK4MDfb+eltEAgjtQVZP3H+xLXxv0+AQl8iYof4DLsMbmm
         ca1EuV9qtpwWM7Js8BJIIIzdFUQQAi6tpB34fS1yKhUt6S79Ym3JvmzZArpC92tDYL/B
         4i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653397; x=1794258197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ENsxoMePPaNpj45xMew1J4DNmbZyl2G7RIxxd5drqLY=;
        b=mjzr35BPPwh/sxdgilpnjNqEvWHE+PpAvxj9/oWHudfRIDWwvv4N/EghfBlH4YCLgr
         5eVq1xxM5AeuHYTNYhh+EHbJ4kYVhZxuaQ6QgxjydXoe9scParUKXIDz7YDDmvpdqA+a
         M+aCNLeZypLMzIlgNKCL2wdayc30CpFeIClawgK+EfIDEj6AonA3xGwvDA4qrtRaZP4o
         Cy8Wke2u6mki910rikyFAAgWlzqGj6CqtHL1F8BQjWQIOBOqSZQh8fMk+k0Zm7aunXPB
         7Fm/rfCNVXDpzuDfNE/iDUC0UVDFdAFqzKU2dsngKT3v1XadzpTbhOK2n9MF2wmDM0ow
         ITbA==
X-Forwarded-Encrypted: i=1; AKwUvBxR8POSB9NcI3oY/8iGlnnrCzEjMXSsUoH2jXklv0HEI3rOMQsjV6+8mz4tg5DYWx3sv7utMZhTJV9s8rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hpe3BhVEnSmtC++EkleWhbBfI7/DvwkNiozhsOmnWw8ekEpKN
	ViNdjWXAPQs9TDSY6OkZoHCr5OgMn03NFRiUNuqkBEzPXoxFWYsP/J0usSVRfQgUvA==
X-Gm-Gg: AYBFou0W71WEcoUmiKLMz0v2MTBTX6kQWM2qg8yS3foJmSUjyZ4Xp953pFJdnMyczpH
	gbaDKSGw6ueixS9GWU5N5IkJiK8yo3CFJzB/wAM7zcAfe/EB5QqTQBkwdOj+7KMnjRrbxrROH4a
	GpvO5S2wTsV7KmWRDGFMwa4XW+O6bpZThXDhYvFL0/Se3kIC8xPDthoaeaOuSidKH/OzRH4VDl2
	TBGvPMlxegF5SDKjEZaq1iTYiN4DlntGoCvzENj3akq15A7BJ3h/cpxXwMK/WHTtZtZfP2OI+i5
	kCdUV6vBknh6c8OIBhKrX2oNy6PffLLmsgQnXB1ESHHgXPvpJg/P7X71SFnET0GpKiDGMAjg2gz
	lQwUKlJB75jb7K0JhoumCodDVZxd0bsOVUzlToJ2ix1GV+mqZy/gDkLc1AOFSdGdW1QeVvbL1iR
	FcbDH7uRfxsn+F9gYBqdComR+A0Alws8TQpYN+L6gGxzRRo6MJv59iBypP0Q2vpBmeR1rGGiZRl
	kOQGYZEtpA6O2VOYtxkfbZqowUha7r8uE93wLrto7vlFwNZufdAm1P8QRQuzdxAtbYSVGU43c9h
	nq85xSM=
X-Received: by 2002:adf:e68b:0:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-48e6e5016bamr17560067f8f.55.1793653397396;
        Mon, 02 Nov 2026 13:03:17 -0800 (PST)
Received: from hamza-PC ([2400:adc1:158:c700::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm20919464f8f.41.2026.11.02.13.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:03:16 -0800 (PST)
Date: Tue, 3 Nov 2026 02:03:13 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, caleb.stjohn@truenas.com
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
Message-ID: <auj4LE0bq7w7lOF8@hamza-PC>
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
 <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com>
 <aujr6x9t2gXbXfFw@hamza-PC>
 <CAK-6q+jBNKN=oSCmm+i011FdhPS+42BZc0iUfbqGiLDBc0Py5A@mail.gmail.com>
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
In-Reply-To: <CAK-6q+jBNKN=oSCmm+i011FdhPS+42BZc0iUfbqGiLDBc0Py5A@mail.gmail.com>

On Mon, Nov 02, 2026 at 03:38:12PM -0500, Alexander Aring wrote:
> Hi,
> 
> On Mon, Nov 2, 2026 at 3:03 PM Ameer Hamza <ameer.hamza@truenas.com> wrote:
> >
> > On Mon, Nov 02, 2026 at 02:49:04PM -0500, Alexander Aring wrote:
> > > question:
> > >
> > > how do you "pause" anything in DLM?
> >
> > The nodes are VMs, so I freeze the dir node from the QEMU monitor. It
> > stays a member but never answers the lookup, and after the cancel I
> > evict it through configfs. That is what happens on our HA systems when
> > the peer reboots without leaving the lockspace and a pending request
> > gets cancelled before the peer is evicted.
> 
> Still, do you just randomly freeze it, or do you busy/poll wait on
> specific struct field changes?

I don't poll anything. The peer is frozen before the request is made,
so the lookup to it can never complete. Then the request is cancelled,
the peer is evicted and the name is requested again, and it asserts
every time.

Best Regards,
Ameer Hamza
