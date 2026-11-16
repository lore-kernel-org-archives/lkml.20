Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858549;
	b=ev/cSP7ct0Q+varPLqZ0FTQ5/iDpGxgSLhGdzEq0QhqqVsnganO1YLzZUfPX/t8WMxu4
	 ujXwDXWhDjjMg8MhkBJQIdnxlUamg/8P8m+gciBarn0GPUQPQ907/EMHsvDJcdAjAAKZC
	 Wx2LT91TwvFZQUrbI7NkXJDPPRo8YtJW/dpi8i3ozjg68AIw7lVFYaQcWdFcE3bJen3fn
	 kS68/NnSaNUU6Z+DQIZZIdrP6aeqVtV4gmTKZ3vNqy3wt8QzKxw7Deydokf+U2SK/5BdM
	 ONnH8INNdDvhkugOV2HeRwqyXeN4iSQqRD7yszhLPb74j95uFKn019SrBB5gQVsIXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JYgfM3NjhEFUFn9lrkoVqv9gAjE144oaGhmBbKw0DZU=;
	b=NkCvaPXZ5ftg0QxHD+aQQSm5NjwPwsrLtuquTgFZ6FZUzctI6MUUpCCLhN26Zs2qwyxb
	 iGlJJbQ9i1+XPGfp17aSBDEutl/Beh+hvWg5zBstUAwJ0vHTPN6cBUG755cOEuwjoD+7+
	 3mNN1/v42uDMtYaNQCTP841a5VknrKjSPb2wGMytnsGvxMeYhcNiCC2SiY+6SE4R1Kpkw
	 GivvyCg+DxtdB2fF1ZHN90VimkozgUmyu5/1xQMi6LucOAxSef7iZw4OW5RIZA2uQGHJC
	 eMaMr+EJYk8PhPZ4R7Vwtl44p/7nqeGuByGDjoqhT/FdFqCT7a1ffIbZVPkfbeZCYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RlFsvhsE;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F34A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RlFsvhsE
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91e7fc8265aso57234786d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794858548; x=1795463348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYgfM3NjhEFUFn9lrkoVqv9gAjE144oaGhmBbKw0DZU=;
        b=RlFsvhsEKl8YczEStUDBJeHllrFOfIR6vjGNwd76/biP2I1kCjgE9VRwwg2fjXFiER
         Wzajb3Irdr2N8CSbPSvTRr5jWXP5ulgFMSOBkvDgvxvh7ArkHXjsOhanghA3a+F3u4qJ
         32pvDn3ODb+dJa73zjDJAXCvecG8vca26Ki/U+YYljPcr1CimqyVXAENEfahq1C1zIn+
         N7O3F6A9dCgtW+jTy/WROWUf1adGILfOyE6bm2jCx7BtyZFoDZvAU0RV/Lq3/RNxd2KV
         VMxOveLKWggfNQV5opTqiNXipyTrD7LR4TjpT9tj8CVHDbNWuyRoCfVfpkgAT5HmuuDg
         Gd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858548; x=1795463348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYgfM3NjhEFUFn9lrkoVqv9gAjE144oaGhmBbKw0DZU=;
        b=G+eKn881g3zPVKB9u5YPPCP/4B0w/b6vKRsBQyfM/2uX6bND5/8Wcxte6O9VPq6X9U
         XFIYXR68+V6jm9Kf4ycV5socKpJy1ucZaU1HMWyJ33ZNr3bVV2lhb0u+iCjr+Y+aNL4v
         Q7k+NuoKJknAoIZW8xofELiN1BATOp2MMa4V4ZCPEIOrG6durRRDUvc0C2bp7PtMsMMQ
         pau5mnK8sxGiK05OBjbpgdnTfXKqYQfsGakcqOKNgGRlJidrtaNWnKCs8h9v8AefZGht
         aBWarGXB0suoPYScogeHWosmUvDwnXNgrWgOEi50A0lwwMKqQC/g5d+HDxjX9oc+uI0F
         tVMw==
X-Forwarded-Encrypted: i=1; AL+hErHLscEGNzu+2Qpu93i/krM7EVUfAILspzNe8zoBpNkOpxobvqb5owGU1VN8KWAQM6TD++8rgQj+Vk3YBIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sJHoS4NmdoBh0E2vq/MpEvt4KbVxsHeQMvcKpBE1ZBjnT4Fo7
	aBMvm/HOC/5TxeiaXwShcrLfbFKaJROsDnRsqiMvOUm9DIS1tZLbkb6dMptqSMjLpA4=
X-Gm-Gg: AZFdTZfel14TlAUAG85vMaUJeJQLazQZFQNbmr72/feWp/YaZI3E05jTJGq8G8Gh6E1
	K4zypDrIjYGFEZQXNKIXeQfMgBGh6CG24R5P5sSYiTJM0U2nrRq/QAV4hJnAlWW0Tp3skM6sDgn
	FpRz/2xPZPpdQgoVqSsrr8rSnpureODeVJDbcAzGeVCNfXvuWFxOq5JBZV8wZfdh4DXd7RgAV9F
	UHJQgQlDXOhawNZXvrVkVBhkYDXQUCsq1Vl7xSdtzvWC7VwVDSQIFXmsoBYDVJDg5dKyl0VbU0k
	spVSftQEIBdlM0rnmTMpyhf1QuR54PoPsk+TySWeg/7X+TLuSJ2TpJg5PIRDcjQdqiSOWqjZHlA
	g0OZW6eED2th0irUHjE6a0Xl+RppVqhIwgjyGOwCjuv+QvRMwj78Sm1H8FA5XV0qCMRcEk7mQJ4
	N8F//BGcOrb31fN+RtHICbczK2yxeQe1DDCE/dSRX6JQyS7i5/i20NLLEfrkpbtYl0TEZVVl3ak
	+NyyGuJQu7OHkYB2Ro0FG54TbMnuqIn0gNq6XyL23Tv3ReiZA7Q68IKb3XPnquxheuqP4KijOOq
	mOx2KA==
X-Received: by 2002:a05:6214:2346:b0:91e:a519:270c with SMTP id 6a1803df08f44-91f241e0c23mr182367506d6.13.1794858548269;
        Mon, 16 Nov 2026 11:49:08 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23da6adfsm91844916d6.36.2026.11.16.11.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:49:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2hO-0000000ALLf-3aft;
	Mon, 16 Nov 2026 15:49:06 -0400
Date: Mon, 16 Nov 2026 15:49:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mario Limonciello <superm1@kernel.org>
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 0/2] lockdown: Prevent booting with lockdown enabled but
 IOMMU disabled
Message-ID: <20261116194906.GE2452510@ziepe.ca>
References: <20261102-lockdown-iommu-v1-0-00f3c2be4c9f@kernel.org>
 <44ac3423-0a51-4562-816a-fea881511afa@huawei.com>
 <a444421f-178b-49be-98b7-d34dfb147604@kernel.org>
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
In-Reply-To: <a444421f-178b-49be-98b7-d34dfb147604@kernel.org>

On Thu, Nov 12, 2026 at 01:27:50PM -0600, Mario Limonciello wrote:

> The problem I see is that in today's day it's incredibly easy to hotplug an
> external PCIe device and not "realize" that it's malicious.  For example if
> I leave a dock on my desk and someone inserts malware into it
> I might think it's perfectly fine.

That has nothing to do with lockdown.

We already have indication if a PCIe channel is external and
pluggable. If you want to demand that such channels have non-identity
translation that seems like a reasonable thing, but nothing like this
is handled by LSM today. Nor do I know how you could opt into such a
mode without causing regressions..

> The current mitigation that exists is that in the Linux ecosystem we don't
> turn on PCIe tunneling "automatically" unless the IOMMU is active.
> 
> Nominally this happens by way of 'bolt' userspace writing a sysfs file after
> it confirmed IOMMU was enabled both pre-boot and by the kernel.

Yes, and we are working to generalize this kind of flow to all of PCI
not just thunderbolt.
 
> How would you feel about at least blocking the user from turning off IOMMU
> (if it's present on the system) via the kernel command line while lockdown
> was enabled?

If you wanted a mode that forced protective iommu translations for
everything always that could be reasonable, but I don't see how it can
have anything to do with lockdown without creating regressions.

Jason
