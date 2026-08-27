Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E18455184
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846468; cv=none; b=JdMBIQvcuOe2KvlxZvtumRuL5QUChUk7GJ7/2+KlUb0Zi+1sheJpFKylG1SZyGHz20ycV5LjnwnwWl3KjQZxcHL/TmbCNvhvFVPp9Y3lPg8aZH5WBmmc+WjYDjUDQxI++APLT7zludzK0JQhQILevi+jjYs8coTlvWDGnpBQs0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846468; c=relaxed/simple;
	bh=wf94Tgtp+mIa1Q5XRbJfuuqfksgiLCtqb8r2gfCY2rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNbxiqEpybqZfddMdTe9/Kp0ZhPPS74BCBMYRDQB3gDNu3kg9OzjqTpPiIH55WDAjnkwmMnatQ55wFXZATygV8FC1Fsr5ay3mtSPinPGqPScM1lpeiGu75icEtBT+JGT+l+5iiRGAo5lCT/h2uuoQohJS/prrIhWp6yMb3GjLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Cj85lULj; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Cj85lULj"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66ce5312ca6so212605d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787846466; x=1788451266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNepDFInVPeIQZp56PM2k6duwIn9bQ+gjDRMqyyZVgU=;
        b=Cj85lULjueIzeaN6Ftf3iWcUfY5N7nL5wUmCJ17eFOC72XuObwI0unKIjPg36IB5Ri
         RZ0ShYgr1rTPGid7BgZ/TZ4H4MPz10n8tXH6HAcB4HLMpW4rivXIwiIXyL3mvrRK9SZP
         zUuyol+gnkPfDl9UMwJuLcuLM8lSDV11wuWeELvPQ59FNk+6CHXwtQ9Kn1m7AG/FNsPP
         jiNfAMrIfQcRXaGOVro0ZgesyseSCSXesCsrwz8rOQXiQg0i2CMjz1t9Azc66XK2fNyV
         /0slHENlBbp7QlY1m3SjaYvshEMthqvqtDMhCsounolT0leswKTiTfM7bE/4U9uv/ceQ
         m5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846466; x=1788451266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNepDFInVPeIQZp56PM2k6duwIn9bQ+gjDRMqyyZVgU=;
        b=gUm5A1h5zoNgin6ACYnMxHiq5u8/v3CyIXzk93vQYnx7GHxE9GWEwS2fKkYJE8g+sS
         JPRxEDoXyc6XnQZ9QtuuD0xW2li+vkHYiRn8qxtIBck8SZHysNq7VaVAyTjTd/HNn+AD
         poJEam6CMwCEp5TO9DXPblv+pAddgEBzwo+6jtJFeciLLgkzqMG02pqXV3awdjPK3uDO
         b/LFXI6qWySYWiNpd5R01/Sy0DJEMWMUJ7pLIQEWzD/mPI8ZhXOPeTcgHGuif/01J90k
         gqqm19oA1ZtdnIJxex/k6E4QY6Y+s+peCKIPUyc+VB7EsYwvkO3jP65GCNQL7n9ZjIhr
         PaEA==
X-Forwarded-Encrypted: i=1; AHgh+Rr++Je66H/l12k5T52WPBDOkg9a2Dr2MQMe9omakgToGBwYhAGF3u+E2bU2Y0QnGu2gpOQ3pYH0XQ3p7II=@vger.kernel.org
X-Gm-Message-State: AFuF++n84lr7Zw/t8v958Xp5vSRvpsuauQew9SVan6WiBTBiVCckqavZ
	Alu41w+4vI1NmbIWHGdmNVpSsY5PTqY45tYuT0N9jQZB9oSCZgAaFSwlLjISWw0D3A==
X-Gm-Gg: AR+sD12fg9rBEbzEN0KP+hR83yy1djPWkiRFqRNriYb6GgHf7UIXhCH10r50Ngd532c
	QDr/VS6Lz6ORrwh9xBebnGy/1K014RSTV5BfXzBNB2Es50UfLlNvzoqVrEJWCydx/2X076skToy
	M7iPLDE5qe6gAVnMsqknBakPIo8ldoIy9EhcQJFkmc23QenJ6TFdDcQSYzByCyEgLqArjZJHdyU
	R2fXagOv2QCz6bfLht+f8WWtvCYZs/v2HesMJiRbuMxPh0wVNzoy6iuFHd2buIQpgH8wD1v7/0P
	GeReuSkuZU9d4j699qx1+1UefPQOWzeIfwn9u92+57KliyNyYrI3yciHBK0+W2E76f4RlnNl+wF
	xS6j8iMJmHTLPEQm/WH3xMTqNa4Rr4RzQMpv2aZ02ZQqrc/r0CabOE1zwbOaBLdOfTWi1CiH7e0
	xVNrJKfY4mLa+NnV+SLNuLs3CtrmeeAxC3sLEwbl+80P72zxEU/JrG90B4gBgnkyNqhCpdQZog1
	VEu72yglhN5yQu4JjvG5yEBVCpr/gfI
X-Received: by 2002:a05:690e:d4c:b0:66d:11b0:addd with SMTP id 956f58d0204a3-66d257d1a54mr6143501d50.37.1787846466030;
        Thu, 27 Aug 2026 09:01:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd73fc2c9sm19596796d6.35.2026.08.27.09.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:01:05 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:01:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Oliver Neukum <oneukum@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petko Manolov <petkan@nucleusys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 net-next 5/6] net: usb: pegasus: Move long delayed
 work on system_dfl_long_wq
Message-ID: <31b46916-dd89-4ae9-89b9-9d39e29e8e69@rowland.harvard.edu>
References: <20260720100902.155605-1-marco.crivellari@suse.com>
 <20260720100902.155605-6-marco.crivellari@suse.com>
 <f972b514-87ef-45bc-8258-db199a4cc0b8@suse.com>
 <20260825151812.4aJyFUgE@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825151812.4aJyFUgE@linutronix.de>

On Tue, Aug 25, 2026 at 05:18:12PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-07-22 10:29:50 [+0200], Oliver Neukum wrote:
> > On 20.07.26 12:08, Marco Crivellari wrote:
> > Hi,
> Hi Oliver,
> 
> > > Since the workqueue work doesn't rely on per-cpu variables, there is no
> > > obvious reason that justify the use of a per-cpu workqueue. So change
> > > system_long_wq with system_dfl_long_wq so that the work may benefit from
> > > scheduler task placement.
> > 
> > these changes are problematic, although they look like a good cleanup
> > in first place. But the test you are using to determine whether USB
> > devices need their own work queue is incomplete because you are not
> > considering the reason they allocate their own work queues.
> 
> This driver does not using its own workqueue.
> 
> > These drivers have their own work queues because they are part of the block layer.
> > USB devices can share a device with a block device (storage & UAS) and
> > USB devices have common, per device operations, in particular reset
> > and runtime power management and disconnect handling. Because these operations
> > can be necessary to complete block IO neither they nor anything
> > they depend on can use IO to allocate memory. That is they need to
> > perform any memory allocation with GFP_NOIO or GFP_ATOMIC.
> 
> This is a networking driver. It has nothing to do with storage and UAS.
> It uses USB, yes.

Ah, but a composite USB device can have both a networking interface and 
a mass-storage interface.

Suppose you have such a device, and suppose the disk attached to its 
mass-storage interface contains a swap partition.  Now suppose the 
device is being reset, and as part of the preparation for that reset the 
networking driver needs to flush its workqueue.  This means waiting 
until the work routines that are already running have completed.

Since it's a general-purpose workqueue, you don't know what those work 
routines are going to do.  One of them might try to allocate memory 
using GFP_KERNEL.  Suppose that in order to satisfy the memory request, 
the kernel decides it needs to write some pages to the swap partition on 
the USB mass-storage interface.  But the mass-storage driver is stuck; 
it can't do anything until the device reset finishes.  Deadlock.

That's why USB drivers have to use their own workqueues.

Alan Stern
