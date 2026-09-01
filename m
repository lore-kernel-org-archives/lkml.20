Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4143F09B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277862; cv=none; b=C7HPRMm8LqStnYSoiQ/IJhNHQjoS4c75J8k+x0N+1WSouPWdquwS5PbnGePpAd2n+t5VeMx6XsfI9IGSKFWo2TMapU4D725TwmOSh4aBbEmiQIZIZja6J9kALLGpDtGmMzw5j6/LOOsonKUWcdpeQNrg7zpsor2/qqB1Z5+Uevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277862; c=relaxed/simple;
	bh=3lOQEUDybbd+0QiixzpLYFm6hRd9mjudXB8HqiCXs2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rg/IiqAHueD7Ek/O5cWP/4z+fi9Bg86w2mx9zL2Be1sOsYLaz1tJ6ERHxilybuwo3RV5ld2l54aGN1vEY84FSoiiGjKmzUVmqPMpPwNzAnPXpKz1QxaT6G1lEPeqSPF0Es5SvDBmD6o8Th9tzFFc1rGPgHRnZ2tzClAESMjI3dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHLPnLh2; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHLPnLh2"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836cb2fa1bcso1259877b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277859; x=1788882659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r284T3Ls54xM3Z+Z7Ip63aactiab8jQhrZfKc2EHynQ=;
        b=QHLPnLh2sRZSkneAI69J2eCvlJlZdfyfIllLDSiG/Yno9a9BB3vPIRb3/97S21MrW8
         c3PDoSQm3JrLILM+ZmNCZDdkF67I2NKFtXH44ARYM0lNdTUB2hdlhpKhSKKrNxEQ/JnJ
         VBjaoguQkqYYYwK38oIYVuTdvtnYOvvdHx3jFGrvyME/JmwU+D721HAEiUxGHdhiov23
         lb/R2pyZgrExMknIYfzrL6MpnYVbUvuPfxHwYdhU2QraIsmihkO7cn9r3a4emXB0DFBG
         NqyFIqIkbnmxYwYh9vhg2qVk16ItE9UiWmtppVx7x/iW/DIiak1lYrO7tumz2cRiH97a
         oVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277859; x=1788882659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r284T3Ls54xM3Z+Z7Ip63aactiab8jQhrZfKc2EHynQ=;
        b=hDzkTv6Mwk9IXsSga/+gZ7pVi3LwwknkCs7ogLOh9vxmZrHQRV52mGrrDNJb04FmUi
         7DL7X3K/2Q7C9/1EsAFhMaaRe+g6R2ZWWVjIq89W6pbjS9WEoDpHRL1OPI+xWspYxeQc
         FSsqherinITtDhmr9Vko2oQvmb1y8m8OV/w0Rn5NBkVhddamqCiV4nBDV89lOgIhPyTi
         nxTQJs27S1WLL/9f8sr/Emq/WzCTYQYBUy++RHWlrnOrp0rwbRdbWmuO2NBUKALaf5Di
         +QG9w71TzfIypi6v1mT2LA3X2fmX3yIyl3GaUQoPmVQwoggZZ1JvjrlyAaYTJFNZ+eLl
         Xl8w==
X-Forwarded-Encrypted: i=1; AKwUvBwzs+oGb+twTW4i4LKuL44KF2zXoZSK5DXkPiONzNZbbJXZoSQHeUDVLyrKK/WgD26Fe7hXJt/CaHzqN3U=@vger.kernel.org
X-Gm-Message-State: AFuF++lgvcb4Bji98PJqTL5iwFq8zWIZ/mx3o8h6a2cCsmhRiq7mwmWv
	QbyN8NPrx5wk+sFHtWjlyIM84mJVjqqcvpB488opAh7jEdGNExFRH0Cg4+8b6A==
X-Gm-Gg: AYBFou1geiYqRfKV1zG7XOT3Mh+CskKNV2yhXlqlQp8ksGxq6GEtu/t7seyOMsLlugT
	2rj6SpXCE0tz2+GoGXL/0ssDVLCVZRi7yzNfLD9fQOiL+9rugMiEym6C2kyrcvqS+HFRjkBulYt
	OWPL57TskpddwJZENkRF9DvGEmA/NdNr48+LesK4yTkOeZQCL2lFT48myEIiAwjKasfq/OgAALM
	gBab95aMDX1+gVx7Xzi+os6pFnxN4Fs684iFEk8GGF9/eN8lG9IgyGhxS8G3YUgeor6cQET6rMW
	NqFF+jwyF0mvQ3gtYv6Im4D6pmBgPAwY5QwMqoSMXhAkZhsaJiKFXvQL+bDJohLOI5FmQFXbgj6
	E1oXxExx+R5VHvoFUyHtwym29zUN2HceAY5mavWI7sfeGmk4spDUagK6F88uECIN+doXl9OFrfI
	TFViRwJ0mv1eE9cJdTRbMAwXkTUZK4z8FTSaJWMBGmLW9QmTxzznUqX3xrGVyiN2kP+kgD1UFMG
	fjLp7kLHG4nj2kdOMrTiWxVoZOX5R78Ngv4MEF3Qct1+M6rdb0=
X-Received: by 2002:a05:690c:81:b0:864:6f4d:ef7f with SMTP id 00721157ae682-8646f4df760mr77130987b3.7.1788277859417;
        Tue, 01 Sep 2026 08:50:59 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed19446sm76489177b3.14.2026.09.01.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:53 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/24] alpha: select EDAC_SUPPORT
Date: Tue,  1 Sep 2026 11:50:19 -0400
Message-ID: <bceafe2ff479886d45eb410d8cd4db0027050bd4.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EDAC core builds and works on Alpha; it only needs the architecture
to declare support.  There is no Alpha memory controller driver yet, but
the core is what a future driver, or the existing machine check error
decoding in err_ev6.c and err_ev7.c, would report through.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index a435b71203f0..d2f9ef592f78 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -30,6 +30,7 @@ config ALPHA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
+	select EDAC_SUPPORT
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT
-- 
2.54.0

