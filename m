Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202852;
	b=qFv2gAt3SKWb1sBLBuohEHW60Drguy1G+glMt/OR1xmgNq9t/WOseyOdTX1tiFpwf9xc
	 WdfGCYN1MPk5vt787QADJwICDyLENhadOtuQ6EHKDUljMKwMu0EeyT6T9/EMjTz+at0f7
	 LrYDnNdRmLxEiKKLmRSFImkN5cM6Bccp6cejFNlE4Sh6mCLFh2RhdStq8fjk0XDdCjhSn
	 DHRkjQoEXsBi2FsTuKtzZhTDXADX6v54sNcCVswqEOTJINBSBE98OmovuS8ooIKZFQJWP
	 wpfHKGjZNL7xFiSMibY0liIU1F8dsRBqCL05eSCwNRIx2ruRLyv0i6vpSOFciLngcpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s1UyKyctrlPlJ2gbkchgyeCfLNA2hMysZa7PZpT0zm8=;
	b=ZAdUshHioqSrQ0jd7mNeuVfdcW0XaptLdvUac9RBbI6SAFchWZ7qFhsTT1n6wX5f9Hd0
	 5QA2Is2jQ7Jnu7Z+cVICCFE+yrqQ8iUEfZoXbisMd8KTy0/GIa515YGsM5Ks7RaWdci8L
	 bZQiJF1+dUuOOUUrbe2dmMIH+dT1U68n5ObNzSS4UR0l8u8y37KgEnPK0wY9DOjy7GqRn
	 slUa57vzzLcPsi2feu7RPTwM4ijdxj87Cm6DKAQCB6f08Cy4EoiAkR847AxZwe/Qu0Y0h
	 68JMfHKwkFNsWYZTn/qnTmJTZU9ErpplRG7I3gFLb9gJjMYc/Vm78ySoTexuaE8kBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vm8wI5Lb;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01718606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01718606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vm8wI5Lb
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a611dcb60dso3608375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202850; x=1793807650; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1UyKyctrlPlJ2gbkchgyeCfLNA2hMysZa7PZpT0zm8=;
        b=vm8wI5LbRDQYrEmYEj78r7uuoHOAYlXHXa5xzTBZ3im9tToxrObib1JOjJQ67HJOBQ
         dYCw7aEZKFALq9GOSMCLov+cRCkIM4LE1g+koO2QqnwLp49ZCXvCowHJgw6oeXExJQ2/
         4d8iGz6ojhtHwR6Qm3a7LuLYnZwVef2ntvN922WIqIs1D6Ld00WjQHsjabL603/TQ2Zh
         +Mi2P8ssc2EsPNDtCtCNnisgmdPIEtcwKx6Y+j6MEe4dP6yQbDXQFksFSFt246HLj4/E
         5+SVmLUj6XbMsS1z9mYpDNZDW+PN+4yWdFIYBdL4q9BYOZdCQu/e4zoIqFhBn7JIYLzK
         pecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202850; x=1793807650;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1UyKyctrlPlJ2gbkchgyeCfLNA2hMysZa7PZpT0zm8=;
        b=u75LcikZUCLXOCPvKJj1xJAiMhQ6+130ww2QHyADOYOoFO533+tusdWY9QtkO/2gf5
         hcImUjZqjqhLhQTHUd6U4rcTnlKM8/Ezs/hny2BBihC98G1Zb/lioU+tRMiNa9mPaE5o
         BCznBXq2BlhmJcDLreLxyZiHbhJfivrfkW9vR1mWSIiC+FYAD8RANQKfQdd8wBRTUZE9
         swtlE+dzS5MbwaR/5EBtkhOv9e0WjyfJfhwuqnibZRFLDe/BvlCb7I0wO5h5gZ9LEIKW
         k5gapb8YBjkCfQQDlB/taMzdTrdE6GCN4eMM+aOS84RGQGUrYfsUHLrVBizoL12ZA9/D
         MWMA==
X-Forwarded-Encrypted: i=1; AKwUvBw3EAJlSf0hG/vAntYAP6D01siIWvA7d6KTeAVNDIY0C+4/wqezn4dS5HwaJc6rftdAIZJv3lPm4dV9TV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeN5nCVuIlg+qEdrECmqLQnQUn19U4tIyZ+Bcvzhf+EOfdQLey
	9heskhQrwpuEYUD93rDv76lpYoJov1XXxYso51AQ3ImT138q3CdEpt5hM9C5p5YCP/M=
X-Gm-Gg: AYBFou3X1JQKjwNjYoEGdtc+0TMsaenWLsFQhLWsahzYomWFvSYCScrzxrkAqWDdkIC
	vfNtAx3jHa472ZgLISb9odfi4ZAFIBz/cmbo/iF99xARgUvoEYO4CoamKnN0U1n+wOnI/hPx6GP
	aqFh4VdSg2JFIrTDqEnaf4sbepi38f1xnRWwvgmbCEkMlvU/todFMO6RrCUsflavw3FHkqgAxLS
	TQ8ThHeQITedWJZNOqUbJxM+Bh7YKoznpdoc1s24O4lv4GDLDT0sm7x/8jDrIIo2Fhatr/n5JyJ
	2haiHMiqdU1bNpZ6VPpxJZG6NZtqPfjOyoUCaT675FeKpWCY/kAEMxMT52oJSVy+KMW7s+CbeC7
	JXkamOgKUWywW2KQSvq0S1MBWuIoDMQfYSL1fFBKnfByZm8IhQKzEA28/KP5YfmsoD5oFy6Vj3A
	jks9zIT+BYxMXzmEQOu3kV4PpaU3OLPkR76WfaYvvRQJsCV3B4hC+PIpn2QcyCEIvPshcwnvnyt
	jlvAuCFk+a3mSRdU9UGDqOStEVnFQswm2X/pbkzX/A0Bh91kqmxo5XznU3ihOLKIof3Dxc26Hu2
	eOh8NJWKic7Kh5cYcnl+yIyhbn1nNNREAoWFAvn24jGtXPM4yGa1crYVJXm1Glq29zvFQS+eJ91
	bSDhpPCZ9muweL3vD+4DooKDwFw==
X-Received: by 2002:a05:600c:810c:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4a9660b4fcbmr57282255e9.7.1793202850166;
        Wed, 28 Oct 2026 08:54:10 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:09 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v2 0/4] clk: ti: fapll/dm816x: clock tree and calculation
 fixes
Date: Wed, 28 Oct 2026 16:53:48 +0100
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZgOoQRceQ/DAsoII0hJi0RDu
 LsF4tLlS95/fwHPTtjDJVrA8Sxe7BAgPkVg2nJoGKUODLGKU1KU4FhOpkXuJus01s+M0gxN3yE
 nh0C6UhDWo+O7vPfyrTjYv6oHm2nLbUYrPkQ++/VMm/d70X9fZkKFWZXnRpta64SuvQyls2frG
 ijWdf0Ckyt7RtEAAAA=
X-Change-ID: 20261014-patch-ektor5-dm8168-clk-e426101415b0
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=1986;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=yKm8jdJ4eG09cLn4qLiQzmeN4+VpA6d2SRVgK0o0Pa8=;
 b=Dl1ClXIoZyogzSsxG3KH455rWygbMMmT04YoMPUCSMBnFY1rfcDnqhFcu7LmfqiKcD9HlwqU1
 pNy/qQ0jp/HCOZXLspdK9GcqGaVHcZEzUBrIP70TxYkZE2qGxsqUua7
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

During TI DM8168-EVM board testing we found that the clock hierarchy and
clock calculation was broken already on 6.12:

    main_pll_clk1       <--- main PLL should be parent of other PLLs.
       sysclk1_ck                   
       main_pll_clk7            
		...
       main_pll_clk6            
		...
       main_pll_clk5            
		...
       main_pll_clk4            
		...

This series brings fixes and additions for TI DM816x / FAPLL clock tree
and frequency calculation.

Summary:
- Fix clock tree hierarchy by not using ti_dt_clk_name() helper, that
  causes the first PLL as the parent of all clocks in DM816x.
- Correct rate calculation logic in fapll driver (1/2^24, was 1/10^7).
- Add sys_ck alias required for DM816x clock lookup, fixing a boot
  error.
- Add error logging for clocks failing registration to ease debugging.

Fixing clock tree hierarchy is critical as it fixes DM8168-EVM boot
failure in 7.3-rc7. These fixes are affecting DM816x SoCs only.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Changes in v2:
- Fixed off-by-one error in clock calculation (Sashiko).
- Fixed clock calculation also in the set rate path.
- Added Fixes tag to clock calculation fix patch.
- Link to v1: https://patch.msgid.link/20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org

---
Andrew Goodbody (1):
      clk: ti: fapll: Fix clock speed calculation

Ettore Chimenti (1):
      clk-816x: add sys_ck clock as sys_clkin_ck alias

Rouven Czerwinski (2):
      clk: ti: fapll: remove ti_dt_clk_name helper
      clk: ti: fapll: print clock name that fails to register

 drivers/clk/ti/clk-816x.c |  1 +
 drivers/clk/ti/fapll.c    | 22 +++++++++-------------
 2 files changed, 10 insertions(+), 13 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261014-patch-ektor5-dm8168-clk-e426101415b0

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

