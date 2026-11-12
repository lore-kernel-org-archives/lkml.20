Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504299;
	b=tmQw5ON+652L9rWtiKReJ54PjhQtkrItOpq3PziJADrDgAtMY95JbZ22us5xdYnpHRop
	 qfR5ABe3eDqk1KqFkY8KBcM72UuM/SdKMKF8MHnkG0bHYhwKl7dwWwbxy1WBQq1LSJjkK
	 gN9UbCk7z69A7TlEWqTWzHQ6aY8dRxkIuXPsF9YBygN3dG731K4T/d25GRM/O9RphYzVC
	 1htua9+jAltgSHqb09YRiS1e+JseoHmVJIX7aF8YlVWvxkdqnyw9c9u+wfqLvB6XGxAqj
	 FCpe0KnJlAaAQFSZ/nIf2Lod+RsDLL1JQAgownpGe1TKYqivfeQSSXd1/s6jA/LUjzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UEs+nzWRaRp917aoYI9U1JFVkzp5XZBJ5gUnGKU3NGE=;
	b=aliiQhFYbpt1PEBq1Z4DEPhN8oGCMv8+mKZUL1CCfk0kspHGejYdgXm+Y4T0LScSzUrJ
	 uB807I6E8SmQBaIZ3YNe0xGlWOjs5R9LDR34sSUg/Qf0DHmQCy4rZpjCaE6IA6FYVoh7j
	 zbFbHAypBqk5DvXbSc8DlHiycoRjBJ6s6EaCIyeweUKNQt1f8xITALGTgPMXfKSu3ga4w
	 Qy98VzaPyGCkhIEtmQoy1DUE/L/poRgm+ejECU7mJbX0Szv9yT16hqT0xqj9WE8+RDMt6
	 LRU+r5ewl0gamwHxqSRG8b+pb87at+CAxBH4Q/FyP0nVinketoTePodaZvixFxEKTww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4y2j5j7;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDE0606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDE0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4y2j5j7
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f6728b1b7so420eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504298; x=1795109098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UEs+nzWRaRp917aoYI9U1JFVkzp5XZBJ5gUnGKU3NGE=;
        b=S4y2j5j7eEmQWSOHqnVtpeUI9RpdBZ9lvLBNkDHNvYXEWFRQI54XWg0Sn7wz79Z77m
         8UoX7W2fsYxj0wFOX/x4blpkW928Nrfc2rxLxYYgIVg0hUedDAxEOyPPaF+kUUcwXne1
         VKjWv1ftJ/6FOBxqdkqKcGhWBgqNzf/niatC5R2jQ0k0LM182TbJl8yVoIREQZTOA0yg
         ZnDLmeH53vcMnOG5FYCoZUlrgWBTitOgd5+q3vY1ucXWdvZ7zd4Wrw1e6PufrYqPfy2Z
         lA/N9rAxMfBlARwHcg09FhIr/jidSK4fhxoennVOCup+lc/pPdxqSkByl4HRPJ5pY2x2
         +jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504298; x=1795109098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEs+nzWRaRp917aoYI9U1JFVkzp5XZBJ5gUnGKU3NGE=;
        b=d5eA7g29/RpA1UMihQzyq5TpeWj2m/RyCzvfEXOcfhVg+JQDdmh8mzBSRICCWsEL4T
         oOhV3SqtoTedA36thjOo2sGyEwWxGLRash4BgpQZHuXBf3Mew1EBmcNXM+YGNXOnNWGS
         ymnmookdU16DtpJMSzGbUy7GxB/RGlwnjOWaZXU4O0uVLm0Am+1QveCkpMDiKXDdslZi
         y57wWlbQZ0HCqzxITWB8TjVh/Jx2/6vAVOJl0HKRPHH0SxR/Z9fXrVbUkD23uyau6Mfj
         jnVWAg5i5u08L98GI4QdxD7rhePRMQZGLudq/utCuoK2Q4CB1wO0PCSbYVPoUc6LiPBr
         Vg2Q==
X-Forwarded-Encrypted: i=1; AL+hErG5AFUpBm2WespiZFj0dVvi9nm/+7PJlAEeKdUxkHkoOhPEKiawDpyPWI+l4h3FMCc2HvUU2Q8PYxULjfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bD+N49ux5bEq8jkPbDudU8V6qE9N5O/wIUnm13+BCA/JuEAa4
	8Um5NAOFRrfmVUxPw9FImyFd1cqeMHpPhSlpmtHY85Wk+kphiiQevbxb
X-Gm-Gg: AYBFou2NCdEywkOQ0IbgXu+ffRpJhLnRCJyc6gb4kVphC+hOktpm0nd4cx95gkHttaL
	2ocoGmiWMm+fZZJvcPS1xoOystRWyzUwjoRhPtU2nCrVm02xKQeKI/v0o7QHivYyoTbP6HizJlS
	QLD9zlNeNZqrs6t0si2oOLSmhrEqkD6HMUzzQumSl88HdeViizxOizadTLdbCrwQkyfpW/NpDPd
	2eFWZk6cJhfGvlF2u1NoHmoGVDdIzocsdAwYu0Xd/Y6+osjXjev/3wBfY1LmA3H+3ytQsZ3Sim4
	np7AZ5wJAjPUJIOOdueKBMyhnbtxObL9XYxJq81iinh6HXmraOMpyMm8XOQrFL1qWJKNlqS07NR
	9p7kAIx3iCQXqbQP45cnFhYU6dhyeq3eQPCQmPHk3rdeTQQPD2DfGX1/Ep7gHf7cRANhFeJYuBn
	IFcaYTOxul5nhO/gER4GSG5Jt1H5LX+DDnnF8jARjQs5cPqXIQbum3WVyoOOthhmeAXwAQzePar
	g0Pu/yjz8LWUq/tR8eeoXIXPpyAyZ3exVPF3lPeEEIU7arHi2XYBCdBLyqPt1UYmMAAgtM3/MDO
	IW/kOW059ASKBEGieZ33+5o=
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr2596773eec.3.1794504297384;
        Thu, 12 Nov 2026 09:24:57 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3792624fe41sm1107451eec.22.2026.11.12.09.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:24:56 -0800 (PST)
Date: Thu, 12 Nov 2026 09:24:52 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, 
	jacob.e.keller@intel.com, bjorn@kernel.org, alexanderduyck@fb.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net-next] net: ethtool: request rtnl_lock for
 ETHTOOL_MSG_PORT_GET
Message-ID: <avX2MdTZePW5ssrq@devvm16445.scu0.facebook.com>
References: <20261111072724.3295527-1-xiaolinkui@126.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111072724.3295527-1-xiaolinkui@126.com>

On 11/11, Linkui Xiao wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> port_prepare_data() resolves the requested port through
> phy_link_topo_get_port(), which requires rtnl_lock to be held before it
> reads topo->ports:
> 
> 	/* ports in the topo are RTNL protected, but may be accessed under
> 	 * netdev_lock for ops-locked devices. For now keep them under rtnl
> 	 * protection, as no ops-locked devices have phy_port capabilities
> 	 * yet.
> 	 */
> 	ASSERT_RTNL();
> 
> The dump side honours this, port_dump_one_dev() takes rtnl_lock()
> itself. The doit side does not. ETHTOOL_MSG_PORT_GET is served by
> ethnl_default_doit(), which keeps rtnl_lock only when the device is not
> ops-locked, or when ethtool_nl_msg_needs_rtnl() asks for it:
> 
> 	need_rtnl = !netdev_need_ops_lock(req_info->dev) ||
> 		    ethtool_nl_msg_needs_rtnl(req_info->dev, cmd);
> 
> ethtool_nl_msg_needs_rtnl() has no case for ETHTOOL_MSG_PORT_GET and
> falls through to "return false", so on a device that opts into the
> instance lock (request_ops_lock, queue_mgmt_ops or net_shaper_ops)
> PORT_GET runs with netdev_lock only. Such a device that does have a
> link topology trips the ASSERT_RTNL() warning and reads topo->ports
> without the protection the xarray is documented to need.
> 
> Add the missing case. Like TSCONFIG_GET/SET, PORT_GET has no
> corresponding ethtool ioctl, so it is Netlink-only and always needs
> rtnl_lock.

[..]

> The bug is latent as no device opts into the instance lock while also
> carrying a link topology, so it cannot be observed yet and the change is
> compile-tested only.

Then why fix it if there is no bug? And phy_link_topo_add_port has
a big comment explaining the expectations?
