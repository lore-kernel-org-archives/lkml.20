Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC24DA9B1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062168; cv=none; b=DBzIvGfnv43sv6iUmIm53vgVMS+g/MsSHtupwX8243DzLelx5MUxlubS843WAVehNKxqHKSxrl63KrcELS+Q7lRPawCd1aq2F1jPfIxUvHVw1NzXizKV831DSdGi8HIeOz1gH7VrMYPWCttYzo/1WE6hNYAzxzAUW942SOAYQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062168; c=relaxed/simple;
	bh=iKke+G/eNR2RT5FNmfua7QaFLxyZFtZs0AmBr8q2Caw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUOjnRnEdIbwlJYYA7CWVpKhpTSh3w9bJAmDx/+ocUEd+LlzcIbgqJSufkY6ybRdvZJy/C3VsVSY0DbQ359JBYe5477w/E9dqE3oEoUffIj23vCTgs2ASAbDiW1qZzlXZm+MF+cm24EPlQfKB3JQjvGkTnSj5m7P6o9rmpmu7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUr+aUuY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUr+aUuY"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a75f960be3so22090951fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062163; x=1792666963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbC49oHT8EOPgFnh+Zvmlc3sy+VsXibXhhbWKtG+dZI=;
        b=jUr+aUuYNPuivW6/klbqI2i9rKWxDEngKtSqE2hQnatKTS7NBkG7+QElpJaa54SDrL
         r68t++poclZ40QvSOmQvCaSqNuse64shpY3g31ouZMx6VrsUERBtxJo1Blvy6uZ4ccif
         3o1Z1U80zb0+DRTaWDIXZVLKi8YbZ3PLwT7G+QT7h7mi8mszZtK/ix/b+cGqPRxNSbNd
         wyia7hlKSmyz+9k3m8OdkoMXoZFsvFU4WzmQC0tUN7rVuGWj8dY5Q85eZxFMDsj3uYdo
         gRLy/8o2Fz7MELhxUlgVkqIlkj1pAbXLyK149st6YX6CMfEqN+km7q1oHNy3M5K12nnt
         78Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062163; x=1792666963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbC49oHT8EOPgFnh+Zvmlc3sy+VsXibXhhbWKtG+dZI=;
        b=qmciVzTuJJibg6skG/AZ6za9YXkAmMWTZKrgWG0wNFbEism8aZU1zDiI1U7tw2LXBD
         kzbuKJ0nGnv60BMa0BcgxPckEQ2GH04R9EFTvd4NE/MBdY8WHSxl9p5+yzB5CrMzA+UW
         pjbYLb5eTLUbQcZVBVU/RtmWPSxvzdfPT7VuylAuKw6cpTWENi5f6PZYyI/SnB/JXI8e
         TOXRWtJ8USipTSiTN5yfzg7OuCelXA5kyerKhgDCfpZ4EczYLTHRueRA8JjbnWIbCtKh
         T9frkNKhrgQ+OWDLfRdiFPbWcnvCIKkIbrUHF6dpzkHFbtczMmcRHRgAJeS+gfDt9vCN
         4dug==
X-Forwarded-Encrypted: i=1; AKwUvByF4XOpN04q38yUiAUDpVQjf3NmCPZyJatu8lNDvCxp2PUZw/g5RKZH7GVxCHWB1Ls+8SGRfqgYBVxG07I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR5URNu9QKMrencoGuB6m9gj3WeN1mIZ4gfOLhpGAWE0AD1iKr
	Xnzhsn+8Y9fYfITA34sRZQJgqsW+KOpjpbbvBisRfCY/pCFMnoit/87U
X-Gm-Gg: AYBFou3bDWtOeIhlLXV4ysDPlHe7VUCZMJVzKKE6RgmFlYg9/AeUqm/89P9xW2GHD6b
	f36jc9uG7g68aCiaYl6gL861A1mJoQPG5OZCD68cYBap7Vadhob6CNfnMItVGRR7ibwK29Zawl5
	89eEh5xSkzCySxO3VmaySZfCoNxPOgbjPm7y8WOYkS9jZr5/Yk+jsR6GCMoEgTEsKKNAjtjiA74
	hZvaLIqRN3yir0umrj/wGaTAzId/XTqsSSgfJyjGfPKNw1lqOxYkNrqvdOhXpdRvlRCwMSHj9pD
	E0PRuVdfiFoYrQqLkXFfklJE76GaJcSDB0JJxBg5zMTuDRduPKVqcON/JDm1OKXH+xq9/83UqMT
	SKY/r7bIpzABD6i2K8TCSjLOB66mVRt2YV0lvhRjiE6exZtmYWWwvmdm2WtW3dOYAEc4+1okhUw
	qDJZbwYvNqWIzhaSkTUuAta0215S1qMjAdHTuGQUwNf9UJX2l2H97U/Gwghx3PIZJ/QwJJRV/lF
	/674iFrgVM9ePZ15iHd7J3MDLSZ070x8lEZ9rayNn01Joe2VmI=
X-Received: by 2002:a05:6512:3b94:b0:5be:3f5c:36ae with SMTP id 2adb3069b0e04-5be3f5c3914mr517924e87.67.1792062162836;
        Thu, 15 Oct 2026 04:02:42 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:54 +0200
Subject: [PATCH v13 7/8] docs: i2c: i2c-topology: add section about bus
 speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-7-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8159;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=iKke+G/eNR2RT5FNmfua7QaFLxyZFtZs0AmBr8q2Caw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LLBqnf4VadPYtQtNP1pSSr8b6jP2655lIqvm
 DrCtEdgtZGJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCywQAKCRCIgE5vWV1S
 MnTYEACRfhJUq7i1TSqeziWX5JnOdVDUWP1uiIGWv83igdN3aP7D3BlFRfepKEOHNr+7v2HJm+u
 0z99E47j7erdRXE4PoqFdzJSSzUuFbId2/JhGhlV/xHVQCCK0lD26ZQI7abF7GA4hnfIacdQ0eB
 gGduArrBgqZjhyUmzBGZZqrj6Pf/HTtqRMhimeT3ugbNUWnuEoDamBRil7OBj7BCpag+Ao1MEYt
 ULy4ja9anxWvv33wBfJqGgWo8fZdkGykxdKOgS4Qe1EBGBIeaPj23WnMI4nzqpiBKJg2/ze4Kh7
 dseSFMbgPjp6qv21L2Qn2P5bLpA9p3TnBbHcKu+V8j+gJIbKzgxO2ZLsqpI9UQqztEupuZr0365
 3CStZ/JNs/s6WK3G7s0n2Ozqizh8D8UNfyyie5eA3PLeQ9uaJdvQXYAvB7mj932LUeZ3jZLHNGD
 gFBRzE3j2lL5P0mIfoNuk6Oc/VPIV3u6eEUo4Hyppj6ogqfVFwlVESMFBdYwJUOiggCAWJDcNjM
 OEOI/WVFUnSAf+kU/jC5fNhhG/CDWzA6QIvde06QcU4sjmZ+DxQGVQBK9acnBhgEuHtWU3lonui
 f0opKfaY5sw5Xq9NUbrCWXgUxLJmTgPURYDK2yrRxxqQsol6uWA1iyoiygUNADNjVJg3hoa878w
 sYAyirGvo0SPFWA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Describe what needs to be considered and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 180 +++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..97fe0e34a7ba 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -367,6 +367,186 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
 
+Bus Speed and I2C Multiplexers
+==============================
+
+I2C bus multiplexers allow multiple downstream channels to be exposed
+as separate I2C adapters which also could set their own bus speed.
+
+The multiplexer itself cannot change the bus speed as it uses the upstream
+clock and data lines to communicate with the downstream devices. The speed
+is therefore changed in the root adapter resulting in that the whole bus is
+affected.
+
+This increases the complexity of the topology and some considerations must
+be taken into account.
+
+Bus speed
+---------
+
+Downstream channels of an I2C multiplexer can only operate at the same or
+lower bus speed as the upstream bus. This is because the upstream bus may
+have devices that cannot operate at higher speeds and those will be affected
+by the speed change.
+
+The example below illustrates the problem.
+The root adapter is operating at 100kHz. D2 can only operate with 100kHz,
+but D1 can operate at 400kHz. When D1 is selected, the bus speed of the
+root adapter would have been set to 400kHz, a speed that D2 may not
+support.
+
+This topology is therefore not allowed: ::
+
+                          .----------. 400kHz .--------.
+        .--------. 100kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |
+                    |     '----------'
+                    |  .--------.
+                    '--| dev D2 |
+                       '--------'
+
+
+This topology is allowed: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
+Preferred topology
+------------------
+
+The preferred topology when using different bus speeds is to have the
+multiplexer connected directly to the root adapter without any devices as
+siblings. By this arrangement, the bus speed can be changed without
+affecting any other devices and many of the caveats are avoided.
+
+Other multiplexers in parallel are still okay as those are locked out
+during transfers.
+
+This is the preferred topology: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
+Locking
+-------
+
+If the multiplexer is mux-locked, transfers to D3 may interleave between the
+select-transfer-deselect to D1 or D2.
+This results in a situation where the bus speed to D3 may be lower than it
+is supposed to be. This is usually not a problem.
+
+This topology is allowed but some transfers to D3 may be at 100kHz: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+Multiple muxes in series
+------------------------
+
+When multiple muxes are used in series the same rules apply.
+
+Transfers to D3 may interleave between select-transfer-deselect to D1, which
+results in that the bus speed to D2 or D3 will be at 100KHz.
+
+Transfers to D2 may interleave between select-transfer-deselect to D1,
+which may result in a bus speed to D1 at 400kHz as the transfer to D2 may
+clobber the bus speed before the transfer to D1 starts.
+
+This is probably a bad topology ::
+
+                     .----------. 400kHz .----------. 100kHz .--------.
+    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
+    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
+    '--------'  |    |  mux M1  |--.     |  mux M2  |
+                |    '----------'  |     '----------'
+                |  .--------.      |  .--------.
+                '--| dev D3 |      '--| dev D2 |
+                   '--------'         '--------'
+
+Multiple muxes in parallel
+--------------------------
+
+When multiple muxes are used in parallel all access to other muxes are
+locked out so this is not a problem.
+
+If the muxes are mux-locked, access to D3 may still interleave though.
+
+In the example below, D3 may not interleave between select-transfer-deselect
+for D1 or D2 as both muxes are parent-locked: ::
+
+
+                   .----------. 100kHz   .--------.
+                   |  parent- |----------| dev D1 |
+                .--|  locked  |          '--------'
+                |  |  mux M1  |
+                |  '----------'
+                |      .----------. 400KHz  .--------.
+    .--------. 400kHz  |  parent- |---------| dev D2 |
+    |  root  |--+------|  locked  |         '--------'
+    '--------'  |      |  mux M2  |
+                |      '----------'
+                |  .--------.
+                '--| dev D3 |
+                   '--------'
+
+Idle state
+----------
+
+Muxes have an idle state, which is the state the channels are put into when
+no channel is active. The state is typically one of the following:
+
+- All channels are disconnected
+- The last selected channel is left as-is
+- A predefined channel is selected
+
+Muxes that support an idle state where all channels are disconnected are
+preferred when using different bus speeds. Otherwise high bus speeds may
+"leak" through to devices that may not support that higher speed.
+
+Consider the following example: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+If the idle state of M1 is:
+
+- All channels disconnected: No problem, D1 and D2 are not affected by
+  communication to D3.
+- Last selected channel: Problem if D1 was the last selected channel. High
+  speed communication to D3 will be "leaked" to D1.
+- Predefined channel: Problem if the predefined channel is D1. Set the
+  predefined channel to D2 as D2 may handle 400kHz.
+
+Supported controllers
+---------------------
+
+Not all I2C controllers support setting the bus speed dynamically.
+At the time of writing, the following controllers have support:
+
+============================   =============================================
+i2c-davinci                    Supports dynamic bus speed
+============================   =============================================
 
 Mux type of existing device drivers
 ===================================

-- 
2.55.0

