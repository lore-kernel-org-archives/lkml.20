Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380761;
	b=p0eHbm2fOQCxJqqafohFWcqWSz/K2hvXj1+7MCmi/Dr53RvWhIPmsqtMtHONeIzJndyh
	 UHZigXJGu/qENB6IU/8eGC6hRRHszCyzP2O6qHBNn6+PZUAfqq1n2j9knANqIsrZeLVXx
	 9XDPn16WSLqYNrm2f8NEzBF8EBXTtqGOyv8ZbYRw0UozBN9VLNdnyJIEnNMlzRebZPnWB
	 DqYetm5MhlpZ+O+CmnULfIrJs+jVa0LHCwMRjgkWjaxbDCO2UbJkTUfUW0cDYrXFt179d
	 pvh5orklT5OvVScqfsrA4vvqOJE1C7Wt2VSFy4K0gpbl8yrGHM6d2Xx1URfuXTa2DNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
	b=vrlrECd66szZkkKd80rm1RJZSIiS2H91/tX0G+wso/uO0e5pcUNvSHdcXuZp0QW6jC6s
	 4MzxG3iiu7btmRizu45QJLlWbP1RaL4zpiCKCHuP+vbGs6mrXVRmSI+N/AFYvwZTaYdk7
	 hfwDrOGbicqgZBs9GNrfRrRtTW8pmzV9/AMOGcfjEJYEIAeaRnIIUYOHZKXU1ys6YHC1T
	 sGyz/6vfvZbujV05drlIeoUUceBaGT/slsJjQqd0+hJi91gFJi6++xMUq312wuLbrRdpB
	 kvyL4sihMR+A96j5q2mqXmJQer0KgkNCcKPEfHqmSLNMw7SZfdiOdzklQtxciDp+e/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Z33qYUXG;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E826F606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E826F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Z33qYUXG
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so6610575e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793380759; x=1793985559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=Z33qYUXG5DyX3rqCy3fsjys7dNbph6Tlrn0KcQHI8PrZQwrbPfRATYczfGDPZZ9ObU
         C2R31LAtSBTQTtFeYwIGk8dhgv/v9SiMmXeVN/79cd6yvmyD/wuDGu8VBhdqyN/yq6cm
         djDHZs8kWTn4cW952RtXzYp63D2usjcwtD/go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380759; x=1793985559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=hdM8q6OGAce+0kAvs23LwTdMXubyW8DTf+kmN9MESOdh5NjAUszRAhCt+9L0kSzlEh
         WVEaVN3BeKSXYbqu2YfQKBj2hTg/YFQhu3kHZRrQI3VM2sTyLN5EU/zeqK48mZFcR6Sm
         BMIMq3aY55IkL18/PrDUTcXIV2LGJ/o4iUa6s+C5OoL2sL4bMK4UXAx2PpH8jR+MgF/9
         CC4ZEnNXjndZi7kRxr1uN+tejHbqyCRaGPVCblLSJxsqMuPuL95myB2K4TnXXiprAK5n
         J2gMooXKqRjR0vsMSkXrajCjie1PGusMe26fCsbqcnS5ABLz9nWGVuRDLXsBRaLfObfc
         oZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBwnPDxufRjMixTdltjF6+krYI3aX9y8xj4N0ndX9dlbZdzgpXcEvtb/HZwlU/VHfnqwjA/2ChYcLKF8570=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy+aPIelqeV0YmyD6ccUF7av1dS8N4tA25qYhpyP87xPOy2MeP
	GNXAr2K+zvmeKhA9Cf3F+37ExDKe3THW79TKmTyApiWbMGqTKr+/P0swwCZAI6Ap1sM=
X-Gm-Gg: AYBFou14v0mcS7XERH/rJ4qOT1r05y4grvdMB4C4zo9/Qc37TBfZjaEqhfkG8JvMP26
	1nNaI3xp0yxDjb4B+sx6Pc3B1VWM3xgC7/rJGo84A6n9brLCaA3v7WDYgsKOcg8ja1HsI3Nf/v/
	T4xOHvPhqKPHq8bbBidJXFGnFhw51cZvrFtjvbn0WqmdmJwjff5NVBSSQythVYsguMd0C1WBKHE
	5dOSl7PDDjUdmw41sbokSRxYsZdpfydA5/euyuabDYc9NWUOLgdRKr5S2urAkTbH6YMa+9CuxOs
	cnJc6vUgfjYnMveBnPpJBkuQGSO7tjdDCXnt1LMoFWOp293JW6xpXdD62ibV6WY/aDG8Do44Xoy
	Fh3Ni4oLb3hwr4mUsPO3KaR5UmigwObwIpU6QUzvBxlqxB+ocgSmgH39aG4f8LzVFBRAoCdMWd9
	ZvXwlK/ZihnDMrJaRCuvTe9ww46lJfP3tJZySZcP2pZfcYmeWPPsr2q9JJSwBVOkbEnlvOGC7G1
	uqpMBvLlAKdcF9NqQtpjQ3IRsqrSP3u2CV98jR7JnWfdkgnSRaLymOYYByd6cNiPhAP40P/d2pH
	en3EeDUHh8vw6M5DhWI3YMFv3XXM7zGfYP2+zCAnZwRJUESN9QIP+8ejnZAJTTvHJSAgvb688Mc
	4l6EjIUK3Ozw4nP2EzwwO1QlQIH4DbjyUDKhLTpKqGgIpihgAuNvw0iMLo8B/Kt6Hb5VoaGrFXK
	EAsQCC51GWsXNypj2p2iz9WkZeew==
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr70600135e9.1.1793380759329;
        Fri, 30 Oct 2026 10:19:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm74252355e9.2.2026.10.30.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:19:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: dario.binacchi@amarulasolutions.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	coresight@lists.linaro.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
Date: Fri, 30 Oct 2026 18:19:09 +0100
Message-ID: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Hi Ulf,

on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
watchdog resets the board, right after:

  [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs

On a good boot the next message comes ~11 ms later.

About 1 boot out of 3 stalls or hangs. With cpuidle.off=1, or
with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
earlier in the boot sequence") reverted, 10 out of 10 boots are fine.

I haven't dug into it much. The stall seems to be in
pl330_driver_init(), so my guess is that it is related to the AMBA bus
reading the ID registers of the CoreSight ETMs while a CPU is already
in cpu_pd_wait, but I may well be wrong.

Any idea?

#regzbot introduced: 65705b18162b

Thanks,
Dario
