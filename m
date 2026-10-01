Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA83EEAE5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873425; cv=none; b=Kn0vUg6zafohM+fEMKmzUxvY0CAxKfBeec5Lafaocf654gk9m6A6R7Gj/vx9ZQKzpUbGTtE5J07ez95usSwh+yxfHkT902hKConj813RfVIQbP8ohd9oT4Eqq326vjM/f4YhM74F/8UQR95dXabCbda03Zf1n12dih0GKpUfaek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873425; c=relaxed/simple;
	bh=QSJ24e+pWCyCXE2eunfAAcOCjCU6zm7GnfTg2Wfuq/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdVRMWMXOqMvrqGgMvza6v31sDrkAPyILwYuD6GtJHX985266wYFDg581oA5OnvbBIlOoLY64msqppu6K2tYdtepMOVmk+lsf4R6c5CKLc+FVrYkMe/oJP/4jCReGHS7o4zWwbmUVfJCX2vn6kzdm9RAHavakIv445k+lBZCBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UmKwXGLg; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UmKwXGLg"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa474aso6963515ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790873423; x=1791478223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgVV1+ohgrdPmnn55ueLtzmq5w92i8+bjyV4Zdoclo4=;
        b=UmKwXGLgw/ksufPxGB9bMgTzjFg8nUQgvbj0iFRgila75MA1lGxQyTHetAqE1JjK5X
         Zp6e7zn1NQk2lTPcIiRfqdI4sSp+fPGsbeFTnMH0Kdsxlu/1Mao8OQEQHF1AJqn/ENhD
         aMX3QGYdgYIpZrLlZEaQNRQxLxaXXYJSNQD/Rz78BN5HN+xAIkLCWviIbS+QbVptzftE
         lcpaIUE1Im5m9yKsE9UgILGKIsPMcf3xXVw9cllVvv8MB4NVROXJsXgf81F1qdE1sWnO
         XHGLzteYpkvz0l1OTkZpYW8/YRcMDPbZhXbSjJZTxi4z1MmIcEbm38WIh9Z3wsYtiPqD
         fePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873423; x=1791478223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgVV1+ohgrdPmnn55ueLtzmq5w92i8+bjyV4Zdoclo4=;
        b=KK13W5Mmz2mSi5UH8QZsAYliRA2jdBQ9hqICTQAFKjbtqW5rhH541094ewFfAKoqJy
         wHdmOO+230g8bBZ608kDLjufIFzIsVaB/+wWo1R9ItYb64v0aZ+R275U/jd5xz1aiWx5
         omh3dDI88TSrCSgj9b2KIMzA/qH35Boj+7krzYPVolZYIMAiQb3NLkdaXI3jJxfYFT6a
         xqxV6ba/8UXlvAeCpwEIp4xd6/W7IEsuusKXPYYpejnFv6nI1YQyUx67J0mPNlpm2b5i
         7iNzRNqXXqM6Tk5i9+ELa9qKAQrf1KeYo/nVtmR4WPS89jpypMbdzuOXidzggTZDvo/I
         a8xQ==
X-Forwarded-Encrypted: i=1; AKwUvByI0fRy5+uwLvMcbntvoO3XNOusaJO095mKolYCMqPPvsUoRNM9zoF5dRajokgZd3zkUoTM7pDl2IRavNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWkMaCKLFNxyjO8R9rvVudaN8CRbrLtvk48ueool0Q/eAIsPNY
	4h8R1BiX0k6GwpqPHACpCk4XZ43ILV111vb1jgde+/g3UtgG4lRuzHvCUgOAv8fUaMc=
X-Gm-Gg: AYBFou3vuAzu2v1pQqzW9fiQ+FeMieaEI6E9ua1JnIO6lt+RCes+ILwR8qE1wY/QsNf
	kN5smOvG/HwvONRM/bfnGtWp+pH6HRG7P5LvlCfPGJTVNWOsPO0cUI7Nxp39llZAQscSc6TMd+I
	D02fgQeAJkWVFOLibg3Qkmbgb7W+7PXnEs2jEOFts7KckMQJBeNaFIUqi3c9bINpL0vgq++p4l8
	n+dQcxFHhXpMo6+jftLUAgdbYwS/tgXGWJeCW7NXwzGqzIg5QbArFBX0i1ld5LEpy+n2fTn7RI0
	G3rHOs0dqwKD2w8hoozU7Covw4D7T0+RhxVjm7YpLZ2pB10x+gwk73oNNxho1nJr/TIz2btpPEQ
	kWOJfFccWTNLQ+iyROTVjP1QQlZlF6MBc1xAhvMcx2tw7hYe0vZW3cx+ZYR8k1CYpFkUUIiE8/c
	6TDye3ai6gzb4J9hYZlAF127Q1eDpiVELHR21BssHPkvqevJj26RG11xBu0EuI0FfduxOwAP7q6
	Q==
X-Received: by 2002:a17:902:da91:b0:2df:83ce:724f with SMTP id d9443c01a7336-2e49b615cf2mr386185ad.30.1790873422943;
        Thu, 01 Oct 2026 09:50:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:75d2:ead5:9c07:75b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099a3e5sm13724245ad.24.2026.10.01.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:22 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:50:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
	ohad@wizery.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before
 removing it
Message-ID: <ar6PTLS194v3YJPU@p14s>
References: <20260924205901.2505186-2-tanmay.shah@amd.com>
 <arjZvftSMlG3OMHP@bywater>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arjZvftSMlG3OMHP@bywater>

On Sun, Sep 27, 2026 at 10:55:59AM +0200, Francesco Valla wrote:
> Hi Tanmay,
> 
> On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
> > The virtio device is removed when the remoteproc device is removed. The
> > driver should issue reset on the virtio device so the remote can do
> > corresponding cleanup.
> > 
> 
> Shouldn't be the driver, and not the transport, the one that calls
> virtio_reset_device()?

Function rproc_remove_virtio_dev() calls unregister_virtio_device(), which calls
device_unregister(), which should end up calling virtio_bus.remove(), in this
case virtio_dev_remove().  virtio_dev_remove() calls drv->remove().  If we take
the RPMSG driver, rpmsg_remove() calls virtio_reset_device(), so explicitly
resetting devices as part of rproc_remove_virtio_dev() is not needed.  

Tanmay, have you observed a scenario where the above isn't working?

> 
> > Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index d5e9ff045a28..1cb0ee0ea656 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >  {
> >  	struct virtio_device *vdev = dev_to_virtio(dev);
> >  
> > +	virtio_reset_device(vdev);
> > +
> >  	unregister_virtio_device(vdev);
> >  	return 0;
> >  }
> > 
> > base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> > -- 
> > 2.43.0
> > 
