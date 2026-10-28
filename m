Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218537;
	b=K6UVhnZQmxlOedYrkL2TW6swfffmJBcCT2phnn7d8MUXP3S4NWcYNABN8GD6c/kM9jYr
	 UZONhH1VzZ1LaOzjBEUsROSRgik/RqlJCGEFWmYCZDvBDxjNcrgK/dZPmjgBz7nMxEP++
	 v8EPv8quHM30LiVYBO8YIPb1p45zfU7izWLnqeC3P23O6h1ChpJvqlbfU4uNz2i3Qvnxe
	 K6Hx2fvxqfbHmBZYiuAfzDoFFn9v8RZGNzwOgTpELKiwq1kb42M6Kqn+Ncbmzdw9fQwHF
	 3finAEyXpcphTGeJW7d6OuSq9VJ52ntqKOhjTaBK/7PI869ISsjv6vCZtPcGcpiWDAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
	b=0GJHVM3wCUnZd/fyBVjvqSp9NPyFyG2LAY6MPyLi1UitfLM1dr7LNq8WDos3tBql1jDh
	 eCYUvaMfVarRda34ytYWSS6XUcPRalaYsd2lxwCuK4LrjmQeBgDWxN4vJw+eIG6Odtovz
	 UDn+yAcu80Pq9HfqmqdD+JcnVY8Hv1/3RTU5O/VEwSb2JC4WCoG26mDImdbkW42f2MNrt
	 qQMwwfaZ9iMewvyco45gOj8SwQKcOWdy1WrNClkyi03YAqzjH3cWl1wPQZGijmoJYw7Mh
	 xPpU80WXr7QUfTIcuOcV4wP0gjKFnLK1BiYz/vJKpiNjPfExm6beUjeTwS0uVpcHB8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+FbSzej;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+FbSzej
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-833e671ee9fso1446161a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218536; x=1793823336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
        b=i+FbSzejfzILMqfAjiNarm21OmwROagALUavAP3oR87wZHMDqX7/T6gRB/m6O/oaNi
         rM7ou+qYUMH1xfzeUlL8iXedsPQmf/WJcE6owe2RU2poYdPH9FxaQOmI78jnYAWsdaP7
         /aTida9TEZd62eZ9y9vtbqcXW3suKIUkSsRkyFu1h/WmwY9ysk9VM88V2qLDax4dH8FP
         eFgq7IS8QKW5paLAFW3Lkmr/+zA6QHlSzIQk1Oc9KECkKK/KMDMHu3IthX383jcb70ja
         FEwnGxJKzfoScR1+335Iqb4aSw/0wp5ykYUmDvwOUNwT9L9GiVp+sH1zvJZSFsY4shKE
         Mfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218536; x=1793823336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
        b=eGjSBbGZpb/f03rbOBk97FQ1Shx6IICaKUIES3bcf4sO8cCchRzXlivkkoVV8ZoNB2
         XoDOB8sjfKQmircyntF5UgWesjGApYoZRPhRTSvxvbJ1lKRiIOeZOgOcty5KSLTaLEjg
         VQLLfz9bVX8PjQQtnMlJSMnqQDJoG3BUE2+juB9RBMZuX9Fks3VxcoOwlA9ikdRcnQIc
         tQ9k/6tg0yTAV45w1IO+lrvg+pkavUlpa66ts/aEEF4dIPbQXO7niapCus85vhR0zn+A
         GX3O6uKeNADDHX5AJ4G7ef1tqbZWvK8TpTKoENfDMSxC6tLVIs0asmrc/MEMhM7nBo64
         bf/g==
X-Forwarded-Encrypted: i=1; AKwUvByM2qfRPmeyUu5lmx4m70Qvw7LPMRxJC61mTPMIn58rNTE/Lc7LiUL3dDxQu9VN1WXNeIWt5PY/YjAq1Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9XjxFBa9dYSHEcMkoJJJjLZphXIYdgwWdl1QwvHCvoR3mnc/s
	Pmd60RJ/Stu7Wru1x8qH3x6Q1fjDs9uwuPHMWfsjqPbT2PK7jn5L2vHZmIDVd3cZ
X-Gm-Gg: AYBFou2B4/CS95l8nJZtTVgzFPiwQD6wLcDlV8l7tNdW7tSWeipAQLPca8oKbahpy7g
	Kw8BAgBuj5vSBRNes1HuMlchRE6RLlQSRo1hqSM9e9NLL2KJEo49Wc2BtWRzzXJkhGzxqfQAtC1
	GJL+Tmc0bGMBDA79+POkD+HmvyujgAg3RvL6csRqpAhKhhBpHKoKrKQ8SiBv2PCOELr6+5i9a3o
	DwEGs+nIgmauA5A5AznOpN/1+0gowNkyW1C9GETiDBhSYFy0FPPtr7KK61xYKDQDPVHA0ByAJAV
	gOXfvX2d9b//VD2j+x21nC3ri0b8cv+VbVxk678RGjgjf8riUwS87emcBrHtO+G7snyEKqYKtq7
	4RiBZUV0J+H6hvPJaFYTl2AUfsIcb4IP3owUqM90juEPxiBRVMKUOs/N+Pltr56CacYXqgp9SEC
	jp3IaIuPG3z/hOQDnrYhwoGq+m5HUyMhKWn8FT1q5gf6vr6xkma1P+wWkGHQ3ggNKZ1edivE7se
	07mcOTAOHepbt58n9TEQgOhm9cGiQTwFGJbTKLpMaCGchFaxIfyM2LL0sFDCKykf2UPYmArRT6R
	6BzOM4MowPUoQddRuEmRgSAZp3iU0L6EM8dTg6JfSVkFFlyk/l7RtcP063QCYMvppegMRAE=
X-Received: by 2002:a05:6808:11c9:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-56384299008mr2445215b6e.44.1793218536050;
        Wed, 28 Oct 2026 13:15:36 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2219826b6e.2.2026.10.28.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:15:34 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests: firmware: compare uploaded firmware through a pipe
Date: Wed, 28 Oct 2026 15:15:33 -0500
Message-ID: <20261028201533.158536-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

verify_fw() checks the data read back from the upload_read sysfs file
with cmp, sending its output to /dev/null. When the output goes to
/dev/null, GNU cmp only needs the exit status and treats regular files
of different sizes as different without reading them. Sysfs attributes
report a size of 4096, so the check fails although the data matches, and
the test stops at the first upload:

  ./fw_upload.sh: firmware compare for fw1 did not match

Feed the sysfs file to cmp through a pipe, so that its contents are
compared.

Fixes: a37ddddd8603 ("selftests: firmware: Add firmware upload selftests")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Seen with GNU diffutils 3.12. Tested under virtme-ng on mainline
    62c457528529 with CONFIG_TEST_FIRMWARE and CONFIG_FW_UPLOAD: without
    this patch fw_upload.sh fails at the first compare, with it the test
    passes in 3 of 3 runs. A copy of a sysfs file that differs in one byte
    is still reported as different.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/firmware/fw_upload.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/fw_upload.sh b/tools/testing/selftests/firmware/fw_upload.sh
index c7a6f06c9adb..1b234632b611 100755
--- a/tools/testing/selftests/firmware/fw_upload.sh
+++ b/tools/testing/selftests/firmware/fw_upload.sh
@@ -53,7 +53,7 @@ verify_fw() {
 	local file="$2"
 
 	echo -n "$name" > "$DIR"/config_upload_name
-	if ! cmp "$file" "$DIR"/upload_read > /dev/null 2>&1; then
+	if ! cat "$DIR"/upload_read | cmp "$file" - > /dev/null 2>&1; then
 		echo "$0: firmware compare for $name did not match" >&2
 		exit 1
 	fi

base-commit: 62c457528529cdcfa32bc52b331ceca10f3937b6
-- 
2.56.0

