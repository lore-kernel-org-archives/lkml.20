Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29F345ECC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655235; cv=none; b=iHSszDAXxlu3p24Xq9LHeF+e9KyxPuaGF89DbTJmpRY0GQezD4mlaTbF5vr+nejtODMt5XYsDPh0bRgFvcD8OWF6avbuQR1NkLVkgBeXrDhmooKzsaxKzFNN+Y0Q1ACAPnu6NzUy4T0A4yC7eqIpBF43urfZWMio7rIp7aDhWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655235; c=relaxed/simple;
	bh=QEE/N6PnwPszZHQB06FbCOKn/XxBs8ay66Sp+xmfqv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5bkyAB9Fz4HPn9d5GtM/u9aAheCDFRbXh9W6Uf8wFmXNYpwGepdpYNWZH/S7bZKzeu7jcKepvjjjafm7saBEsV0whipG+sR4FDlCPYHLIPvRP5vqZRM+0UU2GUu1HPuulEdvWKUNFvTZUxQw67gJ52dP93SFdvNcwtqL0ou0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=WoD+fPtV; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="WoD+fPtV"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53519e20d7bso10489941cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791655233; x=1792260033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCsenb9Bskg3bCFGqLkiR40EBE50kMlcijLAOuMhnEE=;
        b=WoD+fPtVVsk8glmY0MtOSLbCvFA1NpzTK03e+ePsgmzbL+/V3/iZF8E5Isqst/hZiv
         Dw4r2XizyYpKnWUGjsjEr4XLNNypm2geSXy021YfzC4UyWJoss/6dc3T2uDHTgT66LWy
         goTjXHw0eKg0da3o2Fzsy1OlVUBelYetpVEkiTiV1MlBq1hVN6yo6N8yy/5pgrhD3dwU
         MH4M7JmLLDrhOTov4SE6bEwVDjP9xLsbUwAbw/M/p0VfHcLoJ0Yuj4mmBKheJJKdwlKi
         SffPGBIsW9FG6PJtItcc9XaeFnilsfLmI6URdviRhuKb9S+3FnEGzqE7X8db3kyYnCdb
         pGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655233; x=1792260033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCsenb9Bskg3bCFGqLkiR40EBE50kMlcijLAOuMhnEE=;
        b=bXTuB2R8pkrDrLeAGsj0zCfmYwQ5fVvwpngaep3COwC3bTDSC80gitI8zEk33LVyGC
         O1/TyD0hdhpLvzB5FRRAmpSIf7j9VFVEOEEHCn+yuU1qstj3qSTIfiqZF+lICaCNiXHs
         NR1guhKKEuy5wXpyY0syfLzQmMcpwT+P1M1u9q5tOpfxKdIKlZrGp7uA3alrSB3CapmC
         6YH3yW2Yc8Dzpq8ckrh3qb14c8fkoaHU/Swl84BGishEBi9rAPYGUulw2XGcYBf/8s1O
         W0CyPxrjg6slbZtmFQ3c5AnOVWtvRuIa33cdFC+Rs8hXcyu4xZjyZKn1wZDVjhMT1Pom
         kXjw==
X-Forwarded-Encrypted: i=1; AKwUvBwL47L++6ZFG7+iOUuHE+foj/ieT5oHk5PcYrd/ilpOBLrZXRlIyQ550GVuE2FnDsRidbtV4S/6xgwekik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS1i9rRSHEqYD3wX+xcFVtwlPwSAx5JSZiPIR+12PqQd4gVp3l
	m4KzQxSU0mm6g6w7gaIofq4p0TZSjXznc+5VqJo6DJEL19a6uO6IU6vCv0wO9TynSEM=
X-Gm-Gg: AYBFou0x16zAtL3GwGsVa9tPfgDQuI9JwJ55Q4ZJOAB/Q3UZhrHqagYAarHYMtdhHXt
	Zp4BTnPDU83iyumHdXNtT637pIpOEyKQjYPpABxj8WhTpPCv4GmVg9HYOcGoHeW23Y+gmPxNyKi
	3XwjyQg+9lrDlOPias1lRRmDer/NHAXSjFJRO35JhBLyphnE4FQgdbJCJJTnfRVmcvQ0KnujFb0
	7RU/mPh2OE2CB2fWkZWcGRP4ZSZmKl6WazBV66Eivpf2FE/957saQWCd0hjm1SWdjg++Ygtylgt
	huzmOMaCf6S9L8ZuZLQJWwWDhI9edgeCz+WUAJxqyJPvqvYBTOLgS2VgbrLfQLJqWUgvvuiTsts
	CdFWMObTxMbRq6eOinvjsyx9jC1GGQfPN1C1RIZ3QslJd/jrBQh6VNOXFXoAHIQ5Y2Hi0gpD9zK
	txHJywJZV/ksUVIT5Sv6zSwMz2arOcVmJFpkUckasHMhqkCIlpf7m5NnUAMQ+bzvFwrwmvoTrgk
	Mn5OMhXDQRpbd4h1My+HFVQBb4M9PJ1jvMvRdeG
X-Received: by 2002:a05:622a:120b:b0:532:8063:4ccc with SMTP id d75a77b69052e-5359d6a6713mr90845801cf.3.1791655233434;
        Sat, 10 Oct 2026 11:00:33 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550175e3sm50339326d6.11.2026.10.10.11.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:00:32 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: discard pre-registration events and test state seeding
Date: Sat, 10 Oct 2026 14:00:29 -0400
Message-ID: <20261010180031.7-1-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series prevents input handlers from receiving buffered initialization
events after device registration. On a ThinkPad T14 Gen 6, a later LED
update flushed a stale SW_RFKILL_ALL event seeded by thinkpad_acpi.
The fix drops the pending events and their timestamp before handlers
attach, while retaining the seeded switch and absolute-axis state.

Patch 1 contains the six-line runtime fix. Patch 2 adds KUnit coverage for
registration with and without event-buffer resizing. The test uses a
virtual SW_DOCK device and performs no real radio operations.

Tested on mainline 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0 (7.3.0-rc6):
 - Tests alone on the unmodified input core: four pass, two fail.
   The non-resizing case replays one stale switch event; both cases
   retain the initialization timestamp.
 - Patch 1 alone: all four existing input-core tests pass.
 - Both patches: all six input-core tests pass.
Both source commits were built and tested under UML without compiler
warnings. The final files match the earlier failing/passing comparison.

The same runtime fix was also tested with QEMU/KVM on Arch 7.2.7 and on
the ThinkPad.

AI assistance: OpenAI Codex assisted source analysis, the fix, regression
tests and this text. The submitter performed the physical hardware
comparisons.

Karlos Abel (2):
  Input: discard pre-registration events before attaching handlers
  Input: test state seeding across device registration

 drivers/input/input.c            |   6 ++
 drivers/input/tests/input_test.c | 168 +++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)


base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
