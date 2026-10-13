Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F45A3C8194
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899837; cv=none; b=YfoLfSk28uIKJFFxPkFEiuwUsHsQYdr4xokqDnSkSzkFFbsYy3Jpoik0ko2eHjJmt/zR6qI2ComIsXEWPi3rzrkbgtyABNnXuqaXfDmIZ5ardYJQmQAbAE0+1aM3mnBSU7nPtSbrzxMgkGz7xyBqa2xW6YOSfA1cmsXJvq2Tdfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899837; c=relaxed/simple;
	bh=Z86vlf1stssJR2C7Z95yj5K6zh8uVrp3C3OjL77R+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMcBtYimuu0GfffPtuCSDbdGdWiWu1pfsQeaIZZCdEPx8ebDCVWm5xA5XRb7FzWvhOE6i3AMgBk7JZ0M7Lk9RQP6S4y62LkU2WQVn+7UYl/5RFutoWWlnXXonxZCoFbvehHm+UJLJvt9x82LkzEi/Yi9u6fJoh/iG1StqlCW6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+OT87uE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+OT87uE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso21373345e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791899834; x=1792504634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z86vlf1stssJR2C7Z95yj5K6zh8uVrp3C3OjL77R+S4=;
        b=s+OT87uExonM5um1RG/4wEKgGIp3KQc/Q//zwpfx4E6MCylSIij0ZvOkEzqTTRDPoR
         lVDY7MhusS4DS7xRc+asqzIW2IuXefBTXnpn6WUl/6PQlGzq6F13cJSJ63SYu1GbFLjt
         VfmaWlPYaP2X/yAT8f9ZFAAOV2+5osDcTOiAQcbseUXm3cgATEQO2zU/V0Ba5KEc6hAv
         +jcnkyKQJfl9Zg/38kd7O1sBUm1xBlVECGV8GN6t99hGdEOzsLh6FNZGUQ1EBIGWSAZi
         3uEdCKeJsRcQG2yx4qkdqLhU9tMYjcIcs7ZL9yILf5UYztZdsKjF9/ItO8l8fxWbL0OT
         0f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899834; x=1792504634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z86vlf1stssJR2C7Z95yj5K6zh8uVrp3C3OjL77R+S4=;
        b=x1WFS78SBnlZhQgfeqTOA1inU4+TlzDE1pE/yCtivvR+oTMN9hfC05vmGTWnZfqtgI
         X0VqDJpLPzJ6DuJXDS5V9u19L7kUx2DamrapwXwLZem0qqLdijJ9sVYPupzWJV6hkczW
         /+C00jWthEFScbplkEqmE4HOpaMW+FYIEk6BFw/m2Xne7NSL1DC8NRkiFB33UWeH9Z/O
         G8f87seUAM3pNeGM24OIL55iXc3oKnY+WIvMToIKSAbNqGLzBQLmYM0mTzKqqVnVf8VJ
         CYMV7TUj2NqXsQ/4ruYsZVTuaoNvFc5U/f/dnSRrrcqxDhwyL2skG9CJbm1FpA69E62i
         dXaw==
X-Forwarded-Encrypted: i=1; AKwUvBxZDLKiUDNx9V5ZULrz3/vElSejA0+cQmwGrbpSqOZT/sz7aSFtsubdlx4bs6C0o9Hwg6Vn5+c9QJ6aoBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt/FTFlZu5bH/mXbYOqsL+i2hBydCQzXlDljRneJ/MByq7XWX1
	p1IWf/2Wv80cEizQPvNX/DCSmQjkJJuapAGlSk/Fo6K2FwC1QTLbxcaf
X-Gm-Gg: AYBFou1cKoq6VseKp3vGsT4AzhlA+cABWm8K6kGfb+ARFhNpqYwebdnMoe8T/G4AIxV
	6huFBJGdlYK12HEMKPiKGvcpIu14SAPI5s27yeblyV6x2vjWHYAckhziK8Ff1aHsByBfo+V/jAR
	lkgBIvpWI5u4JVadeeD385shdiAvLKo3zl35cb1x5n4zbuBJowf635CPueH6dLp4V6VKLj+0yAt
	DULBAFaHHA/B0IhgM8v7kSJCEKc7X3xNUCRuhGVdKhW/VESF5es7PEsemNi+dv5NXovo6junpCq
	UzApT7+9FdhKprFtRJ/TLuqUq0eEv7+bbCLSL1LsUGQgBvqDt774IP/PQWgWS3GW6RA/Z6KwO2w
	hDUbQGvxTTfOdrIhPF+6HwEmKZ15ORYcqICTulG61JxWBKNvoj/mmSB/Md5g/KTsXaw+2B28Lx4
	oUZ/6WFLIN+1pH4h0G9pk0DX1sgll/ZdAiZ5kR10/EfuORrXQtXQ/OReOjEFETYUWfbZe4MA1Zs
	0bUSnTdZjt14vTuxsj7zQr8hHDQhcp9+vZPTMVvc4vgwMYUZ6CzqDHmf0InBBEh4V1Qz80/4jAD
	g9GE6QKUf1S2SdOUTeiylbZPMNSz/uRi9aWon5fDv7AKSoiPFVkSSUnkZPzvC05SnE6bWFvjGiY
	G1VFCLn92uUyYvnxnAu1kLAOcgcyx8qDLVgXo/V2DfXEDkWaDn+jsOgHnczX43wWZ
X-Received: by 2002:a05:600c:c0c6:b0:4a1:96cd:2f6b with SMTP id 5b1f17b1804b1-4a196cd31fbmr147757525e9.2.1791899833910;
        Tue, 13 Oct 2026 06:57:13 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm364106285e9.13.2026.10.13.06.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:57:13 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicola Fiorillo <nicfio@gmail.com>,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: Add GalaxyCore GC5035 and GC8034 sensor drivers
Date: Tue, 13 Oct 2026 15:56:22 +0200
Message-ID: <20261013135642.22269-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013060129.GD56180@killaraus.ideasonboard.com>
References: <20261013060129.GD56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

Understood, and thank you for the explanation. I am withdrawing this
series (and the v4l2-subdev fix as well).

The repository with the register dumps, measurements and test material
will stay available for a few weeks at
https://github.com/nic-fio/chuwi-hi10x1-cameras, in case anyone wants
to use it as a starting point.

Regards,
Nicola
