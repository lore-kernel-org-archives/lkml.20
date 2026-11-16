Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827209;
	b=duKBCyAJ+tALcnZw/woaympEFFLMPXRsWhmJ5+Gureedx/gqcHN8aQukn1eAfjqTdyLy
	 6QnakOIlb5R25ZFtlKsxnldO1nX+qqPGcvxH6kRvBPeXODo06aJXpkVX1uF5DeKu0mFk5
	 E33qZx8eW7U/HDpoX4hSXNGIgH5Fs0xAmtlmo1x0FEq4dK0IpCGb2uknvKvAFmiC/mlCx
	 BseuPftBPKP6Fvih8J7Ik+M8FiGbiAhmQj6MMZHiKBXCdOvv072OmWZ+kSINTpO2Ano8u
	 weZ1cJ0Z7i6g0GzDWJYMSizLQgzGvJ+fwXUUEbv0xEH5+tlgqlZzbfup2WVNWwJMMQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0PD2Hoi/mUsCD35EYP/4JLQ1DrGCC56gn3UV4l4u8Yo=;
	b=mWmzWGTQbhd/jYSlZObzlGrguDedPAXW7XqO/W1iXo3CpuE+EHWO7RKYNYd5OKzfXFD5
	 IS02kIfPPpS90shFAAQfjUVwbnZegbGdDaZu3a1TfLJZCGnVEA23eSrmUCgOp1DD5LcGv
	 bFQhf5ZniMF8qsDWyIU3Chib1j1273RyRv7IoK0SNeBCERmCDw1vKnVo4KJueu53Znipb
	 D++sUZfBvbef86UNOVfBf8BA1VxaOkQ+PQ0lT2CcsurcHkJzmHl1VLv7xkeTEie9vGgxZ
	 FWkCo5IRrelZeper+S5yruzUVzvsLQ89XTt4+sLnYLGfI+UwDcUcgTCmJrwUX7t2S5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EWO7OONw;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F3606D7BF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A1F3606D7BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EWO7OONw
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so3924386c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794827207; x=1795432007; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0PD2Hoi/mUsCD35EYP/4JLQ1DrGCC56gn3UV4l4u8Yo=;
        b=EWO7OONwIlkVeEww1Mzi2NMDIZlfPYXnjkRsP/Nx6Q/0QNZ0U0ChwCfqI+Z9W5aERs
         C59WCpMe2+PKxHOcsKK1zYxvhOVPGSOU/8Ez6zpZJ1H8RHHlznMt6mejDDVZPLSeY7tB
         97bfVYynb9vQrfHjQKiv4IKkUVrOPvbnVoPDKsG2dW1bfAJWv9vWQ1sQwOFq9rIZgFYJ
         O8tXTPUACFK+Di6XVS0aF616Oj4aom9hMxcgCc1ndRN0pZuyWkWqGdz0TgMObzt3rcZi
         n9wKxmdjYjKUZgVbglKxEs+jv1EaLjDnW7pyLfE/rFgvuAvhpxQwVhu2hqLGaTLIjb48
         ST7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827207; x=1795432007;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0PD2Hoi/mUsCD35EYP/4JLQ1DrGCC56gn3UV4l4u8Yo=;
        b=jxeHiaqtfxjg9BaFE0aw+Rw/HRzQEx9M1pDylkBfHrto6OylafnjifnyG+N17UtBS5
         SXqZg15e/CwnAcgiRyg3xORiOQzay/VdRNc9YuUBs5nI0JxrH4LbllalV7FhpXOE3i88
         mugLTaj15N9wffOu7gC8u12tLCJJqWwf8MLntVAgBIBvNkQz7wPxKCpIn7v7y89nDaWr
         g6xKZ6WTjTaMHRKCp8u9TfHRqXCNm3DoaVReeifQd9bLVJfndNOKiwKl/WPviUT+Mkvt
         J8AbzRjxgEsnC3ATQRTkTjHkfqBLX2mzDoNg2L3LQ7yvaDGZOeAzEG9U4UvOiC5jf0SP
         w6MQ==
X-Forwarded-Encrypted: i=1; AL+hErFI4UIDmQAn2WLeTWJPETYyqm8n9pJBG4l+qksok8lpLWK7kiS6Oq4iL5IK4O8cpLtw+ujZ39Ntj8u+AsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d2FloB2F3EW/gnFsg/21V/0YPW1yxh0pHqW8gUXyJLo4cz5kZ
	ueVrneCeyP7qk2TDKUkrkULJgrj4SHsBvriQxRNNYKzaHHVkcB7Ro0MrlLTbvUZTneQ=
X-Gm-Gg: AYBFou0VoSpCpBmRbCm/3cxgJdivxqG3rgfSsK8gNOCFDbc8KI4M725H4+NHjJHY+JX
	BG03NDgCK6hOVLl6oCeLGQ8JHoVO4iMfbRc8u4MxWtr/20j+cGRQYmi4HK7weuNwtoBxfWd9M/d
	DrxFu7Q16DMLmvnfxuUfpD/78ztpgta9RMNDaEiykTqhB1lA3wXWQL1JasZl+kcXLzwRgZEATPs
	+l5cCOkGikgAHP6FA7jr+oA2E1PDHr/lQJH5cvblM4E9yW3HMzjQ2LcIVmhjFWW4UQ0lljZt2/9
	zkurO/hPSQwkm/ALuYOH1h/lF6hyx9pJxtaXaiQa2YNGHrDNPNTKHf66RR8s8jlTs3MqV8I8PfR
	LH5l7geL2qRsqG/r0ykG9JRxsw8AjmwCxIUZzpaDqFVP+BX/Fqp3soBXJ/MASSKSa4I7lPyvbfN
	di7PcHN2qQtSCll/JHu5SAvqj5SObt+NIqwznE01bIj2sFL26xg2UDSOEDbx+1EzqUssc70twFu
	MN+OZAgtm/TR6i3+VySc1HHoVxTpsu+e1KGSNnsfS6mANdiSgf08NAML3jyVancVfunHkFjECdM
	EJV/BGAN697nawF5oGZiM/4kaknzN2WxPLPn37CdlZ3SxrhkX3I=
X-Received: by 2002:a05:701b:4648:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b5031695c8mr10468807c88.47.1794827206938;
        Mon, 16 Nov 2026 03:06:46 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm12522103c88.4.2026.11.16.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:06:45 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Subject: [PATCH v2 0/3] mm/damon/tests: add KUnit coverage for age_ms
 filters
Date: Mon, 16 Nov 2026 03:06:20 -0800
Message-Id: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7RjaolhX3sOwaGEqkyCQthAN6
 d2tJO5cvpf89zcI5JkCXIsNPK0ceBozyEMBbW/GByF3mUGW8iyEkBgpRDTZPwM6HiJ51PqkLpW
 iWpYV5OHsyfFrj96bzD2HOPn3/rGKr/3l1L/cKrBEqzUZK10trL0t7WCO1C3QpJQ+MX4QerMAA
 AA=
X-Change-ID: 20261112-test-age-ms-filter-9953843e7204
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

The DAMON core tests do not cover DAMOS_FILTER_TYPE_AGE_MS. Add tests for
committing valid and invalid age ranges, identifying the filter as
core-handled, and matching ages at and outside the range boundaries.

Region age is counted in aggregation intervals, but age_ms filter bounds
are in milliseconds. The interval-change test checks filter matching
after both increasing and decreasing the aggregation interval.

Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
Changes in v2:
- Fix commit-message formatting, line wrapping, and comments.
- Set age and interval inputs directly in patch 3.
- Add SJ's Reviewed-by tags to patches 1 and 2.
- Link to v1: https://lore.kernel.org/r/20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu

---
Jason Angelov (3):
      mm/damon/tests/core-kunit: test DAMOS_FILTER_TYPE_AGE_MS in damos_test_commit_filter()
      mm/damon/tests/core-kunit: test DAMOS_FILTER_TYPE_AGE_MS in damos_filter_for_ops()
      mm/damon/tests/core-kunit: test DAMOS_FILTER_TYPE_AGE_MS interval changes

 mm/damon/tests/core-kunit.h | 93 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
---
base-commit: daed51c9105158768a3949395135aa6e0a04bb7e
change-id: 20261112-test-age-ms-filter-9953843e7204

Best regards,
-- 
Jason Angelov <jasonangelov@ucla.edu>

