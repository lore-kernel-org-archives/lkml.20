Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD937DE8D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427031; cv=none; b=SDA1sNosZ5k7jO8yovdpl2t/jUHFIxSMJOGPE+37JFy7m4Dil2mfZ2A4jGt1Wuo0yD9MnoO6C4ReGlLsFAOdlloVKCNp4MN++N/P2rgjgjkpCebP2I2R8FVjI9cBltgSFSyvEOHTZ6sUWfEYp1Vku8a5SB2Z91bloORMiaZvUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427031; c=relaxed/simple;
	bh=OL+o6VJxKZU1tR+6CQ7kZmrOTd2Cibz+iH5UNVYewkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSPpdnrcgQTH5STluVZrhQZSNkXKX0CSieLP5tRSK0DD67pm0mDYH3+xZR58MRqrCCP/ZRgMv+8rgy2Is5TLnF2jh4LGh7IhPvWTalpKMEaBb//a7ud1XF007Y7aQLsQwVW3K+Qs5bsp+cFVfIzKZhPtUjjMPuIiVo55XSmbKGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5Fxb/0M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xb1xU+Ra; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5Fxb/0M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xb1xU+Ra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788427028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OL+o6VJxKZU1tR+6CQ7kZmrOTd2Cibz+iH5UNVYewkY=;
	b=H5Fxb/0MXKwdkS5njBcv4xkqYHXOwZY1uAgmodtUMO2xRu9w5q8cryjnQh8iS0WFU8nsRW
	qIpKA+pt/ckoGUWUCgGTjHioaPwqm95/ZQEOigyy7vIUF76t8cAMPNdL9TMYtq5gKU0P1d
	s7CXHsIbsb7u+r+jg2066ybj61gfR1w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-P49Mh54uM4iyOfchFQgFVg-1; Thu, 03 Sep 2026 05:17:07 -0400
X-MC-Unique: P49Mh54uM4iyOfchFQgFVg-1
X-Mimecast-MFC-AGG-ID: P49Mh54uM4iyOfchFQgFVg_1788427026
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f6d70223dso1484594f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788427026; x=1789031826; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OL+o6VJxKZU1tR+6CQ7kZmrOTd2Cibz+iH5UNVYewkY=;
        b=Xb1xU+RaNf0+Y116eRTa93AfVO+lnzQMylgpIkkMgg3mmzLy1x0vNqPL7POnMP1sWj
         WXUVdFkZ+jKLwtj3vFLeHy9KyPmJ2jD0Axm0iUNGQXEbftn2ueeegxfRaXTrY4JGtQOO
         Oo3wD3I54m/cTu02jU94pr7WwontkevOaDeXeq4e1uwgwmD3bf30SIrocyAC+4x+iTKj
         cAkjeKfFz6nPCRuJTlLVlaGJ9Cz6o/6odhlLiC/r3L35u2MU88lWlbOOEZo1P6JWgi6H
         VDK8LJ63tNq/AH1vTuoEEdqPprDyVygU5INI8bHIR5u9jFrwU4hA09WjJUXENzMGX8z0
         Y/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427026; x=1789031826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OL+o6VJxKZU1tR+6CQ7kZmrOTd2Cibz+iH5UNVYewkY=;
        b=TggjQJxvzjPmZtqs/ky1NYzHb200cIgFlTN/25aD377mHXz8eD/KO9cR7zm05mPw+N
         XgIcHFsqjpILdzdJvXLPyCYtZfDUki2ZRuGXQ8xRa0j+MahawZhju8+bfg9bYhHK5iyq
         PnJXnwuQFFbblLppl+E+gdajAwT1LSBF5vdLEwxtwl9Wt6c7/aFcLIJBBVA+Is7fH6Ux
         ixild/Dgpvkxbty07eGFGwIPzfVJ7r0UQjqHwdPKCE5ocNKZT4HCqcc0yDp+vCJ/Hn0t
         HRjBc5F+f5ZZv/iwV/PoCTM2ZOZS/F2U3oSXNLuO6lPmn/swjAxzUWq/RZ9mOYzHCAgf
         HytA==
X-Forwarded-Encrypted: i=1; AKwUvByiwLpJzk1ET5LEk4rquehzhfx6QGmfVKvDSMYggMzzOKCYlmIyyxyYvQrwAT7S9PFKnKqkGuYV5YrvU28=@vger.kernel.org
X-Gm-Message-State: AFuF++liNadl74X2uQ0nHWQ0uISWUQWItkwIuL8kUQfmOrdBP3BMxNLB
	kblqT9k/o6GnS9wOryBo/cpMpWcA7nzhedA33PRYRUiLS+MTAeoxmiqtWvLv4xkdGperl+cT3O8
	WRtTPM6LdH5lnAVgIZymR5QckmVtmRtaDVBlcwdbvdNGLsF4XpUsD7oDvf69l+zjfLQ==
X-Gm-Gg: AYBFou0/sGwqKkCU2a7djmzwnZ//or7Cvhd9Xf2vEpkogHRzI457mEMVflRYf8izgym
	iP03IJz4dc2xfxUPEb2ij+I1+v/j15FdIKdZ2KO4RBg2c/UJgzsB94ZaTk3CrI4NPEfuXBszvSf
	1J/czIPPGTYPFnguwhYCJt+brb+i+qRVEOECyAKu3SD+jT/5LHoTgx9jX3SVS9MVy6SrPpfYU6S
	ER19dSbB32j5or9GLnRly3yvBoSJkmGXmpYTwxzyb/cImxh1usndt6F5f1HIMhtg3B2Dcl0B7nX
	WCl9Y/eMJSSMN3oYXRT9j7Q2fVOfh38Cx/v6KLn2+lL7FXbLedDdR4j2U1deWQxE7x/FK0Ynq8e
	at5IM4A==
X-Received: by 2002:a5d:5e87:0:b0:485:8101:dc40 with SMTP id ffacd0b85a97d-4858101dd2amr1666496f8f.9.1788427025859;
        Thu, 03 Sep 2026 02:17:05 -0700 (PDT)
X-Received: by 2002:a5d:5e87:0:b0:485:8101:dc40 with SMTP id ffacd0b85a97d-4858101dd2amr1666366f8f.9.1788427025353;
        Thu, 03 Sep 2026 02:17:05 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.169.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm11736036f8f.13.2026.09.03.02.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:17:04 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:17:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: mst@redhat.com, linux-kernel@vger.kernel.org, 
	Laurent Vivier <lvivier@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, jen@redhat.com, Jason Wang <jasowangio@gmail.com>
Subject: Re: [PATCH v2] virtio: add Eugenio =?utf-8?B?UMOpcmU=?=
 =?utf-8?Q?z?= as Maintainer
Message-ID: <apk69gcFCbt8hDcp@sgarzare-redhat>
References: <20260903081831.2129729-1-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903081831.2129729-1-eperezma@redhat.com>

On Thu, Sep 03, 2026 at 10:18:31AM +0200, Eugenio Pérez wrote:
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
>v2: Reorder entries so M entries are ordered before than R.
>---
> MAINTAINERS | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

