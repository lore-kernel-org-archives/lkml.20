Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28061346FB3
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106487; cv=none; b=GarW8u68TmNy26d2yO3YUb2Y4s6KDs0LQyI11ip1JHJj0r8/OL6b/IRhmGDpOL6/G6/a+467tN/a7RPFskPfN7aHr54LS7e2Uh+IWtXBIDgkNd4JpO14lIJS6i5tIkW5/SK16W6eCuKQwGyK+x2wBz+UbF3228ECXuitpwCpuBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106487; c=relaxed/simple;
	bh=b4ATKoJIx0zDFM+Q2MfhNTQ29nzp8qB2UeEM5HCTfP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QV93nVCU8wt/MPWy1zPyPOhIwsu52CRRBm9UxjfwVZHxTEoOOdd15vng6+PeGzfaiJ/1PC9uAXwiS2OWf+1LXXmaGMEVtn4evAMvEHSK3zv5obGK2nnDHzFo8F5Doese14tLMUm+b67ArDrzHaEVrBlEVVQsfqw7nny+eIapL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRdeRkFC; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRdeRkFC"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso389224a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106485; x=1791711285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/KrJhVqT2lKVywgTy6x2VTximTEnfp3La/wIY4/WjE=;
        b=iRdeRkFC90q4lcXxyf0PoZc0GtDR75362ES2uuLs7nos/Q0kui9XxwPGVwEgXw5CFa
         L+H3n8lvCEBU0cLYKKkZstDDzrRVshokoLhqarWm6hH0CqAEtdvgi5ZYcTGg8d2A1htb
         ik4M65RUb1krR/07Vgl0Yaw2+UdnQz4SVjaWNni+3Sl5ztvdUpxvMrNRIQlFeGPibjz3
         /WelTxKbS5sn+BXiZ1Auk4jX3qVtqZpINokCLC39Dd9c1gYbdUA0ZvDlTXfuciA6qUQi
         SgOb0YgkFCZNJ4ZEYB4cdeOVOI5ELbQsoyr+h7BOq6bJ/Xg0f3nBmzaJ6Aray3XET1Vr
         Z87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106485; x=1791711285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/KrJhVqT2lKVywgTy6x2VTximTEnfp3La/wIY4/WjE=;
        b=j4H7e9vxHhza6H8eO48ErzPBN/0Wso3uYtRb0pSQ7/CPsWPRySUyWbJR9FSOas3LKI
         Ng7y+HQlCfR5QOT7qwt08cjaYHybXO1nUAmCa0zdE9WsPvZDbW1R5OsTxeL8aS47piBR
         2yEDmxumji+USKv9x5fl69p8y8FNk2uapch1MuZuJvI5U1U3GhGThg8uhoVCijAhpoZl
         v4eHENTSoJtTAMSVqUA9L9a7JgBfKcIuh2kLQHXhuwod1WcYl3rihsSQ+W8gVleOAfMs
         fNVuQuBPp6e/dsz5VtbJpkLaCqWVoJuQrBmclEBinmM0HIGdq8x8WqcvoIQdVsWl0C5z
         A/hg==
X-Forwarded-Encrypted: i=1; AKwUvBy/zuZ7UEZg05YGcHOk2Deym8FxknrrU5GEcZHgYwEekMwxKqCcZHP40jLj0g0dXFIQLGfIoR/IPRbzV8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwVWb+OBYrQdkzsR+JBLEmTQ6KJCN5G8WqAuGYdQmhtSGkLIPg
	SKYmnkzU+FzajkPZ4Fqlq2OwE6mG4tHFHveRAKgSNAQIGRtfyvOI1Gqv
X-Gm-Gg: AYBFou0yRRGFIGemvYDs5iFkXpKyCH1UnXL9l2GPHOYxniDolcsG2XRld170whK+spa
	SqigqwZcn2bc+FJi6kq3k/sHNqZiEA76T7y67R3PJ2HWqQM/r1Df4Rk/J5Fhr+NnV6kFVIWaI1Y
	f6X+OYXMnwvOSExrvJgCox8hvyItUgqzorAWeDrb832TuIxSG7p9SPuBHcVmu1AhED3mOIpoMaQ
	Y1A4pUUa43SPFfd61yO2dQ4FLJ0iEI31wp0iqEtUsd2ysTYIP4U5T2JvcSHrPzwC6hcM1Y3PmkL
	axDrYsEp4i5I6jx9K6s3K5rQP1+e/5afkkQ6cuoa9nxcd9eE4Oij7Vl9N+vf0j6SFFcru0C7k01
	W8gIw00NPS5KonA3GqBKHm9QkIPUZJ8LKnX6YlnwApvPUDJleIRFcy9QpddWycxI6p4gH116pc0
	SqiqR0517tNGc+ZvhdKblGECWONthZZjAXOn/6LkAPjVDeEI2zkOk7xLCQpG6/1Jz72sV0F+hy2
	seLOSj8AvIYaDoSmB9h9klE
X-Received: by 2002:a17:90b:134c:b0:3a4:b6c2:b154 with SMTP id 98e67ed59e1d1-3a6ceab2503mr3388577a91.16.1791106485361;
        Sun, 04 Oct 2026 02:34:45 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262f0sm6589919a91.4.2026.10.04.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:43 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host with wakeup
Date: Sun,  4 Oct 2026 18:34:43 +0900
Message-ID: <20261004093444.74223-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 03:16:28PM -0300, Fabricio Akio wrote:
> Host mode is untested, since this board runs the controller in
> peripheral mode.

I tried the host side on a Lenovo Legion Tab Y700 Gen 5 (SM8850,
dwc3-qcom), v7.3-rc4 plus board patches, s2idle with an RTC wakeup:

 - host with wakeup disabled (USB 2.0 hub, USB 3 flash drive behind
   it): "HS-PHY not in L2" on every suspend before, none with the
   patch; the devices are still there after resume
 - host with wakeup enabled: no message, the port does reach L2
 - peripheral (connected to a PC): no message

Tested-by: Joonhoe Kim <26rote@gmail.com>
