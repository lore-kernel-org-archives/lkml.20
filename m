Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305742;
	b=ugH7bZn8q1t4Qd4A/2MvllpbbKfJ12RnrjJgX88pThHbXXIjG+YnLiLi7X1EKUM7czWl
	 R4fOFUaqlQoOPl+qUVL5ojQQYTWi2Lj/JeRj15LnScZgtLbUelIlUtd4Tv7SiceXnJG0l
	 SuarDgWncQ+SjJgNx2DI3+dMAElVUFf7gBzpbJEcDw/b3Gbn32f/8fIpejnsC3STwrYkw
	 iEa3x7L57Zg4/YRGHHRkdTKOnIotqoesnzCdNZCliFM0peI9kv2N0hQeaAGBmRxK79P11
	 mSHW4TFin+A6NYBLEt0c+dLedhn5Lrw8Jl8zDVNwmrPebbcPwrP/Qjb5pEN4DfyAiJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lbbKXnXlDWrZBBtTs8TaCdwHJMgkhA2ffCtAIVgiVQM=;
	b=DlKTVgvGxc7Cfwm1dE/NxVrFyVt2Pjo0KM650LzKK/cMW8leWBwG4Zv8V/DRGQZoNYn+
	 j8/W8GiVUGs+eB9dJvolwnIob8RK/BVDVx7hFnQkKAJAQY7qdslQO0KzmbT01ReGxmdMP
	 a6whkG3QEZ/t0w4j552k4nWbapSbQXI4KG5aW6CT1Wn8PRaMF4CpKmdfdMN+02zlG5kVT
	 MGkDwrLczQ7Y/cfXV8k7fkY7oVxkOvrr/JTUezsgLqARAlv+qsKNe5224r+lM5GAgFXH7
	 TMU5oSsh6vdcTfwRKFvHfh1iu8okuKXlzw1eXM8+NTswLzwXVjVMKAZ57H10o0ql/Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=gubvwfoJ;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=gubvwfoJ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so115748eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793305741; x=1793910541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbbKXnXlDWrZBBtTs8TaCdwHJMgkhA2ffCtAIVgiVQM=;
        b=gubvwfoJzUtdrSOFTUNJUXP7E4eC7eJQgGbU5M6EsfkBIJLpz1VlkVUNWtwBE4ROND
         i+usOdYzOp55mv4JXW9H9fA1xwicnCRM38idhqMrab9pLkHRgE99Y8ajJWNZ2SQgSq8W
         8hjeUhu/tp1lXVGAHaJtFhT4lGRyNBHpC6KVU3XgM2HuhjwHeFPXo9bDDB4NMbFjQpCW
         N6oT0dItwg8dt9PurJ0h3s2sM8VDULNJKwhKYqlA1qNo+r8LlMJ7klMW3m0bpbhPyoiq
         tqhOXC/nW7rf0kWJ4rwH0tkCZr4ECPJ7lsTst9V78IhU7WqROo9YnJrbLjyRD52DPkjC
         hk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305741; x=1793910541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbbKXnXlDWrZBBtTs8TaCdwHJMgkhA2ffCtAIVgiVQM=;
        b=vC8VDCC6U+5y2zXyg5pJ5SWoyDDcAMtXhuz8LT05VQ+NTPAoIEA9w0ObXXVoL5kcxc
         aMJ5HuOZ9FayXv0HWa8qf849YKVQ57++PHbj5DC7J5SzE7c9rSYxqOykF3HrxPFXQIer
         GGvLkVv/OHx+krfP0vrYqB+UOJwRCq8jhKHrn/PvaR0EHsnguKwIfups38sHYqFVpfE+
         klxbhMf5xiubp8miov9u1euaVKWtMlP2k8s/5k8qE3IHGIRrmMDd8rIbFtig+iDUIvWI
         n2PjNxs7XBIkEOda0ZEOD4BZK1B+99U9r4beEckbfcu97+8hm0gVwY/syi2mHX/Q2Tbg
         EJ9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7+gzKTSC/dZT2F1sJueLEi64NgEuEtZ/VLKWjIkb95EDVKiyemenmc2Abg0NSQhWyK71BzdEFkEfKUFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqq0AH1flf9mQpZ6zwTWafs3dnQr8nulUIRi8wathX/MjpHBKx
	+sPmv0WjTd+yL8EXQoGnxwndqHvFcKKAU4kHSlZWkKztPkX9Nq+ZSmqbOK8C/+o+Fq4=
X-Gm-Gg: AYBFou2VhfpyAkPqGXbEKfdzVC1+Z5KRC1lpOBohjkgMRJm333x2+3yuIm02+NgJe8X
	uRlic302ku/p/9dtf6oHvn4N1tnWILCwOz5CctLm4WiZtoo26fV0TO4wVhzU8t6pL0yoI7iRFG7
	MAF1QSbO9e3Ol7tO7n0CS/2dHjt7Z0/y/8wzmdRFOxcmpTmJkl580C+zBoq6Mw2IcodXWo1wvz3
	VgaeiKRpl3uuxEPpnEuyI47ZLB04yaJggSBcuvcimsK3FvN79IPitUCWuwkESDXC6hB9MJCyzjJ
	Tx1+TwLq6ERiGGJvLkpOyhKINU1RYK53y290ip846haotsmqh4F2dga9TNJn9Fv5vwgNheuQAIy
	9uKpx/oMf9G64SYsHQFhwVBYHt6818kxT/gTH+97r4lS6An/oybbeUPjp7/rRWeGz3K+k8tRRH3
	tenGFKV5uCt/8tTj9Phuq1nYOZ/qp2nPUBDHHxGyRbZQIfXsQ9SZ3VBoeurd26/ROPTjn//YS0E
	IhofXZE90ag9Kh/l2/xksZUVYO4FRFXAqAAa+Ms55FWunxg3k2IZ/tcyDz9rZBkfhuBaB5siF/3
	JXYpkCKaiZbADJi9pFQPjNSh+NSkcLQCsMjL1XgqufffxghxQW/QMSZNFMeU+MwjWx/lyeM13uv
	T31tzrl5clYWWeEtOR7NAip7iDh/Rx0B0ACL8ihHxswsS2mI1z2YhvJjPCsOrT2GmOenZ8XI=
X-Received: by 2002:a05:693c:601c:b0:36a:270:ce76 with SMTP id 5a478bee46e88-36a424de9abmr612001eec.33.1793305716768;
        Thu, 29 Oct 2026 13:28:36 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm934519eec.7.2026.10.29.13.28.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 13:28:36 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH] Bluetooth: MGMT: Clear disabled connection parameters when loading none
Date: Thu, 29 Oct 2026 13:28:32 -0700
Message-ID: <20261029202832.35354-1-kevin@simpleble.org>
X-Mailer: git-send-email 2.54.0
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

Load Connection Parameters only clears the disabled connection
parameters when it loads more than one entry, so that loading a single
entry can update the parameters of one device without dropping the
others. Loading no entries does not clear them either, though, which is
what bluetoothd does when it starts without stored connection
parameters.

Pair Device adds disabled connection parameters for the device it pairs
with, so these now survive bluetoothd restarts, and new connections to
the device keep using the parameters they were created with instead of
the defaults set since, e.g. the connection interval from main.conf.

Clear the disabled connection parameters unless a single entry is
loaded, as was done for any number of entries before.

Fixes: 0ece498c27d8 ("Bluetooth: MGMT: Make MGMT_OP_LOAD_CONN_PARAM update existing connection")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Found with the BlueZ functional tests, which run one after another on
the same VMs: after test_bearer_le_pair, the next LE connection between
the two hosts kept the parameters the pairing had added.

Reproduced in test-runner: host0 pairs with host1, then bluetoothd is
restarted on host0 with MinConnectionInterval and MaxConnectionInterval
of 80 (100 ms) in main.conf and connects to host1 again. Without this
patch LE Extended Create Connection asks for 30 to 50 ms (3 of 3 runs),
with it for 100 ms (3 of 3). Without the earlier pairing it asks for
100 ms either way. The kernel testers pass as before. Only tested with
the emulator.

 net/bluetooth/mgmt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3cb4f9ece8..cf5256f4a8 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -8175,7 +8175,11 @@ static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
 
 	hci_dev_lock(hdev);
 
-	if (param_count > 1)
+	/* A single entry may be an update for one device, so keep the other
+	 * disabled parameters then, but clear them otherwise, including when
+	 * no entries are loaded.
+	 */
+	if (param_count != 1)
 		hci_conn_params_clear_disabled(hdev);
 
 	for (i = 0; i < param_count; i++) {

base-commit: 1081a6ef8f1e0661fd52eb3f878691b0b96cdff9
-- 
2.53.0

