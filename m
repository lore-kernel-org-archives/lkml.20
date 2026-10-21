Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607943;
	b=g4MB93wER9S4sMtXGXNu5uE06amC3uBnuOARnSpsEbNs1DmWUvIkw81P2E5QWv2beqGQ
	 jSjrZd31Rv1jyr1JsaDtwrcH0XcxVIYlctmIPEy3hix8sWSqUarDxM+LqKbL+BrOmoXvB
	 LsmIhlJKuUEvdIFGhxjhrJ0lRTWYgPbTAhW9SVu3cLfyX3UWjzGBIbZBfJBZF7m+l1czk
	 KjCj13lktRCGNRrtYNayCyzfL8y6v8vf8nEkCe16UwoKixx/u10yuJv8yNwyYfyvapfHO
	 0nU7lSrjyVwmhIxOz9Ad/yqp+6XG36pE+Qq4/7Ttyz9lqioVxNosPtdcgOUzV0jW+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tp3CD8lFBlbmXgKO0n7UELCHD4PM1w2C75qMVowhucM=;
	b=WsVpfEWsst1BmjzP/BjktL2J3sJqaXPCjLzCQdfWXawnpKt0N6DXafAHNcoq83Hsaber
	 CmW1RxOeckFfl4t8zlKo+E1QKidMq1qRLB6sjt7dR+AOiBvipwbaoXrEEOUbo0o2ZnQKw
	 W+D9ksEH9rvuvXW+8DfP+zmdANrMYqG6uDdvn+53VqzsMj8aqDuwIvUwnUPdDNbm1WXkE
	 yofG5DFnXOf9rQwNcrYfHb9y+LscdgAdLJL1aXn3VeOqovPxAx42pDJel+abhj425sl5C
	 4jxes9GC0rM8MZjatffm3YQfFcNzj0WtibvHPWR+OS2W4tMme0oNQKKSJZ4bPR+lG7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="EHfh/v44";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C2606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65C2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EHfh/v44
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so1992967eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792607942; x=1793212742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tp3CD8lFBlbmXgKO0n7UELCHD4PM1w2C75qMVowhucM=;
        b=EHfh/v44xm2tWPfZg4Konsh4qhVPFU6/TRyBduigDZTLUqh+r66npnJWdDpesbhdR0
         7lJh+b74KY6ot1ejVnFu0EB6IrMjck6H6tTUn7pqpUJDI4UNzdk04Dw8FYJiZIe4zZx+
         2KWLZELF4d9wZSD/djzVPu6nU3U6xLn6EbGMA9UHmzis8Sc54G1AxoXT6Tpfpg3emQQE
         X9JiJzIijMVQl8wZP4AaWM11ca3C9lWks2WlDx+kRSmVXOPr853gbT8oH2yk2wZ4sOYF
         dv2sd1ib6sC8tZpuZ7LzY7HMcHy06Wj5N3846aqSTdx8ST2860+EHbG5HB6pYKSJNHRa
         2LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607942; x=1793212742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp3CD8lFBlbmXgKO0n7UELCHD4PM1w2C75qMVowhucM=;
        b=Xa5SIi5oSlGQ8NA8Fqwgbgl+6DL/ROqtiSd0A/aRWoTAyTQwxPOcYbVXOrZ7G9xe0a
         sXOIdUHBkoso2K3sjvlnaY7zlRB8a2/4lQgM78hANgHFc2ORSSAf2NV7njsRb4rnObG1
         15iPMq6J+2H72Frgroh5RFGszyw2B9vwrTfL8D7d641KybXTkNIaonEiJHiRH17woXvG
         +tFiU7KnEVOpCkMnvE0TcHJShQgATa03XIp4XdrPHCp83GUYRHIBKBdiECPfJALfR0sR
         THBkHSDhLgw6sh2btEQY5ImTak1mJNALwB48MDJsM1uYv7eNXkM8T01ciBYWr2VyeTu9
         m16g==
X-Forwarded-Encrypted: i=1; AKwUvBwOlhhn6Bg10GJswcx+j9IFtxTpros++JD87uKcRNOABeD3PoAtiKt+QMAXDOK24ghVk8f4yOPe43wsxsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFptmeoRQked/ygWpRATEtVISexhnCqMc320CGBVC8V7rnK7AZ
	vVgHK5pDIQfwbx3EdOQj8Wp7eTaSW/Sbg6ROLVmBOiY8uQ58/240RcISpAX+0go5ADw=
X-Gm-Gg: AYBFou32/Jo4hmBVF+UT7avl0yeKl23Ua2WptvP3whAzEGdduCTOTUT04+5on87h9wx
	51uRJU40Js4FgOUfgo80eu64Y65xXBcb5x49tZEgu75/WIe9BRqJa2tWPZTvLJxzIoq6jRGY72F
	O7KCzaqHdbCoqetGNngNMled61OdDvwYt20ACH/9aeh7nhr+M8zzejuczrYtZjxIfCOVmip9Duy
	wGU7YcBD3oqYj9fBZ+Ir/gQSyLCnuzvM4y/zxO2QAXlp9Qx7KjqVPZfDzwWcIAPqU23nS9IpUX/
	z+4IPJIFo8U0u3O4xEB5aTxOuJnZ4T19gIAgHlQ4w4k6Z9DZi+gaWb9sgXlwEXzLzYm40tpp2u4
	l4NHdKnM3r8rWmlOrtCWD+RVh/vOLHY+WL+jC8eoEkEiQMJNPJtTogbim+4kWrkIKQAeTQImZ1u
	UtqzcxvrWJm8m9q4aDrWesu3zOLALAy2IkUK76qru2ODd+J1iCZhi6UVAPx51VKUn3QaFJKGFEo
	yDgsTa0jliNH/9PeLDgvQasq4ehJ8u+vdKU93Hfhowup2TaBDIJbwzeIGgS+zMqbJakdhI+4a2p
X-Received: by 2002:a05:7022:6b81:b0:15a:4155:3d9d with SMTP id a92af1059eb24-190a6dc116fmr5008052c88.31.1792607941333;
        Wed, 21 Oct 2026 11:39:01 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm8302114c88.15.2026.10.21.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:39:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:38:59 -0700
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
Message-ID: <20261021183859.GY2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-3-mkhalfella@purestorage.com>
 <179241127352.3544975.2554197788837860779.b4-reply@b4>
 <20261019190106.GK2931-mkhalfella@purestorage.com>
 <a3852ed1-4b6d-44e7-b4de-bc1c6a3b635b@flourine.local>
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
In-Reply-To: <a3852ed1-4b6d-44e7-b4de-bc1c6a3b635b@flourine.local>

On Tue 2026-10-20 14:59:04 +0200, Daniel Wagner wrote:
> On Mon, Oct 19, 2026 at 12:01:06PM -0700, Mohamed Khalfella wrote:
> > On Mon 2026-10-19 14:01:13 +0200, Daniel Wagner wrote:
> > > On 2026-09-20 11:28 -0700, Mohamed Khalfella wrote:
> > > > Export ctrl->ciu and ctrl->cirn as debugfs files under controller
> > > > debugfs directory.
> > > 
> > > Could you add the 'why' part to the commit message?
> > 
> > target# grep . /sys/kernel/debug/nvmet/mysubsystem/ctrl1/{ciu,cirn}
> > /sys/kernel/debug/nvmet/mysubsystem/ctrl1/ciu:57
> > /sys/kernel/debug/nvmet/mysubsystem/ctrl1/cirn:42541d24813bb536
> > target#
> > 
> > host# grep . /sys/class/nvme/nvme0/{cntlid,cirn,ciu}
> > /sys/class/nvme/nvme0/cntlid:1
> > /sys/class/nvme/nvme0/cirn:42541d24813bb536
> > /sys/class/nvme/nvme0/ciu:57
> > host# nvme admin-passthru \
> >   --opcode 0x38 \
> >   --cdw10=$(( 0x1 | 0x57<<16 )) \
> >   --cdw12=$(( 0x42541d24813bb536 & 0xffffffff )) \
> >   --cdw13=$(( ( 0x42541d24813bb536 >> 32 ) & 0xffffffff )) \
> >   /dev/nvme1
> > Admin Command Vendor Specific is Success and result: 0x00000000
> > host#
> 
> In the meantime, nvme-cli learned to dump those values as well. I'm not
> sure if it's worth adding these just for this use case.
> 
> 

Good to know that nvme-cli now parses these fields. That is said, the
sysfs and debugfs attributes are useful to have. Say the controller is
stuck in a state that it can not process an identify command.
