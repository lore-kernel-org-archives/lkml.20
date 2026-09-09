Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50623556B92
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982091; cv=none; b=YooYGw3G7uw5vlkS3IsVvMvBKkYmhyAUjd7vrIKTmmYfE2Qzz4Uqs8lD5IVP1rebddd7rw9xTjpeE8ysRZELMlnfPba0E5tsHgqYcNrfMsx0XvDZdCtGE2geSZ9cjHGW8SjEHVi8mh99TrpdF582qvCQ/XJJQCdxAwEL28dKbW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982091; c=relaxed/simple;
	bh=fGd2gQvYjHPd/S46Z42N0Jlf7DxGps2/byqPup1ks4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWsZ1TjdMZjTQJSTXdBeptYId23/GxiieUaTCieI0kfJ1mSVBinKSU73pyIl7bgpy9U36L+LmCBgYnz7yIOcn3DwyWYg2HYHLMCrYVEMxSEUYzeOhtf6wD58yTkflvwPFkH0Jofg4mzlc7bDXVY/esa7w/MVt7gaj6vTYMcalMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rMX1htfu; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rMX1htfu"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309a20a55bso13226571cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788982089; x=1789586889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3BW/nKMoa3+gVnS02BNvPl8t9SljlS9vu83eupf26I=;
        b=rMX1htfuWqOVOyHKThlge7fRi+3bgREEkZqDPVLFI0UDuDJ0Q/UFnoxVg1QRjkKV39
         diYTyxPY7B9jPIU7dOkCSNqCZYEVsep6B0jy//NWrVf9qmvx2nmYl0f8epfLDh2w2w33
         9V/RghEAboYAd3tG40NdpMvcpypfe608uIZ8VQ2yupJeXmN1amypDPMjpmgqwPEczE7y
         NmcUh4ijwesOB2uT3cEqQywWZ/iSvHL/ATgk0jiyQ9QUcZDr0C8gMJjWiVKxt006cH9U
         LyYtLwW3QML6ya6kvqpF/aNXDNr0gO5mNtn1xbCASqZyd7pyqyrE/3at65Js/t1YFxfQ
         Dkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982089; x=1789586889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3BW/nKMoa3+gVnS02BNvPl8t9SljlS9vu83eupf26I=;
        b=fqfbJ8siQ6rqjc4QMvT+wVzq/1usYCMaqpi1wGOfgRoM77nSIYVUEhp/oaWDMe/hA6
         4ZgLwJ/0TqT0qgoAAqFF3IK5ph9cnZifbZtCmMo/4OOYCDWux2Oy7SGC+s59dFrU8L4w
         iUyYOYefi/DUYUzmIkFniGA/CKtz8Xqg5+CCYXad36rLKrCHOLVE86QBP4gFSbSzr+cT
         pxrB/0vrN6LRFEkDm6OZ3FpUbL5r7lZoq2qVs+UwBgkPLeQnauvx1acNUxpCYb0kXcRF
         qbvDhWcpIl0twxZKQT0V+go5BR7z2xznXfqo2MIwKW1G0bCS3M29y1d6NyLLfwtme51j
         pyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvTyXZmvi2Q5hur2d/ggTKyNb8drj4P//phEH6GB4tVAUBreHjSM7Xcbq0ybw3tvc4N+gU7y+dtBYiusg=@vger.kernel.org
X-Gm-Message-State: AFuF++ncu3+GjhsztjbVg01Pz+g2qEaSaiTmcfdyugE3jJ0kZvoujbKe
	TD0EH/ZOkFw/2CAt9dGcYBm2Sc448u9YZjxuBf21PDfJ+/07Z9Y4/lZPIgxqVCcECw==
X-Gm-Gg: AYBFou1HoBlCuAXCgzsTxMFU+kz/M40GRK+VK10Teo4j/1KxTsj7nCzHtg0scwJVCAN
	g5pT8fHcGa5eqBd/GaaZ0BruV7QN6tT/pIJlZLNPDLAhU0ixhiAX9Fi+PJGXVE+a/dqz9mh9WaT
	KqJ/SXK4GFGaWj2CAqCojoN4A2x/ATIG3wyyxrmFQKpoD3TvS+2ZTlBUP0HpP6vjyw4cb/2uDaK
	4TaWYv0K9XczdfgljbNA623czb2BsjusivqGRo6E4W7gVSeGCQ5RzKgWMrHddUciaN60rrBXIbH
	f/aL3mOea64mJSRRNmxGDdC/OPo1Q4ob7y971ldSyppgTonPOXzlqhhgzi9Ik8aMBCJNGm1D39F
	KMd9dvtgTzE8TSPe6yzhopwvWrbAQqUfGyi1IqX80moHJSD7KlWP8kRA9S/QugPN6ZFSiyHJo28
	rzNXHrm58z5ePB6PYTTnej84qtkHCd+m83W69afDUhgaP3IRzOv+lTWCgqhTguMVdcDKPZmpDVz
	EF8aj9aV+34289ptipYY4a/7Xq8EHLuh38B29s2jZAd49zkPKgTFg==
X-Received: by 2002:a05:622a:53c5:b0:530:4deb:9801 with SMTP id d75a77b69052e-530a2e093b6mr129633651cf.49.1788982089079;
        Wed, 09 Sep 2026 12:28:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305418950fsm146682361cf.20.2026.09.09.12.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:28:08 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:28:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, boqun@kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>, stable@vger.kernel.org
Subject: Re: [patch V2 1/8] signal: Prevent exec() race
Message-ID: <d633542b-2a2f-4adb-82c1-ea650466f63a@rowland.harvard.edu>
References: <87ik4h2icz.ffs@fw13>
 <ap8bUiYYwQT1nVg5@pavilion.home>
 <875x0g3de3.ffs@fw13>
 <ap_gOSWtPNjwWS1e@localhost.localdomain>
 <20260909080407.GR4121339@noisy.programming.kicks-ass.net>
 <87ecf223n4.ffs@fw13>
 <20260909095518.GL776954@noisy.programming.kicks-ass.net>
 <aqFNV4k6DcbyxYCe@localhost.localdomain>
 <20260909124555.GM776954@noisy.programming.kicks-ass.net>
 <aqFw--VfXWz-yZt8@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFw--VfXWz-yZt8@localhost.localdomain>

On Wed, Sep 09, 2026 at 04:45:15PM +0200, Frederic Weisbecker wrote:
> I didn't know that UNLOCK+LOCK can pair with smp_load_acquire(). Good to know.

I don't know what that means.  Regardless, LOCK doesn't pair with 
smp_load_acquire().  UNLOCK does, but only to the extent that acts as a 
release.

> But unlock+lock doesn't pair with unlock+lock on different CPU.
> 
> C MP+polocks
> 
> {}
> 
> P0(int *A, int *B, spinlock_t *mylock)
> {
> 	spin_lock(mylock);
> 	WRITE_ONCE(*A, 1);
> 	spin_unlock(mylock);
> 	spin_lock(mylock);
> 	WRITE_ONCE(*B, 1);
> 	spin_unlock(mylock);
> }
> 
> P1(int *A, int *B, spinlock_t *otherlock)
> {
> 	int r0;
> 	int r1;
> 
> 	r0 = READ_ONCE(*B);
> 	spin_lock(otherlock);
> 	r1 = READ_ONCE(*A);
> 	spin_unlock(otherlock);
> }
> 
> exists (1:r0=1 /\ 1:r1=0) (* Bad outcome happens *)

I can't tell what you're trying to do here.  The UNLOCK-LOCK ordering 
in P0 means that P1 sees A=1 before it sees B=1.  But nothing in this 
litmus test forces P1 to execute READ_ONCE(*b) before READ_ONCE(*A).  If 
the reads are executed in the opposite order, you can see how P1 might 
get r0=1 and r1=0.

If P1 had done this instead:

P1(int *A, int *B)
{
	int r0;
	int r1;

	r0 = READ_ONCE(*B);
	smp_rmb();
	r1 = READ_ONCE(*A);
}

then r0=1 and r1=0 would be impossible.

Alan Stern
