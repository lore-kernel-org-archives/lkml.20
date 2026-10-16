Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A431F9A4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120426; cv=none; b=qxy6o2K7/QeOAeW8Vy0KmP2dFzdiIvX2FPMKQCen4uv4HGm+Dk/ZtSCgBB0C6CbiuKl7vZhHW8JCylhtqZ3U6NnOS/eIqRcghqo2Uo5b5Duf+xZDcV+AZ2opEJl3deL2UfLFyQVPqx4XDH/t2hjS5LDqhnLFtKJJbZY3l2RK36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120426; c=relaxed/simple;
	bh=wleMGtmNrjSRnjejVtlXOJUIdjEEXlRsTfBv/1SGjqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A84u4+agfsc9Zze+gATwNZmI/aZ7UmqCYTLSMUmM2+SX2sPlXUQIYLrqVcaxVYi10+DZ+aflpLsJ/vs+3Jjr4OysebZjIYyps8PKZ9q0qgLrt56TZUoTZzExL8MgfgkS6p6GkALoDLoObwNsBQI6p3UqOgfHdR40e6hGPfvDXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KIUgBDBP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KIUgBDBP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8897e83332fso390433b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792120424; x=1792725224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kncXSXLqdZsNjreOv88DLkZuZB0aSQpv0A/ER6BF3zo=;
        b=KIUgBDBPJ7rpEDaORQ+17932OpplA8zMrI+rNMLATMBC/N+5+iGgpx12tfGI2n96qj
         lri5vFQAAp4l+CYznJpto75ymAbgAcYCErP7f7iwwzRSEo/jTkA0ulCY0Ycu2EGN9OcD
         jKhO/TnQnbn33HRL7QFmLvIr1ZVKxHu7/as+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120424; x=1792725224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kncXSXLqdZsNjreOv88DLkZuZB0aSQpv0A/ER6BF3zo=;
        b=yYhuOU/gbP1KvBW1nfjUwi80aVxvFzgbK9gcOn/k2wiZKIrsSX5dJUBzzU84aukKQ0
         evlWv11Kj/dWN2lDIsRDUdLvPFLKMOrNpzlGy0nW9FNcT7OIM3PzinKq+2htmYQB4VIf
         LP4OQOTQxQmj9g7x1RnFInlnQPCC/LZG7JdIl53nmRIb6fI6RUj8+mv2r3Qg/Fa0Edp/
         VtsRVgh6OUYSj/7GkKnIThFM1iHYQor4wJVXgLW9dRTpOjzSVM5DdwYjGt4WxO9La9ac
         n/nU1eOHcefz2zu3BwycGmRY2zTbkVLflEqicF+LWobz99JtN/mNWs6a/46SkqAxIEze
         ohxg==
X-Forwarded-Encrypted: i=1; AKwUvBw/p0S3o6xZFxCzCRoiA8CJ7kRafQV1gUWKH/GF+xZpqtKPTvYLp/b+XcoRXQYBgMZD22cpqCDDRMPTnFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPEy6lTwZpWT6F+vJuZNQmtXB4l8PmnsBElrjR2yiDkGxnDr7m
	PV4t1pBvjs8fQMzUfMkp4tqRgytFa3beJkJ69QoQ/YdnF6OV11Z8qTfXu2YMCpOl5g==
X-Gm-Gg: AYBFou0CGDrUTcxrx5OxYOa9Qi2zgiytGdr014R1SmH6F5gQeHubx+oZYed+Q6I6VBu
	fDJ0FH4zJ55i0c2QkMB+fL2MsQmhFfh89v4l/LWbgPK5jGuRONJQfjwWu6xCZzJI02wP7AYDTC0
	DO9qyfJTTAeMSifYWMful0S6zNVdZROZbSmXo82UcslEcEbImO525kSRV7dlMSsKsY3fjdmY63d
	HxWlG3HlKdm5PSu4gBW4j2Kg7uVKmCy5c1z/SyfXuGA+4zQgCx4vvpcViSGSfafUS/gNcSgtr2K
	ES2v+6pFDgI01MTEsWqoXYkvxxJSJokImSaGNdEtwW1UYomhWPmZLu3QWW+JvF5l/w/gg97YVgv
	ZnkZFmRK1ieDxt1lZkG1aHOmWWxpgaJJGqGivvaDW3rJt9oHgG4BR3pwOOUnjxNAkPPmizF+uhq
	YoHXlbRZXlBbJMEHnvM55/YZZ5ov8c45dNNSiNrgOIf8UDH09SIMSn3jbBZlhS92uW7bHK+VTBx
	TAeziTSoxuBDGwFqMfQ4ptId9ubOvkFW/h6FHp6PaazETBYewn2ZFkSyru9JcqlAYsDqN6ffKks
	H5r1O3b3pyg1soK74cmi
X-Received: by 2002:a05:6a20:3d19:b0:3e0:da23:8743 with SMTP id adf61e73a8af0-3e201efbf5dmr1523172637.23.1792120424479;
        Thu, 15 Oct 2026 20:13:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b2eec9sm406056b3a.8.2026.10.15.20.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:13:42 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:13:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Barry Song <baohua@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Bo Zhang <zhangbo0325@gmail.com>, akpm@linux-foundation.org, bgeffon@google.com, 
	minchan@kernel.org, richardycc@google.com, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Message-ID: <atGWIBSUdnwJ4sTX@google.com>
References: <atBh9xfpOji_A7A_@google.com>
 <20261015112440.1491168-1-zhangbo56@xiaomi.com>
 <atGPwJL6XzlRaMva@google.com>
 <CAGsJ_4weqqSGH2JCh5EThtU8N3e96kRnhLtd9Fotia1t+7YqxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4weqqSGH2JCh5EThtU8N3e96kRnhLtd9Fotia1t+7YqxQ@mail.gmail.com>

Hi,

On (26/10/16 11:10), Barry Song wrote:
> > > I applied the kmalloc+memcpy variant on-device and re-ran the same
> > > Android A/B. It removes the exclusive path entirely in our workload.
> > >
> > >                       9+10       9+10 + kmalloc fastpath
> > >   read contended      ~1,959     0
> > >   read wait_ns total  ~12 s      0
> > >   read wait_ns max    72-96 ms   0
> > >   shared              76.7%      100%
> > >   exclusive           23.3%      0%
> > >   dpin_contended      0          0
> > >
> > > Every decompression now takes the shared (down_read) path, including the
> > > cross-page objects that previously had to go exclusive. The ~1,959
> > > residual contentions on the exclusive path are gone, and pin contention
> > > stays at zero, so the full read side runs concurrently with no stream
> > > contention.
> > >
> > > Read-side contention end to end:
> > >
> > >                  baseline   9+10      9+10 + kmalloc
> > >   read contended 24,749     ~1,959    0
> > >   shared         0%         76.7%     100%
> >
> > Thank you.  I'll include kmalloc patch to v4 of the series.
> 
> Hi Sergey, Bo,
> 
> I assume when Sergey sent v4, could tag for the patchset with
> 
> Tested-by: Bo Zhang <zhangbo56@xiaomi.com>

That would be great.

> also, Bo's data can be put in cover-letter?

Sure, I can include it, along with my numbers.
