Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607641;
	b=KcdJFvICt7ibVv05ru1HaebsJ91s2qC65p1klPNUNRo5cX53DUN4SoFMa7yaXraqw4+B
	 UtfPvvikCiTP+U7aXjfy8W237h8c/T3Ibjj/VfIBDsPiHpX3zNXsr0YfmE0yUPCcExsXQ
	 rq5yC1ieo+mAepctHevkKdNP5mb1h8x/hf5pGVcYq+NG7HVyO4Bzw13wff5RSsZXXWFx8
	 99RbVo+1BCh0odPtpgor9gBPCRv7L6LA5CrZhFqAqQb/h0dZNQpgdwTSuZ7i7fy/Nt2d4
	 c9/dr1RzDw0+GA/FbpQ/kc6CZxXWff88fTyteizNaVekznEJzLl03PZPVHXbXEDmYfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=plcuA3qVi85xQIO4mh6Ev7EJr32wMKiIckXkpumk08A=;
	b=AjRmUaQgsYwBVV6ryNv8M99HwTdM/0EhRBM751dDdb+F98XNhZc9LM7KxhdyAHnUU1sM
	 EJjbLq4y4DkNrx8PuLOPKHR2UZ8WPlfCInkcmj/PLIFRk1iiWL3H9Fqgbw2xG+19X365+
	 zpTxJRJTmLMiXumY7/hpxT3kBC4gEwVSQaBCIc0wovtOBSYgYKavES+3Rgae6sPYtsol5
	 iH2sRr56/XDK+KcOOof9sibwxVwU402zSZRlfL5/znkooTN/G6HPZ1SGpLBD+R5x354VI
	 q0icQpJArZvB6IibSt+3Bzfw64PYAuOx8FFvv1v0yzGY8tYkcw2u1mVsIuMCeC0tfjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eMrbmVqM;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A4D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eMrbmVqM
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so1343490c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792607640; x=1793212440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plcuA3qVi85xQIO4mh6Ev7EJr32wMKiIckXkpumk08A=;
        b=eMrbmVqM8ZS8wzT5W9ACvqQjHYOzMXM9IMg2lsFlHRwgIofYT/XSzju48JriaWgDSI
         Onq8AHkkeuslDuEsJa9erTsSMxBXyqnJjSGgukb9gP/W2LFviugbwyrAul/19c9J+CZx
         /OJh1d/tKIeAvJWtuTOdjeQ+NkWpNO/dWpwVn/X25Qb5cDBngSDEJXWq7c0y8eFlnrRH
         I+UwfvtvsPJdcTugpzjCuJ/jwdqiD9dFxTCVEj14s5Wa9HlH1u6RwdjP1mJ+s3rpT4eY
         8MRJZP9HFhtT+Huy1RqzJqFS2LQ94AN4AEF5m9LBNRZj38YOsv1xyyW4szGgf3ofqmQu
         mZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607640; x=1793212440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plcuA3qVi85xQIO4mh6Ev7EJr32wMKiIckXkpumk08A=;
        b=f/mLiPgetO2gOGetX2lFKf6HE2Dw1Tv5MlHD8wYgKLqzeFnwAcTjWmWGUij4YMWXUE
         70OlYzy+TTOJwXP93eLxcoNtEy/O0VAYM5jVF8ZqnGt7WmftG62P9hMNgnsTtL/AE/nw
         Ldip8xhS9qi9VWq58PRCyyUxZFr/qwh7agJLtn7yCR/93QOcQaTpKV2i7SJLacm10L5v
         MrfbdFfHFW6CSn6tXCdsw2d4dw8geKelVFN9IyTE78W7iZK5HHA3qGILfoLfwyQedRdq
         rVkFYzAzKTbuE6vmwVeTfBM9k0ySI0IcfPPwfPihwXxKBUBXOuko9IBDF6JdNTzCeet1
         UZwA==
X-Forwarded-Encrypted: i=1; AKwUvBzZWytlHjF1t6wjyK8iLoBrCa3NSj/Xhw3Bsd2qPTig+ZsmWw6S0akQQl4wl6Lo+Iq7/pBMK07myDj5R5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn+KCw40Eyh+OZ953zM9fS9aWjwla6KrYSt2neELlTUnqVcuF1
	DuCsSqRGIxWp/eN6WtPisBLDcpuLXA3/3w0n8Im9aLYQqP9CapwddoKElZmepIUbzKw=
X-Gm-Gg: AYBFou0xutqVeCJuxzVfs/ZbzFHskHNRKus+6CzVxq7KJsMa5Cj/EfmjYn8TkvLb2BO
	5E+TS/1zLfhho7jtvLWEc+Q5iBLQYwQHDa2GI2RqwZoAmLMDt03KMD2lowqGz03FBh6Fyf/BrfV
	2ThQEHhHkWiDWM6x5nSQHMHHljOtHBWF0eC/0/gwey3MepDivOpgdrrrqmeVd6L7U6SodhHJOyc
	XGLbe/MQYYuw55DufrXSgTMApTqXKm5zKSxuBHFj0dlaLWi1ZqynTyhUa0fTUEIBOzOmfJkFiQf
	dBlbZu8IP4Ah0D9ETQK4B6h3itXmrGG+8O0TWH0HtrxL+t85itMhFfGEfDC8kgwwv5CBcEBXw1F
	kJY4ax4P/wQNUYbjRJAP5bQJ2uruac+8ZsD8S4l8WEoHafBRSfs19N4sLt/3QgD0qP95DOYqG5A
	6LAL8uJkcOom4yDaxAkN/NB8yQi3ciZuuaaL8e2q0r6oQhW1V3y212tBpsvTOzuVAcmJvgYIuRt
	MgdSbhEhGce1EJka+EeDYPbxEeWm1VwWnLpCVeN2wwCm+lofQKVpDuuoLcTm9QjFcuY8NR6FhXN
X-Received: by 2002:a05:701b:2059:20b0:144:fb31:a597 with SMTP id a92af1059eb24-190a738126dmr3541263c88.47.1792607639443;
        Wed, 21 Oct 2026 11:33:59 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1903aff3481sm8406817c88.10.2026.10.21.11.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:33:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:33:57 -0700
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
Subject: Re: [PATCH v6 07/18] nvme: Introduce FENCING and FENCED controller
 states
Message-ID: <20261021183357.GX2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
 <20261019212630.GN2931-mkhalfella@purestorage.com>
 <7e73057c-698a-4ce6-b153-3b8b1077f77c@flourine.local>
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
In-Reply-To: <7e73057c-698a-4ce6-b153-3b8b1077f77c@flourine.local>

On Tue 2026-10-20 15:10:11 +0200, Daniel Wagner wrote:
> On Mon, Oct 19, 2026 at 02:26:30PM -0700, Mohamed Khalfella wrote:
> >  Description:
> >  		Shows the current state of the controller. Possible values:
> > -		"new", "live", "resetting", "connecting", "deleting",
> > -		"deleting (no IO)", "dead".
> > +		"new", "live", "fencing", "fenced", "resetting", "connecting",
> > +		"deleting", "deleting (no IO)", "dead".
> > 
> >  What:		/sys/class/nvme/nvmeX/numa_node
> >  Date:		November 2018
> > 
> > 
> > How about a diff like the one above? Similar to CIRN and CIU, I am not
> > sure what to put in "KernelVersion".
> 
> I think the KernelVersion is when it first appeared. I would leave it as
> it is and instead extend the description
> 
>   		Shows the current state of the controller. Possible values:
>  		"new", "live", "resetting", "connecting", "deleting",
>  		"deleting (no IO)", "dead".
>         v7.5 introduced additionally:
>         "fencing", "fenced"
> 
> Obviously, this is not idea. If someone starts to complain we might have
> to filter out these two new states.

Is Documentation/ABI/stable/sysfs-nvme a living history of sysfs-nvme
documentation or a documentation for the specific kernel release?
