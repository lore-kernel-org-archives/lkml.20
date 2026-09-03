Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4124F30F2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454888; cv=none; b=YPY0DZNHGsOMZDk4wt9fTilepS9rzDk51zQ36IFUKnxHVUJ6ve/JXef8j//tUFNfhSG7NGRNtHp4l1GfKgLa/YsjsCbgyMTYeatAWp3Qz9qJ0xKKf0TRnYfiTxzzp6jVX/xcF++VIRijpdnVfv/rcwOg/4Fs+Ton9nhB34hNf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454888; c=relaxed/simple;
	bh=DhCTBzAWGDuErPSvJnjHoe5k8jujtyeOnFEkUsgm4Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZRRHwoTTSdalITETJBrckz75VqntlQmlxk9hoGGoDPRmHXZKdsKlCzaQEdDJs72nbvp852oZODhDXMyyd4mR/S++Jnc20oXKJevJ7tiLQ3gXfC9YTpt15OFpicBU2uA++8m9ariSXLytFH8E+9ds9CCeZP7ALiO80j9SpNYLTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SG74WZbs; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG74WZbs"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b5e907853eso2419346e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788454884; x=1789059684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GdLS3ZMAOjcQFaggDuMgi40AN8VIQsyCSfnUrDhZ0Pw=;
        b=SG74WZbsISHNDn5MtAIftB25XyL7l6c65qqd0QYD0tjDnpNnPwyX0eAabTc9qiHknZ
         LzFze3ILYCbC9bwfeLSVKDr5U2eyxH4fzPB9dSb24eDjQDFkjg/RdUU7k2XCrcwH9Ijt
         QDeKAKaSasoz208cqHKWeHPjoBbZPnaDm2yJuavFzjNMZFsGORfGWNNVOGTSrqFwN9bD
         NxvBE7kk9hmUCN9utG5QxfxyBIE2o5l7gztQ0jsTabliuj8aGj6Y97M3oSF8Yv4FF2yA
         lkgL2Ue9YH4AGVVZucmZmEOnzZAapf2Ri7PE5zZR4sYFhkmhlB3nFJYHcg1owtuUZ8/h
         UiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454884; x=1789059684;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdLS3ZMAOjcQFaggDuMgi40AN8VIQsyCSfnUrDhZ0Pw=;
        b=ab+at/z3ojX1WXbPGsTtmWe1GLACfngoT6UTDsID62eF8qmusv2nzOEaDWZCPGpsdb
         iWjsxll3zTsWHWbmc2UFEU2DnWB3kHddD6k1MSQATVI1HDsXdXmKNk27udRqOdovjhSP
         z3rMw9t+O0/U1bGRhJzG2XfLWxdwh/VMGufmxGz844xeLfAhMBD8XuhoLXiET1XKEuKp
         2c5Gywd59Gpu1N5gL0yAonBg2TG4hAMYzcull1JgFr+i06umfZIrcsMxBrCNKRbMh+Ml
         59Vo3fLiEcV58Ya3MoloYJHMUYYK3zLenZAe94FrgxV5yEaS7+t/ZeBv3h+2pM2hjRwh
         Fdsw==
X-Gm-Message-State: AFuF++nIQN9NAvKKUptpujFpAmoMc9O8FysNhwvLY83hCqWZ6zjOG3p4
	1i7Fb5A55GD37/RpJli8R2RsKmvuwQS69QgyB/s9iSXM/hOXmih2YWU=
X-Gm-Gg: AYBFou06nBKfLKTi7zDBTFHdXpVhbScETkB5vyNH0Y44+Uw1TjQnF2Vu0GaNsfnxTPZ
	zUUKvM+pROfnS5wUjONqxbFkiu5JbwHZN0mkkYwuIHkaRcdsPNJLDCvkwl1g1MedcsNLVTurlG1
	ZEgCJY6oLFLrrl8wy7fp4p7V3cphGGH0hVOF966CVciBvo5zO5Kaf/6cPZgNYqaxKeTvLtB36ya
	j+VSiWdQAzDyk89SAfr9TdLjgGEfLE47PFniotAAG8B2inFtW5WqoHQjbZQqbU8zfb/zi4nbqZf
	eHGHqIcYy9bR9x4XGOAtxCNOIRRf4CQRtHr1ZVntXTXJPTjuHsHB7Ff8m6E4sroGKqImSSxvgoQ
	8H7Ag2qd3lrMN8cPq7VaCvVMZ0f4Ddb0+XhZoMFjkGa9ZUj3FGnV2W14irUoBu1JtSHBZK7n7X3
	PwllROFt0fmg1YaoYjwECnFObKMdwWRv6QnqE1TDb/OQH31mcX5z576RvAMHli09BiFvsWxam7r
	gMYDC236EQaySuBPJDbax8HicFPFxM1HVeAOOVoVuiDMKuZCA0w+8VlDpQTzGr9/3mQ+chRG8Ky
	60Zb
X-Received: by 2002:a05:6512:1252:b0:5b5:f946:513c with SMTP id 2adb3069b0e04-5b61557a64amr556954e87.17.1788454884161;
        Thu, 03 Sep 2026 10:01:24 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669b215sm5563e87.11.2026.09.03.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:01:22 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: ath9k_htc: cope with lost WMI reads
Date: Thu,  3 Sep 2026 20:00:48 +0300
Message-ID: <20260903170050.1089917-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the USB devices every register read is a WMI round trip that can
time out, and ath9k_regread() reports a timeout as -1, indistinguishable
from an all-ones register. Two patches already on the list deal with
the reads that did the most damage: the spectral trigger no longer reads
the filter back, and a timed-out multi-read reports all ones like a
single read does. These two finish the job on the receive side.

Patch 1 stops ath9k_htc_calcrxfilter() reading AR_RX_FILTER back to
find out whether a spectral scan set the PHY error bits. The driver
knows that already, so it sets them from spec_priv, one round trip less
per filter recalculation, and a timed-out read can no longer switch PHY
error forwarding on by itself.

Patch 2 adds the two counters that were missing while all of this was
being tracked down on a stock kernel: WMI commands sent and timed out,
in a new debugfs file, and frames the receive path discards for their
length, in the LENGTH-ERR line that recv already prints for ath9k.


Nerijus Bendžiūnas (2):
  wifi: ath9k_htc: derive the PHY error filter bits from software state
  wifi: ath9k_htc: count WMI timeouts and length-discarded frames

 drivers/net/wireless/ath/ath9k/htc.h          |  2 ++
 .../net/wireless/ath/ath9k/htc_drv_debug.c    | 25 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 15 +++++------
 drivers/net/wireless/ath/ath9k/wmi.c          |  2 ++
 drivers/net/wireless/ath/ath9k/wmi.h          |  2 ++
 5 files changed, 39 insertions(+), 7 deletions(-)


base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0

