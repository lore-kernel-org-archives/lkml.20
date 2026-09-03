Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C054A1DF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439121; cv=none; b=IBPavnEMbf2tYaq7PpZxyK7I5De+YE+xssGgMMG2U4xA2vhdP3WdU5163kggZGc/lWyqjZQeYunncZdqaMQxuc9OjNYVTEaauJiSY/07YDBdbgb8+c73v8mV9vsSOnPdonqS8m+76X1GvkVVBqvj/gMVptFuCs2NhUXiIV5guJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439121; c=relaxed/simple;
	bh=w7532gPELHA88uMYZ476EJzKWxB14Q6u51dqffu08Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPVKwPVGm1crSLiP8NHfT3OZ7VcGI6IJf4mrYDcoq7CcbV264aKDkauP572od5yyG5sSkgU8zegtwpMd/eXMDsTljXe4Z0qR3rBLp5vFE2QsRXSe/As4yVcpaouiBMTA5RCQX/fksHqIVYQHo7e2ldLtLAAkWse3ZuLd95ICGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEB84Ts7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEB84Ts7"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so2439747a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439119; x=1789043919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZL/5qy3Rxb5D1WeCSPayT4wJDAfxlWxQ3ePUaY0WH0Y=;
        b=WEB84Ts761HfGW+FNKpVfjChiqCgJ2p5YpmKq/OcpqxeuJWsH42UuBIr0RqC6hdRC9
         nhuWtwk93ktvu6dx62/pJPV4w5F0BGX4jxFacTzO8EMOrnQ7PG+9SEt12ZXwqfP0UhtU
         lmCy08G2oTzWw9sL3XBQc8PtM7hLEysDeMdDSwov7cKM1ehZvDYXCqqlBl1XP8owrI5/
         IuYHV6kjh+jFztclAFKYps9DVA5FlvO1IIqpBDfeUgAmXpfPBgELPp20zb9HFxzMWD2o
         kQwT03RQh69J759dKa4R1Fi4Ixbc5c+Vv01ir32aXchqqZSYWecIu+VbpX5jeVJcgasw
         IUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439119; x=1789043919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZL/5qy3Rxb5D1WeCSPayT4wJDAfxlWxQ3ePUaY0WH0Y=;
        b=e8bKhpJpyI7YmNTc6cOLSEYgJwzDuIdHQqk8Z3Dl9pYg9mye5IsuuUZHrNUEo3ZQuy
         SqrWwddrv4gCbxAauJvsAcxznAsUe8Ue2i1TiDakG51AOP2+UlBLpszenv47yU7nTaB6
         w31/4bQ4Acts+t+XTNpLhncWYAZhu2M1cyelHWE+ay6mXNZZq+epvCNPqauPbQ8xj7PM
         rldazdUj9IcRg3Xn8zjnhl9kVXHIor4Ap7zRHBi+bMmIkHahRjVp8FXuNPVtyTP9iOnl
         zmJbq634ORM63z9fy9+yriZJ8Ti4EMmrdaNacICSqctSSo/VInmYGOlWWtsDiwF+yL6u
         0/Uw==
X-Forwarded-Encrypted: i=1; AKwUvBww5R6ARR1WdNYhHbO77C7x0VNdfIJYJ166NFYM1FPhtGOcsK7uscDeTnaE0XqTZCBRWbTYWPs4x3c7teE=@vger.kernel.org
X-Gm-Message-State: AFuF++kGVM1OZGp40Jj2NCXKk4sLlYlJEBJ6O/VgoW+/c1y1Ks6z45Zd
	ycSdlo1oPdSrrVwgb2/JR5QXpbD1KRjO+y3Cl8YCSjqTaDhKfpxw9u06
X-Gm-Gg: AYBFou2s/DfJTnPG5rgSRONupSHOJZrD8FEefUWV4+ra+JUl8MtVl8NZvm4M87768Jz
	nOIp1EDNmaN9nj+jNMV5a2lf8y8FHK3XWcS/Aarmx1HLsiJjrVBnur1ND6+3gqZOLnU8nj4KQue
	/MCm2DZJxGIucF8iosDNDwACBu+4/afECAZH+2DbFjfGYkWR8SfRm0RO0FpkWcHqNkiYmWFuc67
	G8kWU01l8GS4+6HYNCuGstsTHJkL/VN9kugaDox/iT5wNjQ/H174aR+uxiAx8t6D1kdrvr32hgI
	XjszL/tO+XebNhzw5aj6/pgY4j8oc1TmLmPe+Gr1Ocx2P1G/0PBSzy5K67gBCpaKgKgiDhndNDR
	56MpE9fqGCTCrZFdI/ypaJiLVEx3R6bQau9zMyp3vFMCyGIlnB4m3JJldeYrEVT2c+iPRIbeZYi
	uZhzHfpadaq7yXVjcuwzD+zOt4QXEVDxgiGsBmOJnqjOAg3YuGktn2Rg7615QoEqMbq2rUFOAPn
	yYrDpefp4W4u9WMI+9L7VS9Lt0Jxr4p9iqQWqozTOnuz+FGBfz1
X-Received: by 2002:a17:90b:4d82:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39aee1ab4c4mr15866117a91.18.1788439119065;
        Thu, 03 Sep 2026 05:38:39 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832c14fsm5403904a91.3.2026.09.03.05.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:38:38 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests/alsa: Fix the step check for INTEGER controls
Date: Thu,  3 Sep 2026 21:38:32 +0900
Message-ID: <20260903123832.97377-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The modulo sits inside the subtraction, so the check evaluates
int_val - (min % step) rather than (int_val - min) % step. The
INTEGER64 branch below it is parenthesised correctly.

The written form passes only when the value equals min % step, and such
a value is always on a step boundary, so it never misses a real
violation. It only reports valid values as invalid.

snd-aloop declares step 1 on four controls, so every non-zero value on
them is reported. Before:

  # PCM Rate Shift 100000.0 value 100000 invalid for step 1 minimum 80000
  # Totals: pass:660 fail:101 xfail:0 xpass:0 skip:296 error:0

After, same card, nothing else changed:

  # Totals: pass:740 fail:21 xfail:0 xpass:0 skip:296 error:0

Eighteen files under sound/ declare a non-zero step.

Fixes: 5aaf9efffc57 ("kselftest: alsa: Add simplistic test for ALSA mixer controls kselftest")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 tools/testing/selftests/alsa/mixer-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index a329f901c5ed..0857d64c322a 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -319,8 +319,8 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 
 		/* Only check step size if there is one and we're in bounds */
 		if (snd_ctl_elem_info_get_step(ctl->info) &&
-		    (int_val - snd_ctl_elem_info_get_min(ctl->info) %
-		     snd_ctl_elem_info_get_step(ctl->info))) {
+		    (int_val - snd_ctl_elem_info_get_min(ctl->info)) %
+		    snd_ctl_elem_info_get_step(ctl->info)) {
 			ksft_print_msg("%s.%d value %ld invalid for step %ld minimum %ld\n",
 				       ctl->name, index, int_val,
 				       snd_ctl_elem_info_get_step(ctl->info),
-- 
2.43.0

