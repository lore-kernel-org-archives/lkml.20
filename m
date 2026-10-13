Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE75187EE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906442; cv=none; b=axSutA8z1NwnPKXh5nHuWNxkvV64TcusbXrIdoo+UYCk2FaNqrcSpoYUpXc0n3FW7/bVA/tbiRPNCzVMo9yEx4BhuVYWDl9BcHenTecemf4MuD9ZNa/GeWap4E5Szm0Sl9zJZbVuxA94qWf6URitFSorHc0QYpBvmOXDWWX1Ccw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906442; c=relaxed/simple;
	bh=nqpdu9CR59AC2tddVN45hFHH0IJa5teU9ruMmfaeU+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmLGhHkfwtm49pqOKRvUBg5HPWzweYDvSWJu0yVZ27mvsmrl0n7loGsttebB/eFAcyq0q6RMmuneBNCa/+smUjMyondJKepK8IrTCzx0O/ccOePiXjpgfaKfuhE+1i3CRcIQZAJM7EobItoNjBOPwA6JTMfZw5x3f8ylEoU3dC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CM5yLK14; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CM5yLK14"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e86dce4510so15551855ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906441; x=1792511241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfdqMX/IxO6QSDu5r1ASHaftLBVU1+YpLM2EfGo/COM=;
        b=CM5yLK146p6HclsKHvKM9bKAhBqPZPzEA7o6NeLR4HLwEWtwQJQOiQTsDgNaeDcAgN
         MXmteXLPA+IiFFp0zGPUTtgFWs3RK4ZgpTrIqB3uqnE6s/J7Bma52S6klmT00iYbQBKy
         2gxXtEnHudg4gWZmWB3Zb/o8xIB3DF27cWKE9/jtknNGrD+Hrv/1qXas+mPm3f1rxczA
         h0R0ZfK8TyBHAmu36D/sUMgGBokOhthTz1IR4bjLLAQEEGFkR4f6Lq77WsbLX80wQzg4
         kJfCwQbbYdBfQLXgFiAtwXML9NwuB3N6zoIxgU0YqFiI88vPKNR5ajqHCaP3gEyxFZoe
         I+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906441; x=1792511241;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfdqMX/IxO6QSDu5r1ASHaftLBVU1+YpLM2EfGo/COM=;
        b=0GDJSx/uIagkhSLN/4enXBHsNwd5XHpPsU9Z6bjfTPC2IMh33/UZXsyqLslBpNLIL4
         JjDzdW9BRVmn1NEYsWx8I2X/iwKs/b4kfHdga1nskPhQkNE3GnxHjtDBT6GBeD+IGSUt
         QkDgiRFifKJEZd9Doe3cIvEJW47ew89l6mSIFxpcxvsgz7lWln+U+VA+e5nfEM8a0tHL
         WN8O6HxF8pZEIbF6Px0rN71Z4jD95Wbq7s2FwtuQFt8YxswlPUS31/vS+B+PFE4AoO4L
         jMwPEOplmomJ+QSZ3DyCGeJK34IkXHT+1+g/OGmQdw/BNVpHZOS62QxYUqPDvYtLdJDV
         rFgg==
X-Forwarded-Encrypted: i=1; AKwUvBy7NZ5leNmHczk28geXSllMJCUk/OMkxLwV725sx9DaS5dDmJgJE+6rfejjuImPSJwtezweAshOGJES7Ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGM6QcYAyEBIz5/yc0tQkJacLeT2t2rg19mnZyIfK317GvP32R
	IZrIn/s+HgedgQKKck32Fll/fAXJsGOoZwRJsJPwjN0kbz+CEZfiUVZwFqBHKNTi+U0=
X-Gm-Gg: AYBFou0WmPKvpI6at+0N2zUXddsxXFZSMC+fw5ZZ3LPqn5I4nvONSH/2m36zZxsZ6XE
	NgupbUEUQgRD9ZuEG4A1mzBdhE+DGXjqzO2hKLH8gltqOeuYhIMTeBm+Te674kYt/lKf8x79eKT
	7PZ6bts4kWLSYyzgN6Nyyx7YzTAX0j7fBrnA40/qUn4lXBynCbQ8bIM86CGWgXgejhVIzWr+TF4
	CWeyT5ieecluqz/nGnhVJ9iHpVQBB9YeHM6x4K6xU5RUYcAcbWD6zQP/ao4RgWoywXmAFzDcbPa
	WmmuX0lwqihESks4iAUbHwLYAHCmSfalI8KxKJhpg1g7FVDNOFfcCH38+ELvT1eKUxAFa6sj/m9
	U7vRxButnrWDR2UgFqgdZG0gsd4XzzDvi7H9zRWZ0BLJ7wCoI35xqW8bAxviyIZrCY8IvDn/vTQ
	44B5f6LFC4IfBBs6ywSedrHuQgAYWMMkAwo2f+E/UoDYX/vnfotovJLf5pmbkdt/7a+JJWgZh9o
	LXv+T3yBJFRdA==
X-Received: by 2002:a17:903:37c8:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2e90cb5290bmr23619435ad.14.1791906440730;
        Tue, 13 Oct 2026 08:47:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adc4:c3cd:7c5f:3991])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0124csm58828005ad.5.2026.10.13.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:47:20 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:47:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
Message-ID: <as5Shj4EKjk2H2AU@p14s>
References: <20260926041943.1124650-1-oss.patchbox@gmail.com>
 <askjD1DxFvrV5ND3@p14s>
 <CAGG=RgA04aBS1QkTWoW-yjMZ0MxB0x3bTM47_MZr-yK04DPDVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=RgA04aBS1QkTWoW-yjMZ0MxB0x3bTM47_MZr-yK04DPDVg@mail.gmail.com>

On Fri, Oct 09, 2026 at 05:23:42PM -0400, Yuho Choi wrote:
> On Fri, 9 Oct 2026 at 13:23, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > > -     list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> > > +     list_for_each_entry(vq, &vdev->vqs, list) {
> >
> > How is list_for_each_entry_safe() no longer needed?
> 
> The first loop only clears the pointers with RCU_INIT_POINTER(). It does not
> modify the list, so the 'safe' variant is not needed there.
> synchronize_srcu() is
> then called once, after that loop, to wait for in-flight readers. The
> actual removal
> still happens in the second loop, which keeps list_for_each_entry_safe().

I agree with your assessment.  I will merge this patch patch when 7.4-rc1 comes
out.

Thanks,
Mathieu
