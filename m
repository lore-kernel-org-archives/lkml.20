Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329034;
	b=Efbg1Wb20Fq14fC9KH9MFskxBPDu/MGvc+YFOQH5HDTyWfSvgWmWToJ32vb56kDiY57/
	 O7qlDNgfF1ZhRxh4/UZ6tFXfR/U+XjcBqHYFTFs4TWwdM7xwwec4PsHiGMqR2L+CwAyr1
	 ciqnRoYPPBENLHvsoVZuHuq3p0exYvtQOtDWPaJX0ojELE57cAd2Uf8Hl9ZTDSkJpszoC
	 CUwmS+skse92v4l8s8jUNtAIR/4BzKbAofei36cRAbKnIDp2mZ4TgcTi8OsxiDTc8AYik
	 XYGXlVwgDLl59tcnQnFh6o5IniGXiKpFh8Qqh/Mg7qIHcBoakTG6i0qgiW+qugPkHlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=/ZdXC9RaNc34pyVI5ALRxFES86jLTzutVsfPjdP/KMA=;
	b=lg/hyDY1eQTErbAXKOL5BXlKtSNndsmiIYnuMWSp2HFd69wg9Ls1WornoVT0YZpg7wE5
	 2p2jP39RETlqNKhgmHyfKyxQsNneFsNk1Ac+8e2vvP9Jw7jYb3CwDKVtcGohmt/i5Eb/E
	 q/1NmxIKBW5iIpxVwhTmLHOhxIzthA5law1yEvxQWDUrTY5CMMPYx6WJfKJbmZxJm/9E3
	 eI77PPRQyU75idLXUJ2+jiFcKq3Lcc6O44dzWFa/wPJapnlVOUm0vcfm5jQqkzpwLHYYt
	 MKxBRPRQb4cUI3n67JbEDZwVoSkpbkzB2vdxjwgcz4vOgn6UuriKkpjlB0jABjfeppg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mCvEF/B0";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7822B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCvEF/B0
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06c60065fso95917b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793329034; x=1793933834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ZdXC9RaNc34pyVI5ALRxFES86jLTzutVsfPjdP/KMA=;
        b=mCvEF/B0x+B4fIM/iYE4URUqrgWef4VAXimGI6qerYmN+LkM2lC00w7qib/QTR9K+x
         q8EDgBKBICHnCc3FmbAcwYG/Tr24NW0beOLrPAIAuhvf6gRTt959p2G2o0ya9TgSBY4P
         lg8942Gku5CIXn5oyE0+a1T6rmsFcJR/zqf9T4MTsND/pXISxluBRn1bZemCja3/B9xB
         eEB9pOr6KeAozcL+PVhrlqO4upaRtvFRBBOnTOOABAfVJ9uB6HbdnF6mDjICro3ysOHc
         xQdeWUG1hAdFrw+eX+ckjPQrlxeE4b4fQHUjwJz/sG4pib0SoAGI8zPS9fu2RK8eZUQp
         lEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329034; x=1793933834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ZdXC9RaNc34pyVI5ALRxFES86jLTzutVsfPjdP/KMA=;
        b=jPgtz0aAdjk0oCmGoTDpb5F5uet46F19gAOqJ1+z/kQHL1OyQ6xvdBiX0lzjQITS7V
         hoIrWUR5M/DjGPOLMkHwOmoF64V/zFJ46+gwzqmgH5JnPQJe8XcFgjNigNhoMsXB2JsG
         vbmH5cGDtUZjE4cxnywt7ztqZwha9e9FhdpUEubNgxW66A+owUmoc152norlHDpUau76
         WplosmOtJcAae4mjtoC1R3oVnqJL1wRywXwT5egpasRR7Adumwsw7yXv80/2RLEGKp3G
         v5iVkOAurTbPLFc7JIuYm+NKUHJXsDBAE53jGsC59am7sfuAGWw7T9JFxMQodxMazHk9
         bStQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsep+nyblagJ/YzJsdF55/h3dV+cv2En21L5xQtz/rjQNZ8ek30uwF9RF+II19j+ORnhXy544naTpccP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw8zjfyPntcg/icPKsnj6TMwf6KM5rHBFJFKE4nfLzzD9+KAEY
	0mfoSpe69maG8ZtJazzPVZl8catMYHVrP++uV0AQ5LMh3sIHNQ7cLSqvkdxs/+krApQ=
X-Gm-Gg: AYBFou068vh5TRUxFoXGBCirwaiehZaksoYO1xE24di3dIF9LwwuUfm3llJ7+nW4XVL
	kwl+0NGkT1sW0lMWtiO5sB49lpDXgSEr/0ZNoXFbYSsk8fFfxf+2p/s92F6EJLYja687aLZf2O4
	E4hhnyi1B6AJjZijmMfcbyUlXTGxht56auIZvRnXVbVK/EnbV0hUfGXKR8IW3lBKb73SZ5M9Rl8
	WVFNu1WbTVviiMDNM7BYCFTT9U0WAoFMnNNjvQ0Oi9K2xe1nzNBFpRVj+bmt6PImRCz/a9g1GCz
	Dkh0PG2yD8923a8unf5q1v/o8jyL00P9l5GlkcotAEObQKZv6m5rffQ2dESJSiqng9pN7uw1KhZ
	FTXjQaD3gCMX7lKkiCmUQeHih8rcrAecRkRCEYgiTPYIEaWF5tvBe/TzbxFAAHc1e0ZrfAo3fCm
	uN9bQpZzObp7o5aVRPFt6WGqzv0Wy4nQdhg3NrK8Jgf2+0+9dqv4EN/mTC2R6YSyYYcu+jn82lf
	rbbYy4m9xOd4W+hsm8353I9X3wqxlm/LtiZzBXrwgiTvCsWS1qPh1ZsfWJVYz3EyCCCsNywIPvx
	/3b/2RmsCtIiYJXVUPK9I7PziU54Flek56vLkjKS
X-Received: by 2002:a05:6a00:290f:b0:8a3:df84:4c14 with SMTP id d2e1a72fcca58-8a9bee525bbmr794496b3a.57.1793329033656;
        Thu, 29 Oct 2026 19:57:13 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef95cb5sm162643b3a.9.2026.10.29.19.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:57:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:57:10 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>
Cc: liubaolin <liubaolin12138@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
	ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ntfs: wait for bitmap folio writeback before modifying it
Message-ID: <auQHhmnBbntRem3o@hyunchul-PC02>
References: <20261029-b4-ntfs-bitmap-writeback-wait-v1-1-e2ba711b2dbf@cherr.cc>
 <374bf856-f880-4fa2-abec-c4b2a063bf57@163.com>
 <auLlFEHMZvANXUvU@kernel>
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
In-Reply-To: <auLlFEHMZvANXUvU@kernel>

Hi Shengzhuo,

On Thu, Oct 29, 2026 at 02:17:56PM +0800, Shengzhuo Wei wrote:
> On 2026-10-29 10:07, liubaolin wrote:
>  
> > Hi Shengzhuo,
> >    Could this deadlock during MFT bitmap
> > expansion？ntfs_mft_bitmap_extend_allocation_nolock() can recurse into MFT
> > record allocation while holding mftbmp_ni->runlist.lock.
> > 
> >   With L being that lock, could we get the following interleaving?
> > A and B are $MFT::$BITMAP folios; B is outside the cached iomap.
> > Time flows downwards.
> > 
> >   Writeback                        Bitmap expansion
> >   ---------                        ----------------
> >   lock A
> >   set PG_writeback(A)
> >   map A (take/release L)
> >   add A to wpc->wb_ctx
> >   unlock A
> >   [BIO still unsubmitted]
> >                                    take L
> >                                    extend bitmap mapping pairs
> >                                    need another extent record
> >                                    ntfs_mft_record_alloc()
> >                                      mft_bitmap_alloc_free_rec()
> >                                        lock A
> >                                        folio_wait_writeback(A)
> >                                    [wait for A's I/O, holding L]
> > 
> >   lock B
> >   set PG_writeback(B)
> >   ntfs_writeback_range(B)
> >     __ntfs_write_iomap_begin()
> >       down_write(L)
> >       [blocked on L]
> > 
> >   Cannot reach iomap_add_to_ioend()
> >   to submit A's pending BIO.        Cannot release L until
> >                                    A's writeback completes.
> > 
> >    ntfs_writeback_range() obtains the next mapping before
> > iomap_add_to_ioend() can submit the pending BIO.
> >    Would we need to submit that BIO before taking the mapping locks?
> > 
> > Thanks,
> > Baolin.
> > 
> 
> Hi Baolin,
> 
> Thanks for the analysis. I checked the paths and agree with you.
> 
> Following your suggestion, I prepared a change to submit the pending
> ioend before obtaining a new mapping in ntfs_writeback_range(), clearing
> wpc->wb_ctx even on error to avoid resubmission. I plan to make this a
> prerequisite for v2, retaining all six waits.
> 
> One concern is that submitting at mapping boundaries may reduce BIO
> aggregation, including for ordinary file writeback. The change has
> passed object builds, but has not been runtime- or performance-tested.
> 
> Does this approach look reasonable to you?

I think the early submit should be limited to $MFT:$BITMAP only.

> 
> Thanks,
> Shengzhuo

-- 
Thanks,
Hyunchul
