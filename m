Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FA23BD02
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851365; cv=none; b=LOLjoctb7DLHzAwA6tupdJkbeNKUmFmVZkI4EdJMhLP0djNjqwp7zWkApZXUeNyV3RAUpQbCH+4wusv27JQ9eb9isQL6BpKfkL3MpiZweoTaVpSZPygRRW3zPy0g8ei+IlibVao+sCk8OeUCbzdoIoYkxEYeLqdfa4gY4egMXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851365; c=relaxed/simple;
	bh=lEoXV1QFxcBBPNnfpdpaqnedrBNV6euredLXJ07PvbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKIOax7IdAbTdU573I/v8msfHjj+KrUkAwA+K6NjdwDwY+2YkDywWtbencwXV2Qja1yEyuI985fRZzRg2ZhUU6qdFMjFnDU3eq9npidFVekX6nrRUy5N3f7gJscR41kNIIBfd+qJSkFrAs4i1LE2w6i2l2HWK7trjp3zau9x700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFtgAJX4; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFtgAJX4"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0f2c945eso278587666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851358; x=1791456158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+64khRp4KbgkO8juqqsE5rAagecy3Xz4KrJ45qjCyjs=;
        b=lFtgAJX4Oq9sEcYXgBio9gu+XY7LCQxz1hPfvT2LWfydzSqa9FXbg67t/korHZn9Y1
         kLCERr2yBX+8MGDwkh7A9ctdrVvLmc69+Zz1+6duc9VFK8dudix+cGIetu7eRnTc4BmL
         DTTtbcwmqgaiy9tnc4SS3+rDlYXVMWb2XDvnQYhC0HleeADKvoE9dfCIgYLqEz7NrpK9
         Iqv4+DMD0PBQLA/PKdxd1Aj3k5Rat4i8J1q+MEFsVBfwdNYk7UIlg3jVk1EDFvU2XD8w
         Ch5weB8OULdEHjllhv+Lik920b/nItFNNxd/JowA2h1nlzJNmsDuNEB/HlzHIMH2jkO4
         pCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851358; x=1791456158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+64khRp4KbgkO8juqqsE5rAagecy3Xz4KrJ45qjCyjs=;
        b=23M5Me7LV3KIsV+VUw7BJcLyZl/z/gPWap48KdjUapvM/soFYX1Ege8pn3isJq1rfD
         c63rrZhAY+KGUMY488hHmy5ogRDWjaNOR4faQqKJTk2MC0hnGKil8iU2BJSOqIPMz6HW
         hf4WEAdIzmCZl6kE71vQP8qLYmhrP5HJh6P7wbJ4fLSB6qUksI4DPPH3Od2OwZCFrk+p
         U9ccRM3SphHgq/dp27wDgrRp/64/Oc3Vw5GnZNPPmaQPWKmtVC7LZd9EL1XUReJeua1h
         fAPF46dOe3AMh1YcGZTsY7KnqNs0YaYqe3pk3XH/tUnGKqXTT5XzyH/O7/twzDoTr8DB
         s9Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzZr1zy9jCYRI45QdV7/NVT0LJ774/nNLJ9YlBwh3tu1sGwc49Up3s+OKswvohH+8R5Ms5wAnnHGpI6kT4=@vger.kernel.org
X-Gm-Message-State: AFuF++m/G4Ijr0zVZIB20OSOx+sT3fjAKlLZuDQ4eQeTAW+TfFWWFt8y
	ZbExIFeyuqRAW2iNHbc5m7V+glsowc5BiDQdoEzEh1HM0FK7yqGpXqum
X-Gm-Gg: AYBFou0plL+BrO6S4XdX5kYRX7IKedCNp/R4tuR71KqyBxiBgNtoywTNpNg/NBXkiat
	cBasmltXLsAQF1vULlF0gVTqPSeZHiCG9y38wR0plEKYPFwh3q25sqjsYuOINDgS+/EnUENhZrf
	aVg1OBZcvduOAlbRbAd+Aa6LDQCeRqi0ajLQODFSv4ifH5RtS7hw1ege571DS2l32NaUuM5yvND
	xcNbGlGRKMhB7RWyjtWh7a4aF8nAHkkQLf+kG0TBqnZhjAvbu8vIND+59ZXm2WkTV79ZQ+Qic+S
	nH4s/FTIlxU+UJVxQt8JzYGLuFyozwQquEullq8+sE3W8sVMSGViFAR4/sK2vhpdZB4u//Z8JBA
	+C2gskYM1CYIJwBMQqYROdjehF7Qp+dqF2w7kqOikQ+aQi0cssdXGvKlxLt2oH8InSfKXEm8qlo
	SRvZGkupcPn4QTXoHJmDd7Yk/bQPLuX4af2Y8b0VFG4HpqsDC9utk0cSthpH2AKtrroZg=
X-Received: by 2002:a17:907:60d0:b0:c2d:ca32:217a with SMTP id a640c23a62f3a-c2e23da3c15mr328686966b.33.1790851357626;
        Thu, 01 Oct 2026 03:42:37 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c93c31sm131768866b.11.2026.10.01.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:42:37 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:42:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Eric LI (Honggang)" <eric.lee0305@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor xmit_xmitframe
Message-ID: <ar45GeQXJ-dIUw91@stanley.mountain>
References: <20260924151606.333467-1-eric.lee0305@gmail.com>
 <2026100121-chirpy-stomp-9fbe@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100121-chirpy-stomp-9fbe@gregkh>

On Thu, Oct 01, 2026 at 11:34:30AM +0200, Greg Kroah-Hartman wrote:
> > +					if (pxmitbuf->len > 0 &&
> > +					    pxmitbuf->priv_data) {
> > +						struct xmit_frame *pframe;
> > +
> > +						pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> > +						pframe->agg_num = k;
> > +						pxmitbuf->agg_num = k;
> > +						rtl8723b_update_txdesc(pframe, pframe->buf_addr);
> > +						rtw_free_xmitframe(pxmitpriv, pframe);
> > +						pxmitbuf->priv_data = NULL;
> > +						enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
> > +						/* can not yield under lock */
> > +						/* yield(); */
> > +					} else
> > +						rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
> > +
> > +					pxmitbuf = NULL;
> 
> This jumped out at me, why add this new line?
> 

The patch is correct but the new version is as confusing as heck...
Glad that I'm not the only person who thinks this.  I've been doing
more and more AI coding these days and they say that AI makes you
stupid so I was worried about my own brain health.

regards,
dan carpenter
