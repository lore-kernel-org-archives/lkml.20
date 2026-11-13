Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585556;
	b=p87c1/E3opWFCZVCMdTv+xMK8AEB18z2O2384fbX+5CSndf4zKeQZwvZSKZvEu0J3ogU
	 HsAgP4iEjo62N4vZUS58RcL/NyTXBOjXZrF1OlxayMfoQe/tGFKbNN3sRD0n6ICKmQw0W
	 IidArYUFkMTLweSR8GjM00xuROxAoC9U89m9Ny0AkVfkWdpoPAqqSMMr3TD4EVzivRlot
	 31pxtk3OzBIUIJn2ESeQ8H/3vAWKSlAKNvEKbElSduTxukyVFx7h8oUXXmTVz73LoVaHN
	 KKAmC3cLKgUhh8/9sMevWM8Pb3/2RahJpNk9WAoBM598DaPemAc+YpLWFVMEk5jmP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=aIRQL3xPbHGiEB8Nq3QfhoUZhbnBVyn8ckiUXc1wE3o=;
	b=kKCE8JCw5PV1Jgx2XhYRdxI2cp+FiIMogMFPJi/D14ipU1lG/I/XzDMY+suSSN+H4Y+R
	 I2vuoXvNsVWZD/Swz7NDZu9sMzPLgZ02cAS9QLx++nu1RWAe7Bwzu9LHbzuCfsAqeAaT/
	 rlG8wFuGSAVZAMPrYv2Wx0WubJ3HsExPFpS/rKb5IEYMPHkpH+YIJyUMNi+VLdUlWa7xu
	 6WC4kiVt1AaxpN1qAIrN9U3VE6UmDBUPFbv1VLeN5RHZsLMa1h3qgoTiWOv5zOfP67aG+
	 bbTOlZ3aFcEinVmaklA5DIReFbSDYzJaz8oa5OYTdbH3Y3tADq2RfzMRTOwfNyJ9XWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hFz7YZ1G;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45E60A6F7A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC45E60A6F7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hFz7YZ1G
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1248694c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794585555; x=1795190355; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aIRQL3xPbHGiEB8Nq3QfhoUZhbnBVyn8ckiUXc1wE3o=;
        b=hFz7YZ1GURy2pIcxJwEPCpqToCrXrvTmc2FFUIDVOI6o2ZRpHY85scSXDcBsdbPoD5
         q4Gs4Yq03cpbZ7q3Crcz/gOVObKkvbnaqlFgElGFaff1dfGPMywxkLOfsP+kgO27yNgY
         Z/l1gM2NBsOD2zk8OCDMIQunUpRE+8uVrAuoRfAT4j/j6NT3cmLATO5zmL2PC5J+Jeea
         kd/hQgIGTKVy9YFyDY9SlxTaPD/OtrIUR5kv21plEVTDyoBFzkUFgLV1g1szrbg5k52i
         VpB4VlbLm4sH7ENJgQqkmKakDUbN0HrUY/3aFm/uv7uX3dAkOgLQG1F0akwtpYNe+iKd
         m7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585555; x=1795190355;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aIRQL3xPbHGiEB8Nq3QfhoUZhbnBVyn8ckiUXc1wE3o=;
        b=najS2cpGsHCcnbVe2s+CKQQnqIney79ATC0sHKfgzjwHcX7z+nYs5X+dt83StvFy5x
         ga5n8fOD+SliPsgi0Z37187nrb2jKC+VTfXGyrRjtmne7zOyCDxYmc34Rv0LzzbMNDnM
         AWeOHLdZRK99On4evzV3EVxb4ttEpN9HJ4RTRbqstUtgraieJm/ymGY15Yw7rUady/N6
         YLNa70xtWAPDrUZ8CR+lpAboPeK8n9GZ6sMdk7iK2gyR0wG8YhjJRnkkYAEQtFJIBdtg
         uWBjT7dk+ENIYttZOODq7YzyJCXdfSgV8rmGBnN8/ccL28Ufq22jl4mKo41EYaIrQ3j5
         LtyA==
X-Forwarded-Encrypted: i=1; AL+hErGE28Vu93+uWyCX9B/jSxWnRaivrTvfrO0DDJqsC+G1sqUcrycGgRpl0Im+X6gVJefx1yE7RdX0xlncR4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z92vdtdpT83woP/CNESCkDqne4UoMFzkYBZjEsCA9dHyBDKjuCv
	31/e9J+Ah5PErFd0RhAb4zwJqdFJ9cfD0t8KR5Sw9768MTN1SqPRMxx/P6nVfnlSCEA=
X-Gm-Gg: AYBFou2SQvw6z9dfHIkwa8ZA9WNl0uvWpH9iscMxgy6+kdEn6B4byWbWZ7TrlYfuwNM
	tLGuzlku0BGAy3MFr520yVec61v0Xv2fX9TgjN1euXdvVNPhm7nwbztZVc/dG8yDVnLZxbxC4q8
	AacMl4jwvLunLbWxBsAYGUOdfCvesPHth0peqvHcUa9PIMbBOoOUDIOwd9+yUYA6OQaDwF5L0RI
	rwVcjn5izPe8DCRNwbrWvHAqMSscL6Ep2Yhl8vQsY+Ds2brm0MwOaiio2fMOgMOMy3WgfPKwiNt
	7+MQhB43MtwaOJit6Kr+ejETAr2bAD01T7UkgYPT5kOR/H4tV5AUy21od3Y0vQjF7P7WijMjCyt
	TXYJH95kWtaKQ3As5OZnnCtAADtj0TwaAZd68LCcFv07JIz3y+un6l0PZYlxoFkV2w9h6Z1kluf
	yVzg/8f8GD4mRCECnRnmXs11kP8HA7ARFMYwrHF0nejwZg2Y8Rm7QkFbmKfon94rAaV/9hj2EZE
	7l5EOtnSEqjEiH5N3Puh8UjEGjAF6ub7sBxALFR3uy6cRmK9LSeaY+SLbuoikQ+O0BIZBkFws1P
	ObZAcXVJZQsWO6e6zS5hDYtx/NyCpw==
X-Received: by 2002:a05:7022:3c03:b0:1b2:42db:8a1d with SMTP id a92af1059eb24-1b5030cd460mr2271552c88.29.1794585554755;
        Fri, 13 Nov 2026 07:59:14 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm7868383c88.15.2026.11.13.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:59:14 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Subject: [PATCH 0/3] mm/damon/tests: add KUnit coverage for age_ms filters
Date: Fri, 13 Nov 2026 07:58:54 -0800
Message-Id: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G2jrWr8iHkSjBrRKU0SQ/t3ic
 QZmXhDyTAJd9oKnm4VPl0DnGUzb6FZCnhODUabWWhsMJAHH5A/BhfdAHq2tirYsqDGqhBRenhZ
 +/mk/xPgBjyfsPGQAAAA=
X-Change-ID: 20261112-test-age-ms-filter-9953843e7204
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

The DAMON core tests do not cover DAMOS_FILTER_TYPE_AGE_MS. Add tests for
committing valid and invalid age ranges, identifying the filter as
core-handled, and matching ages at and outside the range boundaries.

Region age is counted in aggregation intervals, but age_ms filter bounds
are in milliseconds. The interval-change test checks age rescaling and
filter matching after both increasing and decreasing the aggregation
interval.

Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
Jason Angelov (3):
      mm/damon/tests/core-kunit: test DAMOS_FILTER_TYPE_AGE_MS in damos_test_commit_filter()
      mm/damon/tests/core-kunit: test DAMOS_FILTER_TYPE_AGE_MS in damos_filter_for_ops()
      mm/damon/tests/core-kunit: test DAMOS_FILTER_TYPE_AGE_MS interval changes

 mm/damon/tests/core-kunit.h | 107 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
---
base-commit: daed51c9105158768a3949395135aa6e0a04bb7e
change-id: 20261112-test-age-ms-filter-9953843e7204

Best regards,
-- 
Jason Angelov <jasonangelov@ucla.edu>

