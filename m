Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436472;
	b=xZkoQCesWEw8VXInTnfUGhjcLh7vh06bt8BGKyrbRz62eZnyON4ZhjpfjJNocc4KvcPK
	 LtLbK400BL0+TbaTts4YdhH/JUhDdJSuXcdM6hBZoxlgt1YCJrI0Gt55PnOWzKwI4qnc+
	 STIzrzGHnMMEo1kqdB9xAKlh+ElowNH7H8NBC4QcvfwN8LoHIf26wtTtfZcNXB2QTu4MB
	 sfSFmYBeR0KUREXaV1O/Px/NtCsb0yKoIlnHQ1EfdFtAEnacfBd8K1/St4+n0bUBndvXR
	 l11Lo0a3JCRosdAW7SCCpuY9ZzU2N4zjdXLLyfAiUAqft+ng1b/6mVcoufHag6MZ/Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AQkkAaWtxUgZD6Kqp6WcVP+DNLI/QqlyqnrtoDUgzXQ=;
	b=HPwoVl+WUVGHUgAcAYG/ulytzKnJdkvZzcICEVmoFJLt3QnVfhsbCNZEONKOqmM7P1Jk
	 mXb88gOZAMYQTJ0rLvX3RGor/Sws0l5XHalJUHrJTAC5uw7rOzE4dY2j7pvnfcQ+P5fTD
	 Uav0pyfffCZuUmqdEmyxBpkdkS5DL9q2WOXd1zID8C3j13J7IiABYBaePCkfZVIdbEdlD
	 SMjdTsgEqv7cMwQWwuEp9DpLuN58RCDzOVJpIu2s683kKnKmorKYppsw2D7BUkg4HETHf
	 FHbJOvOmOKINrqPlnEk0T+X/Z5fAjQdup77fd7ZNOsF3soawhl8odkdGoIB2LEECTYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=MIAaYeQm;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18930606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18930606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=MIAaYeQm
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso2041278f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792436470; x=1793041270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQkkAaWtxUgZD6Kqp6WcVP+DNLI/QqlyqnrtoDUgzXQ=;
        b=MIAaYeQmwFR00qdiRMXXMe+IVnzke+IBeqgFCbFsMII3MSTxmPH4bJFMv+4efSUQdS
         pJNxiBCRpOs0DcD+28UoKaPJ7FqxF4l8oaswd4j7FAsEqySUwc9SF96owOKXmErFu0pL
         1fgjARu2E+FFtmgGERpqwHJyCecvRg95T7ikKVFIr+E7BvQZh7RD35lcMT4fPtKw7HZJ
         3Q0RFGUri27zFPW4vQtGrAuRTYdx7hRNI4Wc/VEssUb3mp4vRDA+GJCFq8XkABd9XVI3
         6nz+h93XSUje3ohLHQO2fQvk5dnccFb1aTNjerAcn0iT0wKcIdlqKqQhzCuZUiA+m6Mh
         stnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436470; x=1793041270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQkkAaWtxUgZD6Kqp6WcVP+DNLI/QqlyqnrtoDUgzXQ=;
        b=wBOQclEYL96iBPIsu3ldGzA4EDEx8M13lLHdpmvd78YmsjxBZo7jlbqeIde0femMNv
         OzKokbNNzi0PjpZVG4+jmmzDUJwzLe6CsVGnZtzBSTcHGkW2u3SS79AMjjWfLVCScqbg
         7GOrNmBbFxDXlnETGmLs7c0aW3QSaF0sxZ24G10w99ZPaTbC4T+2v5BP2UithLxnuwlE
         K6h4ATPe+FE2FYdf+IkQnzZj/4en4DzNRQlS8PPpZyj+R8dqA3UccidBM2mRu9+gOoB7
         M2E/Hs5BV7TPTEFFCt6IYkPGcSDuhJL7LULxa4QkqZ9gc6KL4t7k4WdKtEdx/Nwforaa
         vT6g==
X-Forwarded-Encrypted: i=1; AKwUvByeyKKH5DFbO8iHxrp3Pq359QOJMpBxyv8YFV6jbArS2FTcGpdb/IPeQmLF/BDNjdXPlQ0dsjc1JCwxg0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpuu9o8TY1mgIXUXFubwaaZjpjUuoNjbnITAe8J21GWWgBbVMq
	6X5VYVCNwNUCrdyhuSxQxUtrwPc5DyFEAviZTqhOPMYg6rv/CTDoOQOSrnUXjJQh7/o=
X-Gm-Gg: AYBFou2wv1eGEkS293nScFcWEnKD0jFVCizWzHbIri8kIjh/8TXVvrJOA9vXI80NhZP
	PZ0cBNmvKZwMIng595meDgDb6UUgmcstLRre3eVeqVeXws6eo49qT/0t6WQC3cwS+WyfK26sqpq
	70gGqXQyb7g4SNe1OtPZ0RKeiiR9CBTBGAUcRXKIE6FLFZTf91h67lSm87lIhud3tN1J/GFsJOP
	GU+akkMCQQWFOqN5D3QHZq1Axe2PjJf6HBBHFyXf3yyI0DS2KCS1PBKwCJxOzJ1evnYosb1IHkz
	EtfM9btI5v3aKOeGMpwD6+heB8aw4S9MDQxEfs1Fhgttw/+3ohY/fbXk1mQgpX7WYf+A1lngPL6
	FpnS7+G1MoMp/PEDIruo7ZSAxAnuBtjJW7F0psdyoTFd9xlZ/Oom227o6X7QESRJSlX/8rAfJJM
	whwn3/mXDsmAjEUenBIYNgLJQ+XPpmPRinOEIDZIzs2fdRX5x7O1glQ1NnLRfhkt8mCETeFf8W/
	2OfXu9CmggECS0oTHc=
X-Received: by 2002:a5d:474c:0:b0:48a:f454:3d4 with SMTP id ffacd0b85a97d-48e07fac2a3mr12245302f8f.53.1792436470203;
        Mon, 19 Oct 2026 12:01:10 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d823cfcsm711128f8f.39.2026.10.19.12.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:09 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:01:06 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 02/18] nvmet/debugfs: Export controller CIU and CIRN
 via debugfs
Message-ID: <20261019190106.GK2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-3-mkhalfella@purestorage.com>
 <179241127352.3544975.2554197788837860779.b4-reply@b4>
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
In-Reply-To: <179241127352.3544975.2554197788837860779.b4-reply@b4>

On Mon 2026-10-19 14:01:13 +0200, Daniel Wagner wrote:
> On 2026-09-20 11:28 -0700, Mohamed Khalfella wrote:
> > Export ctrl->ciu and ctrl->cirn as debugfs files under controller
> > debugfs directory.
> 
> Could you add the 'why' part to the commit message?

target# grep . /sys/kernel/debug/nvmet/mysubsystem/ctrl1/{ciu,cirn}
/sys/kernel/debug/nvmet/mysubsystem/ctrl1/ciu:57
/sys/kernel/debug/nvmet/mysubsystem/ctrl1/cirn:42541d24813bb536
target#

host# grep . /sys/class/nvme/nvme0/{cntlid,cirn,ciu}
/sys/class/nvme/nvme0/cntlid:1
/sys/class/nvme/nvme0/cirn:42541d24813bb536
/sys/class/nvme/nvme0/ciu:57
host# nvme admin-passthru \
  --opcode 0x38 \
  --cdw10=$(( 0x1 | 0x57<<16 )) \
  --cdw12=$(( 0x42541d24813bb536 & 0xffffffff )) \
  --cdw13=$(( ( 0x42541d24813bb536 >> 32 ) & 0xffffffff )) \
  /dev/nvme1
Admin Command Vendor Specific is Success and result: 0x00000000
host#

I found it useful to export these values while working on this change.
For example the command above can be used to trigger CCR and observe the
target behavior with the expectation that ctrl1 on the target will be
failed.

Added a sentence to the commit message to mention that.

    Export ctrl->ciu and ctrl->cirn as debugfs files under controller
    debugfs directory. The values are useful in matching host controller
    with the corresponding target controller.

> 
> > 
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> 
> Besides the missing 'why', it looks good.
> 
> Reviewed-by: Daniel Wagner <dwagner@suse.de>
> 
