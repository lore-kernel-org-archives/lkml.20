Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500925;
	b=Y5b+i6BNI+XXGPrFcZ6H2OWNKomLgsHAU7dzqvCWtGrFTU3iB+TmSqRh6pdlVJCFgl/0
	 8Hum2NqsonDVapc/aPTR7JP+Z5I2XXUHF4FF8sY+tugLHtCS1eFZ23MurCAqUaTE205v/
	 IboWhGCzDWnX1JC1M1cvUMay5vbAWPvNNmTEuJBMYmRdZiZy0lUT/EGJcZec4zHYCHhT5
	 xP2/6MWrR2bJypJpZj+E9v96n4P9UIU7iakw2TXJF7KfWdZxhPkYHSOpWOzILdg1LZx7C
	 1jy5AZ89VTGFawsFKAM8GNTiAAYYxPUTb390tTloaXqJQ72ua2CM5FMX2+duNdbwaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g3zSgk25+dSzc9MZqwRuimMHn2weVVMqUHV6XSLUFqA=;
	b=5NQ5CqA2EROA6cmoQ2SaLLAYmLnhBpk0Y6plD37teM9yjFCuIGjaqFhwwaGGiT8idBeq
	 hdVOV8hPQiClR5M+rUNKPeWFfZ02rBAkk8PSl808wzNLRJuAMIRplSOodUY7Oi+yOZsb2
	 Tf23mSJTGnMAY7njHeX26EOozyq76zUWP3pwfowIdBZ+esh2jBzf74C/G2KyN+P3+kSRo
	 O/6noc/+L9IZ6oV93rBgVab+bX+TgbRJ5BXH6EQeeK7eGu0+bDOFYsLC/V0V36wwneMBT
	 T7bvy0EoNMjRgLMR7+HsWBW0ejqXbuvFSHU74do2JEupKWPRVkpbr9xrpizCGpzRIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HMvquMCk;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D61606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HMvquMCk
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so625234f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500923; x=1793105723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3zSgk25+dSzc9MZqwRuimMHn2weVVMqUHV6XSLUFqA=;
        b=HMvquMCkGsqsWd9+9jAvPwXLkDQ4rWwq8ng+SwMEgTGSTiCbqbuIBygghD9VPVL0MX
         VYXNi70vkk6rVIENVfAmRCC/l6MVmBw33kNmyF/pvvZQk4GFQrQ7cxHtQ+Wq8RbViWx3
         H5q8AK/CQ3Mkqn80+xNENuH9DXghpMewKI6p3kI7FN9J9bCZxu/6DGLF9RO1lGs1xVQT
         rXk/jfhzgdyIWYq9K8RIkgZfbqKu3tQrnrCbP6uLmcFHVu8sIznRl5eIy8y+BnUEbTK6
         x4yMQ4FJSKBb5RyYxHNw3HsCrNOU/AKOVPr4Wf5lLYdCSGrHzaO0td7aHxvWhCmAgFCb
         oPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500923; x=1793105723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3zSgk25+dSzc9MZqwRuimMHn2weVVMqUHV6XSLUFqA=;
        b=jfObMN+cLFYFR+sh9yk8kP+xQVofOLgyETMqurO4H9jJjBXwsN4xRO7s3eFRvVr4D2
         8lXfw3mfTO67j7s/+D/aPv0yn7lCb0vfo7q2XuROD61rZ2nJUSN5D2zokP8Y4Gdc6RX+
         1gUfpaj+xMZCZ0OmsoITjukKFdmEmxYaS4mNDPLPVOH/I/KUYV5A8qUgFTkJwpXEL7g5
         eSEyS4Nt+gCUADKt/SaXdxoRej4t8XqayGzBvw9IozyiZSJ7F0zseOKcFXPCW/3vOnia
         GV/tXHWVMPGtWLLeeuyjejqKSJuE60uvBu0uHDnhLzARbnDnGOWXAoyryChf1pTN8BQP
         6LeA==
X-Forwarded-Encrypted: i=1; AKwUvBy9dI40s7YCLHZ8e+rb9R9IB9YuaZ7DIY4fo7H+Is6MD5bKA3ZZaIjmVfa9sjMHAdXDWPSH7iphxoJsoVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOtU7ad/017ykMezOt0hbqoe4NgR8LEUBOhJtOZWXt6xi9QkJ1
	JW1VheEWjbtIn5rnxHsTiqgWqSW4E4HRPWZ18BODk15wi9QBsufrY3BW
X-Gm-Gg: AYBFou3GTuthYSnDnhwjzXPONSpiUQiGdD9Xv2OwmpDl0I4JnIKUMIsY2rft9w1vLMw
	Mm2QU/yE06lcv4tnsUE2L4rMTqPCkjh91eCrdw9XfGmTGB4baOSLeHmhSyoQDua42AkniWn9843
	bPstBSMprHWwTXlaMEvylsbOV3jz2qQqqsTD8GICzKiFXAPj9paTBjlk8t1u4bNM0osQAvPg1rD
	Ztwf4wastj6JG+IvHQGJvJbChsQ+YlFCQtspTp1PFIz78eD5TSSYCXehSyvdn9sVdCify6Xomyk
	tDgMMWz58Cv9RfXwB7jUlitYGSRrR6Ne4nWmZTe+B6N7+Nkp4+BLn+dSFWQsNV8nLwRFO1PpimJ
	Ewdfhc+aPdWLA/nvl1jGOHwBM0G9sGWy1CpjTS7Zn4hze5dUF11ZXHUyxk5oSe65+6JM92XkQNm
	wCBuJPbv0XeKXkiIZWBU7caJ/fTVay/V0/+0faYU84X4efzgooDpu8oFi39gnuXwj0//8RB6jyG
	aoODtq5vq2o1f0=
X-Received: by 2002:a05:6000:40dc:b0:48c:7f94:8755 with SMTP id ffacd0b85a97d-48e1e76eee6mr4911073f8f.20.1792500922772;
        Tue, 20 Oct 2026 05:55:22 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:9306:24f1:3e60:eff0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm5773885f8f.40.2026.10.20.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:55:22 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] kthread: fall back when no preferred housekeeping CPU is online
Date: Tue, 20 Oct 2026 15:55:18 +0300
Message-ID: <20261020125518.1114230-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kthread_fetch_affinity() falls back to the housekeeping mask
only when the intersection with the preferred mask is empty.

If the intersection contains only offline CPUs,
set_cpus_allowed_ptr() returns -EINVAL and the kthread keeps
its previous affinity, which may still include an isolated CPU.

Check whether the intersection contains an online CPU instead.
Fall back to the full housekeeping mask when none are online.

Fixes: e894f6339808 ("kthread: Honour kthreads preferred affinity after cpuset changes")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Tested on x86_64 Linux 7.3.0 with vng/qemu and a kthread with 
preferred CPUs 1-2.

With CPU 2 offline and CPU 1 isolated, the unpatched kernel kept
affinity 1-2 and set_cpus_allowed_ptr() returned -EINVAL. With the
fix, affinity changed to 0,2. Bringing CPU 2 online restored 
affinity to 2, and removing isolation restored 1-2.

 kernel/kthread.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index cc8cb5d3eab7..fdb8fb07f40b 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -343,7 +343,7 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
 	}
 
 	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_DOMAIN));
-	if (cpumask_empty(cpumask))
+	if (!cpumask_intersects(cpumask, cpu_online_mask))
 		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_DOMAIN));
 }
 

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0

