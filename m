Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09839415F20
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788021294; cv=none; b=Ac+Peh0mYcFaF6KB+sMqEZACGuyYCnpSMH4/EvC5lDPFLD1oNCBOvvWxcKb5NQddWezW6XhtsvHG2e7oxVqAhTeK7O5cXhzhlnVYRCnD2gTczogt65CX29tb+PhuISLrWlbclam3OOQcIQ76X+EiJ6pMlQCgq0YfaHpuif6gUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788021294; c=relaxed/simple;
	bh=4D9nZXAm9tLvW+Sewbt+Au+wdgNuOS3iH1O3wBuX5Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jslEZp0mfoVRcf+ZnFSCmNdNj0HMczg9WPWQ6Ud9y6AAFRM2CyPG5esRSvI8a4boRZHuwym27qN6ACxIED+aWfY3dnaQY8EJ0gnhQoBGYpk5CN2Ve7ynHd5rhqMW3tVFG7o7UPL/U8PwaQx+MK/yfL6/8miB8yJq9niihojMvSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/Qg9D+t; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/Qg9D+t"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71a50caa9so25362095ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788021292; x=1788626092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=US8cD6b1qOpH/CBv47csfwQnjWV034hIbN8Yzufaviw=;
        b=B/Qg9D+tutMmvP1FdGyoGoGjLEOxobUVgQRnmZ7oovgWuTSa4wd1TwU+xQIIX0jUOf
         PmKCi8+zG/dofh9j8XFUfpxO49y4hodFNBBgJ7wYNlYEC1P3lrQJQ4AHDXQ+ujK0w6jD
         kC+l56fRrjE3jCPQe4aFl6HeJ25hI0Zllfc36v3mSTmw5QfdbLjd5c2aCp0HL6wJ1x5i
         +roEBNi80g+SHjcbkbksh6y3eAF/PEQ0o7A4ScOFB2ZYswz6HGb1HQgxOKxRnYOxyDm5
         XVJFXzzzwg21ChISyHe/AnUXhC0paTQGyUmybDqqEKw58lcUJFvxiv14Mbvgt0hFzD0H
         itdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788021292; x=1788626092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US8cD6b1qOpH/CBv47csfwQnjWV034hIbN8Yzufaviw=;
        b=KVv0AKhptDPBd1dVwCWko5SJxUgC3kj/VKM83CmXxnqL/gzQAcAXtoqmHpD0cx4HHT
         uad7jdTfAx/ieYEPXmQJ8RBk39p+rJl6eaScyYx7M7WKPb5KSa2wpAIvJCDY60UX4pJT
         vUae0PFFLTq4vd/K9jOS96jrdzVAN4o+CEH63HXJ/EZ3tTcBcCH9DU5omIsQ1NfZ8s1K
         UlPGpyt2aTLnobF3o18uryWVFuwwvrGtcBVJ5XMBa1l4ONOCmua2kbuALtzW94JZPUDb
         LoYQfEzcCTT7bjdYpBm/vzdhJb4YGXYZ0bfAdVzmHjCjG2Sce+Jso8hYtSMQhXBefn78
         s5fw==
X-Forwarded-Encrypted: i=1; AKwUvBxfhvToYSkogY+WZ2W2QDOIBEJ0gGLSQNnSpkbKGRBHNuSWApK3+MYMW1lRYgBvc9k/rg2tjkDkDTclcGw=@vger.kernel.org
X-Gm-Message-State: AFuF++l6gNAqY1E6dyqQTbGINO5DFE7eekG638eTQZJFwSg9zb2Q1a9i
	PKHphBzJMaWorh+TMW0HpF92pzENFYup6iVJ0MJzNHO7aWFf8UWK5X13RWgVHl/F
X-Gm-Gg: AYBFou1+yn+SPxuglDCPuvN1BOYxH5pwW+1U17YzHG2HvOWBUEa/LY252rrJkwfWxK5
	8tmtA7QzsrhWD8FXLtwx/zL02Q5LvHv0Z5N30ObN5q7iy5GlWEalhau82rvHyUPDPgVMolvnWVB
	eoBPrU34cr6jUND9UnuB4RlyFND950P0X92Drg6tHWAhUpp8+HWv9eYgtdWFh4a/H1ilacQ60j7
	nhmlskiYqFrWZNSBmmyQi0nhlplq0y8KkiYXJvD2iuVQM5OnuMgmgLTdqF9P3MQgec7VCxBkKNj
	sepJH9I2Y2FFiC4J6Bl1GpNjXLJJt73P6MPZKRjdXQGPMoKSmXbdxes6ZOddNow0QpU37KsR0q3
	qQDUPlHNHtQmqvknTVtwyUtzo2XRLdLT5Ha5jhHkmHdDgfSHiw+OV4VvO4e15Jxh+PQhQu1iXUh
	UA+nGRItHePxLEwo9LSdQfxGzFa1V3KOVUZuBCys/Tx2Wv7y09MTcH2VVb7LB+Hz3TuPZAgr3wb
	XOke1lxZSePil3LuO3Q2mIAY7gQGw==
X-Received: by 2002:a17:902:fc4d:b0:2d8:d4cc:5bb0 with SMTP id d9443c01a7336-2d8d4cc5d79mr129510945ad.16.1788021292182;
        Sat, 29 Aug 2026 09:34:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:54de:b26f:8c97:cc89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm17925741eec.13.2026.08.29.09.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:34:50 -0700 (PDT)
Date: Sat, 29 Aug 2026 09:34:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: Re: [PATCH v4] Input: atkbd - fix uaf in atkbd_set_repeat_rate
Message-ID: <apMJ1qoPOffbB0t-@google.com>
References: <20260829135959.14882-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829135959.14882-1-jeffinphilip14@gmail.com>

On Sat, Aug 29, 2026 at 07:29:59PM +0530, Jeffin Philip wrote:
> atkbd_disable() marks atkbd as disabled to prevent any work
> event to be executed, however this can race with atkbd_event_work().
> If a pending work passes the atkbd->enabled check and atkbd_disable()
> runs after in disconnect, it could dereference dev which is freed in
> disconnect following atkbd being marked disabled. Fix this by adding
> disable_delayed_work_sync() which drops all work events preventing
> any rescheduling after atkbd is marked disabled.
> 
> Reported-by: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=1e2ef9bcb29af666b2e6
> Fixes: 0ef7a26af127 ("Input: atkbd - fix canceling event_work in disconnect")
> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
> ---
> Changelog:
>  - Changed in v4:
>      Changed location of disable_pending_work_sync() after input_unregister_device()
>    as per Dmitry's suggestion.

Actually I think I was wrong and Sashiko was right. I will probably pick
your v3 but I do not like that we do not clean up/reset LEDs properly
on disconnect. I will have to think about it some more...

Thanks.

-- 
Dmitry
