Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D694F5DF3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975669; cv=none; b=idj7+i381VDY6zWdruySNFOUcaBwQmSGpLfggW7pgrJKVl+KVgOnwsgMWc6QGHKwfdiWbu5gm3IO88DRoa465lloZKvurqgMunsyGPe8DlVoFl9Mu62SQgnp0kJGDGe8zBNPffBC3yHm+aJTL3tmxnJqrZUXyMa+nVa9kzLCZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975669; c=relaxed/simple;
	bh=JSrw61r+qr7d9pRzfg9/dqjpZ1FtmE4Cx50rKP3P1wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jt6YYCkAgbN7RRnGGN4weKNmmkZht41Hg/53XoeoOLDCZFZqutM3Uwa/Eje11blP/vINoYJdG7pQe51wS8bjLUMYO/XjmEweA6i2Xeb9vpZVLWptNPvQr6885JfkmnoyVZ/gV/OpmKvPtPufpHnDQrE8aNBw9Zlmj14qQPL+3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/77zoDM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/77zoDM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c02782159so2417875f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975662; x=1792580462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ore5pTjDZjqNZvaBmIBth3riUQaRpMdBJFRuQs+XS9I=;
        b=T/77zoDMoUYxVBvNMyt5+yTmTqQkwpXtSwfbIz0ygoY9s/bmVvAqNZRJSOuZzVOe5E
         HcEOM09eRPNYsbukak0Ricj40k7lZ7wc90x/oFGp1OwiGDba8BnxvuiIMy+ox/n9vIlW
         vJZVbrXZQLKQapGfA+KOa8yiDlX8SQ72eZHfI8Y+V3FIbYcbhI0eEG9qtQhyJ1wbx/mG
         7lQzQsgvHut0tZCJsi/2JlLdVImw5C6FqpHDMfjWJT3tvQwvPS9c4+Ib8v/gsVHmam/U
         +V+EsTxwZb9GoaXz1ISM+QYAUZsxCJ4TNxdanNVwhj8GSprn/clxZQs3AvmQaRGccx/R
         JeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975662; x=1792580462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ore5pTjDZjqNZvaBmIBth3riUQaRpMdBJFRuQs+XS9I=;
        b=XXEOqZcIZkjC2sPzazl1dW2ON+v+QQzuAZudSEXOHG0ZL5wHbDshWwPRzF3L6Eng/t
         JbEfVTQV2dLesdu5yKbvDoK85l6GQYlReAzGgEmIno8xd/3BHh+nm+8q/rwfVvXjg9qJ
         67d/s6BlTaWcnjd5UHYnR3oOwxypIBst5BPAAMz64R06J7U5tDwSuVdJDa8WMIR1uRvc
         ah2vBmf0U+AEeAdjGCEgpeFSgnOOv+yuiAZhVlUCgRnKiFdDBtRfnmWvsszqGrWUHmID
         aW4jr8yj1QvSysmNfKWhFekGDM4Sva+ovC6AcKBlYnVaUFdcDnm6kDB4Ieg/j5lYjaY1
         FbGw==
X-Forwarded-Encrypted: i=1; AKwUvByvNC56fcDk5bi93cgnNgDtbpu6VcH6WzxNonimFMT6djYdwfkv+2kb5YNu+FuT6cHKASIJ5L7LzIRKu5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCYhKfPxnHra0oaXCtALE+ftrsrtJmjwWrkmqP7xqXT8pm2Zzn
	xDLWqzlIU5XgQlTBozjdrR466aey7DtAj8VAX05OYVSvQdyP7m1m1l2cTvYm+w==
X-Gm-Gg: AYBFou3gMsBLIUn+2oVABQgbqTqICwpXDpTEDqFcPrD6Y+W3xwPOTwQcHulkNgeRz2S
	w4Gdadt8vDmFc2KvNuj/RDUsRlH3AeD2uUuzqRkyNnd65k+dRkqlGBRcMKH6f/5+rBr47vc85hU
	sXc3naubSTWC3K110WzQYp7GyLpHwvkwQnnXl7hIwcVE/KT3qe+LnGdNEhbz1QwWET0w9FgepVu
	gRjm95TfPjvkgHCTgWbItwOW2FYglfUAj8rreIpNoy+1XhgGzzl1CouMJG1QbsSIBfMxWjOh9dS
	UPQRl3uyfzptcOD4ZcVg4tsrmnHuLGmB/wpuQyFD5F7Z3BkJX3XrKFx0c8BmP01rzdU8msEohj7
	oPgp2hwA4yhQ8uBIxm1kDCdNXxm6x8eGku31+q3Q02h6Kr2DOKs5MZR2JjCTyiaq92MIR8XqvgC
	rKh3yyh+143hU9iU/MB91tycsPOOn/YIPyAukGt8x1uswzyHg+Y2d8ZP39/MZVTbH5S5OV76F5/
	WiaRhgVI+YGp5Gmp3KI0spRiRrqhd8UQ0OFn4TaeEegCJjJCokuy7wo
X-Received: by 2002:a05:600c:8b83:b0:4a1:811c:8064 with SMTP id 5b1f17b1804b1-4a18e4d5512mr296251135e9.26.1791975662021;
        Wed, 14 Oct 2026 04:01:02 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm653036435e9.8.2026.10.14.04.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:01:01 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] nvmet: zns: reject a NUMD whose byte count wraps
Date: Wed, 14 Oct 2026 13:00:52 +0200
Message-ID: <20261014110053.95249-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013142649.GD14759@lst.de>
References: <20261012141239.156408-1-parri.andrea@gmail.com> <20261012141239.156408-4-parri.andrea@gmail.com> <20261013142649.GD14759@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 04:26:49PM +0200, Christoph Hellwig wrote:
> > +	/* From U32_MAX / 4 up, the byte count wraps and no longer matches NUMD. */
> 
> Overly long line here.
> 
> > +	if (numd >= U32_MAX / 4 ||
> > +	    out_bufsize < sizeof(struct nvme_zone_report)) {
> 
> I guess to make various sanitizers happy we probably should only
> calculate out_bufsize after bounds checking numd?

Agreed.  For v2 I plan to move the check to the start of
nvmet_bdev_execute_zone_mgmt_recv(), before the handler or its work item
computes (numd + 1) << 2, and to make nvmet_io_cmd_transfer_len() return
0 for such a NUMD, so pci-epf doesn't compute it either.  I'll also keep
the comments within 80 columns.

Thanks,
Andrea
