Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457F28488F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161438; cv=none; b=GvVkfvpKcJsM5x8KZlzCkHo7xiIKF+AbGJIpVDs5pEHyCZBgbkkLP6yeM6sXml6Tco9ohugAFJIN97H1/lpwGuqmbyeZ5uZ47AYCRddN/OIBz3x4X1xftDJdRjxrR4zTVBlFhJY/rvPtDFZFewTJ90Pwyd5j6I4ZaVsoPbCMlYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161438; c=relaxed/simple;
	bh=2B1kl82sYmAxF1gcvXNtWp/v9p548DwYxTPqP/ibams=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZforVG6nn2GFkCmrxwRDTU+0KsZLRIhal5xbTuE2a5SyvHOLZHlemYBtuHEYpp+3MRr4mgB7d27c09TD0wfD7QNd818vQ7SQi8/Imgie1SVMHOFEYdFFlI5RnLRxMnJoZbSJ7Q1wp3DRQtTbhN33VERIYVANhrFkHoXq0IUGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so13105005ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161434; x=1788766234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cm/3LxFAE23VmmspdwwF2dVngvqHxTwL+4Y3pEVCqwE=;
        b=eVzIgabvMvTIN8KlaXwOi7T+XTEDsHrtYyu5uPr6MWEDhqf+GYLVW+KkVd/ajtXrZA
         ZL33e6tJmFpdqS3wND7w8Tg/XWjEWS1fFCPsTPcshfUrsUvob6TOlL5564806DaDRMlf
         YI2TZzV6C9bF2fOhHRMKzU1ZqPpglpCjRYSNPjIiTgUMDa+gM7+3O4dzob5fUuPNviQd
         62hlXp2CZEvoPjQRbGvyJNw/jiT+Nv7cyL/gITPB3CbQiauPcvjUP7HenVNciV0bMqkM
         TrQMsfLVxPbfBtv4/kPfMfNcldLPW9vDqmI/AYT3mWEUuE+zi3AW8KVa4JR10ECW8Ae4
         Wjpg==
X-Forwarded-Encrypted: i=1; AKwUvByp8hFIFdEu/HFubrH43UOJtriyvbbqJJiw8JS7BMj/rqooo4JxRIHgkNADZZto3pzrTxn3hQfBx/QcPR4=@vger.kernel.org
X-Gm-Message-State: AFuF++k1JjGVd0onDT0nN0ybsjv6kipQeRUfMcx9m8uqLsUhr9licq0I
	oUM9EZbEcZ6HCca9vHvXeEHPhQORZD3wm8/eOtWHPObaU1/bLWMISu5R
X-Gm-Gg: AR+sD13tcObAVr6EYsprjj8+CEupOTe1HcX73uyhV9Pf5j7WKCQW8pJJxY/qLXMZbW2
	r/PvnaANqTLZatH6gjYlnvuk0wXx66usMzlZd6IoPiCT1Z8joqbCE6D7poG3WO4o/66FvGmfyAo
	SyQHEdCZ3ol2+kzZY+PKUMMDiaChZJ83cR2WTo88ouLH0l0P7FooRNvAF12QlgvUZTPtwiTyZgE
	vyR6pLrmNbpNbqqnmXgjKsUgay/Ed7+ec+0EAkRt/m4kCAeGgPERJp25eCOiZXN2K39svh9LVO1
	AlRGojg5zhqRzXOotfrPoE5OVJzyqVWb1Dzz46OjIm0JUW6UTHJkwSGewOhQJuymYDyygg/jLL9
	/B4eMuztv8LJxxDlP1hxBFH+D0DpqiLW4fyU4T3FUOJtsj7TjX3EMhIs2300mP6VKqHa2ZfjyPA
	Nh5Tg1tpHOPAljE+IOTPaQab8P14u3UvO3osa02PYOIj0VJfgmAV57FWltKgdKaA1xJ7XOGql7K
	ectqK0MhxOmIiYA1MScbg==
X-Received: by 2002:a17:903:3244:b0:2d8:d4cd:dc90 with SMTP id d9443c01a7336-2d8d4cddf8bmr245815485ad.19.1788161433689;
        Mon, 31 Aug 2026 00:30:33 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988d184sm30107865ad.62.2026.08.31.00.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:30:33 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: sumitg@nvidia.com,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpufreq: tegra194: fix double-pointer error in get_cpu_ndiv
Date: Mon, 31 Aug 2026 15:30:08 +0800
Message-ID: <20260831073009.3772408-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ndiv is already a u64 pointer, passing &ndiv to smp_call_function_single()
results in a u64** being written to instead of the caller's u64 variable,
so the caller always reads back an uninitialized ndiv.  Drop the spurious
'&'.

Fixes: 0839ed1fd7ac ("cpufreq: tegra194: add soc data to support multiple soc")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/tegra194-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
index c6375e14d445..1eb96e9f3310 100644
--- a/drivers/cpufreq/tegra194-cpufreq.c
+++ b/drivers/cpufreq/tegra194-cpufreq.c
@@ -367,7 +367,7 @@ static void tegra194_get_cpu_ndiv_sysreg(void *ndiv)
 
 static int tegra194_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
 {
-	return smp_call_function_single(cpu, tegra194_get_cpu_ndiv_sysreg, &ndiv, true);
+	return smp_call_function_single(cpu, tegra194_get_cpu_ndiv_sysreg, ndiv, true);
 }
 
 static void tegra194_set_cpu_ndiv_sysreg(void *data)
-- 
2.43.0

