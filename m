Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817963;
	b=jVdXCtj2ngCpYt4ExK+CYxZaEi8SAztfEU7eqNbLdx2ZCHHnUAnvjD+cQrLcsJEozOWm
	 p9IaLhNtzMTFHGyx49pQBMny3b520VL+5xFb3FGdAH/eW5s3SbZdhcn3exZYgpi/Mn6+X
	 77ierp7DTIxdU7lUh6e9fFVyQGhxGpKOwDPdoXt1XfrnyhtDR589FknoF9T2Q3sF3Bv7r
	 pEbQloiWe2Jw9BEM5STHgV8g3v3tvN3LEe+4lg1/iSxp/X7YpoYkv+bGgET701UqqgQKw
	 IbmjdyrCrttCDviP1Pa+P7QlagLNOU+qTBYhBMxK5rR9nB11z0s/yUHfKS4ZrE67TRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817963;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=No5JIuucjLs8BzpbyUjmjyreKlYHY6YhCoies1t4xoU=;
	b=ol3OPa8dzSe4XJxHJXC0gHREtH7H2NkcPLqQeWieuDUXnwipFK8/PYAn2cKtAZee5gZ1
	 ICiIB+UCEwIYceaoZAluLbb/yzzSr3leick/twPNfm7G6cgT7KO8tiR7eRgvtgWZIH2yZ
	 zxsc3kQyI5duSfonKa7WqS6q7wkW/Id4INVsdZwHv5fGJ7Sr6dqR+9AnI68cjKnYD2zvs
	 SVqfodZCacbsSwBwA4HizE7ZpqxFjpVscDBO7lxGOoReueZ+CJNwdpPHGfFjKMllJ7XgG
	 wJhuEDxGVT3VaDnzO8sYy//8goQj/oAvXwr7SZ4Hvc/rdA/IxrCKdl7idvoCb4UCtlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ibtodV5Y;
	arc=none smtp.remote-ip=210.79.60.2
Received: from mail-m602.netease.com (mail-m602.netease.com [210.79.60.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B8606A32A;
	Mon, 16 Nov 2026 08:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ibtodV5Y
Received: from [172.16.12.90] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54d1d2b18;
	Mon, 16 Nov 2026 16:32:29 +0800 (GMT+08:00)
Message-ID: <55fa6972-1c9f-4964-87f7-f36d1d4aae3f@rock-chips.com>
Date: Mon, 16 Nov 2026 16:32:28 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] usb: typec: fusb302: cleanup device driver probe
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1e37c7ec803a7kunm156da1f53fd3c4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQh0aQlZLHUkaSR8fS0
	lDQkhWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ibtodV5YXM/4X3EIOv2iA602Nv98N4m6trOptJLqSI8ihgvyouWtUPf1hRYITGbl7CbfZkg/UpYas/GRlDFAJ3n1yIGJHpA88OFZ+XyYEKpRjMo01D8HQLfj93tORJzRBY71hdoraZYajK5nP8CWDYF31G9HrxiFZsIZhynGpRs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=No5JIuucjLs8BzpbyUjmjyreKlYHY6YhCoies1t4xoU=;
	h=date:mime-version:subject:message-id:from;

Hi Sebastian,

On 11/14/2026 12:42 AM, Sebastian Reichel wrote:
> Move fusb302 to be fully converted to device managed resources
> instead of having a mix risking leaks and clean up the interrupt
> setup.
> 
> These have been tested for over half a year locally with different
> Rockchip boards. I waited for [0] to land, so that the DRM HPD auxillary
> device registration can also be dropped. As that series drags forever,
> let's get these cleanups processed independently.
> 

Although this patch series has received the RB tags it deserves,
but no one has time to merge it.

Perhaps we should split it further into smaller parts, focus only on
the generic parts, and send the v9?

> Note, that this first cleanups the GPIO interrupt handling and then drops
> it completley. The rationale is, that the last patch has a (low) chance of
> regressing somebody's system and having to be reverted. In that case the
> custom interrupt GPIO API should be properly documented (as deprecated)
> and we want at least the cleanups.
> 
> The series is based on 7.4-rc2 instead of Greg's usb-next branch (based
> on 7.4-rc1 and still empty), which is relevant for the first patch as
> older versions had devm_kzalloc() instead of devm_kzalloc_obj().
> 
> [0] https://lore.kernel.org/linux-rockchip/20261020072816.180-3-kernel@airkyi.com/
> 

-- 
Best, 
Chaoyi
