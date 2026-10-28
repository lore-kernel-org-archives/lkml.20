Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793146150;
	b=pdFBJBU9rRg4/pJooEZuNUrhvBjAZrQTs/w2bKLPRu637AZayEezGijezFcSLXV+U5+F
	 i0SKyhV4sxWIYsmLFmFYwE7z92ZXJPxG61uvI3jZzrHXSdcYp+XZDqWmKylCX249cJUCf
	 1SFHmTChhn1E5W0sMM9r+YjMI7q/9729X9Xa2eEw2BidNQRzgQ+p3DtXSl02WTBma/aWm
	 IHk7AymFVZq14r/oA1Zh9ZRoCTxA24hp0r52bRlx7L1kUXl3qQL3AxHutrNSSiDfteoGV
	 b7pQw8ocLQEZu4oZkhWn07kcttN+ZjvUS8vustKY8nu1RO0bWQIm8n3+mHbnqr7pEdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793146150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYaht9shbFWxq4kumOpndSaFwe2UdArezXMn/5BLyPQ=;
	b=3pInUmg7+31p8Ygz/y4haBnVsGsH+gLY+RrmnGAozSlL/DjGfVMq73+QxEKpobTrlswp
	 7/Mft0f0kUT5qY6301DuhJ/V1WvCGgdxhafcvkj29VRigZ6JM30tcOidv62mXuTCd018+
	 bawb2LKqNIcs2tHsGJ4owrs8xaFHngK8kP1C5R51LfqFax9DJMISLXRosaY7lURxPGwSa
	 jbPcP6mU23Tlr9B3YtRgh8Ptzn11cU+4FsL9TwS9a0BrcpHQ2aB+1ZGNsKR3TRaCRmTa0
	 +GgkLSB+1EgGIUHT12TCykK3CMQqekBg8pzvrbzrirDscOn3wtjDlhAnrvelX0+DWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c965U5rN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A270606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A270606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c965U5rN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso724076eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793146149; x=1793750949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYaht9shbFWxq4kumOpndSaFwe2UdArezXMn/5BLyPQ=;
        b=c965U5rNBMbffOcZNVLX7SYC5p8jyV80hOEHtyvhV7AogFI+ESUuCFugBF5gwdEW20
         1fiy5dd03AVDB/cQe0C2Q/RBf0zXqKxCwbDPMYjT4MS2A3E0X5mvX49a6WCzw69f8hoA
         /AbRH0Zpauzco43FsFU+8YvGTT1N96yrAqTD/QS8XIuKhvU4b5Q/iseu+NQ+WaunolGn
         vFYPzzBjXIXCruLcSApWJMHiAO6IFXuZLuMhC9e7kIi3vz7n1XlfZ9tFjiF5Mnj5EJlS
         R0pxRi2kX9r75u0t+R7/97vtTf04NnYctSwuK8dRSx7xAlpU9SukX0TDQzOmpY4B4XM3
         QBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793146149; x=1793750949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYaht9shbFWxq4kumOpndSaFwe2UdArezXMn/5BLyPQ=;
        b=Z3eWTvRryOw9aW/3zcwKyJgJ3Qq+JkwevD/EkvmPPoWzATDuJwqVIWRkH3GO2TcYyo
         pE9cLjChAHQ82Yiwoswb3dTyWumEvoh3dA2PcVmQcB2KtNaGIm7A6J31mbog9wu3hBJH
         uFv+IKXhu2HWYNOBHM4rUIvF7iL+PdwkPfA1DTjzSaZrtwf+1AWb6GFd7TBamXZJtoOo
         RCdcekAWNhLyiwAVpreq1SEzS+ZDAMmLd5wviDrVDMJkJrocqs4OjqLEbUTI76YPEalE
         RyDsfC20VpkZA9uaJs45FzowzcD6KkL16SCtZNTwXhcsrXaGgyY2rhwvYdfXkyP2Huvy
         89Tg==
X-Forwarded-Encrypted: i=1; AKwUvBydzHeQLG95dM5ygK4061Gqd10azay6qaRcNN82cFtCjOKuPgJys+EoWrrJgEZPEebz+LXp3mM6c0XtJqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHyQ4Xemi9fmTZOEmDMP7lwfiPGy97ym1qvRGkYiVZdQ+LNIpp
	ETo0llKUovB/mNzde7JhmB3JNxF27xHqQMvZpA0iGcQn/Ej6zco1Zm8=
X-Gm-Gg: AYBFou2igDuqKxLPN1gGwCcRMkrbkMGtlWhPT6s+XIj8oa17ss0D7J7OBIykAVvghbh
	utlgipY8El9yc28mnmalEFob6lQAxu+U/TMMJjrsKxfZRlSm/oTTp5beppL/2hD+0LQK8Lu/GMF
	R/iCM+D9mNyb5mbrHvNY627Ys2kBA4R6xJMcVJngG1h8T5QEM36aVY2qylE6MycEX7tJyNfidhH
	nnLAnSLp/CYHNZr20vHvFGjM+0PQfqtq4/IHfIug+iPy8jKfHRnvIZgwrvQ0F5e1Nh3gBjN+fva
	Zud4VFvKmfegoKPz4EPkohW+a9b+YKREdjQRoXmvjlW40n2w2IKXG14DFrltTUhaNUYaUJUbq+q
	/OWeHGj7tAKkkWoyl8JhT9myU3G7/c8tUmko9RO2Rz5uhazSGkB+KN2+4ouO2P8w6jSLbt6G5XC
	jDPMeJhTqTr95dWpHNXvjheFmbcGv8/x4m0hq1KpZiMkm5S0hMtuMgfoOD7ySR6M7ZybgYabiWw
	Ub5jzn3HC55J6MsSKK6G2uWFMuv86Y91SbY8gD6CfnaRw99ZVXDa+ROaY7Ioz+aU1Do6GrzP09w
	kzdMTEx1idwQo9c1qw==
X-Received: by 2002:a05:7300:c7c3:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a2017929amr1084712eec.23.1793146149163;
        Tue, 27 Oct 2026 17:09:09 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.118.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239198c9sm336354eec.15.2026.10.27.17.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:09:08 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: helgaas@kernel.org
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 02/13] PCI: Disable pcie port and access on D3 on specific amd devices
Date: Tue, 27 Oct 2026 20:08:41 -0400
Message-ID: <20261028000841.6816-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027230042.GA516670@bhelgaas>
References: <20261027230042.GA516670@bhelgaas>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Reading or writing to PCI devices in D3cold is a problem on every
> system and we should avoid it in generic ways.  I don't know what's
> special about these MacBooks.

I did not know about, i will try to remove the ignore_access code, and
will tell you the results, i added it as a failsafe

> > +++ b/drivers/pci/pcie/portdrv.c
> > @@ -688,7 +688,7 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
> >  	int type = pci_pcie_type(dev);
> >  	int status;
> >  
> > -	if (!pci_is_pcie(dev) ||
> > +	if (!pci_is_pcie(dev) || dev->no_pcie_port ||
> >  	    ((type != PCI_EXP_TYPE_ROOT_PORT) &&
> >  	     (type != PCI_EXP_TYPE_UPSTREAM) &&
> >  	     (type != PCI_EXP_TYPE_DOWNSTREAM) &&
> 
> Nor does this.  I don't know what the purpose of this is.

This is however nessacary, without this The CPU just catters, so something
used the PCIE address space or the config space of the bridges, unfortunately
dmesg dosent show anything or journalctl.

