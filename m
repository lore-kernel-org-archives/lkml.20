Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F644A2047
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947255; cv=none; b=o4Gq8RJyiinhYKKdngWg5Ch3i0fHytMEy6YvtSYuQH48q1qnWniDxNUYUTzvreiIpyg1Ys8GXX0JJ6kLaFxiUdq4cnSzoP+3sciSYNUZFKZ0YfME5OMSSVbj2TY+3f+mekEvBPTDpJVRr7lePCFYSqestgtKz8pF6TqqZ01LK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947255; c=relaxed/simple;
	bh=QQHMnrbHAllQ1PVxxzpZB612BRuLDZabVOOMwjxOk4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgaBlcmiLjHhjPNX2wMNb1+oWFthUHn/Z0phrXqGTPdp+EevThGkC9djd35U3ffxIFAAHm9yx2x36Llx4RtqLNE4KXklxyzDg82plzpFglx5PbM2WqDG1KVbbVUDt3dD5/Nabz60lC+RPwfgmvfBRkEkZXPjjfLUBa9j7GCTg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqOzefhH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqOzefhH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so57420465e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947252; x=1791552052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRit+4DkJJMFIXTVgztzfNO5zcFZy88SGjfrumMDB4A=;
        b=iqOzefhH2QhhdFm2z5xIvBRZd1nPUXza26UaFXPquL9/AuMc1loIfFlYnInBDSNgkO
         7L8m7LufHzQZAHOFsYyL/wah9EXROeHHNCSi8Tnocga8geUXJg/td6A5nPchZGIO0m9B
         vY97L8FKWOACBLIspXOY78EU6tOfBaL5OANSVl2qDKGe/bxLGreYwHMx3IMOH9fw2yre
         YmRecXEPD3V38iWXm/6sAABEl/v3unPZz5/KGO/OMIO34WltI7q1f9IRQeWxOhrvqh1g
         Eopt2flpGaCgW8IGIkwLjPkCwxBBJqjP5ezsuuFm5JnXl0/eNs1cFFEdewBR4qCrY1sG
         sc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947252; x=1791552052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRit+4DkJJMFIXTVgztzfNO5zcFZy88SGjfrumMDB4A=;
        b=wLL+RIsbsPgG9I3yQ7/06OELQi0+Yslxg8qJr3d5zGN6IwnNY81gRR8qqHCDNbU4s3
         M6Dytgf3+h7Ejs9haXjem6xh8uiCAHehRi7gDX49Qa88wwozZLVcfSV5eKb5uTIEqTWt
         jB6wvhVzbpY4FHBHNP0xERy5CV+Uoq/aRj/4pcLzapWfp1fN8Bwkyko0un+Vd3w8tLr0
         vZwUpKW69yW7bqauPxVA0t0VmzM5mXSdJN/OKxiVbcGOSZgZDWAqs78Zcr9QZbaIEGGg
         1WrYi4d3YV+XvOK2MtIs5MQ3uwKwSYC3Wn+fLL583+DmskzxaZD1zi9eNfUA2vbMyzIz
         ozTQ==
X-Forwarded-Encrypted: i=1; AKwUvByv0vn9bfByA0BIirPQSfaUVu/0b0mUKwXfM402SEXqoIrwOcSDeGYNL6Kyjas3yjv2N4jhKrKhvjpt8oU=@vger.kernel.org
X-Gm-Message-State: AFuF++np7Yl0oMD5xiqE0hJbeHf8wQ6eG9AHzU/vUGgOPEthah7Ydz9n
	ZnqMKF5rP8XlNVEFLW7xPvdtq2o9H7OCJeypDwR1scb3LaXrdfJWQazdh9VC+ZhlLYGokw==
X-Gm-Gg: AYBFou2jFZCk7PZHU7mTwvzNECLJGvr0+M7gbduCJFYfmIc37Cb+BXs2UCtZxnUVWxa
	vikx/4Yp0iqByRgHGlufkOT1NmjyvRQ82QLH06c0lnMr/FZzmSRySg/ynW2lE6PA809zO6NKpwl
	wKXqP19ubEguaZN06uFS64Hg09q7iVoPjsqUvc+XYLC4dSIDpuRuceA2FihqjdwAuO0jsI7uE9I
	2kd3Oy9hDueR652U1486SbMZURX8YfLVJ3awCCa71RYWzeXVkpmr7FjytyCGaDdAnyCkOM6r9/x
	gklbKFjS49cEmD7QHh/WGPHvD79DglwgBw6rAnKpHabfr3zADlSVY3Z9OAexQuBDmYG670qozER
	TxNFFAw9YXIlkWVjCdhMYEVZlRrYHnkec5PmsdeaoPcso68KYdvum40rZt79+flvz11j+vIH8qr
	F3gwWlcd4y7iWsy5TAQryzh6H74MaQ3TD+z7iqocNljCGcHYKB/fInJFJOxo0Sd6rl6SE=
X-Received: by 2002:a05:600c:3501:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-4a02758ed05mr53703585e9.31.1790947252094;
        Fri, 02 Oct 2026 06:20:52 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0a6e894a4sm61225895e9.5.2026.10.02.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:20:51 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:20:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, james.tai@realtek.com, cy.huang@realtek.com,
	stanley_chang@realtek.com, eleanor.lin@realtek.com,
	jyanchou@realtek.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] spi: spi-mem: Add Realtek SPI NOR flash
 controller driver
Message-ID: <ar-vr51U-Gxpix_s@stanley.mountain>
References: <20260930065945.88008-1-eleanor.lin@realtek.com>
 <20260930065945.88008-3-eleanor.lin@realtek.com>
 <70788248-798e-4c10-8f92-cb3670df4c9d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70788248-798e-4c10-8f92-cb3670df4c9d@sirena.org.uk>

On Fri, Oct 02, 2026 at 01:40:34PM +0100, Mark Brown wrote:
> On Fri, Oct 02, 2026 at 02:12:38PM +0300, Dan Carpenter wrote:
> > Commit aca8cbecdd2e ("spi: spi-mem: Add Realtek SPI NOR flash
> > controller driver") from Sep 30, 2026 (linux-next), leads to the
> > following Smatch static checker warning:
> 
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

Ah, Sorry Mark.  I told AI to reformat my bug reports and it screwed it
up pretty badly.  I'll fix that again.

Plus, when I run b4 on this, then lore doesn't have my email.
Also sashiko-bot already complained about the bug that Smatch flagged.

regards,
dan carpenter

