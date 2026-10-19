Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB85353A77
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376854; cv=none; b=iQLPW5PYWmxhdweKfZwgHYFNV5LvQIKqnDTnPM+zVCjGtQRSVTQI2CXMYDmqPVoAJg1MJ+zdH9MBVBowGzwUHCcvh4TeurrdsgcsbtsSWdoToAwAsXJ2oo4iOpHqPFYr68SuHfJafp3LaYGUuNy5jRQsj8ZURU3qn8nEsdk0tP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376854; c=relaxed/simple;
	bh=ERKbFmN73N+bFdL2Y7WXwHzxqABDYzGdg5NtpYeJ75I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bae3nE2ewqSLce2LtsNzFapvEKYmeWQJhHS0JydNDhaQUhr/jEqXumPntqIENaxB5TU0CE1JZVlTLrAUyWkjPAKyEP+4eT4nsENtp5CX+IAw6FCHKowQjdT8Ie771eds2XgRw6BPx9fz98ZlBLFDhCvRH3szrvG/nSs+4jily98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F88pOb7G; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F88pOb7G"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so190041b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792376851; x=1792981651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkqdExa8w61hUC2yB0qnndgXQmrAByDZaalNNXrY3xc=;
        b=F88pOb7GVcNqqyngT4WvNp7mbEC1R7hBIqrULBhQfdNXFkxiKwxZLkz/55J8yWm+70
         +g6aJMjITloqkNFY/hb/cQ6qkF2Yg3rM32/p1by0mBHsqO9nf3m8qWxvI7DsMTHM0xWn
         hH76tLsSqocTgHmbX+E6dFhBGc3qfjDq2vEoxGX/eptWYQyUtfoDGMB3cVf1qJW1DP1X
         Noy7CPmNctodbW9ciGysnaQeo8LfOvzfPpIYN2un4OMwhsdLeIC/o7tjZILyMsscO4D+
         1Bf7ibayo7OfFHtsp1iTQ+ZUseGCsqsch2DXWc/NMoxcntcLxkHMak07U363QAGppr4c
         oHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376851; x=1792981651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkqdExa8w61hUC2yB0qnndgXQmrAByDZaalNNXrY3xc=;
        b=uxBd1Pe/3UxJyy+hK68QkUbIpob5W0LO69PD8kxN4ZIRlDDmbwu2cZLaJvvOzeWbol
         aJqxHuvrmKItzivjQwimV6MHgz1BTVOPyrLon35U3tVql9wpMnTstxAhluMdFjPQPGmC
         QkzYqP2ISCYTvAY3BCjSDlHk63IuYdhhY6apmVvZmG9t6jTD9JtNX5DUZhlDHNLyhkWl
         Q4O8E6bpzkDDVQRstd5NEUKIJxPk/ilg3acvHQIKRGwOhfpx6mroL+u4eCSrK+3fECVM
         m/R5Aqp7bqzWf9t56xA1WAVfqgd5N9/H1peataDQ+B6aAFDqLzRLFSkxjuNe6gY5l1u1
         Uhaw==
X-Forwarded-Encrypted: i=1; AKwUvBzo4k8VER/cjSFnHMcy3ayWh4kafHlp2R0hRc24v5HXNGEp6NCslcgQJv09l9q8pf7hkZMfElfXRDigmr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtx8Wk6pIxEQSEUfX9tobQZcSo3c1k12jqH7v70WE2SfbkEXam
	o8hG76/TcDYUyvyQfPTdgHEojhy1pjr4I5rSUhmfB4JTG8pDDJKjASoT
X-Gm-Gg: AYBFou1CA28nDN6wIO+vQHxhYPc34mslJHTC52I0wczny6CiYL/dLZkS8DezT5Kaliu
	EJHGPrB1uHn53ba5zvojaxBPlTraxqeTBacUU47lUgGjLqxXzINcNIdSTyHwS3BQadVTdeQrgwN
	5FPAAZ+RVgktvmUp6Nq2mJe91cWAgY6vINyyWLcOeiA1YvSCnNbdGatJ7potpy+IcZ471aC38Zt
	0N/eQwNqvkj++uoye75vwOjTIXBMLTl+lX0g1KYdm7l0aUWW0VSTj6CFalz3JXXZujiQTyvRrZ6
	17iXPX0GFgqqNhs7ky2gLzn7BsJuezPzepyldwyrrcpkDPJJW6lP1uB9EKNTL2LeM1P4Lj3JmLq
	QpjWvb3uKBFxKCXYiJYQYD6PvFJUsbVlBx9rciTc2rjuBqf6jXPgOzir7U/1mW47PKFVchXoRet
	hAzL96SHtwQmnG5z+egyP93v3a2aa1tihjijKpEGrZ0zi59We+33WwLJyPspGptQVGQu3FY94Ip
	WwrDyln7HLejz1Vu5ohKH9+Isuk+/Ch
X-Received: by 2002:a05:6a00:22c5:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a04bc2d679mr5099071b3a.27.1792376851039;
        Sun, 18 Oct 2026 19:27:31 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm3240432b3a.29.2026.10.18.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:27:30 -0700 (PDT)
From: cacioandpepe <artem122novak@gmail.com>
To: daniel.lezcano@kernel.org,
	robh@kernel.org,
	geert+renesas@glider.be
Cc: tglx@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	magnus.damm@gmail.com,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305 compatible
Date: Sun, 18 Oct 2026 20:27:17 -0600
Message-ID: <20261019022717.511096-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artem Novak <artem122novak@gmail.com>

The Renesas SH7305 includes a three-channel Timer Unit (TMU).
Add its compatible string to the Renesas TMU Device Tree binding.

This is an RFC because SH7305 TMU0 Device Tree support is still
under review.
Feedback on the proposed binding would be appreciated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>

---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..8ecc57cc3d91 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,sh7305-tmu  # SH7305
           - renesas,tmu-r8a73a4  # R-Mobile APE6
           - renesas,tmu-r8a7740  # R-Mobile A1
           - renesas,tmu-r8a7742  # RZ/G1H
-- 
2.56.0

