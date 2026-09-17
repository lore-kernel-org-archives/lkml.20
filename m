Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5E30DECC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607393; cv=none; b=jt7gT3F1LLtC5JRoPfbEsNvdduUTOTWflzCGW0gqgf7UWZiQNNDQgqos0fkCwzYi1E1Y2PRa/hXsdFfqPXwIA6F+x5Bx4J5rQRyuVVacZCndclYpTMlQ3wvhiFQ+rNbnoDZ8ALzrRbvp4O7z5o7RHvpsTAqLL0TkTRPCcSwqKAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607393; c=relaxed/simple;
	bh=wW0DhjjxvZrBOHLiq93URvUQIpbh5rFvMHFa6dq5YkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNd4x2K4OJV++1LZ2BVeIC3sdm6Vd2GhUNVRlnp5AlUDq7/X0+Frl0sae188d338aWyVf6bHj8Dq/I0lzGS+Kzf12ddgGfVrVo1bxMS5trxnapaZZxuVnj4/YR2XMKvxh1IBIS46ApWVl00t0fc83pL49d4Oas9rtDgvlQCPrxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YazLXU7H; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YazLXU7H"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so186783a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607391; x=1790212191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=YazLXU7HdPJVy8mhtNM95ZvSFubBlE1qHgbcS5h06wF/jF/smujnYMw+FqYDZdG8Lf
         5krFtNTHY8YsWsbe17qqIP0dblGNxn5R7LhqubF3g+yCZZLiyYDMDsak+ElKBNOFP4RU
         VFqGISEVhnZYPmTuBEMhz7AZe5gCf2/golhZnc/d6g+i1q0PhW5cgnA22a0/FVQlmFJ9
         H6TR7QYAosxlpPyV9qA5PCFqwD+tUqC6yV+vw9LYacrwEu6SdKNSYBU1+xPka9d8IxYL
         /IGpRWT5+e3G0RmVku+HbiSv+H+PCxnZZthjp5mlCyXD+RhdPENjttPFquI6/gbmnKvq
         uiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607391; x=1790212191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=gx3Ma2j20P8bGyH4pmAIKThrC/vIFWAKnB+NR5R7aeZljtD9KlxraqQVTZWKIdZtbe
         R2EI84mQhzGL0G+LZbBpCYdhnjmP+F37yCB1dEeKxauSX0bCUqRH5u46R6AH41ZpG/Jh
         Ernr85wtj3gsQdcn2AMnpGPpkBmOA8Rg/3yubrPpzZZheGsyOrhdObqybVH6bArkSJ7t
         kVavWKixqm5j34PTqiyhZKmIAuSsQH3SNp8W5wPHOgWqeK1M7almPeUrQ2uSw5cT4czF
         jnH7pi9CeLwxRvgZNe4K2dFmUGAdXTMPEI3D8EwVbJjoi9YfxZ2UrA2WiWL6elBJ+uzX
         dm8g==
X-Forwarded-Encrypted: i=1; AKwUvBxNrRFR+M4YRtQbuz5wvDJFGKCqR+oIaJXiLK0NwdesA+hP11iuTp1W5UYis9LzO9ftfD60KCEeI90GLes=@vger.kernel.org
X-Gm-Message-State: AFuF++nKiXs5xf6GpaRZ1+jiJZUTzjM61+bdkREko/rfMDI8yM/oB2KP
	e8KPPyvpzKsljIZnVm+ncDopK7eIpSQwDxAJxZoZ47Yq7luD1ogPPyk0
X-Gm-Gg: AYBFou0x93oxvnGK2xDR+RbY5zKhU3akv3liFpzzQ5ZNMIPnQO7pgW2baADOwnxcKts
	VIlSlCRP/wStz8za8ovSSVxSgdLtHzQqGyMLbbzUDaLthW0d53kO1qlPlOTJGGff6V+xO4Bif7U
	tsJpyrt0K4qu9z5FzH1S4PMymZPBJ6C3mynB6X/E/WtB5XEjEw+oy1jEZpq4sx5MN5vNb1ErXeE
	HbuIue9oFL3ABzwYLiYzaU7GbjlmtNI3OzquwqSpsSlLi/UjWufOPvFfVYZPj2dnXmrn220nN9N
	ohhE4Xh2TblRklEyG2ZToFC+rT0PfKrQklkpG30Ndu4juQMrITgxM9RhDhuhS3kv0eP8/Ck5Hr5
	3fbQ+QlkI5yS/TGiRsilKUSn67fKNpwYmS+d5YcD6m4vRcSVASIQ6uWoa0Aj8ZUfpu2YHVo0vRB
	mzIfEcf3G29SaNGI3toJTzSPy6LHxGFsd9vsTtWoPPJgPlgtNNg05uQ0AIQYfwl3APqPpoReQ0V
	PXsIoTxYfhp
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr11932602a91.23.1789607391606;
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm8545272c88.5.2026.09.16.18.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 18:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for
 MediaTek mt8167
Message-ID: <f0ceff89-4fdc-4d93-8e0a-26137e1f4279@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-4-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-4-l.scorcia@gmail.com>

On Tue, Sep 08, 2026 at 07:38:30PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
> resets instead of 12, and its reset bit map table is different from
> mt6589).
> 
> Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
> add the IDs that can be used in device trees to identify subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
