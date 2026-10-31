Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454614;
	b=gkKneNxb1mk4m9kZUzfqJF1h0lEAffEkL8jzEFMnFqGwFi5WdF5k+algVpo8Gk1X/Vsn
	 NxMgfV0EQRyQS0UMct+J1+YmIT+oXN8zyZP4Y+TAxs6pHL/si6hlX0uMe9iN+Dz7fBrQ9
	 oYVJG+xUCKqUVw8MhQjtbNE81Ua62GkmvtbhoeXQrvCKkzGiQcfLn6OtMt4P7XCPsZMRR
	 gHSX+gtozQdYa89LrFF/K2wCP48eCwgi64JUsVB6ThottxZjb9UvtkOoFMTDOEjXj31Rp
	 qdJ+oz33dEs4DGBzAGj7/VukxfMjrnBGILcn6wCiJ69hJS0U9VOeNufksMLjtfPqcAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q8xXFgm02QuTQ9KygADKrC85zWxCKIT0/FsOPIPoUtQ=;
	b=29OO3jrnpd7ovLA6TEuREaJ+WheSetZAxA0cDcUxkCVd6qi2fMLwo+9Qu4++CbXrALYd
	 ZxyawUuDysKr7tuGNRGtV5v0CEUyTIAx4vtEnIBxrGOQFL42lL1JMQ9v7go+m7opsaTF8
	 U151L/lsgNXHx0/apgmtVbZzG8oq3ZiLrluATaMyk1v7I0CwNyIi6cZGwxlVs8T5PECP5
	 CRnr9krcm0P8BpUSc5wiV2JVLx905QMBf8gcyT6EWjgAGLKJ862s2v42vIP+PBc7VHxWM
	 zXMzk2VxmzdhAZiz7zLD5bb/kClkX/Hi3Ob5vq0vUzr1Qbv92uIFH6/q6g89D+no4aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v5DiwfCp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B85606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B85606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v5DiwfCp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso17301255e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454612; x=1794059412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8xXFgm02QuTQ9KygADKrC85zWxCKIT0/FsOPIPoUtQ=;
        b=v5DiwfCpx5KEUTjOyLYiULGbD+7eYFKX3RXlFKl5LZ0+N1kV3ksDEoBrOarNjGYKQz
         oiVZ+map/6l/0C6U2oUSrWQ0GGvRxVKn6vC28YzGpIlTNHnqDPVYhkSLJKl94XFdsAIj
         SlOuwpaZO3TxtydkD2paGKeH6sigaKBKbgeHukfofA2mOF/fdLnCt01IweYveCgqRqj7
         ZG87mO5IiZZxrrgb/0XjGuA7yJRdCbZ20F/3MaMQBPB09QRGXz2nOBYJaSY/JpB41H30
         ENSVp6rtqPv6BlK007bqGMrn0ZskbRhi1yHHjl5p/RWVTTI2RjwlJGCM0e7KHPJ0FA8x
         gCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454612; x=1794059412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8xXFgm02QuTQ9KygADKrC85zWxCKIT0/FsOPIPoUtQ=;
        b=HEbEQXVHtI9b5W+p7EOLPRRmlLFYiO7UdymjDAA+wB8XWstYup6Y+ENe73eCdvOjL/
         lUhjY8a4r1T1rTt9qm7MLJdPhvbeELNJDZ8VCILNIOqoDGuFtniBpNcEKqGX532JcSvt
         F3VodWQhhsHWTlWUH+8IT0z5fh5yOFkw57dMFwZ1YLP6Kvr+F5DMjgI6XVAO1qjaK+NY
         61xuUsh9rnUNCeb0mmfO6QgKKwtPhTi5bu2mnrhlBVWSz5rx4H1lNDgGEzbTROPGWsKM
         mKQxd8CmrcDrk2GyVL6BwHlJIlNu/a2j/qwQIfejHudPbws/SeMfesL0lxB4LzxhcSkz
         J7gw==
X-Forwarded-Encrypted: i=1; AKwUvBzzEHV1VLAKAF5eKl9Ph9jAPBiWZ8ONuPUgwCBg9OnTZaPI1FKkpnSXzau2Exkl7k4zoyCLqyG3nvBqd7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIfcP9UNI2Myqgfc8lWI5gcAOWNl1lIAHyEpCkazNNA+LSYYHJ
	JO+MluifnuCS+rZ48zDHVH47oja5++VOfKy1Qr8g4ep9/sayT/tvFiST
X-Gm-Gg: AYBFou1Cos8E1tIP7r1HbiC+sMAMRAGOPAfoWvAQuByU2u/oe1ypPp1eiSbX9JcC5Jb
	rluWZylIU9dvtWOMb0eeofI7jto9aLUuwsCEGlI2ZhBDEL4t4J3zXdM+wAOfUxfhlp9sV5B8FFL
	vY28uo6kWzUzJzgd5JEYWCym6J6/Lu7QPTboJ5SjNeEikoYHVKQLgoqMLQbEB9u5K8HLBBHF41W
	4+dDi5NvXaI82xD38Kv7vJFrPZOid315qee2XvyxIN1Sl0j10RxH+0JFGGgocfgVV05Mljj/f2p
	cdDpvaPF3yexyM+ElCZivRVH3uWF8xmLd8DUkloGtK3Kqq9/am3HnrQUUGOctD6BdVCfHLOnE1Z
	N3Dp4VtJVqIg92Hq2ui8i1O6AbEgvgyz7mbtJPOWEvrffN8CS9gGfFfQsGiszXxZ3HkW8gIKiNS
	/iDx7IJYZoAfFS0WS2mHhJBvqyODOIx/zYpNSk8ivePOlTdMQdmzVKEWvgKKPlziZPlywNU/xkx
	u04Qp5pu6OLmQdWrVgy7PU5yzCBq1zr45Ro3moz+CjzJqT7qooRiYQ+duXAeUS/45IrW4qgkysx
	lJO97NlUphwdG16Gz2j6iImm4JkqukWXTOuYfoS0vNFnug52046LVdvhXd+zcbmykJOPV9pwu5f
	ogdEKopSBtpsQt2r3RwD6ZyqiJ0p1zn4H6jP4K8QHIv2VLNhohmK0XcqtByyaxzlikkM=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr127440445e9.31.1793454612490;
        Sat, 31 Oct 2026 06:50:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm234950815e9.11.2026.10.31.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:50:11 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:50:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: linfordWu <linfordwu@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix probe error path resource handling
Message-ID: <auXyEB82y-I-j7Zc@stanley.mountain>
References: <20261031133433.1826133-1-linfordwu@163.com>
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
In-Reply-To: <20261031133433.1826133-1-linfordwu@163.com>

On Sat, Oct 31, 2026 at 09:34:33PM +0800, linfordWu wrote:
> The probe error paths free the current master or slave resource before
> jumping to cleanup loops that free it again. They also pass NULL
> resources to the VME release helpers when window allocation fails, and
> pass a NULL buffer to vme_free_consistent() when buffer allocation
> fails.
> 
> Let the common cleanup paths own all resource releases and guard the
> resource and buffer pointers so each failure path only releases objects
> that were allocated successfully.
> 
> Signed-off-by: linfordWu <linfordwu@163.com>

This driver has been removed from the latest tree.

regards,
dan carpenter

