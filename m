Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AD370AFB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318908; cv=none; b=rU0nOssb15G8qugPEJ+RKTl8lN5fJX/9DFBD47o0IfrZO7uoM9pvYO51e6KsRTRcT7kBH9uBbxqSC8gsmfl3PZVBjT/pfsxGGC/7yKM5+B52tpEWwppx3ABOgsnOORJKpFicrmPo9mb+zE9ltZLEEhm6pOZW+35s/OeZ04a7fkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318908; c=relaxed/simple;
	bh=MXG3jt8SNUXfPEkjinTsC2MhZOUlLaut7rgkIbkmdKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VD/9eDjV3wdY5Uw29abKK0nFJ2JOpx3eNP2b2t8pU2q5CIyOcy+UQURPuuK+f22q/QSZt1GKIMAboCwCDip20oeIds7nBo6iB56xFudDmLHMZsv4iNuT9Ax6aUpDeRjqrH0FXfhPOVoyU590+bkkE968NXSEWrUnUqBEgEODV38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/6KC3dL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/6KC3dL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so569231f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318906; x=1789923706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mw7SMOhwaSyk7MD2QFAvl4qYB+Y8cjEjmR0cYWX1cA=;
        b=B/6KC3dLL0hbkhlKQEU1/XNwi59isZ3oqGvUtzmjOglSbXTcSoJqu9ftFOIOx4r8bh
         1Ts35ucsUP8v1w86vF8oiiJit63jzj9hlLyM+i8EyJ4qPh3xEIr2HIujCQ4RLs2bKnfO
         miO9/YLWid6/s2luiYQaPOYOr8E65x4scqjaT4+6a8ry696Fe63EhK8+fro0Jo2OSYeX
         AVv0opwo0bBSgapSkBpFLfsosd7RZ+rQwGIquRPGTNFjKNYfHFaSp3DsdIlWYVY+yFj7
         aDRNUfD+YVA8T9QtwFe/DY6g4YRmj2F4WzPq2OoRU6P4IDc5ORAxb/c6dwBYptuPPdDL
         4WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318906; x=1789923706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mw7SMOhwaSyk7MD2QFAvl4qYB+Y8cjEjmR0cYWX1cA=;
        b=FC9ndNxAkqw5Col7Hu5A4G0dMxF4is3KHkKRQSDQmHzl1u1D1A8uEULPyWGKzHOLxJ
         489JMyWuNkUVkWkbBMTme5XLQJ8hswBxB48ZN0UAP74NYTy424qDJ97/xrLmRfavOR5z
         FjkChIiHvUk8zqMNTBGWrznydQJJhPxvoewTCYJ74nNIbXAL8gmT3gGlngcZeREQAUjx
         QK/+Yh11LcpD3NCgupn7KaeT5q3d/R4RWpksoA4GBAKP8KTEJRTb3XtEXHYTQsNSTEr8
         E1r1EwTli+ldr6PD7+XmYmT8807g5DIEJHoTpOPLA0w4zhitLdlXUvcEjZM+h4jgWHPI
         QQ9A==
X-Forwarded-Encrypted: i=1; AKwUvByfPWanGbxSB09xHFt1/SYbkVWe6/V0E4e0rEzHkzonHcUvHQS03a2GJ6QXWVL7MWc2ivIfzGWg+TgLBAU=@vger.kernel.org
X-Gm-Message-State: AFuF++kiqtyX62ItK8oFtTfkCg7WgP5iePPgW1NM06NQLafiQUDqqn8E
	aDS8qefnKo/rPIbu1R5n2S2M7/tdlUA3ZSCIzYnhEf5ThNAuCLkBvxNG
X-Gm-Gg: AYBFou0rX/1Vcv9m38PzoFjXL/8xNpQEfQzpH74bD4WmD5nU+SuQZKJRci5SGdZcgDr
	SHAWa1ijIf+6QGolfVrqf8hAEGhJW5aADr5YUQ2ANRrxaDtM9DT3ldI3pMBefbIhBsd+aobk+NK
	tDPFya+mTt9OKyc8/9kQxLLPRz7E7joqLRGMHtuNCaPucMZtxc9dzjn1efVUf9cIvlWgzYIK4Hd
	KnoQjF510safdjlWs4ahQpz7eaYni1isFOyZCyspwH3aHX+OYCOjV6si/jeyyrKVefMaVwTmRgB
	wewPegvSeniAVsv2lM/ruGabf1m1USC8XUWguPJtvVVaU7lbxq9Rvl3KE0TagXULSfSPGWXduQI
	e/4qBRlIYBEZiGvqJ8R9D0ZhtJo8e/A+JCxaBDi+BsXZAkDNdH+ee1ewYmmdAXhx4WkGbdO2w6k
	6gc+SHT8q8ZoFpk7DeBwjuOEgCeND9o3hlH6zYl35vHAi28uEudHfooa1ttoeTyWL2oqnnmIYDo
	O505h2BQndk31nah3xJY2nenh3eY1ykBpbs2aXh5h6j490v2bzqkA==
X-Received: by 2002:a05:6000:1841:b0:486:f199:187b with SMTP id ffacd0b85a97d-486f19920c3mr12392374f8f.34.1789318905553;
        Sun, 13 Sep 2026 10:01:45 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm20357224f8f.17.2026.09.13.10.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 10:01:45 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test [PATCH] media: ipu-bridge: the Surface Pro 11 rear sensor is mounted upside down
Date: Sun, 13 Sep 2026 19:01:44 +0200
Message-ID: <20260913170144.5491-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913153526.80287-1-lsa.uz@pm.me>
References: <20260913153526.80287-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch solves the rotation error pointed out in in https://lore.kernel.org/linux-media/20260913144127.17995-1-germanpapulindez@gmail.com/ 


   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
