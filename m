Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7604A091C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199419; cv=none; b=hoWSJvvB1ktLfamapu6J3bo/NdYMlQGy1BEKXbAZ3lRwCN7edO3N+XdQofS7IgQyE/ShJc3dONC5Wah9a1DbHQj8XiYrFfhtmupqlaBmzrD9m+w0BOImOKdGiQpbpGaX82E9UrXSdQZzddW8cm2lrXXb4rWLXXApeCcjA52Bv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199419; c=relaxed/simple;
	bh=rmq4A/3b9cJXS2TkfGSiciCNONWN4osSAMXLb20UGCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ4e7gBOX4sC/ExhVAMGPGJCdlM90vcLhbG/li+bsqK9Yysr4ApCOp6Au2VZaTLkPIR0+Pv6I4WOqFAMIJ9luio5JbBZ612bWEFy47FZO/4qyx8I0ThR0/1f4CmM620DMDKba6iqPhoh+0J4kJIbes9I88UvPOtLWY7XHUF6Kfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BExlHJJ5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BExlHJJ5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d032846c95so41791875ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199417; x=1788804217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=BExlHJJ5As7llPGIPpe8Ch3cyhunebjXRJ8MIo9J373c8PKOxgJCxc9N2ON7uBN95H
         YyJYXFfrguRGG+fmop+3YNsHiX4PbpQy2SFOA+vSRgUulz1YVV6FwYE9rexh6vYujf5g
         CNzi+Adm7+bBo/y/NIb4PNvHyR4JEfmD/m+3RyL1nM7A0/nZbcBTqrwYzwldMzGk//OJ
         RJ4oRHAkO6lCc0y+lCDwd+E4UM6QOE7NebLL3MglMKu6pffmlOE0qMwOKPx5OUsZrV1H
         TfkSZrFRWvcWuCbtFvKTtRKXglO3TB3MyogRRvjjH389p8LlqXnFT50iqwmFauvHFqdG
         MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199417; x=1788804217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=Y2fJLMXQbJb8C5jv9xUDFCUssRlUHjkJYfOi61dhpJV0wsVU35JCMbR3H0bx714GKY
         UZ50KVwDLxqJxRRwNnqj2rsuIFFlgS46+KpHTFEpsf5pb5jGvHESXXzHtytH7PiArfT6
         +zFnfm1HQQa86TY+3EuspOV0KgOLUxFXwbj/X6pTNtzWn6KAEYMzgVBgftbXZFgzS+Ee
         nSKDcv6Oyy9MynIssfG7irBLuLjToDXQZeWhuHraRxmo/50wFyaioNVS90OOge82q5t1
         O4f3/o0PP3/cH0KMKTUj6yGG8lb1djHm/lcwUZbc8ICci69yTzT6SYiIZXto8ylJA3+B
         mNSg==
X-Forwarded-Encrypted: i=1; AKwUvBzUd84IZD1y66TDOc1lRrrqge+b6Byp8GhkSkV3k/3nFDsp+rXJjP1ggE6Fj+DoXq1oIA3/0+lu3xhofuY=@vger.kernel.org
X-Gm-Message-State: AFuF++nIJaEjguR/QgHCtk0ecfMIwUkmuFAPo7ikOJbfhjUxwkPyfceC
	xDJc+t+iKHFHqYNvHBxeEXfwgQRt6jlmbCyLyrL+EN36V4pkSsXHZMad
X-Gm-Gg: AYBFou2IQw+DDspG9Qv1AZ98SF6pSqGX+XP6Mjdtef+CehRn99toS0VIyYQweOtiQhJ
	AIewMjJt2m2ZFvZF1o3q3s3Rm7+PLacmYhdV8fw1kFQS3aK1HewKG56PjkOm63uBOEiuogjADsD
	nBQ4917lwj+iNmnr5yJsHGq7AADi5/jJjzVqyxrEOpfR1dg77n+IRlJMINo5cfMHSWYdgHkKEIy
	ZU0VylufU2IXd1Ix4kdhrbsgjht+wRTq71poOCoKwlT0H+oGqMDstU7b1/gSpvQGXR3iUkxb74l
	hUfoArr0V0X+h/MfG/kHoEvEonryLNnpicrWytrE/ILJiaN8SCsvcqHqYlCTdLXXFt+/t/fikes
	y1JIaSHpWZzVFthuFPqIQd6ANra/sCBddwiDIPLZpZTMavDAWOQdHcAodVV8hEmYY794dHrBaZN
	BtCiOWRvf/k/nEY/sRPX9cN95vD6YJZIk+LBnEzXbd01TM9s2LClQnCjpRaVEcwi/IL4BNuqMZx
	w==
X-Received: by 2002:a17:902:ce8e:b0:2d7:107c:917b with SMTP id d9443c01a7336-2d94a32e0c0mr28121435ad.0.1788199417098;
        Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm31904707eec.10.2026.08.31.11.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 11:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
Message-ID: <25786645-f9c3-4fa7-b1a1-11b3704c3806@roeck-us.net>
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>

On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
> devices are single temperature sensors and update "#thermal-sensor-cells"
> property to accept values 0 and 1 (passing no argument is equivalent to
> passing 0 as the first argument)
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
