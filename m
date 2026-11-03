Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681234;
	b=FL3IB1G1CTZljkhg5Rmmszv9wo14sYiteaHA1ONnL83tdF7B/pN1ZXkru6fNDnnNR8cb
	 g55TIen+8ykbRfQteetNfXhnuymxVzVwoDf7wAheBFzPmv0qpi0gm2xVOraDdvc+A0Lxt
	 yH+odia/xQC6VWlHf9tuHw/zD1eseJ3D7hSoR7MrAttd9BPEjQ59j4/PDdwNM/kkgwF2T
	 3IjJLiZSZ8UdXo8Bl4MglH+cVI8dMGZkrsdAzCjVHu3FPtVPzk9zDEXNuywUcJX07+2NF
	 ntS0FSrp9byvZZFzmugRAki8sxP9f+1AAjndwjjx1M0A33MP6+mi9ZoC9ozH7iatTog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
	b=YLjVAuy7MMmXyWKzPH7Dvn6aEqf+qz3qBweUDpVt3HZwvBDrIrqWOyiCbHbLlVd76zhk
	 7rLxpss83Xn7oW3uceeK2ElriqizYTTGmqoa1/Fi9zK2Wlum9YUsbSrcUIJHavSj5VcJa
	 Qnj4OdOoiy5xiwC86KbvauYKyym7u55gHjLYhpRKPc5hYnq+aohmdsoyko2ZOiV3WZLed
	 A9izNS0wxyMA+DPXWlK6H/db+sRI4LF6COfkL4AppTqNCF0kk/0cB6hXiAl9gbqRQcy8E
	 YOhhp7XorLlsWnVIsAAfOGNgwzpA72EG86ZywjxguoU7ad1CllUQUAF6N/LB1Q21r3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWKNb4zQ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315B606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3315B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWKNb4zQ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5334968eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681233; x=1794286033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
        b=uWKNb4zQkfQnVtQVQO3HN7YYB7/LcN7F+L5w+WX7HUn2IG/VU4h3eOA6FtdooO6iFJ
         YFHyUO0MTH+CaGkUnJScBTg7eWwCWr/rWbiL1TFdpK+dwksmNFE7D6m1+W17e3EjSwKi
         /b6iNt8tCpFlEWxrlo/TZ+JAj85Q46opq3z3Y/D90ves7yISmd/InusNQqaEnD+WOJ5i
         MDjtYO+RnolVs6INGc/fAW+dV+LfrmfZwvrTCT48jgowjir6FLBexDGq5Q540ImRBRSa
         koLAZdeTEuiSd3Mae6Tt6dAkVrsm+yq1cCtwi+p9lhVOczHcB3lZ1LEUG+X27Q6l65Ar
         7Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681233; x=1794286033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
        b=Sl3kAfNi01xkf9fczOCnTtdMlS/432mEbHRZan/TDF8vWfct5zvEKPGTMioYE56/ZQ
         jCRVuJtHxavv6m6g2g2jc8hLHU2w+sqLi7FIgdqgZAA6maaGEqHtsGUStB1DAbL9U9DP
         oAn8ZpAB/63ALKbcacNHUto+9Oi7va7+kL9BaDQBX5P5sG8iXzkcUNeoSvXUsnDcXSMr
         X5WlkFn6b+3Yt26opX32MqFiGkjUWP7bRDzhIKL6g/f2Wy9uURtqkH31eciDD60ev6CQ
         PqhhwM+dWj9PFDfQee/D/Wu0h0idhrvKUSsvB8b9ZUy5bNsqclwoT9BVMbagemBqcR8K
         Sr7g==
X-Forwarded-Encrypted: i=1; AKwUvBySdfrG0os58qHAEMKJaMuUc9gbNq8r5hoFplmzA0umQyQ49aF6t2ANOP5gG3HQsWd2taljgp9xqtMpEPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ75UlSJLmPU9e5dH9H0HwlcHWbD5qlhpZ+zFB/lQL75DiNaD/l
	UNY3uqYvKqcTejGUv/4Nn42a8OW+XNoQEkZQf+1njMV9na5Oo5dCKuvd
X-Gm-Gg: AYBFou3JvtGMzCshL9ihE/XxGmKvzXmvae2cpwtzw9McfxN+5FHmLE15FcAZMTdyvzc
	3umGFwLDLHwwK8zVcE8Apw0qkCIpZlxk7+RodVjzd4YwHhJFZsXx03NGf8MFhWM59IPdfwhH3nx
	KYP0RVD/4gpIZNlZlPBnYDT5A5NaN/iPMsxrOK8omia24JhEZwzV0LoM9GP+MRmS/S+hb05gNL4
	jRheF5pyOrjUemJsC4efMFC2jOmWxuja2x7tIOt+APSzK9GkFLcBOSKxzO1l2Oudn1zOTdXm3MW
	TaXwqLuFZ85s2XA6wdQ15Trr/wBDPglWct12gkomWNfWGo6ez3UQwRtKNK6tNFK/hc7Bqq5Ow4F
	iN0pNsq2h5DPgY4r83iAZ5qs+BKxeLQiYZ2wGM+H+OOmZvbG2lykL8s3WiFpttHJbpkXFUP1OGa
	Btgaxw0UqsExPF4KwKkcaBA8/1zblUfngGMaGFhyu5O8b9ErkBLV8Rw4lsHZ1fvFCFBRlla/cvg
	XiFtBqXDHd7mL3U43I/RAmAAtUkuaeM//rQm7EfqAXkufKvKpoYYHxsADbzbfMbWpNNqzjjtWeu
	X3vITj6jf83mbHamxtknjagYpbI6cejOyCV54wx1SRcy9dyTRwxJmOPkPiGkImIzCX596q71fpv
	lAQKr0vkLvZ2iO+To+pJtX4l+KXrR8TfEAFXl0w==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr17331914eec.10.1793681233040;
        Mon, 02 Nov 2026 20:47:13 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm properties
Date: Mon,  2 Nov 2026 20:47:03 -0800
Message-ID: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

The common touchscreen device tree binding documents touchscreen-x-mm
and touchscreen-y-mm to specify the physical dimensions of the touch
surface, which userspace uses via axis resolution (units/mm) for gesture
scaling and palm rejection. However, touchscreen_parse_properties() has
not been parsing these properties.

This series teaches touchscreen_parse_properties() to read
touchscreen-x-mm and touchscreen-y-mm and calculate the corresponding X
and Y axis resolutions from the configured axis ranges, accompanied by
KUnit tests.

It also updates wacom_w9000 to drop its manual parsing of these
properties, and adjusts goodix-berlin and apple_z2 to set their fallback
resolutions before calling touchscreen_parse_properties() so firmware-
provided dimensions can override the defaults instead of being
clobbered.

Dmitry Torokhov (4):
  Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm
  Input: wacom_w9000 - rely on touchscreen_parse_properties() for
    resolution
  Input: goodix-berlin - set default resolution before parsing
    properties
  Input: apple_z2 - set default resolution before parsing properties

 drivers/input/tests/Makefile                  |   1 +
 drivers/input/tests/touchscreen_test.c        | 209 ++++++++++++++++++
 drivers/input/touchscreen.c                   |  18 +-
 drivers/input/touchscreen/apple_z2.c          |   2 +-
 .../input/touchscreen/goodix_berlin_core.c    |   4 +-
 drivers/input/touchscreen/wacom_w9000.c       |  10 -
 6 files changed, 226 insertions(+), 18 deletions(-)
 create mode 100644 drivers/input/tests/touchscreen_test.c

-- 
2.56.0.385.gac671c819a-goog

