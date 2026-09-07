Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149EF2D5925
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817570; cv=none; b=AzgRj0Jh6c7KxSeHutR64t5uvpX4wAJyisRndD1alieIBC9aGaclxzSAjKl1/8k50hkphXtu9OG0x5wFyuXnh1B/+rP6/cDJNuEudZ13noGu6vtBqaKT3n6Gz4Om4tI+luMzL6VYJvyOdAeU2F1/kw2pGKBw3EOTSAOXOVKI3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817570; c=relaxed/simple;
	bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Pt846hU2brvCvzG/8WS13oO/eIf4mZVhlcMVN7mVKzeNpJcoes7PmVziwubpM4P1updMtnawrNzbWo1f/BcjIzjp/YJk4pDSweGwd/ccv2w8WXBS5dBHXrQ8w/5coDvKnUSfVqWnh7wC+aBNcoxKGT4dB/lQUC5Yx7GQdYGT+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAnj/rcO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAnj/rcO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so56683735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817567; x=1789422367; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=fAnj/rcO80TMH8HFqrvv8EM18bPhxCk3sdYwPAKLF6fGgFJsHO9sQuudWHzoLaGtuz
         hJMenQH3yNR9cJAx9610rIwQtPX2BcSdbxcZSKVXizwBQxtMSgw6siBRJ9UtS6jme+tn
         Sp5buhngBoZr+3vzzVewIkSq8z+eqLSJb1suwCngI4JozAxhw1sSFtmZjBPZ687Ltq5S
         jAnJ7L3F4tdiSpsCA3yz4vHYbUG/PdxGhjPob2tUkXur6fC7s9Kq1wRuafLJGyjNcWU8
         sRYQEDZW/KZqtb0BNPqg/5ZHfH57TN4shs8rHSoETT0FEmdyOsOix+3+l2cZQ1xHYsuA
         wxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817567; x=1789422367;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=qUmp2NZKhi/fwRogy5lvAIXTUEvIPybfbwd98t8XAt8ACzoiFaX8PkPEZx8zIEA2M6
         PA1Tew0jHCgVm+hJRNb2K+1D6x6cgqwaNsgtcPcHNfbRA+Y8b8hwrLQ5WhmuEeKdYj7d
         TFTWkSM623x8/kfoBEpB0qz1cQ2NuXfQ5IChsyyWsFLbVOo0qzD6estJF0PkBJuMIy1f
         6y4LxsPMTytXpr30Mo+p3psAOoKfP0GsJQwYlWLqA6Z0Egq6Mw2DJtjilt0yjUmJw8Mf
         XUBKZzmFfLnHpx0qPUIHe1Iz690HGIsNNZRCNN9bcdo9wKjd5DitKpa9po6Wt3mHnhf/
         dwsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSegH/SAhnkNs3bR8cO+KTXKE68MmwpgJgmkBtB2DDExXFVCUjjoARUVqDvPA7siEYNp2VUmCbYsd+5Qw=@vger.kernel.org
X-Gm-Message-State: AFuF++kWzh7Kr5fv9JxYdg3dYpbduLvBEVVG32f8rvpPY7V7NQ6ZJELK
	Az1tLFzRGFl/78mRs8uzghlTlNC9r8bWwWiInhYe/NdmVMylFqdLORQC
X-Gm-Gg: AYBFou1e/uDILPuxUt1NO1Tk1ZBk1R/DgUiGietK1vOBiLkkkQAOz4Jitoihnx/8e0t
	vqdgav7lenxlWA2GcXWHfHvSPld7FiwLzJ4rETj8AY09l7ZVRzpvGORx2plhn/dxOhzO9SZtkAt
	/XjcotvmPeBTsBnCKWa3NApi0lo0L55FQD4uHn88Q1dAE+r+yEITnoNk3jDv537DiskQXkYL+Cv
	tBOxxhB9VWPVKFoVvAgKU7kFJRI5tjV5j8Jg/Ag44E3QMQM5UONuOlhL+DStGrzYWQbZW8TZeJ0
	fGhi3rWOTQLw1AZJdSLLXsl/uurLT0ZoQNYzmHnwTzacbRq6ki4xL4VJRkpO0OWWiNQV4jJP6B3
	ze0CwjsCEVxayDP2VwE+J5i2tK95JEpkIm798CqNFtKzJalh0xHPApagedhuOrtYtLh2qG7R0P6
	JfwtCjrR1fl/9Zh6oIK2hIc1YFr4R5UFWss6jNAIUkUaFy0QIOc9f5Khte9+XPa57A0o5UA/9fb
	tfDrCsOFN6+4YUmCWkME2V1t1A7VolLzE9a0SjngN1I3ijw+CHn
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr547293245e9.0.1788817567046;
        Mon, 07 Sep 2026 14:46:07 -0700 (PDT)
Received: from localhost (178.43.76.160.ipv4.supernova.orange.pl. [178.43.76.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm204268135e9.1.2026.09.07.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 23:33:35 +0200
Message-Id: <DL9EN09H9IUW.12C25XA0HVUXE@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>,
 "Vivekananda Dayananda" <vivekana@amd.com>, "Cory Keitz"
 <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hi Dumitru,

Went through v16 and checked points I raised on v15.
All of them have been addressed.

Kind Regards,
Artur Andrzejczak

