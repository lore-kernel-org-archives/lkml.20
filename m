Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7849346A0A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834431; cv=pass; b=fLbhe0Typ+nadhVWCLAhm0WZPU4FSSdIYOB/jbUgBpxnkdGTrWQp2gz951LL4dhaY/Vio9dM/8b5vzoiBeYZsA8ge8mKn8d0jxiGMuduTZpxrpcdr+DixTjTF6v47CoSwU5qfZYH39XJnYCBoD+g3hhA/3sv0bRSSVw/lk0U8DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834431; c=relaxed/simple;
	bh=Ea5L+NfGwGW15gGuIzQxh+b2WvHUSCGvR5hc6itnj1I=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=C5bUcmQjF8dHX2i4lWguZlHtcnaZ8ocUGwJRhjJxgftP6gijIeRqzPh2yWPoLFoLogpUZYrTWv2SCd7w3vSWxXhoCT23Rteluhs1zgtWpaKPiPEtEkbQ46GhvLarP1drHXcv8JFEEtQqwnO9VeWIp9wV1+GpPC+izFPGu7szdiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgiLHK6P; arc=pass smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgiLHK6P"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4b94bb43008so1197454b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790834428; cv=none;
        d=google.com; s=arc-20260327;
        b=TDgz1c9LurSdnogHFdD4/llKJK4WtXIDeOi4ILmnmKg4mDCQG1blxQVFdkqftyAS/S
         RpRvYHOdmKbukPid+lCm9UKenFRpjJz9JyL7rQWae1lwy2VOcQONqysw8ziUwVxMgEUM
         C804+0EyyfLBA5Whv4f8NjBI45ijhasTuL81VzC7kzP1OCiFgDfaYMZvQ3Jn0g0htDhe
         TyNINj7w8YFEz0X8PfNVaLcBlsJTRHAs/0l8kRORlLoWowll+z5JIkAKoAm2naXXRnBd
         uI/GaFsFCeQJSFx/r0vLHCOnKdYPIZLplkKCNIMUYogPjYSiOZKXXuaKJ6cFsBmuyB98
         TVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=86MBDdoN8+nPFAYYb3eyEgckb6tHnNUv3pn1Zb+pPE8=;
        fh=0dhAW+wswkB0WX86jAMZmqOjE/3KvtyoW7nlOW7OgfM=;
        b=cmI177bS9jJWGQBftDSqcaAch5DnnnfxBX4uDDbr3lrljMoI6IerML7lDwpKNI4FJ2
         qlFWdWjX+LKFZMZV5x9+8gbUvxgcykiT6DS3BBy0X7BkhFJV5ELDQ8HpyPxG7B8WqiNR
         hJvSEeKYZpqlhXtWDC862Jgtew90Wg/vEibngIK/KhkekBHknPS6RVpuvK4uMAjHnP3Y
         TFK3EbPvixMMr9FKLXV3eqFyJfDlzS3vU3BD1KbK4kYKlwNni7t+JKaAt9RivtqhURvt
         frodldt8MZz9KWF534BLtccGnpymFS+WfdcvAq7ea7cDGcGlar3GwsfN654MNKt0vPUH
         tgCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790834428; x=1791439228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=86MBDdoN8+nPFAYYb3eyEgckb6tHnNUv3pn1Zb+pPE8=;
        b=UgiLHK6PhxSzQIvNG0AKz//Yr+Gj+umBXHHfkF832o28gIeZ1X8LELmmcH/MEaP8RB
         +CmeL9009CelREWGS0fgOwiUzlBxhV8/QpNKXDeP9to5rj64JyQOizkRfxmyZyuSDJnJ
         ZS302YC+MqJIJ56QL8Z2d7XWYFZ8iKlWKUACUtlYWPDkXV9GdumaWCnztIUoCVFer/hw
         8PbS/ffFZjCESBHUs94CW5DNyl4HmEtOnoJdbxdMvkXy4DS1RPRHFiEYafnZqF/eA0Sc
         ekcPfxcy+0oVGf25q7bh2ciJpJsJsmCv79K6gssJ4PqDcUp4v1yTePVZaKKPLT90VF4E
         X2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834428; x=1791439228;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86MBDdoN8+nPFAYYb3eyEgckb6tHnNUv3pn1Zb+pPE8=;
        b=A3lUyDqK7xe5u94xPZ+aLEoDG/YxNONDglPXAVIDNIYHe9LnLV1gC1KpISCoLLbHL1
         P/2se9/wQ+i/Q5ElpJwSWiPfUNaT11M1pqo6AWGGlAV1vFflz3/scIABYTF1ZY4rYI+G
         FvudWH2YLE0XG6vHyYfTbKvJiSJFC0QO/RlCKPu+4BUcBWfqd1CTHMwy8brn9UZRMGRW
         Za4b49c4AvDdiQ1hT3Aj9bdRPad4tnaLMC1JzSsIGz1Dj1wdWKgcWF6h7O/lEs/kM/cV
         KMN1pU2pb89gwrpW/Tv8JKmWD/3pFddN82f0RbevN4KQryVOVKFf376+vvnGSyfYcAN5
         cPOA==
X-Forwarded-Encrypted: i=1; AKwUvBwRpN84OjSwBGgY+kyCsIzagcpeDToSdD9EKhKEDWrgMdfV3hH/xu1Y6zsHAOn22TQjLw5sixNOd1wz7sw=@vger.kernel.org
X-Gm-Message-State: AFuF++lX3lOBDblOtz//Fjbfef7jUMRP+oajKuOgeiQhJxRPnKw4LQen
	MngC6zhV8SEL0yBj+ovIwgQxkGxVdLeJAyi/zj76mX/hPW7VwmAQ2as0K+rO30/FH3Pece7q39O
	TFANnz4MrT9vt3ZjvN/NUjv7eR6qs0u8=
X-Gm-Gg: AYBFou3eJ1BQ8Xu1f1v0tvkAv16100K0s6G9mjj4WLzhWBG8nfcVwo+yn6LmLBX4r+C
	F4B2x2q3lEGvlVnuHB5tobygLmESiJ3jZwiJhM/mUu9YNwPDJ7r6ck1giSf6KawSOrgNz0ige6i
	t75a0uK1YYIB3/925LojhtQbFCp3+6xuO9VJpsAwiM6Ag/aKYSWzVA6BxWM3hngFC4cd0+yO5UT
	BbaeoP/y8Bk3wHrr/m0raGNXakw3yhZfInQIjtQqgei7/DC6ItiPSuVvOeC1rgQsujg0lVAAPHT
	9Q5kHmvAEXDAeLWdsK82FcktjwPwzFkbLIQnckYAttu60C5wZeGz18ic0ARtm6gw9uPJmyQPONz
	DJq1bHTLdWA==
X-Received: by 2002:a05:6808:c2d2:b0:4d6:93e2:5bc7 with SMTP id
 5614622812f47-4f1b937789bmr4169206b6e.67.1790834428301; Wed, 30 Sep 2026
 23:00:28 -0700 (PDT)
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 23:00:27 -0700
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 23:00:27 -0700
From: Aveline Noir <jm5905938@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 23:00:27 -0700
X-Gm-Features: AclHuK-fk3VgJqHBfeBrKPt-2j6Rf7JJ_J_9SFI-Q-5BndDxw9L61bmuFQdGI00
Message-ID: <CANOyQmFzsssM_BXHUDrV+UuVD5SZMBmSkg3UQnmw9Ns1PV7GCQ@mail.gmail.com>
Subject: [PATCH] selftests/mm: mrelease_test: fix retry limit
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Christian Brauner <brauner@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mrelease_test doubles the child allocation when process_mrelease()
returns ESRCH.

When size is already MAX_SIZE_MB, the current <= check still allows
another retry, causing the allocation to grow from 1024 MB to 2048 MB.

Use < instead of <= so the largest allocation attempted remains
MAX_SIZE_MB.

LLM used in discovering bug. Changes were made and reviewed manually.

Fixes: 33776141b812 ("selftests: vm: add process_mrelease tests")
Assisted-by: LLM
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 tools/testing/selftests/mm/mrelease_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mrelease_test.c
b/tools/testing/selftests/mm/mrelease_test.c
index 64e8d00ae944..a5124c9e9f43 100644
--- a/tools/testing/selftests/mm/mrelease_test.c
+++ b/tools/testing/selftests/mm/mrelease_test.c
@@ -157,7 +157,7 @@ int main(void)
 		 * Retry until we succeed or reach MAX_SIZE_MB.
 		 */
 		if (errno == ESRCH) {
-			retry = (size <= MAX_SIZE_MB);
+			retry = (size < MAX_SIZE_MB);
 		} else {
 			waitpid(pid, NULL, 0);
 			ksft_exit_fail_msg("process_mrelease: %s\n", strerror(errno));
-- 
2.55.0
