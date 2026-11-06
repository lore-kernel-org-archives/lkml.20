Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939460;
	b=coLCa/ACJmiN71ZMFL8hTJkxblts/BUF2Zoin9MJqrFGEDlPLvx/pBYGVNA/5sPOoqy8
	 7qdBlEZiza0douMF5sihHVEBhy03LabePYypNoCP8446EKHK/2ht1UP5pqD7Dz2QsiHNN
	 JVbRDq0l+RQvDLrhcdHOebxyosv7zYOEc/Hv7VQaSmj6t++BL45fZild40WF/Cx7HvV3D
	 Vs/XbE0p7k9u33lMwcZZFo3cut+pUfBFDzJWNI5z2iIj+KW3Y9LcMZm9Y1ChpJNbFrfiY
	 zCvFe6ltdVRv7LMBCPc0WAQ30fUvNMvy+jXWunZLAFCdxX85aKHXhS/ShdHzzg9tIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MsPW5K9wIVWLH8zTIi0shO9heiIb/dOsSeBuo+Lhef0=;
	b=eZ8MVwOsOMCwISkOZkK+L4Z/giEZhKJl4ScQDvkUtdJLOh0PYEUDrhiW0t7EeRPWVUN6
	 vPbKVRJ9EdAoI0yJOKC5Nv9uJVAs+Ov9ROL8mkCK7zxOSFwixlqrFihoIKo1wsOmkDiP+
	 bE80HN2Q+NrK3gpIMJONVfpZyvhyk3aXuygs9tAYBcw3OrXbfMcAt7pln4vxo36fHkCL0
	 O3sA7thy+lLLB0re3pJSnwFP3hQF9rFamBF3hYn6hS47h2VoCNMzbhQYcSt0Q9QfHsSYI
	 5tTfeXvusDWBSXwMb9B/114ofknoYy2ZHVkExOUmpqw+SKnfjXi7HNNFk34+EWr2//A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7MECB70;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746C606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A746C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7MECB70
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b300713befso1069527b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939459; x=1794544259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsPW5K9wIVWLH8zTIi0shO9heiIb/dOsSeBuo+Lhef0=;
        b=L7MECB70DwWz713BM4+LuzQwCxLCy9bzNYAZNX1OrN3ke5g9nymLp+njHxZmAVJqrY
         xKX/ePAjXg9VJRi1cqPn8GEUjgleL7axnNyCdpNA1zAkgrsKxkpB8lwZ/EmTZcH/b4x3
         tibbLBFjD/+HLO2+tniKIzPpGSDbYtPjncsKH8sBFn/Q20zw1AIBn2vyjSP0xIjyhWoM
         ++9bzBQpgg4kh1/KdufEK8okI/UcS65elEi0pyu9KEQNELEG8cFLW110LVzTnZEBv3wd
         z1mScfxNSqHhMXEVnziBiWdRdYwsn7OffxB1rNqdji6CoUOZ2R5+2eyWBCcASxwzaxTd
         om0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939459; x=1794544259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsPW5K9wIVWLH8zTIi0shO9heiIb/dOsSeBuo+Lhef0=;
        b=0Zd/n3tgI97juypsJEuzIF9sVOY9jNtsH9SfGy+1PrxKoO8QwwDnVOLJkV66NrRzJg
         euMYljLr4aWwSuC0W8ynq0tHZq0uUXI2Q10VPb7xaeq+1bVMWxrafZ5h1FYIeBrBT10S
         sb32nGSPUk6KY1XEK4+jhA75/5WRmI6vXtY63MfNEh/do82KyIIgSm8gM8QNiGbf46tK
         cFBqpAFbJ0FyOaf5cdKEiZstCMzqqfKjosaM6O/H/puq6XSWWeKDyVjAfFaYlxDkYOxh
         zlS7PKY8RBsVVT18f76ZATLjOv9fG/8jYqSVMj3ljszkOmefphV7FW34ZksrHXpq75Yl
         P2uw==
X-Forwarded-Encrypted: i=1; AL+hErFfq0hvOM8cjppMqIckPcAnUc0J4qoqHW3GyApkLyBvtXQKiydyr770nixVdAHCUeggDomuRy0cay6sP4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0w0d/6fK2t71UPalf4jIc8aVxkNOPv5Trx6aGv9ZZKxECxpE1
	HZHiCfSeh1bTURetcX8FXyqxEqw0F6EWfUb+EbEvxLkPzv/tc5sIuxgD
X-Gm-Gg: AYBFou1YfeaJ66JkE0L4tRq8Vl1wDOJ5IriNnwe62i1duQIuHAUiOhZ2bG1gP1loWTk
	Gbb/5RHoyNHdXRJZ26zIFVKrHuTYu5KySbp9vBMKpj1X4Vj1T3stczHXc6DnI7mITfE60Bx3Hsk
	lED0mj5p2cIlkrbJKOyAjZ141ceN6yTqEGMWRf+mEa6UufKagxD9Fn4aeMSY2gFRYNFG9gRKJJ5
	X+TMncxMz3l7UO59VTOcY/jLJu7TP6DsXlRMLKPEcshNG6nKVaU/oRUQFKg2gZ61mBdFMiWJoBO
	kP2DMVgdE6N4orRlykVC23sh0srpjxZwfR0lt2c12It2Zky4FahyC3WcI+z1Q07ZmZ0LjqYqeu+
	cUVGuUi3jX7+8bllZgUMfxQY0mkSNyFW3l+JF6IZAEyQcCcPtvL+I/EUPXwvw0s+/ea/6IcP1mz
	5zen8zslDNj3Q9MhYqX/vO4l3wHLyn0II2vyRhYMXA/djHjmdBDD4oKYRIHDmzPSN23mlWXCzf/
	l8XF92jcRuVWOt5On0ebdZAKEPN4idwoCwpeXANn4PnE+Fr4z0FBUljNzP3pbBqH48EMTghObJV
	e15b9ZTnxzH+cVGxuItIGuFXp0duHXPksSzVN2ru2Zqb5MhT8qf8ulH3shbC0i8Rb+NroRQEwuA
	fJcLNkOndhA==
X-Received: by 2002:a05:690c:1a:b0:8b1:69b4:b56b with SMTP id 00721157ae682-8b3417dc562mr8895757b3.8.1793939458803;
        Thu, 05 Nov 2026 20:30:58 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f316csm11175647b3.1.2026.11.05.20.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:58 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:32 -0500
Subject: [PATCH v7 13/14] alpha/perf: sample only retired instructions for
 precise events
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-alpha-profileme-v7-13-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=t93WYO3sOCggQKfxs++3pirdoJx+OAS0XM5ZjaMNX24=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht896KoZ+IpRhsUx27gy/vJ861/P2atlbvTnpP09a
 JkfkOnR8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNcc6mJkuBgoJn5i2f
 wF/nNO3ds1vX3D3DuMNw5XvJkl4ZFSN9ezVY2R4eTnpOV7l6ZMElzdPY+196F15bsVf1dqHJj7r
 Cds3Z47a9kB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples include instructions killed on a wrong path, which
show up as hot spots in perf report although they did no work. On an
EV7 loop with a randomly mispredicted branch, 19% of the samples were
killed before being mapped and another 48% later.

PEBS and AMD IBS op samples are of retired instructions only, so make
precise_ip imply the retired filter, unless filters are given. The
profileme bit still selects every sample. With cycles:p, both kinds of
killed sample went to 0%.

DTB miss samples, whose instruction is aborted, are then dropped too:
cycles:p reports DTB hits only, and the misses need cpu/cycles,trapped/p.

The kept samples carry the full period, as do those AMD IBS keeps when
its swfilt discards others. So in frequency mode the sample rate, and
the event count perf report estimates from the periods, fall by the
share of killed instructions: to about a third on that loop.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 332ff19ffd95..aa6ec2161ec4 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -849,6 +849,11 @@ static int __hw_perf_event_init(struct perf_event *event)
 	if (attr->config1 && !profileme)
 		return -EINVAL;
 	hwc->config = attr->config1;
+	/* As with PEBS, precise samples are of retired instructions. */
+	if (attr->precise_ip && !attr->config1 &&
+	    !(attr->type == PERF_TYPE_RAW &&
+	      (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
+		hwc->config = ALPHA_PERF_CONFIG1_RETIRED;
 
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {

-- 
2.55.0

