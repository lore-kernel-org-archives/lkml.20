Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954647B439
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041237; cv=none; b=EPW1pgBffVvpOfzysNPsGZpBZhOln0Z0uh4oTlvU0tsBLS/UdmdSWm3FQ+4IrUuXuAyjF99fG0azXtIfCbq6FpwxaKQWT/epY605PCtsrfIwapsX/LFGq+d2lGetzjoe1ep7/VXt5ViqzKGzCoToUCtdbqMAVVBusJWN5/TJBRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041237; c=relaxed/simple;
	bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xy4C2SCKtoukUzepiy0rYQN2PLlZYBujpe0uMRIAUt5eK+jilJJpVdZUieYm+DBKKcog7G1Nx5SoKGxE2jAnSVKXgozMS36SJ4D8+KimfVkdRTjnl27n6Ev7O5brcOewAPIWI8TA3izpMuVV2u4s9Rw/olUwK1os9GBORStEv28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL6OQG87; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL6OQG87"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so89159125e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041230; x=1789646030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
        b=SL6OQG87H3PSWC/tD89aWiSO2AC06XYEij3J0evHi9CmzaeIx3aplnbrD8RCmoRszI
         Gl+Ywv8r4pTPwlLbhYnzbx/eRakRW3z/xQHvOnLMNvTMzWOMbT1vx+6GhI7D+xaVT/zV
         O5xPlNsAGmU+W2clYM/IYQcIUrpKPBDoxEid00k1bUXw43rAtr/MTkN2v0DrHhxMCChV
         cjPcQ4AQ9RcXZVRkw6Xspgca1jw6xzH2sPwlwT8bawyHrBPh5UskVNsXoEaEnLNtzUFi
         O9w6nDvg6HlqLNYo5pP5j3fjHd+rZtnn0iDJwMlsZxG6pQVt7UmtOHNvlrrOSQVSogqs
         4sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041230; x=1789646030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
        b=HMH3BttySziJlHqB9jYR/kdffv8Hu2vbQTim0xb6fyPFj7tyWq0eGDrieSDxd+7AQb
         KF1cTKlbFpD6wi9Yms3z25x5UgZgcgm5is9G+IQJoGLSc2nSPox17A90P1FC0iPAtXGF
         zDBArYBfm/JZEaGEeBlC82dH8WETU1XTOiy6z1rNqPr8jG5kWuiBe6TnO+fkfDf4KqEa
         wkrZut7zJDgIp3Pu+GXxM5QdB56vKL96g84vQq3PpqEbAOru0mA+ikQ0vIrtHLq8w2pL
         go647uLgo4dSNuvO7clDv7krCwTOG4Ps4FQekYf6wukkVLwZx05ho6fKMlwc+IO2vn68
         FD7A==
X-Forwarded-Encrypted: i=1; AKwUvBw+vnADekDIzQFe6LS2HPhGPczW60HhxTH3ezSoUUHZjxQPcSRn65QLNke3Mtelvp1JBI67aIaMvldNPd4=@vger.kernel.org
X-Gm-Message-State: AFuF++kEHiJG7ZLxO63mmgdIrK4Q7PmV+24WnnoWzi5e7c/MfFmclWXP
	LnycxQFbf+Bm3VI5oAnapAgwnS9ZsF5meLr3XMy8PsbyEu8hMPgLAQut
X-Gm-Gg: AYBFou1b5EQzwZvzZFW0oV0XOM6sBrkjALHPudpIJbu1C+8SlqGIPNGDJyy9ZobmwvH
	Ll45EF41g82jHIdklti8fbPbJuPqK2Gt30zVxzbLLnS/sJzH8LOHrO8hhQvoKZ+XY4i5m1DY6bn
	goDt/p+SSWSuOVW2Z4mrIDNKW+aFfSBAfnG8dQ+jQgfOf70/6xB2tASp+bgubevHahqDZxS1mjJ
	CrAjwaHMipAHAbe+mhCkX2dSIrcM5PAJcMbnAXo2SkBdqMIxa9eMqf8K9a5f80BFQ36JUnWyleq
	Kte82jM3lM0glcmWg5cJBudv3P7n7w9+Ewz2qD0gtJEeb0qoa/1s3GroS7iukEgHQCf1ydfGE4H
	RtKxtMOf5uX6Ab9fv30OYU3xKIHn9jIo3WyBOES8ediaXkebJ4PTmFKNrVLcwWIxNaGSVxtssxb
	o1z1qDrTSB0qIDb5uCBvg8WxZKd5N09ViujJd1A2vwz8kjkHcccWUGQUiNHvD6ie4OBc9pNBJTP
	yDN3nZ0WlvS2qaGyF8NFfWQnerpAxHF7wRkzQzDizRqWjzptqg55Zx+hYF5Kivr
X-Received: by 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49cf824f697mr298682635e9.10.1789041229934;
        Thu, 10 Sep 2026 04:53:49 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm66654015e9.6.2026.09.10.04.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:53:49 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Thu, 10 Sep 2026 13:53:32 +0200
Message-ID: <20260910115332.7171-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910112210.44432-1-lsa.uz@pm.me>
References: <20260910112210.44432-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Thanks for clarifying the origin of the errors
 I am more than happy to provide the tag
 Tested-by: German <germanpapulindez@gmail.com>
