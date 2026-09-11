Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6931E82E;
	Fri, 11 Sep 2026 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110358; cv=none; b=NbA3RX32gimBstPeWNyUB2yk059dJaaVIMYDcSQ5/YaZRFXuv5LJePwlWNurAcMDFphvX+gIEf1vAhKALU2e1t+EwS53UQM+dIfIO/W7xVXqkR/iH1LE/G1VxiNYJ+SrGKA/eIXQKLuHpd0hSKQ189GYLEj4ZSWpkFEqYysvVFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110358; c=relaxed/simple;
	bh=SftwTWxj+gpQdjWhxqghxpZodyuHpBPKfyEPa2X7LW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qUS/2o3lQkgbu+2H8aRtVT/kO09dcb68xouofy4TAdGn722Fi2+vGP/iE+F+TiaDFjOcUvlJ4U5qZhWy3HXqm2rQiOYuHwnGtq433A4l5w6LRBby7XJLG/Bl8q6+G0JlNZ72DaW0FbBKsMpl5+vWxMNBRa6L9KhSU8EuFIABxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZTxkZKrL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZTxkZKrL"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F59F63C;
	Fri, 11 Sep 2026 09:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789110246;
	bh=SftwTWxj+gpQdjWhxqghxpZodyuHpBPKfyEPa2X7LW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTxkZKrLlwBD9BDIXyRQoRox2ICMbQybz3mdJu+Iy44KZxS94zzxIX+jFoLHcz+rE
	 j8IHNqh5ZI/lLs04+x5LF8qZ6AJSmwcETjfThiBqxmHT9xyO1XmiGEzAEu+lw/p5KE
	 0b8oNb38Kb6EtOHXDV4s4vZhOZKlwtQD3APLB25A=
Message-ID: <05efdc35-a875-4c3d-a551-4dbce8db1e7b@ideasonboard.com>
Date: Fri, 11 Sep 2026 10:05:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/rcar-du: dsi: Implement DSI command TX using AXI
 memory access
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260910182003.31612-1-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260910182003.31612-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2026 21:19, Marek Vasut wrote:
> Currently, the driver supports register access mode for DSI command
> transfer, which limits both TX and RX to only 16 Bytes long packets.
> Implement support for DSI command TX using AXI memory access mode,
> which extends the packet transfer length up to 128 Bytes long in LP
> and 1024 Bytes long in HS. Support for DSI command RX using the AXI
> access mode is not implemented due to missing test hardware.
> 
> The implementation allocates a DMAble 4k page. In case the command
> transfer is longer than 16 Bytes, the payload is copied into the
> page and sent out using the AXI access mode, otherwise the register
> access mode is used.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Use dma_set_mask_and_coherent() to set up global DMA mask and
>        drop GFP_DMA32 from dma_alloc_coherent() gfp flags.
>      - Fix DMA memory leak in missing fail path in rcar_mipi_dsi_probe()
>        and move dma_alloc_coherent() almost to the end of the probe
>        function, so as much as possible of the probe function is devm
>        managed.
>      - Unregister DSI host first, then free the DMA page
> V3: - Limit transfer to 1024 Bytes
> ---
>   .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 50 ++++++++++++++++---
>   1 file changed, 42 insertions(+), 8 deletions(-)
Thanks, pushed to drm-misc-next.

  Tomi

