Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394634;
	b=bJ1BKDhlMZfTkU4wQiV9giXDh3D6mhCCuttiJNL1rTqOkEjCatLwGYh6sdigbuyQOMgW
	 9lk6BC4DCCJT+Ff+9HJjOB5YyG8uBNvZ1e3OGo4gKUXecsGpm+8usPHtucslsM2I2KiZ8
	 Evc7mkn2UcQLNg7fwAsLnvdEx1I15cwl5ioubwAW4Uw9XVHrF1aCCufYkdCYJeDuHwfLO
	 t7XhmbsW1cVnkMpMGntWH/Dg1dVz18LWSYpwgmhzmo6nHenP8w+IyYivpPAI01jj02J91
	 qK6G7ZzWNBYhEjI7PINignpjDuNbN2x/1mlRIgMZeH1XG4Z/LH6qF/Ua5FdKQcO8XWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394634;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=y71I2g5CiY6ZLFtOOjFefsyXa2Y2V1HXYev8hBP6Jd4=;
	b=amg7ImZI4YDI8TPqhVbjsmHk1vMCYxySEOWWiyyAtoVcK1z8wkbd9cRpI0v+g1b2MtaN
	 wsivNDK6mEnIpbCDcJj+1H1eow6PyQ1tlq2TQeshcweBh8JhXwfXlcOHI6pChjaQR5RTU
	 SN7Dktbs3DImqyC1YIAGeWooLuUy4XuFneYYN2sNcwyOYt3zzajxjuNeduGD3ikz/dtJF
	 3PsRpbBgNQ9Tf/5f4+IS0PfYdr6VVviWMXihFnh0WWoTe+C/09iaSFbkHs3SiBQR/tf7q
	 U9xHFqIE4OJC1A3B5gitoW92dzg9bDGi2xpCI8mUyS8M3s616hxvMmDJAyguzKOm8Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LJcz3i2L;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4963606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4963606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LJcz3i2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794394632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y71I2g5CiY6ZLFtOOjFefsyXa2Y2V1HXYev8hBP6Jd4=;
	b=LJcz3i2L3K2BBo4ahQLJAfzdjdNtDuB0P5x1fyq9oRGFJsvsu0KNYquhiAj4gMl5weB1CM
	IWtDF8ao6daFvIPurkPa/ce8FWBdvAADaRy/nDXcE6hdkw02/b9H2+dYwzVYJmnOjn9gXk
	HHEioKqJ+wcugjuPb/vQJEfEbndSmJA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-VSeC4wBmMpOyp6eJ7S0wcA-1; Wed,
 11 Nov 2026 05:57:09 -0500
X-MC-Unique: VSeC4wBmMpOyp6eJ7S0wcA-1
X-Mimecast-MFC-AGG-ID: VSeC4wBmMpOyp6eJ7S0wcA_1794394625
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C3941955F18;
	Wed, 11 Nov 2026 10:57:05 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2DD8C19634EF;
	Wed, 11 Nov 2026 10:56:58 +0000 (UTC)
Message-ID: <47221876-07a8-46c1-86f7-552402a8d5a9@redhat.com>
Date: Wed, 11 Nov 2026 11:56:56 +0100
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
Subject: Re: [PATCH net-next 02/10] ice: dpll: serialize changes of the SyncE
 CGU registers
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, min.li@microchip.com,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, grzegorz.nitka@intel.com,
 karol.kolacinski@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
 poros@redhat.com
References: <20261106121005.1327603-3-ivecera@redhat.com>
 <179433320107.994134.16333323653199953270@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <179433320107.994134.16333323653199953270@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/10/26 18:53, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit fixes a race that already exists in the tree, but it
>    has no Fixes: tag and no stable Cc.
> 
> --
> 
> ice: dpll: serialize changes of the SyncE CGU registers
> 
> This patch adds a cgu_synce_lock mutex to struct ice_adapter, which all
> E825C PFs share. It holds that lock around the CGU R10/R11
> read-modify-write sequences in ice_dpll_synce_update_e825c(), and around
> the ice_tspll_cfg_synce_ethdiv_e825c() call in ice_ptp_link_change().
> 
>> ice_ptp_link_change() does not hold dpll_lock, so it can already overwrite
>> an update of another PF. RCLK callbacks are serialized by dpll_lock, but
>> the DPLL core is going to serialize callbacks per (module, clock_id), and
>> each complex has its own DSN and so its own clock_id. With that change, a
>> test toggling RCLK pins of both complexes lost an update.
> 
> [ ... ]
> 
>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> 
> [Severity: Low]
> Should this patch have a Fixes: tag?

[...]

> Another option is to split this patch out of the series and send it to
> net.
Done, the patch went to net with this tag:

https://lore.kernel.org/netdev/20261110094350.184185-1-ivecera@redhat.com/

v2 of this series drops it.

Thanks,
Ivan

