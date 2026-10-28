Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793184267;
	b=yO1xCI3UN7TCFhxh9n2Hzpliscwmcv5QYEAKhq1I4kzChDbXJtPVnPsh99DS/D4P2gr6
	 0R+TjMRJ79h4cgmue5cogLTf69MLJ4ZxIqmFY8mfsVMu1mv5mdwDfdjYdfrWyI5SsdF22
	 2dqjVDZwS7KJxhZAMkNHRaRV/7BEt2zZtl+xWAZvFE0Hv5FwiBM+9JJCD2QUkoXR4vSNr
	 b7ApxT22brNd2S9C6qRqH4zL2uJHl+1TCmDTe0DhNR3/CdqRghU6Ojk4scnu4/bNYFsV3
	 QZSCrZSVAl4XyAnj8tCEWjjy9CQv70ehdlDDgzDRJg1wfuSi/KtNyKH9trYDR7fXZqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
	b=FjZeCMG8K24FPJcuHSbL5jJ7PNJ3I4UO14U4OYcauyN2vNdIs6MiZm/fUcJDXTF2GAqF
	 xh5qeS9rSIQ58bTVbezIuStZc1TsY2V0wKxpBs229fVX0U69CnkklCaoThSyKEYBGta5b
	 BlIsnEg8UJ6yEld/6PQ6R0JrKCE1sbB1hPjSbr7i/X/t7zVZ88/0eSqlaOyixrupZP6e/
	 asrz/r/6aJGwhAECCQITO5jVjaYQfjeFXYEf4RLHJyEqzjFJZGhW2RVI0+2IQYdM2Gsz8
	 fs9OmvtngAN0c+Wm11io9lRgNsovmEJNKsYknJZ4RpHHQuQ6xQXHdCFNrvZQ8jSVSpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8CylCRB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF62606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8CylCRB
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5378b281aso3941115ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184267; cv=none;
        d=google.com; s=arc-20260327;
        b=hiWemwSI7RilKgEGTP8/81I/qa2cOmPG15kFypUs277OMM1YREZCUEiaZrnkbmfQlE
         9VIr1wPGNGb7JRDx/VtfnutpPp22tPikbJo2HOkdUsDdd92Tk6342CGipzdkv7i6psHi
         3WztVi4px/3lns+yuC88HGqQlcYMn3Z14WJpfPoKefQp9YLYa4Z6/GR3rpfhm8qfL00t
         JlVKq+lTxNJni1JN4cO3m5UOlLf/oE1Pj4YIcTQLOIY+QbT+aOU4x+2ITsT/OpzDHj8n
         VigBK84aGCE8M4VTu5zaDpDHqRPDykY+FSus9mJ6nbdR/cOAK+USdvBx9lo5t3HFFH0v
         YI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        fh=XADUQty5a9WY4wk4mgG+6LRtW9rjdDKibUGYw2+Mi3I=;
        b=Fg8SG9gibBSO8sy+5W/57KRc+kMokOgLkc+EgEj3VB5a1khRSB2I9hexu7AwiaDHnD
         vtpYhir5lyj6J3Dju/h67my8K6EIZMIWrcwozRBji5ot4c4igbtc6gWmj0Qx9C2+8oi1
         BDaXPjvGaqGPxYiJ34uwBXyRIgueH0DViWZFrkiKLP8aNBpG1Ckcl9dHSFze7NDggFL8
         bpxDQ1TsExhnna9TwoggJ9zl/DU+CtDjdKg9VwrExLeNbYGNSBQ0ufEXY4lC5t7Iy/DO
         JQoO63mdbTVMt2RxxqgGjmBDB0cyrt7uMR/9Y4ICpvMzoWelfZyIgLnr+z9g5NpihKHP
         qZTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184267; x=1793789067; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        b=A8CylCRBWERk0XBVId5jt/uthzbZWRrSVvi2OVVVqVKWi5Uuj1XCy9EvM4bZAVSLt/
         VK7Jlp9XVCt7AcYKAYRxs17Gi4jHsWMhkoMORklHjaT2/UAdor5OBMHwy9wNFBnMzWpb
         +6JaRH9e4tnZuKWRmAf5gv1HwzY+5f/y5RKMrVJa5H7ZFsv+ZRgFA2pfAqBCtE1ixrtn
         bUBjzq7pQZq+439VWPc17uH9cnnxVD0CfnzPhVvmfSn/iGwKkJATAJ6YCLlIVIrXNPUP
         84jUzkSNpU1tMIxn3v1Y45Mc2KWvakcxuA9kvHkDOWB//LlwIDy6N0ZxjVZbDD3WVoD4
         od7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184267; x=1793789067;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l6LDirZd+A77bKsj1zHIaaLsIvX+GdJ08ZjKCtIylZI=;
        b=Y+pX+20iE7E0tznJno+k3r7JuIj7P5W/rbd0nfh+AMLzWnbbqA9R5ZwBaP5mCAG6J7
         cGa/4Ccj1q3wBoCyfzjz9akafpFey/OGFHenZoQAkZE4+L2EiLKN95itt8B9YgQVA/6m
         CzWvQBzrU12rTDJjepU13Icm+HtQ8OgP+3YP6pIUjJuMPgKMtCAYPW89MZJeXwo9ZDaU
         MHTTah243tTtUs6pLeavVvADn4f9Xngo3OFKkQAmH/LTZE6eRDoGkX+VRdZ2V7qiIbRR
         HMB9L56B4TpjtBQOUitDGFp9NBYKOCT5NkhLJjHPVklKYyOSODfQy/iIcJiuYxT5Dq/p
         gWhQ==
X-Forwarded-Encrypted: i=1; AKwUvByR6C0VOLPVu8B3d7zzliN3TiUngymMLF7541ZiqskIsbME5VIJ755kekZL7fp/oEiV+NqbtT/qW0leXJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiwyZ9AKWez1khnUZdl03ggNKsADDTF6+f0GhxjewteZ0xnU0d
	RYrr4tu3ZujEltuaQ9QoW2rp5edA1YDM2JCkptzSuM7XHLfsCVFDppIFLqHC04bdjNpZ+njznsE
	uTPpP6ZuTFEXaBTtIaj60U7xwExBIlG4z8OsW
X-Gm-Gg: AYBFou0TPWo4sums+PxN0u0FYXMN/2STTY0Kc34PGkOS5L069xxoyJ+ecTdg9oF0jbY
	QCY7+cXjBGEXtJDeX+RogXOxvDnC7k743pTBaFXkK3joV/DsooJ24GJzqrMyjnLW3/oi+VEdPon
	h3pH5aO/QsHuYoGCXlU/JVpCgQyfecc+tkxj8hxYXTj+MmY/sCEecMbYwRY0qJtoittls/97N++
	cneIwfKouBwr7sFeURWQO5U1YM94wEZUUIcagRIAKHJw1SNrNU6ifKZoTYZh/QgR4oolN7XFcA3
	gVSGstNpJoxGNSdizDQbUetLKnS+QJ8+uebOdw69oUNN7EA1xIuoCAGqoo+R9hSELbBxqlI7z93
	/F6GL8w7r0LuLUNDHXjci8LdxNy1SX/nSFDyuN48LgvyyQo61/YC6d8lv6u9yhAnYytzngjOlA9
	+guLU5L1L+84Pdi+WTtb+L7jPlgu3w8XyHuwIZDP5zLCJBAA+L
X-Received: by 2002:a17:903:1b05:b0:2e8:3e5d:b2b7 with SMTP id
 d9443c01a7336-2eb003e9deemr18278615ad.40.1793184266731; Wed, 28 Oct 2026
 03:44:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023102818.523331-1-phucduc.bui@gmail.com> <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
In-Reply-To: <57b8aa49-2b7b-4b2c-833d-893eff95134a@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 28 Oct 2026 17:44:14 +0700
X-Gm-Features: AclHuK_exAGUSFD09jwFsm5vTmTuUEGazo2C26fC_zaBNTIkZVwUtRamyW3Gft0
Message-ID: <CAABR9nHDSHmDwGSS8gdBp5mAwuVJnCLjK=_+9VrHjH4zqj7p8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of
 AUD_CTRL in hw_params
To: "Gaddipati, Naveen Kumar" <naveenga@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Brown <broonie@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Naveen,

>
> Reviewed-by: Gaddipati, Naveen <naveen.gaddipati@amd.com>
>

Thanks for reviewing!

Best regards,
Phuc
