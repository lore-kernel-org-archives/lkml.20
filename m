Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03330C15B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881936; cv=none; b=D/T4fDR91x/JLumM+zZQUoJwKHC9ZXd5MpcIuju3crp1FMtcm+44Em+KLmHPxZqwJnaxXiVlQbQftRKTCQ901ApIQUGZFAa2dpiqordKr+BiTsYC1maW3/1+yRDa2Wlmiz74HFEnGO33bLlUPZvecxvKzYUamttiEeXFe9Sstfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881936; c=relaxed/simple;
	bh=+5iO4dSAhEo3AZGC+XWiPNe2+jcuNGNmwtd8kiws88k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ea5EUztolfUo//T4UquIvCWk2ZZf9qONgJHs+g1qN3lm8Z27Bsznyp5lxGYEnIzRDT9GnyEB1CYS3SRoeBdkIPtulqGdEQ5Qf/6r0qF46ra+3bsOvSAU9B2X5pjR8YQ0+lKar3uyGblhgv6th+coE+YELtL0mUZZza0aPVfJ7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTjRlxES; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTjRlxES"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so497280a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881933; x=1788486733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNpC7rHp3pQpvORIwlLifm+Jt9USo4idXGhd8GPdBcU=;
        b=XTjRlxESul+sotZ4yxRUiUEQy1tz/rBqOmvHRlxKfpAE889cqwEM1cOv/5XOG9y3vK
         I0AYTxiFF3PIremn2BvZ+8SCfkogd4KW8OtuQXv8inuDdC/kVEaf7BVc7B3lwKuU6oC2
         v27/wd+UZWL9B7/crdVi1/aFFcTDBQRIj1CQEcQx8PtExZZnj7mbn2oXgjmZpizsEHcu
         8nNeWIYBrcd3xgWwWF0UCqdNfeS+gPvohjb3JbS989UnuNbcSLhrkOldUpOVLzoy6P+i
         52N+lOjw/ETaRRZ1KDTRLnW4vWOrc/dOD2uDxDLAG6puRUigNBRjz+FSiUtv9MPD6jea
         eGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881933; x=1788486733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNpC7rHp3pQpvORIwlLifm+Jt9USo4idXGhd8GPdBcU=;
        b=VE9SN39htulOBpUuyhdlMv9uD2TgQM+LAbs2J0Ql2pTeE2r4ZQun/w3T+7MN0yEvp9
         thzxXniTQRTrJOYqMCsqgMz7tMz8zBELb4V1GbRqlbpzzfHLcuvCDl6bTnxdxVXnWnM2
         2KeST9GFyHHkTb0R+T9daQ7WBTMl1krEnBHmiSat1WoMUt2pM3Nbh+7xciBfXQAYaPhG
         1ooDj0DFGKxZ+LQ0rnT2EPRYJLPbGcHHjrljH1Rdmq3P48dmfZ9LvxJTR5ApAgjIwwi+
         qb51HakcrXMyHvk7rRjL3kZ+Qx79HnyaFm6OtPLUz+J1YTNFKE4mXB9IXsOXb/4UzLGV
         zzcA==
X-Forwarded-Encrypted: i=1; AHgh+RovjW4/4S3hUGVaGxQxdy8pqMYH+z3FLRuEsNDd91paQU7033h+8fTHwpoTQkF2gri2kG79HZaZfWsm77A=@vger.kernel.org
X-Gm-Message-State: AFuF++mtFESg8gROCo+M3t4DEIurOKjs0P8ilxDnICUbRKK8ZQnpxlWb
	Ici1Rzba+n1rDW5tgmoI9l0Zyju50DTt6mfdXX3tImjWSdLVuFiZmWEe
X-Gm-Gg: AR+sD13ypDIAjBw+IETqOVvobflajlKB98zby9UMjAd8BQWqJCg0CwFxke12H6T2Ld5
	igAXm3GTFpUtwis0KLTx+DjUGfwnKQkLqTHnUbNB6cs7UUaT1LF22HOp9uRnJTYxmO4a7qulEJt
	zP9Gje2rXHpi8g9iYoK2SGB9BKRS8QD6/oNpWByWs3rFsQpk4MC3GHwPJl8PCgIW2Qk4eyKiJkr
	XEzdJ0GHiuViSPVzv94f9qKAtL76OaNLQ7YJiBqj1nMVMkHSVu3KS3YHwz8mQRE739ha4qZMBBe
	Ca7m1qf8mbrI1sgZ4h2U6ip7W3cIVS6ZQuppMpO2xSPiFwfqoT6V22FvbDOCq/B9XI1DEy127ZY
	Fp07GfDqx4gWg8y2jpYQ1J4UR+gdGstLS6PycIsmQsWS1/GXHX6hM+H/AnUUOKfBXav5OkBAAz9
	70z3LXxjHR2mL3OIJLAdnE1pzdcRIj+4CXBNlA5Tx484iONbEOPCKyV08RmA4Op1ZLsHE=
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr5133053a91.14.1787881933040;
        Thu, 27 Aug 2026 18:52:13 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:12 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 0/3] rust: add missing newlines in printing calls
Date: Fri, 28 Aug 2026 04:50:19 +0300
Message-ID: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds missing trailing newlines (`\n`) in Rust `pr_*!`
and `dev_*!` calls across sample drivers and documentation examples.

Missing newlines cause kernel log lines to not be properly terminated,
leading to unexpected concatenation of consecutive log messages.

Mehmet Koseoglu (3):
  rust: samples: add missing newlines in rust_print_main
  dma-mapping: rust: samples: add missing newline in rust_dma
  rust: io: register: add missing newline in doc example

 rust/kernel/io/register.rs      | 2 +-
 samples/rust/rust_dma.rs        | 2 +-
 samples/rust/rust_print_main.rs | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.55.0

