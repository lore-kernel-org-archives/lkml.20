Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660558;
	b=N6QRf0kjSa79k1v9eqYtiV/MdAnWotQTAYkwLC1tEyI3uCfkmzyG4p05wPCgf6xXwSgH
	 DpnEZ6NCdR2fUNjnfWqwxbIDidKPUoxoxcNJTDaBhj279kkmH4WSAt6dlcqaWBhOsBZw2
	 OLyCYXDzWyhbyeO8jZHaDPolJG2i0UxYxlScTVRtC0n3lN40IKvh2+qwLSM86a03Ci+qi
	 aXwt5C/Z98rjYiw7p7PGzSmtilSZQwCI0XsfAy1PPcjtzZACpgOubV+T6KKNPTwTiOqT5
	 44jxtNjiqf/hm3K/UGbc3C3WFRF2Xck3bOlkgml0ZvlgQUvBWMBmhx+7yYbpGmRGDBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0DnBewpAT9Tp8HPHEGwu8TFrPEm2oKGIa0lEEldW23A=;
	b=AbqbAp+jQpJF8iTVmn1c8HC7wUJpLb+EiZN7gYQc6cnb1LmKRuBrHJLIWl+gfUp/zud1
	 grWeDXVwz8s0xFHdDWmKlCCob8mGKsQAg0DkAJumzqz7RA8G4fY97t4MIfY840GHpSQdy
	 JpOgpgXw5RsdkBe7+cscgLsnVSoCKU2k66LmsrTOz9pyyfNqeHjucnGVoj6WDjBIq9EfI
	 QYJoBpvdNaxmCPi30v9iQD5XHG/fxsrp2YFfiqi+gGg23Zv0JRjBkloolLzCQa+LWy4+M
	 6dRZB/6R4ezI81ODURrZjLE/h8K7u2bBGYDkDII7XkBIg+jmlKqtBZvrE/t8w6TD6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f2R6lhfN;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB62606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB62606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f2R6lhfN
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2801560eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660557; x=1793265357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DnBewpAT9Tp8HPHEGwu8TFrPEm2oKGIa0lEEldW23A=;
        b=f2R6lhfNbpSMOlA4eijeSjxfPGs/IagN2sLt+URzwd0T2IAl6CIabS/oH7qRCwZiYa
         SN2ahkwMHKFUjeq1wi3WLd2M4Ah6FfG9xJ30JKIgPskN+JeXIHwI5p1/p+2zp+O+AGIi
         t7agmkDWnSH/YBgg6vYyr4V91iDmWNC49HMhmPSGQUCAyvRDuBnDuxMyj5S8gWpxAuUu
         Kp9fn/5PUeWBvSxd/CwsTRHtdn/9hlZa6qy6L7aTERr68+MyZR+i5fUA66eH2rWQNMAP
         2QdrpXVOTN6uE40v5L7oCMu0R8M0/UWEXTL8dfyBS9bXU1x3MsEdUnm5MrWYuBMKCzME
         VEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660557; x=1793265357;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0DnBewpAT9Tp8HPHEGwu8TFrPEm2oKGIa0lEEldW23A=;
        b=Ji/05pxRlLWWGNax4fUxr5PJ/V09LWm2K3tdNkis99w3h+mFbYqBa98Np2ghZbhG3p
         gSOdkP7sJbKHQtY3S8SrBFhQI8DyMD1lWt8i/44LFNG/vrFhM8FXkNkqB9M9+JPvvvG5
         aXXaQ+p4uuM6kOlWzTBuHmF2+7Q2Vlv2djsWKqtqsSl+HXcH7k/b6iaetetu9JJ5NF1z
         jtR1VwyCOmNaj9T6AuT4SlXcQcfFJt9U4hwPAPBYySN+qOvoSYJEavuXh/CN5a3BCD5F
         hJdyRG5yivggUqJEJsd0EdC2duQMbVUwXEBLpH9Go+DmwMJwTIhNvrn37z/CfpVAQnTd
         ON9w==
X-Forwarded-Encrypted: i=1; AKwUvBy4RJXyJczcG1pdJYas1/fEHFfO0U5wIGl0haXXX3s/WbRjcjaXIhZQxfV//ajPrzSTo8AxNIt5h6OZ4bQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDMOlg5gogHzQqkiPuZIvRxKGsvLuaprfRwNPSs/Wxw3IYBcTl
	vlyVyHe1xYwO9RdZHN5IWwxQW1Xygf0ZM4fggWjQAy7yMCNo3rCZ/fsE
X-Gm-Gg: AYBFou3+WUSQwrkyzkdYFegzvCJOUR0pGfoQm8a7XFTHVUfLLQ6dDBfySWaw0VRHeOB
	k5he8mFscLL2215E9b43xMEFzSRfjR7OJPwsPhMOOK2z4YeLr1l4En5VccyGliuDYJUQkVnbxhX
	+CUxjHlGQJDouHa+U1+HmxFjzo1OEFd4BLs1Sq9DqQ/JSQmmp0hl80l6yP8c0VqwUNJYBTeeH21
	zxJ8CtBwlq/vKiO1vJHH38q/8Jscp5Bbby8ZjTjAB+birsDPUjjRX+ECrc5/isxdKYFN/m/UbmI
	mMhDBw0W3k1oolF/ocaAnCsBjEA4BznkQlvz9HXsWGsDG3p1TdP5WRAfzSUj8hfL8u+C7V07Vz1
	1eKoEvpU5n+S+JhKzQ7QJKJ7E533RZ+BSR1/UqBo7BSQ+c37vLPmPboPhocWKTme/dF56Yf04jD
	8yG5sN4iOoL9DEaZWkwck5E8HxahiJ0MoOsCjsAamGiw1/YdnRCUQlUtcETm6PSHePXrFsJQz1h
	Z4Q//N6QzjfDF+2JJVgngNpgfVARqCUYsVGnG2HH5w2+Ohqo2YhyMTNRS89G3zVSzqDYCzFzEhD
	kWeFmvdDYolFhQeMsKY=
X-Received: by 2002:a05:7301:dd90:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-3674e64b5b0mr6323161eec.40.1792660556817;
        Thu, 22 Oct 2026 02:15:56 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm22187442eec.18.2026.10.22.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:15:56 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: CFM period conversion overflows 32 bits
Date: Thu, 22 Oct 2026 02:15:50 -0700
Message-Id: <20261022091550.3651455-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

The unrestricted IFLA_BRIDGE_CFM_CC_CCM_TX_PERIOD u32 is multiplied by
1000000 in 32-bit arithmetic before conversion to jiffies.  The same
expression is used for start, update and keep-alive.

On a HZ=100 build this produces:

  requested 4295 s      -> about 40 ms
  requested 2^26 s      -> zero
  requested 54369991 s  -> effectively non-expiring saturation

The netlink request succeeds, and RTM_GETLINK reports the requested
period rather than the encoded duration.  CCM transmission can therefore
stop after one frame, stop before emitting any frame, or continue far
longer than requested.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, CONFIG_HZ=100:

  period 10:       3 frames, active for the control interval
  period 4295:     1 frame, cleared after 1115 ms
  period 2^26:     0 frames, cleared after 1 ms
  period 54369991: 4 frames, still active after 3507 ms

All four requests returned success.

The conversion needs a 64-bit intermediate or an explicit bounded
duration check before storing the CCM end time.

An October 2026 iproute2 CFM discussion notes that the CCM-TX period
overflows above 4294 seconds, but I found no corresponding kernel patch
or CVE.  Candidate BR-009 is a separate queue/save synchronization race
in the same state fields.

The reproducer and full logs are available on request.

This was found with a multi-agent workflow; the
overflow signatures were reproduced in QEMU.

Thanks,
Cheng Yongkang
