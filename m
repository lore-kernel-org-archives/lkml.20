Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8E3E317F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085840; cv=none; b=T8iWxZ+aJCAqcfHXVna82+Ik9uCXUCDSPH4oSW5yXU8qvIpJIcgE4xFy3+FE5NDUPje7+LNBYAjy6EeBT+KcJBQn/41MvgY3AqP7+JcTwnucx1cyMUX8QYdHDxwTBWkuC7YbxKWK3z7zboNizoPz12wIFNPVfHl1C9a7sEo+wpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085840; c=relaxed/simple;
	bh=OLr+uTnUVK7S9B5QUknUbFXuyG9qUE76WCenfq8svv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myvTQwPD/Ivkx0bryWBFUsACSSYJCrH8/5LzmXTurAWvMa16c958/mKu+KjI4pb90yz/zvmVgxMh0bM2ZVjb9n9PTvBjdw0Eo3FffnFtrbTfKfr6CWJzP0xtdoo4ez7MmBui8LCt2XyCsfl9d/W33P6XYCkbIZ269tNXCaZZZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ii0/FDIg; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ii0/FDIg"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93cbc3ab2fdso92751785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792085830; x=1792690630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLr+uTnUVK7S9B5QUknUbFXuyG9qUE76WCenfq8svv4=;
        b=ii0/FDIgY2QcfcrKUsYGwoyODlQco+va2i1CdRgwd8GvR77pv/HcHzsf7ZdP+5zZ87
         CfKJazq/V9iE3uxkHiYKkbQoM0rdFtn894a3q5qX4giBI9JEZdj/Bh6ef84w+Td4sFQ2
         rGq3S7APgrHACsrUTohrYKXEIgL1W/LAS5LTXUZeGkZ9aDfjachRAZdGatQBcFdQ9hUW
         OYxBJ2lt5YLbquuT/zr3d7Qz88Z3Ye0ah2oqUw55AkkTl6whvDfss4KAj+8P4vLjsPrO
         oW+OlyxIxKDcZPJn3Dz9RJ9kCB5sz6SU60NlqKQO7DUdP5XcZz5A//f+4FLqLNaZNMUi
         QMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085830; x=1792690630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLr+uTnUVK7S9B5QUknUbFXuyG9qUE76WCenfq8svv4=;
        b=1x6N9SvHEYbvoa3aEoKrE8efdErHwck2ZzBHKlG4iAa8sme1iaFoyBRfHgSeeatHnE
         QeuwJJRu0Pp+Drr5OgD/xIsPpEfbeJrOVCzm/JUhxqaXSalBgpHr89o/mne3heHWXOZc
         gTiGJvCfjXZV2Xbxe+k7TyF8ygil1gNensRQG1pqNpWLmAw5gfcKJ+S0DwKISSC9CuZA
         LO8X52qGiobjDu4QupWW40s1c26Kjvz/7zUHbc1MLgbR4Wwds3S1JlXOiHjPLNqAUTIM
         JuicsoMUwUHHarfrLkBkm7F1tY4fI6Qd/hxoNLaGrl6mNFZTTyHjoO3kbq0X+XEZhTMo
         IhpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq1Xw78SiJ6gZHkdSaijfmi65lU++NTsG2C6XSkV+/rNSz5nTFMkZnlH1M6Eg2XBPwEKHXneUnEwH6hfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLelRtED8hF+xo54rfnCTOzjvuZdIQnewdb6xok8i1O0VByruiM
	RSvOv72Bh2l05/0VvP70iIz/uuxTD/+f6f79T80QOlN7aGWDVqg88Jb/cf6h4Yek/Pc=
X-Gm-Gg: AYBFou3hWU1ehClo1/7BaahihvQGAbc/dw/XAWurUU3d97uALqDyRTlI1uMfbO361Do
	05/0Qs4R+LToIWXJidbw3esCsX8hWCjl4eapzX3hCyZJsEoJ7RH24Pg4GE7JmllEq1/LP0n+M5/
	1AQC/ebp19TvX3KlXMbZSKxRcrUvecy7moRsdkua0zxuR/FxjuXP10PH/YkseWxFR0MH9TekkUP
	2cT8U5+4zkzYQbLuC58pMziGs+AYBcJDW33FeVxkX3prAwbNLR+i7ISqX1bHFObjjMAdPZyY6Uw
	Y007oDmm8iNeBs1uBp95wM/WTWW12AAlMKmQHvGjfk9Upq+RcrNGMyU0NYjyagMEDQ3ytKmofO+
	W3YOyGxLGCP1fAay/tEkTYkUbsYo6W64FcdsAKU6VS7lSfjG7kdGsdGqgyk+lIF7C/jUd2nvAkK
	u+jNfSzjAkK2SNV7LWw5cnvNtz9Y7QIFAWcmJ+GlHmCa8OGKX+RBTxHMczc6+eDnZt6hjbEo3OW
	2ypHEC9XXJCcN6WQ6zVHiQDhgXWnT8QnfkIXXZvaXN9vMATmLtWbpO0
X-Received: by 2002:a05:620a:469e:b0:93e:c12c:fbce with SMTP id af79cd13be357-93ec12d06a0mr3209910285a.74.1792085829213;
        Thu, 15 Oct 2026 10:37:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5086fe3sm818646485a.37.2026.10.15.10.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:37:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHPO7-0000000H6B3-44RG;
	Thu, 15 Oct 2026 14:37:07 -0300
Date: Thu, 15 Oct 2026 14:37:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
	x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	Kevin Tian <kevin.tian@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, xiaoyao.li@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] coco/tdx-host: Initialize trusted DMA on all
 capable IOMMUs
Message-ID: <20261015173707.GV14213@ziepe.ca>
References: <20261015010705.1973284-1-baolu.lu@linux.intel.com>
 <20261015010705.1973284-5-baolu.lu@linux.intel.com>
 <atCPY6LzHd4y0Ywh@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCPY6LzHd4y0Ywh@yilunxu-OptiPlex-7050>

On Thu, Oct 15, 2026 at 04:31:31PM +0800, Xu Yilun wrote:

> An alternative could be, bringing up one IOMMU when an associated
> device requests link encryption. Then a no-tdx-support iommu fails the
> encryption request naturally.

That is what ARM is planning to do. I think it is reasonable to
trigger creation of the secure iommu when the TSM is connected to TDX.

Fail connect if the iommu could not be created.

Jason
