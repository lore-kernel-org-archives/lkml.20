Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373081;
	b=tbi/JuufxhELmmlWtRMEKtPJYAGAVN353beqOgrwrss3nSK3bbklLrezTue0G0HJKjA6
	 w8XMYgWk8yczA1w7QE4rxOZhDLx6CDuwmwk9RY4h1W24L5p754/uL3oAOzBrLkfKwk/Hg
	 CoS4lfqF55OM1dor1BDS/NfXSOZmsKnRWHcx/VOuKZ1ywTefJ6kZHcep9K9Jx4lLf0Xg8
	 8mznuNEjMMf4jt7r0cNgvDfccxs/6D0/j7U8K72jE8lXSrXjS3vWhw1kyCsMMEziV+DWl
	 vVqSg84tgaB1thOFJqL4+o/8x55v0+7trEGr/emzCXKNCnC+skYHod5AP38ebgsE4Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SknYW3+pVsCwOENllYU3jowrrCPEotGjBjq9wVk1tW0=;
	b=OqeAdDg+jwvDFay9y14A6hBZFrz9nkG7isuP5twvbC+qTwIZTuZe1ghx/lC2ju0oCecg
	 68TXJMFV/yLNvJAHZSxqlSSKvlcbAZtHbQ8j4xywAM/gV+cyzE/UFAFbXnS8lcP1t7a2Z
	 kZ3eSaisP7sMw3w3B6MUg4+raqGjuAhRXfVt7qpNC+PmrUP0TsR8flWjb2CWHP580WMVX
	 CBoAQds0vqAjGQDr3QD/ntkhwcClOOSnOnCZXlCcYCnRDvZ+EDCz252yy28D1OJAQHBxf
	 Y9a3MUyNO0Qa3oQQqh3yqDD9D/ogPU3NTcfRJnqU/ARAyuXLeWDXi1GcrmS+tLowa6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VAnxgq+X;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E58606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E58606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VAnxgq+X
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c19fc50abso10720286d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793373079; x=1793977879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SknYW3+pVsCwOENllYU3jowrrCPEotGjBjq9wVk1tW0=;
        b=VAnxgq+X4QCFTDu9AfTIw48AdlrmXvNeSuIaONQhqFkWoVPXZBz84mze+bQQdrgAhR
         Yb1qIjdcTWGrZL1vyxFrdGovjWe0C1rwpn88C7tgXg3BW1x/vT+4lppONNZ8N5T4dIZF
         A86w3AiVzzJlHYHoWjb+ZBekF/EkxgqB5kFZzSlRgpVyxvegFwpmbFlwECZi5LehdbEw
         fPlvuM+bv9BCs3E+qbixvAbLVr2hTUtX7fpfDGGuE5hdiG5M5JPOPvHVD91ix6/f0At2
         dnlRKLnPnupUvjaDpJdUG/mHdwTGSxDI+PfrEZRHaKDbgB1fY52C8lRrarj8WAIdi77C
         HTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373079; x=1793977879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SknYW3+pVsCwOENllYU3jowrrCPEotGjBjq9wVk1tW0=;
        b=wEsYWiq69fh+NshU8+Wz+4/nff6qOwmqspkwEXYGtEjSEl8mJVleZRdQAD6q6W2J9r
         NqJd6898hru9MxH1+VkM4NGQIa1qrA0ujc8ZI4H+7VzFHV+Rq78la2VIX5BhqEEMBE6k
         Jzx539UXfGvddWfzFw6dYs1RCnzM2CvzOUKQCy0U1c1cKU82id7IzdATLFHE3sfL2eay
         4hTaHBFzjQZWDlmAAp1djxzgqNbkayaXWtl7RClBHftnduR7jHH0u/DGC9yWuXtpj6Do
         cDKyhTdL4M3J9Y93+NxEMcvPm5m/+Ztf0npLznXq+ows5FCYNy7o1DU+Aq4GvwHHEN6q
         JTXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrqp1wsMhHI+KdHuskDuLnv/g/BSKXmooxBA4GrxP5h5OwUT/inflpIdUGjUoWXabXDTrOh5EQhYIo/1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhlVCLrQixUr7/UTkXlTBLrbzzj72vU0f9RyV6NZlvA/vSoQL+
	YszuzW90KI/Ovwqqbm5hHJ24Y2TLWBzRzJcqMlVvY8ua7mXNmP47Ytxq1f46EIg4TBM=
X-Gm-Gg: AYBFou2xbmFeR6Z6NWcH7Ttd/7PcqqvrzXn1fcafOVqH0BjBJIkUjBv/hhJdpEOp2m7
	oq7zy7zqWAmcXMSdKBdUtmNlv+XwSi8ZtX138MTH24+h4ScboG62vCnDYTsngr94d389ZshJ0ij
	i9v4oUq+NF40VAVrUPf3h27eAfn334eZzQlY91fcp8cgO1a0nco/K/L1lRXmxQ+fSgv7dPSl56S
	Fldoa8tw/k7IbM7dlsiNCLznDXZIXc8yP59/a9l6CSoTFT2O3hfsH/u+YVQ4J2M7WxUdsz5djuM
	MtzNat53n7EoZQaoOrAbsj5ww0bf7CwXndA/uBS3e16AU4FDn7SFRUrf5tnKBUubXlzdMsDwCJm
	xHB9DY9ftE3oSEJjchQn+gMwOpl2jBNbvANpqGq9cD35zemth0ktgeeb4Hr8OWchA6wTUoK/KW0
	+k5MdF8sFnYpVJFNpNv9zIE/PxmfOGHWWsfo4RZSqAPe3fluW6n2bZexKPQ9PbZCv0oGBTdaz9Y
	DjnmFVxA0jUCXY5n42d/q3+PSK+u+lUEa5Z6q+t/PbuAF1kFFUM162BXVMyXf/pPiaj9dHrsLuX
	8TFr3VlR2VSaZ5s25jvUpMcPch0VWFr1iAe5DTVn5kahSoBDDPD/wuMUPe3Uk3QeEbcPAEiqb4N
	NgFcOl+gRE/c=
X-Received: by 2002:a05:6214:29ec:b0:91c:5fc4:ec2f with SMTP id 6a1803df08f44-91ca4b0dc32mr40691666d6.26.1793373079235;
        Fri, 30 Oct 2026 08:11:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807047bsm17117606d6.39.2026.10.30.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:11:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMoGB-00000000v1Y-0kVg;
	Fri, 30 Oct 2026 12:11:15 -0300
Date: Fri, 30 Oct 2026 12:11:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>,
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <20261030151115.GD3889730@ziepe.ca>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
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
In-Reply-To: <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>

On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:

> >> I don't see a reason to make userspace (that should not shoot itself into the
> >> foot) a kernel feature it must activate itself to not shoot itself into the foot.
> > 
> > The issue is live update doesn't preserve those background punched
> > folios and now we have created an UAF attack on the kernel across
> > kexec if you don't do something about it.
> > 
> > There was some notion here that with the right sealing flags we could
> > tell if everything was 'live update compatible' and then know that
> > these attacks are impossible.
> Just remember that there was any hole punch and refuse to live update this instance.
> 
> We could likely implement "we saw hole punch on a pinned folio" as well, but I
> don't think that's required initially.
> 
> No need for more shaky seals.

Ah, yeah that might work out. It has to be checked really late though,
after userspace cannot change the memfd any further.

Jason
