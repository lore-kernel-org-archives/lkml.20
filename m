Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12341836C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106524; cv=none; b=tNwTYsXPDuEiH+GcRmCtYkgPc4uPuzXPax0hvDilMiiSdbmzNFRYABTgpJRa4hziosk6wXwQlUow86LlH+lHwhrP/r3HhjyjyLWzQyFExZYzO9giM5aNxSPuCQWYzWswH1gLmSvGtPmyjWWOHexDKPNLuSJNonZRX8UTzgqRFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106524; c=relaxed/simple;
	bh=NxVeEh6zn8foBFrmhLMkMkalU3Ytt/AEGEN+gLGqrTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axBIJxkRG4TiggLBUjQulrunxcn5FEV098pKRKGngp/MGz3hoiRMVAerEdaPIZqKgWPxq6Um0U3BZc1BIEuDwPcIfbR9i1X5luR+3lQtwrHiMzK7dJt/ARPnF5Phx/NmeZtB5XnsR8Q/g96s6/UpTx1cTuAhGUSG/MV+NcIg6A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV/U5sZv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV/U5sZv"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a782e791daso511478a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106505; x=1791711305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieoCN8zHQyjpKwxBxBu39ADqPAcaD3Ug1famBdxjyE0=;
        b=XV/U5sZvWxpCz1+kuXxNQ76bvIMv1Hc5+hMiRFe5kHT7OV67UNKbWO0ZPh/n/fmiYT
         FdgAtMLWmT+YkBhqc8X+1WSjLUY4NRZgankMG0f0nHCwRIVbvLZsser62x0eWYdJjr16
         d1Exr/QrBKyDd/bHIGnWfciaPQzUWuM2Zf4UynRjj8qOW4nrVJImsTAF3RdVwR30Tm3q
         KKsM49rml3N74IAcbDQUnJjKQM1GGgxu2H28kS9ywUpEtVra/lJYKq+s/kJ9A73b2LPV
         IafXVBwdRGMsZCukCAU4S51aWQjk/pOQ1SgpUAtmxw0t8R/vgoO6cLnGMelbspQRaUva
         0SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106505; x=1791711305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieoCN8zHQyjpKwxBxBu39ADqPAcaD3Ug1famBdxjyE0=;
        b=DSrOyEq4fCGKgZcyjMKRVHywe2hmRFmDB9eNnKaQTVjf1oW3Iqj9X8caZiJECmIRvh
         HA+yRSCehrsrq5m25iKx8Q9hwsZ/eKOgD87Ddu9cZdNsqFhWm77Y1BbmMxEUuFfGpwHr
         wqKtYebrWP5FCI5hkN7MNc4HI94RsA9vjkb5HS9LpajZdQpSvcy8/iwQRw30t46b6PA0
         GZ3bymj3zEiOvQ8ViCSyFkhxbrvWPfnNaCRWrmHH8HTiffLIlUJyWy4lTzU8w8UA4EhA
         3rawDhQd6+Go0BvXUGqj9wQFvNCVj1qqng8jT1UF8NVW5O8UJRphUxiIiAvWG/pqP57P
         c8zA==
X-Forwarded-Encrypted: i=1; AKwUvBy2m8kjUuxn1TO/5kQ0DbI9C5EPBO8CkO5uypoehML47xaPFp+D+Aqnsxie4UU86qi5tWfKEEdGS5Vo2PE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN2KpIby19vwT4t6+xEhY73tiJ18e76MRE3dg5O97u+L6l0os0
	bca8fASs5axdRqLoTobNuK8ibjJI7zIqNHhqlYwT3RQ5FoQqTWxvLCv+
X-Gm-Gg: AYBFou2JPshCYOxcpW+sm4l45ZXymaiksuvJaQzdkCipxdBWJyRRzESO3NFx/ANsbCr
	VDVRl0ZJicCslbYKPnlkTnhcX4n7bxqkSk9Pd5D6YRGRQ6Ttj0nvQ66aXyrh8iY2ZNp1wOYoms7
	xTki2wUedeS6pR5jGL+MPMmefrZxPel8cPXAX/MHYce0nGXIaEe3dymmiPmBQyjO4EoinJIaeuo
	Bi63J5lGqBXXJ8GV3VJfYM58gE34+Q8eiqvlhHaBQEgT/wfO+Ejm1gV2gDjFbNjVQOyiJru05TA
	E7ZTz8ARKLZ3vpqTbpE1z4ZXbJuhDfOfHH8u+Kp7q9xXAPDQSkaAhqIlUw77C7FaO20FoUj8SkP
	rt9lDSlh7+Z+FdRZ6ZqgjmAtkPnRyOdDxMU9E8gwm7wZfifoBAPe3dr6lzLxy1mZrL/1OYjZeXY
	og/p3TZwZbvS21Yn5ifBl7ipCJmARMkKTgVs28uD8xmyxhxFIFn0mAmFHwwKJeDhp+Py/FOUF6C
	AGj5C7eRkDt4g==
X-Received: by 2002:a17:90b:544b:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a7873db380mr3330070a91.34.1791106505312;
        Sun, 04 Oct 2026 02:35:05 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7383535sm2682884a12.20.2026.10.04.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:35:04 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for Kaanapali
Date: Sun,  4 Oct 2026 18:35:01 +0900
Message-ID: <20261004093501.74290-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 05:27:47PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) has an additional INT2 GDSC

(Nit: Kaanapali is SM8850.)

Tested on a Lenovo Legion Tab Y700 Gen 5 (SM8850), v7.3-rc4, bonded DSI
panel with DSC plus DP over USB-C:

 - without the series the INT2 GDSC stays off with no consumer; with it
   the DPU holds it on while the display is on
 - DPMS off turns INT2 and CORE off, DPMS on brings them back; s2idle
   works
 - with a DP monitor attached the cursor plane lands on DMA5 (sspp_13)
   and scans out fine; VIG2/VIG3 were not exercised

Tested-by: Joonhoe Kim <26rote@gmail.com>
