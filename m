Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235135;
	b=3UEroaL4ms8PJM74iYXH27fHKEyGvNGcp+nr1vAsLYlnsvCKKlVb1o9kaWCUB2r0RvQa
	 v7Wap18qr6EIQapYI/NWWhYVRlxaTjzf5RNveYCHzGxHKBBL0syDvL2ZwvCKIHhrtNzsf
	 OgcYg6BE6nZ1d6cB8Z3ja6fZg4UlCdDxAi+4866INeQbYov0iC6NE9o/40b4wuLgzNBL5
	 o1wBR1IhVWvhstEjBgi6BZJJc+FMz9l6pT5l3rmMMAE6yiT83y5KAvg9wYUF/na5Yot6Q
	 QuhIrrLU8FI0FbbnPsYSVgbGKzHLMAusYsTsYcjxc497z/Blp12jeyjL0GiB+hy4rQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MC7laDpFvD5HoSHVamTEOzw3wKYCyM6X0vAnuJqfH6g=;
	b=0WzOuzM4d+lwmO53uOTIWh+XTzOVAqOR8fPqSSQyEsDiTiv3Pl0bD1Wd2KkbcYlz6+k7
	 tbogaA8I4/kzSrLn6gv5ovVCeANCSRh3IB6KkfvxM6CtLhWC8QvdguiqdOXXXYmfZ0Sdb
	 +VhSV6euoUynVqQdSRz56fuq2IL9+oeX2FBF+MxcfWTsZNHvED0Ymyf7wTenuMr9ar/ea
	 loZ/qiw4ddcgMvf41t5IxSogcbg0n6M1VbaMih1xpg7KOjNgzczAgkqBNU9vsw7o756II
	 vBZJauY1HLXhIKxuzE+f30XBUVE/D4Eako78SdbjRgUnki2VfLvLDTgCcUKLyOKAhng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eTvgiOZ/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216A606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D216A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTvgiOZ/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so9485145e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235133; x=1794839933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC7laDpFvD5HoSHVamTEOzw3wKYCyM6X0vAnuJqfH6g=;
        b=eTvgiOZ/pHqWchZ8MLiwLCevFFiWQnhXTD4d+GtJ4VfIvMzwa22uZdnci1m5e+vR6+
         9tdkhoLWg+9FZBlqjB0WgZBXvVeRAyiI82xuu0Sg47Dx06Ki7CsSL/XXmBwEW+6ZWRs7
         jlHtw908doAoCWrtLaJRjVQ9fgLoTIbTJa/xPoi1S5ZuIbX3j6h7kaI6RRvaeQJGo/li
         SZYY57irqta1DaJDDQxUYAWnoeVvKq+MExpq/AfO9UfuIgIyip7imUj2QEBEpBdfAxcI
         dop2cRxEKgeAt0drBTIkXi/uCAtzRMfyJUONtYOrkV1wivP8BpwsSJUzn0OFj/1rLBbg
         mFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235133; x=1794839933;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MC7laDpFvD5HoSHVamTEOzw3wKYCyM6X0vAnuJqfH6g=;
        b=gADU7p7RuPX0PcX4Vm+mbspL4T5LBMzkeHXwkOVISGR8dq8V9FQbIucv3iLTQ39e02
         nluiFzmxssCfoWgDs3misTR0cIsjOWLFfClHjG4TixgfoT1i8Jsgs8M0nOg9i+OiBQpH
         H3Go9Jrxs1q1I3B2pTYbPJccSXNs6J35B+0KtnWSdF9V45Rn7hqJmAboVbnbH1z0M5h1
         ZW603DNB3rDRXd4KY0GIkeU0cHRQFwCGwRRd9e2O1c9XdBcjyYxeWvkZ5Rmx7/fK8M4C
         FJioRkFQQS9gyOUWZcNXvZTJqNBVCYRSHQqPeyFkVW+bso3jwsfaZshS4CH514BcAHiw
         Lfaw==
X-Forwarded-Encrypted: i=1; AL+hErFbNiJhK9uVWyaD28Xd3T3RkxAn7EB5lCkPp3y9hexI0vlK0ldcgeQNtxaIrnKa70gXf+FmQLzJ1hAS4mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/StGqSMp3CWq3qvkQqP3kf8qZ8WesIVFa2hxwrfUlB/K59y9cw
	R5b2LUPC9DynxLla+KzTRzUAGLe49udMZCgGc4LC5570In5CbtpVXM7R
X-Gm-Gg: AYBFou2QslrWHHyqtWZIVBIFxHzhmsDrh1/6xzxzIQqhJxYnJKfuGwIKbOPT7LPais+
	EF0SuFCe7+CHSmfpri1z+GeB08Ik1/n0stlmROXDVgQaS1gIcM9aZUmmMBezhCFhIfnY5loTldh
	Zwlysa6ieDW9nFW6SfbRtWIFHCMnyVbw5TkguhQQ8VbHxtoEH5lSsZ4gVJr5momSUd5W/HQ7mJ9
	uzz8UsgGGFq/5CQbgtjavgNthmnwOr8cT+M1ih0Kp8N4YjKJz1/fHqESGFgJKFx+ptN071Un79i
	/KO6b7tsgQDLVL0vnsMyFP0l8F/5GyD93udH7eAAQgWpu+5heMh932PJNbSLCWMB3MnuGrhloIt
	mG0slHg8UDsKeGxMoesE9kMDj29yfzuEDHkP/6HpMlk6b6CB9I5EMeADExHoVroSP8fUuVNPPkz
	6AiiHO6nCktHHQAlcczKFbesvaxAwXwl3tJh1yVFVTK99tzdEpveWrfkxBc4xcmnx6BjQTldHYD
	PI+g6y34n1RiVASOeFR4DFCbdWfBO7mjCAJgbCGDsROsiirnmf54z5ibVic5IHKp+kqxUEDZXcB
	75r2PhnfZ7etN53eRlA41f4+s13W5qXa3VxY7sVEQpE=
X-Received: by 2002:a05:600c:4e51:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4b94d763136mr81000455e9.3.1794235132952;
        Mon, 09 Nov 2026 06:38:52 -0800 (PST)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb76697sm142009995e9.0.2026.11.09.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:38:52 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH bpf-next] selftests/bpf: Fix va_list reuse across loop iterations in scanf_one_line()
Date: Mon,  9 Nov 2026 15:38:46 +0100
Message-Id: <20261109143846.1626182-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
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

scanf_one_line() initializes 'ap' with va_start() once before the
getline() loop and passes it to vsscanf() on each iteration without
reinitializing it.

According to the C standard, once a va_list is passed to a function that
invokes va_arg() (such as vsscanf()), its value becomes indeterminate and
cannot be reused without an intervening va_end() and va_start().

Specifically, when scanning '/proc/self/mounts' with the format string
'%*s %4095s cgroup2 %s', every non-cgroup2 mount line matches the leading
'%*s %4095s' (returning 1 instead of 2) and consumes one pointer argument
from 'ap', exhausting the two passed pointers after the second line and
causing vsscanf() to write into uninitialized stack values on subsequent
lines.

Move va_start() and va_end() inside the getline() loop so 'ap' is
properly reinitialized for each line.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 tools/testing/selftests/bpf/veristat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/veristat.c b/tools/testing/selftests/bpf/veristat.c
index 9622af98dc734..ba4da33043d00 100644
--- a/tools/testing/selftests/bpf/veristat.c
+++ b/tools/testing/selftests/bpf/veristat.c
@@ -1462,9 +1462,10 @@ static int scanf_one_line(const char *file, int fields_expected, const char *fmt
 	if (!f)
 		return -1;
 
-	va_start(ap, fmt);
 	while (getline(&line, &line_len, f) > 0) {
+		va_start(ap, fmt);
 		res = vsscanf(line, fmt, ap);
+		va_end(ap);
 		if (res == fields_expected)
 			goto out;
 	}
@@ -1474,7 +1475,6 @@ static int scanf_one_line(const char *file, int fields_expected, const char *fmt
 	}
 
 out:
-	va_end(ap);
 	free(line);
 	fclose(f);
 	errno = saved_errno;
-- 
2.39.5

