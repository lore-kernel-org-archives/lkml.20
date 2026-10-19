Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444735;
	b=R9si95Eev4GZlipo7GeBVu3CTs9SvLaSp4Wbf4RevFxLWUxHSiL2fMoMGm1qxzKZSLQO
	 QfgGXH8AoEmM+dXvBc5fG4hgjucNUkCthgEt/ng8XrVNXfAdUWgGyqsYXM5drt00ihXx4
	 Tz07T9vRzc4RWNxrM0/XMBaWeYMVzz+UUpBoMmr259MlgIunqLVmUZbyCWVl6pREIyAej
	 Fqy1N+9PQcLfSmUo+CaPUl9UcvfTb6J00gN5lDvVnKpFTJi0NvInYu+XTcAar3Qwzb2FQ
	 QURr5+Xb+HQQ5Yskjr8Bxgi1z48WXWEdVg4PIMqTqJZ/bJN6kpT03ctXddKPSOEwaow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Htm41ZzW59EWMf0J7xg7vylcf3tC83jsLFLbZJNEvmc=;
	b=OWh91FT0rN2naMWIeObY5QihaMtOse2HPsYWKhEqaBvpI8KBFHlds62roJah61xCyAF3
	 3G26GGc+5AoMxkXMVYtMsIYq4aU1DXdF/sva9OFAU0JJQx7r1gl0ooZEOWASyKaiEyn+G
	 iWEks/4btf4qluLJHCS7+Dl4ugcZNZMw48lGnGAE9m/obS0WFi8qW0O4Asjk6q2eGzZHs
	 kXB1AJgxmrRhLcuEqZwSEDoOdjTUujCJpPbXMiyyWbwVa423+75vFYxBIadO907Lqyvpg
	 8WOjsvjOyr6xTajhKe7glQexDrb2V1gN0BILVJUsQUHnCYjnKstD+maw7FOhetqaEGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ln0UyUjy;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D23F606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D23F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ln0UyUjy
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so15183855e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792444733; x=1793049533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Htm41ZzW59EWMf0J7xg7vylcf3tC83jsLFLbZJNEvmc=;
        b=Ln0UyUjyaMh2K6gr0/8AJL04phzOOPbuqpS5IDTD28v/Y32oeriTxb7L65gYAaSa0O
         C3kuUlOhLpOgpjPI4CtOArhE8yDHWug5V8UC2vKVdIHAJjQs0OKGFBnIZ6bonqeEN+Co
         uS9JknQ8a/YR/6tHn1mxeTJL63BPAc74xZPUc4LOO/zxVMa7kr+TUbLamVIrUhDe3Qph
         MpCJdsCMr6MwVEy576OHpk6Ol+17CSz2qfTSvYB2ln5Ck1qJ7iDEiCaX87ps+GtkMGY/
         gx5h2v2EmA0oTNbHVlemuWQymY9i9I4qbLp9hdPgyV05CIdswKIvnAelHoF5U6p2ZUes
         BHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444733; x=1793049533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Htm41ZzW59EWMf0J7xg7vylcf3tC83jsLFLbZJNEvmc=;
        b=UPYxdUfN4D+4Q8mVcQvqe0o+Sp0p6y9gdGbFnlNPt+Jz8Q7VgVdYvtkfSiwgA72KDj
         tcxm4gVFrQeg/9j73spZeXYe0BvguGFeqmq1ZwXGcqHISSkepZyxDLDJKo6Q/Y9uXHqa
         ZbCGue7jHIhiXosoIjTnQHIn3wIrvHTglB/nunxJRLSUWbaYVDkbfMCDwMudm7wZTsM5
         ZV7AE6Z+Vz5y6QfP0TuUpQuc/D5KcG1krffmXQqW/SeUIBGlyYSbBwtsBWzCqY8tuV8u
         MkGKta2Vb6p3cU9BSvQRGqqXl9tp6G3i9Pq/CXSCV9MEkNVntwnHp8ZYD/sw2cNK9eqH
         QVIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxai2M/xBcxy4utK7aWdvFGlABlTWOXURV53sdMWWDZbxJeGl2rixKTscr2RL4LiWwwPAWCD7OnhM2hZRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEmlcIHAJ1tVvMcr4odt7H0uTUJLzylrUOo3GHF7nf+YAQ2mMX
	N6QFuRAjbQouLhBjok0qrmwIl1sWT2SDOtx4OW8F2RZZXA0TO39issk9F5/qjbp9MTM=
X-Gm-Gg: AYBFou0PAQqjIZqLl+P5+CVtSz7d9Z6WC2GdFsCUGJbx6/jvjy6MMs8nGpNbg5/PCOX
	AIFc/w81WejXRWeiEpWs5QjRCfXtEB4lcjWPTBnSoc+K8355RngV0p8o8ovFCgYekbBrslvJPK+
	KcUGXNjmnfsXpUYvJq3uhOVsribUreEDZbWI6tpj4bTfZbOr/tHCuvJs2iu7svv0TLvHM1pscnr
	HvdbZZhjypZy5pXl20u+psDJKamH75+lOYD5Aqh4i3j1NIvLxKEpymhU/CCzX5ZbHzq7C7M+loA
	/ZAXfQNH2WCtGdTQb1XcF5TMPA7ZzkjlUbezxym1XyYRS0gJcRMDqqvQ5I6ncgYKfmqZO8PCpbU
	jqe+1CJ+Sb7jnBO1qWKwltTEBhbqN2N7w4surr0VfLOwc6rHpqthbCsEXzAMmCP0eccQDbZ4MRZ
	Jtkg+Hj69JCoGkPqlzXwKNOiU6SU/9uRwYQ0Dq+8UDOGWWMWGgqxmWvliKT51pQJvqvdp6zyW29
	ypxZ3SNuATIzgSyQqI=
X-Received: by 2002:a05:600c:46d1:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4a1de8a63f7mr170070465e9.6.1792444733330;
        Mon, 19 Oct 2026 14:18:53 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm208166855e9.1.2026.10.19.14.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:18:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:18:49 -0700
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
Subject: Re: [PATCH v6 06/18] nvme: Rapid Path Failure Recovery read
 controller identify fields
Message-ID: <20261019211849.GM2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-7-mkhalfella@purestorage.com>
 <179242896496.3619480.12975259904515722687.b4-review@b4>
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
In-Reply-To: <179242896496.3619480.12975259904515722687.b4-review@b4>

On Mon 2026-10-19 18:56:04 +0200, Daniel Wagner wrote:
> > TP8028 Rapid Path Failure added new fields to controller identify
> > response. Read CIU (Controller Instance Uniquifier), CIRN (Controller
> > Instance Random Number), and CCRL (Cross-Controller Reset Limit) from
> > controller identify response. Expose CIU and CIRN as sysfs attributes
> > so the values can be used directly by user if needed.
> 
> What's the use case for it? This is an public/stable interface,
> it needs a justification and documentation

CIU and CIRN identify an instance of an NVMe controller. For a given
CNTLID different values of CIU and CIRN identify different controller
instances of the same controller. The justification is that the values
allow the user to identify a specific controller instance.

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

One usecase is to use the values to issue CCR command manually. Not that
I imagine one would want to do that, but if they want to do it they need
this information. CIU is also present in CCR log page. Someone reading
the log page might want to correlate a log page entry with a specific
controller, so they need the information to be exported somehow.

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index a2f5d0710db4..ebc3634c1a96 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -9,6 +9,17 @@ Description:
 		of the NVMe controller, as reported in the Identify
 		Controller data structure.
 
+What:		/sys/class/nvme/nvmeX/cirn
+What:		/sys/class/nvme/nvmeX/ciu
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	Mohamed Khalfella <mkhalfella@purestorage.com>
+Description:
+		Shows CIRN (Controller Instance Random Number) and CIU
+		(Controller Instance Uniquifier) of the current instance
+		of the NVMe controller as reported by Identify Controller
+		data structure.
+
 What:		/sys/class/nvme/nvmeX/cntlid
 Date:		February 2016
 KernelVersion:	4.6

How about a diff like the one above for a documentation? I can add
something similar to the one above assuming the change will be merged in
7.5. Or I can add it later on? Maybe in an -rc after the change is
merged?

What do you think?

> 
> > Also add the nvme_fence_timeout_ms() helper that derives a fencing
> > timeout from the controller keep-alive timeout (kato).
> 
> There is no user in this patch, introduce it when you use it.

Moved the hunk to patch "nvme: Implement cross-controller reset recovery"
where the function is actually used.

> 
> -- 
> Daniel Wagner <wagi@kernel.org>
