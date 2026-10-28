Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198197;
	b=ce27gvYu7+l/FUZGzM0R5DYR3+CUSpwdQcmBLauS05Bc2uJJZd61e0Kq8RwuggihcUna
	 KO3KxCCClVE5v1xex+ZmKGtTxWe0uaTsJRzbOx8Oic5QmQboFVf0FL38oHG0OUs+jpcvW
	 qqQzbFUvJ4iCF0bD27UPs4z4YHl5idpF9RKfKtNgCFL3knJq/9Q22O0veo1HLmls3j+Ms
	 ztpkYlOQjmLhQXKWuk6/eO4ZTikZLJ0soSjw+pkQI3yRJb3cXQ08kf/it+6UZV1GYtBhV
	 p+3pL7ipflH8EN7St0VsJVEJqMmhUU656kaOrBNMGtNsYU4HZi0tgapXuJxmpiGA/nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198197;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=ijpa645Dp/BzVPv8V3ZdIcjHBMPFyynjV7dTxbeuhS4B2Sjd0sihZ8jmIeOpxPnJWveY
	 Sn73OnvxEQ/pMqlBrRoHnQDvBLtmAQwNcKJIRvb5oxkksVPe4uHhUOsiyThk6Ey1LT+kL
	 /CqV9EVOiaZqFImcbQCyE1J1LAh3Cjltv8o6+gZGTXIQyGuJQs3CGQVFcUSSwLbhS5QvI
	 VwW+ErQRCVMPaOtRz0ASFpalXKTbwd+IcC9T2CSlJNeUyPFSJJ8N9CccfM8zXqmpkoKJj
	 OSiAJNzm6USehrt9nPGycy6AqOU0BWq6iXL92ngZF5t94XfFQIiZjVe99o2FqD35DAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CA360A2603;
	Wed, 28 Oct 2026 14:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CA360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A381B68AFE; Wed, 28 Oct 2026 15:36:33 +0100 (CET)
Date: Wed, 28 Oct 2026 15:36:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-nvme@lists.infradead.org, kbusch@kernel.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, kch@nvidia.com, hare@suse.de,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] nvme-tcp: validate the TLS handshake timeout
Message-ID: <20261028143633.GC13429@lst.de>
References: <cover.1793188633.git.1075151112@qq.com> <tencent_BFD509CFBFC7E76F10959593270DD1CAA506@qq.com>
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
In-Reply-To: <tencent_BFD509CFBFC7E76F10959593270DD1CAA506@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

