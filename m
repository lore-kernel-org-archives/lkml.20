Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333045;
	b=zcQqzEtj8iPORjmzNDjWnWL2+kOIVGfQ/YcedvSVH3kjaoGhF2KYIFQJ9Inac3ono1KM
	 6+kxsPAQlJRB6N2iZjkk0OErE+GdPexnSoB5WN2zZ5q+LUlDmy9rQ8u6YogQRCoFCBYKs
	 TLVjy7zvfOEMmOB6s9oYttCLL5GeKKUe3P/RJTXaGIcaXnl4Rf7oyKOxJjkrk7dJi6EbC
	 XTamr1At7L8TVLKsW3HZKK4eJhpclI9j6vGN8DKh3oXMufEGOFQm4yoCiVD2R5+A2U5Mm
	 NOAdM6EwmtdD4HW0IP9AfI3NR7Hxd5et1bK+J0NvBLfIAevxogt5Rwvc0x4S3hu1QkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8JGmzBUB1ieFXJKy/CxNfd2X1JHTYzvohjQ9M74SDtI=;
	b=wZvQx0IcATM3TwXi6ekbk0tp9NiiyG70T6tl9z2CC/tqJYYE0BYQUmpdVN6wb3aGi79K
	 /WMTFrhKTMMTIffV0ABKi3Tn5dKEQr8gZJdroF2GqBesyReNXrxbzyLc4vTE8sFaVHcXF
	 vIMZpiidZknTuOcuD4uq1w5DXrhWaMtAfotdduHn7bzxo/bVzCuoLqNIVbWZL2odxKawK
	 y0MHs2wSKpMVVOTYDKJPMP/Y1zfzko+9QlcAnWCOLAi4I50iQhTONpXHUcahLtUB/fBei
	 PleN724yOzwCewETRYXk/XMLL//yPB6xaPyem6Cu1+kQE4wMAn/KXMd1fOS2nUMGdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUeX8hNE;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B1606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6B1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUeX8hNE
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-679e86015e2so1571933d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333044; x=1793937844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JGmzBUB1ieFXJKy/CxNfd2X1JHTYzvohjQ9M74SDtI=;
        b=oUeX8hNEFlszWHqeZFFJ07oNfpJ8o+iaQfi8sU5+RQ0eAVwcOeOy4Gn9pTeIbsuX6/
         8+46kGCOC23qKX3jgEKWVKH7BOFmHPuHT79Qqo7bDNBZvghVUOxf5kYXmAfWqTHtSWvg
         FcwHJjepkeXrgJiEMg95a/uweLdSZOO4oKsgrRRNY55FznKp6idfwEnLUUQZim9ib+aD
         RsyoQ27/NqCTkSuCgBuVzgPW1y42OI2RUeaN9qWvQ8kbHlthJ7Bg+iS247pQAylxp2NL
         ea3Kf8hCkw8sXqW08207zW3g5CbKp3mD+ofzrbnBv3oyF+L9V820N62lTbA8goV/OLfH
         u23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333044; x=1793937844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JGmzBUB1ieFXJKy/CxNfd2X1JHTYzvohjQ9M74SDtI=;
        b=MohZSA5BwH3fO17yb5wHa8F7BSxQSy+5sFJk975htTda78qeKrzVTjy5JWs6pR6Us8
         x7c5SLn4VppXDS8CuPTlrnNiPafepoCtsuyKQasthbVJwHRrzy2vHwUu8/+m8pwdsQiB
         oou7Kq6GDVJpHayTM4XvoQq9IQcY6tEY0iACnmbPc2ZvKgiKW9Zmc3L7MeSrn9juw6hd
         27E4KdXMgy5O37WZDS+os7b3SLSTg2ScM7XHRU9acz8O48Ih52dllvAhHFXgtUaJsgYw
         I1+vvYOuyeXn3PWCndwIpA19IwnZu4FTlVDpUScwnv/B+vAaB0iRz4hF2PYWNRivfUs6
         7m8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEEPXcxR9hvKOhQCVJPxJnUMCLzyQ8SSF57gJDG1Zb8NPQGmbrcKjNRFayMPUVss2C8VJfaqNCZU4Ej5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0drqimmzOfy5A6+0l8QgOMnN0GkspWP8nmgZ2PQ1YptX28gKc
	Ov7bUNBlJXBOkI/+xcItOFN7iC8SKa/3NiqxC0Hxrj20GqfFE9SzG/tE
X-Gm-Gg: AYBFou1PBSNF6wmzPjz2+ZR0CW5v6XC/t+UGyMZo9mKaxVGzZZyG1uD4Yz72+Z6FSKj
	7PyK3cxXB7oy66LIFHK9qGL8f+0JYCeNdng4ut5H+FHQhLrNPF90hNc4LsX7JusFJ37cWM0Bdj2
	8wLXo3cE3L3c06KE1TULkZKhw+lI65vK2G4acD4+4k7EqCMR54HHXq8JJxM4JCdCP/tairsYC9A
	fjMJbdVryflyim1HRA9tNcq9hoaaXz3kkp1P0jly0QJ3W3LK/tdQgQTDMMgy5INEZONI2KFfsZj
	FCQ7hqy3s0q74ijV92WYMSDSJiUUGtnunyoB0WG87kmuPPTaEXRXeslX1PXzMhvXE3i+CBoTmw8
	D3DjrsqnbX0u/Tk1YYo5E3E9eibsgcoqHFWll7ap/iYERFew3prBz/vV3TwsIilC7E4yFgllmyd
	zcvbB8QSVsz2hrAlQ8lO26/7Dg5BsSBJn/erLlqDVFnlkmg2R4aNRRzMSheL3Izfme8Ttj94oeV
	IOmuU+flkOrq2Rm3mT3C7U4pxBkKn6uerZUWGm5bovtK8LiGgL37yjYuoEtkWb0nsncG8YC/WiQ
	O+MIxRxgycs0bSgRaCDP97dCBcAU6H0N6M7Sjb/FqShWhQOTEIsILDxmA3mF6OoEFQ2gcJ4Oqfd
	r/sPRpXRtlA==
X-Received: by 2002:a05:690e:dc8:b0:678:fa71:2ff0 with SMTP id 956f58d0204a3-67a8d4d24b6mr3128247d50.38.1793333044059;
        Thu, 29 Oct 2026 21:04:04 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba756be52sm296744d50.21.2026.10.29.21.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:03 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:03:59 -0400
Subject: [PATCH v2 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
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
Message-Id: <20261030-alpha-profileme-v2-1-c702f1c65272@gmail.com>
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=449u5jI6TVHJ3jSiAT+AZJsNh6aRV24147OMwgzJp9U=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOtvbdtflBS3ydQ66N+y5L7E2Lz09y/lxdr8D91O0
 3HfceZcx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwzZzkjw+kKhbTSmw
 s2uuW036rgui17X6V415rb7uen3Dm62P4AYyzD/6R+4TXpou+WF3Tu056/5urh51tussxIfjGnq
 1fV5YDoUi4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
with the above: it sets I_CTL[SPCE], which enables counting for all
processes, unless bit 0 is set. Linux never sets the PME bit in the
PCB, so if 0 meant "selected processes only", nothing would be counted.

Add a name for that argument and pass it instead. No functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 2 ++
 arch/alpha/kernel/perf_event.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index c97b82a1f7db..1fa9bc813263 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -23,6 +23,8 @@
 #define PERFMON_CMD_I_STAT 8
 #define PERFMON_CMD_PMPC 9
 
+/* PERFMON_CMD_LOGGING_OPTIONS arguments */
+#define PERFMON_CMD_LOGGING_ALL 0
 
 /* EV5/EV56/PCA56 Counters */
 #define EV5_PCTR_0 (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..2d9383425357 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

