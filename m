Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505243;
	b=abBrdev3DH/oVzGYN5sIRSbXrk+tqNZL5xfMNcfpac59cfmjBA/ZBGQrLEKn/A76j4tI
	 m9Bit4GuaW9Hl0o0GgqtrGd3siLFxtx2aoYab3mfI70zQvbFXxSRwBJcX0q4lO2GFpxvn
	 wNaEvZ8xYYQMusSYKDh05AfF73nWUe5V9PRsoSB7Cxxj/wlk0/SrrpfLI3CMPrknKLpwM
	 CTtqOUxODAtfnqOK5ho5qHw9RazUwD6dUih2vfjoKfGsIz28PNj64y+fWz1iIMC2aQNgm
	 O2Csz7pi3CTjO1CpISgyVqWRhiCKEOljVyrW++a/PTtMNAnaLQr5lpqi+scoxntnJeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding;
	bh=ZwhZ/50JHDB9yLWk9aI9TESDQvyJFGrH/l1ZLQxcavA=;
	b=Mg9kBTtLdQUsQ5CGYEVVA+lpb8ZMLFk0H1nca22FbbV3A0HQZX0eX3IZjtOfiiL9aers
	 kZAlkpj7hkVH1lMf3H3A5iYXCzS/WIdNuNeBgDblKi+gPB9LtPFPEs/aQKGohLYuNEyAu
	 agCgkFVH9nqMcwnaMBA3FCwPekobLVUWhuqsWHztNud39TWE3dARJZsa3CqOD8X8pu+3J
	 vCeeQJYMRvbxlxQv8ogtlzwuYMW2dyODiQ0eQlAHTNUtb0sG+hEhEQ1/M466+TEDJAm8h
	 SW6qxSBlhnMOAzGPgpdnuFpEN1yjjFwZH26NtOi8bxYWHN3WECapySmMldPhiX1CtgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lri5ufBG;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1127C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lri5ufBG
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so6477125e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792505241; x=1793110041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwhZ/50JHDB9yLWk9aI9TESDQvyJFGrH/l1ZLQxcavA=;
        b=Lri5ufBG87fd24lVSVAM9X335hUrANc3syGf4gi4pyyF5iklwS7xBy0a2KbDBvfCg6
         4/ZN6UBEqZEBeVyr0EB3lgtGA34Oc4Fp4Kzpb1V/VkhET7WTYw8HxTQh7xj/spqNHiPP
         fUD5tyKu9KG28kCMYD+tueG7SgBNGH38kZu0Pi/3SQ4UjAUH8Ts2Xpa6OYFiuZlAnSKc
         nDrcOTH0hGhz4gmAg30Fd2wUIhsb0xyrNSWOhfwdJNGMxE2AgSpO3XKjN3GuAqQkBNa4
         UURP+dmGHKTBqgFXgLrQ9qrUl0jn18CpQteDE/YEns55hHIuju4cE4PWlelw1JssHBSI
         c30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505241; x=1793110041;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZwhZ/50JHDB9yLWk9aI9TESDQvyJFGrH/l1ZLQxcavA=;
        b=XgKJjBMj3jLvRuXgUeURz7OPo+TjUDvAu6RG7VU28pKwURQENQqdI4Cp3qSTEgLT/c
         NJAeew+el4PtZm+ajGI10Bj/56MA9DDe2cfEA74FabRjhOCc2XLHkGGuiXP6yZUMcedd
         nnqyQTBXmWHFdxP45ivX6yLa1dbl2Q8xp6zNg2pWB2qcJTpArYC29wTJIdOhak1n/JNG
         fTkytOqC5U7hNb2s4ql3i69yh+gNiqk85Pet31zo5ulkx7hW2RzdCBaIJo7y8LhiDzQ/
         OPJkf99Csh85T7haYxSXgOFo0Sqy5Rybh/3eDmVWmy2mSx+hgXx10+HXZcdFG0wyiNCa
         temg==
X-Forwarded-Encrypted: i=1; AKwUvBw2KIhsuxie8dtwrE2aC9i/6WTNbnxCnJiy0cLeAajJVrC+wmtEQeeUs6tEWXmA3qxM+UpssuwYHylJWQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWhFVVOg4Tui+phtJEgcCpUfKAPLkb/XywsAcYQm0ccoxk+zoE
	OsLWH7tJKngILHKng1lYbHFjy8imOjZ/Sd8G4Dk7fg/cmS+xlj/cOcjKsbVhZufX/no=
X-Gm-Gg: AYBFou3BcSQI4twdAcOMuG5IOLc5s5DUKS6K7lwHT1+HJHUL7cHeqeFem2hAmTnuA3a
	Xlej6S0wtyawOyDq56CVklqg74JMNZJiX6mJH2G4vCoiwX0Y/y2V3zoY+ZQ6mA7YbzHRO/GnxCW
	ch9OISxyAEVrdyfCcK/DWy2dm1W1BbnCQ/2AyhH2lfGMtNJThpAay09qhDwianmC/uMbjphQOU6
	hnreS4YQ7Hd80UryxhMnSf1PRt4C05r4467nZ5gTC14S1dAdZudMd3rb73tv+onIdz/V4jqDhMZ
	ReCQSwPxYuLZeB/Cmi6HXq6ZmBRHGRvOLhAYWTcet0JTSp5EkRN0P1QgOlW2asuqRDpwpgOe9FT
	oIR/F6qAD4vc3uZPR7k5dwC83RLJoe8qCfsWNFFtbxKBx38PJd+1hsavzIr6NxYg+unrxYPLcvg
	H3EbZNLvMNeMMEUQT6fj+BchgU7Czt4h2Yd70Q8gTaMF9PFxIsB9gvBuBX2DBQxepseZU1Lm+eA
	+9Usg==
X-Received: by 2002:a05:600c:3b1c:b0:4a1:d248:25c4 with SMTP id 5b1f17b1804b1-4a1d76046dbmr241521495e9.13.1792505241294;
        Tue, 20 Oct 2026 07:07:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce1479sm75602805e9.14.2026.10.20.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:20 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] module: Fixes to tracking taint flags for unloaded modules
Date: Tue, 20 Oct 2026 16:05:18 +0200
Message-ID: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261020-taint-unload-f96d25823757
Content-Transfer-Encoding: 8bit

Fix missing taint flags for unloaded modules and a data race on
mod_unload_taint::count, plus move mod_unload_taint into tracking.c.

---
Petr Pavlu (3):
      module: Fix missing taint flags for unloaded modules
      module: Fix data race on mod_unload_taint::count
      module: Move mod_unload_taint to tracking.c

 kernel/module/internal.h |  7 -------
 kernel/module/tracking.c | 28 ++++++++++++++++++++++------
 2 files changed, 22 insertions(+), 13 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261020-taint-unload-f96d25823757
