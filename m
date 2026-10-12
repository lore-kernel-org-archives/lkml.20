Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE587363C5F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791775525; cv=none; b=WBhHtuoElOVaXhDiayAqHuX4JjISaiMUg9iz1xDlwTn5hHRDO2V8sdoCc85uRoTaGfDjpTCB3uEbEd8Z/PwwwOqx7k5d2Byiw301CQxL2P++adF965j/zuVOdY/c/1tgoWSNOzUM57O2oW1OvM5zwazZRMxAGny5eTngq1pupxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791775525; c=relaxed/simple;
	bh=/zdr0vI7bXYxk9EbrqCZLSzg1E+iQCzgXuNOauDgcec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7HnPbw/33rlZV5FosEx+gJ9bF9X2A8MYlzkrR9JjZwLRD/1h7GvtKDWE1AqdlpyQ2CCN7XkeKm3JfAeEMCRnnM+QJTRz3vhCvuUC6EcauXIXszpIPLgZJXw+42DqWeQy4c7ep5TosxR8vyKHEKrwqtBO/xwHRgcX8U4gearGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g41ZX1jf; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g41ZX1jf"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34c522572bfso158861eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791775524; x=1792380324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zdr0vI7bXYxk9EbrqCZLSzg1E+iQCzgXuNOauDgcec=;
        b=g41ZX1jfVmF5LLBKZbkfRBecqfzICZj8Tu9IendGgPZ3xZqjp2N3VtrqS5lMHtEJOT
         c5dUOc2yBAvuM9uq7lhOPKqJ7pVpK2Mk4cwErbWafMX9RxYKJn5Jhdbaw7vXMGMOeTe7
         v2cPP7afGRm3h7Kl13UmLTOp9I7ZmqgKnhG5Jr5xmKfG1uiQjD8u2ymM/JuPo/rtVWQx
         PBAGUxwggtXiKspLDVaoyFxV9Og81GB2dCvQujp6/cgNgtGCPxo43RC55K0cAuHu0yaZ
         D4layb1VjGSfwl+7b9RDV0+ESo4bK8ltPgciIDaxQB7Z/kQD6dzh6kxnK7MJdjLcsTrE
         omNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791775524; x=1792380324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zdr0vI7bXYxk9EbrqCZLSzg1E+iQCzgXuNOauDgcec=;
        b=FxDkVykrv1CXPoIKyYE40+aHJm7cC9kWUkDajx/M8IkOYXKEfPWlIIPhg8QW+PZqLl
         p9rQqtY4IiIHH7L91Lbj22934KZxg4zMKsnIrzfCKJRnuSHOoG1t4voQe/XnrfakLkfc
         iQ1skea+aZKh95p+bTKANlKLuWpnNR68HDpq3PNIhMLFX3Cu3JInOHs2fTHzIVBRyRTg
         zJjzCe5WIqsGqEOrBop/pT7O9yKEMPGQ+/K24IbInVQOpZI671fxGR99JlZ+0cPR3mHi
         xQDtIpuKmFNrHC2wKE3A+wvfWqRkJe4brxUlnvZkuuPx6BGLD7kwJ+i/kn3vk4KvOrFF
         DOqA==
X-Forwarded-Encrypted: i=1; AKwUvBxE4zBBt1d7wVqDcKt/2GYvFkIkHX1/+RHWEem49bvkphZonYIb0iSO4cF7jfS4PBHK6PeFCz2EI1aKJe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe7rWx4c00fW82e/o5Q8QD2zbB/jVmW9cXne6d3u7C8oRqMCVm
	Twzj8WKNa88ZVWWksN79xHD0asF7+1uPglAk9ikJV7p+pNDhxPhCDUuC
X-Gm-Gg: AYBFou1I3+GTw5l2p6GktFJqGX2MsmuZvGAFTZwIfAexHqZFPiK3ezAtqfmAbmAZanV
	oBDu/6S+Gbkn+Ygvh+a+PBVKLyIX2OrMfPSap57fh+C9V2C+5gFr6LdeHMm+VDPdGTYrEeonbpQ
	oqPN4plmrweqQ18qTapiApFGgE6iRYkUZQcryRcKM8dBGJYumupsiq+4qxjQQmNjyBwIw9TcTyr
	V1HB1+WYOkiDGjVk/33Ml5HQTi/dTaSp6/8I7DB78MVmIlLuTVzi2tUX1hwdt8d97h2EHjqa0Iu
	1kvxPusF2V8OXIF3BVSyYNiFdytSrfT68tjuny0Mw9vJPa2IClRUmBi/U4wt+GueIJLc6OYGoWV
	ZmOTbAXzgUEgeak36gz5jRqecEQY4qNTv8t8GhEEWmjtKSBRk1Avw4fRtwRat+hhask9cYtHrBh
	jJO6SIS10uTRUSjaq6dVNHB6XlEbpzDoS2+dhfow7tqdL2xSlm7vAwxbE+ts5hQHlwGaVagfRp+
	Y0wub1HP+rAwZFMUJZwAwRdR4Tr9J/kPZlLKaHfGNmNJ+QaSqa017Detz4bGWCvA2lx18lMe6vd
	sRxTyCFJ0hTcKhdwvg==
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id 5a478bee46e88-358c9f3b260mr12190729eec.1.1791775523805;
        Sun, 11 Oct 2026 20:25:23 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm11708053eec.8.2026.10.11.20.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:25:23 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Charles <hanker007@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 00/12] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve robustness on faulty firmware
Date: Mon, 12 Oct 2026 08:55:16 +0530
Message-ID: <20261012032516.15692-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
