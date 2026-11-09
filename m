Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234913;
	b=U0d37ftwBJr7TPBQtUaCtvNWaF4ECKHr35Buoe1B5PrBHSdB7IEfIP/8AX5Fh1V6/0Ly
	 /7+ULVmSTqp+Gj9x+a8davwAmvMIl97GlpQgqouO34GCkO8FteurUWUQ+JwtMxnGVMW39
	 Vcc/kVAuiWqRRl1Q/I0s0b3r7MwLFXMAJEBpycNGq9ujFNyLZNutg57wjHAVybLOsFkrd
	 q/PTf+6CvUBpeJM5Z4IUt8ofZvQxzjOGKEWnrRwCbphnBQEZZX/5Itouyz6G/reoosyMu
	 apSvR5Nmdv9B7nKqCx9BKQiRneuJCBFkFj6jTLwrEX+2DG2c9XN+ItV3ptrPNCz4c6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
	b=R9r/INEZgkyhyun26qmnKjHIv47XYQax5RwmSp5uzfTK/FJlnjXeXmSXb3L/ZhE+Wjpi
	 5Iu0IzZUJOK16/sn0N/jHOx7gXe53hFaiWoh8yo9DAeuSkERmRMCIARZIK87a5OdSHYeP
	 2PzYO5m3qewCj8hAY9x6eic1x/GTXjkcTD05pDEuNik984ycnPUnJtOpnR9cogt456jrC
	 kjIqtJkiKLhTM56eomH7kfOHjOKsjsZ99NxLJo7+GjN48Hr3qX0GkJeB9zLIN8stI5f3o
	 aZA2p129RzvLvmZ3RP78Wp4r1GXyTUudEzNPM6R7KtsGwWTvwh0fjaFb8NrFLAk/LZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fl9J0rG6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB8606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61BB8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fl9J0rG6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so486765f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794234911; x=1794839711; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
        b=fl9J0rG6Bg7w6suryqbCEWKAEjT35UiVoohizax4dxCos61JJrOz186cE+4YKDNPCe
         EKoSWVudpNYliAVwaxY5RRSTWveafHn3ZkFW9ca86XTu37KlkGnRT5+OVMmRSvDlu/e7
         1kFqVSIDtQOQ/1XfN6k7ZMn1jTblW6cmfLkvo5BbSQHJnyewfcPH5mKHrfxFDlKvHGJ/
         N53fOXvbQ9Am4oC5jIwUBmlWUJwbN1jIV/QZyQjZ+QJJUMro4n70c5HVMdBnZNjKK+pn
         QHgoNEHRWtrpbM2Y3taMgAck4AeQZ8k0R505OhM3BLPdj1tQl09L7SQmfnKR6lZGEBDf
         MBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234911; x=1794839711;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
        b=tGooVNDQ7iHm4iCrgUchTxLiPKTaD2SxfFWQohiWlxF6ctop6WluKNghG468lM2wpG
         y7X0tLJ0jclN1CrtDCsqV8g6Qb6DW7Xs1aVeXnvI3FSRo1WdBEe6n3wctu8CjWwbF2cK
         VYT+jYo6u2ZQm87FPD+Gfc99WTwEvT3oV+wGG+BbTy19/cZPje9rtOtJPWU9qDxcb7sa
         v8GGx1z8YLlwSDEXd53WddlZySpXBEhNpvNhtN3wM2SuPbHSIHGwnfVULAZ1hzmT/ZZS
         i/xy2ubaYNTm///+JPerQ6ox4IoKycaZ6Oq8AIh36PnjeZL5uGAzwRws9j9B0h7wl5Jk
         t0bw==
X-Forwarded-Encrypted: i=1; AL+hErEbKAyOJMMvC+lhQNJ9oljrBbZns5CkPueR1+ccQ8RJ2pyf4qmkB2fvFWOoiGBN3GJeSK1RZ2aXy3ErtWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QXO21RXnZECUSx+FH3pyvA4Za61+LAnTx6hEOrbW/TE1+NpPF
	NC1LXpuZ4cwsxCoU1BUPPK5u1sw27MVqu9L4tDPSdY9qQLeSV9Rc9ApWiVPia5Uw6cE=
X-Gm-Gg: AYBFou0iieBJoDO8mB9ARolNueytIYt8fOwcXaj2F5lI+HtXb5DKo5Ai/EpizUF+gDw
	mz72o9psWcI4VuLhPTABLlAcwzTyR+tW5EPC5wrt45SP3+AuVnCTB2VmY9FGBOZRyiNfkJXFXMu
	0p0aza3pZRKPmxLOdyHew0mcmr3vgK+XbmNqGxSFphaEevlAzCPhXhvlo7rpRUaEe7udufE3j6W
	SiOrepBw1DV4QzhCTbB76T/Zw3M2R8ZjCnz5vL8RPeSSky3FzqrNMfG4q0XC9n/HQ5IUG3w3bBg
	DVu64PFdvSuH2dK6vrNHNuaXfu+MPdg3RkgrfFqoL6UxQgRBQ4DHpJB3ywAx4iwEy1e4dYaQ2Jb
	6e9In4BvfMGOSwXTwyvH88fIwegFMQxPAumT/cFY0XYIt0HgRzGA+BXZuf2iBsXZxWEneDs1QOG
	mC9R8NYW2isIssCbBWWGLI8zHhk6kZVRsYiakLBB7SqBx5HZPyHNPM4MV2xsSAV7iFKX2c/7kBl
	jxyuD+NyCxQ5q882RdOlskLvyNb/lMS0E/ZGcpysyEOfQsxGcd5ckMYh5mJc2NTEUpFfnpFNkBB
	W7Jx+961SH0fJviP47da2bc1ymDnmUEFx+Bw/5iSYA9vu9ZzbjC0h8S9JL0A9IJD
X-Received: by 2002:a05:6000:26c8:b0:48f:bcbf:26fc with SMTP id ffacd0b85a97d-49584b5ac5bmr9070341f8f.53.1794234910753;
        Mon, 09 Nov 2026 06:35:10 -0800 (PST)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49596acf465sm11956132f8f.21.2026.11.09.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:35:10 -0800 (PST)
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
Subject: Re: [PATCH 0/4] clk: implement sync_state support
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Date: Mon, 09 Nov 2026 15:32:58 +0100
Message-Id: <179423477880.2972505.2645503913422176960.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=o4Xgpkdj9rBV0TT6F77aSGItRKN6wTWMv6prG5GBA7U=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBq8dmgv+aOX66nSDEDsF1k1CaSV+jhqW7LubaPd
 5rQ0zILw9SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCavHZoAAKCRArRkmdfjHU
 RbxyD/9BeZoYQ4glcyQ/Fg268/AgxasdvPsVvllWI3o5uLYKBhg3Z+qIak14twdrnOqq9R7S7hL
 +4XDMf1PIzcmSxB/1XQZHmhM/pB9eLrQ/zmcOBUpLfi1rSBbw0eC3FFNwrYhNM/bu4jdBOcMT/Z
 JApjWL8WuHRz3YvSMcKCsK7I8KBS+Jzx0Vp/wmy05oV8M25wMMk4k3EssKdyYG75DpuMPbT/8ko
 zI0i5oA0YnGoGMbQPti3J1ZyASFtVExnTtK10BvaNq7f8nUmmU4rcpaTFYXo3i8xhVhMkqfkDFR
 ReRNla5mwL3nQCFr+FhvtVLZYjG7zQ9MyN5WAmDzsCwNPuWP0MeE09fiVLiA8PR1qc802csWyDw
 4OUZ937h+jK86x4qGRJOPyx20Euu7W+3Afbuxr9fI/izX5vMKRE2WGIoiAkEptjzoOtW0CzkdYn
 +YjD8x3Ej/Q+gb/qWDeKfLGvIWlMtRjgPhYg5DyQwAzBwixzZiLRtvSLQoMo/z2w/SOdAP/5K32
 2gq6DA0l5znKFTpiFZTZ8ivE1wmFhka3+NtPV1deahwLmTwVPwDl+g6Jbdyk74vNSWJdSz16JIU
 h5RO23/M7pKwh/LDwcCoGLxcld6EFLxNx71D97haH/yuJjw9T3i0GmurktbnjEAJeTEMVe9daJf
 cbYC6Hvp8QrPY9Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series fixes this by adding support for sync_state to the clk
> subsystem.

Hi Brian,

Tested on an MT8196 board with the GPU enabled: with the series, the
MFG PLLs are swept once their consumer has probed, which let me drop
two local workarounds (mfg_eb marked critical and a parent enable in
the unprepare sweep).

Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
