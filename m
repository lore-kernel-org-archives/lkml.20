Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF849434E28
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235392; cv=none; b=fAiR4SnCPK/lQkzACUPI39DAsEzdMAZJ3K11PvxYvMxQHBJptennnL0mWsR7FjZIahbzZ/sd1ujjWei+byUstzNdAZ6fkbajz2EFJwU/cLL2FlYgZYczg/1+WlC+CV1/OxUVHT0Cl+3lEHUCdfMcOiv0JewWaucV0Zh2g87gI58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235392; c=relaxed/simple;
	bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0/kNtUWY+2r9tzYSM3KuY61vNnLWGEaEQmANTjRbevL9/adgjdpANK67Gb+PGf8UEvwiC6c/TRTHJauAZ9/hoCFK1nq1QHPR/0z80r0+VStEReHTgof2ZGjpfgdMiVlzovdij1dOXAp4xHIXyKNa71po+oc5SZmajVNh1F1C5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUTKed+3; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUTKed+3"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48436686a40so204773f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235387; x=1790840187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
        b=VUTKed+3WoAJcMV+RErtML7GNT7qjE81BbvqN1ZofuG4twVgjGVxop5gpK+SgqAGUe
         LKtKWNLiTl4aQHaoDokgbmyDPm+yNU4Qt3L/9a6AgRW3ASXvfd/M7nQeeCiXPSr8eka4
         a0T7HapOCEi9Q+mjv6Nmf4N3Pt2IaNPnv4vPyWgRpqtwnfCnvqp5uS6qidGlOJ0RK/ql
         Pt/SH2hOAlQ++wxOu0Sp5xDiuWsshi5DFTKDPtGSsJsUt4+piNXaHzhdW/+Eey5UfSWb
         4N1C+Dbr7UWFz0ucjpqP7xop3AianNMpqSwuuisrfqJXJ70Rh0zish0DJVwn0CQpcyuI
         y6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235387; x=1790840187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
        b=puU8qQ/uWcYZ8aGPabSMIsMHsOMgj9QyVPmzkE9rd2U5h5okT0DbT3KsQevsxS9UO2
         i0s6Ne40cB3xTC5PaU6iTGAiiRF2UUr1/WINaHbgdIlojq+VTx3CkzyZylfQh7G+IrTk
         WGImwbQ61U6ybvI/K/XXEGh62B7wMQ+qyu10sSzEKyOIDI8kdphGTzu8mN0THt5EPeRw
         zHl+oXSVjHpQVDJqAmu9Xcow4DWpsG6uW6H+uz6Dduu5/i18kq7ktiNSmaiX1A/Z6eCL
         3/rBgc/nuK+cs5+Zh4WMMYFaySNYyrkZBXrpKsefsGY+K8NzeX0yuoO/TNXESYh/KS7Y
         ZSiQ==
X-Forwarded-Encrypted: i=1; AKwUvByOvGZG9Xk+RIq08fVpU+HUeIT4a3mez4HQt3K/kClAK/AxHn0MOF6b28ydlJlNTnlvMTmxnX6pRbOFrlY=@vger.kernel.org
X-Gm-Message-State: AFuF++lk5oc5on27aCZcSZuhmhIyfOX5lziXPA9i/hYuZtXB75kS4jJi
	zILkEgZu3wllPKiPBXCw4Ud+GeNSVv4UGJfpGpE0MyaTGc4/cj7jMZWt
X-Gm-Gg: AYBFou0xufapqii9j3drKc0hFbpUXGZBPqA9HmGw3o7DvPO9mqyTf+NhxA2zFedX6wm
	ncYeyKjYu6xfvahELwaL8drTD5P+X4mW9yV9YV/iT4UEGETezXMyx7LT41TcpPPYAVrBn5adYku
	Jb79I9PF/nrQx/LKZdjwnjpI4riM3pCnCggLmTxE8IoEDGSay6+M+b3VKbcYngoW3PgPjWr148Q
	4SGMmwzNUtxU+MQtPLeQdKOYFJ6Jg8zYgeiF76mnQcTWr2iZ/cCwxRsuRQ90lBN3sA6S0+XPK3s
	mFwK5ZdSaIXb1+mWZXxU4eQG8eCkesdzpVEXjaFeuOXxzbIWyeA7s0vbYJahWxVCKSuf1hDzKD1
	4pv8u8mKjQEG8lHI3USN05vOumGlV0ioNSmQbLtkZyHUUDdwaQn0tnhXVjpGrsr3dETj8rrydjA
	dp+g34r36Uw6HGsg8jZnd7dj/t69swvBCwQuZjHg84kRDATs5zRQlMCJu8UjsKc/n6LqSrkEdqd
	n2zjFkJKLIfcDQrj26odvVLN7uo3Bs4erJSSOiC43uD03oLzY66MmS/+Mhb5NPfwelFSlFQ0UeT
	mxA=
X-Received: by 2002:a05:6000:25ee:b0:487:342:d145 with SMTP id ffacd0b85a97d-488716c8044mr2252224f8f.2.1790235386830;
        Thu, 24 Sep 2026 00:36:26 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B90C500C183EA9C12FF3B42.dsl.pool.telekom.hu. [2001:4c4e:1b90:c500:c183:ea9c:12ff:3b42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877970fsm12839361f8f.24.2026.09.24.00.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:36:26 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] accel/rocket: DVFS for the RK3588 NPU
Date: Thu, 24 Sep 2026 09:36:06 +0200
Message-ID: <20260924073606.45849-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAPsqS2SC1GvzALUdf2xsHZDpNjDO7BXrmzk19OYTF6YopQc8iw@mail.gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com> <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca> <CAPsqS2SC1GvzALUdf2xsHZDpNjDO7BXrmzk19OYTF6YopQc8iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 07:37:04AM +0200, Tomeu Vizoso wrote:
> I will go a bit further and recommend you to not let the LLM write any
> text at all that is to be consumed by humans. If you don't feel
> confident in your English, you can ask it to correct and improve your
> text. Or write it in your mother language and ask it to translate.

Thank you, Tomeu and Nicolas.

Yes, it is true that reading and writing in English is hard for me
(speaking is a little better than reading and writing). I understood
your message, and thank you for the advice. I have already applied
it to this reply: I wrote it in my mother language, and an LLM
translated it into English and corrected it.

In future replies I will always say when an LLM or Google has
translated my text and corrected my grammar and spelling mistakes.

Thank you, and kind regards,
Igor Paunovic
