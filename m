Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448B46C846
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142084; cv=none; b=jsGha4Jabh8coPuyWMYfftUPQuRp0MmXlZPiaGbQKaTnU04vTbhE8kcncv2+w5uYtIX/G48b9jWK0FJoxz3w4v+zvAE5aiWxe53Hdr+SF/iJVFDua3/0CH3RDVFH6lduFWd6DX06e5ErnntfWGHOjvtR+cKbOcMnT6JayQr0I3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142084; c=relaxed/simple;
	bh=RjrTG7dlCmvCQaNfHYqGMEjUUYG2no0tg2xElaQykwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJFmcVBJGGf9ar24CrvgOJVmkOj+nz0e37TneQLNjJWCjT6+dK2OYu8QkwiexnM5V2F2qtKS+ul3ZFEuUkQMgQRTgFIsFQn/1IV4kA2vdquYxTs+ZkoYKeRxPmz8Za0R/QXfo2X7YHmsmo0E5RQCwZrBUVVNfTe/F/2VAHQK1Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmK3WKW4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmK3WKW4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so959695f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142081; x=1792746881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g15pUqXB/gZtkjFNMKlMPbbN6ka4f/G72oFikrT6H5k=;
        b=ZmK3WKW4KungVImkW5V9ijnad5eDZWT9PNhh6IgKdI31jPVtEyccCMHjGJpfI29aSm
         jaD8iR7qh15Ypt0j5+ZCkagwrECjYPGubSmiAbw3nTWs8vHJ/E6oRnp9fBoOzvHPTR5j
         gBbRvE0sefikPaO/ZcbOuIwQidLF/fHyShLweLX53nR3S55Kzse/ooe7/WmXt1rx3LJP
         Uw2Tczfri4MdvC0YyyHiwcRKBLgAOza8Cnc+qp+9eAOc2NK06m1wDHtBYOXGoqSkap6l
         TxC//pyeVH7hF8FsptrMG+StAfCItSrab6E2ocb/G16hjfbYSL3VpE+sZwrCOlv6j8tq
         RNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142081; x=1792746881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g15pUqXB/gZtkjFNMKlMPbbN6ka4f/G72oFikrT6H5k=;
        b=vF9MKOQ/9hV++LRo5XxW12wPJntNP9lfLgoPlzwXoprS51i5eeXAmgY+rSQRdqO+t0
         4us1ECcq2zUuLIysvluYi9145oHHGNbaoozJLXwddu3XZz4gX2M54OH3Io44l2us02pe
         X2Ir7D3N/JMap6ZkRpY70rVlirCI9joDfLzTDXKThDJBxNMolXrGbf8K5w1CEDz9jQmp
         Src2z8D3xa3p588w1438Ofco/FVC0FOE3fnW5sC4DRgworzaM6+lLkJCNemeLOxtBFwm
         fe+2chgESqcnOElDdr/2wGXnFHlLVn0CerwUM4CIqbNbs0A+1T8ECRONlJgHdHnr+Xyu
         2OWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFkBbi0NE5QNu+3RykdT5pM4K0lIIqoz/19uKbDGoNChT4rta0kbvXNdHXoUmkHgN1Ou4Q878149a2Mz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9t+hDF7H9rZrAP/u6fIwwK+AuTXx3ME0O4EZfP4f/J4gveECa
	zg4h/fXYeYLmqiRWz6PjRyDPhoq58OyShtFrlXWVI8eC3ufmdYVUsC6E
X-Gm-Gg: AYBFou2wemqgJazEJeW+UfPKduo/ycTQn4UTFkFejKm32Rn3u6g2VHEG5GOb+TW3/Iw
	DZ7k49MLu9NwjfY0C4BKIj6BHcp6A8WkrdnnxdSWdqVb8B4WJqexGiRrJutknC4aafFKKUJ2clW
	FF16fFwNGgojcQCWaDUX35Rv7b+VRFwUltyoj0mQ3UKcvucoCups3JCE5kKVVPtpgUyfC3px9Hc
	n5+t8bgp/j4qGLlPgTNgUSLeojvdlPvpqNq90ROPl+hwL7Z/b0tXD3RPNGzDaBzFBmQOL0Kk31Y
	Wue8dGBu4RNNKgSAjTwGu5K5Ds7L9ptOlRF2Wd8zO9x76jbLCu6ImOQCZew8YD84qGMOIo3jSzh
	fn50vHGi9JPbjsDfLm2wcHr5GIQGhXxnUakm8mUUIiQ64uLueUYHdEfiQSDN0WEfXQHHwHDYL7B
	TVB/sdOz8HUJZZt4j+eFzwjksY7oHI7DLd5q7wxjzagAWc4BxUxHPirynerWs0H7FXG4M=
X-Received: by 2002:a05:6000:4694:b0:48d:e101:5707 with SMTP id ffacd0b85a97d-48de1015749mr17082052f8f.13.1792142080619;
        Fri, 16 Oct 2026 02:14:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm3352171f8f.15.2026.10.16.02.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:14:40 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:14:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alexander Aring <aahringo@redhat.com>, gfs2@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	David Teigland <teigland@redhat.com>
Subject: Re: dlm: clean up a type in waiters_read()
Message-ID: <atHq_LLtPx8SXMUt@stanley.mountain>
References: <ar4BZ26gjQEjZgIa@stanley.mountain>
 <ffeb3e5b-d9de-4337-b250-e27667024461@web.de>
 <CAK-6q+heOWNY8CY8dgotxzEeFC_-huHnnO2pgH8kJsJSGryOtw@mail.gmail.com>
 <c8b6843c-c87a-4330-b6f4-e556117a8026@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8b6843c-c87a-4330-b6f4-e556117a8026@web.de>

On Tue, Oct 13, 2026 at 05:27:10PM +0200, Markus Elfring wrote:
> >>> This doesn't affect runtime but "rv" stores error codes and so
> >>> declare it as ssize_t instead of size_t.
> >>
> >> Can a similar adjustment matter also for the local variable “ret”?
> > 
> > What do you mean by 'matter'? It's declared as cleanup.
> Can the usage of a data type like “int” become more desirable for “ret”
> according to the affected function implementation?

Either way is a defensible style choice for "ret" so I left it as-is.

regards,
dan carpenter

