Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794580533;
	b=zbB4PGNdfDI48tldciQH4CDkjPOwQitFEL84pon1lLsjbKJbrno2L3X7J/1mdD+S4rdM
	 XGy8cBKk2LAi4oyM6Q04s63vazmemcFcoS7Mbc29FAz6xb7YRKxpbtyCYoNG2KOMWc1I+
	 RWFXmgi5zAfbu9Vt9tW0vFLfRtykxLIsDNpFNplR1uD5ZTrJ1MMCF4DMaA/v5wP0O0nzn
	 ke5ZA3uR0m6OE8Tb+DqfrFxtqk4OWwTFQVcRES2yq8kSaYBuytBKv68KHgETkHoFqQqJs
	 ldOnCLgp4lY459l3I/DmI3Do2LoaWlIlyg7Mx/CQxQ4M2dOH9khGwGjOBw5klZlKiuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
	b=Lw8fIg8nmS+mSOO5wsXJGBkWwLGB/1WjViAOR4a3FgXTtVNfAOzMFA5sKRTBSLKusihF
	 fclVAg6Xb1GftCsrmCSTc7EnYFgeY1wpErknqXLRGQVp3Ewe2aXHeTubuaZhV8dAF85jv
	 w9GkPceu0w3i1UfPZHqLAYGUuvmvUVBM2tm6uKRpgZE/1DNFNucGYSNNumRPRQlyNbfjv
	 vN8QUg98snYG1+LSfIWjbcdGSEw4z8ITKWTcp8uiU+Z13ozuNUgIW/P7je1FBLm1foEH1
	 squtk1SkVbGDvtuIVXR8kxMLnbrqXsG50mmq5S780PU4QdPXtCsbn5bkvndPPBBEhgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=adrianschlegel.com;
	spf=none smtp.mailfrom=adrianschlegel.com;
	dkim=pass header.d=adrianschlegel-com.20260707.gappssmtp.com header.i=@adrianschlegel-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PQSdCaAh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D291606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D291606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianschlegel-com.20260707.gappssmtp.com header.i=@adrianschlegel-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PQSdCaAh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3704d30b84fso1380374eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794580532; cv=none;
        d=google.com; s=arc-20260327;
        b=JQFYK0JcEbDpZT80L/ApleCKzP23o7j0P8+7zLZRTeuT3R0TBdVprkt0zrz4OGf/0f
         9uqTNSOORicuG6+2caFL1Aw5XIQ9pJ6y0HDAap/MLNXD0j4J/QMNcjNk1V3jPA5w3B2O
         8hB/n+vD4bE1lk5nkn3t5X4U1EIsiovpQHy9CPQkYsNtHHnc9Kmcafw/1GwuTEXSc2c/
         PwxTndh+q6KLB7K0BvHXwO5L/l+2pMTCJ1g3+hUDL80VoJGbcuV5848uPpbFOBZW2hCL
         vGZGKSNz2kgcVMBC6HITFlz3vhDYDHKEybFZ99esjoojiuO5EQkMY3dNb7ct8mTfwLkT
         wVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
        fh=tBX4utE05nk78oYCpSfZexVjvJfuTVjkztrxepgHiWI=;
        b=suvufNv4ScGjLZDbCMf1dxPbC8tP6SvJTHEKJsLrltHAib3UUTOvh3r+Jx0vfyU+Qu
         n6F+kt5VqvfXeEiQ/2GO9NB1AiyXgCPFdQQl50lC3HOs2Xs0Jq2qj2ldHK4n8q+2NluZ
         nzAHFdvNgIpfxcUO5r9rwxBsrXnPTUN36qvaObHtzixgZtulD8568MuOuDL85BXqb5yR
         DIZTl4NC6YTAnac+R/3uP3XCE1oOQTE8nv6xAHq0611QNkzHgZ+pbnGRe7kqmiqO+Jby
         tAIuxrboG6ZmAvys66X2Ve5Tgi5YKUbMADTOypokwSGkeG37f6c+JZAoz2p9u4gJiNqv
         KUkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20260707.gappssmtp.com; s=20260707; t=1794580532; x=1795185332; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
        b=PQSdCaAhpO5/jDSiheLa1OG8EJ9skTRuDG1W4vNIhvIv6pTie1Vj0L1fjTeWtsKKog
         db84zu9iKIq58QUVRsZvkrZ1zm1yDQlORDk2Teo7NOH2PfRHWAo94eS2be2CGYUlaB4R
         /JNO8Od57ZmSPMGoIhSmrLaM3vgfoWcn+Ym45coAd+4ICbHqHY/cFhEg/P+Yyg5aEQMC
         IQ2kQQ6PwLBb4nMFAJnEyO3z7avTTB/uhyW8IEi069hEagzWvyKXIjP6k+0JnDCYPWgT
         PeXe3XHF2COkglrXyoVdNFVquVn7cOq3njqRJWDxFYxbZPYZ/QJFctbMYFti9xn4sOd8
         1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580532; x=1795185332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
        b=b4bzM+2CuVpvXnqKBhEWlIhPLVLokQirCvBeDZO3XflTAnVJDWYWdMfYxLW4TGKfAw
         RRTcwOJbsgLg+NFwgsr6QeRlhugZdpNs09e93VCYGM1CpnZcwfg/BA2UaCy5BPybdHdy
         m5PtDpuF8j/LMDkiHhQhTfSzqDkY+nC3TZMNQdkvoZBi3XMz8xo2qLlZTamnG8VsXb4W
         yKcrZJ81BZPFK9k5OslJHlRrjqKh+X2AAv1O9PrhVJ0aGe6VfNqLoeFUujjMdiWVESrK
         uks7uVelcL3jMc3NsffwXcSg8x31ugAGs0hbluleB6GNGdhzvRNMwQy/GuV0vJ2RtQ3i
         AP5Q==
X-Forwarded-Encrypted: i=1; AL+hErHyJSKINLTtnRCUwDnwKGy/Wp95kP5KqUtvR+8PDVpIKlf0qS94HGwoPWeyjjvtF2zGK3VUrGOlrBo6q7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xN4lSr30LNBr1fJW2ae2YIatHjseslN3K+dMrLbmcWAFfwzZU
	bloOQy3wNIigQ0NPTj/Ij9N8Ohcun9f1ZUcoaYGEkb8i6AoeW5iEOF/e8TYk83Mh1N7IcWUGGEk
	iDn5dhndgH2RmogcZXYV0UNa6jH83Ix+M2jMbVwgq
X-Gm-Gg: AYBFou0foc3mDcZ/i/mtk79OyzQalv0vw/PV9WQbLXcdFAJR6FVw0v8xkl/lS+wX8hy
	xvGAQqVvu0PNseld450subE6ItizdXrOhCU8CKrrcVuvpKM2W8KO3uaLccc6+GGjj9QnxCHVtFM
	a4wrpHSQUSOnxYcdQQiiaIehN71rTS99SI2UDYLBTjBRslOdVTEfgivcvny5r7d2Ua+ZmPH4OY0
	+6JahidSFJeO86fG7RyPX52MbIAPEH1BSdrZ71UajhjseT/zrlFCdgH+VlY8E9pSy9DYz2Hxg8K
	nG7DV4Ck8zx2k1K9lPJyC2FxBigrlfosD5IALPuy6PE/iQxBoo6xm97lzzEqhg+mc/1qBCsHJi6
	PCM9T6cRGpZbc7D2RVwf00Y4OEnYu0DI0ev8/u38vvvkp2KGi2mWC5W8f3oWphmfH8O79RuvwSS
	ouHx1RYmnh9IoX6hl5opA6ivHBqhpIcjFmiA==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id
 5a478bee46e88-379682c2053mr1907220eec.30.1794580532081; Fri, 13 Nov 2026
 06:35:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003222012.19685-1-me@adrianschlegel.com> <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com> <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
 <7886e7b1-95fb-4338-a7bb-b6bf1da3a634@intel.com> <SJ1PR11MB60837CA7EFFE0AC99D01904DFC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ba508991-6a98-4aa2-a98d-e85307d50cef@intel.com> <CAN+_ncWbJh1iPzi+4tKdSguEo_SYj_4R3K=sNkG2_VT8TvkG5g@mail.gmail.com>
In-Reply-To: <CAN+_ncWbJh1iPzi+4tKdSguEo_SYj_4R3K=sNkG2_VT8TvkG5g@mail.gmail.com>
From: Adrian Schlegel <me@adrianschlegel.com>
Date: Fri, 13 Nov 2026 15:35:20 +0100
X-Gm-Features: AclHuK_0-cTHzsQGKoJrpYaOYYagia9Qe2eDwfhL7mPMeIIGxuqssjIMZGSuEos
Message-ID: <CAN+_ncXtoZ=84qKHcox-aBotNLSogiJrhRtKJtbz=HvOt-umbA@mail.gmail.com>
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory errors
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Boris,
gentle ping on this one.
Thanks,
Adrian
