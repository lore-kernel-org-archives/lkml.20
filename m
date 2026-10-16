Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F866470EA0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145719; cv=none; b=L4BjWR5kLMnW3Te8IrGOCrQ8yVV0IZPqRgS7sAP+IJlrhT7DSqFMDXKqR7cwF/uk4reU79rN35gaNryPhUJV4rMO6dO1YJBTFjvH0759zy5obubWnyAOeRVm1tBxIu8VRZHhX3t1He82C7JjVJp2egEkVnKm9JDXOc8QHXQCSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145719; c=relaxed/simple;
	bh=D7sxvwTQORDG9UZDgAwID33nx8Gdqdcm0JU1TwJ2tdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3RWlNF6GguFMaW7mqMJhhAGlAsF2fIKFFZ2jqgZhtpV7qvPDFYlhf/nnTucbbp03eyufKriUgb2y13qgRXkH8BUqQKtDeJTQW747ZAxBJ2+x6EFKBivRwT9FVPDg/qoz6hHVsl4qYAT8Bf5dSkSAqqZr5Q9+kB+KRIUTHM2tHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPGiuZEl; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPGiuZEl"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-17bc533fda3so3192513c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145716; x=1792750516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsEajUbPO5LI3z3KVxIR8CEQ6sxYOQ2C/IR/YdstWrc=;
        b=mPGiuZElz+S6Aypjve2nCZ82notXj4Ady2f0U472EXWutdT2ogsj9MH9XnllSSerde
         fbVcYuM2P915+jkxDQ1cE4qoHHEBV3Dkhpto7ve2Dqwkzhakd6zkYswOyXJTZ0Wxj3Q3
         V5zsLI/GgJFyNNj4qaUJVHRdGwb/JLKuPZ5kT/OmniZ79vXmLtKZPTzeSMuvk7NRP3Jk
         FMSA+iMUwvPSuAHmlrc3/Y2j1aJmRgxuXno5NSAFa2wyDKc2Slwx7Wa1N29e4rBsAaSu
         L9ORGPhCH9kpdXYuI0xwLrRDvQDgvdHV/HhHqp225c1HZLJU4WiES8yPI4SFXG0fCkW7
         vQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145716; x=1792750516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsEajUbPO5LI3z3KVxIR8CEQ6sxYOQ2C/IR/YdstWrc=;
        b=h+agxQDj2UCsdbP1j5DzNg/nXkBpRSsmtrRJXje9zqfmdtiKbf7t6Y7Hwppdsawpsq
         YpXDsR1p+1LeNzytLYuLV6u7UH7B/PK7Q78cZKm+nNRy/3MqvqAhMS5rQOWRQIFiI3s6
         QCEpj8/e8UtD0g/74+B9Sa+nAk/+imy+Obp6Ak0BGoZLErM41D2JfL2rJMFiB5p+2NNg
         TlTrW+BkmeHlr7Q+RGWt2E24LRIhIC/jdpqoIYVxvDEKC4PDgbcKg+Y7ib7exvfDDdXN
         8V08Oaa2fXrYOjY2AMuyO9xS9uVwWmU+Lqk8Ty4QeYgQ6GbKjQv8AuW4FAa+GDLiKh/8
         D4rA==
X-Forwarded-Encrypted: i=1; AKwUvBx9p7pnqFBrWYf7/qUWn8VgsWFnh1bKurtHowgMGUNqXTk202SCwrRy2UdIFVuteP5vc0YPnMsQ9lQpyRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Nl2wj7J1buGo3BOigBFWgPUD6tTNdPzh1Pl1Q/sbBtFlALfl
	eolXv8c5dQdf+eZVmcgjLGeOW6U34HqVYSIX+adiFfvh5IH2LpkhBm1y
X-Gm-Gg: AYBFou1PcoWNHrfuymR98LYrk1+KidLnTv6OHvohKLi8OIgc82xfuHOkLLf1xc9TsO2
	BHmRnsk+l7yuA/kDvJ2/K+X0z9j7JDA1mCo9jCtLEHYn3fPAChnCIZbGYQOkdbWvmFT2NyTIF/J
	B3B2NtcDUr7qOuvntGVXpWbSJwlup/wasVE7xhaDG3T45b6N6qTy7lj6IlEbaJ/TVk+sus99l3h
	w4BXC8tTgbFx8GsfxJcmmMd6y5D1k+8F0D5+j0MkizjSe0AGF+/yvJrA4FHA0JbC6zPbUmQ6A/K
	csoeaWJP5ygs+rlvZ1UHSBr5+7CdHHIbuzoZ4csjXHmcCrKEEMcUCjygJ8w/2YuoEvhI7jkGxbP
	HiVwWDdLSj00DNfZL9q2g/Zfo3icHwdmlzC8rpQqr0KNqNeCjNzvMi7O36tcqdheCjrFU1RH2wn
	8ksQp8nJnTjccs1lQUREPpcYlnG3z3SqUHtnLJAnAwws8RYTHL/WTvMRQQkM9tGhz3HLoK1jtPs
	HyzbzuC2jTgcisaE20hXe1+8+39UCaMpxOxiLIRFrG+kaXqjecqFp5qsAZ3y74LmKK2ddBU
X-Received: by 2002:a05:701b:4281:10b0:184:1898:adda with SMTP id a92af1059eb24-1841898afaemr832160c88.44.1792145716297;
        Fri, 16 Oct 2026 03:15:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm4294724c88.8.2026.10.16.03.15.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 03:15:15 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] HID: hid-msi: Use str_true_false() helper
Date: Fri, 16 Oct 2026 15:44:58 +0530
Message-ID: <20261016101506.14084-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open coded ternary in enabled_show() with the helper from
string_choices.h. Gives Same output, but with one less conditional.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/hid/hid-msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 3225d3bf6..4822b5d6d 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -28,6 +28,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -1586,7 +1587,7 @@ static ssize_t enabled_show(struct device *dev,
 			return -ENODEV;
 	}
 
-	return sysfs_emit(buf, "%s\n", drvdata->rgb_enabled ? "true" : "false");
+	return sysfs_emit(buf, "%s\n", str_true_false(drvdata->rgb_enabled));
 }
 static DEVICE_ATTR_RW(enabled);
 
-- 
2.46.0

