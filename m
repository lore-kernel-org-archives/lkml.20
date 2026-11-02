Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618123;
	b=aQJvrvUjmJX6WO3J5tkYprTfJl08RZ7jZqylTQ6UAWLrq0LwxmI7KEJHZguIQa1dqn3C
	 GpO9dfM8WJGznZu3WgCAM4k2lk0heTKgAB4RmZJ8EAVwwWamIGNQFUmkSU/OV3x/gmt3W
	 z5s36z7BcKBnxawD3654bjvlvdVNS+3FkOYRSTXrcjnV3ccpcxiGQFxTMznOv99ZrLb7Q
	 diID6tFojpmLKR/pbMAhpozzNnBFe3mMDn/8CQCk5+WlDDrKBKAE+2Mn9z6IhARvJqRt3
	 kTdbodSa4T7bq1gZOuPsxf/67wIrWlECd63Vb9W8J/hEHHQUZbD9KHz4xka9drzal9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cTvnOBZflM2IscRsh4AbyC1GaHTZfi0eh+Zi2CPUvg4=;
	b=QMFc7VFlV3yW6wqSHZFj/6H55fH6PFSPoNMwePJDySbzNidHwEoceih8c4gPexHyNOde
	 p7E1Nz81izqOaqer9yxEOtoesgJvbXo1CNIbbEZInIOHL8lMW+HUUjGaKZHpj3k1J0WCK
	 TLkYTkoCuxeOmVDYTDV0+/r9P5OV2zu2h7aqsTuDFWGneElwkcgvy1pic6lXIQqtZQHtS
	 TI7OYd9sXmmxAhmaXwchobKhI7JAW/ZHTyHKspbHG2kmJPKjeqHKcOtTLF/oVhRVTa4zT
	 2+Dlrpojf9mLoGuxSI5tu5LnFHCl+HIPflnhqCf1nhq7gFtr+oaB/y9GVsEAxgmfeiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6lut2YY;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52023606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52023606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6lut2YY
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1339739f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618122; x=1794222922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTvnOBZflM2IscRsh4AbyC1GaHTZfi0eh+Zi2CPUvg4=;
        b=c6lut2YYBn3JoXf5AmrM/9BdoOXbtXfjXWLIpzGzxvplmG+mqS3PCXx6TYlLmUmGDv
         GdQ/JuT1ddGrZJ/lmbbi8z+IgCROSReJ3Kcof+RsLVnoz7m3lks0Cv43LWC/ognTA7Pc
         fYzFzdctPGwwajrlhv7s2owwE4+Ga+rp+iFcVDTcOX3CyiSj0gEzHSoUYTWX3zc0nyYh
         UPvSMdJ1Wm1S8+rarV104pXryM2+tnQcYRc9XQWmi015eGlkAbYOvJ8QwHbB1Ojgy0cM
         OdNaryzyHUhzLKaLp8DOg8J1w7bwA5lxTJnva9POWtZ4SbwYQGA36f2T23896HiDn//D
         Gg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618122; x=1794222922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTvnOBZflM2IscRsh4AbyC1GaHTZfi0eh+Zi2CPUvg4=;
        b=U2GiDQSgVCxA9kWWP61l1ZbaNtRYnUstprZ735MP3PM6BsquSsAfvJ52RTFfTGAIoX
         rD2QIzrqqgm5ikLRI91PEufxyjpFX4Qd58ZlYTR0ZzEYATJrjoDI8rmWPncHJlZl9v4/
         WB9IkX3xBsh4F9jn60PDInpbnCr1pL74FFhqX7JWhtuoHUJrKQ1SzE/w7vygu5GNObnb
         JC1WKIg7gsYyCP4kDgyTeQEyxGFNw6Q1lNnFruxXTED0TmTeW35ihjBwELUamTUhEeKj
         FoXwdfKSZs3jnQ3msFKsh5FY3g0YF+9Icqp2B3sfjqABwzv44p10uOIdoyKzoDBbc2ba
         VF1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjFw06I53KpULWU9z3zkK5qa91bMJ3B56AbrZQhkQsj5GJrQ/5lOkn22ZCimTEjamnkKNEEp3XEJ4b5ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fy/5dvY5tYo0lEmAJflX4N+zCH4dESsK8P4kdN8Lp7uX32sIU
	Cfr0JJNEquadl+5TdMfSZPAr3DxzdVyGaKwu+sXkwTZ+a9oENRJ+SUYo
X-Gm-Gg: AYBFou0cu0/q2nlIwVC++vkvC+1QWPSKbUk2L0mqWm6/3AQWp0uDT4ymHrNvdXtoGC/
	M35H+MZBeX2MN/qrXMYchqYXc4HEMh1+3lphJWVjH8QmNIcCY5ZhyeXMNLKUbqnwbMNXGs/XDjv
	jl38gwZdmx4DH+PfJbZGbeDbxWkICp5IoW1aQ0xXtJwmH97b+GWO888XAZ95329gDbvh4m5jpG5
	CH5Ev9YuwsCVscg+QozgDdN7Wxbv/2sP11krWU3SdwtnjxgQZpD3SfRMXoqEZDOSZNHwSemF88z
	MkCFSD5qGg+zERXIkz9FhFtTNwPCvgiZz2UFvFw6GC+t3YRmUHp8DjCkqj2+d0YmS3JVaRwXhsF
	UPGfQPbhG51Pu9jBUS1w3gC1Hfto/7uLT0gNmAhKe9GPlSomVk5hF7KR1WfMoY18PA1rJXLl70b
	N3ahdr7ypl4S3HbkeEW2V1FtNREZiqxFqOUy5PrkUekt/7qv3V9UwlncM8K48QgNI1DJINqZSBp
	N1EZIWpfF9L2BVa7OOQpQ5x3Pv8KYUAEQjbcqHR56u6oHxgqZ0wNUPsJs8Df9zQ1jOj6rGi2aIG
	cNw8f0rcna+NOh5MiD/uGhmwf8xlWw2iFHwM1Lq0MhwYAQ==
X-Received: by 2002:a05:6000:2085:b0:48e:7a41:d78e with SMTP id ffacd0b85a97d-48e7a41d798mr11829527f8f.19.1793618121511;
        Mon, 02 Nov 2026 03:15:21 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:f970:5a5f:bc55:da4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm20525955f8f.37.2026.11.02.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:15:20 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Joel Granados <joel.granados@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] sysctl: Fix large millisecond-to-jiffies conversions
Date: Mon,  2 Nov 2026 13:15:17 +0200
Message-ID: <20261102111516.1398262-2-thnkslprpt@gmail.com>
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

sysctl_msecs_to_jiffies() compares the input against
jiffies_to_msecs(MAX_JIFFY_OFFSET), which returns an unsigned int.
When the converted limit exceeds UINT_MAX, it is truncated, causing
valid timeouts to be incorrectly saturated to MAX_JIFFY_OFFSET.
For example, on 32-bit systems with HZ=100, writing 2147483647 ms
stores 1073741822 jiffies instead of 214748365.

For unsigned long sysctls, values between INT_MAX and UINT_MAX
are passed to msecs_to_jiffies(), which interprets them as negative
timeouts. On 64-bit systems with HZ=1000, writing 2147483648 ms
stores MAX_JIFFY_OFFSET instead of 2147483648 jiffies.

Keep the existing conversion for values up to INT_MAX, and use
overflow-safe, full-width arithmetic for larger values. Clamp
the result to MAX_JIFFY_OFFSET.

Fixes: afdf35cfae0d ("sysctl: Fix type truncation in sysctl_msec_to_jiffies")
Fixes: b96b5c6708ea ("sysctl: Replace do_proc_do{int,ulong,uint}vec with do_proc_vec")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/jiffies.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/kernel/time/jiffies.c b/kernel/time/jiffies.c
index af1c69bf0c23..7b02cc7de15e 100644
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -139,9 +139,20 @@ static int sysctl_k2u_int_conv_userhz(bool *negp, ulong *u_ptr, const int *k_ptr
 
 static ulong sysctl_msecs_to_jiffies(const ulong val)
 {
-	if (val > jiffies_to_msecs(MAX_JIFFY_OFFSET))
-		return MAX_JIFFY_OFFSET;
-	return msecs_to_jiffies(val);
+	ulong secs, jif;
+
+	if (val <= INT_MAX) {
+		jif = msecs_to_jiffies(val);
+	} else {
+		secs = val / MSEC_PER_SEC;
+		if (secs > MAX_JIFFY_OFFSET / HZ)
+			return MAX_JIFFY_OFFSET;
+
+		jif = secs * HZ +
+		      DIV_ROUND_UP((val % MSEC_PER_SEC) * HZ, MSEC_PER_SEC);
+	}
+
+	return min_t(ulong, jif, MAX_JIFFY_OFFSET);
 }
 
 static int sysctl_u2k_int_conv_ms(const bool *negp, const ulong *u_ptr, int *k_ptr)

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

