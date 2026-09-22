Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F448E0C8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102622; cv=none; b=vC6Vkq/pG4n05EGWn2G0f5pI2/Nbfh+v19guzvPI+pYHmQv6fyvIetiUu6sn3PkCTrrx8ZaP5flWDPBXnfvNKTvHB5a3bwP1WjEqqDzbVqdlnQCskN2J3gPB3ipT1O1ZO0D5wLVYe9YupUg5XSi2Lv2UDlpwyUi3gSMyUKN+Zmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102622; c=relaxed/simple;
	bh=Ey1dVK+mA1HsYVtOFCvdCUUmzc/P02m1z+8IiV9BcnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zzy2LDyHwkWtfZxDtnl8myABUQc41hztTPdc2PNw74W9PNZGsoEmjk4gisTi40FZ8409Ip4/4zSbX5M/sK8XvKhKejLRbgkBBEPPreRLVzLYmZLNJBTQjShh7AM8NyWObZiWbB0q86W3zCGbxbJr999YoDiJk25BJEZGk0sglY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIhY44Gg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIhY44Gg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so568715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790102619; x=1790707419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2l4JRHC7Rw+pqUP1HReA75dDASuf5PmXyxwWG+odoY8=;
        b=WIhY44GgUthjJ87mJUagfWsiJbK1+4UPAYPDP5yf/F4dFnzRJR/V4NQZg0m1Kv9kRH
         3Xfw8xRjWa+h2i4KdU71NHILFbpsoYTjo8/995/qPnhLb2utzq6slH2c6sNT12PpgHfA
         QIPtuW8Err3r5fSEDA/uZ6qU+O01wmGmuGu5IKhSXfTbHne9qVX8fQip8FN07atJPfga
         MwkEbNwz1Szq28MumFLMI+AVr3i7n8vLnK4R2onmvxxZBJdD8/X3uf8oLtQSqse3/5Gj
         +gkzGmtG1O8p3GTHf3E+nE5yc/j/1yPV1ZvVuMpzWMLWUT35KN9DBmmEsLAuImAbgBbh
         XKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102619; x=1790707419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l4JRHC7Rw+pqUP1HReA75dDASuf5PmXyxwWG+odoY8=;
        b=Q4kJIDLOMR2Vqt/+bKl4+NsIenqsYYF6fBbwOu5UwBBHGJQIsaYEqTdRSY+TMjHOv2
         uvnEXDcHlSZYv+W9hPtjEN+oWljCEO/u3azDPXivWuRgr+ajHOgJtVtrnCkV8GFmUsel
         X1kRBT686LLOi+JVmRQz1xUzlpOsOWDiCxwXCgigng3R6saFNLITgfb5e/fod16QyGIJ
         Lki+M1cWQi2gD0ipOI31CjM517taPAbNXvXQyDbOj9C0m2uE++uSNtBCUKRSi2vxVOt8
         MlQc4dSL3mwes5OA4GSF5TgiZLjsQNc3JlTq9xmACAV9/ixGZBjrQrqioqCaSYPahv+e
         TLMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3Vnj7KDQDYgvullQO8y/nQyjM0GJA4mTp4MgHFhx/ASRWt6Qh47cl7Qlc3164Hc+JlUXa6oNlKhNuboI=@vger.kernel.org
X-Gm-Message-State: AFuF++lirtgV+SxSpZnkf/ZoNdmnYlmdh1Pchvw50w7HGUi/2ZTK5+qR
	poU8XOtf5W7+fE7BJgR3oac/2pU91edQEyu5a3sCaKvP905OvX285zEA
X-Gm-Gg: AYBFou2eGvylUQW6fkG+QZqAIFJfP/hgThM7Az9LBIxdwPybE3Z+k1vq1RepCem7Hry
	Kig2OLt89xtnXIfIaHLu+nHbdQRYp6bThSBy07l1YGjwuDUVkvObxAC6PBHXEOmpPUubhBMy8bW
	HDB2JF6b/F8MVSGI36zviprRI5fvG4cGGv7QR2k3pC3QgN5qnZCw4DniP3sD1CNlar6V91W6Ixt
	sSLhD6n+OFtbUq5UeiXNbWy9m3WIp8QH06JHE7nCkBGs18HSqAL1xV45kbiQe2PlnYJv2fwFRNR
	31jIr6Cq7CUesNWGB3OUXX48Zw++VdfOpOM9FsQNSn9R7H/iPTmnLF2RbQFZQnFPjnoEURu4Wdb
	+GDMygzt8ptMuA3/XYsTHskW/sI2sVfc6FVCmEZNewilSPRaQftU11ymHGFDT/mlOh/3beMxd67
	XmYdBDRA6NV5168cEnHAY5LvTPip81z6d0aImQjIiTCfvaqX7vp0rfV8mujTL8XHufGLSzalDjE
	NX7jo+AZPcytoQ32g5ntifG4MyC4CMRPLJ8HlnOMsehS1E=
X-Received: by 2002:a05:600c:a06:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-49fdec980bamr2359185e9.0.1790102619110;
        Tue, 22 Sep 2026 11:43:39 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18093csm13157875e9.3.2026.09.22.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:43:38 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:43:34 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Brian Foster <bfoster@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Daniel Gomez <da.gomez@samsung.com>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] iomap: don't lose a failed direct I/O bio's error
 when zeroing the tail
Message-ID: <arLMVnDWlXPD1iB6@andreayoga.localdomain>
References: <20260921083133.2960-1-parri.andrea@gmail.com>
 <20260921083133.2960-4-parri.andrea@gmail.com>
 <20260921223432.GO6283@frogsfrogsfrogs>
 <arIT5A3MR7VtCeba@infradead.org>
 <arJF9USiUqIEWB1M@andreayoga.localdomain>
 <arJ0eljPZIuj5PFD@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arJ0eljPZIuj5PFD@infradead.org>

> Please drop the return value from iomap_dio_zero entirely.

Done locally: iomap_dio_zero() now returns void, and both call sites no
longer capture or check a result.

Thanks!
  Andrea
