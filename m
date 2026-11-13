Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528933;
	b=A0AKntxKM9co9vWWVMbPwquEZ+K+NIJB9xZ8MH0n8aEd/cp5vVM5g4RPMAnobo0J47Fw
	 9f6FS6wX8l2BX77wse/xiIQfh4MjvM8gAOeIVZGb5T9PUz89SWhwLr+jWXGyQhYbXi17w
	 QHkTljxRqR/jP9pY3tLLfJVhFodXUy8RZCQcHvy1b14IVFMb/WDxadIgZp/pboSfCYT08
	 CfFCIIXmkMRtZppNsb7gx3u1idSQdpwCUXPeH/aoM5s9I3Z2kwjtbIPUIjG1zPzcKn+/N
	 JLkwg6YO7cUX/7SpR+vn1dUMqk6tI0ytzE5aElDv8TiSPloiZdrwM5yQ2UuH3iRzZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=61O++FJNcC4m027jbcMQkO8tdX8vxtYJyx2loV0XGJM=;
	b=2tqqjoi16b3xnkJ6m1JGqea4sR4qL4Urfr83B1Te1qa2VKcE09n3hVCPrrTJWcPkQCK0
	 4OoabTjLbKLxu05EWZoYOIWmcMJUV+0PSCwUDAu79H/61PziCbFZxjA+OmQFOWj2bBpVM
	 RLs28py//WWL1UPLg5oyCX6+g/BoDNShgqIFTCzCX2H7B1HNHPHq6e7nzGzTcMfJS9jI5
	 wdj60b9IrfUs+lPL2h8X7ehMjrqmN0ouh6g22qulwxPbFpAaq0Ghs53RAMMKH10Fibvh1
	 8hEFY3ZWGWORSxtfPolXB+OdsfbOGmd7lUOet8dSLXjNmY4xN7MYNxe+Qgpsg8gfV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3gGVght;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F260A261C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628F260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3gGVght
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso349532e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528932; x=1795133732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=61O++FJNcC4m027jbcMQkO8tdX8vxtYJyx2loV0XGJM=;
        b=P3gGVghtYNus1pwVAyzu75ZbePKoUj8l9ghrMz+6TXk00mR/PAfXnDhNBmSmHH1PKH
         EiIeXV65p9W0D7UA5mfmcHf7fs2phRv+t/Dl86n3Fq1UVzRDyiDPYjVN+3Sgzy+FTkjS
         GOMrlfikZsqhyo55AF/5g0BXluMlqY0GSbEQV549acI6H5tdfF/4la9ioLDz8BaCylLU
         wmRUBXEay5OJkUMosZWYyxoLSJHy0mzIAwFkUiz6uFlIZXg0HlRQPGPEjnNCmWgE1Nqn
         Ws+qiU1iY33gPJ+fYyfdf1aGa1kMwNoYlgWeFEcYoL5qCuHhPUYIf4hhRf8uDDZj23fu
         cSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528932; x=1795133732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61O++FJNcC4m027jbcMQkO8tdX8vxtYJyx2loV0XGJM=;
        b=G1kbkGeUEzj+Y2QjIayYnAtl/tISboQBrCfIDsNIKTLnUiR1qlF4Tx25Fp/pjQNWOY
         0qnAgfEZqkN+GFmrSwUgn7YwC6kmCmtszrPgVtZ0e7Nfw2ygwcve4Zze/iK07YyEO2Sa
         GPYb5ydNYaswEZaj2Mlc9mc32oQ3sysZQwY2OFtJqbTDXRnSpXyaej5SgQh2BlrKVjk1
         9vtbmzI1AAgHfziDQDBaTAiFKnEqw1eR9ARoqRMgb/Q5aoqiWLK1bYhaSTJnN66bGRHN
         aO1A5rvqNe22+9tMzPAx3I2mAKh1sPQn4B+KFMa+bNTccYb4w6MLekn4kLFQZxROCO8P
         pb+g==
X-Gm-Message-State: APuU4Z+K2SYq8SODE9Sw28yQgsUviHJG8sYD5n+KKnZu4f/GIFucOQvx
	zg7zZJvZyEuG9FYgBYgmARBD2w51oeX7iUT69Oha6MIilEw2+6wkOfDk
X-Gm-Gg: AYBFou2O88TAE6wj+UhHAcOygrqNCzi+YYtxXJIiglKEI1YKEwtOZRSkTsb08atjLly
	ttXRg4R6eEeShHPjTDbOghUH1pM7qAxUcONWIv+eLR47hko4WfzRq4JM9HcIRWvrVz6Gpu1Po7D
	2Mr0u4sT7q4GYeZ3Ocz4qvw4O52GUijhWO4DUAC/PkeW7Tzq4/8T3xVVGXgaK/2feoRIVwsVepq
	ch01WBXVpYBK7EbihmjxAGq8c7PBBlXV2fVrOvU8ZuWwcRX25DeuzWnYPHoJCBCcPDgqeNahY11
	rRCONmUKe7uv4MzGoDyu7eZncGcCrIMThMVLnRL9YLb3xfc7ZfxcowkROZ7CfDKi67ytEv52MSM
	fffjf1CLmT6loa3eei65UWDlld1gI2vrXTTBPtES/XG575nvKm58Kz+Y0rifoPmBfMMii654fkr
	HJc7bunrDf+TNzHvs+XhivfYznG+rwh0/97sFTYejqX2ofa2UiZnlo6S/acqhVpRoJ2/lZK50RJ
	jXYNs5QZ8sVULoITvoYlbQAmyKZ5VTRVEmufoeKLJO5/NVDRM98hmUmHh1NVW3yzVNti50uWzdt
	CRenebSHpf+3SG+OiH2Z2vxX6fB7QBtCC+r6fHTP0Wr/42dkUpxo54IIdRY4RvxO3xOOVfq95sK
	XJ2JyDASbFOTapMDMlO9tBIdN5N2Q9nA=
X-Received: by 2002:a05:6512:12c3:b0:5c1:517d:fb91 with SMTP id 2adb3069b0e04-5c1705d83eamr373085e87.2.1794528931539;
        Thu, 12 Nov 2026 16:15:31 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:31 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 09/10] sched/preempt: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:15 +0400
Message-ID: <20261113001432.128201-10-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/asm-generic/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index 1adddeab8..fc0da591d 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -93,8 +93,8 @@ static __always_inline bool should_resched(int preempt_offset)
 }
 
 #ifdef CONFIG_PREEMPTION
-extern asmlinkage void preempt_schedule(void);
-extern asmlinkage void preempt_schedule_notrace(void);
+asmlinkage void preempt_schedule(void);
+asmlinkage void preempt_schedule_notrace(void);
 
 #define __preempt_schedule() preempt_schedule()
 #define __preempt_schedule_notrace() preempt_schedule_notrace()
-- 
2.56.1

