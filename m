Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194744;
	b=QpVjP5M2btg8yD0GdDe2+dTkyto6+9O23cavgA+NSp6SNujC1AITrhMObiXVSj2cTc3b
	 rvgoS60sz0SBSiVl62BQXhZHBDFmfmLyaPaquLaZMco6SqPYbBCO5f3oPSPB1O2RDE7yw
	 UijGAqyXq8WEbQk6GE63PbQX78r6KS01Ufkapnaf9PvLi/aT9uZ2WEh9JGW9c/5Z0LYR6
	 7x61vuNvzTBx+/ZnFDuBzzsNgmLsRNughQguh05lZKRnJvKoU/lsQC+oV7d7hbC2CCXjO
	 SvYff9D37p+mSHP31fe81ONKvqzdDbMY1Sz9izplCA9BPGk6r1uU1KAA1SzQITAywQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3BOYLiWEUrEf2ebxgH6DsBUeZfhcIwN9G1AOhCz5Av8=;
	b=XRoa5CM3HV5DSZFe7feTHaYItFWCONIyx55nr0N2jVdPvU8BNiTtnVEYm1kgy3Zse22S
	 jIy3Ppe27pBZBr4+SukvnoZX2YeTU9kXOprDhTuArahZ8lLRjcDtNOgqZWTYdmayUDCny
	 3JeB/NnvhCX84CDe0jWLHBZBCbRClWCEaHxYQlQbZDI3O9m1zszbe0YDOrcWQAoYiyMMy
	 GuOTapjKNiEtM5pfnJn3XhE6jCC0LyLMrxOWIpnkH6rr4K4CkzvnKCOts0X1Plq7oYndz
	 1f6Ep5bEXTG9M1TM6X0pSfZHMrGKVrIJ+p4FvJRRYPJ7GZTYLZbFL1m2KcePgK2kN5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRQvyvLR;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24664606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24664606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRQvyvLR
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb1224533so41090a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794194743; x=1794799543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BOYLiWEUrEf2ebxgH6DsBUeZfhcIwN9G1AOhCz5Av8=;
        b=aRQvyvLRRvgaZQa0PIw6WWK2WJV78y0sTZ8U30aA/bX96OL50P52LidJ41STOKIGXL
         Oi0a4/AdQ86Jb62TGmlr/V3eOtY8z8vK7Z/+wFVoVKzg4Gk01F6bq0qGwhI0Ov/LM/9F
         ODBi7ll5D+AWLsW6zWYW08A72AxoYmbfbZ9UMRIUsTIhNg7RutJUzKuQQIdfvGmyC8TB
         9/ZYTPSkCDqKy9rnOhGjsxhOcMPbuBgWk50Zh13ryUZ/HeIj+h1xGjJrzyggK/Fv85tX
         ZyYEUqvRRc2ST2VKvoy5MCZv9lMP9JuDUnEc3VK9BqB4VNa6YE/+abDrHaQuX6m4lRtF
         hW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794194743; x=1794799543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BOYLiWEUrEf2ebxgH6DsBUeZfhcIwN9G1AOhCz5Av8=;
        b=Nx0czlbdiS4455XsAe7to/bUFZVfla6JZD3TFEz+UzdapP7Rli6dr/FzQ2RkWoGvb3
         q673bqUmosn555BX64Vy1JNmJ8xCwrnYQzO3NuUm/U7Yb9l6mIAsZxPbE5edsYVObY5B
         /Zqcbue2w8x8qe4toZxw6md6aH8U9E/rrsMSAXgUHXZzfPKKfEtXp2JeJFzqkYUf/OQs
         JcukaAvOWQktSFYrCulrhmsZA0638Qt5HADTfzcFlKSfyWb8dsBlp+lGVgyVWkGhwEFy
         Tr75EAEO6wrwG5qbKnaQehDsVLLLcSM3mYl8+abKQiF5Tr6LxALWBLl6xig5DX8+YG0D
         cyLw==
X-Forwarded-Encrypted: i=1; AL+hErHTKJLvA1r2BtsenVFRt1Rx1egDa/Nke7vvfEkeh8Hdrk8qonJbbf82LJ0EZIpmFS6Iie5mGsNm/rhyjE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0ffXnuMy6qXOHkeVbrCna7zpg0g4n45f6l2jiiB9eKkfC3CQ
	rh1TkJKiov49AHDLq44HJfoVkJyVcLyuYpn8faRLNmRWhSjPrI+DccZd
X-Gm-Gg: AYBFou0tWaZIVConEFruJSocIeoE80zh+Q75vo1cMrySkY9H1pMrXMLzeoFMIEYd4uI
	mohfHjpRE0x2cSbS+Etj7dl7NRZ3RMtgj44Wz14fj6H98rnySRe8fd+qvvjh6M4l4d45t3LF+wP
	4njgHXoIjEkkFFn5ns7TfAAE977ptwVWSH8sTFkN7uYrpWcUnX8RK/c68EzNdvahFAIvOrWemdB
	+JiV3InfLAIRxwgstBvwPzkRSCfs7Mgnng+4kl3w2lF/3189SeAJn95Yie7IsZEWbBHznvfRFuX
	khZYmXtIAsJShDGBzpXR0KViv8sZgUVns6qE2Zn1MsfSi4Hezx8m4M1VdcombwM2wytb4Bv339r
	w/HBL9oFGZbPJUVD/6EB4KYziy8K8Af0mi8P356owFVD/M/FxZa0zQnqXguoJZwVTzjKhosivxg
	w945MPNGB3MHWcNdnY9M9fn7Tx9I68w63T/0Oy8dXyxTlyuf5pU/+huoTru0sPNi8frzK87a9Y8
	r6I6oBHTM569oEaUMhTf4RMgK+pCcyNNTQlBMqsm/bVJI+oYKT7U7EqMtkZc87O9+2z2r9dMqFD
	NE46pmVrAI94+cxu7yRXRr41mKqsgByBMNIwebuYV18p8BBOVmquJAg=
X-Received: by 2002:a17:90b:4b01:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b12d14c701mr4664426a91.2.1794194743429;
        Sun, 08 Nov 2026 19:25:43 -0800 (PST)
Received: from [10.188.246.87] ([61.171.219.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96815a08sm1146067a12.10.2026.11.08.19.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:25:41 -0800 (PST)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: core: clear states after freeing them
Date: Mon, 09 Nov 2026 11:25:39 +0800
Message-ID: <179419473985.45704.13570579264108151328@gmail.com>
In-Reply-To: <179259111932.19580.13027750156272888992@gmail.com>
References: <179259111932.19580.13027750156272888992@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ulf,

Friendly ping on this one. Patchwork marks it as "handled elsewhere", but I
checked the tips of your linux-pm next (6d318db9f) and fixes (4c66c4235), and
genpd_free_data() is still unchanged there as well as in mainline. Could you
confirm whether it's queued somewhere, or should I resend?

Thanks,
Anfernee
