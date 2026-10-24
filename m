Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847607;
	b=a1sa1YyOy+vpnIuDXU+sNd45ltCnb9rxdRm/yzyCkiFZNogwGbYBa9DYttBzZHkhHJ6T
	 Aa7ro3m4Ms0ImMwY1UkrJE9OgRLFFfKC8cf+Z5Hv4E2Yz+EJcctHCB0MIhWXaETBA80G/
	 H2pAbFWgD8OZlvOTiHEK9HNcOKHOvaGMC3b7q+epR5qtbV+xTG86Eik1xC8yXQDh0MAlu
	 OQ9Su5AjXOBJiwWBx6PV/K3OE7iO9FZMbzWoDsCSmjaELT4cNIT/IivKH5R+00O41BBKz
	 vU79PvinY7BXPeAQCVsNzhR6K9zuvq7oOEhkwxqN4B2ctaAuKz1KbJdz0fe+gF0DJqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847607;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ce0kdpDhTFSS379ttT8KRzX4UYhoWlsjBLxr2Om5QXM=;
	b=qVQwYduqJdKk3t8miQUsBny7cQbj6/McrTd5sTqk8Ce6Rolqz2IZeVsUXVkxMrpVTcIv
	 THMhIs3ZPvPCRJBw9KKZ3WF2OxctP7pvtet3lcx4ZXGDFLbsCdcDBr1aSnTFR6IYYwq9E
	 +Z4TW52mFkDkS5+NnQbew3Hxs0+ctmIxFD4AqoMmTjYJ9voUyoZ+1DlyJmkslGS/Y2pkP
	 EMM9HH6N5Lf2/7p/kvXvsZVZ356XlMpOgqwcxGSyoHTAQyjliVtp0/Ajm6/9vfmx+GP9u
	 rx2tVqAW0LaIksPzNcfBXuBt7UktXRqOjV43Ta9V7udiLpPZbC1CQ8hogcUIzImuNeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XyewIJ1i;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD48606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD48606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XyewIJ1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=ce0kdpDhTFSS379ttT8KRzX4UYhoWlsjBLxr2Om5QXM=; b=XyewIJ1iJyV4K43lQoKX19RJyS
	Iyu/aBncnWhJtLLji+/L1rlSeibLcjcSXgo1w0DjVSkRdsgnhk9gETpG1AU6blLuiHY30pdfZb7IF
	5wxutdILkmLEVuh6yt6jTztTUUPyRU/6IQOt9p9CWO2h/+rAa8XCdaxwDHTjU7CSF2dmaJBwiIdu0
	hvxKXJhdo5B07C+Q4vsf0lQg3i0zZW9LcgWZf3lu53uNlZ/ZvsT9y6DCVfGx+sCu7PIELMzUeaK6k
	3fGuce9BlkdAKSzavsBEJbaTv+dNOwBp5YvIpKaZjrbat2xrwaATjCdnXbzWyVmrIpAgIE1skz82u
	TfVZFo5w==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xKbYg-008swf-Sn; Sat, 24 Oct 2026 15:13:15 +0200
Message-ID: <9981dfe9-9d86-4c6b-8524-c31e2a8b3343@igalia.com>
Date: Sat, 24 Oct 2026 10:13:10 -0300
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
Subject: Re: [PATCH v2 1/3] drm/vc4: Implement vc6_hdmi_phy_disable
To: Lucas Tanure <lucas.tanure@neat.no>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261020151948.83459-1-lucas.tanure@neat.no>
 <20261020151948.83459-2-lucas.tanure@neat.no>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20261020151948.83459-2-lucas.tanure@neat.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lucas,

On 20/10/26 12:19, Lucas Tanure wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> The body of this function was missing so we don't reset the phy
> when disabling it.

Please, improve this commit message. At the moment, it's not explaining
what's is fixing, nor how.

Best regards,
- Maíra
> 
> Fixes: 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI controllers")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> index 56e6a35da357..5040f014bf7e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> @@ -1197,4 +1197,9 @@ void vc6_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
>   
>   void vc6_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
>   {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
> +	vc6_hdmi_reset_phy(vc4_hdmi);
> +	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
>   }

