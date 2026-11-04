Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828514;
	b=A/wZlw3u+x50FeQn2ogS1US/aiqN3eFvOw2ps+nHiNUVlYTvBi3eILRmSWY7sCnrfkDE
	 vYDLsx9FX3tdVTIGn+PPPxs5dTCA75nx9joW5OYM/JNbNhJ0LLJb81x7Ht8mVMpr0sCmG
	 m2ymKvmzJT/BagKes7+5MmXnOZsmPWgHfBkXOlyWA9ck0DiQ5jcR+QFdTR5V/0FZ444WS
	 JJRmSGfg1+osWHgvKCnqmyb+bih1pA+34tR3X/8K8nZcK4AqVzT9cwkS1unUaFKryeM0I
	 EfycaR4OmD6kxzejVscDFvxgai/MqXvZeXwjdDeC1VWHJdxiNyYVGow4ROpkoCQi2PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FOli0Z3Ak2+KJAKMycjEMfpFW6EkX5EN2TvmkA1rx/M=;
	b=BVFqrGpdedCnvWq0vWVGiB78gbg6ZzazCSX+Xm5C2K23MKKRploe0t6tlPAdjf8aq0Rn
	 WeWtBKz+wkDHvi3LsQTnfXR2sbPPMfLMs/1mY4m+mqjJokZ4pYL6oLJ3DuFL8maE+sVtV
	 UuMmcLLqzlFbOnqQ6Xp6D903sFS6EXkcmuyy0/CKN34ODxFfP2pMvEU0zUTn1F+fB1eMj
	 maiQo+d3oGJEr0F+bKF+SNbBExJ88YR9buyHXd7SVnMhMLCD2SRgo5Paa98qHNGBSAKYz
	 wGN0RNuDO1uspn73K8NSbC7w9Jue9XyYct//eTXgvWHIEOrwxW+dqiiHlg3S8GeR18A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPpD7X7f;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24525606D815
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24525606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPpD7X7f
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea7190aea1so5634325ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793828513; x=1794433313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOli0Z3Ak2+KJAKMycjEMfpFW6EkX5EN2TvmkA1rx/M=;
        b=wPpD7X7fFp30806qnprP9MzhsMxPuyDzoK2lP3gIZkxeCS7/oOZtGRcb3nj2VR+JeG
         qkLkGdWAonNeCbdLMY9IwtUZMCrjSSkMI/lADGMmIKWkM/H6Mk5+5QYT6AO0IJAFSCVI
         2QfP9xcoVjaScK0mi4Jb4AbhX1MQG5Z9U1mjjrN5b+G8Zj2t+brFx7eL9xTQIDdLy48s
         3fzgGs1yUHxA9i1fLUjoDi8fOZxJcm5MX/qi6J0o3txv2bC5V0JWkwm9W4+oEgcRxmvO
         g7U45OuL1uR3qZKztLp57Acn/5rSjt98oVxVIJ6jMbuAXLb58eLqugeVGsG28gWPSTUy
         0Cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828513; x=1794433313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOli0Z3Ak2+KJAKMycjEMfpFW6EkX5EN2TvmkA1rx/M=;
        b=TaS5A2uvknS67PPgRr+jyVNuibt2ZXcAV4UfdFhNJ/BClc32fqkUoZNjyIdWv091Vu
         f8gryH4CdNt1DKD1VpSucfrvUCqVcYB6oz6x86IoxOgsPFB+sxiO8VYyBdYH2tFshKqf
         yUxp9HQUzpZY3v4pFEBgICLI4hmqSzszsWs5vGKq4iz/S2BzA5/xkF60iTGfj/CGY8Ki
         q3dOKAy3NnNuAp84A/qo1mnz0kWLigf+IEcUup/a0PO6Mhe034IxZ6H6VYjQUVNrioRC
         WzpAHVkRmoE4tQTLIph5hGGrv1Vq9aRvdl50LlLrYinQjTJy76vhEC5BNOso/jNxS6Vc
         ww1g==
X-Forwarded-Encrypted: i=1; AKwUvBxguzN9N44UV+HOnMqZ2O5mheOSXx8SnIGyvSAJUUbq3cQj6PkO8AmdpMykzXNpsqWuI/T4bvjpylRN6DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aUbmaU0PEG4pgroJpCjURJSdqeLTsLclA91NFbi1DeFaDKnWy
	naMoakL01YDp37W1YlBmXjrkh8nhj3q48gdjPQrLsgCgfMHdCwP7bCLD
X-Gm-Gg: AYBFou19D7KDlRakf56aYZHCJLNoOQLmwQEq0s8WYT3G3l09qDUiCgm3bsU1aTgslDu
	gLj16QCsZUM1zfOk+Dh6QxwMCJq4VND5G7/rze7tFB25Otg6sbXA+01+1QkoGUH+BDNcVZajuYg
	foQB9q1Z1+ysK9iPs0x0tw6nOx75ubIFncTbJ3dqY4j3CySh+T/oxq6j3Bx1gLIdBpZz/5sTyyh
	qZGbOgZInKRPpQWgUU21rPRFLMqQMjdSPfUQc/CIjkejazC8KKVp6+8QLBmrbKJhLDro+aaq98a
	MxGaKM4B6cS7EWCW4MObWP51zymf1taydiYb28/z2i0pVbbEAjOL+WkhhmZw5uSu+LNwJn7i4g0
	DuZz44Oe6ExWkEFN2E7LGV4Sq5dAIKDxAqelVE2zkIvbwiYXc6nCuhcUXUXFEvl6/hGXiXx4H25
	XPfE7xAAMK+j2n6IR9bO6K+wuqPGEl4YpFeA0O5wjlxccfAUVBxtnofGX2NA0CY4MhGhMO0S/YJ
	x22Lfen67BC/9LZ9ydTUcS8lbzhWcykXrcFMd+GeMsHCyqiGHl+42apwdTb7UaulgwoBWwP0sqf
	llTI5j/KGYZO8OG0Nc5RzKwt8yh3fG1h4zvlKwjSYAPsNXrxBv/RBWidWU4tRXovdXt+P8qTBLT
	52Do8iuBSmgLKCTKYMpybZCFsig==
X-Received: by 2002:a17:902:d510:b0:2dd:c053:82f6 with SMTP id d9443c01a7336-2eb3646e2eemr157755205ad.45.1793828513358;
        Wed, 04 Nov 2026 13:41:53 -0800 (PST)
Received: from evo ([183.171.191.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fdc5b9sm11951625ad.18.2026.11.04.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:41:51 -0800 (PST)
From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR Dequeue timeout
Date: Wed,  4 Nov 2026 21:41:35 +0000
Message-ID: <20261104214135.396018-1-ambareeshbalaji@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104105003.3ca4a3ac.michal.pecio@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com> <20261104101506.5ae19157.michal.pecio@gmail.com> <20261104093608.2642748-1-ambareeshbalaji@gmail.com> <20261104105003.3ca4a3ac.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 4 Nov 2026 10:50:03 +0100, Michal Pecio wrote:
> If this happens on real HW then it's a different thing. Having logs
> of this anomaly would surely help untangling what happens there.
>
> Were you seeing these issues before 7.3? That release made changes to
> the handling of URBs on disconnected devices, which caused some people
> problems even in absence of host controller bugs.

Makes sense, thanks for pointing that out. I'll send the logs and the
xHCI trace as soon as I capture one, and I will treat it as a separate
issue from this patch.

Yes, I saw these hangs before 7.3 as well, so I do not think it is a
7.3 regression. I have no logs from those earlier occurrences, so I
can only vouch for the symptom (the device drops off the bus and the
hang needs a reboot), not that it is the same code path.

Scarlett also likes to reset/disconnect with -71 and -110 errors fairly
often. The kernel generally re-enumerates it, but once in a while I do
see the disconnect get stuck.

Regards,
Ambareesh
