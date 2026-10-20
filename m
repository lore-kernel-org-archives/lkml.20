Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526122;
	b=Rqv34n00Ez+W2C5Vo9uk7lloDjEB045D/1l+XKNb7yuGlvfKWauIOdjrnJkq47RCKvJJ
	 rfBk+uwveUNYMc+PpwZ6x/kKVxB/InrvJ7juprv5Dv+/xlpfhzuS+S3UdxgzGW6fr9OT2
	 uoLPk4Ba0rzM3WqIFqTBJvag4nMYd9sDMNk13kkKOfi1xOjt/qyQtBztFqMxWQNtUiaTQ
	 VXmx5is0ExKNYJzLFSSIff5GSzjdgtx8X+9LaG9PxaJQ+kgWFIO1L70bkSb5L40Uwa2VZ
	 xKFPx2aw3R5ghdoH7MV0LQvP9CTM8CM1GSDGctn/O1THzJ72vqL33qCoACUPQ40/Yyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DC5Mr95KOFv3KF2iAi8A1QbvNEAK4XEA7i/Tzk/Q3Vw=;
	b=sD+b4QSAQvzoOCNBdn5dA5g8lpCOcP67oYDCUbSTn+BBfT1b3YhvKHr3hhxh1impgPWn
	 IXroshcCQIin2JqRrE9C/FchueLKJfllGHlvcLNMLGFEtwA1oUC76DuhwNfj4DnZvDYx+
	 leCqyZfY3TwZK7hiHn8eJY9IuYStyUDT3GDf9/8El1hqUKYMshdrqdiFA4o1XI//4mVvG
	 EbrTsbFSfZPndyK8x2t0XCPC+yykd4AxMJ0S/r9UGuZRkgumPKU/IyNoKl3iQ2DeTuAo9
	 nYTKkgi37gNrNjOMbHWwrCIQsM0OL4vX8GOfJoTKqHlRoojxWmRqdf22ABiWLdfdMlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ho0OZRqL;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ho0OZRqL
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5367cc15121so822211cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792526121; x=1793130921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DC5Mr95KOFv3KF2iAi8A1QbvNEAK4XEA7i/Tzk/Q3Vw=;
        b=ho0OZRqL5r4eCjM4AkMA34OzsHIanDDPh2NtnMmtdsc9djpMFgiMxqjzzu5D/XkQlb
         SWoD0Fqji573KIYf6/nXchzgpptoGfx9N0euiidYldAZ7BLbEPDa9EyMLKgBAeg7E5sP
         95SmFzyBHSd94wz5Kl1wE9Jia6cZxTAlga++tXhM6ORfOLBya5MnUL8Z3LR50upBe9Ap
         Cfn56zjTXQtMQy0dTjzklZrSd81aPLxla+oaUvAFOhbAAXJ0KmbnspMgT5JfdLBZkubx
         3SoaSNF5ZNS4syu5PS4+G1dATjaT9iiR6glwxobUedpVWKVqHyh8DKby2DImkFvdnzLR
         JvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526121; x=1793130921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DC5Mr95KOFv3KF2iAi8A1QbvNEAK4XEA7i/Tzk/Q3Vw=;
        b=z1zK41E8EFFchzx8tpEyXbIJ9f6Y02sUZp4KcxfayFA8diPkJm8EVeBbpWCH8YmQck
         5WgFn21KoW7BszR0nlfV8IbOfIZUj/xs9ftbwd8mYZ5Q/Zl9XxcpbuD8JU9ocV/LZCLo
         jsvHgbOE10z2w1bDwv02TrER9qW7TjeB6ZXY2Or2+IUEYfrMtyQA4RQSMQ1X8fL9ejsx
         FXIPMxNsJ8A/MfMKOCZxrK4c1ywUE9n62Pb2V0uEPYimpdSWhSurhDyIH0stEyopPfLv
         sSJPHlP8b90OhaOqLnIcTVqVZRO1rsuMcCP7/aZ7frEQ5LFw3qcJOv/g5rSsPagS64jk
         PocQ==
X-Forwarded-Encrypted: i=1; AKwUvBySjjS8vcn8RNHyNXg0kA87tCsC1N9EqLXk3yKTocsRyAVe1p3eZy+vkqbCa4Z49v7aGkcjpCItlxoGZlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKtb+tjb9cil7uyqRrVoaaPK8+o+4prajbyRFnUuIcBbxGDDLC
	XJLiQHdh0aZSFQF+gw62WEVpiLVGJlzwROB/1XSNS5oVjRP2jvtq9yQILi9YODwsZB6IBBW6NTl
	3T6SxeQ==
X-Gm-Gg: AYBFou3QT8rsrxH1pIgI4cKxYaZIzV6oYU2AAqrYb9pBUSz55ecRLGMdEWgNE/GidZZ
	x/LCGPKDa+hbforTTMO5EPwxEEZ2IY9rPAd1OKdBIvKWF3kwaIoVtELQCmTaDQ4bzR6QT+UfZUz
	dPCIn2ht5O/M/tW0FyTWbvMMpaCSPbqRRMlxoKUN1LuvF4N6NthsWgnHE9SE0VtoDU7yl+1LsIq
	RJl1mmmbcL+tew/JreYokMyMYp0MI7GdHAVADEARoDuaLcUH17FIymE4tGW0HkTvn/71/CcCF91
	4bkBV70HNl8d21Pu2MbvhA9YDaCvjG4jJbxLLZevqJyoU7W753iid0QggLYOIfPAGPcHme0M7mS
	cKLNGmATRxW7dnwXCS+JP3E3oFkoGphYtLOa3iRhBGMoDoPfZH1Y8T0yAzBRsPE4GfobZ1wo4ux
	XzXDty+S5GEUO83Fo7l7f/CWMGmUVx/goyvIUKhP95aJMdawOsPvFBH+6xQP0B1WHxl0+BKCJL
X-Received: by 2002:ac8:5f13:0:b0:536:7c84:be60 with SMTP id d75a77b69052e-5367c84c62amr86451461cf.65.1792526120653;
        Tue, 20 Oct 2026 12:55:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae7fa8sm3806721cf.9.2026.10.20.12.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:55:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:55:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
Message-ID: <01f4dc0b-8ed8-46ce-9ff3-df811bd4b84f@rowland.harvard.edu>
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
 <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>
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
In-Reply-To: <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>

On Tue, Oct 20, 2026 at 03:52:28PM -0400, Alan Stern wrote:
> On Tue, Oct 20, 2026 at 05:05:39PM +0200, Konrad Dybcio wrote:
> > A PCI HCD can be surprise-removed after suspend_common() disables it
> > and before resume_common() re-enables it. Avoid a second call to
> > pci_disable_device() in the remove path when no enable reference
> > remains.
> 
> Does the double disable actually cause any problems?

Also, is your patch any different from this one from two days ago?

https://lore.kernel.org/linux-usb/20261018164134.134106-1-cole@unwrap.rs/

Alan Stern
