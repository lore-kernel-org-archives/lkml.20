Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499939280C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887019; cv=pass; b=eQlFaR+zcNEbbIWab+kpDVZD96csIlEPGg+31HOvUTV262VAU51YagzkE4sr8G05y55TtYXF7AsY5t+FV9LO5DBrKZDDeUaUR4KvlXeUuibjb9fDw8Wt4dj9OKuFU8Q55+jq8k+wc4aJECJbm5DXfVXgzxmvUKdQKp5na2kwe6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887019; c=relaxed/simple;
	bh=cy+Dc3TdusmXUApTnyHfbFYWmBv7uzImSgye5KKeyFE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=po4mAyLcW3qWpRoH9BxxFBoEuhJYxjxCU6c00s4mQcsSRdpJos5tSXv3L7aAFRGF7M6kGFvMg9CJeYOXcSkSKBPcB9zoAjQHaUG5oiZYRhP7wMMYRojzKkwJiMVfhCupskUzn+g18A6czRXFG4fnESUmEM6nB6BLhE0TDO3OW+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=quoYFBKE; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="quoYFBKE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d032846c95so6495045ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887007; cv=none;
        d=google.com; s=arc-20260327;
        b=VAnAWLjA1nYCp+b/ZKIW29wVMiacesT+0Kz+CoyjnbEUznv/nUgHPMiIMLhE2mspCG
         xqOX9TqVx5GGPfSW3Jz57Y3JlQp16z3EuVjED+wDmZslqfp5d1YUJBTVlI2a8i6ylhd/
         /oQnoE1Wx5/XtFSmNNKp+yd+SKihEHrPKou1xyg3KbQKl8K+M+1k/SmWHFXoMPikw4w9
         2J1jIyjhaBqOiyins13y/GMN0cjUPGWrfHg3zSZDHSnQE/SVH4IxBiFscyGX/5V1SI2R
         /oYDfpvR6yYNKG/EYrXk/tAfqcmQiiro33leKrLkvfZLUloErfYjpZxJ+9aoePtjtaUZ
         TtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=0HZJPWMt2ET4Ks/zZSuRVpb09aUYk4YcREWk5ukGH1k=;
        fh=QDnz3bsx5lpTsiBILYnSOnOVv/WMbz7oTNztiQ8/Qg0=;
        b=ZDaOp0eA2Q+4aPgRMu/mVT3aeOJU0WnqHlAp/E2Tm/gV7D6X/UCTFvJUOqObLdAwcE
         6KbpuSKa0b/WWWwRK2JNIMOfWQHVqhrtJHk8Gnk2mdx9UqboLGVW5LvL3cfOQjt5axEW
         V5L2zbU5o+/yCTAflTwrqo+OPIt5HJAR0ltPHspKehknOGkqHXwLlWZSqM63oBYZAKMN
         EQ+4MAtWfwXHgdX+n0KEC7V1S7KK53Bd6q5xu5bk30VafvWTntXUyttFvGvSWQCQXwnw
         /FSeCPbI9MHeZXT/8OJ7lt1YiaOpi283E18WO2bXroM1SKgyFAFjEvdfN1UjtBd1tFlW
         8lCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887007; x=1788491807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HZJPWMt2ET4Ks/zZSuRVpb09aUYk4YcREWk5ukGH1k=;
        b=quoYFBKEZlr17DZmMM3QA6GYhc6rWJbTyURtYr95e3kx4cqV5bd/CtsBWIpRYKy910
         qbHUQnBGFvTWNtYUS+mkmnot6/zgvpCt89/oA4yXBkd5NBlZjWJ4pcEuoLtpH0FFpmXQ
         jwV6xb7u5wb/fCjDVp+L++9NqE9tAkge0WMgaStAo6aMmjw1+7TFldZNnKbiyykbfSc7
         g3ksrj7Jds29CFSq98VMTodRGv4kB6YqdT6KjEap/GDF17U3lvVaiKkByaxHU/USy+mO
         X4x8u4Y3gFptjIhPnNGuJyc8Ng5KAGD7Hb9b9U4fHdDh/znPkyF3narpg+8+wFb8EbiB
         j3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887007; x=1788491807;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0HZJPWMt2ET4Ks/zZSuRVpb09aUYk4YcREWk5ukGH1k=;
        b=lrFjaikhF+FuzeYquKEt/q8Bmcrpnal74q/rMSfitSy5gSb5Jhnr9OUiO8BObmLNvW
         cZ7RphKhRlTQXK9xTaFA5MTA64r7jeuEWHrOABAOAWAt4zd+8nmNcaIz3RvTLRbC8Tvy
         vjNmvX/2Tq8D3QekVxl2z77FVUz4BqDNnqoYypoaQRH7yHIL6dr0dqYyQYyoY8ErJpiD
         AqEtP/hNm6M6VZjnABT8v8Lo4neiphhEACPqDawAU+NTSVi6NUq2N3/pahwgKB05zxFG
         4Xee4Y+W6xs3/tTaiQP55eo4eNCcPL+CqYxGlR+8RbCZGCZKMP+3dzsVRht32SWNrlQc
         vhuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRpMphhpTvJYWXYubFabHpyQsxXv8atf8JwCrBnaHZGO9htONVZWQa5C61tlIxXUJBgwNfbE8lTK6irhA=@vger.kernel.org
X-Gm-Message-State: AFuF++kRUIHrfXfriPcYZrLvaxFJw/PeLROk144ecCnkuh0jMrFtMcKM
	WrcyCLpAytaheCzVlgm0zWMMBddCMIV/j/4I/P+zyR5nypB2a4ZOhWK0V/axIIBOVAPOUgHvA0H
	p3HgL3BzNlbUTTfbBLCdVsBv3gwwxui3LFAbnjHsZu+diyPejbYmPIA==
X-Gm-Gg: AR+sD11JHWSm72D1NKj3VBaeqCboW319rZ4ggOR6T+VqBbngShnW7YKOxle6Dyy/8KO
	QwKKwi9MVkR2CSR1pr/EhlWucxIpoYsf/tSTPrMqxBMf+rouUb1zuLMNlcKrAiUWnixwfNPmAX4
	dFWfXeQdqq9REhKvqWS6E0vPEw6L+xxuMkznn5wFBFwapWkGso3HOEcj8wt4uefCrTUhFbVwo+P
	jXA2rKImWsRgri1OEg7e4lI6VkxUrEdvUPggHv861VvMwD3+aJt6Wb21QvUQuYADfnsn8cxbnsM
	Cv8NVuowmkJQ5jZGfo14PxEfjC7EuSrJhj/kvV4jQDv9WFDrFZQ43rz2sy99k5VMx2XVL9Oq3SA
	bU/IEKGd128mjNbyiaqhiHieKPgxcjWVt
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id
 d9443c01a7336-2d74dc6e805mr77361815ad.2.1787887006148; Thu, 27 Aug 2026
 20:16:46 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:16:45 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:16:45 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 20:16:45 -0700
X-Gm-Features: AcwNN1WhyvIa-awlbIrN68vkpEktGaXMV3QKxAguOkDfWttHLfYmvC8B_tinu5Q
Message-ID: <CA+0ovCg8FUMDO7RUA6Da+RatLG6eQQm9w7ifnYdCasYGHtjYFw@mail.gmail.com>
Subject: [BUG] WARN in v4l_querycap -- em28xx VBI/video device_caps mismatch (v4l2-ioctl.c:1117)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/125-media-em28xx-device_caps-mismatch-v4l_querycap/

  (cap->capabilities & (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=
(vfd->device_caps | V4L2_CAP_DEVICE_CAPS)
  WARNING: drivers/media/v4l2-core/v4l2-ioctl.c:1119 at
v4l_querycap+0x359/0x4a0 drivers/media/v4l2-core/v4l2-ioctl.c:1117,
CPU#1: v4l_id/26859
  Call Trace:
   __video_do_ioctl+0xad7/0xc90 drivers/media/v4l2-core/v4l2-ioctl.c:3133
   video_usercopy+0x86a/0x1320 drivers/media/v4l2-core/v4l2-ioctl.c:3475
   v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
   __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583

  BUG: KASAN: slab-use-after-free in v4l_querycap+0x415/0x4a0
drivers/media/v4l2-core/v4l2-ioctl.c:1112

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
