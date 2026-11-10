Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284386;
	b=K+BSceubcoZfYm9ePi1zOWm0CepvPMwLEqPlLLf/whH+FWVZ/6MXVD4csgmcBwSv4im7
	 IKKDpO61v076Q1zDEKD0aSMOZAc6H8jW9iqLj5HIrHYgnnziOdnzdcyev3egevXBId+mY
	 J5JGyCx64KHJDjwLr00yxCrMTHD+yryQeQO0zf/ulu+gCjzu2yQn1vlHngdZktXddYZTn
	 JoMc6afAHSwjyIcF+CrGrVIG6f6+9O3N4BOYXf5NwqvlS6QjCxGMdpeIjNs5PV0lT4Prw
	 zo8dWS8EFi1KVc8aL4t2RJwN9haS/bcDPLG1B9/UOX/c5YLJGCdb85o5qmbladynvAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GWNZ8zQxqiZGzpWyot+03nwu4qhuEeSDcx/Yq9DH+WA=;
	b=Zn4kaMhlM7hHWJIDEWdiwPYTRmqH1qXKvmeaqtqpxDyapQSB8aTDcxZm9/ggDdNOpfZ5
	 XpGBwRejpUYalvKLopFZwDw9CW69e6mvugt3xSw6vbsEtveBfo9RS5H3mpyDBeTO8pkpi
	 2A5NSEy0kNg48KVawFWnhluP2R4ZdYm3yYoHbmU0eR5dPdv//4vlbHaBJ0YClMJ9tyM4N
	 +4xrGyuKEBSUzmOfEg6IAKkMChRN6SQXNzxX/81y5elADzncb3eXtw85lNwS0Snd9mg1T
	 LMNVvOxHASpVGxb5BQd1BTlAHLFOHMfi0JRrQmj/xXjRP9IVQUKXvZC2Y/a8uwWo93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGtenEbZ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F4F606E8EE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F4F606E8EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGtenEbZ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so2710289c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284385; x=1794889185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWNZ8zQxqiZGzpWyot+03nwu4qhuEeSDcx/Yq9DH+WA=;
        b=yGtenEbZG7Qy6TLOfNHH0y5Y07HDUztMPNGH3pc770I1r2cy3ZaH19A2RVmEr0UI/O
         NZeYX9CpwtGDlWb0S9HZyajA8d25SmnVgJ4F6kjH4/q45zPIe1zefUOfIaqHT0g3hwFK
         Cn6+z73Wn3D/7ZIxwbuXvB0QWjr96G80mTxU2EXqHyigkYPy0OKly1nGOk5paCbWlat3
         Qk2roQcaq3Gvka9pimS3DGiW9wA52FY8ZRCFgkmUQEq86+1KQeoXmZW/nju7ed4FzWuB
         NbXDttmUANX+suQLHNmfzHEMZ0+Kzh8LhSxP+wbrlgmKTAIxym4xWpgfOT7EiNtfWu01
         T+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284385; x=1794889185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWNZ8zQxqiZGzpWyot+03nwu4qhuEeSDcx/Yq9DH+WA=;
        b=uBiMurBguGxHmQnkbCFlB7D5DTEFJ71/F1U2Kay7fEWRVXktjmxPIGe30fr+O2GL6O
         xJ27AH4qJRFwjfEZ1rm9dpMfaVkOTVKQ2uueGkFwNZxMIrkUaxmy1iqjq3dRXQDUJkCs
         b4gMYC60d+0z2miF+nhNwWrmtbbVqf5aWBBU3eAXRLdxjDxEVV0C6yqqrRk/F0gqiR8B
         FOS+tCfA+c6985OsSWR3FZNQM5xZ0h4aUaG4Sz2FuJjk+7mdehkPgDMSlWChq2Eg4lzh
         D+GJtFOPaNK27EcqGWNNgVljUj8FlEEpDau6PDwu6Km6JLpUfuMQEUG4RiY2viMDyxmq
         aVMA==
X-Forwarded-Encrypted: i=1; AL+hErFQGggDg/EJiurn96q0r5cy7YLz6KoBWO1Fp1aR2n8kw1Q/MqqZ7sK1Jq8HbkEA1ukJEb7e0T/rA4YZDag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J/29JhJrMw0QYOSbepDop3+D9CxqF6kl4b8mGK38cEhhTl8HZ
	wILSN31PxoKKNvcfZEBW/2QABzFaIXSOLllKSmr0hmfI7A/oVisdYP7U
X-Gm-Gg: AYBFou0CfIEDTfC1ELab+GeXJGD33yBKnuvsOn5hWWQ781Sb9Aexyxr7evuNGPmq+My
	l5ypKu1Fhm++aN2+HFJGI/xD9yybddkc3HVHEkL54QBHciohfGJ3L6IDKS+X8s9ume4/ifkHQLp
	7sXxwIAeqibZ/rJte0cz6yl2BMGNnVQfzSVUC7oLjXV3dfGeXwp+ZfQ051FPGToOyARKITDy3/N
	eXXdwBL3EGIVAWRXatw3SLBiR/ToMKjUyGvIGmef0dSztc8ujtTO6x+YiKi9XUIZpljhEklRHeL
	XmIC//WMDW7CAin+uwJs5PjvBChhR3SpiQftgwXL1EHboK02gZDn0J+gkHQHF8ThVAnOlcK5N7T
	+12tYmWMzHfcL/q2CqEDQU50XaS042iN1G0rHyBxr+eauuFpAzm37VM7/TIGtutqoKoLzMCtww9
	68vulvNzNz19ErL+eLzKAKQYmpQNsKX4hdxP2IC+B0WvTaVw55Ad3eVx5dF2STcS0Zfvdu2W3qS
	R/RkCx0u1SHmPu/nyeGe96GxRhSBbg5UBe4nCBAeCUrCx6gm88FuDNWzGJ8I+sKSW6s7l3ShuRM
	040bngtYF1NyMwovQ/K+aNAu2KfsFDPItuyGlXupsjI2/5M=
X-Received: by 2002:a05:701b:450c:10b0:149:49c:233 with SMTP id a92af1059eb24-1b3b603e878mr2107744c88.27.1794284384921;
        Mon, 09 Nov 2026 20:19:44 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:44 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 07/25] rust: add bindings for hash.h
Date: Tue, 10 Nov 2026 14:18:14 +1000
Message-ID: <20261110041832.1730924-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/hash.c             | 22 ++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc73..4992bc3194e7e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -28,6 +28,7 @@
  */
 #include <linux/hrtimer_types.h>
 
+#include <crypto/hash.h>
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 0000000000000..1e50fe16c5031
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+#ifdef CONFIG_CRYPTO_HASH2
+
+__rust_helper unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+__rust_helper unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+__rust_helper void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
+
+#endif /* CONFIG_CRYPTO_HASH2 */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7bd..0dcdad905f0ef 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -67,6 +67,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "hash.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
-- 
2.56.0

