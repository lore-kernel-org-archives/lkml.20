Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAFE3DEAC4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622550; cv=none; b=AkaS7v0GkxNtZYh/RL7enXP9z1Pv23xiouyaB7No4kxleVLY4Pvuub44kVQro57eHmEGCHtSolJI7j8+JKzROlXnoJ2HDrG/JbGQyBkoofZvwmlMK9bvaRKEaZpelmffyflNKm0yK5Urc11T/pU2W9sZeO1GgsFvLdpkvKe2rC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622550; c=relaxed/simple;
	bh=xHFb53dA9B0lCNvw12Z78nkIOzlWJGPGhlIDf1Flt9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDnQXa1nYw2PJKuVw3MN0Jngri5N8yD8YUZQpdZMSdxL/d7DXG6g/f/tIM0nj23Ml7JPEXrlTixe4i3BCUXjPTgQe9CPIKWmUCWwbZKDvbjiLw8Cu452wXGLed0+xF7+9ZqBOF+wxbPiPoI9YQGeR8TcvNefAiHnap/LwpmpOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UValHkP6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UValHkP6"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab16a9ceso173705a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790622549; x=1791227349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHFb53dA9B0lCNvw12Z78nkIOzlWJGPGhlIDf1Flt9k=;
        b=UValHkP6VtTjlZqz4bevENih9HiEyd5aEFgDnKty+j0yH5h4JsSkqsvz1MZZDfwcuj
         oMGzf+dgwO91vnWh4Q0G/6XcuyeWuHS8GG7XXbp53JDcGWnAYV8ISxAHA9IIaZjDRW3f
         kSYasRLqyWIrIAjw0j+Zlv4YCXZZmxmJtKkHdE+ROYzccZIkSbDsFGWjgtT1v0urvRc7
         eA141vZiEEIxeFpROqSqCwEOPRehpHYxaJcQmuchTo8ZibBZfBtUhVPwO4hVOW0SmnfC
         sSE1Zmd7UmVXUzbnXHVkeCW/3jWTtLdiUTtVKbTx5otTJ6hyH6tWm/2t5OxyBXIj4YHF
         Kx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622549; x=1791227349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHFb53dA9B0lCNvw12Z78nkIOzlWJGPGhlIDf1Flt9k=;
        b=FvgSipColdCu9qH0x52YCZS1E2D0txB4bCX8F//h4pKKr12CIEZiFTjfTnI2c/+CSX
         UsEXEFCM7B2hcPy55D2fkmuSwALxvgXlaJCzeGD2NJf0s8n+6HDMvDgA7fkhoXY72g1l
         e8ARlwnn5P8xJAYal3IYfLrlvBC1mOBGtmF1zJs5p4oH88uHguGppfpVnEPBuDB3hngU
         IPPWE+dq7guXjBO1iaNL3dm2QNP2biVhDTzSirPJYmky3o7vhIC2MlCknG2TknSsXf0o
         tXfKV7NICoAcMYdMZxJKGQ+N34M4WWSmfsdPgxB1x6QGST04Qp/OXdu6dK4jaxPKYZPy
         vU9A==
X-Forwarded-Encrypted: i=1; AKwUvBzyx61jhMeeFGS7HBcu+McZ41oe3iNmb78borrjoWHOGjuJu7H1HfvCeo0DI7kjhow+GYDnAjBiHO13r3U=@vger.kernel.org
X-Gm-Message-State: AFuF++lvuxMZRQSQF78yh2PR03PvWVIwHpPQsgeDNec2rYg8DIk4Th9J
	iIJPuX7Ar5lFtIcs2yumTHp54XgYthudEv2jxz5bPzMP6fIqX+FKROcQ
X-Gm-Gg: AYBFou0Eu86XiRz2MwCgQmb2kIi26cNNMl6RlcQXPsCK5XdZQo/X0V+54t2VvJSmhen
	SysuPC01YNRgMGtygnWSTXLeEP1VNaDcSsQJ5GnTVjCqfxF0NzdULteI095ESpKHrZnRlIa9BcA
	Xoj0wSpR7adsq5rzd7blsG3qLLLYKFfO2YfF28vSoHfg3hXxL1brpNZv2fuskYJR8SAqUhoF1PO
	WyOZkTNDQwJXs0DUoL0z9h1iHustKg5dfa8BZoPv66xYeAzLSKPjQ4cZc3Q1zYu6bljvWh/pScr
	zNmGrQZpLDrPqVJ5TSWkAuQ0uLbodj4jDUPNRjApXsryf2IXowtyZIUAwDQ55lIxaWaFm9hvIAe
	hfr3N3hl6wU9OJBraALQrfkX7oPxaH/6iB9XUno0A5wHkjZ3AIe41VtXVhszlabPDCrV4VHkLhU
	pgC5lg7Rm4vqY/sLl8//H243o/ZrAhQglB9WFCAFOvx3kEbjRlK/lTfMLbA1qzllFajLprOD47m
	kEqPK1VzxEcLL73vcoGdUqEnhtJA1nZGpcvmA0booEEN9N2Ej1IsnQiJdNTJjpffN/m+eKm2UxQ
	aB8zahjIo9gtWUzMIfU=
X-Received: by 2002:a05:6a00:4707:b0:87d:4b87:4170 with SMTP id d2e1a72fcca58-87e98992637mr12189037b3a.1.1790622548857;
        Mon, 28 Sep 2026 12:09:08 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe82ebc55sm4528211b3a.4.2026.09.28.12.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:09:08 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Rong Zhang <i@rong.moe>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Charles <hanker007@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve robustness on buggy firmware
Date: Tue, 29 Sep 2026 00:39:01 +0530
Message-ID: <20260928190901.1369497-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260926210415.3465939-1-navonjohnlukose@gmail.com> <E2EDCF4A-09BB-4FE7-9E67-5086401C0848@rong.moe> <9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com> <55927121-62DB-43D7-B1BD-19519A775659@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A correction to my earlier report. This firmware does declare
LENOVO_CAPABILITY_DATA_01 in _WDG (object B1, 55 instances), but there
is no WQB1 method. The WMI core drops the block with "WQB1 data block
query control method not found" and never creates a device, so the
register-on-WMI-error and stub detection patches in this series never
run here. LENOVO_DISCRETE_DATA (B2) is declared without a WQB2 in the
same way.

Making capdata01 a sub-component should cover this machine. I'll test
the refreshed series here when it is posted.
