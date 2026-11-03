Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699641;
	b=Rmd/HHnu7LjSdb70EJEUYIkwwQ3JDx3HKdMdD6uVBK0FzSUj83TmhbVOsJ/aav3Xsi7B
	 py0BBkpImo92WNPke96al+MygbhlpYfP1Fsb3l4TOrd4xIuGm4uiDbspCxjZjSHDYgGbC
	 aanugxfdWAzslEKDlCpqv99tCIZVUELSQFiKmVWi8L1m3SktlmAb2wUME/9Li9dlIvwIZ
	 U32pvek1TU2mWnb5j8Vbwg5T/XcPBUO8y83fOpnxA5v6hjQwLuZa1JtIRJJDw5WQaYFrv
	 6Es4fjgBipAiyz7RPt5J/yyZqgXYDl/WpJNhXk599ZbwG/k294OvFpm9VmhRjBNz97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
	b=fTp0BZJHjvZP5EfGRYcfu/gUfuPCbBTLEXgGPJkiQj20QHYNI31+9kBxENiIsSC5Jk26
	 i/M/1XbhxYU/QB8/4ouGvBXEsHb0ZyuyNv1JQ/xMTtJfxebf7R1oF74oIj9fho/9ysmDz
	 zj47GYw1JVQ6fQUSdTAI7p8sSnCATV2iv+/Y+EA/4sNg02UXisEqNFSwn7AcOceI43i98
	 RR/X3uJM7/AyoU3iJHs8OLSEsMsx2t+3AeEBBHS+5CoUy4bwtMBIBU3DK8xY2915rPvu1
	 VRZGG8B5FBi99pfYvnefx+wrb0j2MGb3NW4oN8PFX6HJwX6MXNdX1Bl4iBwP/KEnxLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TVKimARu;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA4606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AA4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TVKimARu
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so2075102f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699639; x=1794304439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=TVKimARu1D1Qdeq8B1f1CqmcI5JTnkuYeA4DFQQFHQPM47oZTLs5Z+NA6c+wO6AFGg
         jvifZfjJDS+sSTe6x+zhJv06cvRejmIuxXFIwR0yUwQDZsmvEVGAk0Pd7r8uQZdgsBbH
         dJJuCgDJG0CrZAdvYdeKkwf+fczYyw9U20vGp9sr64jzNwejRpaM0PkY9GXly6WlwLq+
         R3+XQ2uO4UnBzDkinSlIDB4D+VQGI+GCHmDax7QJWhIpblQlOkb0ck7UQmotM8Wid5k5
         k+HdhqxXXSfszQzLlS5TQtQqwgT1u4EECVBFnU0nwnDPDGjUWQMsMyKq5O6pDSLZFn7H
         SLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699639; x=1794304439;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=NHwB4jHC1lPgXWhi6YYfDp0C8Q+BwuDlWHlTACHR06CGc7YIrRt5wnnV4Id5xbVXQw
         lwGXHNpcyhxFxEMZ4irWcmgPalUE/pZin0lK6qfNNGav1KpL9InkP2Bw0/q2QfzptZgL
         gyu+s0TjKjMdD+VyI8RLbRVpEQq0Oc1uUWqwtUDD+H6WTWtSOfxWLgUKazmIz5yRH5QG
         GNkxxSsJ3uRr2+ztDlKFt+ZhJnyARIIqH5q3uG0+rPx8etMZ6ubWrJTUdKc+IUHfni09
         A5gSig1t2pBGRYtz53XMey2Mv3h2llaPJktEivtFusZ4OYpGJm/wjALSxNJv3HJ9Drlw
         C+2Q==
X-Gm-Message-State: APuU4Z+TADsYkgQiVc9W5f9UmXsFIbKR7nIaK7F/a6B6Uw9xjc3QM2a6
	sRKD45EOn+IEGIQpnUm1OfHXLLcT1/FCu6Z9/B4c/La6at7pOaPGyjUmO13k059L6TfTH9q5q7V
	5oxN56gA=
X-Gm-Gg: AYBFou3aIU4NHb8/sny3VbQU8ChYG/wuhLnludi8Dr8jS2nX1ljqgszjI7ChQLwrKpQ
	ZvRRekxjQTyohjne+t9pbdUMpm6cgjTEFjcD1m0wfTfYtDFk8jfYbZ18uJmLOeJrEZIMwS7d4oz
	ta0paU73l9Q+/lkwjULkg7JsDYkzZkWvTw1sA63DLBtTwe9bwjjjxf0uU41kPlmwB5fORVPVRIa
	vpio33CbjYWU9tsOtoL992f7ZKXvAa8ub8NxLR5CsFW/gWPjJTKWwCn8+5SN6FP8COKZJPY8+lz
	cGqP+kFylEa6DDAkN3hOTToGQzUNiKtYO6Q/IZLoOwS34tD3F66q07fZ3lRnDLt3DUYU71V2V66
	S0kFHUSJLqdkbt/D+TG6dmeJTMq01oVrNSQY89DkvaRSwSEDlsIKVplD91L6UP0ItL0WXdPWNlj
	Vzk1viAXDUfDAorvFgHq0Z6V1O1hu6DA2XnQYdXAXXL0kc/lyX4hTf2iqSRnCb6NS/l9tGJifbc
	1dbhu4Uqtax6a332LF7P8DsaF6zwlOzaCfa0IBi83AizxJOa7kpv6W+/Ux1Jzd2+JSWaXvfDWwF
	lqIXW1RA4Zcf5HMx95MIsDzns93kUYae/yYf8jcWoCTusk/LEtLc3Fn7DlHNAPQC9/gSDPo=
X-Received: by 2002:a05:6000:2211:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e6e5161admr23618701f8f.49.1793699638798;
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm24029915f8f.23.2026.11.03.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Message-Id: <179369963832.2329937.7183164129825631720.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:58 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm-dt)

[1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
      https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e603da0

These changes has been applied on the intermediate git tree [1].

The v7.5/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

