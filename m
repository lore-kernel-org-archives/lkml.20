Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794616864;
	b=PqJjoNrac9iOVLBJuK8SGGl6gt7gjXISuaTV/cjIKsCIvJiiAkZviVwQCsRkZQMXxpwz
	 ga9+vR7LSm6qCHCmOraD4oBZrD2DdmqBUSwOxuuw5D7dLRBwX6CgxiM/daW+eXK7eXEvh
	 GvoGyKJBr/Lc61Scr/Rrp9J5TS9QY6Gz2B6lYZlFkLO4IL69XFrMXXC9Z0FcH090ohFL3
	 oSEt/cfoj/j09exfVUIwxZmfj8wkzWJxiin1ESXBsknApToO+jVeyM3H8k9/vCp++A97F
	 9VqRwPpzAiopBTzCux/mV7KHldihRLaw5xtccSMUTjgeJjJJuEy26ao0Oh8XVXTSk9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794616864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cKgDGjy2B74ENJy1584O13LQffNqnk/1zJsbOl8Me14=;
	b=SNT2DjyZmffsD5nRKoin4qvm2OCHRd8WQDYxlczTI5WH2Gaa9s9i8JmmOuih5YUAnIf3
	 Pdi1y4M/LvQ33WI8Mpp1m5QL8QAOlH0B8F+6Hk9bCc3HJVPNhCIs4bOmeNUwFU8QpIqUY
	 oSD9qsJFojeZU8AcPUFMqgHHuTdAr/skHvCqrgyb53rStmwb8AzRiutT+N7N2kjCuygPC
	 v0cbVdHo8gpjCoDebrsn4vnfwm7JtBrMd2gZW0exMHTVLNuMDGb+jtvUi9x1OJIs1dVBX
	 ylJdqb3BHj9E/m7Eft9BO/Wp7zZKJEOFO3bXpPcL75AXktN1fSTX6/GMZBT1YuXU0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HN34nioK;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF32606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF32606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HN34nioK
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5364042eecfso36986821cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794616862; x=1795221662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKgDGjy2B74ENJy1584O13LQffNqnk/1zJsbOl8Me14=;
        b=HN34nioK3GwytZ6ENXeK5/4ZHn3OWAEn9QE/3bKGf7xE+4VVUVmiNDdgyWB0RzA9Ku
         mDZ6MajxKvELvVS345v25G+urfkezFWbOwqD2Ojs3Aam1dXxPqJI4kcS6QwlcbCcBnfF
         7FS+qVCeOvtc/JlFjkQKjZdFPn+uCdGiI4IF0s2z6BKzwMxwjIh9MUoZHfyPhd5FTbFX
         ytZHnVChJEFjAIf+89plQung8pqhQwtaUJBVzC6xXNfNoDzUfT4+3rPbaCdhWI380sKX
         15qh/ov7cX9X683LCMZwWIYKIHHdjoAlhmUBUHyfk3zjV7tZ6CDVorS2srTtqbp7DAHh
         +AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794616862; x=1795221662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKgDGjy2B74ENJy1584O13LQffNqnk/1zJsbOl8Me14=;
        b=cnjUocdsZAOOguFH6n/1YxWJg6rZsbaqh0M15iZmkdSdiXmsRZ/7hnQYLUDKivaedO
         BrbNxnXKxB34kIKbeSKExi93ZoUpYt9CdCFnNoQxBTCn6Xar73AHg8+SZU+XXAXNxvFa
         5xarWpW1hFeqSA8VmExJnmt0evvWPah1+7cFv4zYPCaYih6zRQnR1IsLWU0Zl6rGSAgz
         iB3gImeeLpOefGrhua85F6lf3uyA6dozRKjworaNG9ShS6mSC90JDHrroMaM1bGw9pVW
         Sg1bfoy5qWkgq19MhWdpRmLTntkGm5p40Hc2L2+dPRjB2YqSZk99qcIHQFwhQBRk1Aqj
         CjBQ==
X-Forwarded-Encrypted: i=1; AL+hErHEBFxhVLwqTtEBiBPaopHN89wmvuFAVq1bMHscie0p3NHTvsKW/ntaKyTaEQFUP420tmbqeFlmX+pbPxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jA0j09ttwv4qLQa/kpMnYjh+Ql0yQE5aEaUG0zhLWpjXSwMVA
	XXCTyYOzRmAYnqyq1pyl5DjsJqDZExq1v04VNGUdQbQyURREKuZn3FaCgyPpPnfX3oA=
X-Gm-Gg: AYBFou1e7r6NJzptvXmCPxB9+DqvGdywD/OhuaZbpBtKfMCGoAss2k/zV7uK+1FMHFX
	/S6ehpiW5uAsg/YoijGW5PSmZS2R02siWikrRxWwgtnZOGX0dXnrzYeXOe2ZbWqLhS9N96/6LWx
	flVmA9Vd2yBlWtpW+EvYuxT3BGF5d+WKCcyBJL3tHfYq0mejA9qrHYTFearKKlZ3ByWTxO9wZWz
	deRSnWemydUQQUQ84akA4/a6v3l2N4XzPd24DwpV2WWcWZRe5PB1i0o5r2oFZZIsmDwZ7shO0l2
	L4TusM2Mi91eOwkZUofyqRpW4W7t7ePRE7AwYeZhw9pyQzA72msd145aH8iFKiV47Wm4P5aJaIg
	iqFSX7GO0ZrNJxQiHmB79vekayWk1xovi0v7hZIsX801r8Xw9mcw025lO2pf29x62uOF2VzZNtc
	AW0DQr2WoIVkaQ9COHJFWJ5/99w2eq9nssLrTpmCxvJpdNWCDFumewFG9Og+Od8jPs2qXe72ixR
	ftbfnP7/JlLb24jggsTHRbol+OUPjLtEyXMi6c12BhbaTEKTvpMvIht1GQTn1ulONjs1QsCqTb0
	fBsgAg==
X-Received: by 2002:a05:622a:5a11:b0:535:a5f7:d586 with SMTP id d75a77b69052e-55ac9089b1amr63129821cf.64.1794616862516;
        Fri, 13 Nov 2026 16:41:02 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1005027sm29936441cf.21.2026.11.13.16.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:41:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xS1pF-00000002PUf-1JwB;
	Fri, 13 Nov 2026 20:41:01 -0400
Date: Fri, 13 Nov 2026 20:41:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiahao Xu <xujiahao@cmss.chinamobile.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Subject: Re: [PATCH] iommufd: reject mapping an iommufd file into an IOAS
Message-ID: <20261114004101.GE2532299@ziepe.ca>
References: <20261112105945.285526-1-xujiahao@cmss.chinamobile.com>
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
In-Reply-To: <20261112105945.285526-1-xujiahao@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 10:59:45AM +0800, Jiahao Xu wrote:
> iopt_map_file_pages() takes the fd passed to IOMMU_IOAS_MAP_FILE and, for
> every file that is not a dma-buf, stores a reference to it in the pages
> of the new mapping:
> 
> 	iopt_map_file_pages()
> 	  iopt_alloc_file_pages()
> 	    pages->file = get_file(file)

I've know about this for a bit but haven't got to figuring out a
solution.

This patch is not quite good enough as any fd that can hold an
iommufd, like vfio is also a problem.

Really it needs to be reversed so only a memfd or dmabuf is held, but
I don't know how to do that..

Jason
