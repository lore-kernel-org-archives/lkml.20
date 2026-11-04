Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804573;
	b=zu5dgBjnfvp1ehvCUBUJyWS2wVIRg15Q3p9zFo1Jxpn897WfoGyDXk2+YIEbPxFZCPiT
	 71/1u1mrw1dx6YU30nyA/0Xlxg8871tII+ukmNP+kDLxQTKKVdvmUPxtMpkKNp2g9ePIH
	 VtamJs2kk+MVXm31onopNzUmbSYT+WYesLARZUO7UIv5rxld4E8bSmvJuGO82GdpIOiHH
	 73Z8j1urG6bqouark1Z6VUmEG1ut8UQJ7Mj6oA+gaLXoPa5oX2elsYiZQBTal9tn34J3+
	 ubl7+f9Hsu/DO2KCxcgpSWUQcGDeI559vxEDX9rGmlwPQupC93/ptscAjAQw9v+2Wzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VRcviXFa9rkB7KYLvZ2EGeC1SAJ3+R/ZxlW12h1h3dU=;
	b=2sXGVAOlnwzqvKOSmzLrHA5UKl3tRNzVIAB7OEROYKqnqFxUK183xnXT6+KccjVzTxVe
	 S444Am18Ssa8YLPzQz4ijOUDVjfbDebUn7U2JXPi/dEZeqOLM81S2/fQu+iF0KPv97Tp8
	 10MgnHBukB9FIc+EpHyvFfDLnd4oYE10CNGUgvCS+rJ3j6YPdBkjumgytY8Au9PQVf7YB
	 YaGvZo3sFKjbT9ves4nGiRf1FuOIuqGze3CO1u9H/UtE2SQzqoTQls5Un9s5TF/66Y5G0
	 LGMt/1KJhmccsPtj3G0bqQAQN8AdYeuR3Xy0R/Cyd1B3QvGuoWwSx5332d79J4Ataxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=G5Sa9PUn;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C833606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C833606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=G5Sa9PUn
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-676804a3a22so850686d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793804572; x=1794409372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VRcviXFa9rkB7KYLvZ2EGeC1SAJ3+R/ZxlW12h1h3dU=;
        b=G5Sa9PUn1Mj5I8Osq6ere8TbLXiHE1wcqzVnZUMRHT/aAz0eTMAdvQttJXJmVwGquK
         kogqp9BQwfOm1NvE8m/gbYDpg3qD/sqjQhx7VsurmVC0+qUAJEjbmrcBtCCNY7X/qUeb
         YQ5dCeYPYn0aHuhgKlqoLC0kpWddU8OSHrXe2DbuHWMbLhgBnjhJiL9yqUYjgJ2HkYTe
         MkpfLyPHVXuAiBFtE2n/Bio76b9sy5ZTbIdu3tv2w5NdVrxEiocYIuMXyQjgs+tfp6Jf
         lU+zFRbMk92GiKs/izMMB8BqDUhabGORNhaSIFQ3+lbL5PBhL9DEJsrqgxUNtRzipDCj
         8VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804572; x=1794409372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRcviXFa9rkB7KYLvZ2EGeC1SAJ3+R/ZxlW12h1h3dU=;
        b=rh+nyMuEQ3DTd1AdprvEHimfOskbUbeevTWVdsaEQ+mjEyYTen8NUY73MongMx0Sts
         hcSky0UGBNGuygac/f8IqBWPn29i3VvzIkV/M5JFl0Og2zOchDOR8A1Jqh7OjgxyDRhb
         M2ZaDRgYTMwwyWaHuILHUJtHdmPpyZEGKb0Ui0vT2/EUR1VAZ+3K4mBv6Biw+8F6n8nU
         45HzW5DT9b87VeDRtD2lqnbvRppUNHMQDwdno7/lzaTVwPrjgldvPK+dAF4Gb2X5WDGf
         fiMy/1VaeyAIi1R3VxuJwVLqbK2DHMaX4Rkh9k3NJyHPAM9mh9kl6kuSTc4cAsSp+WRY
         Ff+A==
X-Forwarded-Encrypted: i=1; AKwUvBwra9BZEtUGi9nx4w6wAzvOChq0uv8k0ZkByn/MaYaHMofUv4dqzTgnLmXsrjGGofaEVXTQuaPiQ9Z1S1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2//X01AraX2GQh1UsRAYjz5+0+jbEKqAwN3fcnxkfjLOvq7Gz
	noKfJckd4QZZHuvaUooq4OexQiIw1aGu0f37aE5v/fPncpmSEg0DHJxeJRyLWekXsQ==
X-Gm-Gg: AYBFou3vszY0X4HET7zpDuHqtA5e97rYWcJIdMcibRlGIeZRqCfK3j5h2w5LDGZgZz0
	jBSKRuk4tSybiZmkE2f02Nmmi/6E3hQxlfFBzLy0KEicYIZCfSBbXiemHNyb6YeSOkhYGog/iiq
	kkFzKIg32YPazYwsWITGsN6usL7A3szTFEB9aD7P95qhDa0vSbgguPEcs8L8RbVSiBJPJsCSSX0
	nMfwxZpGoseIz8Kw0GIYGLY5fC4Odau1g/oDySXsatQUXzXjClCOX5X3gdu9WSDOtixp7jZQ+Y/
	jHFFNqZUrJEA6WZ7tM1JyWs+t8KHY8SoXKaaz+mhKAWave2nRbLc2gLNPYwjo5EtRBS5kzFpfUG
	3RT8HhYPe7Py2I/aA+qq7XnXrja4hAHc6EmXODvuCrZfjOA2jYoRm9P6tFESSdvqKv2yLXnD8ej
	dNsFVByVuIJHwOG+JUb7unbLMMZi3TarsXxOGljNrcS0EB5HlPJNBgnByrNslBUi8jgKfz7XUY0
	q9fDDe/pPEEwhQTXYtdS9sXp5ekRM2YWczR5aJE/qcX7E5lmms1gJCfUyOnfeQNMRhLj3rc0mAM
	kPKXLFRBRpZUALinKGIbd1gXPBXa
X-Received: by 2002:a05:690e:11c5:b0:67b:f39d:89b6 with SMTP id 956f58d0204a3-67bf39d8a2emr1123228d50.32.1793804572093;
        Wed, 04 Nov 2026 07:02:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e75b24asm20768526d6.39.2026.11.04.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:02:51 -0800 (PST)
Date: Wed, 4 Nov 2026 10:02:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>

On Wed, Nov 04, 2026 at 11:56:37AM +0800, YuanZhe Liu wrote:
> The port suspend is a hub class SET_FEATURE(PORT_SUSPEND) sent from
> userspace through usbfs, and the teardown is userspace releasing the
> hub driver interface, which quiesces the hub and disconnects every
> child under it.  Neither side takes a per-device reference, and the
> usbfs control request is not serialized against the hub driver being
> unbound.  That is also why xhci_bus_suspend() 100 ms after a disconnect
> looks fine: this is a different entry into xhci_stop_device().
> 
> CLEAR_FEATURE(PORT_SUSPEND) is the resume direction: in
> xhci_hub_control() it ends in xhci_ring_device(), so it cannot produce
> this trace.

> The patch makes xhci_stop_device() re-read xhci->devs[] and the "device
> is going away" marker under xhci->lock, and give up with -ENODEV
> instead of touching a device that xhci_free_dev() has already detached.
> For that check to mean anything, xhci_free_dev() has to clear
> virt_dev->udev under the same lock, which is the second hunk.
> 
> If you think the mutual exclusion belongs higher up instead - do not
> let usbfs suspend a port while the hub is being unbound - I am happy to
> work on that; from your message it sounds like you would prefer the fix
> there.

Don't know about Michal, but _I_ think the problem should be solved 
higher up in the stack.  It sounds like the sort of race that could 
affect any HCD, not just xhci-hcd.

Alan Stern
