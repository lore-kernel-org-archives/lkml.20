Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0F4825D4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162543; cv=none; b=lB5FNV1C+vKp8RHMkyz8/TPHKtly+o1liA4ctDz7v/tJVOdSjBl7/T9eF2Bv4WvB5V/KRn1f8CxR4sL9M6Tq43trbz7rGtIjdcbfd558YCcBdkkZJf5lV/j3q0Yl1LGvUq3yIr5wnflOFHmNoilGPG0Wo8k/CW0qTL+p1hul11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162543; c=relaxed/simple;
	bh=XK7vv/04wyL0TWzlH7GP/CnUNFZcElOqGx+KF54CsWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTxE1G78VeRcyheZw9592sZ7bcAEcwlR8qA1BUb+z0fSFIH6MMcFWGmYIajS9dl+Md9Y67uollb2ozLeET6uYWhNaBvuLUHjIcbhXCXexQmYlOqGH2imTLIhpvXPfi3o1VIS9bI8ziyOPb+WXpY8jDg1xaRONq8rRj2tg9sYeu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wu1myAz6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wu1myAz6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso980625e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162540; x=1792767340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK7vv/04wyL0TWzlH7GP/CnUNFZcElOqGx+KF54CsWs=;
        b=Wu1myAz6QJi4oUMo44ab12nQprIAITpLsiWvKBDPgzLsgsLlwYPyvWZE7SW0+qEGe/
         KNwtNSSWJwXDc/vqVQB9PL+gmzTC/e0imDS6McI4/TR2MdgpyO2izJP5ehxqkULfSyd8
         NodQ8U9oumLNTcf/a5QjPWqOQb/Oq5OHvwtHOhrCto5L6Qr17xdMdsT85Z9Ktj40CrRB
         Mz6qeJ0nLMnXtf/5sSJyZyjqFZ56C3/HUc9OMGnDXFXKDc0MJu+YdPy3Cp86t6xX+x/U
         iWCHYottR73mSvzKSDLaKrUf/p8+YlmERmQbDPi6xBqEqzlAqlHJghfaRztB1q3U2wXt
         D5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162540; x=1792767340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XK7vv/04wyL0TWzlH7GP/CnUNFZcElOqGx+KF54CsWs=;
        b=jgestxCcewkCgNSkwDCeCyGGYxz6eCA0AUd+ik4TK5fdymS0r9u4kPFcs0AGL832qV
         IB9FMrF1CXRpyw9x4d981yh1DqHLFny4M61gY88JjFeldzu185fIZvJKrdZuUVzRSWgE
         avAl63kqi0US1WHbJGIX2uYffULdZt9QNsVKLlyq1mdgzC2k4dzEgfisbBcoZVO+QAGA
         Z7WeKqgulCKcXGB0v0wc+oH+cKUxaTOqpLLtlHfHxjeBy1F50lZeNty4pLYMzBQ2ejvL
         FEtWc3avT79iDtD0Vx+V5TohwODsnw8cb2KaabR4QK3usg6WgRKKsskLDRyEDLNBNFKL
         o9nA==
X-Forwarded-Encrypted: i=1; AKwUvBykYaujGF480SPiuLnN83Jkha9Hblc3X7zDIIlDSkpjwUUvFFykcrwZj0CpMtb61lRuraX7TcjQ6T4Dxog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwblU7nwmd0VyuCysz5fm+GQ7Wj/vhfYudhPFfw1Ys1Y8qq8EF
	QMqHpVNciZ+UfbN5khMrqJRLfNGx59eIodGPg9EEbqe5aGU9Zlu71Jas
X-Gm-Gg: AYBFou3dfjMuIWsSm+uSS2CE7YC3Uvs0s3OPk3BvitoYPJurGM149lSiTN9af8/57ja
	gWadRErdh5B4oHvdXA88yiQ7M6KqQ1FlpEb0f27vimNI+5y6OaGv7YBK8uyUm9GbUmNwLmG5rDX
	ouHx+IytHsAn9Ql2QK6iUnSU1So1CqKYIUJBTp3sDTHfuWeEELRZh9TcgRP9rNR232RhOEKHbEt
	SZ+ok8oGDkuOsU0wiQ+qQfLoTO/fEf5ezc3RWVDWQkai2JzBYj2l0s3CouJzp72CDqYpO5UjQBG
	CYJllyvCHkIdtqzhAYxPbbX92u8azXmlTGd7UN5kDdhG5nCrX5TORJ7nCUW+NLzmjbR3uwaYbxj
	Lw1YligHWKdvmmJzdaVELEFnzlpkuWPByRLymgGO+36AM6UHLgdnmOhjweFfDL9viYZEULNTXFJ
	sPBFofxurhymFCwKyecHritcdMog9x7SK+ea15j2O0tNMEspQ8WwiSTz6uRGh/liGOLXkNANcHT
	Ol3QuVmWsPmDu1Pg2nld214acSPQiKgeUUqFwiqPn9GSh12EPNtQDtD3UtZfQx+kmV74brj
X-Received: by 2002:a05:600c:468e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a1d7605110mr875865e9.11.1792162540534;
        Fri, 16 Oct 2026 07:55:40 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm90481395e9.5.2026.10.16.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:40 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Andre Gilerson <andre.gilerson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] media: imx681: C-PHY for the Surface Pro 11 (Snapdragon)
Date: Fri, 16 Oct 2026 15:55:38 +0100
Message-ID: <20261016145538.37162-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016065952.11638-1-lsa.uz@pm.me>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261016065952.11638-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

Thank you for testing 2/2 on the Intel model, and for the register
readbacks.

On 16/10/2026 08:00, Sergey Lebedev wrote:
> As for how to take them, I would keep v8 as it is, since it has Andre's
> Ack and Krzysztof's review, and have yours follow once it is merged.

Agreed. I will resend these two on top of v8 once it is merged.

On CSI_LANE_MODE: since it reads 0x01 on your machine without the
write, I will check whether C-PHY on the Snapdragon model streams
without it as well, and drop the write from 2/2 if it does.

Thanks,
George
