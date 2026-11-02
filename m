Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621134;
	b=AMoCE+cA+t1SrTiQuS4ruge4YxdTfaPq2c18HXx8778p1zu1LAUvpVDXvSygXINHCCdf
	 DUQKzHYaRvea32u4IiWjW8ziFQgmK7FEKz8JTwPktOBb7PvgG/ZTxKxbH/HQGii/KbTYW
	 VIoaZXSyc5O7Jt6uFRMxOR/WRjdy7XkVNYUWL2oZhG8wthvLgx5LTRTx4qx2+vXpXBA7x
	 XfE0kkUfBmvPdCNfBxJ/ib/m3o9m4ZzTJnP565iVPsicRI3W6NONlnOYY5F7tC0ZfH97G
	 g6rAW/xSXDAg7bZcO6rarb/HdbVWyuf0rF5iibZLyyzADKIkNxVcVyej2Cy6pX4X5JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QWQ1m2neibp5bAGpRKNHNRra+4fDpL5hqLSr90AaWkA=;
	b=xmI7MGNG6ltiB6y/S1RfLizazfY5S2efFkAT28PtTNJ9/G8E53PbEhMUWrYOp24+ZbS6
	 bvLFkutHtWhEbAsmGAAYWNmKgVXTuwMVpd/7JFYwxXpps+6H5st08chlYJFVT+TbfAZGP
	 3IEKl5bVMgJ37fWDcc3JA9DYWI2wvWgL/w2DngGY/AeQqN19sb5om4zt62SrBIAkDmgYa
	 aCRpdnmafn4m4B0mipxfAu7mpirkgvOjaobFO/LpdAc1wZ2rXTp/Vv669eDr4h5rk2fcZ
	 iCBKBloF+AEfhtUICP2nDglRHfmA0XFJtou7WvXnWv3gYhMoYxvkPCwGAFY0BLPaY3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjaXVabb;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A3606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4A3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjaXVabb
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c46bd7a7345so588585466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621132; x=1794225932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWQ1m2neibp5bAGpRKNHNRra+4fDpL5hqLSr90AaWkA=;
        b=mjaXVabbgt9XaUUSvZsFsSipBebHcm86KZoLBNL7zlQ+Z0AfEP/N+jGvBe0a0R2RWi
         OZjWljCDUUD557GlP38/YQ51YGBJtpMyzQy48fK+zwd11Tdkag0+94IlomwAhmYqd9YF
         L8SZp4888j/epuMiN82rk9/lh9Mtc08L5CjQ0RJKfNByqD/SyFPR/nfmWQQoG+ek8RzU
         0jjo8s0rAuA2fq6lOoUVYJizpX1amNY74hRCiI03jS6itq+ZfJ5Rj+ZyHzoIUVhLbras
         MVwi2lkzx4S00s97/FnF/oXUvBbqkdVjMWr4gCRwty4MkZqYgM5CZHCMG+LCUA/fDNlI
         RhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621132; x=1794225932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWQ1m2neibp5bAGpRKNHNRra+4fDpL5hqLSr90AaWkA=;
        b=gtexd8pE0+sXDyKX+JK+MjEiD9cUSveE/hA79rZfGiF7Y09MCKd1tk8s6v3QzDUEh4
         kCE9PJomBEEwZgaXRFg1x5YGY4rz+YHlPmytZH1SzQePGo+4Oumb/n8sKJ4wk8aALuU1
         O8x7BFKtjnNR3ZloFZqKNjm6O74loN075D/jVxM/5IEr1eVYrM/e/4hlRN2XQdfDEcsA
         rX0zLVy2kcY5GSTdCfND/VZ74CP370sczhXmZWO2+069hzt9U5xUNq/781aiu08XnzPO
         NfNFtV1E9NS8uRFTe7cCDbMHcj09Kya0OX7vzwi8G2K0a9Ek8mayLvFW1/Vo7hWETvNe
         9KxQ==
X-Gm-Message-State: AFq9FYIseWQJSqbCjshwXWuyp0+KRG8RGnwOAGYyaDnBQKKpS6KAUW6P
	okTaoFMo/RR9RwALTAWw2lYu8eV0i930Ypn5Qg0oXAKL89zqjK87Xq2t
X-Gm-Gg: AYBFou0EmM/8WS/57pw2o8epO5DhqkXOwEPKrgddF81bSxArcx3hy7sv75eumxEfchO
	ja4uVLAfIJfGIB9w5H1Kmc3db2mB6jGcKIcvB75nqRIBkYNdh1IYLCPTVcit21bIpViEo/QBQpi
	q5R/xMKP3xL0MpO0r6XLKuHUCteYedaIVQwXDk2VEeep7aXRAsmaUsfrgr12SGKGsw6pzvuNVyI
	cmUdaotX5yYPV0yT6WK3Ed3deZeF7a6ldVEN34E1FBtxfQ7Op6FAK4h80mOX0csZNObp3I2Xr4B
	B2FhV9M6sOA1paySEUqInhILmRhZa3KCjxPDcHcqRqqQ4KM94XS67ioiMbBMKyBD6EUYFOKjiR+
	sJB3XhzbCdcbomyEdSYga0yVzy7QnPDoTp0ws/mXPs/uqPpjEYFfFDM3hH7GSYg0dbw61qQz2iq
	SH3kymZqNFOjrFVqAZnFOoqzfFw3fMRKL7YZfcrphx1w3/LitDwohcw9e6yOHh4MHUUcLjZN5Ue
	qnrPLfEgVIucAYvkL5DiJXu2KDCP/ygbmt1GmM7NvCHg2BLO/Jy6J6OuL6CECO55a2K9s21JTg3
	hArvDV7WeuAhXLZKKzFGnVbDsslcXgG8XA==
X-Received: by 2002:a17:907:1c89:b0:c46:d493:47be with SMTP id a640c23a62f3a-c4ca7ac23a0mr868597366b.19.1793621131875;
        Mon, 02 Nov 2026 04:05:31 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe3c449sm379033066b.49.2026.11.02.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:05:31 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Mon,  2 Nov 2026 20:05:24 +0800
Message-Id: <20261102120524.1213679-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
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

Hi Ben,

Apologies for raising this directly on the list - hardware questions
like this should go to support@arm.com first.

To answer your question: our memory controller is still at the FPGA
stage. It has 32 PARTIDs but no PMG. After talking with our hardware
team and reading the specification, I had wrongly assumed this design
was legitimate. Our intended usage was one control group in resctrl
with no further monitor groups underneath, so the PARTID-only
monitoring would have been sufficient for us.

I will get our hardware team to review the RTL with Arm support, and
will drop this patch.

Sorry for the noise, and thanks for the pointers.

Ping
