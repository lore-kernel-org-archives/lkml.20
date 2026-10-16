Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFCD391E73
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116654; cv=none; b=Fp6VhTm3z6lGlmkGgluhY95/sZWEAHAVowxyEVrhgIVvopiMkrQJbbEWDvlyVcks/0IhwquMa05vhG/QbpnJ4KAj3bTBsjPP9Be05bYeNI8IEIia91EN/lg1h0N9PPbmyyDXivcb94gCMyFzkeSHrZ1EecuJ2qAVbJgwLSHk14o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116654; c=relaxed/simple;
	bh=Zc1KZBlT+3PtjTuluFVY7wJcEB53Glf0TXffmrReo4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AO0GSE4UANi6DS3nm7haMjYcnfve9AUpXeQvrbI3JaSiWXAxml2d9ACGaQAbJ83zDwMUUXizqZc2d6QYxarHd/4vOklyPhR/DRhRQ6qO8tIPYgyGUjhOlj1O0yuMCi2Y8v0QbbgSJpM0NkXMhNj+dIJilTA/tVkTKeic5phdHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=KMVjoYoe; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="KMVjoYoe"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2021421eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792116652; x=1792721452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zc1KZBlT+3PtjTuluFVY7wJcEB53Glf0TXffmrReo4A=;
        b=KMVjoYoeQyigM+VZH6XAcg5wqw8j9cioBMRrldBW5lGSfcFuIKXKuiZz5wte/dOngr
         b6WBk7jt32ibmKmqP2HUTh5zN9iI2uWYhSTj071OHXaL5YyGaropb5pjQlgb/tZgOMjC
         5BcNhIW/qFxUFhxkw4SnUU40ki6lxxqhEPH/iZhyQYQ8K0J7k4QkbX8/GjBHQWZnXFPP
         1h4ZBy4j7LfqRPQYv5McGmeBGM0clCh6GM3Wx3g+f7XO6vKaJoYHS5Vl/vwxKekHKlbp
         hy/+FCRTe3zmyqepvwn50W2L0EDOCRU4QDUP8/4Gs6plfbZ3+TxxhNsOBuOXWKudlz4w
         n97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116652; x=1792721452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zc1KZBlT+3PtjTuluFVY7wJcEB53Glf0TXffmrReo4A=;
        b=Id7xqTSz2kIq/iIpvnwMLVgJlBcT+n24nTk6uPKcpmptg9R04yX30UY+NLDDxbpurD
         UzyEFxgp2IusVwBrAmAYrNGvlnnfiEyRHAN2Q8Iw4w03ij1oE1U4Unkm2od/pbPY6r+o
         GFXuLzRVYcXSHOk9oTYWM/tLClI7XmTLao9QGOo5NBuE7uB5qyvR8XPFxvQxbVgdFuA9
         /pc5PDI8RvGYiCZxf7VcHR/KCA2oIoN0q2Wz8Iz5N+O3JFqSV16WtLWQitFa4JKvzcmg
         g4PMidkHZ0rO87AfTwafXdw++8VOrbVDom9pC7/+f7A3foyg4r2ouF9LXf6h6LvDZaJN
         f5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwo2ngfap/aSVtjkFPFeusAjg/QATq3LGCdezts48xUZdHlj0FRbOU/dTApMlkzo7C6/z+KFsqNaCkwvzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ11THEwyFkH7ND1V7kxb3C7LbWFlZbrVhBW4BEhIt+fGxOTom8
	nymxJsZTtnUn+QOTAJ1ksQjZuVdeZ5dAWDlXC6tHv9LcitKPDPY6AoFnppux6l0JVr4BqnxQZr1
	GZIqZOjZxxQ==
X-Gm-Gg: AYBFou33fWWLoq+RbaT3cXNrvqXJvfl6DMm86VNribHspFm+83X9Ro56dtMs0bnPAeW
	b6rwhMrvywcDOk2vkwqJrwmzx4GGc+RuSSRru9aJv1K5fpG5B7KDiaQ22VPWVGBs7xToDn9tAbT
	hZfuK1LX44zW4gCoCZAaYmhDZ21V30tKP5dk+mQmxiARMvvZf2MOgBjKpFxXo0m4E5tabMTCHcc
	p3C/lCuXG0Gf1e0l8s+Fq8MC6SLfjLHMWBTDUzma4X2TjdVBJidfvg1XPt6Ly1U5BZoHg4QWnQ+
	c7OW9XtySUUNILRXasvi/cJbo7s6Kg1z9H1a6i0NugJbBcW2lJKbqg2KMkFrRcEU3bJI4yb6lE9
	nZuk10gDx3WRwDpx+e/mZYVklUKXkHSs1JWCyqyw/woHZ7HO+bYMTMim47JnD54jOeJLUibHdBR
	YCa+jq7AjdFuNYm8RVO4Wex5nrrKLQ5qf5nzb4d26t5r6gEfl5L3AvZZT5N84Otq5cVlk+txUuP
	7HlWnF3l/agF7vXhuRvgfXI7xIWGKdpYN5oqEqBoacWa7ybzM1F2BLd+W/247SHzTIlmA==
X-Received: by 2002:a05:7301:103:b0:35d:f7f4:bc1c with SMTP id 5a478bee46e88-35df7f4bd83mr8817165eec.6.1792116652320;
        Thu, 15 Oct 2026 19:10:52 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d66:d0e8:dae3:3257])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm2638280eec.28.2026.10.15.19.10.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 19:10:51 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: halves@igalia.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com,
	luiz.von.dentz@intel.com,
	marcel@holtmann.org,
	ngocthang2710.1999@gmail.com
Subject: [PATCH 6.6.y 0/2] CVE-2026-63974, CVE-2026-98297: backport fix series
Date: Thu, 15 Oct 2026 22:10:45 -0400
Message-ID: <20261016021047.16461-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please consider this backport series for CVE-2026-63974, CVE-2026-98297 to
6.6.y.

Apply the patches in this order:
1. Bluetooth: hci_sync: Set HCI_CMD_DRAIN_WORKQUEUE during device close (fix)
2. Bluetooth: hci_core: Fix queuing tx_work after workqueue is drained (fix)

Patch 1 marks the workqueue as draining during device close and waits for
earlier RCU-protected producers before draining it.

Patch 2 makes ACL, SCO and ISO transmit scheduling check that drain flag
under RCU, preventing new tx_work from being queued during close. The code
changes in both patches are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

An LLM assisted with preparing these backports.

Thanks,
Artem Dinaburg
