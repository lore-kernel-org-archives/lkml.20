Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B254E3EF7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718528; cv=none; b=E9ORi4HG1mG/v2K6K8kMapdX1UZ3rQ5WFlKFSHIPQs95/Rry/7vJ+8BHm1hzChqTmTUwjW/4nR4EOOumBVKsX0JUzmougeJaezRZbLCQGyl6B2YUbUvs5UzhX8AES+g+n+gz7BTBt/4VPrLKWk1vXXbe13+I9WZJYxoppnE9J8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718528; c=relaxed/simple;
	bh=jEAlHCaf7HwrBMr2fEr3XlegkapBlO+MtAspedqTvo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2pqkmdNYsuyLR3fFjQqiI29fPkmHzzaru060/AtDw1RhuZstsz8u+lo/U9PVMIo8D8azJpB4oHAe5ApMWxh8+So6rVHwapqwHF20cXSjEVEs1rRm3HzgGxeM/vlagJvwRiGdPdwncPISAuBEs+o0bdOzHyu1A4vEePeEkWg2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=GqpdP/Gl; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="GqpdP/Gl"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so1877829b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790718524; x=1791323324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnGR8D9Ofu0keKVSYqoY+bfqxp7ik+ClHNVT61CMuqY=;
        b=GqpdP/GlEJvVvytyTk4nqQJmNitdCQD0RMVjVLvTfBNan8AkB3HO9RwtZTdlOUKYZP
         zjlceeV/o0uOKUpAcnuK44sBIWI0kkx4CrNICwDpLNjrbAJL8KjqwKkT71bTCjz3XDY1
         0elXE5glbbzsRagBdQAZmV7L05J6zINy5f3Bc6CLvwu6Ntjoa2f+sTpOk2yotzvmjn62
         Q1ZwSkpQbVzbmTjksZdGp2Ka5k1TyWRk3lw9XCGL85vCcTaR4J8GcwvERslRiGzrMHEV
         AMmGIpjuHIIbkeQeIVEb44s36/M8Ur9DS7cSLkECGHxjGpfjUdQPeOy/9RbRjuOA1WXJ
         z+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718524; x=1791323324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GnGR8D9Ofu0keKVSYqoY+bfqxp7ik+ClHNVT61CMuqY=;
        b=pGSSiFq60QazX4QxHnkl6FlUim5LcZPqL+U3av7CHxLnPFzMKT0jxZ06btZylqEMwc
         IknppzaNQH0G2ijawIJPGDHF0Pdy0K4KPkvSKppUcVdAATAcmYAxeCPTost9z/iF3xaC
         vpSJ0cBLUYyl01UU4VM3Belrqe0IAaimiN7tdqnw5G2+h6Xl4G9vCnNuWNOuDHqA8vhy
         QOnv46/UPaLioEfFgH/XbxmVyMXXJlQtIIbfMaDkvG8suJqXiS7MtOA0lpib2HCyhmeB
         Fp24VOWJDQMJhwoWOUCBWidV7WIltH+mNg0puIF2lmKZUXntntKXbg9idrHuLensoxxs
         tzJA==
X-Forwarded-Encrypted: i=1; AKwUvBxEwoeKzo1hSuJaK2nHi05Wb++daIRRfM+uBUtZ8psj8uyFTaKAdI743/UmyPA8CvlLOc+n3Ky1czEfEdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+YgmcgruwfgHoG2FL3/GpKNCvX4zd/SRFZ1HkzwpG+QPsku4O
	OK0q5LV6j1w+0eJMX6H+UCnisJARnEn4k1GIEPO7XRdoWVd3mt96V6q1uOepd2E5rCg=
X-Gm-Gg: AYBFou26oGJWiFD4gtHCcXwclwsEp9Q1ga9KwcTx7HXpp7go32f6r7+r0NPdwmMnJuC
	OKwuPh91Sbohj/0aJtak7hGiB7rHCUmCcIN6xIKen6YjWsdQm9kB8WTI/IELznXuHybc8QWLcTQ
	EtaJV4I4jUsQUZHfGmpZ79dFK/oDg+ppOSy+fjGy0HL0yqct2M5MLbQcfZisQfoJiWcyLb+TpjV
	CXG+v6WozePJR+NbTBy5PikG8WjleoNYnNE70Cjuxoj7bGi00d+F0ZtlC3l9Q+Lny83kuKWSEdI
	ZbPXj3Ux2hheP0SK4NvEhFuto/lBiUVWEyWCLbf132cn8jwdGn6dGwl+A3UTIa5ITozlTdL80OO
	cRnobv6rvN2diZ4Qz9xx9vc5Esp7fdfn39fYV+lMk7GovkPWg6cdGJb5g4SFITxJrYqCK1QxntQ
	J6SiU2qLXhlZjeVe2SqDuATXkTcK5NDlsVwm6durHsEolWusdhQoCyxV5g8bVO/CmGbI+cdvPTa
	b24QNmUBTtLJxUOqcE3yvw=
X-Received: by 2002:a05:6a00:3005:b0:874:705d:f63e with SMTP id d2e1a72fcca58-886c48b3682mr475937b3a.32.1790718524401;
        Tue, 29 Sep 2026 14:48:44 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868ccc884csm451233b3a.50.2026.09.29.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:48:43 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:48:42 -0700
From: Joe Damato <joe@dama.to>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] atlx: fix kernel-doc description for
 atlx_tx_timeout
Message-ID: <arwyOuM3q36/q4RX@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayush Yaduvanshi <ayush37735@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
References: <20260929101714.51579-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929101714.51579-1-ayush37735@gmail.com>

On Tue, Sep 29, 2026 at 03:47:13PM +0530, Ayush Yaduvanshi wrote:
> Add missing @txqueue parameter description to atlx_tx_timeout
> 
> to eliminate kernel-doc warning.
> 
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/atheros/atlx/atlx.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Joe Damato <joe@dama.to>
