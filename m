Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4220372673
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484498; cv=none; b=X6v8piZu/vIVowO6CbATDj+5KdVv26+9rTCfGAZd90/qo+0h8gkP5qHnCWN7TyHuRfqGzeofcq2matKLnnh4u9LcgqcUOK/MltYEbWIfUuomQ3rvuTNI6kiyMEenihsntXB9/jCKRNip1X6Y2mz7+h4jdHGANoOt7iR4w56Buns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484498; c=relaxed/simple;
	bh=1fbdwqra8hcU7hJAomibU8hl7s8ORH+jeNUHHdUh8m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR+4M6P/YEHdoyyHLcOyhwoiF91B4UIiFa/Pp9PcJIUmAqM4ULcUOUE5dGNL11vq6NvByYRKp+OYr7KbbKqSyuv0KkUuU9YajCCloglRwaGo3w4uqlkmlw2s4qK1rcfpYF0pwcyzt8DaNqchY1dJ37Reb4CiYh/JCCqzRxoJA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WTU6DjiR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WTU6DjiR"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec392so2769921cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789484496; x=1790089296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=;
        b=WTU6DjiR+wcEQtib1n2Jn+NHwfCFueZ5gcOzxaBTsYmCsABGQRSp500/lYpukcCQ8Z
         F3qZWXieZUQMk8PUiPl4wRTOtSPMS7B+i4XdnHmL7oUn5Atph3AeBSaoDP6sBFqbd8n/
         FQ7uYGLC2ghWJqKE7t7ycs20ywSBNM5EYPUqu/uO+o/dVsphYn4NquJaS32Oaqkqxfjl
         95VazU7SViBjOFgp0ocZSjkEiL2hkeyVAEW32oLAq/44rIaHw/OPxCwi+/5iTpRFq/eH
         iR8WP5xYJEF1NgyitAfWQCrt8MLCsgQg2eeTyS02txeJOjHD6X501x3akjb5+khaQMIS
         /DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484496; x=1790089296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9rzR4FHW24jqWw2J2lJ2bk+jLthZKfD8kBK912Z0ag=;
        b=S2UbAvSoUQyPFpO7fcYmDwyXu58feAFnpYK2yzimWDRut7z7XO3vQX4+J0P2WHZWoU
         0QhK2yXEWT55BKAYy1j4C4yCrCO7VfgPLkZ3HTEwRw2izOCl8N73QK33y9pPYHq8vbqQ
         euolWhOEG9Ubtofp5eFVXyvt39vDHgYAHonJk9IjmGJkcy8TuDHmvsuItQl6hkXxKn+R
         lky3qF0UCPB/bPLZPpVNcF5CSTfMXjuVl6PTJBReynIuoYgqIP+I7wNLTk61Dzj/lNp5
         S8Xxhy62sNyqwsKjdp6rw+8HSamk1mzOYIoGOTBDxEh0uccds+5JGnURs05bBjacjPq2
         WzvA==
X-Forwarded-Encrypted: i=1; AKwUvBwScmBvU6UThXt8IZDuYT9JngbjJzmeyvNDJ50QvaXp/UUA6ERdcrfzk1hNCkaCg50iIr+5h+T8RsGAdIU=@vger.kernel.org
X-Gm-Message-State: AFuF++nGUN+At7b2d52C8TMPMpLf1L/GLI8wv9wqHrBN0+8T3exJASMv
	5vIn+o3Lpe197l3OlrXU3hLLwzszPE/khWzuSm527ltA29W8bB3F2sYJbbH6DvqLEg==
X-Gm-Gg: AYBFou1Vyvg9CHCmknR+2hv7dmPbNFJoKeLVsj+//GIaU5RdSJXb9aUqAHFPx6T7L4f
	aT1sEYnauHCdKCyFw47AGOg5PvJHG3aFwMzyJrrU4/sMkxusHPZjZ5vDi/Ggn9u5aW6lfvaHfiX
	uPMkHaJeAk0VNZg2u0X18PiLojQBuDzJrWocOp0Idpf4x9WxAgAUav3I6Rlp2ApIC4CABFJ+BUW
	cpwFtm4WJHXUrpyXRSz1EmAUkPZd475w9LAnCquYV8MOndD0o92mwD/p6E36WFX8rebBj3K9Q22
	bRMHtl93+IqpjRukq+aM+9BjSSX2/9J3+MEVSrMwHi8YEwaTDhGO5dp4+d/k3/5amth0Yx8W2JT
	icakMp80y2YQawVye3yGSrc+kE7CLxJAHIFnn72Ai7IoXizIPWPs/DBsWyuuIyd2SIRf/9Jhc/6
	mfJ2GACYM4tVPKf+gIcvst0rhCzPMLtW1Z2y+dhCX7wZN20cXNJ8NS/CV7hd+yBwefdorQJnbA
X-Received: by 2002:a05:622a:1dcf:b0:530:e7aa:ef4e with SMTP id d75a77b69052e-5312626d895mr19384701cf.16.1789484495571;
        Tue, 15 Sep 2026 08:01:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53116090064sm34071481cf.5.2026.09.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:01:34 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:01:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Message-ID: <c65da485-90f3-4393-8836-3b793047bfc4@rowland.harvard.edu>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>

On Mon, Sep 14, 2026 at 09:20:07PM -0400, Myeonghun Pak wrote:
> These four independent fixes disable controller wakeup after HCD removal
> in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
> cleanup when notifier registration fails after the HCD is added.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Assisted-by: LLM
> 
> Myeonghun Pak (4):
>   usb: ohci-da8xx: disable controller wakeup on cleanup
>   usb: ohci-s3c2410: disable controller wakeup on removal
>   usb: ohci-spear: disable controller wakeup on removal
>   usb: ohci-st: disable controller wakeup on removal

For all four patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

