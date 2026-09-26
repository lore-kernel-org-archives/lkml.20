Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED14A2604
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457893; cv=none; b=eMFB+u0Cp7lNqaoShIDscVSwFXvIjMnGORdYnqkfh4If9Uaaw8Anzmfxn5vS0/8pJ0MWtHzntXudORgY8M+NKHlL861DNVC+1Qqt1+qN6/WAAvzM2izdP3InX51V0BrMfWi+6G1IvYDT2b3evGsx6eM8ZD35MJQaS/NeFEjn5DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457893; c=relaxed/simple;
	bh=mMpiwkJ7x769qDONF2ma0sDFU8snvxhkEGKK5o5Vlts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOyAHgctgoDSlVg4K0icvuNtmnyno6dcJCYuLrf+w0YWJld3DraC3w/wIKtNnrhgx6E13thSn3GjkAWZx5YWxAE7b4Zl5a1RY2cSnz5vluOxq8Tv7i+00ayZGpz844Py32CGOnQ9agf96k3ZjoOIctG2dgPkejEM6aQnJVAlQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dU8Hlxg9; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dU8Hlxg9"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-141a5cf1371so91098c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457883; x=1791062683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMpiwkJ7x769qDONF2ma0sDFU8snvxhkEGKK5o5Vlts=;
        b=dU8Hlxg949VcKbM23Ue6b9FQ47gOFgoI1/6n2aH1DSG9ZPMJKPPebOGetZUYUyWMXl
         eLQvLZEdEURqJuPWem4m4OG0qjngt9b3jw+y5xc1w4ik5gPOBYAXofzNZ56Th2eq+mVT
         8VITrtOtIn3GPnACYpos8Ra01JysKWj8OXI9TFN6/is52D5yReyJ97w/HkXBvp+0rPfB
         DLcaTL7aXMHi2HSGp3kHsiBr4r0s0h9UNiK1Vmneghn4RPpr4lxR1/b9zMfoPjiknyzO
         NbNSVwlwP0OxNE+4uyHYYsEStIHh5/BloV2CmBVJ6XPLYhlOyRpUhodmsNDyVmOllvoD
         ArQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457883; x=1791062683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMpiwkJ7x769qDONF2ma0sDFU8snvxhkEGKK5o5Vlts=;
        b=R96oXgA7986Pz3eErlDo+SXNEU6RuPR4VTAm8zpnest9L/ntS65Hzm3xnmEwUJeDqF
         db2JC2WaRh3o9YtnoRSTsMD1n4T2nAwr2cv5xKzFioysa9NuGwWnOQNDaQZBrgmFrfzx
         JD1rDSnzdFLun6Tbe0gGxFqkZn+pV3cwcnHraZgSXAXsq2cdKgLoIbZNCA3ShFs1ma0O
         2jW0itYXdjoo4myXxPYEGzMPKYBtCWCqOAODAwUEdgYsajvOnC9B9SPegwu6EoZAz+yO
         /cL/4B8TiNYj915A+cj2tXdOs2kW/oDRyvxP9PipZ7aokkJk1gmCmoaDVsfTVsiAA6m8
         QMfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7SmcSSNhlyt1iJXF1A2s8UAc2sPIGcWlkTqQKUu2L4uO3jCltp+oCP1183UqB5kqgrTHCHYUsLqwFDN4=@vger.kernel.org
X-Gm-Message-State: AFuF++lTt1xTma8ubgzmTa0OWbYmPbe/78PEMlwtEzy+milViF8hoJTc
	NkxveDfo3++1RWAyHUv1Sv+rWhWfVOOP211HeOoCo0S+SfcDFA1SOLtN
X-Gm-Gg: AYBFou2PMoxWr3KmpypjhphmSXdbrTJiyR/eoflhaEnp5gQmBJ/sXHFibTbVtqceYoM
	FvMTvgfR3XeP0AvaW2wadGdgtZqtzKbl2yHcIcbycZvopoNKl8YC7jl6829fJOUY9Tbe3oREKoG
	5K39YD5xAuEHO67oftXyECGQRGI+CSg3F9qa5i0k3v1uFufkKWlYX4DXC/Wr5e1c3O5XmuPOzns
	NBpiF51mkbA1JF8aRi672+uW1zCGLfTSP7ESEQ/z/5c4ka8BYhZZNPIEPOirsacmLw77ht5u+k0
	neyZlwtO2v8xO3Wf43grwBjjyp1w1ogEmPmfa8mdmzTDQuc1rkMcICD/bbcaO9yWfRKocwmJW1c
	tJygXYa8o/mchjapihwJOyZDRWoSBI5wI04iJTOxPYpMlRxbbTAjgxBzn2VJqMmAMHgpODqddEH
	umL+VgsDjXvhI4F3Kb6Rq8ul3i76Z32keGWEMyqOYeOVSOY7eDZ0rqd7amlyuJ9JSc+wdmOni0s
	j8nVR2W8fAs5rEyjsOKXKtyK79NCLCFrvwSBXsivC7qw7HS1vKKZ+B12rl5dgeqMBnxIVi5OL5D
	Ch8MBRL24G2MTrE0d1GYedTgxx6u
X-Received: by 2002:a05:701b:418f:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-146cb50233emr7494022c88.0.1790457883035;
        Sat, 26 Sep 2026 14:24:43 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm17334170c88.6.2026.09.26.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:24:42 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Date: Sun, 27 Sep 2026 02:54:37 +0530
Message-ID: <20260926212437.3479814-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913214713.205208-1-navonjohnlukose@gmail.com>
References: <20260913214713.205208-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergio,

Patchwork has this one as needs-ack, so could you take a look? The
current 14IAH10 entry points at a FANS object this machine doesn't
have, so the driver returns -ENODEV without any message.
