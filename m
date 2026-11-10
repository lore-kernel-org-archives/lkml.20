Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269498;
	b=UXaNZOjkMtf3t1OO/0fL47vjvND+XFwgKfQtO0nF4r10IRYH6B8npiURKoke9V8kK+wk
	 nL0MGnoooMkgfDlAtL1i9u+06WTRJoICz5Xtj//c6+76YosU5+8JH7Zz1r2RC1mf+bR2/
	 ooGkd02TgVM037uJrddUc27ebBRSwlsHqVHi6ppd1Jxai5+WgNreSDj9YFMVufr5S+lFp
	 R6oxUp2QE8qqmcr3y+sHfRi2Dv7j+zhdPNhJQeQSQOwwTeBmRdc3yNtGRkqb91J2w8SKz
	 UBS8uvGJMvflnsKpwNLLulJCeQv3HXE3V2iCuzgFhLz4d3krZ4SpJA5lKSM3EGz1qig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ncQu2TW5tCLnZo3lPUMVrZHEvEC0Oe7fGakBydJIgdk=;
	b=lk3i6psiVPpKiU1Ya15gw2xLr88g8Fa4U6gnPRpWiO2ZrqWhkez4Aky5OjN3gCd0kP5W
	 GRPJI7UHMIn1xlGtjvlrYc+Nl9AT1qTRTHi0+Yv7PaFkCFftklmCSxwv4cBQIDOhUwGPz
	 REjUGwd7LAK/QVzu+EtbGbb0PN/iCjCdlcrwjH8trGJdp/Efz8+rjff+fWEZNUORsnsXW
	 mCG03Uggo349fhsq0Dan5xLqtGafEQlLMPoGps0OTP/s85Z+iMbXH26StbxJV7al/Uqfm
	 +TbXLmpXUrDk8PrARAWca85KLXF5oCh/4/8mljKd5g/fUn+/w/QNPhFQLHBVXCtTQlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+hPzUv;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD75606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD75606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+hPzUv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so17818365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269496; x=1794874296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncQu2TW5tCLnZo3lPUMVrZHEvEC0Oe7fGakBydJIgdk=;
        b=qS+hPzUvNNb8A1sVv/7CAjZooEOeadv/835GDyNy4FJItebptJwcI/qJxiAjrMTHMp
         +MtJYT6h60LIae4XmPVxQVRvPcVIqEIJMG9+w6QPNFTWbji9UO+kkqeZOQVf1T/nK/VD
         7AoET28Naz5GewEWfjGBH9BzPHy6ohLAVPV5BYU9Cxb+5qg5imhajzPLmiurZraSmaK+
         iN4qOVJFR8DNWfGOwu75Bh2n+4UNAWpY3OBdbbtJUNSLz+XwfQtCi6yOShUBZRmr8n7E
         7oWCj8QVgjlrq6ah/4DUt49g2MbxBpUklIpeH8xhrs4ic7b7bg/uiMPdQSlfoAg9Wbx4
         oqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269496; x=1794874296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncQu2TW5tCLnZo3lPUMVrZHEvEC0Oe7fGakBydJIgdk=;
        b=q7VIzW748mNosd97wuWAWdiZCMAc7wkmfw14WNG8s5CPsqEH6lfWkrCXSqXwcQbJ9A
         6uCX7yjvV3xr75Nb0hoXW5wnmXyMrmFPwsU//tCI3JZELIN0xCs9qpirtA8o+gX59lfC
         H6NX5Hnbm+4hH+jBLZaWnL0RbTAQjNmqclFeIhI+ByemSh0y89n6CXZVbspO0Sxk+hA1
         Fm2D6ppuO0SiyrHyVAQ+NmuJjZE093mDqGu1J7tXHDEQV5Ek7LbDxZqFn+6YI52lDxLm
         YN1mhwcu5q1gyMypwkFhpFeJ8E/7D8gfBKO/g42JkMWh408qMU+f2IMIoFlBxVQ5tNXS
         nexw==
X-Forwarded-Encrypted: i=1; AL+hErFZvbpOyYDmAp1TUVKRYqokfYhikuPxtRhrlpGhCuUirvi2vx6F2MCb9wNLkZesZInbh2+Jmo2mMg3VVqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yv8qnW1W2eNdNAyNBRFR3xDWpXUgeL/H9iBWt5NJXZ1JuA/0o
	n32oWHNUhfnWFB9ay4btWR2PeMSPMxJM0aUfLAbZwfJeVDf0kCOYty1D
X-Gm-Gg: AYBFou2SJVFD87y7DoNre3hwrh10k8Q93u0m+5Qs67zWTX++1JU6dKOch38Bjs50md2
	KW0nvWbqaGTJygNxr6OYHbyqpzrxpV3XjoJTBP3RhTVnFyU6WVLk3DIDLJ9jmm4otPgj7oyXVzo
	f+YRKjEZPkHa9nLfroFquwFhJ3jPCoC81a2zJcIUgBtIz76i40OZmkxl+NmCtToYO3lpy8vFNhH
	2UhQ5HFXgUZkEt80yLEttS55t9yaj/gI4i4p9eKsO9HBWVyQltyFmcGzTbqjnTKD7OzBnRdtD37
	7E/kWcaAZijTjlDVKIVNfEXWPJ2cwgzRTaMwrL8/3zFNHcAWsqsUyQ1dSHgj3b4WT+jPS/ftajq
	kpVMOB5BVgiTKyMR3F5R9hSHdqzbTfAGWvsrLLOaLBm1RCXvjj5uLBtVVG6YgGbsmgEV53EQuaU
	sKNQM6CB3Auef97UPk1CY+AaAM5H5XxRW5XIEPDhYscBkKfH6pPMAamw3qJvs9/ZRjj46084e+b
	yhSzxVN/X0HL8+qSIflgjOCxFZ6tauV44zdnGglhBG/0luZ/fuRoWpewPXhzqa9iNbltJWZJRvd
	B2FQLa78iWcFbTXdgXInvz9YWEo/TTk5fopoBT00YYNxczD6LmvvNFzlXGmsBEeFjMgObhH5g4w
	oUrKz2Ev+7T8rIGUwoOSA+RO3cRtbMPLuVr1YWQ7TFZoerjhu2Pg=
X-Received: by 2002:a05:6000:981:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-4982b289cd6mr1793832f8f.8.1794269495818;
        Mon, 09 Nov 2026 16:11:35 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm1779366f8f.22.2026.11.09.16.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:11:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Tue, 10 Nov 2026 01:11:25 +0100
Message-ID: <20261110001128.1041-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v5:
- Handle requesting 0 rate

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 301 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 281 insertions(+), 20 deletions(-)

-- 
2.55.0

