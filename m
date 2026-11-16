Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858273;
	b=sNfx5SCiECnWzw1OyBcq8xW7/CyH8X4PAkJ34Xb+ExTYixX0/E7brFGYbFSUvpHyDJpu
	 pmIiG+Nwctn8dv//zvWEZd4q+Fl7R08pcrvj/VNAhxyr301fxkan2VneRDf/eMFgr2OnU
	 U1R6RqQjOvem9UTcSm3z4LxQ+2xMDNznfkuD36GvelUIPWvXeQU0noYgNU7ij20rLf+P8
	 IlvlNmdl+6hhGra5O74+VGWMh/gX4MqhceauLAtSLTcJg+dQ03kE+OIOZ5bOUw93BAJRq
	 /VSDwyFgYBKy9rJfAyHyWFLePeCyX+uxBXD7+hELL36LKy99WcXcCiLjij4mDnrvYCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5a8RTlOneQoQgmIZF/2HgV2WGmUNnodxSu/n0rvD61I=;
	b=QcHyBU+ktNT/QFvusvMRNRumQ0jXDyYRX7DNyWLvyJdCtENEtqh/bAHoe82QdiSDQ86a
	 6yu6f1o4KhDprOUtIefq2LwqVQhtqHCTRLH1nzFHZiPcpCSXrkF1DamuH72zYIeBCt4Hw
	 Ckwc58K5kWb2N/OX/ic2Y6ra8Tesh0zyDwYrm4cCCE/GaiCswNY0gg3O/CL7nAoZUtbbL
	 0jMRd2JBX04ajrpYzR4MG3juS5QpC5VzyTKPo6LipFEHKdWXqg2CBwns1Q+MLT1d2OLUP
	 +vsaMqFanwKOjqI436wLVhVT5iaBwizVH+mjqBq6Da7tQHdV8RTc+aQllDIK7uZ73GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SHBpWSfR;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA04D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA04D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SHBpWSfR
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94937a33cfbso415933985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794858272; x=1795463072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5a8RTlOneQoQgmIZF/2HgV2WGmUNnodxSu/n0rvD61I=;
        b=SHBpWSfRjtSVDfCjuB4AftB5V3Ersf1C7hVWdgVvkY4iz9ugysMlfr1zYwf5I7iYsN
         6p6KDbWx9awEOyWSuqmI4Xsrnv/6qcr4W7ah9rCTsOebqEHEzErhcl3NtGGkkBdq+tdK
         /E/Rh/eLOh7jevSrdzpDbBrasQ6yXyPGw0VQ6OD/75X8PThZXEfPFkVQ5BURPl8xACAD
         5slnwJ8UIvmqGgP6cEGjZqzkPG27qXFOETpw0TXeJURq3IXW/NxfGpafWF5SGp6hk9tF
         YerCYoVQKv5t3xy4WIBrXykEOsEBoBg4cNbNWqyJxZNUYx6jocwga+l2JGTrxBnv3vFG
         NYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858272; x=1795463072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5a8RTlOneQoQgmIZF/2HgV2WGmUNnodxSu/n0rvD61I=;
        b=qT65saX6tZsn9yUMgEfQZyGGtnkcCfaY79wBCFME7Gc4z28lVGLNyMbDjpoSvc+TEC
         TqcWVz419L/pD31NBYQjEnYZKppHWv+bHowPBDb/T4fRYjAjCPkk+d70sIzZ8ThCE3g9
         aGF1n/xJTt51gUFAbpI1jSlPc7Zcj5p4rCQH9+nvvY4XZp0uuTOqpRLsTqXEud2cs55s
         GoTf5RbS0aK/JZc4Ligy7L1FVGaXMrqyA8YQOogiLm5iHgsgGHsIvd0M6YK4qBQVdlbS
         iO4OyVQue8SGpRqWAqceaijP7HQiODJdi05aHFAgjqkLnvtXm/VcozdGW1auvwvP61rL
         iLDA==
X-Forwarded-Encrypted: i=1; AL+hErH15HS2m8uULmrD7vuGgVmuDBVrX9PaM6qeC4CdIChoUIa8N7j/znInFuD94VSUBF8KqAIqPfQUBTYDqJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GA8lws7DvHaM2snUocBRNRR/xv5UcUSSNLUP26rdn4guxx/DL
	8Sg5ZoFrqhG0iqASKNpJZlJZeiOXD04+hm0nwxHKuBNFBQqY7WX4rGgpQ39QlqQxFCM=
X-Gm-Gg: AYBFou32mb3xsYb7LEOhPdpQc+kZ52gwssMozQmf7/PTbn33Ry/vd/pMhWjJMzZY2Dd
	nnSqQcY4HtoTbrmYzFXlO3kwweEUa+uauuHu3oEfaymhv2h7WxlXjKJBg68z0vDY0n7e9qDGDgl
	X44qSHIU3iljCTcvY1vuL0WqFReXVbDz6bZoTFfF1iQqajU8BSo8r8FkFbeYDjdo2UfZmhJPjss
	UwPdhME2Vzjb4+1MSZ8QFjIR3G4u44OMIH21vqyNSGZStCxZZOQ7GqqgZJsD6bpWYchEP3aAewr
	23bOXR5z/Tqsc5Wp5f0ZdtcyWyaQ39gX/ebP3EwxYcp1M6aRDiIpqyfHNUnae1FjoZ4XPZiCL84
	b4Hf259V4BFx4O7LdeqZ0UpqoG8G2j14li0tyHCGzuQlXfVGMvbwNPDqzsOKKCVWxk+cDhxgqmN
	siY6syjqyybqreszP23wICnsVGYAOhjbtDKPYAGc7FRmwAs3sadtAuWiXT6xTwyoCisRso6teh7
	CEFEKJ3gtFbzOO0BfheTkFU/SbZ8n59omFLao6DGpH4Bd32mdLU4t5WsOmJAlq873MDvYVCsJEt
	kMtbBg==
X-Received: by 2002:a05:620a:d8d:b0:93f:1d5:9973 with SMTP id af79cd13be357-9494bcea5c5mr1799354985a.73.1794858271993;
        Mon, 16 Nov 2026 11:44:31 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm917649385a.39.2026.11.16.11.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:44:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2cw-0000000AKjk-3CZC;
	Mon, 16 Nov 2026 15:44:30 -0400
Date: Mon, 16 Nov 2026 15:44:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 0/2] lockdown: Prevent booting with lockdown enabled but
 IOMMU disabled
Message-ID: <20261116194430.GD2452510@ziepe.ca>
References: <20261102-lockdown-iommu-v1-0-00f3c2be4c9f@kernel.org>
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
In-Reply-To: <20261102-lockdown-iommu-v1-0-00f3c2be4c9f@kernel.org>

On Mon, Nov 02, 2026 at 08:00:24AM -0600, Mario Limonciello (AMD) wrote:
> Lockdown is a kernel LSM that restricts access to sensitive kernel
> resources (e.g. /dev/mem, kernel modules, perf, tracing, kprobes,
> BPF access to kernel memory). However, without IOMMU, any PCI/PCIe
> device can perform DMA to arbitrary physical memory, effectively
> bypassing all lockdown protections.

I don't see how this is enough?

You can have an iommu but the commandline can put the whole thing in
DMA passthrough, which is the same functionality as not having an
iommu.

It is not like "any" PCI device can do this DMA. Lockdown
systematically prevents any userspace from triggering such an
uncontrolled DMA.

This is more about preventing someone with physical control of the HW
from access all of memory, which IMHO, is not part of the threat model
lockdown should have.

If external attacks through PCIe are part of your threat model then
lockdown is the wrong direction. Leon's driver trust series is how we
are trying to solve this issue comprehensively in a useful way.

Jason
