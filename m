Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202883D75C9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510975; cv=none; b=KnZaRvZ3XGawyqygi4aClECsUvrIa2pwbYmaOiJcYotu/46No+H1s+Hj/b6wMQCEZqhIY9EmJOfm3HnPFhy/AC9eNzosw2mndtPznV1u0c6J33PMz49CjV/S+SWM9Rl4TP4uqutg15Xjpjy6kuVoRtju5ray5Sw0/auToRnn31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510975; c=relaxed/simple;
	bh=hjKzftqRcS7lKfEBUFkPA3Bvq+ulwKubitgmZDk0PuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fb6Cljjezu3Fs3ShmuLvs4+YNhIVdIDmicyS158rsxNwlJB9fJ0R1nLUchEMc/rWToxZybyen2PLrQM5tjGYNpVOqlpQsSDfZpQas+zsH0huZ1Lb2XXdcm1/XTtuSdOvIpSieTjcb1wxfLTyaHTjMRvH2Wk5LvudAtEH2XXXAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCnDyR5s; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCnDyR5s"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332a80a731so13142511cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510972; x=1791115772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3UVuefWq6yRGF0+Ezj/1QoTH1x0aEHJhyDUksavaAk=;
        b=qCnDyR5shkrpubwigserGOzICowcdf9JVWPORKrK4hVb/8XevrN1qSO9mbFw2Kb+D8
         dpuLbKORuO6ojiPaTaqIpY885kG9k+osDt+6OIqjLQaUuPc+XwB9p474Nr9mTVq0UYqK
         RVSud+GOCkQOeAmodYTuI+tBoi+zRsTdXdCHbz/sDvvMFVLgMQYsifVDUWVIrSt9t4yy
         tFgfuC+pd7hHVNANqPSfymbXXDQO4y0APYopaFwqFL+oZ3v/vAkBOvvyn2feA4A1RDHo
         LegbE0Mz9+3XV+RzvUE6Ez9RbaeH9rzDW8UoxJFT481av6RZRuhEO/qhZ4x801eZzqBc
         P1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510972; x=1791115772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3UVuefWq6yRGF0+Ezj/1QoTH1x0aEHJhyDUksavaAk=;
        b=Q36lUyhADgGYKF5/bCkEW8/vLK5CAVDCMR9cfv/koHCotlN1ODEWpxzFiErA/z/WuD
         O3u17xVwHPJjXtvOsBr6qN3oiMXDiI1xUNyCDCQqIdFjXEGrUB0Wf4vBpXffrcsTlyZX
         X6hS7Ra7u6fz38PyfwN9kPG+OSAob438irldb4ineZ1j7KMrIs4vgDqXHd/o6zjDl+b1
         l9j1ZItO0OvmpiYsKdAw0aD/HcRFYtvVoxKC4p9UfosME7iTmmnjuTNd67F6N+9onMpC
         PY/SMp8L697w825e1SzcCdm2704mcnMgjz+oWmcueyvWLg2gRaIknTLp6s0BckYWN5gA
         n3Zw==
X-Forwarded-Encrypted: i=1; AKwUvBy99gCoZcwHmyPet9swO/9KFbZw5RZoFmvKNz7wBQLQv12E0o/lecBgvBE1eM1cqG4TtGul9/BHq6NGw7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lmkuRKXTuS/6TrWc8JLtKNzdnp1HTwL7HuWvme2jzOot3qYz6R
	UiTx1Fbrwp3ef9M/2Ogf1kri/37bKOjwrWQJRop+XrmeKWd9MCH9LJF9
X-Gm-Gg: AYBFou1yLvo68WlQge1oMSJT/Beu7eHcjJcwt1KX2y00ndHloF8L/GewFFjWraRcuTN
	6jiV8jS+yZWJbmO6HGvzXwZhkRN1ROHZe3E9tliuGW+NMq6A2yDdB8FAIVBaS5lvXF243DZRrZK
	RiaCMOVKErxWhJo+u5IoUO3BedlX1Xo/IJOJQJ3jfoIveqoAJEx+4Ck+zFzYkuYGNbdrIuMv1rE
	FLBix5CekxuaG1ssF4/+GS471Oho+lxPQbwg4EfeXZnIDUAhtmverRLaIGQWL//8IQce0ixD+24
	W//uBcHYHtsTcUfSUfQSKwLACduJoecPKWUgCOY9AVS06CjGEzVI3VPmqu5mxWwV9SU/sOb3yeH
	TjTx3Cs+h0H0bz4QHShrgO0973nwdfj0LS5qc4Q2pIMsD/L2kSxBXjOed8TqzcgrY2HdLgEBDlL
	cVXjvd03x+4Np43g0ZKeadJBMRtNb43A7E/AfCaL+/c9dB/DIQe8WylCRUNdP7d3W62zYfkrg6H
	PmAl6MJBEVsWVbUnl+85fv+lwYhKbYNmO87n3TXgZmig8+u/iDTZ64=
X-Received: by 2002:a05:622a:1aa0:b0:532:9253:ee85 with SMTP id d75a77b69052e-5330dc3a9cbmr146615481cf.19.1790510971174;
        Sun, 27 Sep 2026 05:09:31 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533222585a1sm39538581cf.11.2026.09.27.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:09:30 -0700 (PDT)
From: Zac Lanzon <lanzonza@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zac Lanzon <lanzonza@gmail.com>
Subject: [PATCH 0/2] hwmon: (asus_rog_ryujin) Ryujin III pump control source
Date: Sun, 27 Sep 2026 08:09:25 -0400
Message-ID: <20260927120927.72810-1-lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RYUJIN III pump either runs at the duty set over USB or is handed
to its internal controller, which follows the PWM of the motherboard
header its 4-pin cable is plugged into. Byte 2 of the set cooler duty
command selects which. The driver sends 1 there with every duty write,
so a pwm2 write takes the pump away from its internal controller, and
after power-on a pwm1 write of the reported 40% leaves the pump at full
speed. Patch 1 fixes both. Patch 2 adds pwm1_enable to switch between
the two and to report which one is in control.

Patch 1 fixes a user-visible bug and applies to v7.3-rc4 as well as to
hwmon-next. On v7.3-rc4 the driver does not bind the base RYUJIN III
360, whose ID is only in hwmon-next, so there patch 1 changes behavior
for the EXTREME, EVA and WHITE EDITION, none of which I could test.
Edward Blair's analysis of the WHITE EDITION firmware shows the same
pump control source. Patch 2 is a new feature for hwmon-next.

Tested on a RYUJIN III 360, firmware AURJ2-S750-0108, with out-of-tree
builds of drivers/hwmon/asus_rog_ryujin.c on 7.0.0-34-generic:
hwmon-next 9edd5ab2656 as is, with patch 1, and with both patches. The
pump cable is on AIO_PUMP (nct6799 pwm7, set by hand for the tests); it
was on CPU_FAN at the time of the first comments in the linked issue.
Pump rpm at header 50% / 80%, then the reported source:

                                  before       patch 1      patches 1-2
a  on header, pwm2 = 40%          1710/1710 1  2100/3060 0  2145/3090 0
b  on header, pwm1 = 40%          1725/1740 1  1740/1740 1  1740/1740 1
c  pwm1 = 60%, then 40%           2460, 1740   2460, 1740   2475, 1740
d  then pwm2 = 40%                1740/1740 1  1740/1740 1  1740/1740 1
e1 reload with the pump on USB    1740/1740 1  1740/1740 1  1740/1740 1
   then pwm2, pwm1 = 40%          1740, 1740   1755, 1740   1740, 1755
e2 reload with the pump on header 2160/3090 0  2160/3090 0  2160/3105 0
   then pwm2 = 40%                1740/1740 1  2130/3090 0  2130/3090 0
   then pwm1 = 60%                2475 1       2460 1       2475 1
f  pwm1_enable = 2                                          2130/3090 0
   pwm1_enable = 1                                          1740/1740 1
   pwm1_enable = 0, 3                                       -EINVAL

"On header" is the state after EC 1A 00 28 1E, which leaves the pump on
its internal controller. The internal fan followed pwm2 in every column
(40%: 1545 to 1590 rpm).

Written back to back, 2 runs each, final state:

  pwm1 = 60%, pwm2 = 40% (patch 1)    source 1, pump 60%, fan 40%
  pwm1 = 40%, pwm1 = 60% (patch 1)    source 1, pump 60%
  pwm1_enable = 2, pwm1 = 60%         source 1, pump 60%
  pwm1_enable = 1, 2, 1               source 1
  pwm1 = 60%, pwm1_enable = 2         source 0

The failure in the linked issue needs the power-on state, which a USB
reset does not bring back, so it was measured from power-on (PSU
switched off), once per column, with the header at 100%. Source,
byte 9 of the status report (the duty the pump runs at) and pump rpm:

                           before         patch 1        patches 1-2
  no write yet             0  100  3570   0  100  3570   0  100  3570
  pwm2 = 40%               1  100  3570   0  100  3570   0  100  3570
  pwm1 = 40% (reported)    1  100  3570   1   40  1710   1   40  1710
  pwm1 = 60%               1   60  2430
  pwm1 = 40%               1   40  1725
  pwm1_enable = 2                                        0  100  3585

The two writes that patch 1 sends for a pwm1 write of the reported duty
reached the requested duty in all 19 trials, 9 with raw commands and 10
through the driver.

The commit in the Fixes: tag, cd258aca0dc4, first appeared in v7.3-rc1.

Zac Lanzon (2):
  hwmon: (asus_rog_ryujin) Fix pump control source on the Ryujin III
  hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump

 Documentation/hwmon/asus_rog_ryujin.rst |  10 ++
 drivers/hwmon/asus_rog_ryujin.c         | 164 +++++++++++++++++++++++-
 2 files changed, 171 insertions(+), 3 deletions(-)


base-commit: 9edd5ab2656f040d726b5388f49ceac10bb2944f
-- 
2.53.0

