Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D336E545D82
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877432; cv=none; b=qnJdGsI/6slaa2k4XqseSOLafmH2qJDpJSdx9E4NRwlcGRLnpYAHDRr7Je6bElZvzomFNsPgRd2GtTTshP1GqkiYOPwNCP5MIy4s2kBFUeavcg9RcdfTfJ2WMl6NIsE+Evqra8lrx9Jczwq9lzSqqPrP+H4S+kHq1XeheqqiuIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877432; c=relaxed/simple;
	bh=NKSLcc0XWVLl32spztk7XP02BhHOIHp87F6EtVuddIc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNJYPjKL9P9rdDZFjh4P9gOY02M8hKM1KNH7CvaTzoJ3huXWke9fs8/5PUHGwUUjVe1TkpaFDpjcb4WCWpUKYvEklaqehs96ATkGb77uDcIz+xmML0tFMlPxNZiSJd069yCP7C87LBWIH0WVS+VO8qnQQGoYKsRsjB8fR1Usg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9CpbJC5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9CpbJC5"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8520161fdb9so4689744b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788877417; x=1789482217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnF7FxdLIEQlswE9xvoQ5sUHHcQzYgPIRrMFvodMtWw=;
        b=k9CpbJC59T/ItxFXqXOfQlo8l+W0og/JCj0dh1uf7UVGMP9xBqViRBa3uTRcY0jywx
         6yJqa/qXixbI/0BpZEBmO/czC5Y5elR+8fErfRubGiGmWKpdZh8E8GZ33nexZE3oWJbl
         utdlEo8c3CreWGs8kOMTOXV9Bo/l7eD6CJaDzqKfZSjX5mUzCx7JrOCgT3XylIRPxbpH
         XGh8onrhNVC0eyTOXRlYqGgZ3vuiC9Go5hJ1MOJNoiqW2Z3G28p+F7b8T6lOR7QqG8UO
         43NP1rsBiQJuEfgMsZsg8MG1OQ6y4NKvYSg9cNrE7YZv7uYY3KotNJlCmbBgSp+fPOMw
         jbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877417; x=1789482217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnF7FxdLIEQlswE9xvoQ5sUHHcQzYgPIRrMFvodMtWw=;
        b=pa5fxBBNtgLunFQiNMNPRbBWrD53Sg8yv+OLyc/X8FP/ND7M6IaKE5IWqXeGfdtTeX
         KnrHXNOleUftJjjfwxETmB7MipTDcaLZ4yRxbrEx4K7CGOcS9oDanT69np+bh3rhUoBL
         JrDPcpES238Jxp4M/od0U0osrrup1o4VS4yW9vWii+KFs8WU2hlKcsJGPFDmthAhfxnw
         KoaZDYHfGqbiE8weJ8Te7GYh0QEpMGp8Z3cFxAGGphqVfgc47rL1kcgIkbdkuVK2Q4Ff
         xcvSHaWRo+pwoTefG0NRBZ+rLbAZiGikbKYcQYCO3Dp9nLS9ENO/8fO0ZUP3OFSv5yys
         CtoA==
X-Forwarded-Encrypted: i=1; AKwUvByYVyXGLeBGZfKW4Kzm1xQ5pxdZqCDIx4hrYN5ikE1o6UDwn2abdCWNBux2/TJa82yiusn9ppiQB5/bgNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lGekVXBd1PYz+vHLrM/87vwpMVYxQNI2byl5gdsHAdu58HhEuI
	fRQGxaxQwettz2xFFHC3REmVry9w+UQi4o2dRMqg7z+mWDWvyxlOVfgw
X-Gm-Gg: AYBFou2kLQuq8SCayo0WQ/mZ36XDiMUjvkeCd7ro9VDhRx27I8Q9NBLF772vl+gOWn0
	zxeOY0vWs+F35MsW0yoMZVoCmKqWd7pme4fXs5S6/9lN5FV7AqGm+s1TNvhkGMtXNZNDtsytGUd
	MK5gXn0AVoiLS8BJ1yZnBZyPmv9M9Mj7ex7PIOt1hbHhc/ETc5SAHqryClYeFlRd0k7P/OaoXsI
	dFYIj7CPUpmB+ZtS3D3+ymAUY1SNfD2Cq1DoN0BHZDXMUUINGqyJHW/D272GitQ1E9Rc+FinOTI
	ot+KxHR8S+1Hvbw3WjBHcohNgFVRxHb6ykzNbz1kUvzM7Xv5SBpD5rKb7lA+ZNjql/e7FbkrXfW
	l+shcWMRgM9PStiwz5F9yDYj9bdJnlpYYLqcV9whtWloCsD253SOt3yQ5L/pmtAmpu6iv3Os/rU
	LBD/3PUUD6kN2fAtxLV7aUi/CPs5OI6kddyHoxJKDYZg==
X-Received: by 2002:a05:6a00:1702:b0:857:726d:270c with SMTP id d2e1a72fcca58-8616dd51063mr41868561b3a.24.1788877416550;
        Tue, 08 Sep 2026 07:23:36 -0700 (PDT)
Received: from pc636 ([125.29.25.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm5590951b3a.59.2026.09.08.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:23:36 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 8 Sep 2026 16:23:30 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org, Dev Jain <dev.jain@arm.com>,
	Ye Liu <ye.liu@linux.dev>, lirongqing <lirongqing@baidu.com>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for
 vmap drain
Message-ID: <aqAaYhLcyzscOCxb@pc636>
References: <20260905152717.11711-1-urezki@gmail.com>
 <20260905153704.e7fe650d0226c3e20c1c8449@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905153704.e7fe650d0226c3e20c1c8449@linux-foundation.org>

On Sat, Sep 05, 2026 at 03:37:04PM -0700, Andrew Morton wrote:
> On Sat,  5 Sep 2026 17:27:17 +0200 "Uladzislau Rezki (Sony)" <urezki@gmail.com> wrote:
> 
> > drain_vmap_area_work() function can take >10ms to complete
> > when there are many accumulated vmap areas in a system with
> > high CPU count, causing workqueue watchdog warnings when run
> > via schedule_work():
> > 
> >   workqueue: drain_vmap_area_work hogged CPU for >10000us
> > 
> > Move the top-level drain work to a dedicated WQ_UNBOUND
> > workqueue so the scheduler can run this background work
> > on any available CPU, improving responsiveness. Use the
> > WQ_MEM_RECLAIM to ensure forward progress under memory
> > pressure.
> > 
> > Move purge helpers to separate WQ_UNBOUND | WQ_MEM_RECLAIM
> > workqueue. This allows drain_vmap_work to wait for helpers
> > completion without creating dependency on the same rescuer
> > thread and avoid a potential parent/child deadlock.
> > 
> > Simplify purge helper scheduling by removing cpumask-based
> > iteration to iterating directly over vmap nodes checking
> > work_queued state.
> 
> Thanks.
> 
> > Cc: stable@vger.kernel.org
> > Cc: Dev Jain <dev.jain@arm.com>
> > Cc: Ye Liu <ye.liu@linux.dev>
> > Cc: lirongqing <lirongqing@baidu.com>
> > Fixes: 72210662c5a2 ("mm: vmalloc: offload free_vmap_area_lock lock")
> > Link: https://lore.kernel.org/all/20260319074307.2325-1-lirongqing@baidu.com/
> > Reviewed-by: Baoquan He <bhe@redhat.com>
> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> I think what we wanted here was
> 
> Reported-by: Li RongQing <lirongqing@baidu.com>
> Closes: https://lore.kernel.org/all/20260319074307.2325-1-lirongqing@baidu.com/
> 
> so I made that change.
> 
Yep :) Thank you!

--
Uladzislau Rezki
