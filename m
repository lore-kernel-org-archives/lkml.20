Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397592;
	b=AKiMSBvh9W/dPvm6jgIzENWj3vlm410XgxWWju4RY1NBYkEQQmtFLXAFphnJi5S+ZdXA
	 6QCENG+3jVU+fUKS25ENPhA0frcm6frfp1dg7VGd4ntkshNdTQQQTy+zb3b1qk/xoOXQg
	 gzjxtWv3VwhquOB/DnQ0Jm+aNKST6uEZCH4Fu9Qii0kPMTm07Ul9Z2PjtD5c9XHV1ldIU
	 z22op8JK5BNANn9HoQbl3PmOss5dggOubWrwxihZDn0T7ggw3maM1SWMO10PGSrlqll3Q
	 5ti5jgQKxYM5vaIMjF73VPIpUEyc/bes0Le/T+mpyqu+EGsriMv6j6Kx2WPUZRCCY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HnOFnygv5yOSl1HLMfs9WsIC+5M5o8+ReDWT9KOBRGU=;
	b=5DkwIjK9LiARyB+FXabXuh7jhQT6uhW9cPTkoBNqkqnm71t9SzWqol7sy/DVx3LqN7lI
	 fNgppw4zSfyghYU61i7AQx3pazZ9YpnUjjA6704yzHVhn2uWfftVaDOjAuAGEsLfkwIVI
	 7Vsid57U/I+8k0O1juJWYFNWmfi9WaRk5IF0OsEbYveVp1ZgdRtrKsA69Q2yLzPBpIyRZ
	 b85PiYykw3KNrna7sGo2s8dNsICpytgH8kZKiYymTjC/qL1O4S/UvrMCZHeg4URMfGL1e
	 7ARq2iHAfpZh5Ptxn59ECN5F1BsPziVFUVhoM//VdLrdgxfHRr6f/p1/D0I0ui5xR8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYRHSMZ4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB604606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB604606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYRHSMZ4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9874795e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397590; x=1794002390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnOFnygv5yOSl1HLMfs9WsIC+5M5o8+ReDWT9KOBRGU=;
        b=qYRHSMZ4SpGnsNf/EFABndKTuiuilCxUPc07JXhHkXGsEbUYR9SrKPr9v4FLiXHnbg
         7XiM9tjvj2C1gRqON5p1+yIJBsULQsV154tlv4V06nmGkCAet9mnls4M8+GhceGIbyH2
         T0f0VDgAEnX85hhsdQ1k5K2MViDPc0wbvM74oZH3Al65ZfxKksYDNLMGwJgRlHyN33vV
         gJa/v2HulmiCLkK/UhCvmE1SAfLe2rid4y89DRaiNutLlWBADi9Ly00AssaCuelbsauG
         aEFH53WQzGvt9Hq2ubnDzdaeNS/97Bwvl94EQpmV5mg1pp3g+7DHGa6rsl8V3uYD5RPu
         luKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397590; x=1794002390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnOFnygv5yOSl1HLMfs9WsIC+5M5o8+ReDWT9KOBRGU=;
        b=jFSlKodF7GZ62bgDOJdmtiDCCsuwHH7bghFMcjYfpOE7ibnvbV07uoqJ2R0UYWR/LF
         JORVhorLcaD1RFVyRZdgqAcLVa7XpNRMVIhgziYhildF6zJvkGlQeFQnWwzZbGl15LB7
         sh+RJ6YmP/HflLfDy/qKrc7QgXTsKijzow+omenVVIeOomAWK/WRfS0ngFYPf/i+O3fr
         z5lJyv6OkAJoWTYOVRlxjb6eC68mWXVVjv1xuY70eUAM0PPPuMEczFcF7jLN4Cq9zekV
         KnF5wqebq/PAk46DBOtKgkFAiiiHrw0Q1/frhu/dAUQmNBiJ3CQ+EPnLgWjwLqWty6Lj
         PEGA==
X-Gm-Message-State: AFq9FYINEc+/mOqxbrG13jj+W00PF/t7Fw1dvl17TGOfGwOREgGxHSPq
	cwkh0pwu1aeG1vz0sqakgjgeB1w9Ch6BTRS1DIKN+0Ba5xLcx/1LpA+r00zaH76seRhPOw==
X-Gm-Gg: AYBFou3QpMkcdkt80lJka3Wmyb/1TuVY6d6+BSEsvExpNlZtonURYlRJmMii7eGbzJB
	2XMH87RRuHe0je9skZItbFXsFVGCHMNhio6FMEks87dp9KFijgUxX+ONYr1LSgN0cQhNHJ9QwL+
	2JAZUu1Wygic+D90N3f45ZmTYnhxtu54w3Kb7RJAOUABKbIIc4zrIMUXV7p0K6CQsLuGfpnqec2
	F1CsYNfDesqoWGoQ1tN+f6DSH2aAfkZPFCu1cg9aUSUqqa4aKo9E3hoWluHsKF6jILv3bozNecw
	1JVqjRI8jqsEhPwv3ZhvZs2J/cmOCMD4gsgc0KcQfQ8CGA0+yZuisj1uApFfGmRUcHMJb9Hf6lr
	lOGuf8+YFNnwZkxibQP/XLIwktxou04/jTZMr4Se/bCPA/MVcK0bGAPVqQfF/biwLQbhp04mw9p
	gguwHjXF6iHobALeHxTxs3RttGa3jmBXzE6jNBweey9Z6wFOuKUPFqku9S6/pBhy+33FUwpzZhe
	WuhEACC1GpZOSJZQEXub90XHkaDORTAGyU5Ey2Pq5ovEqKV9CkQNstMDAr/ZhRGxgvZ5BGO9HgF
	mCqRWsrEmf8S5pc/r+9ZJx0cR/+ualLMKAYN+tZF6ch4jA==
X-Received: by 2002:a05:600c:83c5:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ac17191074mr71942865e9.5.1793397590225;
        Fri, 30 Oct 2026 14:59:50 -0700 (PDT)
Received: from linux-virtualbox ([176.123.27.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm87207155e9.14.2026.10.30.14.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:59:49 -0700 (PDT)
From: Salah Ahmed <haddad2inc@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: mac80211: make the phy tpt LED indicate real traffic
Date: Sat, 31 Oct 2026 00:59:35 +0300
Message-ID: <20261030215937.18103-1-haddad2inc@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An access point's phy throughput LED currently counts frames that are never
delivered to any local interface, and keeps blinking on the broadcast an idle AP
bridges, so it cannot answer the only question a user asks of it: is anything
actually being transferred?

Patch 1 counts the trigger from delivered data only, moving the RX accounting
past BSS/interface matching in the rx path. Patch 2 keeps the LED resting in its
baseline state below a small idle threshold, so the residual broadcast of a
zero-client AP no longer produces the slowest blink step forever.

Both were exercised on ath9k (QCA9563) and ath10k (QCA9888) access points,
including a zero-client idle-solid battery and a link-flap battery over several
weeks of production uptime.

Salah Ahmed (2):
  wifi: mac80211: count the tpt LED trigger from delivered data only
  wifi: mac80211: keep the tpt LED solid below an idle threshold

 net/mac80211/led.c | 16 ++++++++++++++++
 net/mac80211/rx.c  |  7 ++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.53.0

