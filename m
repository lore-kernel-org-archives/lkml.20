Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C02DE709
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384861; cv=none; b=sYzkj+sGzpMHyuK8TRxdC4BhMrtwIupVV3BV76PYTzM2D4AIFRZb4YLx5hiRonaqvJg+NWe65aq5pfpa3EYjuOCsOKv+vzMKQwGBW2SG7juhqZ7a6GURQ3uT4FQQv42PJ+xmDkr0c1mS2DqdvxcU3IzZHj8BM8xee/y6nkPm1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384861; c=relaxed/simple;
	bh=upNZa3t0W2Af8aUbICzQiCV1vQp/Hwy0fTwu/8O4BTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3H7nrx9HCQlIKYd+BrhmDTyEEQjyjjrubRtLjzP6QHZMePfOavFu5GtvAaT3ZjB4eTkHMsAuas8i1YWP42oPR5tVFsiRmV7KGuxnu+0M6u/TYgHUnQb2EUOHtOspvOn3Qwj2WJoNiFb7ioo83KpMwhLbcMlO0ZvvoviTNnId9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtMtt8LV; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtMtt8LV"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso823315c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384859; x=1790989659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZuMXzMudqgIHVV5MC4YBYyxnrbOVGK+M2cyTDyid7E=;
        b=PtMtt8LVpDdvMOBaSiSBQyCerRAXR8jAFeohyuYAKR6nlB2NKTphmGSI2opWT1ANor
         klb3FI721lLz3EAzunSyJUwP+Z7Y+QBCdXnraBj7Refn61ebNClpZzuKMOtLJxGa1zLJ
         basx01t5XzxwYhBla6zm5Kxwzez9cATMdPrGEkgHoYatWo4NRqOxEM3tJ/ZqpLAVyt+A
         4rHwoO5dvaBeETBLlQu4vxAm+wGs3E0iWk8bE9PVdjV8hhG7g5eGR4wp1nqpFI4qPNzk
         BKriwVD0K4rZGtT0RWECzqoXkulD2aOJAUnON6zbK7yJRPoDUaZI6Cn0BxcPz9tYJoWM
         dTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384859; x=1790989659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZuMXzMudqgIHVV5MC4YBYyxnrbOVGK+M2cyTDyid7E=;
        b=aa+GMIsJCG8d6ufay04Znz1f05VkeDroVS6LPujTusm3na3FylFSQSyC/NMSaJKR/Q
         JgXH+k3MT2fRFyv8i2tIoW8rQsKBRxgs733XkLeqlr9cWs8uTp8IS+7edrX6I9zdr4Qw
         4jegKj2/og3g72lpVqiJq05H4i5enNQrxW0E6jCbHn9aRvr6XDdlThyy3kgUyyhhCFff
         YY3g4MCPwQ4h3tTbHQcCgwQQmSKfpU60Qs0lwOoKJd91Qf3zpx0r4+sCLvKntt/tMXZ9
         1arY7LX8F4hZh28hCd+cCPV1CmiFkF3h3ky0Br1W3XIa12arwBw/zPN47aKcZFc5c5el
         wA9A==
X-Forwarded-Encrypted: i=1; AKwUvBw+8FYZLRwMKOKv3d6bpYZcbuKkYdwA48nKmTaY20BE0y3y8qH/sxs0MgsAUHIldRoxvKzVF3aOhJ6n+U8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVMODO20VjSBmmpPvwzOv/HZSuF942diXeqB5SawIqEn3q/RWN
	/JTqIeWpR0x4NFt3mgj0hhH1yMP0/broEDdmvDVnGHz2cjWcuFy0DYT5
X-Gm-Gg: AYBFou171ndpuZfh3KcJjPE3nFD2+yUASuJfgT31fFCphbpf6WSdiQm01IXjFIoRRZV
	83BYJ/6q51K4E5MWnfC+2V9xSMA/7W7P9/thf21JtjTGmptYWlzcBa3O9RBoOnbFTL3LHxalAJL
	RO9Tmr4Zq4WOzgxxWaZ7e3cJYUMoH8/mN/mYAU87poYOeokBGNbQed42tgIB2cWpE0xfd+OIuOg
	IIQ3YXedNeqMhgBgn1Jc2V7hDMKAvL2m0olPZ0vnx60JyEYZwG4s/zTRzgkOyVNWkGF4plWzoHc
	8CfY/iaXx/N/XvaQtqs/WHz23tshjp1P5MrkJnfH9q4AscdU4YkmylTMJSF6f7bgkhlV1a8NONw
	uBNGnO7s1JDrbjM+Kj6+fef8TGuzTVKH120RgzPTcD1OHKi9xECQ2Lp9y2N9OxiLPBda3V5stqB
	CeHmYpGuvVaro0vuGc/2FUIvH4C+DRpIK9vOj2gglVrwpbOx3zkuw9FJ/JaKcaHroCrSk+VlNDw
	pZ9BSNrG7n9eZk0B7TzJtpd6Zl8ejcTMYYomFQg
X-Received: by 2002:a05:701b:4589:b0:144:e246:a0d8 with SMTP id a92af1059eb24-146d0682969mr1639403c88.40.1790384858988;
        Fri, 25 Sep 2026 18:07:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm8488992c88.4.2026.09.25.18.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:07:38 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:07:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: input: Add AD7147 CapTouch schema
Message-ID: <arca0-sw5QCBrsdD@google.com>
References: <20260923191604.2213710-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923191604.2213710-1-robh@kernel.org>

On Wed, Sep 23, 2026 at 02:16:03PM -0500, Rob Herring (Arm) wrote:
> Add a schema for the Analog Devices AD7147 CapTouch controller used by
> the Microsoft Lumia 950 and Lumia 950 XL device trees. Document its I2C
> address, interrupt, and optional vcc supply.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
