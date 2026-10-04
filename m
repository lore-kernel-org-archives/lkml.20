Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0013957E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791126549; cv=none; b=VJEiKc4aNr31QExfW0/y9wqzAnOBN4MQT5Aknhbv3deMRMi9YvA9xvb9fxDxiN9h58Y+BvRUVad94l5vcgDKEaqvN4YwK0RPRKEXC8CERqRpuRRgt7UsgfC7c87Dg85N1rgwg66yoAsOhyNRyDrOoI81i5pmrmpNwB0CMKKh3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791126549; c=relaxed/simple;
	bh=5P7vT3iSbLKV6feOMsggt3x9Pb5isvTm/Ost7rVA3eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMZph3NzJmkZ5UksrFj+J9AGywCO+OpBMXZAlDaaH8Hhm5tljaHcxL6VOZ/UyhZCx5BnBCJSCL3tldW152h0MFMGz+oh7cBLQqUljPHVtpLiuO09iNtPZbBTaFxKQ9BnrDUbsCCQ3ZuZwxoeitKEWX6qp8qRQTAJyr/siYFFJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=LpoIUQLT; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="LpoIUQLT"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 37A6F3F290
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791126544;
	bh=gjPynkeSS8mj+Hdi4I2aqG3Yn3kZVr1yRJIIH48r5Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=LpoIUQLTpJa75xfXo1Yy4Ab2Q0bqyQRbms1ghZXdeOXBnPr8i1Qu5CRVM+2//H8Zq
	 wIQhbJdr9ZBbDsE+ysoYGzIgE84pQJouWZH1OUtJbBsbtkiZNWv2y4yiQ0VzA8WMc4
	 H8eHMKxeiwwhKuD+fCVFDNqjK3JWxSw3NHB38J4Fsoiko8DnefUjJUEoLd+VGLWl2J
	 GSqIOixwO1L3PwXohEo3UjAMSIFbQ9r3ZjRcx2V9etfNe1i34Q8FwqYDJ2VNOiQpOF
	 pY6v1A0kiPwCd+UWcFcsSpNukpR5FB/WjGHQXfj3ltQHZDpScgtymlb42SyVjq0fxu
	 KB82o/Yz0hFQIEobb0bMiCGjHTcfiUeNfpq61uuSq8LMf33MwzUBhnLFYbFa8RUHYb
	 6B+utuby+DeRxwp2Dh8ZSrSjAc+Fg87feH1fKyIvc3FuVYCYOQC0a4uVpleKI4b1qw
	 wpRxsryILsERTFqxON+9PmVEYcfby+naORmNENZPD8vY9P3+7M3vQ+A6feA6y9BgUJ
	 TpRqMgQjkUX86agA7Cp3rzhYPVatl0fN/wh5LViLllONNFymTOVucjI1ySp26veoZE
	 WOcig20t2D+tOjIVnu364lt6XGTr/4h6TIafRPj9h6ndQzDLlHeME9KlzZPFzOErf3
	 WdqoH0Wqdaan0Y2+ogDR3Iqs=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a171b68dfeso1304315e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791126543; x=1791731343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjPynkeSS8mj+Hdi4I2aqG3Yn3kZVr1yRJIIH48r5Y8=;
        b=WffHdxknj82fKj+zUJ73rUUF7W7oh1aAAf4YNRC0wcn8C5dT5x3m4b17jaQhekrpM2
         okZPe5a7tTggbEznOjoGmivCz4iyCS6PPYeNJJR4egUkvK3OsgT7FZjwgpYUiCg71BXi
         jqfiWogTqpQzTn6TGtj3EPdSb0R7Epw2KdCLROWDyki08yIKiMenVN3siY7pVf07flxA
         pySL+d2ZrjfrXP/LOCocMWYo4lrbJ3NG2CEVE9sx5Sy93/EAcQhf8HzrQ5v/2IFpsBN4
         VHq15blgedHex/F8aThxrsVK+nOtER4wuYSNEQgVUZUzbAlFkfqbiXbhNlIu7a6+7W3G
         m+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7l0qqscKk5LDDYRx49i77QK6/jgZslVP6SdB1RNkPeTEY28giN2E3kT75iBpi9udCgFE5qmNiUTpH9GY=@vger.kernel.org
X-Gm-Message-State: AFuF++nANiq16jM9tR/3bF8TE7N3s+PrIQU25oWTvXGiV7XLB5KYopVi
	YX+Md4J2CqSKhuY2stYxPk8p1PLgJIyD3AH8F9tdcV5qK/c8OxXUMjw3fq94Qi6OJV+lopJdMSP
	b1IOtmnNcVISPILfesMBGjXk0dxp0OEJFKvkw6jdYMBigfs4i6ADEmvO374bPf5m1rCrOGmqd8c
	LDT06ibQ==
X-Gm-Gg: AYBFou0Bk7FRAkstmTdGoc6WfT6blHyPSOvQ0kgZpi7oohzIIsP49AhrSEqBzpNqfkk
	k8eW//3Yw8KYStYe8YczeIphImk+Ul579PWifJK+BKMnLiYFddG/SWE00SUAgq1U9IVf0u75XSm
	98Iwz9R6iuon25yLdiS4NX4TcUFXiXo90cuKDdnDU9EvQlgolZd6SBOpBDJ1F48D03X3kLg1sQ/
	qiwJyTZSBzoWA2H/VaqUS4NnA5AvVHjrld9IBk2FPuzuEKWXa31w//k6RoUpT2H77NO7Fn2fsWk
	OdAV5ka9hDpyslHPEbN81V63RhXKdyp3Q/M/ytlFB03iJ5aMtL3dBtIgJnPiKcabrTDJRqQsCLi
	Se8+3ODw=
X-Received: by 2002:a05:600c:4453:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a1680f109emr87154295e9.15.1791126543668;
        Sun, 04 Oct 2026 08:09:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4453:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a1680f109emr87154015e9.15.1791126543248;
        Sun, 04 Oct 2026 08:09:03 -0700 (PDT)
Received: from px13 ([2a06:5902:822:4600:8c2f:7cc8:bd95:9422])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm272425775e9.9.2026.10.04.08.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:09:02 -0700 (PDT)
Date: Sun, 4 Oct 2026 16:09:00 +0100
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jason Miu <jasonmiu@google.com>, 
	Alexander Graf <graf@amazon.com>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org, =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Subject: Re: [BUG] KHO handover hangs when memmap reserves PMEM
Message-ID: <asJc1GIBbCJ26akS@px13>
References: <asE0R_f2r2TL-3Sy@px13>
 <2vxzcxtplh4i.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzcxtplh4i.fsf@kernel.org>

On Sun, Oct 04, 2026 at 03:39:25PM +0200, Pratyush Yadav wrote:
> 
> Just to confirm, the first kernel boots without memmap= right?

Yes.

> I think the main problem is that the radix tree pages can be anywhere in
> memory. So on the first kernel, they can land in an area that the second
> kernel's memmap= reserves. So kho_memory_init() might end up using
> memory that memmap= reserved. I'm not sure why exactly the next kernel
> doesn't produce any output, but IIRC memmap= memory is not mapped to the
> direct map, so accessing those pages likely causes a page fault.

That's correct, kho_memory_init() page faults. It happens before the
serial console is available, so there is no output.
