Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D1438466
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788266; cv=none; b=sftS5wope6zeMK2q/g4uAQjiF0XXsCoSGbx3StUA5k7eYG2by4It7HPL/gYQIDqOR0xoK8YSViUWtJ4GEaxuCyI1RXatd2ojFUHadoMij/4ccgZ3jOMH0ZGn1WW30ELAe6luwQ17rplqsT/etZeME5drGzyp1Ufb2sT6tw3K1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788266; c=relaxed/simple;
	bh=bvgUSkY/ZkHuBwSfrmAs0SVNeagbkaaEQadDhf6Ehx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwIJlSCSkS5ACt6SamY7LhZsZWuGfvmabn/c4yUpcxwJqlSmM6VwMlSIFKAMw99SfEOs1njLTKptXIs0vk0q0wk3+K8g+ytNeSs+javBVMeIt35TzOBm3R76EEjSD5QniUHCT3a52C1ntptdZV3iPVALavjId8UmKJxxk0983Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzsqWwd+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzsqWwd+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so9092415e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791788263; x=1792393063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvgUSkY/ZkHuBwSfrmAs0SVNeagbkaaEQadDhf6Ehx8=;
        b=lzsqWwd+KFRCvZeH7z1xLX4+9qhGLTGdrfzIqua4n4C1PmpgyX9DQfM+OPAy1BLyVf
         zdwT5pCv4ZiMiA2z4DkCwuz2um7N5ZRtcOtBofCvZvEyYVmalYmBqsQ4qGAwup5TOs27
         3+sO7zSGomtaIIqXH7E0pKaNuHVSQ9J5MN5k78k7xG2R0vVZazkc/+SgUHW/Az5S/b2I
         eZ22cTxrpzH3UQNze19tpJNz+weEo33f6HfJsykcB88JEMeh3157JMbVHJGy7gJ9J1gs
         j07ZmAEmZOX8Wvnly8u28GUdwWI52bmvv9rMpXTMoAqsg9WGCeJRolKQdPDGgfMPjPfM
         VhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788263; x=1792393063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvgUSkY/ZkHuBwSfrmAs0SVNeagbkaaEQadDhf6Ehx8=;
        b=gWhSp3f2D1gbOwkqeESy2SAd0IT/S8p8bi8hZ7jJfw2ia/0MrlGqa/VK1aPC09HCp/
         s+ijDuvovdHkV/deiK7+qJhqIM1z8OUAg77rkTYysfc01nFKDaAs+dzYvE8aIwj1/rLJ
         SEgZVdSjsRjq9vwbhLdKWqVW0rD2qkCmQ9wmjxpj0epN2uoValmwTzYLCxRXtpW4RtCU
         ADn/nTH1n0fWClWsrZPLg2FH1S8zrAVs5c6rj4LtlHflsKYRGlxPoTweS7++uqLIhWoE
         +aSTL24kdL9L5EuxoPP0rrQ7evAGB+icWoNcLSCFyQtLfjyLfauksXimLv33p2kfaCLo
         VOUw==
X-Forwarded-Encrypted: i=1; AKwUvBzGQ3SFge7uYiSswn98EKhJXG6xhYrcORFwTjMBU1Dh5OMB79MeIF2geUrJnnNIOUEzMKOcMSYYX3ttYWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYItpI7qv+D0/Da3qSxVSwS+Mek/F0orHMgw8i8v9byf4w3JwPbZ
	sSljEQf7YnG/RKzvZWfQQ5ze3omy76YcwvOFj70GxYNE52FVYqcu73sk
X-Gm-Gg: AYBFou1hD3bjOFv9mCJW/v+6CPVSk4+YfkkzrAg+ffP2irM9wQ4VNRpc4nEMktG9/I0
	RWfkPMlHOm5yUiJ71sZdR3IuytxNGxMX/UJuIe4fukXzIl8vHwPG76VzBvMhn5OwInW2SQhE+zg
	VFYweuRgaa/WsmVgbPbH2SRwrQEewWciseq3p3QzC/X5fOwLnTdyuH4QEGjNPDZbgs9GvRyKWr+
	yOU8R8s4qfqtB0qmagC9ZBP+sUyplj4dORlFLs7PdFFscncNoPcs4cO3Nyk/Kg3BijKra4XVeBU
	Qh4pCgOTHtHPRo8KkI0ZEx9aCS+O0YeM+eeHXV/kKXJo6YSV6JJr253IotL/1BTiVviDUWJZ1Gy
	zhb3NQzEKzftD9kavAX/Cq25fTZoT+yvFlIomFhpeL6u+Ca0qQnQK3Hjbpjy5lp9GbcqQisTKgF
	GGLxlX7o3926CXz1sa2gTKKoyKD3HOnqqtSGxOS8sSDcKgsxBBtilYKJG5bOhGNXPAASdAsacNz
	H/u
X-Received: by 2002:a05:600d:8644:20b0:4a1:9eb2:b2a8 with SMTP id 5b1f17b1804b1-4a19eb2b2dfmr25139195e9.29.1791788263224;
        Sun, 11 Oct 2026 23:57:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae1c4fsm17553553f8f.58.2026.10.11.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:57:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next v5 2/3] wifi: rtw88: update the beacon from a wiphy work
Date: Mon, 12 Oct 2026 08:57:41 +0200
Message-ID: <20261012065741.17636-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <97931e8606134d8390762041a638e556@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-12 Ping-Ke Shih wrote:
> What "mac80211 state" did you mean? Without wiphy_work, it can't state
> it?

bss_conf.csa_active: patch 3 gates the TIM download of this work on it,
and mac80211 writes it under the wiphy lock. That was the only reason
for the wiphy work; the work needs nothing else from mac80211.

> rtw88 doesn't use wiphy work/lock yet. and you are the first one to use
> wiphy_work. Mixing to use wiphy work/lock and ieee80211_work with driver
> lock looks not good. Should we just use ieee80211_work to avoid confusing?
>
> Or we should migrate to wiphy work/lock?
>
> For me, I prefer you use ieee80211_work with driver lock for now, because
> I guess I don't have time to verify the migration...

Agreed, v6 does that and this patch goes away: update_beacon_work stays
as it is, cancelled in rtw_core_stop(). The countdown work of patch 3
becomes an ieee80211 delayed work under the driver mutex as well, and
the gate in the TIM download reads the driver's own csa_vif under the
mutex instead of mac80211's csa_active, so no wiphy lock is needed
anywhere in rtw88. The countdown work still reads csa_active once per
beacon interval as its exit condition, a plain read like mt76 does in
its beacon path.

> Or you should add wiphy lock on IPS path, and cancel the work.

Not needed once both works are regular ones: rtw_core_stop() cancels
them, and the IPS path and the firmware recovery both go through it.

Mehmet
