Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713005;
	b=OMRTsxIV0KI1ydaHNrwlsu9N/kZhm9ilGgxv3RlukN6VonZg+e6ir8XfR+p/1fRuWLae
	 YpepbVp/oVxzkDQB1YccS4NB2fjqIQFx22tX8rwKbuy6xTmt6SLnEEEax76XYX1D9HGoG
	 0zhix2cSk39wJwIecrjT+14dvdfOT+fnaBcHx/QTtB6KD09nCzhvSECtNMIbCfOAdHrmA
	 NqOuPuI0y9bScktslheIdoaN/MZmSFOB6cjPT4PfCBPvtOqL4PHJRaJo2fRUiMw3UTaU1
	 Gf7oxI6Ojt7tFitJt+jHaVZk1iD9lEw+SpeBjZcF9nnA2eM+UD8fv8NEVEuGhmhp7Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4DWsW24byfCh1xGFx+Wl8eJwcEsJtuyX6O6+zehZDdA=;
	b=iW0nx3e2DGcW4OkZ8RULgOhuPo/4g5ibTrYB6I0p6ivvcmINtSM2/NxHKYTJiwgiBFIJ
	 ZJkgqVkH4BZFR7wD4esdj2GVdc3SWEuQI9RYqpgG54CCEz4d633knXPljyXfPKbpPhECk
	 //0fzWfR1xGwadviSrOOnB2Ui83xzMcwP4eGHxJtazPW1T+13ld7fA3kFkGGQTR9o7Eoq
	 dt4M1ImfYuvlauoHuM6bkNB72c8bJB8dLADCMvhC8K8p7eArNsGN5aj0u2VCM4DE8k4WL
	 HRzyusS0HRdaU7Wc8VftFDTlWkHu3BGgOmTcYDrsf1gAhM73xAJ7RPRhZrVaT6+U04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+2Z1fmo;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3650606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3650606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+2Z1fmo
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so5480544c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713004; x=1794317804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DWsW24byfCh1xGFx+Wl8eJwcEsJtuyX6O6+zehZDdA=;
        b=E+2Z1fmoNcTkqQ3th537OvfMIa4NZoYHdDl7AVRl84h1LYzeHaZpFZScTVrFJBqkUK
         JIJ/AbsyeaWadb5t+w6s0Bh/Y5hVYZfbe2skMnsh+AXAXusS2QBCSSK9hqOlg0IjHdgK
         LDbNgo7Ll4jU5lZorxqjvTjexd1LRDt5PZ0v1OwhGMJXJJ/xZUzmcIRFrbB44HC/oMru
         k98sXmmyt5kMVnyH7gDOB6vYbeKQsXoxeEJsDFgpw6MLPknjE3lWjzl1d9o8+2VcNs6D
         fvidzrs4P10T4tT6hJVo+Td3dstpl7kKauv4j8nJu4CV6oyIOTNxXuH9XJXINSq+EHpt
         GILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713004; x=1794317804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DWsW24byfCh1xGFx+Wl8eJwcEsJtuyX6O6+zehZDdA=;
        b=h1sUlZtJPJoMH3/CW20JlK+cOWlGeUTafPUgwvdtQMh7i3YWJYfGwLVmtoo2rSZ8t0
         h5qXpH9D3JQCPkK4rw5ltE+jduEY4qdng6aRY8mbFzFEQXSJ9/Ioa4Ozd9vmJOpK2KtT
         kCVu6Y7HW7kcoKnBRmJVn0XjlO7dQVuRV9Shr0Sc6kd4pXbzsV7rvT/NFQkVuxSjAldE
         M0wyzLcTjUz7uzMAPyX+vgMIdgDfLRo+496O0EwoD0s+UR6kHduCYwR1GzgO2MkbDi6j
         4XVHQASGpWkmVJ+YmKRWF+jQvmWzyc7zA5zXfbFBzxe4C27XBNLgrWs/IAY7FxXqSEl8
         B6ww==
X-Forwarded-Encrypted: i=1; AKwUvByJ3JoCcmCwv9yoyGliQxWyiROQDOHG2N1rkV2vJXThkKRl5V0Bg2AGiYuK8JVbOsfdxDumJu0m6/zJDc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jt+QLZyEG5XJR6iyM1LTgPk/SYT7JtlXziOOGx2NX/iMTUOPx
	s3+Fmrn2CoGKnxg8J+iO+hD0eHOzULHcRJ68h6x2Zy5kCQ5GARe1m32qjlJdFsJWpwidIWNF
X-Gm-Gg: AYBFou2AEaTZvkX2OIs/GEMxlFY59iRIS9HnkgKKToTY1xgPeCIpkKFkhsa46eGCALY
	pNJKDR1EG0fZ+IcRg5j4fw+Ytz8kr0KX9x5ADhy3PJPMmadHGudyZ6iOcF9YIwp+gkASUprdpkV
	ffH+YI0VsP1VLZKwOjduBZoFL4xFghp4EVkQuQe/ed3ALhqa55lKmUo18KIJDvv4p+D48UXBbhU
	gARm7u2o/NmS6SKTaZmPS5icdzIVLXALH/JIWopVZtTrsH13ftwGoxcxaLFYdiWXDaBfGGeGmd9
	YRPgIIHfXDqqKQ/wPz8C8w8vKuh/Tfm1aBnQKroVRx7EB0cSqQNvv2zbf8+jeHZZ+0Dpa6eydOu
	FSOBItBF6I5CAj87cYTBempZQ4W2+Nu5am+VmOQFSVTx0BELt2J/vR40d1uH5v4fZuRuyDWnWhw
	Kk6Ii3v+GMlRonG0fmMOZYmy7wEnYhWxdGTfzV8RrnvMwK+4ALdGLplvb7CZSk9x56wUCclyjyl
	IND2aMh5TxkX9OJm4lfmYtKSBpfWMo9F0ZN001wqX47gcq73IQH8JpfKJ5Rz5LqGXCJc3Ix1Dua
	Hu7odFBBC9ElCR5cuzygLtBAeOV3XclXuooI2LaP1yZKHNj04rb2X7lTdAJ54GaOOw==
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr20255880c88.15.1793713003679;
        Tue, 03 Nov 2026 05:36:43 -0800 (PST)
Received: from arpith-debian ([2402:3a80:40d:48cf:34b0:c816:2853:c60c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm73904112c88.10.2026.11.03.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:36:42 -0800 (PST)
From: Arpith Alexander <arpith99@gmail.com>
To: liuwb@xiaopeng.com
Cc: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	lixu.zhang@intel.com,
	sakari.ailus@linux.intel.com,
	stable@vger.kernel.org,
	wentong.wu@intel.com
Subject: Re: [PATCH v2] spi: ljca: validate the response length before copying the data
Date: Tue,  3 Nov 2026 19:06:08 +0530
Message-ID: <20261103133608.29246-1-arpith99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013031717.3933277-1-liuwb@xiaopeng.com>
References: <20261013031717.3933277-1-liuwb@xiaopeng.com>
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

On Tue, 13 Oct 2026 11:17:17 +0800, Weibin Liu wrote:
> Check that the response carries the full header before reading
> r_packet->len, then reject responses whose payload is not contained in
> the data received or is longer than the requested transfer.

This breaks SPI writes on a Dell XPS 13 9340: the LJCA acks a write with
only the packet header (len = bytes written, no payload), so every write
now fails with -EIO and the IVSC behind it no longer initialises.

Fix posted here:
https://lore.kernel.org/linux-spi/20261103131435.21838-1-arpith99@gmail.com/
