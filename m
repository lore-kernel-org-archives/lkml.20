Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB947353A74
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305918; cv=none; b=ThvHnzee6lHlDeb2RpsEc8W5GcaRj3ICvmWvoQcRFbhwMk7DOGqL+YZXeWdHUi6RebkdUKHdhGw37kDmUhDbdVVt6pNf0p+d/0vbbqEkL6sznciO8deFRsZa7tAtx08k6YEitOgyY34C0PrWj4Qsp14Ihtq7SA3ZKKl1gJiZ3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305918; c=relaxed/simple;
	bh=d5X+0mGIr5O8jmugP6tkVpOw8QahBvvE95JE3VMBuPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8jGX7xAgmAY15FJuIUDT1pLKqseYCm2zZXZI1m1zZCYT2OmoZp87DEQqCi6HHPaUfiHO73aPFTZdxSG/55M6uQ1zOjIVORnfC0faO59iQfkoC3Ws5upu3ApcQOSayKwtOdmZHtqbUZwUG0D+qzzEjEpgdJP5Ls/Wgihp79+qds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCnhSAUt; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCnhSAUt"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25187so221534b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790305916; x=1790910716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=BCnhSAUtt5+w6FB06nYONsG8FmUCJKrkGgmstKRysKI/xfVA+9NQoJBgysI8mgZeZ/
         2EzCIEGJtupU0LNKRUB8chQb/hklFmaDDJjVhQnqzC4F7gqd5uEug4ULEH/g+LxqQCG6
         vdgJECUfqELCpbRjREKWwOvBNYuYXpeERgdvLT9ggTAAkHddvZs/8PZiTh8fgS/Ybu8V
         Ws8+g0z1bY5zhJxhbrS6v3KZQe3PTu4KHm0ckb/zWbd5P44RTrlj9GZX+1xZ096Ihwda
         J0ZSi/STWj5SeQCtIV1BtJ5IULq7T5+0HfjNl+mVdPw/RbyRQRmhypBrXul0XKWNv9Lc
         QuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790305916; x=1790910716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=oNhJR/xvtn8mymOAEnEoXEBLf1IGuiV9r5vu/isII4V+UMdcztvzPZTZMdlg+socGe
         SNdMXl6ZeGBuhXonBS3Z4dlNlsPC5rku2PKZ0iGYdYCsj+Y2n9iXeyQVq603Dm7qktbI
         WHkrjTUjgh9J8g/Mn4CKiXyjP3B0IBzE+ePRiT7PMAOI4ZJMKF48p2LaSUiyJ3CrL4Pu
         889urqfo71+RrZ5abkqWDSPxSBo0H08phqtMi0KYaPuKitcd8Zl10/lJReahtuxACgVq
         u4j+h8zDtQ+vnceVVriikVUuk37E/bb5S/nUpIQy176UR6+R3TYZcq2IQiTh7shK3jYH
         +ZyA==
X-Forwarded-Encrypted: i=1; AKwUvBy7oWCmsJBCJ784bXbnY64VZ53/QUyuNr6+j10IIeTLtoGCBvcfnJEgdKoiCKurHBQBwZvHni/sqk7n7Mg=@vger.kernel.org
X-Gm-Message-State: AFuF++mG1V8qD2p99xjZzLZcrtsStBP9/quiJ5X96Xu49PJgwqfhvtjL
	CRI8U1yHqUecyOhykEIWBJInBJFYOsuBkNBlVLZmpKkLRohDV/ih5BZd
X-Gm-Gg: AYBFou3m0ld9np0SC0la0HhwEq1wkjUwkX8MMJkzGrYtfv2T7RzAuhuLJDCeByVgDM7
	5MN+UxKXvcJchf39fDgOrS4lIzsnxnmJhEZs6GJKS2tMtJaEbnWgd+fzJ9ucfX/ncO9Utbl8MBq
	VCVmRzeGmxH4b0/zd+eEmnQLRQMJqpUrRG0yYlJFs+HYOL4DFWM54XIfG+C1t8ik80P4K49Ikt5
	qtfaK7zsF/tSWrJgVqq8Tp5FcfhYlNgFQVbNmexhdVjpvQAVP4RDYN1w7lewG+BbeVj1cAyangL
	TUAdMrgV2udZis1tSwlvase7GefM35GfwIaYNTk/fARmbl1+JZLuancbXp4VCRyhzhKcz7LS8Ks
	ki0dIAlj+XvJJIuPY1+PUbd1t2DSvrmwHXS0qVpRlnRgY8GjfQVahdSV9Cb4TRpNqvVYKeg1WBg
	rpq2AqloZd9Xur0bNNLhThQVFgdxmPszAgaKFm+bKvhNI5VyMXAwf5DVPhtgpsvng2+W3WQVDJq
	6sxHG3P7gla
X-Received: by 2002:a05:6a00:b4a:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-87e9995cfdamr3809048b3a.25.1790305915932;
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe82eb49asm408300b3a.3.2026.09.24.20.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 20:11:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: watchdog: apple,wdt: Add t8140
 compatible
Message-ID: <381005d6-0aca-4d71-a08c-58aa7da7196a@roeck-us.net>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
 <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>

On Thu, Sep 24, 2026 at 04:17:09PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
> M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Applied.

Thanks,
Guenter
