Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC184A3858
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948434; cv=none; b=q6TEQe8aN5EhQCpJmRc8PKF0Aa8G1jAdFBEk5mm1fUqLP8QHPiQWEL1ayK5hfVzly0ag+z1VhUmGcv1xvTbIInkV8jZqpFfYQzBkK6B0KFbuvzz89R7rxBaw2UqDqNPLX8IBzcUolAkxfAvPUhnMaHtEM4XGl1W72ccuU5E4h14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948434; c=relaxed/simple;
	bh=ihZ1MFd5oR2jYnPMXliHs9oCseeCex80gley3PuV2sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i47pK+PhnecZNToFv+XUVMNlkboYCsWS1vTRa6paS5K2ozbsZrDyAVmk5PiubGOzOsloabuq11MPfrczgnxQCq2xmaDvjYn5szb1IOGW/JmfoWcc1P7YfERIQAq2UBp8uPdjgkL2QQT++cL4PecMSuBc+++uxYSw1t7K5qQ1daY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=YntXkAa8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YntXkAa8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so691175766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788948431; x=1789553231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MpSV5WFYmvBknbjwvmDSkjCZ5uC0FxZSSeTd39Acy0=;
        b=YntXkAa8vR5gmN9KHEtkbjnB/AtkluYUf/wIxRobvv5hvmAqQTvJkysWxdfsxSeQvw
         0uQI40LgbpPFHV1w9H2I1RT9b0PxXMFeoE+rCBb7EpjsvBF6EglS0xMB5bdah5w4LCeU
         jv6dCObP2bxGqKs2NLKXS6MjBsuyAPRJ5ZpuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948431; x=1789553231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MpSV5WFYmvBknbjwvmDSkjCZ5uC0FxZSSeTd39Acy0=;
        b=lY51MhNKjX0wdDFs8VCJ53YmIJquzh/1i1H5ZOmu92D9ymPkWnieiZgExXOK/3U6Nt
         OunkpYxZxR0khBc0WE7eqdoG/FUSJxKAPphIYfAuZvreONuOpeiMfTn7e8z0QW7CxjTD
         gH8piR/4HHX/pqEi3bZjHAQwu+CZnHH7Gvfe++RB2TPJklPyYIuVSJVBWIUtgkWguMP/
         i3TvE5U2uglBd3b7akUVpXS3XLwF7CZlp2KaQnyFdjVjJz1o1ehrsOZV7YeI0BxXsMxK
         j060MBjCpNP/jexVk7k/UNBZvZ9EcepAiDNAvqvPlxZID3IiBnrofocjkJ86m/GhgxUC
         GCNA==
X-Gm-Message-State: AFuF++nBprbWP4umgQjNqwxSVovSlHOZs4KrTWTvfQ7LguI2mgWwCL9N
	4RY79l+vxAc6Mt/8+5O9orLO71CVFvu38nvnqaPT9aelS9/DyEx+3mzY38ITdIL9rqQ=
X-Gm-Gg: AYBFou2PL3JUPJFXV8nJPYtkANVhOMNxZi8Di+U67dkDU5A7xJBXNRU50sEFLm0ZoIW
	rz5Odgg9iEh1gsoICqslWxGRy+EocyyPpwbygyBLJUepu3Ojyx3YT2WRE8rofvOJVG+Jk+hJ8b7
	NZk6s6vh43U1/7lSO2QEbZsB2YYafl/xagjEDrbQpzS1AV1vNKJ6waKPPFWwLMGQlC4e0aisIRX
	9t2Tnxvy5tGn7LjVxYtAD19bkVm8Rlg+BnFXmYnqpiMWDijRmielgvsNkwGUUjyiztTYsK/vKXR
	HYPHu+Y5uRQL5xJU7t+TTq2bU23zEpgOuEmBnzdNSIbaLvQjxu2t7o3bSBZy0rSMzMb4lKyMH1d
	/TlZ4HXeQZ0J2v0zWi4btlKd8OP6+OMdDI3imuepdAUVkdkj+tOzpM7PoU8pwYbxfytPqql3chP
	IzKiHh4CkZZlyeTYd1AEODqQLcNAxYJMYE6VM46ahoFYs36NBDPeM8oaGjRYA4pdSw+YYO3WSg8
	393byFTGr8YZn4HcoFm4AVzyMC/C++ojGM=
X-Received: by 2002:a17:907:7204:b0:c26:19e3:e98b with SMTP id a640c23a62f3a-c2619e3f02cmr1125576066b.43.1788948431181;
        Wed, 09 Sep 2026 03:07:11 -0700 (PDT)
Received: from carbon.k.g (79-100-31-116.ip.btc-net.bg. [79.100.31.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm745699166b.34.2026.09.09.03.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:07:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:07:09 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260909100709.GA20988@carbon.k.g>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
 <20260908111011.960876-2-petko.manolov@konsulko.com>
 <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>

On 26-09-09 08:36:23, Krzysztof Kozlowski wrote:
> On 08/09/2026 13:10, Petko Manolov wrote:
> > +
> > +	chosen {
> > +		bootargs = "earlyprintk";
> 
> That's not a mainline suitable argument, drop.

Well, i'm a bit confused.  These files in arch/arm/boot/dts/intel/socfpga/

socfpga_arria5_socdk.dts
socfpga_cyclone5_de0_nano_soc.dts
socfpga_cyclone5_vining_fpga.dts
socfpga_arria10_socdk.dtsi
socfpga_cyclone5_socdk.dts
socfpga_cyclone5_chameleon96.dts
socfpga_cyclone5_socrates.dts
socfpga_cyclone5_sodia.dts
socfpga_cyclone5_sockit.dts

all have:

        chosen {
                bootargs = "earlyprintk";
                stdout-path = "serial0:115200n8";
        };

Is this some sort of legacy that isn't accepted in modern days or is it
something else?


		Petko
