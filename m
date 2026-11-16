Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865776;
	b=akLKgac1rJ3JEjjjcVx6F4udE9oU/IW6wl/WMWlrrXlYFBUTGBtkRE9Lqn39+jEPkuBN
	 UUSwpTx5AFdE4pJ2xQspKNXOWusk1uL1TAaV8byUR0NmH30teqa4P7AJU7tP6vUdWIJnb
	 0vPVtwtSMb3Ct/Wt6YZJvWuGaYEgYdXMzm4JQ7q5U5MYYuJ24+7XZJCMQnNDt33/xOqEC
	 hySjS01BC76EjY5SPx1BHcWsttOT2UYdl16UlXw3KOOqhJlQthqkctT8c+G76VUHg3/83
	 aKanrxLOjsAYswuB4IDIv2svzlqJ9MRguYMc6Ccx/50CjfMHHrL2KHz1DV0ub4oSMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uakBzQHpnruk0tRar0RXS2ZBRRSBv/kAwPvqULpDtWY=;
	b=X6/W9tRpyqmNeYmhwqg2ZKA/QggcFrAEQ6nW3ULFug8Cxs54nCdSqXNVpHyEKTK7RO1t
	 oJ0Ra++2hJrki9zD7G26UWuM4jYVLn/9KYasSoq6A889JKh1813GI1t0gjbOt0pQwCw0S
	 TvTcV8Pdo4dNYg54Ll0VQpbZEXLv1MB5MztN4rseS+uOdcgLQf0gl5c38tMN//n1W0tgF
	 jHYjz5d4TK5aBJf5nJOoUp3vx/3xEcHmdPF8/nqLbgxQ0vRzw8jGTAeGsR2uq520a2zih
	 IYJD8lZ/SZTUk11NOv+jSfcFzMlnFCei+MBtDiKQBcmrMeHSIduoxBQeiawFVm3aetg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+hjxuO7;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88295606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88295606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+hjxuO7
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so14623605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865775; x=1795470575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uakBzQHpnruk0tRar0RXS2ZBRRSBv/kAwPvqULpDtWY=;
        b=E+hjxuO7iKRJ3ueT3ZvIUPsmnnATLyhItSygXKlGMjYCVBAqIsaxwYyBS7WtFRNa2d
         FAyI4n8S0MnvngzX2NIilIZ6REX3+ej4wliGoq9olX7jUaOUFnuZ6NHbnreJikmMa+zC
         dfQheHijyPWjUdisMEUTyhIQIVkWbdVf71/CNoC7acdTDXKyrdqVSPdu3M7Caw81xUYq
         qiRaDxGxbjmmUVNcXVoZr+Rd8b5ut9GexxUR6Gsm+22VM+jEwktVh36jLU1BvMx0GFpS
         8Y+B19/v67a7W0WhIKz8UBqhq5DYijPx4bPUC+m/Gq1Hb3lYD9ewQ2XytPivwRA1VYzf
         CnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865775; x=1795470575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uakBzQHpnruk0tRar0RXS2ZBRRSBv/kAwPvqULpDtWY=;
        b=ZnM843++QW3g2WaR3wGOtdrIS24f+f5dqbyn7EwnHYW9TFWlGNTEywa+3+P5RfTxDF
         IH6bUpfdxvYH/H8ksOUWdT7Y3IiUHetYQCYcd9vqE32SzcedJyXDSljyoT4DTLR6Fo9n
         JvT7DHsbSmDgRYYLddpJdHdl69yZGtBvhNKgwivN1Qa9ucNorLGnTXROzUQ44iTV3R2q
         8WbxXCvlizid7dhSrYVXMtncdbA9FDQ7fkjzCe4z0F2+11JAQbDDGJ+6p3xxGBzoDxf8
         vHujTqfPbkvyX2QSuhIjRZgchCNJz2AFlLD35sVknTXnvrCwI5XmPgz++SCEx+Boa5ys
         K5sQ==
X-Forwarded-Encrypted: i=1; AL+hErExDAB7VUw+2vqVE0RKZshbncZ9oZUhMuhbSbEBtdHQAWcSEs27BmONrtgrsi9ym0K4jk2V4N5YeHtRuVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fHzW7jbO/pFzXrI4JYmJzV8np4TtUV/9uo0YiYUWOIIzND/rT
	ZJPo6iwD9ubqyOIGHlyELCmaY5myTsvNVe5naL6GG5yJ1bEDUjrwgszM
X-Gm-Gg: AYBFou3NpaMu+QyTeV0wMjm1CFbOPewiOJRiSVdH8SrkX1DI+GclFgc45KTAUtfMivo
	iKCmQ0WHT2kSU4/P6F16dspjVBz8CntuxuUXW1WvAJruLSTrml/wcqa3yhngU/yHJXJzkBECcYY
	p+7m+QRFOtxA/690lAqDEAmdsjy7t7PJakDGewPKWN85U3h1m+tG6rYGzMGHhVj91xKUo66RKNw
	W7WW8qMb3ncdVS2acWsBHM69x68axsuYpQCQlXPr1LCvnkj2AESBwcQQPiMuR/P6wyGcVMhZaxq
	ByDnJwuIGO6/S1XVsvjGE1fSUMk7gckiISF98JVp9Gjqyk4LHDZIlsHmWfRT/qj24I0uWW80E4U
	I6O1VXiaszfv0Fys9BRQXEGEHEbiPdlw0tGoon5utCBKSC6GcT0iZvSEV/I0KMjx1XL+VJuEbao
	TU+FM3WM2TDlHxTauveIcNrxxZ8JtNT+e6D6YAhsEPaO7ZUVXOfujQphDyL+IZilb+HltBYDlQr
	UgKFLxtPD9QRtTzYg+pspGKcBllhQo+pVvfstyS3EAjMlCcC1W/CUX5RqbfLJJcNtTzXg82CxS4
	6ouijgcqNgDdxM/PHaj712ZfzMiBOIZgWe8=
X-Received: by 2002:a05:600d:2:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb55a581e6mr192961515e9.5.1794865774974;
        Mon, 16 Nov 2026 13:49:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm30265735e9.3.2026.11.16.13.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:49:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v11 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Mon, 16 Nov 2026 22:49:33 +0100
Message-ID: <20261116214933.1569681-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <781999FE-B0CB-4D6E-8A1B-06A38082202F@linux.dev>
References: 
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

Hi Luka,

> Could the next step wait for a TBTT that can send the first download,
> including when the first work has missed its scheduled one?

Yes. In v12 each step reads the TSF after its download and queues the
next one 10 ms after the first TBTT at least 10 ms away, so every count,
the first too, has a TBTT. A step that would run less than 5 ms after
a TBTT or less than 10 ms before one waits until 10 ms after that TBTT.

With the first work held back by 90 to 100 ms and a count of 2, v11
switched without any CSA beacon in 10 of 12 tries. With v12 and the
first work held back by 95 ms, every count went out in 48 of 50
switches with counts 2 and 5 on an RTL8821CU, an RTL8822BU and an
RTL8822CE; in the other two one count is missing in the capture.

Thanks,
Mehmet
