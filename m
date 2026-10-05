Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ABD47F3B5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201686; cv=none; b=iC9rkl575CMnERVxrEVzDC5sdiXI+5YkejAoZ+203/6E4SvLMiosJZpe2RN5s0ctfaDsWMzcwgXq2mPGK1gY6EfkYfgv/CLSxQSuV9mr9MdKUJFxH+EGKn3etphHi8GEibEuWKaiJllv75ibGeSBCIPbVzdiXMdnm4tJmJNf12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201686; c=relaxed/simple;
	bh=lTbHYXamvq3cnhE5P2zC3Gd5p5ztRUE9cAKp8XyYsC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JV7+n+paR2MXPWWY7wEfjAabmvpRp2F3sS2JHyV048AUNh1DhMUd5H83SfABr16aXfPQLjOPpiCHUJ4k2ErJH4EDxukzDhJxgUyOi8fmonckjUoHlrz8G5rqZN8KlX23TxqQBvSgBVyh6T3n2VuOEmNN7iXO2J1bOF0OoTmCnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R16t1QrG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R16t1QrG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso15705855e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791201683; x=1791806483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJrqgb3DvlowLzYTH8xBUPpuOWe7gYDesS4AaaCm1Hs=;
        b=R16t1QrGyVPTcvEvwr7aNMxGkKnyC9xa2vHpWb/tCZANEbW3sfU2tYbpX5kZTJuN17
         vrh3cP0zdirUDrb+an2GIsJ4qxL5n48067Vzpjj/5hqwffAKbVVc/pKUygHaUEc7Un4n
         4Q8w0k33h8NNy4QuSQ3uEps2J9eMVZWK5v/bzOsdjVQgTgt18CmVcyCMKUrjgWNqxBhm
         X9bqE6oSuyAKt8DFKDBLd9aGoJ181It3jei1C8rmhWhhzcAy1wuWVkoFC3A7ibg8DVSR
         1cLH1rvzMXxTII1ayLQY5MhBOxSf7DaX5MvAStE7ZqKkdwFkEON1sD3lebh1hM2QisGO
         YgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201683; x=1791806483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJrqgb3DvlowLzYTH8xBUPpuOWe7gYDesS4AaaCm1Hs=;
        b=lYj4Av2J0yvEtLEh9TNsFpvbFn49KvZBj3xToLIgr2fCm2lamfXQSC2IlL9VHl98qW
         LFYT+i6HH4TskpkpmIZ798CYcJI+j/Eq3xPi7AwANyhbYXmckNlsBlrahblHk69w033o
         SRtrFhs00wijhmFC9LIMZx5/8i8/rJ+xRsqUZjbQQMLUIvy6jn41QL2ntw8S86OprmUc
         r1dUW/vxi/hW4wZaVFS0YJazb+vyKeJ4WqEidxJQn0YRYtIwVTCEvOwb+M3X1aXadSNx
         oZh1rKN59Fgrx/cN8uP64e427qh6JJupQ+Nd0gaUZ0fQ/wlRgplOztCnzVSOD9JDKK4/
         AVpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFTz9z++UVAY8SRi/9tt0hI8ghltgk3XbyXl4lIMldFD6M+y/uhRgQrgS5dh4VDhQtW3ny242g5ujRhSE=@vger.kernel.org
X-Gm-Message-State: AFuF++nUkrHjRAPD/subXFxSJmyFs89tltjE1fU5AWKz6YaWgjzHnjj7
	EdJavGTNpeDLjOYKWHIuQo2MD850SnAojY4c2Dto/LLMeqXFP6Ppj639
X-Gm-Gg: AYBFou2LBtGTeCtp2t/QzzwSZ7xpdc9qfT5+PWKVbkVzCv9IdR6F8GLIxOGzr2l5T0h
	cFxm2pgH8SSYsliX2K5WbvGkDKL8+8emg578nySAS5Kw9bX0lDoZs/bwSF8itjTLycN/5NHVR6z
	/VKf+/0QRaNXizVQvgx57KElQoYzWOSZJzQT1GidOUNPP/gJ4wvcmZeIBW/aj9TrfoUTE2hhOaU
	FYHoj1kOCgRG3lyiD/eWRGjlQ48xDX5y2Lznl2QEuhI3ZfeHz+/gWXfgBq95SgJeMoT9GfvHpr+
	yQZHL3kEPAquiSlaI6Dn0Q9fqy8a/fuUULA9hj6/V1zrpP1ek/WxM/bk2m5XuwVHCveKX9uvkdp
	8ZSHhhe0uPrsjGOHmlvzwFzy3a+/8vu9dRhOGdGtPguCrTvCgHft5UnMVQR/V+FdgMBMX9Fm3oc
	Z5cgQ6Fq5doRhWxfG3fIXI117I1CQ2nsZ3fWxM08/g3Z80KifS1iobr0y9sIta4oHIiwy11ODn0
	zIfdHmfJgQQuWW7C8lftU2gr5OfzOAvRB48IwPnWdlZUhmEOhXvwlvK2+HLZYBqUBMWxeQkVTRQ
	G4es8Fe5EbGTcr1DayoAbP1HpQ==
X-Received: by 2002:a05:600c:3492:b0:4a1:6c3d:cdcc with SMTP id 5b1f17b1804b1-4a16c3dd377mr98453135e9.15.1791201683068;
        Mon, 05 Oct 2026 05:01:23 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03043fae5sm202887735e9.0.2026.10.05.05.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:01:22 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: conor@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 14:01:19 +0200
Message-ID: <20261005120119.17604-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asODx3YQa4WlANen@squawk>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-2-robertbozik@gmail.com> <asNbwhGCuxF6e6Ba@kekkonen.localdomain> <asODx3YQa4WlANen@squawk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Conor,

On Mon, Oct 05, 2026 at 12:02:32PM +0100, Conor Dooley wrote:
> On Mon, Oct 05, 2026 at 11:11:46AM +0300, Sakari Ailus wrote:
> > > +  reg:
> > > +    maxItems: 1
> > 
> > minItems should be 2 here, for the always-on client.
> 
> Instead, make it an items list, so that what each item is is explained.

Will do - two items with a description each, the sensor and the
always-on block.

Thanks,
Robert
