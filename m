Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585657;
	b=1t0FbR1thmE7yAHNKveEi1jMs/R+032sTtj0g/+dfZoM5Aoh07whRYUqyhqOPvaXeMg+
	 Gw+eumOhrk+22j8/XgIulvxsHPuRuv2kXKq34oW4agcbZlPPu+uyptjTm6tURK4Txb6aI
	 72ufKJUwZK2Zw0EATB0Z6JBsPSD4lobiQzdOY1MUqAv3tJUUzGsneKL8dvb2VMeSN7v/C
	 VHIfnmDlW0rcbjvaTOpNLa561l2ABoQet+oSO0uZ/W5SfpPloAtmLLwedguGET17ve9Vk
	 9ls/QXbIMPpu3ItxgjULZ0No3O7nt+LDkV/SWhR7/W9FBSNkIXBx5SfP2eInwBm2puA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=76hK192hwNNcxMcbm0UzywzzRTcZcsnY/gd0BW0R8wc=;
	b=VRiTtB6oh417IiEQOTo4+LVfgiP3/CcQvst8bbmNtfZ5+MEsb+9TDgMv7LqjgKco0IPc
	 QvfBAa+HYSakDHqO+VnTbBMdP7xflO112b9deJ8dib2N4WaZRCkuTijkda7CbtbuxjFq7
	 Al/0/44BQTLe/tEgqj2OEGGaT03ep7/Z3yXBXBPDYfLQYyGW94x1fgoLcLrVOqPGpQ0id
	 eFd+1bTqb3afP/BUqGEj8SlEXSZMJX2d0kUwgDJAFk4IeIHYQIyJEFyGSycWENB7uQN3Z
	 IQNnXJbIN0BvtzL8vIi3DcNjnd6m27EyCVRmQKj8bHG5fJ63whL7e6ybASdqOJHGmHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNkjY8c5;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D96D606B5EE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D96D606B5EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNkjY8c5
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2874018eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585656; x=1795190456; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=76hK192hwNNcxMcbm0UzywzzRTcZcsnY/gd0BW0R8wc=;
        b=FNkjY8c5qVoxECoy9cH5IqZVYrIDNUHHh+EI386wFkJOvTo8i7gMp6DoGZKImma+8a
         4xHxER0iCZjoiQFZLsWK4msE8tgrpKQPrqPc6h5XkCBmfK6NvlQAVvavnjIsy2WPIV0y
         +WHgWAkOUdJF4X++yHTft5Pypxk7CHTT8+Yba/4SSsBXJvqU6phdQhBIJd/g7ExMEg+i
         OgowQyD9OfSJli99pOCQoJOvLIA9W5SKPuZlnDX2Lne8OmuFhhaKvg7/hb9DVyFoBORa
         Vpqi7lWnfhJWev1FfnVNfJMP8Dk97aPGObaWfT3OgXLc5CuZzKmIhpszV2ildSXt3Nw5
         jdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585656; x=1795190456;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=76hK192hwNNcxMcbm0UzywzzRTcZcsnY/gd0BW0R8wc=;
        b=zW0SKOlWWECdrwXMOPe82p7aeuD6KWae0gR4YZXwtX+X5LakyDkUeyjrzj14LRbrkl
         /0WSLsBGtHqSBWDAMufRhB++rWncvFx5+3pvh5eEjhjmP7EqZF+67YHD+V8qyZsgjx3b
         +fdeydrFQx4eMlrsvP6ZiDTrAgIxRdeoee+PVLoo1J+CgdIbk/WjSvgsV8eneEPXPgSg
         uLfBweF37mfveLnRdgdINPCl3Btq5QpBB4zvD1JAUAdFKFkW2eqZH2oVcvTb48rdwo3s
         nXjuBntaVWrKoXz5sez9JfnAEPOQMhUBkogcSFE/syeaMbQiYhMA/y/APyUs5I6MVAlA
         dYJw==
X-Forwarded-Encrypted: i=1; AL+hErF81PXLcEJKSvmGPO+ksNV5BBJQ6S/bYket0k94xT0VYB7tn+9x5rhueO0okAOpYxPqpkcVNGZFppZm3js=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BCNvVS37/k+8+yQ58l5bn8y37QxYnqzyxVAeoj96SoUtTPt+D
	5ROXZjoFGStHPm2pUt9FjGatq6PQNrWfmoVKlvqxG+5AXef6Xdc8szBr
X-Gm-Gg: AYBFou3ceKVR+ijd+8gG1dkGlCaG+1ElIoXX/eMDY1dN/G3s4mQI1Js3OK6C/ZIMrKZ
	DXkEldsMEcgFPh66bw5VJ+60iZCHdbGI+eAhp/6rWTBpQRsBzec5OAdJJBgelDMOTHX8wdOwtZQ
	nV8lljqBOC43BuwsLFLMdwBaYcSVEL6ryRyhX86WM25GtgMh/KmLQxy4txJo+ecfc8YPQsvYqLg
	v0p1JkErrGeTFabicWi9A4N1L5mCOofFTFlJQRj3HrMXu31cDvOLIl81JQfM9E9Q9QiqnlPk8lL
	Xzx23hTb53G9DsI4wxit8PaiUgdIgUd/9q1XrndnBimnftTI4pQxNklkSgofTbwB3yyFuvMEp36
	UFWgZNH4lewyOtp8w6naPTAYPaVcN5o2fzd4szUvTbGUV49TbsyoJGXO5ofaaR1vouenURes5sB
	1WZpKx80CcxZecW7efIx0fxc/3jCLtut+RWIMztAvSGZ/i5Rq2Ld/OVEa+1Bkvbc1+IJYIC7Tsv
	tKlD9hZvBImvaeKncHkgwm7HlPyvlxCaLWmmYLgz0z1AyA+x4hKM/PT34C16B4Cq8iZxqggcCRK
	Vpt/hJGf8hVeVmsdjUtnd3PmFxYqyOnR5LfD+ncRgUV/mCpQKRZFmBxAe0A31TyPqzdSVg==
X-Received: by 2002:a05:693c:8312:b0:374:ea35:9069 with SMTP id 5a478bee46e88-379681cdd7amr2329847eec.39.1794585655380;
        Fri, 13 Nov 2026 08:00:55 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm8587820eec.0.2026.11.13.08.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:00:54 -0800 (PST)
Date: Fri, 13 Nov 2026 08:00:53 -0800
Message-ID: <9594e8428a3fbc94e515c9dad2268009@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishal Tyagi <vishalxtyagi.oss@gmail.com>
Cc: Markus Rathgeb <maggu2810@mailbox.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "Input: synaptics - enable SMBus for HP Elitebook 850 G1"
In-Reply-To: <179399405216.85438.8327280593401118083@gmail.com>
References: <179399405216.85438.8327280593401118083@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Vishal,

On Sat, Nov 07, 2026 at 01:10:52AM +0530, Vishal Tyagi wrote:
> Commit f04f03d3e99b ("Input: synaptics - enable SMBus for HP Elitebook 850 G1")
> added PNP ID "SYN3003" to smbus_pnp_ids[] to enable SMBus/InterTouch mode.
>
> However, on Haswell-generation HP EliteBooks sharing this touchpad controller
> (including HP EliteBook 840 G1 and HP EliteBook 850 G1), the touchpad fails
> to resume after ACPI S3 suspend:
>
>   rmi4_smbus 0-002c: failed to get SMBus version number!
>   rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
>   rmi4_physical: Failed to resume rmi4-00: -6

Could you please try the patch recently posted by Markus Rathgeb (CCed)
that retries reading the SMBus version on -ENXIO during resume, and see
if it resolves the S3 resume issue on your EliteBook without reverting
SMBus support:

https://lore.kernel.org/linux-input/20261105204953.69572-1-maggu2810@mailbox.org/

Thanks.

-- 
Dmitry
