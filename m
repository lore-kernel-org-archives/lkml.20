Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912122;
	b=jKMQUal3nR6dL8Nznb6Dczpnuh3kR64DYxQxUkhczj69B+656x4IjwgdywmfC73pqvZh
	 O6jqP6/DfS3QwpkSFVVy3+d3DcoP0WuLod2qhdTytEFLcWHY6h6fKXLsxJ22bN7EpXvf4
	 crwvWwgbCh5frHwsLy9ecQ53GGr4HCfKdCpvnJdiCrYMpTx+ciEsOAPyLTWQXNdphr1+f
	 9j1eI3MkM2yNa/SXfHsjzswu3CJWtju4x/cP283aVrkp1EhNcVKQ66dhbRa2Q6O5islcQ
	 gD29mrJNQGZLT2hoAst/Um2A8UiXN7Ys/jrDk9AdstF8utVn6ANctyNJkZT4lertBQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=PS1VfaJQo8AXeb/IwzWbByg/SH2tTkW/13Vhf/xaBJI=;
	b=ksEz9lQIs/gbdJzInItifMlM7S985yzAVrkeZ6PnuyYiQEw06+JmfvqLZLZrcwHxyCht
	 +J3cSNSBZ/+aIw713UTdyTul7X68hc3Gj4rLopgEY2EGQ9Btms72GafUO+yWT98Kc1+cJ
	 /Oqu4CX7OTR5SRba31LeQmByhz6/Kt2OaJjErd8uTpUuRLWc1M+4aSkJbGQCNFlNFoKTK
	 R1UXw+4J6O2npMl7k/9Ru/RbJMfJAsVZwCGYMzKZql8zPVzxFdTZHP3hiaxbTzbgYj2WT
	 LZuTjMWrx44N9WCUGpCmA3VLs1WshK1B4PG7K+DrZC29s2gmniPACvpB+s5M3gASKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4QkVIy4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5A606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A5A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4QkVIy4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so46597595e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912120; x=1795516920; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PS1VfaJQo8AXeb/IwzWbByg/SH2tTkW/13Vhf/xaBJI=;
        b=u4QkVIy49fTaoNwvWvnjGQQRpk+tfWR6LLp+CW+T4swmBdd25jXMn3tdWpXy5yiFUu
         vTuksHTy2xKLcetJrE5+cHPrQ7SxLWJnqPGTMN9w/ehtQfjowZWh/o0MvhKzh4Y/iS7O
         6xYBLvzjnMShr5zzhLCdjsDSrscSIQQCSH02l/PcaqAJEQXPgl756vs05i3C9DwYCY5W
         vczinvhPLm0CpccEU/4tRsoE1aQPqsbPf4TNZnjbs3G/vgRwXjcBxn0XjaCSs0vVERNJ
         Gjc6kx/xzNqQLGXCep/9XGA84H7NXodhlQVV8d+mvDUdClsdwdAHAKjCq1WFYMkSzDsv
         vHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912120; x=1795516920;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PS1VfaJQo8AXeb/IwzWbByg/SH2tTkW/13Vhf/xaBJI=;
        b=WzrzGwIeTOAMNSxxHRXQvoE+YBgBos0oSEA40K/R8Fvq9NC2i1nPJ42b2jti8AerZn
         rFz9j8Ja9ddGexLGycdfdNHJIZaU3lmKZmP90q5ceS1+nk8TSSKLEUz+ySomdVJqXn9z
         4A2h9rnSjcxGEoPxIE7mrjeTQZp07gEQUlfSN6TRw+xt/+09IAhiXDMxcYan7yU/wtj3
         ykkwuRTxVOmSMMApveruzMkdYK+DxgP3ob34bInx46Gw0vQnCfIADsaYGp7y2Qu4zd5I
         /dDAAS5Jc9LWha+yk7MTEX0JTwjPt9ILNXr3ESEETRN7M5XOaXffRY/ioepecjhr9kjX
         bJrg==
X-Forwarded-Encrypted: i=1; AL+hErHWnfMCsudNk4hBQ8iO9y6BYxARMCWaoGMQIPltjGxpQPkQI4uJFISyLpSJaFoVPpk+zPt0p4cQG40536Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QVe/jfFP8YKEHm22ghg2MjPzDw1J4LlNmCBuWK0K7maUYw9tP
	c0R3Pomcle1e+1YGjsgocF18ImXtDoMBJp+A+coEa4+BIs+uH3cxQQ3W
X-Gm-Gg: AYBFou3JIhFgPbcNte1toTQxWOjJJp0OximnIPCN0xgqSUCsE5czKxzINbedMBw7zwo
	Bzekw9/3jlOkDkqjschOw2Mgn903xKkuQGb0bRnGk8nHsBVFAsJIvDMFkuPAz0OtKYbZlo6xm2r
	qDWj03ppER4E46ewdhDgAOyscUMzCM/hFYutyPdHFLD5H7USHS+lXkTYenhCLWpe5ia/pvbCAB3
	1y3n2uyFRtMhkLR6DNXePywnCPFoemRHEv0kCClTMKUcpZJiJp7CQwIDX7nv3xPAPu6d5ibfkW8
	E80KHkgPVdoTgRF1FEPSssiMh/sArVSNfwmapwRRTFUjQuVXuHl26loEiwVLp8iAxlES/yXM3Mm
	diB5NX1AaswpyuRTPzhh3nMvzo3EKlLf1bYxm3rgGUITbV9Ryml/pRCBVQZIgN26FW+NFv30U6T
	FGHeafF/dnXsL2xYcBJRzA38Fut+NwWRVsIwMd+r2i8L2SHWcBwX1l+Opb9uyUdZnEi2oYWGGnN
	NAR2PwizSFKmW1JB2hASWYibPvJ1FFioWY2kQA+UykY
X-Received: by 2002:a05:600c:8b11:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb55a6a53emr281079335e9.6.1794912120251;
        Tue, 17 Nov 2026 02:42:00 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm52348035e9.2.2026.11.17.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:41:59 -0800 (PST)
Message-ID: <6afc2f77.2bb6edcb.1518d5.5d4f@mx.google.com>
Date: Tue, 17 Nov 2026 02:41:59 -0800 (PST)
From: Adil =?utf-8?q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] power: supply: s2mu005-battery: add S2MU106
 (Samsung Galaxy XCover5)
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I'd like to withdraw this series rather than send a v2.

A review bot (Sashiko AI) flagged that patch 1's fallback compatible
(samsung,s2mu106-fuel-gauge falling back to samsung,s2mu005-fuel-gauge)
is unsound: a board using that fallback binds to the S2MU005 driver as-is,
which still reads the MONOUT average-monitoring registers for
VOLTAGE_AVG/CURRENT_AVG and uses current_avg to help decide
POWER_SUPPLY_STATUS. The S2MU106 doesn't have that path, so those reads
return garbage, and garbage current_avg can flip the reported charging
status. Patch 3's has_monout flag avoids calling into that path from the
S2MU106 variant I added, but the binding still allows a device to bind
through the plain samsung,s2mu005-fuel-gauge compatible with no
has_monout gate at all, which is the actual hole.

On reflection, extending s2mu005-battery.c was the wrong shape for this
chip regardless of that specific bug. The S2MU106 fuel gauge is a
separate, standalone I2C device on the Galaxy XCover5 (own address,
0x3b), not a drop-in register-compatible S2MU005 variant sharing a
device tree node -- it only happens to reuse the same STATUS/RVBAT/
RCURCC/RSOC register layout and scaling. A dedicated driver avoids the
fallback-compatible construction entirely, since there's nothing to
fall back to.

I'll send that as a new series instead: a samsung,s2mu106-fuelgauge
binding and a standalone drivers/power/supply/s2mu106-fuelgauge.c,
with no changes to s2mu005-battery.c or its binding. Sorry for the
noise -- I should have settled on this shape before sending v1.

Adil
