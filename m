Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901048;
	b=wnvksOC9p0nd1n9MdNo5lJGBycxP5yTVZpvY8MTAarYyTXVhQ8DR4YJIXElQcanWOk0g
	 GzkyRG53W99ren7naCOpl88Swmg0iHVUoaxjwZuDqmfa/sx1GLgoIrgMqMWX4ZyjACOJv
	 7fUuSLYBIdRCPM4QDe9YC3/Q0EodtTYggvkUupzVLVQBOTipKqVhjlfGn071asfHaMjO9
	 iyg8WHWTMTl8L3KIDbMIVN+dZO1DeZj3NdzYVVORVm0yycQFXVXAAMP1q9HFSSh+vuVFA
	 QLpG61GqJhtIo762mBKDAYa9QnrbcZpz+NZh0ajR7Yv9jPMz/wkhBaR+HdW87rVHcXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
	b=W/UdtdtFOLnavFWRmaA9Ibjwps7Ub8CH/i/1bW29tbNHr6yT9N2gPRQ6pPBnjUNc9GCl
	 rtBP8XFIodS5H5CNGPGHKXoVkcKS7i3tK5qHUK3GQeZZ/siQEfwVPGC4/uJbXW8uwNuX7
	 0N+PynPtC5+8/8uZPiDodOVN3m9VUcoj3aPF8jcuQFai28+aI2BRb0qHUcIeyFR4dILma
	 BKAiRCzQuZnumOWxTw5oNB4s9N4g5u65KNsMWQ8gePahpfCan0kSem6OkBgFJdxIF1YnK
	 eAiyj4oHY189xpRTLtfwSR3+uhjz/02YheIPJg0bNUJdSMP158RnKddh5fblaUAMqeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D1BjaDN3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA8606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADA8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D1BjaDN3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so21255425e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901045; x=1794505845; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=D1BjaDN3giwMB0xnnxKh1bUEQGpUhdG0kZk1gL7UF+p8WHizQRl0jrvNOxqK5rC+mw
         lbOmz1xvnjGBmSjQ0L4URnpCpFMDBK6JArKhf9oe/V8DdOrZ7EsJWSxnJvz3CeDMAiGr
         1nHN8W2vedsKHq8hWMannwsk0SLpQsSzIZ9RCwe5wGsw3gUwygbw9odDIgzyrgnJyF+W
         rB07uyL5ihzRlcut+7HOIJoPIHu5+ajeuww7vD2yZA2wzinaO9bppiZhMkWs+8DmRyOW
         VmmPurtaeI1wwyJeEIH5caj/9g5UapocpihJlzlrNt+F2hIPwBpPi5RXCe9nDO4/DwGE
         EVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901045; x=1794505845;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=Jy9gvZ1kLzFFE6+95x5KGcgJDW/PsZVOvWIxNID86+RT5DHLhbzKuPw4i1qY63Nyge
         VFLesF4rUhFpbeX+ywxNZ7lrGDqxZI6sYPCcHX4sN+QCFsulZEe+/9cfeUwaErSb4hEV
         ufTm1hpllahFTlABL87ZyofGEktXmX90TQ2LoW2WkPC3JlTIu7PARiqjmv1FvpmNlu7S
         R3Iz4sittsxWFiXPtXB0D2LuSInIt4ucVt5xmwUlJKKqi6dLGMmnebMv+WR4VxEVmxFz
         tyA3Z2b6Fpiml0HCSTjXyoySwRmV0IlRgl6TAon7991FbriivgRIC/amuTnSK/o9igLx
         af0w==
X-Forwarded-Encrypted: i=1; AKwUvBx2yjdC/Abrng5qyLyFj7iK4mus3imjrB+BwdU3+eq3CEqLReNAX6WtGCJwMMK+Q+5QPWViLSyTZTUuiX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cMSpOtiX2Xtgj2PHk8TVQI6hpJ9csyg0ve8d1T/SyrNdOBuzN
	xTQREALt9zeN3lG7MRVEYPaAFkO0DqQYnXSk4B+FB71PoSYlqWe1v7ltpEAxzb7KHMw=
X-Gm-Gg: AYBFou2KV5cJ8BtFCXUGY1Xgk1q3rduyd6JxiznmxUnc7M6ceipSiItNwrjsk3fqpki
	mJl8TCiBFaCZ+ix6/OvFNc0TG/hSFmNGLzqCWAw702JuFqlOm8NTLA+FbVOz/Qd/VcQzImkXQDz
	3hBys+yNhTHOyI7axxbw/kQ/CjlV5YSy0iF3GQwzBsXO63h6T4YgVBfcpguoGgk27iFx4LRDor+
	NuY6TmrBTKjPTInIdPRFtm38NxhaFcKkldWsTkCzKaFOjXslE2osqh5elEz3ONTQLvzt6pUTWSd
	HQOpG7WRL5BEXP9ijq9NefVaJpn9rROoZ2bH+/aPM3BNEg7+1JohuAw92XsQ335MGuK0j0bGTeR
	LIp06hr/+pOdWM/0kAfLrY6aDWyaZ9tCFtDgJtdcE8ufX4bhmBwDyKzDIwHKMVHXvCPXbj6pw+E
	bdFyQ8B1Y3tNEv/z7rbTajWOngcf/Ia/S70KJA+cNf5dT2rtkfRIu5douNvcXoA72+6GBS5VyVV
	duSRxDBpmZWoCkQJ+MpF3FkdWd+JIiIWBKHih0pypzrUySEnK6+5s6XzUv2rIH19FCxkueo6bEe
	iBQunAglu/k0E7+9gy5SnqVn2iZ3aOW61X7FNZ30HNYfTYht
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr390804805e9.16.1793901045109;
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200497845e9.3.2026.11.05.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:44 -0800 (PST)
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
Subject: Re: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as
 a divider clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104084.2573818.1569105668888286892.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RepJ4XPfeKmVot5v9YpoyqtS578offaAhAsWd1iXvqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn5uK2lTkH16raHEndtv5saPH5IMuqqOZpy7sclwE
 0/l/tmlHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI37mMDJtFdLed2ra09Lmo
 zrWDh2rO+B1+Oq+XJTNH61xGbjJDpBTD/3TGS63HFoWsmzpr67XN+jMYOd2f1k7Z+adJdorCzW3
 tiewA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
> 
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
> 
> The pre-divider is not intended to be dynamically adjusted. Each PLL
> has a fixed N value as part of its configuration. Most PLLs use N = 1,
> while a few special cases use N = 3 to satisfy their PLL input frequency
> constraints. Modeling the pre-divider as a separate divider clock
> removes PLL-specific handling and simplifies the PLL framework.

s/framework/driver

-- 
Jerome

