Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC33FF1AE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791099250; cv=none; b=bBfwsbKW81dUIjYs9raEgK4Z6Uhh4GrVeKpILVcXWi+62k7s61FtOhA2XFd4g6isfAJhzLRCggFA44u5xt086X4fgFIBOxyPKaO8Zq8JHGAASWsc1ofwj6dffF1RNz2e5EccpOmw0Vv42CeQnhsUYr+PzACr+TA6rubGnLJxy0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791099250; c=relaxed/simple;
	bh=PVwIXQQ5/WGjpPJCRs7zgHzHTHu6X07EUwTtNa24yqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhonmenyHcvKBIogibLtUceDKgW2ZEexu4udEdLKWM2TEMMsqx2OFZ903XBN7omRbemYuXNmOtJm2Rhhc5ryA8VW6cYrX0oEIcFFi7r/6k5d+2SiVboTDqS94tvc9XASUrkI2ea8Mwv4of2uPfY/rw8gnu91G9xzDAUYynPXlvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GerNWho1; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GerNWho1"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso479597a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791099244; x=1791704044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATqBSGgki2so7eu3mfXFJfLMGYQGWd86CLIs5RcaLgw=;
        b=GerNWho1PMFs3FM71jALYluT/hDPYCH1rkP7w7ib+mT0SnrbHYaxV2fodt2ANOKpVS
         +4g3FN1GvpPKMhWR63Nu7Yu5uBv8RaNxn13eX6XX5v4NT8Wus549VEaOmm/THcEgIpNa
         C6MNRyVj8WOFyZistXcmfax7a1t8Yl8emn/GHJDg9zxTxMhiINTQyAugQOuYVRSzTYb2
         4Z15R4LvCOkRmeOCt4Vz8Vgj1h3BT4kIe9s3lyziR6BSHNtmrIy3wEAgQQGJSHmi4seJ
         YRAUrGbPP422oTBGODLjn98gx5gL6aEntC3Ihfg/PYVt/8KqcPKB86YPIbeQJv7H+GpH
         qXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791099244; x=1791704044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATqBSGgki2so7eu3mfXFJfLMGYQGWd86CLIs5RcaLgw=;
        b=KkHLs5qF2zfrFkSr532oymiKxlfB5Mzk+kJFdrmbEAYlGrC9+18ubL39z+NkY6AxHx
         dMjxF2iQWey4Kr+WoPhEh3M7UMn9uSmLMeHBKgpOkPCJtyQIGLmO4loAsfWiIJiQA/fB
         A6ZD8cKb1LjbioPECxUUjd+bi7+vxJ8Saw/QPMjTW9TmdPSjRdWCGMUmprIQwobbV8RE
         OuBz0puXcLOQOgCHNYc0HwsSSsf4th8ry6z7q7fD8Zzbb9hKqPr5xn0wDxEF72eEIbOs
         ibzUDJfVfVUrV/rd5OGbzADW1Dxg+GLGsdQZPbcQrSkxjDRwTBJj3hXMN+xX0fkepaYx
         lIKw==
X-Forwarded-Encrypted: i=1; AKwUvByaHnQaekZ198GpvP4YH/5wmcpKHVtAYmO9MwaO0y0gRLDWVSNXwkIxH5TMvh1mRmtz5uZw/15chKn83yw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPHlmNNcPJcoVUo0mWTz0LlXauoH5/FWO/bzEsl1YJF1YdrfnT
	55syjbT7AA3uEA+fRivgFdLa/ba8EOc+W9E5DxSZDpsoduPpHKbLH91b
X-Gm-Gg: AYBFou2fkBZoEE1ofeBJHvSYXZHMM+drf44d0YkZ2ytiO4KxmczQux20iHQGHtmtKY+
	dcg16GufIWCERiBj6QU5/+qr7Mn1PMeMsSYd7cSiv8/ynwYiznQ1q6UPRt287SUwd6KK3FdMezI
	0iAMXbGzn7iBNl59s73OSfyFMDfaw5lTeOhymbQTDuHeHN2p1DvZGG4cN4sHEWdYnfjsAEhUm2K
	2ATw1L+JpO2bIjm2BCMYcjLtBG45xynI8/2rjd4yfOEuHcJiUh9J7DSjgiuZHPwAXDa96m0+V6c
	wR92K1HFZVyujD1IwKi74C5k1Pk08Kuo0ZYf2ME1DYNfRt5869iDZHwOUyl74g8kVTOa/IPDrL1
	/o87TASuVH2J2CGxcNPzn+KdYuKlTBBMLJw3S4U+PDzpWssRdnPCRlTmTypyDWEEO7e1lB0kftA
	pvA355BfYdjIOH8KpjQXyJB7OkNsgB5ZiqSnMsKCidvFnUtyAXJ8OClbaHKguGSmAasdZGvi6uZ
	bNHOwxcgCg=
X-Received: by 2002:a17:90b:5310:b0:3a7:b2d4:e411 with SMTP id 98e67ed59e1d1-3a7b2d4e54cmr2200992a91.21.1791099244227;
        Sun, 04 Oct 2026 00:34:04 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm5749884a91.15.2026.10.04.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 00:34:03 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Daehyeon Ko <4ncienth@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vhost/vsock: trim nonlinear SKBs to declared payload length
Date: Sun,  4 Oct 2026 16:33:35 +0900
Message-ID: <20261004073341.4034680-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179108986364.434549.5339286904514687491@kernel.org>
References: <20260930044147.3818241-1-4ncienth@gmail.com> <179108986364.434549.5339286904514687491@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both findings are valid.  V2 validates hdr->len before allocation and sizes
the skb from the declared payload, which also avoids the 32-bit addition
overflow.  I am posting it as a separate thread per netdev policy.  Thank you
for the review.

pw-bot: cr
