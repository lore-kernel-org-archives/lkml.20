Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B553314C4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720991; cv=none; b=gG4d2YzVYiP4l58uNaI5DVjpruC2uh+dshXyvbmuWaZ5ZYI6fXbmpxLY9UdanUfU2E190mhT667UdpzxUOvNXHxRIK8GtnCaZYEMPWUqwGjF5L8mXiVmX1AIvs7uX2rm0vLG2HZ4fTmG9AFDKx+oLMn9vT8Bw5Lj8yWOEilhDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720991; c=relaxed/simple;
	bh=6a+HZ1EYXYHu9PlV9ZIMitFPuM02tFoBs0QnqvSqpU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShwDS8XqLdPmgJ+5i8Vs7aA69UgieAU4yIajAyuLXXRR0mIV59nQU0PEUSHIEX9y1jhX82pLxknjlsU2b7ubK1etwnG5ljFNdlzWP7EkKPCLR37Ggz6wtA3Q+ULtgoo5vgQ1F2b08DSNwO1wdhcRRG06exYzxEG2jP19e+PlwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NTs0Dq6I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qAY1gG4+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NTs0Dq6I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qAY1gG4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788720988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UoPs+GJMD19+2K8VaVNyBFab1idZZJbQk2Q9rWXgiCY=;
	b=NTs0Dq6ID7Utpl8vuq/dAPjs+dNnBvQiCCVqu4/+kh6I37jUoOBjwPz+gARVGZT7DEbGMY
	SeNCqj1pqObM7Q1xUl1k9ljmeR2btIP7aYpQL8y6KywPZyAPTubAiu68zYQ1JztrFXM6IV
	QJm4fZkYeTTB0rh3JWFtUOt617gmMBY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-nD6T3ZhlM0G-VEAZkE8UJg-1; Sun, 06 Sep 2026 14:56:27 -0400
X-MC-Unique: nD6T3ZhlM0G-VEAZkE8UJg-1
X-Mimecast-MFC-AGG-ID: nD6T3ZhlM0G-VEAZkE8UJg_1788720986
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48437090e74so1662334f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788720986; x=1789325786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UoPs+GJMD19+2K8VaVNyBFab1idZZJbQk2Q9rWXgiCY=;
        b=qAY1gG4+yO5TNsgyDVxBEQ5IKAY697kE9ikocMWvlK39MGKHQ6VVqwtH1opDhpqerj
         SYhnChjpqlLxmgLslYvfLosbJcXzXRUcSJYNejP0HWSuGmFhFy8lDmWCO2wzlNJovqj2
         ZdhcTFbnbJMDFdFLq6/NRgGysqGYK3qIQnR/N5zs70tSsxVeRYfy/NlNO/MspDvJJk1z
         P3F9Bm3ETQhMpZ6N7NIHWNGzgaxh7SCbVsyGCMs+KNv8qg263ou4AZ+nBJdIw8A1nUj0
         OkmQItCtMTumqP3K3LDmziqqebMSUfDR0Gnp1HTEBQzgtrxUFRCMLkakHe39aSJxyvWG
         Aqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788720986; x=1789325786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoPs+GJMD19+2K8VaVNyBFab1idZZJbQk2Q9rWXgiCY=;
        b=cFE+jZCjj0ZGOVlUpUo2LK/ABGkYeEUf8q+YYGtDs03P0Hg6RguIMxPtxFFBg5myly
         VrpIGDryhvcYHyhoFqQKmRImnTjs3PZGq/EcZeAlpEgjvo7+hsyjz2Klw5xK74rLINN0
         5SQhX6/rB1rS9P5RDFrUjVkV5lFpOb4dQjZXWpJOOJYIl06MDwOL/5YSUrpI5hXaG/JH
         jAU5IT+hkgUtAQqIrG9o6Nhqk70nii2pJzoRTfDCTCIymGJr4LRVGc4c17WasSI7DogX
         aUr8Bo8onwte2TsyVC+Vlp+0sg0pd8B2JX+ynBfPXdfEvMuwtFq5A4SEA0GAH7tBEThK
         tW3A==
X-Forwarded-Encrypted: i=1; AKwUvBxfsA+VOj6lEUgawCmjwwQXD6g7lvyrxV6qZd8J5ArBZ6gkkI721k/2C+C9kMBz7fL+076bl/9WCKkMSj0=@vger.kernel.org
X-Gm-Message-State: AFuF++kLjQ1Gt5N2MYGl1mvvFq0IjNFmtNISUPiyw78V9De0F/l6GO8r
	CiYRFDyr9TQsNc+PFmdsyGiVqr7eXLJxiKuZFek4qJSE9l1SCo8NLcK7jDWObHHi+5vo753CW+e
	96Pa+89UhXZyMXUCMtMXqcph2FqOQZR7rGYj+7RTvNUskAHelVUofPGXPbh2Ecr9BFA==
X-Gm-Gg: AYBFou2Ci9EtQM8NdddTjNUQNrS4K0NdTjNxjS/dZi4MNGY8EZ0VP6aeYAaRV/ElxRS
	UhLiIX5C5Td4xB4WjwmRGd8QUEG8UWPa2YkIdhYl8AaziAeKomtQFkd8G7xCLHCYf77ysdUu2nc
	x+qBJzczhVGZNawXHNeQGw7DuR3WgI544YJJ2PYoRTS902obTyOVU6v6yiXjqMGm5Cmwlli1wdX
	7YCF6FvIDE+Hu22HQ881iP8Wcj0TJ6lSXQptUjLuB5/KhcuiCECssGDW/QYTJ00aZUw7MPvkMbn
	qEsju6v3BNUnnhiDlqwT6OG0l1Y27wROOQegTayTf6yD19PtNRe4kHpDHp1LUnIqHGbNpALiUY9
	wvGYpZPSE8YH68Ci6tD7Q0DA=
X-Received: by 2002:a05:600c:8b29:b0:49c:ee22:364c with SMTP id 5b1f17b1804b1-49cf824743cmr196985075e9.9.1788720985716;
        Sun, 06 Sep 2026 11:56:25 -0700 (PDT)
X-Received: by 2002:a05:600c:8b29:b0:49c:ee22:364c with SMTP id 5b1f17b1804b1-49cf824743cmr196984675e9.9.1788720985146;
        Sun, 06 Sep 2026 11:56:25 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d084d62b0sm80311485e9.2.2026.09.06.11.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:56:24 -0700 (PDT)
Date: Sun, 6 Sep 2026 14:56:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev, linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: synchronize callbacks during device reset
Message-ID: <20260906145605-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260906025249-mutt-send-email-mst@kernel.org>
 <ap2VJkoIsBbsqcNm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap2VJkoIsBbsqcNm@gmail.com>

On Sun, Sep 06, 2026 at 06:32:40PM +0200, Karl Mehltretter wrote:
> On Sun, Sep 06, 2026 at 02:53:05AM +0100, Michael S. Tsirkin wrote:
> > You didn't send patch 3.
> > 
> 
> I resent it to just you now. Mail must have gotton lost somewhere.

got it now, thanks!

> If all else fails, it's on lore:
> https://lore.kernel.org/r/20260905152059.89560-4-kmehltretter@gmail.com/
> 
> Thanks,
> Karl

