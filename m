Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389355;
	b=nwyJPFz+/hfgKp4yZj0AkrVy0emf3Ild56VtIJFKmCBFQSGKwhJOKcWcIELnHuU9nhgU
	 OH1hSIS5P0RtnjqRYB4kTZ/lAADrgbQWZcNaU0S/sakhVtbNC21X7pToumKHaota5YJbM
	 9ekcU8AtGP/Z9Q0QZIcJJLdz9lfB8PtxBf6MaVq168wiZQRQ3wEnxrTfE6ZbCnd6hBUhU
	 VpupO0cTXdtpX5OPfzGSJv1t9TSkV8TtLWly+kIRcV+myT1XISCyTvcnhMUIpG0UQrkDV
	 jDYYDxjNakaLbQ12vyfhoTP14CMbkMG/Cu9rLsED88L3uYsAL7GpLIpwMn/+i/j/doA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RuhD0zPFUxb19Y1B4pQUQNr0PVSFn6leg17qgS+Gj0E=;
	b=YcuCVSMyoHdOzFP0EXStUkWg7WU95Pu2d17BThOKyHpXj8IF17WaOjniq2KI411i6ev+
	 DY4yAZ9lQhjPfWGX20k37MfXn9vfrnf2aFhhX4pb4GVyNcPt+2f74F40Tr1FYWlaaG9Eu
	 ZGrjZ3fyqn9XBXyFBHie9mX16O4WgCtJJiXxWwE7Bt0wu2w8lU8nsw7052eMztmwQx5Eb
	 /yEhAE/zAzUA8dI+46G52n1VchT+9tazpUIAsWTaOO3yJXSzMaGqamvoVeliCB0dH9OqE
	 L4uaH256CzO46hbjIwm7VBfTN3HEuQDJ9MmXEcg/GbQquMDsln3SpO/RQqQ5ZrlbBzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DEBvE53l;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7B7606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F7B7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DEBvE53l
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1636380eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793389354; x=1793994154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuhD0zPFUxb19Y1B4pQUQNr0PVSFn6leg17qgS+Gj0E=;
        b=DEBvE53lZN3bE8JXXEl/8MAcF9uLI7A2MYbfv0Yf2a9I5+oWk5ltALHv9wZ4ZIRXQb
         4SqpZ2a8CYz8GGcB9AZ+wlCK8V9wczjrimysEpOGlQUj2bZIM+zlyIh8GMe/MyvewQW1
         VgSKRsaveFamrOB67qeq2kEowWq/Cib4vOKMxdB0VgDyAkZeJ/dmpYZA1XvtHLoRyIz4
         wrd/11run7xzEF3oPaBjJZ9P0Y56fA3qeZSg5qUq+fRUzK/JKXVOhqK+5VDpPGLnT5ni
         J2i51wu1ZL8YVhRc/grfhV7pQBiZk1Vu0VTDhDmyL/oJhOknV+iyIOyX+y25LxMPmc6N
         dvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389354; x=1793994154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuhD0zPFUxb19Y1B4pQUQNr0PVSFn6leg17qgS+Gj0E=;
        b=MjX9LX1q5A6/IHZApA2vBX4b/fTxMH42j2jLjPx6cyCJag0DUBsUhNZAdRet7ssFZC
         ESEYcJFKMXNjPmVmdGF4eNWx0i97FEN/yjKTIDVeIxDMHlFvozvl+QFPVnphP72pjYrG
         7aAgZ03S269X133J8TuvI36Tg4E02ez1Z2q7BDZS9y7qB90wihnywB0bjkSIv5THLHJC
         L+n8EKQ/k8dFKNqAkoabSj5mMLQ6n40GJ42t/zor7GYtoeomVEJXnaq7w7fLZPVM7h79
         jcGvVy6BCdD9moU7In0SYnBktXQkaE/fzYbQ28GfePeTBBMpELBIn6KAVXzYZ7YfA0ie
         0z/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKAmUQmkbVPTU02BwM7FT/TInRBagrlSMfhpNV295n/E1Py+BJPHBoTIPvDrrSi+B4pn+1tOh+xOgFRLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhggE3zz6nzWPz6xtnt56BA+XWEPT6r8JoBF7fBZXZ0DsUytnA
	A+PX6y9IPluXYfShOhamyiHbwHUPc7hCPLYKErr/6muoqQ7n+fqFSzL6GUh9a0942ns=
X-Gm-Gg: AYBFou3azdqqJmLKp9QdJ20MKndqhRQI60vvlPpudZSW1HQcpsp0rgFZ9hnH6gd19Ej
	9Ade/3dpZD9+0Ih6AEtHYXNLT8J5mrKBd8Qrhi1Hj6ToxFQVhtM2wgnYhwixoyIYUAt6jjUhpVR
	sxjmufYh8gp39BgMI/9KGxPGlvyaZa/HJ4H7H32FpJVDbu+3/VDTT5iXMAPqmFo9v0hixd0/KEV
	C0wVGPaYelBjzY62DNmsQBU53+e1P++NUPFUCYjBbr8aJFNxvBfXgwQcExw9YFzOtkk2Z6dhDTU
	/53wSQe785L9j9mymZzFqgD49odvTsivfi9vzgkzq/0qaSnjGcs0NBAEvmkyOGLHEMrNgdK66Is
	QKjVh4ZOVRgfFwt+ozDC2iMzFkFm8MlUrKZL5AbIGhnppZfzOWLD1aNnztyriQ7BG82p8mYPzFn
	z43cVkXWWUJPtfFIIQ7agtv9+qKKPhRb+vQwrEXhNyVFFjpZQy5XM+5pcMHO1feWHb8/T6eDxvi
	byImkSfEeks9e+KRG1Jk2jtciO07bV/ORTeiQ+c5rrHoIDuvDaNAzLhmTIXn7zv3zjK6Rcqu4Ps
	MxSI++2Hx/R64aRstP2Y/3p3bqHQwoGlzsigL1acLabZAeWpzg==
X-Received: by 2002:a05:7301:e112:b0:369:a113:7578 with SMTP id 5a478bee46e88-36a42217af0mr4015746eec.1.1793389353243;
        Fri, 30 Oct 2026 12:42:33 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm9307441eec.19.2026.10.30.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:42:31 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:42:29 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 06/18] nvme: Rapid Path Failure Recovery read
 controller identify fields
Message-ID: <20261030194229.GD122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-7-mkhalfella@purestorage.com>
 <179242896496.3619480.12975259904515722687.b4-review@b4>
 <20261019211849.GM2931-mkhalfella@purestorage.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019211849.GM2931-mkhalfella@purestorage.com>

On Mon 2026-10-19 14:18:53 -0700, Mohamed Khalfella wrote:
> On Mon 2026-10-19 18:56:04 +0200, Daniel Wagner wrote:
> > > TP8028 Rapid Path Failure added new fields to controller identify
> > > response. Read CIU (Controller Instance Uniquifier), CIRN (Controller
> > > Instance Random Number), and CCRL (Cross-Controller Reset Limit) from
> > > controller identify response. Expose CIU and CIRN as sysfs attributes
> > > so the values can be used directly by user if needed.
> > 
> > What's the use case for it? This is an public/stable interface,
> > it needs a justification and documentation
> 
> CIU and CIRN identify an instance of an NVMe controller. For a given
> CNTLID different values of CIU and CIRN identify different controller
> instances of the same controller. The justification is that the values
> allow the user to identify a specific controller instance.
> 
> host# grep . /sys/class/nvme/nvme0/{cntlid,cirn,ciu}
> /sys/class/nvme/nvme0/cntlid:1
> /sys/class/nvme/nvme0/cirn:42541d24813bb536
> /sys/class/nvme/nvme0/ciu:57
> host# nvme admin-passthru \
>   --opcode 0x38 \
>   --cdw10=$(( 0x1 | 0x57<<16 )) \
>   --cdw12=$(( 0x42541d24813bb536 & 0xffffffff )) \
>   --cdw13=$(( ( 0x42541d24813bb536 >> 32 ) & 0xffffffff )) \
>   /dev/nvme1
> Admin Command Vendor Specific is Success and result: 0x00000000
> host#
> 
> One usecase is to use the values to issue CCR command manually. Not that
> I imagine one would want to do that, but if they want to do it they need
> this information. CIU is also present in CCR log page. Someone reading
> the log page might want to correlate a log page entry with a specific
> controller, so they need the information to be exported somehow.
> 
> diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
> index a2f5d0710db4..ebc3634c1a96 100644
> --- a/Documentation/ABI/stable/sysfs-nvme
> +++ b/Documentation/ABI/stable/sysfs-nvme
> @@ -9,6 +9,17 @@ Description:
>  		of the NVMe controller, as reported in the Identify
>  		Controller data structure.
>  
> +What:		/sys/class/nvme/nvmeX/cirn
> +What:		/sys/class/nvme/nvmeX/ciu
> +Date:		October 2026
> +KernelVersion:	7.5
> +Contact:	Mohamed Khalfella <mkhalfella@purestorage.com>
> +Description:
> +		Shows CIRN (Controller Instance Random Number) and CIU
> +		(Controller Instance Uniquifier) of the current instance
> +		of the NVMe controller as reported by Identify Controller
> +		data structure.
> +
>  What:		/sys/class/nvme/nvmeX/cntlid
>  Date:		February 2016
>  KernelVersion:	4.6
> 
> How about a diff like the one above for a documentation? I can add
> something similar to the one above assuming the change will be merged in
> 7.5. Or I can add it later on? Maybe in an -rc after the change is
> merged?
> 
> What do you think?

Added the diff above to the patch. Let me know if you want me to modify
it.

> 
> > 
> > > Also add the nvme_fence_timeout_ms() helper that derives a fencing
> > > timeout from the controller keep-alive timeout (kato).
> > 
> > There is no user in this patch, introduce it when you use it.
> 
> Moved the hunk to patch "nvme: Implement cross-controller reset recovery"
> where the function is actually used.
> 
> > 
> > -- 
> > Daniel Wagner <wagi@kernel.org>
