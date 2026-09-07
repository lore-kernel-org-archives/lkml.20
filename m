Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20B425873
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817287; cv=none; b=tGyI+2qmO1HA1kmJM2XLHrze+J0JqWJvPZ7+CFaE+nDHr3HJcotFusf9bW83LrwVHR4yDRjoE24ZF0M4R4+/4bfoKzkFHOx8LUHbW1gM2W9CRajpNF5eUjHv8pPAQohDGiefTcyeErJ8IZI3My0K2bXL4ldmNZXdtJfxdC7p9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817287; c=relaxed/simple;
	bh=1i31BeRMFT9Vp3AcAN/RmvKH0I2VjZNU1gijNLV1tQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4ZrBk7kBIl5blZOmm05CFg3wa8vzp2XnyftIR/hbxigM7jvFet+pzI3COyWlVzenT7QGJI4a9sEWy5eSd/fKTNbrOQ6h+y49gLPV3Ot+gxDqw/cift65MWT4W5ykSXiA5jM8pjNG4/8gqz/Uvcsi3p1Y4O4FMbU3qrlqhC02+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAKIKa1Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KwbZ/tou; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAKIKa1Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KwbZ/tou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788817283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaECoODu5PWLeAxmwxwy2TeJHbPjZIpe/fjVw/Ok5Aw=;
	b=cAKIKa1ZYohFm/NhUl+RG8nJyjM+r8RcUeq4UfqyixAgMboSjp7T8ydcjktr1rURruCSXP
	arTs/cHbaiFjWflxndWbwgjlJzxvq0mk/CX9uxR+cVjmx+l4n6FV9nzSv9IgReOiCTwXYD
	C20ACJFffn2Q91m/Oqniige6GyrYEVk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-iaK0c-pjN1ykFSYFvAqy6A-1; Mon, 07 Sep 2026 17:41:22 -0400
X-MC-Unique: iaK0c-pjN1ykFSYFvAqy6A-1
X-Mimecast-MFC-AGG-ID: iaK0c-pjN1ykFSYFvAqy6A_1788817281
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-499913d1a79so26388305e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788817281; x=1789422081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaECoODu5PWLeAxmwxwy2TeJHbPjZIpe/fjVw/Ok5Aw=;
        b=KwbZ/touk+AoUhpw0CA+kuWP4KJaWRcAs0VioiQxmHKxPu3u2ryvllNKDnaMU1GWu3
         U1pvRlogoiJOzpRfgLS1XYugdwusm4fV32DY63FJwQOndhcRbD6css1FjEgq5muyJMrm
         rodi7NG6Vsxa71/PB6KOwoVUDzb3cka4Pobt+euydUgxhycKec9zbo1CuzwB31lHlO1n
         zIllMmJXB0vgkrY7Lw+Gu9QxW7QIp6z99phXK3b33/GVYptr4qxyC9lu8a1LKea3BcQU
         zk9Rs1JO8+xIPDqqhGuNW+Bk77hTMpTDUFbY5Hvl/YGOhhNpGV8DPQqARGwNiiyFCkcX
         1+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817281; x=1789422081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaECoODu5PWLeAxmwxwy2TeJHbPjZIpe/fjVw/Ok5Aw=;
        b=bYViP1EDlPB4fNSeGWqrDptajuzCYozapZeDMN2ImWy89EpyBee+oHkDXc8gGZrAyL
         Ysu7ujTVmK88VFtD8bGnbi/KZhq2H7Pp8K5UPw0g4VKn7in5//QK5x4BTvx4e1Zpjyq/
         t+TxKQ7vkKgFYpp8JWMvygh4UxV5u/dW9QhTSg0WXPKL8n8z9djOgWHkOig69JCl3c1k
         pZkTkla0qcaO/nDl3dkwGhxxX+z2lOc+d2GyxWVmPXUnGsRLDvvNqg+wVajpikmWDp7q
         pJ1sVFvycrPaKxO9VS8UTL+qtNGJ1cOH8ZspJrDF4bwo+Yrxe1uTYyilhTvfF3og0DH1
         XHZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu+2Yvw8cTF3MX/ZVgczibk1r6j8qPjnqlwezqM4XlZqGkn0Ca3HpLSWBJQpTAiylkhtFPmV/4QWi0cCM=@vger.kernel.org
X-Gm-Message-State: AFuF++n1IjQ3ZHuC6qFjHuESZp6keQtt4FQTKIwvicBxUOiYMx6/IdAJ
	D+bc1ImfkCiUWgYtnJcJmn93WUMms953OG/TBcykaoc0maTVrBwBX4Z65GGxLmcGUnSoohw2o2U
	7+9ntCNrmp5EHMMzsyuFsb1jdZOaLzwcIAvCJqhdEZtCrtsE987Bo0uBm+KSVzoHrSw==
X-Gm-Gg: AYBFou3yZBMkhIeZva4fAkbw5y+bASXf2Z4qEwlVzQi/UsOpKk5kXHsDlGpOfuN3rlP
	+luOl4XjIs3aJRJmpOSJlRwqXaDiGBvAKCCPUCPiKMEpg3m3PV+1kXip1vn3jEAtdVimlZHPUz4
	FFObqLo8ha51IXy4bYQsLwTPVzwd5/zkT2gr7S/a3BF3yGbvKs/K/XroiWwXkVbbCAcqfkN5n9n
	AAdatT5MNndH9YO0nbVSFF2pXsljV8bPoo77mLBf4YErGcMV4GEVUFVDTIGN+1pz0NsRlsM+ONy
	ZPyWAiGoxdpOpxpPQ98+rHzI/grd30IbYJq88f90Tx1zqzD0JU63aooXwCI9HDVyPZOytKUgW+m
	P1fg9bbsjYrPudnvBl+dX5Tc=
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr320765725e9.5.1788817280973;
        Mon, 07 Sep 2026 14:41:20 -0700 (PDT)
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr320765175e9.5.1788817280462;
        Mon, 07 Sep 2026 14:41:20 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm892607965e9.0.2026.09.07.14.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:41:19 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:41:15 -0400
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
Message-ID: <20260907174032-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260907091033-mutt-send-email-mst@kernel.org>
 <ap8rCQII9fASEosZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap8rCQII9fASEosZ@gmail.com>

On Mon, Sep 07, 2026 at 11:23:19PM +0200, Karl Mehltretter wrote:
> On Mon, Sep 07, 2026 at 09:13:28AM +0100, Michael S. Tsirkin wrote:
> > got all 3 patches now. it's a good start, thanks, but they need
> > a bit more work, in particular addressing sashiko comments.
> > I'd also prefer patch 1 to be split: moving code from pci to core
> > is separate from ccw fixes.
> > 
> > Pls write or at least edit commit log messages yourself,
> > after reviewing Documentation/process/coding-assistants.rst
> > 
> 
> Thank you for the review and feedback. I'll work on a v2 now.
> 
> Karl

FYI I picked the virtio input patch, no need to repost that.
If you want to fix the evt leak, it can be a separate patch.

-- 
MST

