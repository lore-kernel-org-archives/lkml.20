Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709BD55D882
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084714; cv=none; b=BAB2LQflgDymBVCqi/RpMyM7m8RLrMOPOvdWOdLfLExT0Rd8lc8NFMl8EchZVPkCXPGbTJdXSDCFQ1123BYTM4xZIAAHbNojMoGEX6MaWLaEB83ntWOxnMykDWAnVuVBYIeze4FD5BSVc8GQMwD1ZVYGVNUvyT7O2HqeqZVyRqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084714; c=relaxed/simple;
	bh=I5Ur39HsqT6WeE3BnrxrMW7SOD/vom+1FTMZtowBYM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tGroBdtBsEGcZXdyWZlbI6xCR/YEcEKZ3qcZfUT61btog3kdySpOfAn3t9fTIaRcuV1iELS3PWCZb8pn+KO++1g0oohtKtZ1csTvkK38FhcMDXtYMcSR0v1chXpVHMuRIwxN64Kx0saFCINEMYoRCr5d96bHYaatcBAQZAm7/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS05rIck; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS05rIck"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6eb11e9cso9148035e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084700; x=1792689500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpuLMD6iQzc1bzNNihjv73gE3OjQ/PX0ITyufY5za8=;
        b=XS05rIckQK5HnuIE2EK4slHSDEgo/FSPmnqCMi6M9Rtys7FIEuoy88Dp6VHULu2pWt
         1yw4F5X/VwlJL4vuMATyiLlL92mB6lnrBNMvF3RZRMOTQYxpp4W1JsGx6/zmox6oD2dK
         9eSRGTjasU+VN+e4+rGSCMLC0qQmGU6KAk+Cg8VMOh6EBI5tSfYzl0H/m66HsEGHW0/Q
         NDixzerrQ68hlCkVmXZzq2vYDoO2lKkYQ47TrqJMRAM4sGvuQ0nFG5YHyygAhwYH/ex3
         Dv7EMgHcJ0D5jsL7JJ///Hd3z4VgCdMuLD7FkM0/gbpm1rlw1u8j4X+D883DmrxO2Yyv
         3b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084700; x=1792689500;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUpuLMD6iQzc1bzNNihjv73gE3OjQ/PX0ITyufY5za8=;
        b=h/6iJk4Q6hprf1KSID+bylEW29tAUPxU3gaT+tyUZnD0p5zapLfkpKclbGki6xnfYm
         x0Ny6rphlhu9ydEVy9hX2cyl3T7+abE5w0Yuc9WEu6/yX9iMVPqUBohmQLsF4WATn1bC
         4pL262wiXcgnRsxMz3efID5VXjBVn1T58if7zRp//AA43lVV0PUI3FHGTIy5GiNbeIBo
         7TN5+ad6T3Lg5mVQ1+K4bjgnB/tGz6voznwvTGfNOgnuwRljK9jNghPV+iOQf+l+CSah
         97qcS8dfcZzFFJ6oeSdbX/OeEQpmmF+58dscO77K2JGTupHvBrFpPvr0wXiWgNsqHgkk
         r0Cg==
X-Forwarded-Encrypted: i=1; AKwUvBy/wQJQnFVMooS2n8Ge3qmBeHiLfA6UPrXE8DWRsVs2uSlHFQ40Z7kYI3IQdstLtZdaSsXNX8L5Qa5LRs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWcw7OYe3yE1HyQiKvBcU1qkUtMOqBVQsKUcpa+9q+Jrne6jyF
	719TvKFBXIZPTyti4MGSQEvrLaGZfq6Th1bv+Xnx7VZE7LutgpdRUrMrAofC/R4cwq8=
X-Gm-Gg: AYBFou1Z5MycSLt0TUpQVtFI5JdN6mBefm04VwTYthCBUfQao/1NAJ7t/Uh6X2qKJqM
	v583Q79rYZZVUf/5pgG8ZYdL/JfwyolLnIL1zjEb8uUG42vQjHZrdc9/M9LqB2Vxe1GFLfoL0PE
	mbga/hVZh0ffUrMeUvxC0n82BRAigDobjHyZZSMIpe5RPUZFZyFIDNKySSH7iiwAjA/Uf2p+s6F
	o1wwEbtdpbMbsKY0bWh18A6JUmUXB2M74VnFf5K57DiThtD1qjqC+U8VJ/JMQNcABl3puc6SlYC
	hMr/jJj6KF95ff1aVTJdg4IByGMkj6AR45SYUIxXEl32sjow677cE3RtIjolkFJSvD6FO80nhP2
	YcU/Dguh/0KLHUuAooLLDKBJIZyK7WG0XKmPS6eQS2XEvOY7Jgbou4Ba9zlkWWBqIpX7uAMUN2u
	h1jbjKAbDZlGZRVeKBvFuGBTwhPmJSsILofdeEHt4jNNK3Jw1/gba3fdboAJz13u0=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr387691725e9.8.1792084700107;
        Thu, 15 Oct 2026 10:18:20 -0700 (PDT)
Received: from CachyOS ([176.88.124.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm123820185e9.10.2026.10.15.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:18:19 -0700 (PDT)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Document sysfs numbering and label meaning
Date: Thu, 15 Oct 2026 20:17:59 +0300
Message-ID: <20261015171759.704526-1-ycistak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The documentation says that all sysfs entries are named with their
core_id, and that the "Core X" label contains the processor number.
Neither is accurate. create_core_attrs() numbers the per-core
attributes core_id + 2 and always uses temp1 for the package sensor,
and show_label() prints topology_core_id(), not the logical CPU
number.

The difference is easy to see on hybrid CPUs. On an i7-14700F, the
"Core 4" label is on temp6 and belongs to CPUs 2 and 3, and the
E-cores report core IDs 32 to 43.

Describe the actual numbering.

The mismatch was found by an LLM comparing the documentation with the
code, and verified on the i7-14700F above.

Assisted-by: LLM
Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
---

Notes:
    The LLM (Claude) also drafted the documentation change and this
    changelog. Values checked on my machine: temp6_label is "Core 4",
    cpu2 and cpu3 have core_id 4, temp1_label is "Package id 0".

 Documentation/hwmon/coretemp.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 34930168338..95b0a578c4d 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -46,7 +46,8 @@ mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
 the Out-Of-Spec bit. The following table summarizes the exported sysfs files:
 
-All sysfs entries are named with their core_id (represented here by 'X').
+Per-core sysfs entries are numbered core_id + 2 (represented here by 'X').
+The package entries, if available, are always temp1_*.
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
@@ -55,9 +56,12 @@ tempX_max	  Maximum recommended operating temperature (Tcontrol).
 tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
 tempX_crit_alarm  Set when Out-of-spec bit is set, never clears.
 		  Correct CPU operation is no longer guaranteed.
-tempX_label	  Contains string "Core X", where X is processor
-		  number. For Package temp, this will be "Package id Y",
-		  where Y is the package number.
+tempX_label	  Contains string "Core N", where N is the core_id
+		  (X - 2), as shown in
+		  /sys/devices/system/cpu/cpu*/topology/core_id. This
+		  is not the logical CPU number, and core_id values
+		  may be sparse. For Package temp, this will be
+		  "Package id Y", where Y is the package number.
 ================= ========================================================
 
 On modern CPUs (Nehalem and newer), TjMax is read from the
-- 
2.56.0

