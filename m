Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAF1514F8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072997; cv=none; b=ipSBmaMgkZYUkpOD/w4aSvJtJ90uwrDjtTtZ1CzHaCmR1i4/AcmwoxCkknZlzuz89ZC6dZnFX1CMIID+kQO3Dcb8zA8y+0+f1C6R4yaDby4K5FRN4gK5Ie1Ei//+pSYjkR85wKIu178CtjBlA2+664s31h1XHn+nb4AzxTxDvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072997; c=relaxed/simple;
	bh=oG6H0i7TFJakemrkVZ3AqA056ijFzBJqlUJomJ/b3nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIHTwSwKHhiVReqjeBqmtLZWyesoFswYWeQAPHMCV+Aqdw2dNs7IMBwyzS9A3r5NCnt1sNmqfDcZtoi6JeUWSDnsv7w7MKfPugKAspZ5Y9ejTsq+TWILSeTMQx5AcW649gMWLDdJbyRL5VtVEiqBbOIuEJNSS7vZeJ+ePUjI3Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKO8H8/8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+5METbz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKO8H8/8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+5METbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788072994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FptnBRKcAtIMllxmw22IZ9BiQjAJd7jrnVJgzhqT6Fo=;
	b=XKO8H8/8MlVX31a4gpEY2yZs1bRTKQ+IHCQcdFFUZSSxqFw7W/Ivaphtk61G8iIY5l24eh
	MLyxdbpGOD7sPGkcEyOt2ZxGvtBNeSbNdXo6GtviKPJDUJnj9wvF2c4RUGxCESuM+JCD9t
	ykj1H36A83J8l/K1VANHhX9mVyO+cFE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-yMvlORRQNjCUgjEAicJX0A-1; Sun, 30 Aug 2026 02:56:32 -0400
X-MC-Unique: yMvlORRQNjCUgjEAicJX0A-1
X-Mimecast-MFC-AGG-ID: yMvlORRQNjCUgjEAicJX0A_1788072991
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-481514be433so997510f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788072991; x=1788677791; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FptnBRKcAtIMllxmw22IZ9BiQjAJd7jrnVJgzhqT6Fo=;
        b=A+5METbzUkU9/KXWSZmFn0RNWBa/ZeCWFPqSBDtaneeeqcBYzyjNoM70yNHW1N0Mok
         DpyzjUFMpyv6ub32bGFUUphJMyF8u2DJ4vWGKeU3w+c1EfRZzfBk0NzuPtW7rfUZClsn
         hVCPDi5RAprjGa4wr68cjTR5XiHrapcT8+f9HB77inoCe3vSJX6lC4bTWxSl46v/mTmK
         GugBbcIugfSIw0S8Ut7sVhiJ6GIcJAg/hYfuqc2dO3VFbCMwA4pYbZdnUxuGf2lbqhgo
         5GRdEVnNo6atudqeUZOWNDipQZh+2JaAUP7ZnkcWXsI6LWzFzYzexZH/ilqzQwDVdPW/
         vwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788072991; x=1788677791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FptnBRKcAtIMllxmw22IZ9BiQjAJd7jrnVJgzhqT6Fo=;
        b=haZmdvdAYeUWu62TLVvg1n3N4XTBlzrPAO//mDXntFxZ0IsIbpeiZXgzwttCyNoA1W
         rCcra1od8sLe3nJyf8IZxGlaSdcgT6XjYvgiudZGHX315wjpmlav7NKibGgNURrdf6/d
         MPryPs7Cf2AdgaaDt+U8vjovWe0jFuvsA9hq3LQKuB+62fan+p0Num5PH+wzkb3fvULG
         CYxA+duqhLc43qHxW28Nreo1u7HKQjnfoAmD8aSvbxNpTIt+DmfPr8Ma58gc9SkZ9t3V
         PhdxvIs1FR0znzscWHCXP4EjN+4NHUDvnLOj5qoj2fX/NYrPmYWk8I1qoIOBRsfTy6Pv
         +65A==
X-Forwarded-Encrypted: i=1; AKwUvByrdJEdM3W3U0iede24nNiX1GICae6chRfcVeqtQw0mSW3XApsKmXUw/tnD6HbWu9TUY28dJ2tj4PfzqDI=@vger.kernel.org
X-Gm-Message-State: AFuF++n8CgY4XkM7LQwLglAwzfrgDrR5Sse6QrhRiXs1T7twR91aAbiM
	fGNzFsxFtS/a7YbO68+uVTYyJd8j8fcQwDNqk4+TaVZ4jq0+Uwe/czT3BovzhuPzi5QJTuVJLsz
	6QAc7UC0aayaDb5O72Mqu8faW/av/TBV7OGdmRVwdCnaWx1XzzR45F4XYYvEPHtfs2A==
X-Gm-Gg: AYBFou00b/AA2IGQTuGjDcWcKCu5hIu2QYsofYCkz6mMa/UpNXj37S2Jb3TdnKc1PNx
	Ti7cl3QZMwHziMlM/bVJrHGYKY7qPWaHkJxtQnZ35aajStM6ezsBEuj7e2iHakZ3llKxL8YE60v
	x3vXSGcF7/t2DA+TOUbJJsa4yaZkqUlDMIDbtne5kHbNCx+uGVQ+Ljyl3p50i+Cci7+2/FKNQLR
	rpIZepnALhpuXT7vsvEIb/WXB6ypOrxu8rvjUSUngXb85m4M196w56ofs+EhtYBHBwflJ2/mL9c
	GtfqP7RbjBZDuQ5TxswiLXS4GibPJDPKW9BMfDXdcQiRdE79YWw2Wzto5XxIG627GS+FefjTQ6e
	wPFPoVLPA1JMY4fU5VvR+0RI=
X-Received: by 2002:a5d:5d81:0:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-482f79bf13amr26808126f8f.18.1788072991083;
        Sat, 29 Aug 2026 23:56:31 -0700 (PDT)
X-Received: by 2002:a5d:5d81:0:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-482f79bf13amr26808083f8f.18.1788072990509;
        Sat, 29 Aug 2026 23:56:30 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab29sm7006881f8f.0.2026.08.29.23.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 23:56:29 -0700 (PDT)
Date: Sun, 30 Aug 2026 02:56:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: aesteve@redhat.com, eperezma@redhat.com, gnurou@gmail.com,
	jasowang@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH] virtio: Add ID for virtio media
Message-ID: <20260830025559-mutt-send-email-mst@kernel.org>
References: <20260424123123-mutt-send-email-mst@kernel.org>
 <20260828180933.743887-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828180933.743887-1-briandaniels@google.com>

On Fri, Aug 28, 2026 at 02:09:29PM -0400, Brian Daniels wrote:
> > On Fri, Apr 24, 2026 at 03:37:14PM +0200, Albert Esteve wrote:
> > > On Fri, Apr 24, 2026 at 3:07 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Apr 09, 2026 at 06:53:41PM +0200, Albert Esteve wrote:
> > > > > Hi,
> > > > >
> > > > >
> > > > > On Tue, Mar 10, 2026 at 9:41 AM Albert Esteve <aesteve@redhat.com> wrote:
> > > > > >
> > > > > > Add VIRTIO_ID_MEDIA definition for virtio-media.
> > > > > >
> > > > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > >
> > > > > Are there any thoughts on this patch, or any actions I need to take?
> > > > >
> > > > > Thanks,
> > > > > Albert
> > > >
> > > > Create a github issue and request a vote as documented in README.md
> > > 
> > > The inclusion of this ID was already voted and approved. The device
> > > already appears in the VirtIO v1.4 specification, with the same ID (as
> > > linked below). This patch is only meant to translate the decision to
> > > the kernel header.
> > > 
> > > >
> > > > > > ---
> > > > > > While the Linux driver for virtio media is currently under active
> > > > > > development and review [1], the VirtIO v1.4 specification has
> > > > > > already been published and oficially defines the media device type [2].
> > > > > >
> > > > > > Adding the device ID now allows other components and tools to reference it
> > > > > > before the driver lands, and ensures the kernel headers stay aligned
> > > > > > with the specification.
> > > > > >
> > > > > > [1] https://lore.kernel.org/linux-media/20250412-virtio-media-v3-1-97dc94c18398@gmail.com/
> > > > > > [2] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-82200022
> > > > > > ---
> > > > > >  include/uapi/linux/virtio_ids.h | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> > > > > > index 6c12db16faa3a..f9056af0c6223 100644
> > > > > > --- a/include/uapi/linux/virtio_ids.h
> > > > > > +++ b/include/uapi/linux/virtio_ids.h
> > > > > > @@ -69,6 +69,7 @@
> > > > > >  #define VIRTIO_ID_BT                   40 /* virtio bluetooth */
> > > > > >  #define VIRTIO_ID_GPIO                 41 /* virtio gpio */
> > > > > >  #define VIRTIO_ID_SPI                  45 /* virtio spi */
> > > > > > +#define VIRTIO_ID_MEDIA                        48 /* virtio media */
> > > > > >
> > > > > >  /*
> > > > > >   * Virtio Transitional IDs
> > > > > >
> > > > > > ---
> > > > > > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > > > > > change-id: 20260310-virtio-media-id-b31179fcdc44
> > > > > >
> > > > > > Best regards,
> > > > > > --
> > > > > > Albert Esteve <aesteve@redhat.com>
> > > > > >
> > > >
> > 
> > 
> > Oh my bad. I misfiled it into the spec folder. I will take care of this.
> > Thanks!
> 
> Any plans to merge this in soon? This is a dependency of the virtio-media driver.
> 
> Thanks!
> Brian

just include it with the driver patchset itself please.

-- 
MST

