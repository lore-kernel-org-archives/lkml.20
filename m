Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860485;
	b=1d/FvvLxFTwT2cQwoGgPracUsGOjt1nJ61x0gdf6msoaiPN551meycrmP9J/Ref9EPgd
	 IG8rfgw+/kIvU7aSzEap12qA3b1w3jwURwsAfIdkX9MBiCi0VgTl/c8ub5WPyVSu1jQRh
	 0WK0OWHUkRzeIkyz8bx7MFKNT5808tncntnnEaI/ylhPA5NvBs1TozVssIg5sjXJflxAT
	 UjiqOiOqckL1kgOPIbpwh+rs7g85KyLC+GOAWbTsJyB3xYXVcFpE5C9ZtiNaMhxbYBHjx
	 t3Beu8rw9eCcdbcTAICPcB4/v1BSEo2AQSZ+kNcq4u64o+Qyt+thwu5P/AQUPn9G0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/nSNOYlsRmTSeCA9izzSk7iicvciGMpmTzAgDFQrTWM=;
	b=NfvM0brf+Cu8nUwOjLinKW11W+Ra3FfBrsbcE+iuBP4/01dhrusN4wtediBjHshYDRVz
	 KReqJ/GuJMK5QyAwi9QDxnRIcxKNpPWWcvAP+AXeoheWT6cvDfLT0yKcbbUS/yWyyqdvA
	 lYs01nTdbuBsRhg2gcsP1D/H3UDAHWD0Z0h8oA6cSrJLk2918nA73wd6GSzNwZxPWF9Rj
	 yftYhKM7E4NxH77U9Ls58Jb7qN61Gxhzayj6tVVelti1kLoiYmmK2V5o2A6a7xX7hreYU
	 +OwPYejIQYkOLOhRaHdlKPajqrchZ/xhjxQvkl9KoSomRYmIh9DkuEZpUEHqyQzIT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=doFUy87X;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B46606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=doFUy87X
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so914406a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792860485; x=1793465285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nSNOYlsRmTSeCA9izzSk7iicvciGMpmTzAgDFQrTWM=;
        b=doFUy87XTMAZBcgxsctiSxQm6UY2QpLcDhFXPl7Q5FUufUfrnr0IqaRvQy5BGIFsXN
         vDPq4a5HJGH49+CstisPR4zii7cHvgxSckywC3Fleysm/+e1Ylp3j6+Sf9tPZOAVSr0t
         C3wBSCcyGbaHOePNv363BRwrX+IXsc7p5m6cpRTkbNWuTQ9CXCaBpbHHvB9cPrS7fFU3
         m+O9ye0KZqO0tobxJ6zIJecaXb0z2SjFQX2/iZI2JtntPjQh0DU5WjU9XRzexzkNrsYX
         JAMof+kEyBM3D2wpT+oCXiqKcuA/vnaOGSRS8Co2I+dbSdSI/1VoBLCVPtbNYaYlIqAW
         7Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860485; x=1793465285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nSNOYlsRmTSeCA9izzSk7iicvciGMpmTzAgDFQrTWM=;
        b=smKrfDHEu0siRbAO1NqDB7aF4g+pxnUtPPRnXt7FL+ERp/CIy4q+fZAqWKUFy4YPei
         ++d2o1xnD7mpqjzV13A/fbbkuor3q54+WPMORBb/OwGOOiW6BxF6UolXgy5Pplwpkoi4
         P5e1kAlDjGCZWouB1lAj+GBtAooIpSP69eLnMnxlWqEN3dTPIfql8V0eY1tfTJ+bwt8l
         lWisJe+FcMpMzdEHUuOK6F+/zG6jjPGyi8P3hFMmCNg+JnKvKCfnYXPadZsL8swiGrIf
         Vn4C9qouuM8UWMUMp6MpmEPl/RrSl2SKtSHTEaLRC+/mnpMiJvCqIEJqJAklAtm5JJN3
         0iVw==
X-Forwarded-Encrypted: i=1; AKwUvBxeA4MB4hIlKkXFYebEz4d4+U8dmeh1RbACU2TuyzySsJu8oV2h5lxfH/SoLBcc8aGJDMS0MRNVQD8kcto=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe9ABMzo96yjqSpx32bIY6CxSkCrjbQC6OP0bct6qt+EtYFkrp
	OdPVDwmcPo2iPg4rNYrRpGSkHJrD4D+5t6pT38GzTznxeRgDciKlK50xuL272onzZRw=
X-Gm-Gg: AYBFou1NM3vB2Zt7zCy1SSNG3Lv/v/cbaAlm5+HJOqu+FlRy0BQYmKuH1OeOzfIytVU
	orVfBkXXoEGiukb9u7sK5rPSBMy89/5VX8LGQHOi5FqjDmkHIpZtQO6vHBOHZ6pKLt2YVgafcCJ
	4qB01oFFvEjFFDvhv/6NzsLiXiK+g9rKZYuo0yULhMjcjSe0ifNjC91bU0JvqOXvoO80++ybdr4
	dNCCMwmv2AKhUQATzmLG4T5tWeUJdA1x+2IHTX8XKklehAUmnER8hFcOeI3O+Yva37oxSmBS/Iz
	BajsY6ymiW9K9mEJ0gIaSaVlaYt1dKemHkXq0PQ07xrKrdM8CdbOCKYSocEVvr3+SsGxAFxcC/a
	UAyQF433MsavEc2SibdnGVZhDIODSmCrFNVaa7abssJr5K6mQoaoJ6UFbRecYEzH8qF2KPGTqgQ
	ZFTGN0D+RhLhbi+NwyUAPWivn7hsItF2I6EEZ9ahTYKWX/OY7OI+gn7pnwQU8dBk6ay2ZXpxrgs
	Jr3hwUqFIHsggBffY53iotPEvcReOHL6JJfSDXDSDgWLbeYwnAqnISmRLOmU0AmnYQrUppKiEVh
	aUE0dd0cONsDKbKROhSNi3DpEfnoym1sqMq2gI5DGGivIIr5b6KOXSDAQjvB6ljm
X-Received: by 2002:a17:90b:1a92:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3adead4fa0emr2149206a91.48.1792860484851;
        Sat, 24 Oct 2026 09:48:04 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af24sm3289037a91.6.2026.10.24.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:48:04 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 1/2] RDMA/srpt: bound the indirect descriptor table to the IU
Date: Sun, 25 Oct 2026 01:47:51 +0900
Message-ID: <20261024164751.3531142-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ea3e91af-53b7-419c-b83e-d70d002ea321@acm.org>
References: <20261022143901.2991062-1-yhlee@isslab.korea.ac.kr> <20261022143901.2991062-2-yhlee@isslab.korea.ac.kr> <ea3e91af-53b7-419c-b83e-d70d002ea321@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 08:56:12 -0700, Bart Van Assche wrote:
> The idiomatic way in the kernel for subtracting pointers is to convert
> these to uintptr_t instead of u8 * before subtracting.

v4 is posted. desc_off is a uintptr_t subtraction now, and the room
division is replaced by a direct span comparison, which also removes the
truncation Sashiko flagged in 1/2.

https://lore.kernel.org/linux-rdma/20261024162852.3528224-1-yhlee@isslab.korea.ac.kr

Thanks,
Yehyeong
