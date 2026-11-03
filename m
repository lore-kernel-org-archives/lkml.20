Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744305;
	b=DkDS1FqTw78wpLivAndyXMGUrccN+5cPJ39JYeuMkCa0AB+ySOR0CGnUcelG9nXbY7f7
	 yUnhN1YvA9QTHiVbFSbQKi8jV8yRAfsS32X9eFMulf4sOjffOzzst3wvuS9dKEDRc2b3w
	 QUA7igcgpQw46Zgng3DFyblReMUKyTQQyMAQwjtTQSHZwt2skKA3oMguK/qjjfTFnCAau
	 NrnXju0emRoFCSGKJxD7PFadu3CKesAsOEVTm7KP701mLsAu/DNfBGvbhn44WqI9D0orv
	 sRZfqv9QSVH1xK7IAdg+o7pVpXFWkvACv0oO0iRTSceCW/01iI9zFkHVLcU1Y63Je4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
	b=MHGWZ2ZcPuuEELGfFwjChXXUdi2YASoI0qCNIwHA1V4GdsNvWxrlpO7sPaqMCU26f0pK
	 wxRRlD6NSo7wHiPhK7IToB6Mg8HNu5cXAsjKqvuTkjSsxIeYdcGBps1wLSnO/lfaHGbKo
	 pSxynAdEP8sNnPD36EKQcu0+QcSX93RW4YljPsHA2lTQOePtvLBdOqjEsPQtYdgWpijGK
	 2D2qMfdA4HJpmpaaZ/M6TiN9mYeq0/KFxy/y9G+1og/mIuRfzQc5PAddgUys9R7uCltWi
	 dHnAI3DeG9qysuw22tn3qkZD8/HjbKe4w9LhPCBJn8BtPpK6WJ6gHI3hVFmuHdlT4KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Q1I26F2i;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E8606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Q1I26F2i
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f22a8515eso10923885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793744303; x=1794349103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=Q1I26F2i7qTnQcDnp/V5gFkScUwzu9WDLkuUmT90rA1siQ07PmAy0n36nD8KQf95fr
         +tKyPWKhlOBBOda01+skyIJqpuuyPp3DDHSk/+U8hTD9jaIA7incIpQF3oHDAeQLGJpr
         +/EhoMfzHAc1hCbSLR5RTn0fOaCUXSz9sYEBauecZAKlJkreZXJ8NY7EPXYljr4Ywwgu
         jl+eovTps7y5WA2rITD+mO8s8owkgFMXwVS4dbSZ1V2+W5I2hBC7cQNezjeLWYI8xpjd
         NyCT8nrnH1kWYHF6iDbzzHQt4NH4+ML26MuJFOEhDbjPMihDs7qZPa47hp67ChOXPPCK
         YHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744303; x=1794349103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=WXXnnKjN0ze/Eab1wOMXGF7bGd4YyC1Ye0AnjxcHJZCMb0Itm0B1Jkv2ZdnaBsFdPX
         CaHDeqK5uyN/VA3VGDMAU+hOaRtFuZTrZosSmTBi3W5jDKUWHToXjCXJl3PId5ZM6vM3
         MCkZE+iXZKYz9Y86pODDTC6XHFOBlzk5OxykZ01ZRrjblstEXFPaQ/EFfhYstroOQh4v
         pIWncJ/7ADzPFdx344WMS5v98pTbA2h8kFBHqwKHzN3viy4NMi0yPR5T2VCAJxvQe+CQ
         SZj5QJoJPx909+ieulfSduyZv91TVC37rCQPvToaEU6uMGSTl6EgiXLIrCxr+c3jh1Yb
         iJpw==
X-Forwarded-Encrypted: i=1; AKwUvBzoa9xXnvQntJgsXsAumhZcg7NPTtWKy70w01o57jA5QtDZSQJri5Q1BXOnFQg4iejPIunmSy6EJvKNoEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B/nEETPL0xAtFogH/TWtM3c4DxcO5/L8OXM7Voz/sGl+4KL0J
	5PtX78O7eBNia1SRxWd2gi31TA+nFNs+FhUS3mFXVgY98aLPQkMvGtcwgI+NMVgQpg==
X-Gm-Gg: AYBFou3HtTV6J7iedSLgOGeA31cnZjW/qsVwiYX3QScLSw2HNoChCLC5i8fWtAWy/jG
	p2TeWbOFxvLuZkQN/t4HGHmheQnKbeOKc4m+cuxZUlgNCneZ0u5M1vDbZemszEKy8m3UzDIe+E3
	t5qy1XHhzGWLbd2hTdrVybXBnpEmUp7qHorYAutdmXGoYoOXzW62Pn7jVhF8WtSUfO37b+iSDBg
	HUzZ6IxaTiYg1IZyez5wyoa0PQoZ/0y0wEqiy5gtQRtR6Mlvcsw1Ailj6fOOcmmbphgrldVdFQM
	wHGeS9UPOPuuhQtuCeP6zeuqYnQDL/cGaWpIQIppf8H36vbVjTnMAAfBLTkaUmIzRlazErqLaJf
	bh74sn90sG9xQgRvSRGnEJtXZrylfLATp4GifaXYCr+mB1nKJ8wrHzcCfA/VfMsi8YjToODQNFJ
	KskFSsC+IJfMfSkT3IZYDwfsY9n0lL/sVgnBPsPHu2pTEP29K917VX+ObCoUjM7q5ws9YbMomL+
	smTzWXk3Kz8HnbtZHFOLkK8hUMb2ai9Q4ZsQGA1KbItms0WPkluvg6P/u/5ody6OWzwoIk6hDrP
	2BUMSM3Qcee4CeSVbEyp5JC82nJB
X-Received: by 2002:a05:620a:3183:b0:93e:f4f4:346 with SMTP id af79cd13be357-94421796ea3mr2392800885a.39.1793744303281;
        Tue, 03 Nov 2026 14:18:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47e72fbsm40889685a.18.2026.11.03.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:18:22 -0800 (PST)
Date: Tue, 3 Nov 2026 17:18:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, michal.simek@amd.com, robh@kernel.org,
	saravanak@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-xilinx-of: remove the driver
Message-ID: <3c385fb1-551a-4717-a1e8-77b123cec0e7@rowland.harvard.edu>
References: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
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
In-Reply-To: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>

On Tue, Nov 03, 2026 at 11:47:21PM +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
> the compatible was never documented as a binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
