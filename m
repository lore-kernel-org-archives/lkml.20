Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0AB450416
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153946; cv=none; b=JFKqsKx/HV2ZKhrHpbdX3E4Impa6x9OzzyoUeXfhaMVhyTRIPHkAX/2HQCQpvr6im5jFi/Rqq0j8RtuW1XMpjFMUwuBwhh88CpvcxG4LQfO1PJu4loa/yfJ5+sio50LkKfeGmyjOI7VnGFeVtfGrl+fGl1WG6DXqO2osiwEPugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153946; c=relaxed/simple;
	bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4Iu8haC88PXKZlCm7j5L9VeNGkp/3LKbW95x+LA69A+q0RS43I+I1IVoKtMXrNghmRH6fhKNUcIn/DIJZTJ0PZdIu3KcCttA836u7f3phjoBhau4vCRGvrc+COYCWUMBz7yVVNPt/J8nF/qMW1JUG51VE+gWnjSWD+Jhs5MoHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNQco6lq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNQco6lq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so100180f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153941; x=1790758741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
        b=PNQco6lqOS0Lk60O2jJSg2VOb8qJPI1cazlBNiwFJoLmjNlzXqbmI2Dt+slUxktVPu
         xbjS4XnsieU6uK/wYn4l89JTnERFPnsI3dd3zVj4h6Nrt8LqSXWa6XkzFQFQcSoUg02V
         xTjFaThwW4//8qtfc/xb9+/2iQKjtKCTKGDCaobVEEuAY92qqOoEedyzXoFLiD0xYLmt
         5vfwiSTaspFktDGQvjKsrkfdR+9VQVmd0yCaspP6jnTG1GU9X746KSJ3g07JJdi/D9/5
         1/B1V4nWAObAw2UML7uzlhXhYiC9SQ5NqaRf+OUQaHz9Ecya1kbhOZ7sSkhawubNhycS
         XL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153941; x=1790758741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
        b=dj/0Q/7gZP2pzynpd/xdOXH6Lxb0FE6i4J2Tju50yzUxc6GNXOC/ECgMOXC0Vt1EGI
         8AziEkjSe5zYom274J7xsXtZCAe3FTlD0qqmNJCOP/ByjqhsUDudfnHPJ6VRN3ObSDsF
         kegoaGn7WmL5LCXZHIiiHUN+lw85MfvRqJ2ajpHqME7ezuYqPmjLuFgki4y/h51WLEZJ
         hFwVdFA3Js4vYdb7ZaOjWETuq4BTDtzuPAc9PaknQx0oBfXMZnQUZlZOM5ZLQRacc+ix
         nVfB+Bp+tM2xHEOwlhNilf2gjZjtUQKNjszaZHMLdR0jP8O01E5rawtr1AVWZU7kV9QM
         NaGQ==
X-Forwarded-Encrypted: i=1; AKwUvByqOpMoqaw6tk9MpEFCtmY9bX96pWsrlMWbx7+bwfh4or++8wk2a8wjtQpOcNL0J6iaCci0KZH6ZgKMG80=@vger.kernel.org
X-Gm-Message-State: AFuF++l8LknzcXuupYJCviNy+jyUikNqFB2vDx1nEEwdbwLuKczNkRFz
	laGE/0R3rmVAP8etwE63vUvhaglyNLWoynT09mWW5mU0dkcB8nPpT8icFSJCkg==
X-Gm-Gg: AYBFou1w1cR1jJpgqlxGBcyywcJ3qAod9ypvLGueP9L3fOcWTPwg5dQIEG0Qr9epav6
	V3XXNNU/FRLZY8pZ0a4JaGWdD66hchfnhlEp5iXgO2P9bCplnGoiUjDk7f9BRL6uqPQBYg9LQCV
	fI25Nukrx0gjvHcuMeQnqvVYP3eZd0J/Q2qR7o2lNGM+0DvoPvYDJ73/Sp8K1vFryO4Y2wL/v3a
	7sjGauzUzHCnFJxFJ/B4A19ECI2Rdr+Ee1jg+QslJjI8Ejd+NSomxTJ7RaMeoWy++pMLh198Ike
	wsf/ox63PHYydpk4wn4bSqOtBG9uugL0F/RzKWPr51PaoimT305QJWQzGJ060VuqnEKU+hkW+xZ
	zAtxO1qXwNR4FtyB5SmBKP4Sfzf7RjskQJAHpmYD7HByz1m7n7IkjodWuNFYfmE64R89gy5Wcx0
	uiCFGCKCQM195J9mN0QclQLouff4M2yYou1eLP8y6Co2iMq3cMqvJdfhJCrl4o/ND8ssk4KAmwt
	C1BuvluOzbE7vM5KUhiOhh0mhr670y3KMyQJBQ5wNKGFJo/dH24axtn+reTJYLgra/MJA+8e2nf
	iGMx
X-Received: by 2002:a05:600c:19d3:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49fdec98921mr21435345e9.0.1790153941274;
        Wed, 23 Sep 2026 01:59:01 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe23d4288sm30177355e9.12.2026.09.23.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:59:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Wed, 23 Sep 2026 10:57:55 +0200
Message-ID: <20260923085755.16219-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922160602.GA3529337-robh@kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-7-royalnet026@gmail.com> <20260922160602.GA3529337-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 11:06:02AM -0500, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
> > Assisted-by: LLM checkpatch dt_binding_check
>
> Drop 'dt_binding_check'. That's expected/assumed.

Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
two DTS patches, 07/11 and 11/11.

Igor
