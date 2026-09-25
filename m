Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9A3B71DA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359200; cv=none; b=TlHJQ+/eZndcJtSS+kbIuXvv8K+Oqyb0f7ffa530uRC1WYtacryOlBJb7VIHUR0qUnWj1Ud/ljCvFt1HO+02f4QVWU4jzTWh8TAZsNFFILKiAjAYhFo/24wJsrU767FOB8kwYu4TWVOVBMcvjkNHKE9DJd+6su8IIHxRkht4zjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359200; c=relaxed/simple;
	bh=g4BFvBfsn4oEjBKgRF001VzU3DsgniL/WavFRiTrhQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7PYK+9J87BxJXRKJoF0yVrFgjQXMW4rQw6ZGZfxcFmog+YG8mzzxSMlhl4rUW8o0KA4sk70DGvHwDBzR4ogL0aWu324gpjvSMD7H7umujnhUpvgos2VQnnj54CkUOJOKA438ZXRuK+vqBTlfF9iKDIu9NWy/3mJObY+zVvUOBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otD1Cntx; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otD1Cntx"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so10660031fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359197; x=1790963997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wexv0ThwJ2Po0yZ00a92cUQBj5VSlQRd+AC/rWaDMjs=;
        b=otD1CntxYHHYhZzjZSImDa3Y4B8b0bxmOyMqIHYy0sjvX6HEetx8c67VaPkkP3Re0l
         oc5RuJhvyu6aPqG8bpUXicmRZ4v2xUOam3/yWgA5+FXhN+lWxoxvz0jNPhEm+k8zQSiZ
         xqGoKYu6+ZzxsEwU9UjKtyZ5cbpv1CZQ8jW+avu3G1EmifKRbXscWhyLo1W2YgILhdTt
         L3jyAisgVQYZf8kLiy2cLT8DJ1VcAWr667Xac3kl7a6sftG9hfcHHcM9HD87x+BLQ06H
         N0QCAhh+GzCbIqrhHbOn+amz41Ke/dkf32RE1wb0N9MWjhFaCgFnAStjQEMHIPjlgLwe
         8JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359197; x=1790963997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wexv0ThwJ2Po0yZ00a92cUQBj5VSlQRd+AC/rWaDMjs=;
        b=DH9JnSO3x+0OcjtQ+e0n+JIObq/l5Zn+UWl1NKDVhn/k8zTyTFgbRWWV4+skwEb3FB
         FO66vgHcpeR+os0BnWd71lOUvJ6WWeruNB15knppSq15qPDWfyDYEO2FhatZ4OxLtC5F
         hXX+a2odEE68RJLUdiWyMg0xSCmtNTMRm4ohFM5BT5QdkRFmfIK6kYQgMBZEJlpevNF2
         y4OGwkX5mmMuqCHgmNJtpJCm8AzIqtcssaetzWFQeEvOfGvk986RK24zo15xuT2tLJkv
         gm1A+Rw/UBepM9w7JmHqfDOJ8HgvWEH6KKpxitVOCfS9TzUMC++2vCCDwJGt2EKG/SFf
         cM+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwc8hORGSvz+V9xRK/oKHgREf1g9pO6w0EZaEGKIwt27vAnM62jfWpo/yuWZg5qyIGTKCPO06K4/UA6cOw=@vger.kernel.org
X-Gm-Message-State: AFuF++kkD7WT0xj2KCnfT6q9N9ht3/DVlcRb47v5CEIxS/YyL5s5ytgj
	jWN63tUy/1jGqgBpfnULUN4lxqNnoWKAoDgULVn1aQ6RB3NwlQxbL65R
X-Gm-Gg: AYBFou0u1XGI56Bp3KwYYVp9RZzeopKbMeCF6M8STJCx63JehIxLv0VRuyN7dKGSIuF
	B6Z0P9J6uDlws+WA3cwjUxDeFfFdN6hWWDI3OcYjGqwR3YZGN0AJQxSeuBVAk+DxKW7o9AAuQ8e
	r38AJWn2HhtAyqx4jfRrMI8pisB/SG6kTiw7aJjXYJMjFb0P+AjQf1T11SRE8oTB/be+v7nJqy1
	mZT+tXLRNcLJJlQDNmGF3EvaPBWI5vP071cKUy64hHPviR9DhaquU9lak+43N8qyLGV7NQjbA4x
	4+kmeNqkHxLheV7MWDVDSfTytGpg5k4kwDTwloqdTVPY+I3++NneKV9CMT2PDtASpzXNbMtqkrK
	PhPSYo7P22EWmCiIkvfsHcO4RL2Pl4a9bj6FeARefeMG8C4Dcq2cKrltTFBrD/CgrIi/f98ll4W
	z+0LLoRIkfQq0kkh6ZClSW4cfPdtUlp76/f//FS56jg+rROH3y8DcCUrpMKHfjy1e7wXOGfM7ev
	CH2pV01Th589KY+ZWxWDL8D2gFRqiAFkP31GLtMsmFE/39R9C+93iVVjXRAtzPhmb8O/Q==
X-Received: by 2002:a05:651c:198d:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3a63c06c278mr14724591fa.4.1790359196582;
        Fri, 25 Sep 2026 10:59:56 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2f167asm7361481fa.20.2026.09.25.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:59:56 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 09/10] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri, 25 Sep 2026 20:58:16 +0300
Message-ID: <20260925175816.75842-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922005347.069c490e@jic23-hlaptop>
References: <20260918122517.377565-1-zoone.rupert@gmail.com> <20260918122517.377565-10-zoone.rupert@gmail.com> <178992913316.706584.1446996024286841775.b4-review@b4> <20260921183106.231972-1-zoone.rupert@gmail.com> <20260922005347.069c490e@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 00:53:47 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Adding the guard is fine - we kicked that back a while ago simply
> due to lack of users. Is there a path to annotating the non
> ACQUIRE.. functions to expose the right information to clang?

Yes, with the change below. dps310 then builds clean using
iio_device_try_claim_buffer_mode() and iio_device_release_buffer_mode(),
and clang warns on a missing or unbalanced release.

context_lock_struct() is needed because clang rejects the existing
__acquires(indio_dev) on a type that is not a lock. The header
suppression list hides that today.

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__no_context_analysis
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__no_context_analysis
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -610,6 +610,8 @@ struct iio_buffer_setup_ops {
 				   const unsigned long *scan_mask);
 };
 
+context_lock_struct(iio_dev);
+
 /**
  * struct iio_dev - industrial I/O device
  * @modes:		[DRIVER] bitmask listing all the operating modes
@@ -726,6 +728,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
@@ -760,6 +763,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 

> I did similar for sparse and at least the direct_mode claims
> a while back. This might be a case of it just gets too complex
> though and the compiler fails to figure out what is wrong.

It holds up. drivers/iio (allmodconfig) with the analysis on for every
file goes from 254 warnings to 11, and none of the 11 are the mode lock.

If that works for you, v9 starts with this as a core patch and dps310
uses the named claim instead of a new guard.

Rupesh
