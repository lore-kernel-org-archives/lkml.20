Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977516;
	b=It4aw0YzbwL7BBegCVrBlJxTy9MhnCuQH4JGIqY4Bjro/WiG7PrTnmATDhNgrF9iUbXl
	 BFxuq9yR/tsEZjkHPcn2490tAO00r1tS/xzV2lnuhg5KNaKcEZoBfW2mYe8pCRWNtgf6s
	 DCtcHwqpQTbMe4kJDGRuX/O+rlkb022v+8fc4865dd+2vp99s6O22luy4lenN24Qae8xr
	 UXlDJeiy/y1oZzH3JJr8TW0r+ukj9suGEzFtE2U+HWwTsxQpVvhXNkd+h4iO5u6mKpUR5
	 sAYeN1zfHgyFBQHaTs+oqn4ft4LMvxn8Jy1IwKq7OdAVK1DeL6c3UPIaUxgYXyOB/Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=x4ebrvmdLU6EKPb4ZWVcguXHkQGxBYos3/0gbpsvT5k=;
	b=UDc5bRyMZwgRCmZkroNbs9pXmb+kf4AU9DOHad++QGGgcXgnPe1TTErhVFtZeud2hV9c
	 OSi/gbc3J6ZZ0nRXoIa+1YzH7oVBOJgW5sX3wsepZ9PvaKzyK2F8Qiik+EOjkk2EsIJpH
	 VGlSej8GICTekVFLeSPPyFQ5F65nTDPUPb77yDnbI0rTHL20csX+HaKBtttaWIImz8wv9
	 SQWeDx6+yXM2yHrxU+CIkzT/MalTgmHyQivim+xdqAz4ee+4XRYcIdCUjR79yz1XDZyQR
	 pMCKEm8Kdsz3zoowekP19iS3nrD61iPNSEN7EP6gK5ixB4Ig0FDp3pVILvE/0N1JmjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwgv8l4Y;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313D606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9313D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwgv8l4Y
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so808605e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977515; x=1794582315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4ebrvmdLU6EKPb4ZWVcguXHkQGxBYos3/0gbpsvT5k=;
        b=rwgv8l4YyYaxXg7OKRyBgrec81Wj2XRwnaT2rX8+mqtfax8O3c03Ic+U6aSBpJFY/y
         nEX6ZIKAh8Hy0TtrYwI42iVJNpvaZ2IIV5tUt4HtUnH+sT1wC7AQ0iNp3EAyp3Gmr8GP
         l8YnNTZXAS1lYleXsSzw1Y0s3hmfDNFcfEbZYItGu7ifEmssnowHZydjvWZX0E6QMr4r
         A5F0ujiGz5jePPpCxhU2Si9nuQnGXmtB6kcC8Yof08dPSbjmd3mykchA0YN71qFfuGmn
         PGihV1cs315CtZkT5pUcmSSGN6hc+qN7LbHV3x852jEyiFM9Tm5dBKKa5SgZmjcnFSTg
         VHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977515; x=1794582315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4ebrvmdLU6EKPb4ZWVcguXHkQGxBYos3/0gbpsvT5k=;
        b=CXRAbwQhiNHkSvBrnvk9dEtZ6fqH/wJzQSs4vmh58Bwkn1e0Rif5ghwQ4v79ykiLvN
         XqZkTmjqzATO6ZAvIqLz0MuW9VTwxXWGnjgh/rP5mh60xo/52HJZYe67TutkaPxaRriB
         zj1yES/1UxOXbNozUs8WcT/9x7oBGQKhraLcABW6BfvLpUVkowFwkRqtrOeQsp304pm5
         +3SXasR5MGSMK5LgkHfuxmu8zM/7947yu2dpQ7uNpVMg0sEyYBlG9CYyX1elz3OYeUFu
         vW+EfDi5KEWqtjcREOWuzE7mRIx5r9gS2gL5q1IGhrS+p240HT9cMiq1HVPd2LuBUUiO
         OKSA==
X-Forwarded-Encrypted: i=1; AKwUvBwYwXEp+EUgTnqOp3uVO44jMvd1Ic6j0xysQLVylrWGYE8sk6Ie5a0XkL7rhMRQ3CNltX6Z1pNWbyqhHzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I1IP1YnEpAN5VPd3whIqMaw5/F71+Roi52ckWfeSNKIFMbBLi
	KpzXLFFNKARgPDPYUtD6jXL+rFfLxeDZ6bTb/KDPrr2oIZHjliv0sXgn
X-Gm-Gg: AYBFou0P4hf3NpncGGBlKOz0TWj6SfLl0PuX3LB5WyTFnVMF0NB+JuIOzGgBQmCbDx3
	GEpIsx2eqr+JS8B83T4TYGihEUWhb5anC6xvg7tADNs1/ML4HctAXToPRAfRmgD4KdKkA6mR0Zy
	7Dm+88SRNvS/gkZd3Q6emY6zfBjVyGtACEYKSrcNgr5Fr4+Tl1O+Dpvs2oll8Y6qm8JcsoFutzE
	WMnwmSztoYS63kIEOFjQNfrwRd6IPbpWglDikwOUgAztxBfXcUY5cVRnvZ4uznaeq+4ogr1GZpZ
	Z98AJwDe2HQKP2EDPEtIyKdIUp/+us62LSKpoB70uRh5NCwHqd8FOTTl9ilcXPRkPsHD086BH+i
	93i2zoqiiWwAxxJTBEQO71x6Sl910SPAs6kOXooHhIyONlQB48k4SqUl+GY+XFDaRnav9b1ddVZ
	2B1+pY7fAZ6GTBfDvRNXr5RkXSwxW8L8gvEvpsLNv4aC/SjRtrNnIU1NMiCr6hIrBSc1xRxAaIo
	g70qoUW/ly8sIffaLfBD6GkSQ2AOqaAa3/Py73uPhU5sJJO2JaDA6bysJFiTmLWXbpBVyBt0ctv
	sgBRjXEZp4isWU+xWbetur9qM1KXss05luO4ITbiefm/7SyaG8XqNL7ldQtXcMXyYef8wGIa
X-Received: by 2002:a05:600c:c111:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4b6dcf861ebmr36412065e9.1.1793977514681;
        Fri, 06 Nov 2026 07:05:14 -0800 (PST)
Received: from localhost.localdomain ([193.255.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm260950305e9.2.2026.11.06.07.05.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 07:05:14 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	hmohsin@meta.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net 0/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Fri,  6 Nov 2026 18:05:07 +0300
Message-ID: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ring_reconfig.py assumes that a device which supports ring parameters
also supports the ethtool channel query. Drivers without a
get_channels op, such as e1000e, return -EOPNOTSUPP for it, and the
resulting NlError makes all three tests fail.

On a ThinkPad T480 with an I219-V (e1000e) "ethtool -g" works while
"ethtool -l" returns "Operation not supported", and running the test
functions through the in-tree YNL library against the device shows
the three failures.

Patch 1 skips channels() and lets ringparam() continue without the
optional channel reduction, patch 2 skips reconfig_tx_stall(). Only
EOPNOTSUPP is handled; any other error still fails. The patches are
split because the affected code came from two different commits.

Testing: there is no remote endpoint for the T480, so the full test
was not run. The test functions were run against the real device
under ksft_run with a stub environment and all ethtool set requests
blocked: before the series all three fail, after it two are skipped
and the channel helper returns after the query. They were also run
against an emulated ethtool family (unsupported channels, other
errors, devices with combined or separate rx/tx channels, failing
channel set and restore) to check that other errors still fail and
that behaviour with channel support is unchanged. pylint and ruff
report nothing new. Not tested: the full test with NETIF and a remote
endpoint, and the rest of ringparam() on e1000e (see the note in
patch 1 about ring size clamping).

I found this while looking for kernel tests I could validate on my
ThinkPad T480. I investigated and validated the issue on that
hardware, defined the scope of the fix, reviewed and refined the
implementation, and extended the regression tests used to validate
it.

This work was AI-assisted: OpenAI Codex helped with the initial
source analysis, and Claude Code drafted the implementation,
changelogs and test tooling. I take responsibility for the submitted
changes.

Bilal Yazıcıoğlu (2):
  selftests: drv-net: ring_reconfig: handle devices without channel
    config
  selftests: drv-net: ring_reconfig: skip tx stall test without channel
    config

 .../selftests/drivers/net/ring_reconfig.py    | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.56.0

