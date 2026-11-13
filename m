Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590292;
	b=ukBROT3GP07HYK+WdxN/i+Oqz0zpgI196eTWDF5i2yf2EWLDK4QXlcIY+0Evc62jgkPN
	 +7u60rcwIfMtLaz3MI4KI1kJ735WIWtA8XT30aPRdX4fnzyriskwkgC+IoolqkKiz2GiC
	 NNdKisln0oFDqhfxk/qi3nxhPzD6cuBljCj6zp1aigQyC1yRN/N9Iphdzg3scU5moHIxC
	 tg06VD9YBtIJokUxC5kf5ddKPbgkSUFx0fCjU17UnXBID+d66+5mQOpTl6mH5sapXBGhd
	 jp72Q42UQo38oiGkZdhnTVw2OSgZjLFbyeIJjrnQQ2V2OVKLcStN/VXRAP9T8QbM3OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tWKhcWpD9mj2d8PnUU3UkZsThd7QQmlRjYnUzdhDGBc=;
	b=FLs0GLkahNs5MhpmnG5FnHsW8COkVkYPhXvIUmHjvDr3u8CWmjDbfl8xAROMj0HEcUvk
	 v8QfC41vA3H1/BbLpj5IgJWj70edbgcCw++2mO+5hl36WHPhmARpLhaHzEirPJZ5oER2i
	 rSPVCVHcScggk1Fc7rAdxcmGZKVlqRDwpzQ1W7PspERF54o9LpDYK9JgzbLN9FmCUXBMi
	 PcNJVckkpCHbSJ76cze01bU89ao75+D4abzSUvyFVKck6ZQDXxOm7lso/N08mathM6jIU
	 bP9ZXqwpgDsZr1Yt0gpLYOyLPfHO/jF8oojfZW1WaW64dpJ6PAh1JLTxbPSuBaYPgbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="V/z+4bs8";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA00607A5FD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA00607A5FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V/z+4bs8
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so1442245c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590291; x=1795195091; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWKhcWpD9mj2d8PnUU3UkZsThd7QQmlRjYnUzdhDGBc=;
        b=V/z+4bs83TrSCAPh7xtP/G6TLt7Jb+F0KcjVqXcQswmAOt3FCP5X6OQW9+88yDFEVH
         WlDYMA9+G1JNF044GMulzrTgeZqjotijVLYuX0lAGM7zl21pQZlVCRoqGWBLAlLEiWT/
         WmVcuCyRhk1KhBxcyOaM0ijSRKi5acFUv4tF/SQxcVbpZqz+pPkQDD67rPbhAyKiMJng
         yblJb5Jx9pgwrkoc1tuxdikItr9cIKyt1wH4HWg7XHVmUdIo7QoH3aK4R0CEe/dHUQ/P
         eIUepxg/jcf8ZtVH5AQCfaQJznfTO7wSRPgLBRscLteM1bsWDjAC3ANbQ/QSupzxymJk
         VFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590291; x=1795195091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWKhcWpD9mj2d8PnUU3UkZsThd7QQmlRjYnUzdhDGBc=;
        b=l5JI7puX7u3PR+a2kfuuKAtVYD8WEBtn8/OxYI0eromzpqLrLZDHlctxLG3y414wX2
         Ftd/H7HprCwPnzsm87GcewWteodXILNVzoEcusEM6mWspiOkjJ70vUwBuiuSxlCr1BkX
         xeh1aXmZJgaV7GUlr57POyP58QB8YWOcInFWxLlD9y9fJXqA2HlZ47SO3TAoUsQJokaD
         MnfSVeD/ovBxY8GuVfG92eVPwHeSjzjBBT172UYCbF9nuR6eg0pyBNa598oiSV9MBXxk
         nx0esMSBWAMA6VQ3ZAvHsti+2Pi5A7k+jJwD2iBgU8w4HCbdRE1LPotUjKafTY8ugc+S
         AnTQ==
X-Forwarded-Encrypted: i=1; AL+hErEkFDMKc5EiNUAZu2OQr3UNZTMgutxByrCqlffTtrJmhvDihgIvEgB78Bn8cz5Cit3U+kSRiAkPiDU1mOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UGabNY6al+z++U5xP6e6oTEXMtfgB/IihFMiA43Ya3qrF5dfV
	2fdMl0oCpDy04C9aQ+4skjP/O3uGZK0sg4myNOobyjlehiJV27gN1vGDc5BtF91KHZC3bBHF/2P
	imj5BqJcKjg==
X-Received: from dlbvv12.prod.google.com ([2002:a05:7022:5f0c:b0:1b3:b6c4:6fd4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a42:b0:1af:16c4:d06b
 with SMTP id a92af1059eb24-1b5030a3490mr2624195c88.10.1794590289931; Fri, 13
 Nov 2026 09:18:09 -0800 (PST)
Date: Fri, 13 Nov 2026 09:17:17 -0800
In-Reply-To: <20261113171734.2188066-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110220803.2503416-1-irogers@google.com> <20261113171734.2188066-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113171734.2188066-7-irogers@google.com>
Subject: [PATCH v4 06/23] perf vdso: Constify dso parameter in dso__is_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

dso__can_shrink_symbols(const struct dso *dso) needs to query
dso__is_vdso(dso) on a const struct dso pointer to exclude vDSO images
from symbol shrinking.

Change the parameter of dso__is_vdso() from 'struct dso *' to
'const struct dso *'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/vdso.c | 2 +-
 tools/perf/util/vdso.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..7f2dde70f3e4 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -361,7 +361,7 @@ struct dso *machine__findnew_vdso(struct machine *machine,
 	return __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
 }
 
-bool dso__is_vdso(struct dso *dso)
+bool dso__is_vdso(const struct dso *dso)
 {
 	return !strcmp(dso__short_name(dso), DSO__NAME_VDSO) ||
 	       !strcmp(dso__short_name(dso), DSO__NAME_VDSO32) ||
diff --git a/tools/perf/util/vdso.h b/tools/perf/util/vdso.h
index bc74ace603ae..b6e05bc2d9f3 100644
--- a/tools/perf/util/vdso.h
+++ b/tools/perf/util/vdso.h
@@ -19,7 +19,7 @@ static inline bool is_vdso_map(const char *filename)
 
 struct dso;
 
-bool dso__is_vdso(struct dso *dso);
+bool dso__is_vdso(const struct dso *dso);
 
 struct machine;
 struct thread;
-- 
2.56.1.703.gf848ed807c-goog

