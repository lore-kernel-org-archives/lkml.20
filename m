Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8B5518132
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989894; cv=none; b=ZenLaiKrCHUqU/nugpXXMYsnTGUx9twi8GxY1SdWRd4hnf8qmoAsPdYULSory83x+VR2OCcgonotRyYa7eBgRbNKF+BM2+Co4FxFPUOG2mIEUKsH3Ee7cc8RZX9kX2NVQ+5JUoYQ6PPYigkEbBvVCnnCAzSIXs7amueOJz0jWC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989894; c=relaxed/simple;
	bh=favv20QUS4n0s36pVO9/Q4DOlqW+akAGcEKiNfXx8po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2WX/uITee8mFUZ9akZyuTlwXK1BupZvNOEdEJe/pp9H1TZPh6L7cwMwDtEh1n9xJJKM6oigx0M8QRdGPcHrX4gTGLQoUGtPYTcKe232wBq8CyS1ry/yBLRCaKgULoIUdDbF2y0GgGZzDopBM8Hq84IFQATCPfSnibQPA4j2u/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WgrZ5NiE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WgrZ5NiE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-535199ac562so41361481cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791989892; x=1792594692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=end4sOICJSY4jXS2ggbo5B9Zltmh1/qgwCGH+E3RbsM=;
        b=WgrZ5NiEFnvIsZOzhqPsZLvAIKwmV0w6Mo8W0hgb4hHrVvvdZuWAlGX6Q308OI9U7G
         nPLZa3rcmAlBHfT8jcMk4H+qGVoqL5jFPwo+vNe8askOv0nx7mesUxGpSV08Npz5RmyT
         p/qYwSPiUAvs2AHKTs6rCOIoirzpI5YRRiI0BoVPs0+00muOw0mDj2fBL2rQ2SanWb3a
         gn+4lhQMdV3GO6dHtOh2BCtK8p5HxNk9vxnbsSLGbOkFhFT1SLA/H6VF0o7fzt1lc+Hv
         j/QaZVlBeH6GQgywKMiNUW7IELoht9RQZKBK/uL7cNpVbGVeUtITUIUt7XMHR6IV3hcB
         jyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989892; x=1792594692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=end4sOICJSY4jXS2ggbo5B9Zltmh1/qgwCGH+E3RbsM=;
        b=GRaTlGs5UUJHdv7RTE6JYsYvp4xXSIWH00I7CjmCIQKuOSJefAnyiX0LeKwq2h35QG
         /CzVf6wxFsFkTjWhBXCLG4s/ECxahRpdO6flPiBfm/lABIT6Vx3yJoNjTLmOd31oYkLw
         x2m0jQUmDDmPPXh7W3EG4+Y6hLdj3BXFW0u5JWTcGmSI3B4aVtKBlyYuQONYDJSvoUsW
         FQU7sjK7Un+Mzc8SCR5cx5CbD6h+KIdy15hMpCyX9rtvoyXDXXPbbIqncXwyNInqbYFs
         NlNkKOMk17l2HSzWghCg4Nmg1MK27rQE8agC6AGaKU9MIFKkfXh6hwFSUOHbc0RJyUSL
         wEPA==
X-Forwarded-Encrypted: i=1; AKwUvBzM6XMJg+geswSZBxIO/8K+HJ0ThsvHDL6R31zEMP46waW3Jw2QkuJtgQ/kl5hMjoTsnuI6YBUUuTHcjaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfUjYq5p+Csax7UyOOUyUw3+qFkC+hbbF1PycbSs0Xg5BZCzwR
	FP31kdJyUfT3j4RzPg/uxzbpKGe5CHXSmszDyFzD3ucLR4+DvfoDBIYSEhRDqHkfUCqvnFAHvff
	l3NKcLA==
X-Gm-Gg: AYBFou0iG7YmXOsc9jvgOJcETlZ+ZnVVN6lsX5Qjn3Y6ZE2G1ny8peJjQLTvSVEZrvf
	6+NsXRVmhbMSHE+faO0BF8vK57ouPfQFQi0SFLAPB4rXnRPzSs7KWvXhTDp2x6HfiQ43qKlHUF6
	7ublGg8sEgEMkVzXE2f7Qyj2PkE4yPt6nMLslpR1hhwuYDke+7TaDFh3MxDk2vW00Ccd3Jib6qZ
	LIxUe8FFt/EKYVaw68VI+SuVeZJUvE8vIxer5cLsyoc7dgPXignwy5V3GJzU7GSdjBCDVxiZOwt
	QXmedxSFqrbZvcdEl3XBTtmbaZCX77arFLxitRdhOarjS/94E9uZoMGMl7zYSX0LPPIW7ragE53
	eWBHTlwafxGuzp1AZKBlgfylHbu5P3niGOSu8V7VDqTCQAc2Idzqb4705pJoqopVusAcfB/xuHw
	+0VGObZz3ZZWb16zmkDJ4rKO2biR838W2axErwiisLbWgjjO8inB9gQjNP/vdH+gDEl6NfYY8oD
	v4VoASXpny7hzw7GQ==
X-Received: by 2002:a05:622a:8ce:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5359fa73749mr239755861cf.21.1791989891598;
        Wed, 14 Oct 2026 07:58:11 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fbdcasm126177791cf.5.2026.10.14.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:58:11 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:58:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mario Peter <mario.peter@leica-geosystems.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] driver core: fix parent lock use-after-free on
 USB disconnect
Message-ID: <90cff929-d12b-4bfa-9b30-19319376289f@rowland.harvard.edu>
References: <20261014133109.1392265-1-johan@kernel.org>
 <20261014133109.1392265-2-johan@kernel.org>
 <DM4N7SKUMF98.32GW04E2EVM8I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4N7SKUMF98.32GW04E2EVM8I@kernel.org>

On Wed, Oct 14, 2026 at 04:49:31PM +0200, Danilo Krummrich wrote:
> On Wed Oct 14, 2026 at 3:31 PM CEST, Johan Hovold wrote:
> > + * @need_parent_lock:	When probing or removing a device of this type,
> > + *			driver core should lock the device's parent. Note that
> > + *			the device must hold a reference to its parent.
> 
> For the reasons described in [1], I object to making subsystems responsible for
> the parent reference needed by driver core's delayed accesses.  The driver core
> should acquire and release that reference internally.
> 
> [1] https://lore.kernel.org/driver-core/DM4N25JXKTQM.3K7TP9HM68KQ2@kernel.org/
When is the appropriate time to take the reference?  Since it is going 
to be dropped when the child device is released, the logical time to 
take it is when the child device is initialized.  But at that time, the 
caller may not have set the bus_type or device_type.

Taking the reference when the child is added would work.  But then how 
would the release routine know whether or not to drop the reference?  
Add an extra flag bit to keep track of this?

Alan Stern
