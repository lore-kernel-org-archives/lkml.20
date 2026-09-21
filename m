Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916D4CCDC0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014965; cv=none; b=riJnldV3lR09PDu6JNnyHrFabYEFJRAM5G3fRzWgQo8XSrXWU0H6Y7mKvDDtpVPcbhvAkgTZgE1tdGK1nJ4HPbEnUpqT06DHZmvNY8CMZcsFsx5jyov0ozUPclpNaefn/1XDVYrU7ms5BF29Mc4eUUpMJYDssHDRmjEmQVeS6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014965; c=relaxed/simple;
	bh=bKF4UxZmhcKzpEWLoceM6baLWUfJGcTz+x2ADfuz0KY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XK4LAE+EJETxO6yDAxzEmyL70ytpt4dWNxrA6AjNmuiSIUnleeb8HUgGnFYsDe4KHJZf/J0RuKdWHQVC4piMhXZXYv+Du+S9xSIwxVm1uZkzF7caKATq5jf4XtVEUn2F3V2QD7xtdsOczAyPmH29YvXD6cEiYtaxct9EVfrVHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=dyIpUxRy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="dyIpUxRy"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso2571000b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790014964; x=1790619764; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVCv1PgC81o7TRBD5ycHllg8hQY2X2u55UwafrfWrG0=;
        b=dyIpUxRy07p7/AMtF3vm6RPCm+6a3PKW4p5cQrwVT4i08dBe/FHiGetF2newCnbYRK
         DmWT6dIohzc+BuR9xnbYeRrR7eyjnmlT4KUsrgCNQjQ/dJzMICKvT+k9+ex7LfNnTLTB
         frxUAMMJHjtP6GIs5UFgW51CP05ZqDQ4AXDaSOWE0C9t4PdTdqu+TXym9Yf5Yzy7gmhe
         ZNzU0fwb87N2hTwUoRkmF3cegTxylT1r1DKS77LbTY5XvQ5Tp9KDFcmYiw80HVXpciE7
         LEJ+IlreykdB3nhaQwaadvxTp/1NEOBomiieli9C3pGJggV54UWtF6YzSNScNED0k+01
         2WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014964; x=1790619764;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVCv1PgC81o7TRBD5ycHllg8hQY2X2u55UwafrfWrG0=;
        b=LNMPTOxkg2mMkaR9kU4Oh4gYtlIknxDvscNyLmIIq+fM0DmByPtjJKk7Limrmx1n3a
         E2h/nWXkSysx3RC/JScdmWImPQMjY57anSnujEg4JAHlu9OKGCfb2Oc5/5/mb5zq7OKc
         /VVjMQZzWeiMgOhDb3S2g0TNKBFeuMUWcPlsC6r+Wu80WLwIs8Ea0tlp4cAhc9an1/bp
         bIppqzAFPojV/iyG8WhvZpeAfVpmr96gxpAGU462GIpcVEQhOy0hTKPOzLOY2enuhiNT
         s8drWxTwv8ule5avrDXcnPfNZxgAsTPv4+y1fIbuFxir8nPO+cVlLS0x/1SWXRJkDK7S
         UYpw==
X-Forwarded-Encrypted: i=1; AKwUvBxRcADCHVtwZk8gWnHlJbyqNMs3kT92VMTjMNyGwV6T12WB2QeMX2QvWMQKRwu2ag/80bxroqizILOXM8s=@vger.kernel.org
X-Gm-Message-State: AFuF++kG6POEUmFzWvWPCI9gngF/EZn4Za81IdzZPJL3vKcT4bFr0FpK
	B3xgj+E3q4YiFLLAk2Rs9CoZY5vyXX6a2JSOeyqkxm/3vcVDXt8jmL8u176hTJqElEI=
X-Gm-Gg: AYBFou036W/Jiq2eIYP9ml+HlIZUoxTiPIYijEIAhX9pOt5v7RZrZHMt1UfpZ4v4ajv
	dqSFb37kONHJi8g4elO3f22OHzRkzA/szNqUgfa8rQpp0qJDiPdHs7gaXCRUb4PeAd1V7E+ZlG1
	xexE98IgncPxZ8yZz/bEpbVxOCZD0SBs0U0q+hmXtJXHazKaSUZ1ZUb0P8+u08WrN97yj79DF+e
	G6u90iRK7O2m8M6bYW0uFgDDn5XDUBU1Rs0zplJcZRpn4roXLsjmDvtN6wE2e8pfT7yS3Pv58rh
	vbcy0er9VThNhK+FvcsWPAuttf/vgL3cGM7TSdQ4Ji0q5cV4JGC7BCpJcyEvFuVI+npNFLPyXtj
	SX3kHRT0LVHCLXUOdq78hUUXZul71xTn8GG4mZm+Nxr8M23jWJoURE5DtkjWrR011MYnsI76Gks
	GiWTjtwkT5xnwbKe0xyP/mjzHNQmCRgatUM512pz0xvWJr36rTty8O6LnV8rlEDhayrePggUU=
X-Received: by 2002:a05:6a21:7a96:b0:3dd:a00a:c5b6 with SMTP id adf61e73a8af0-3dda00ac6admr12914266637.41.1790014963608;
        Mon, 21 Sep 2026 11:22:43 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318763bsm19075795eec.19.2026.09.21.11.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 11:22:41 -0700
Message-Id: <DLL7CH0T2EG3.82RGWEDCQXZ2@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
 <20260909-i2c-xiic-v4-1-218df31e9d3b@nexthop.ai>
 <arDgdyG0QsNerDH5@zenone.zhora.eu>
In-Reply-To: <arDgdyG0QsNerDH5@zenone.zhora.eu>

On Mon Sep 21, 2026 at 1:43 AM PDT, Andi Shyti wrote:
> Hi Abdurraham,
>
> ...
>
>>  		xiic_read_rx(i2c);
>>  		if (xiic_rx_space(i2c) =3D=3D 0) {
>> +			/*
>> +			 * If the setup path padded a short SMBus block read up
>> +			 * to SMBUS_BLOCK_READ_MIN_LEN for the HW exit
>> +			 * workaround, trim rx_msg->len back to the number of
>> +			 * bytes that are actually valid so the SMBus core's
>> +			 * PEC check reads the right index. Must happen before
>> +			 * the rx_msg =3D NULL below.
>> +			 */
>> +			if (i2c->rx_msg && i2c->smbus_actual_len)
>> +				i2c->rx_msg->len =3D i2c->smbus_actual_len;
>
> We do need to reset smbus_actual_len at every xiic_start_recv(),
> otherwise this would be true for every rx_msg. Right?
>
> Andi
>

Right. Patch 3 clears it in the BNB handler, but the ARB_LOST /
TX_ERROR branch goes straight to out: and never reaches it, so an
aborted block read leaves it set for the next receive.

v5 clears it in xiic_start_recv() and drops the now-redundant reset
from patch 3. Patch 2 unchanged.

v5 also tags all three with Fixes: e4c1ff772e1a and Cc: stable - one
commit introduced all three, and a PEC block read needs all three.

Abdurrahman
