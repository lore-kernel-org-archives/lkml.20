Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127761;
	b=Y7Q/N8aOcprWqp2uz+1UZF83NO9oBgsHEyC7KaKlcpagqv4gKoi9vSBsS9CT9XvC6dDO
	 tQfO93zs9CwgzlpTuNQMnuYGWS1dSDfT5FYbLhRuRufKzhpsPAgfa/m1trn/m06qkPGJs
	 dWLgiNDHfe7sC5tyWt8rjnMTPeps1vxw8jDRor3vFiu8stKcTjTmX0IvPP0qS0wMDClr8
	 u4h51imvugDiJbcPPNKY74gBxpMJB/CEPUHh9GRM0F90F+MpamVpcwLzF+2VYlbJ7ahGL
	 /LU8CjgccMI60S2Mxix+4JEuDy+ziJyTwQWJfJ13BF6kJh56kHRy/Il3iY/ReKguXEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=Y2j9WT9S+uD8H8ff/xBfpGliv1dPlhijkUfMVwQP4TvME3dUGbLhqDeNhU9TBhIj/xoU
	 uYjt9WgqS83JvUfmYb7VFoLKwk+3HXRlxa9ej7AnqwNwdojQeTXXb5qZWyExQYnilhi1Y
	 lAxxf9g/yQ1ByQ78BKya/oTqADBvFosZoDgTBVSc3cSRldpF60aL3HRJLdHlRdXBmkIyJ
	 ZnMeH1NLADBfOLN577zoYn08wY4sNiv6wszTR76DJRx+zbvadWRTNJxtNYbSz0iijDLEt
	 gEhol4GXdCT6xD2xo+JDy50KKYPkV2UfKRTT3e88EUA7XLsob1IsYlO1PW2jyHJw+YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfFbYqnm;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A222606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A222606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfFbYqnm
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e795af1d4so31834eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127760; x=1794732560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=rfFbYqnmrqZfeWjWTp72T2kiiZhsdPB9BB0dU1LZ9it1fl5s2iKLAlHTaYG4zuMcfQ
         aon2lxlRuyluT5v7V4y4M0i49WylN7ZlE4DEAsT61KXKnBObk7y2cza/8+Q6//dCWHwd
         Pk/s3VH5/0Eh0I7vvj2lF0Vlw2tdiNJu9KyesOB/pxE1w9p4jwZ3qiv+RyL8yWEV+KUz
         C6O243ilvNmZPtiONvUrTtpchpq8bjYafhBBUGYATAKJB/U5LdzkxJvXSMKJTjRGl4Gl
         E3H9TSPHOWLgwIxjWlicEMEPGJanc56c0D+2cGoLKVbLr34FIpZgdCxvSixQyjkk1Ud1
         XSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127760; x=1794732560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=HbtE+3LMouu7Y6gI/6/WiRwj4vdXNrtsbssp3NDgZtgKDPTFzGRyhVjepWTI4W+Jju
         Ysq8UoHFI5hw4kEv8Igv5rnflca2DcvBtwg3CDXPLed6ILZMdN9JrYP4LiEDgzSWSs6M
         tEzmFYFYFcUStEvjyM0uUPuidBIBOZJfttrZy4Ssd5xPIVeUpmvOoqTZeWuBaj1x70h8
         FdlswLqqhdGrLRAv7yjIVA0XSZvEdDA1Xsup9TsoyE9Sx39hpjA6QEKg/+5jiu32XyqR
         vx08CkBwVaJ8IyuUlQGxAJyWdcb7Ii0Rrek0QmlhYVRBvO3aVxqNgxcvURah6xndh17F
         4ixQ==
X-Forwarded-Encrypted: i=1; AL+hErFf6Izv9z+8Nc5T5zkqCKr3ZtbaYmtDdKsxr9uyz2eZMrUprmEZKcah88Ag1VCGPL6fea+BX+dEZTPXJ9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZlEz531sxpUZFBkk8RqNFuDV4MlPmXaM59G5T2JwLHUQ2JHZu
	5f5FyQVhADHLiHDyZBDoLhnUZ+05ZpUnVJIbMq63rttne9gQa/Pv9wWA
X-Gm-Gg: AYBFou2bUNUputIgHt7IZFWbNJ02alWYBGHiloWhvVRepiSG0xlV5CPNIZyo5qa0YnJ
	KhmgBlX+oKu+Pt4bOccQ0A6Ccue0Ey9XjB6oeY8q7QQLw6Aamv/QqFo3JqzROy7EP/9OEJJPCqk
	0hXZ2UGsUQqPccVmuKdExzejo3jeY6ww6hpJatAsez0d/8b8ITFlgVo73vT5JZ5Jh6QRVdnlgpf
	LUgTGiEBfLAtosdVLPBren5/3bCtkqY9dzq+Jr1THJTgCpYOQPV/55ErsoXZ4FyoC/9iz6D2zhn
	a47yuPca+XU0CjsjEc7JgvfYwwPGvfOx8fPZnWej/pTuZ0rwrzHGVDeQCfIDY2p5Zti9DHXHTpw
	xxWQwmkc2ljnEXhLLAJbHtXfUtBFr8Pw/tp9pre/ztbcmrjNdSMrzV04coFiXHoIMv5lYAb272O
	88K/WfUHuc0DBLS/j/VxWRx+XLlQm/3bBxX1J9nfRKGelKctQCLbziaJYxrZ7WE/DwxK2faA8Lo
	Bf6KN/sUAezZR4t/wUAY7kOQF8YvaPieZSmVOYP7QfL7si+nFnEyGU1dpc5DLuxqWOuOHrwoQwp
	kXq1iW6VzjqUe32TUvuKix7cb2IAgIsr9J+lbW2ppZxp5uM/JRs=
X-Received: by 2002:a05:693c:20cd:20b0:364:377c:cabe with SMTP id 5a478bee46e88-370f8170360mr5884840eec.24.1794127760230;
        Sun, 08 Nov 2026 00:49:20 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d6088sm4445529eec.25.2026.11.08.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:49:19 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v6] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Sun,  8 Nov 2026 08:48:21 +0000
Message-ID: <20261108084821.2827-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179389361906.20463.1092137538074974205.b4-ty@b4>
References: <179389361906.20463.1092137538074974205.b4-ty@b4>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
