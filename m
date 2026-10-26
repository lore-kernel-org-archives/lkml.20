Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038380;
	b=D9ulkC8+eW7/0wdaskHDK/QTVmfTk/MswiHwt0z9ZOdT4AWt7GHgYRX8b8buLkc/oJgK
	 t4ZbxrO/XTmoed4NMoBQm2M87Qs2Ax32RSmT1wg8WCEvCeJhbMxdwRaHbxcULjaPw85qU
	 gmGCBzTtroR6dTFYZXIE6aoXVWPELzttfMSpAmkcbLNWeEVpmlm5HoDCqkbQqM9c2yz7/
	 6bF4+wsmVlRn3dHuYTft1RdrFU9yhpjA18nGU9duzJciFD29+MbcHzDTW64Lz4ZHCHvFT
	 NMizB/7iW4w1eVbU0MKpGVM5Sv3pAgf/Fj36fq3AI/y461i62gw3ZP+BaJDu9QnP2Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QW3sLtRWxfBZuOWJq/rGSlPO0jYxXYDcOJrE1b/An2w=;
	b=gGc+w2hCqU0VRTYyY1uQR//VMq+Les6uUgmvRSad6y1UtQMdMutTrDnOsYA6bsnueBrT
	 0FJ20CQBvcpK2E8W61wWuvoC236Pf8xhUzwx0g3x1A1WZCsJMrjRgFr/MqwOg/ikg31o+
	 WWSkcugBExu0vd7YRsyox5G9ZqR5S0eQXMpeNJ1UWXjve6bHgbSb4tIlObm/Q6kZKuInm
	 4Ydeu7GmCbxYhMAUKP2Hms3x5VGRO2r1JGLZOEdAh6d76gsepUF/0aO3GtmXAs8Nv8Yf0
	 ffpHEINUEBozuw6ak/teG6Qmv/rw0hWhpYt95C9XUBxhYKl9gDepPRvXXv8CCN0RDAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=GplxMIj6;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=GplxMIj6
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1985018f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793038378; x=1793643178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QW3sLtRWxfBZuOWJq/rGSlPO0jYxXYDcOJrE1b/An2w=;
        b=GplxMIj6xuqZF7fAdbIgOaPR/m1CzkA+gdCB+w1UeeEpKQtbv+unzlbQy10grdh22z
         4TzoomL2uLXvnvszauupQUKb92jZPckguogpA++AS2ltg6Nd/267xj1O/IPbbwyjD3i1
         fO5OfaD/Em4bJjvRJfI72mK0P83RF6gGmtGyweft+0VBjPuF9FmJWkJp2Srg5gVS+vEN
         M3rph3y7C6qdfYVz4ioKgbSlCZJK6d73dYk9ZjxZx45Vs0CvO1runXT7mSliyBiDKEdr
         gfyEqviMm9l1Kdb5B9VoV9SP/iBQUv+BSCLTlBNWVbd1JtGwpusx5ivF7AveXgE8TKcf
         oWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038378; x=1793643178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW3sLtRWxfBZuOWJq/rGSlPO0jYxXYDcOJrE1b/An2w=;
        b=2e0KWFKy4790c1bBcuBM/Zmjo/zLxaNdXAADNxzdl6Wxl7Upwc7LXoQXsh1KCKGoP6
         oaMCIc1O51Ey9EV6bluAyhuNKRiHDC3USrKyDKSvUZbqqrFlVeR0thAAQdT6h6daABzY
         67O5qgTwpN7lTSpkkAMnRjwhCYGbxiUgw+liK+TR4k9zy8APkFcekiSQOQ3Yc36HlMeM
         G3vj8+NCY9NxsG+/hAmqNiDnPwpUAss2qyxsaEx8xlIlFhxHOpZ2u6zUi3v8tT+JHBsU
         FrWSqNd5IKLFSFG3/7SQavMGpBHISBOL81x19ryH0k/ADTHJqmvv1F5aG5dnSDWipTx0
         7R2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8RURMYAx97Y/cL6PknqFhhiWGHGf+JrTUbDOL5sNFhbxGjZmQQQvcQDO/Dl37fsM6Hhu47cktXTTzO3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTMe/8BGUH8tv4v4l7cOXGW8UQNEM2JdNu1o/VEgMz+wA8VEbx
	t5yBgvGDjLemyB/G+wDK9XjD19OMkFWNDzesR+IxlgvL3GaD/Rlfh6vaxfNF1YzDsP8=
X-Gm-Gg: AYBFou1gDYcSqLASIdsEix80FSCPChW6vad5oLqsldOU06wjaE2p/5kaxRjGwjH3gyQ
	HP+ZDrO47O1G4OacQscAhunsDRr6tzfJOoMP7NjtMMpKzXKP7SU1llaV7U7kZiD1g6rNjyLD0jk
	fQhoP2M0WdfarYcEDc8i+PFI6z4yi/dwTsXcUcJa+PtlJU4KYQHUpL8v4yf1lo1OsfmXLg+WUWb
	zU5aePueegSo1j9HcDv2lXH4b8DxVDFYovMzj5Hbwdv3k/0V8P8S6/N0daDsD81ABYQ15j5DEcG
	tWepZfPhtXN3usW2BTZyRg2S+SUOfhWJI3DI1vysLoQ164+Eel6klx8t8tN3EUyGegXhob1q9D0
	33akqN8t84hSNP/lFLcBvzPBU3qscXRBp5novZVSmdoW/+LqRIxp7dkxoq516iZviV3qfu/1k9Q
	moIPYGDfSk+b3lcqxFekj3RNj0tzrkE9iLeReLDnLLuaF5K04vUotI0d2hopTIR8A1Bf+TjuPxC
	6ynML1SHwuCyrxUA0Jyf4D5OgqIhwUd9IMRyuAEuvqWwa1+1FfgUAEDbRxDo9ACDH1AwoHc/1ev
X-Received: by 2002:a05:6000:41d1:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-48e3eb82f9amr15096144f8f.18.1793038378341;
        Mon, 26 Oct 2026 11:12:58 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm22665445f8f.49.2026.10.26.11.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:12:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:12:54 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 11/18] nvme-rdma: Use CCR to recover controller that
 hits an error
Message-ID: <20261026181254.GA2653700-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-12-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-12-mkhalfella@purestorage.com>

On Sun 2026-09-20 11:28:09 -0700, Mohamed Khalfella wrote:
> An alive nvme controller that hits an error now will move to FENCING
> state instead of RESETTING state. ctrl->fencing_work attempts CCR to
> terminate inflight IOs. Regardless of the success or failure of CCR
> operation the controller is transitioned to RESETTING state to continue
> error recovery process.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>

Hello Sagi,

Can you please take a look v6 of this patch. I applied the change
discussed in v5 by moving flush_work(&ctrl->fencing_work) to
.stop_ctrl(). It looks much better now.

I would like to get these changes merged in 7.5, and getting this patch
reviewed leaves only nvme-fc change which I believe Daniel is looking at
now.

Thanks,
