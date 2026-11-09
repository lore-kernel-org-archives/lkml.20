Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235339;
	b=PXHOqA960FLXmdHR/I1N3kzEQLt2CS2iYf6IwGdk8Zo/UdQNRO7vUXF0FkbVgyX4nCC1
	 NdX4OIro9zpTJEahjPTD6PzXOQy9PnHIynszk/roYm13qC7wyyLYz1sIoLTCH9CbaCjd1
	 kHdHs6jTZvJFeILd46C+w8BEoIIbkXb6kUS8KUDeb8gcU3YuwnnV3Zj8nTREh2ZLDmcwu
	 6wUH91QRdT7ZIsoXpqT3I1A5QKnLDgzW7UeHsTazdH/LMmxzbsFwSAaQy8Km68ZoGyutP
	 AcljyDm3hLZLLWdsuLx2S+3ubJdnpskaMCfFqznZBvt5cDHrdRu4ZBVylpSyEdXekBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4uSQy2+UK8rG2FUK7vsd1guiTwpW8ISh3RHk4l57drk=;
	b=qJWhTGUdvGBQiWHB4ju5bnUoddpzRpFTpzWoZf7aWi7IN+fzIHLpPfhA9pom/P+Z8IIy
	 YJLAjDhc18+L9rZKcAcDjoJ87icBhpUWWbaljkhsyeZLCqiBAIhnbMeY6dcsr06ua/Mz7
	 /fvksIn44s3X2Cg1BNUOrEuk/SlN/u5iaJZnMPZ+CEg6/VbT8ks09mAfZ9SFLQMrZ+OOj
	 F7zzZz8BSi22hSEE/M3w8pep0MGxpeiDmV4JeybuIMYfB8luBWrA/X2u4rbmUfjPG3DZG
	 YVoGfDKuJ2H2aJnlSANiPdpiy3Ff2uyKYSz36ZuWzW/Avm/Udvt07VjouQvN0WEDR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mU7xb51q;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF058606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF058606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mU7xb51q
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so14063295e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235337; x=1794840137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uSQy2+UK8rG2FUK7vsd1guiTwpW8ISh3RHk4l57drk=;
        b=mU7xb51qWjBDCLclutZrPHTAT6vfhjEhNUgePjwc35o4LgUyNGjS8mHdf07e6zbz2F
         wrGNIwafWd7sHoexj0XvgCOc9HUCrGOSHfaQT4zx5gYMY3XfhtFW4auSFPezJtU4yyC6
         F4ohkEg6Cd2AzQeVpLIcHRut6dwQacrJWGJkl4KQcZnn596TB2nqI4EMKrKAln8+HyRg
         mXh0HtP6YGrngEe0kkSA0HqiZ+VnuYw0yDICZnXc/uykPOa2CwCt2BXRuB67pycqv3oV
         gGvLxoeUv4dQlRpsyXNU6Xm+8I1GY7MOSvw59L939Ev3kRjEb8HTKlpK4WmpRVyYihrm
         fu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235337; x=1794840137;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4uSQy2+UK8rG2FUK7vsd1guiTwpW8ISh3RHk4l57drk=;
        b=yJxlH9NghnrATZsOj4ZEfcRXuYGssFVYN/emhZDec0nkEQBh/u8s1DlCFCjaimrXvs
         1R4ONzJR2yyD+9YG13fD1s7JZtv9lrfGfz8zF5mmNECFEewVEhHgExSPYmJYqrDifZfd
         p33H3YWAGhBH7iw7QNG9AK0PPtYSy+iODvOnQjKalbmmER7k/UszR2eaM4DTc426Ufq7
         VhnNrJ4zYRY96eihniYtfiDzPw+A1qwhgoQgmzofUJg6nY0R/o0qs1JSSjr1/BrlHTei
         GLsu1MJb22w8XmK7rtjSr4IgMjaNyQRFgeR2rnAfoNI8LY5NF+vkyaXU7oJnGGFLSoor
         nxAQ==
X-Forwarded-Encrypted: i=1; AL+hErHjz//gS/qQEfC+VJ31XaM/nvReLvuibJGUdTyAJSPjjTtRHGziHNJixl9TmVbUU6go9UftnI9hO93qva8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XEWaBAGNRlGSLBLbnvRGmqS6w2gARThxOzLFCq2qrpFbkb6n7
	qboz0bmuuGtR62MvFgCiW2QFIqIcsBbtHpvTFlh4mglIYRpDXaBDncoY
X-Gm-Gg: AYBFou0B+ZQSGOtglA1TFyT4G/qxVFNgv8dJXEWNUij2oxNELSX9Zy+M4YtCl+3dqtn
	ofLXlHdBgqa/TBTJGTanO1rVX52iaae7ggc5X14JMHlcFwa+9gJrT2QQeo7OdnoJp12HHYHPw0b
	iIBca+v9lpOAF7Wu9hza7LHBRJi2ia+a1Ucd88ACofNmZB8hqbCmCXqwu1E4V58hkLKONLImt1N
	jJ0zWxHkDh15OQC0LFf0YzatouZWZEXw7H15iecO6QzkZAPlmimOrmwBZJoEbvY8lzO1GcW9Ie6
	aT4tjG0sqCEmd11TUBXTESfz06myCfQBtxA93RNmOpZyIbm0DxVnHDsYz/071g4eA5so1/F6O40
	1G+wUjQ2r4Lg/+erutL2FGtHsVQvvH4O+GwR4x1I9KTFlOT3LVxhVxo8fiKV8aYyUHh8ae6WCzq
	YfcjC0HcOJHl9XpArKm/xd8mBHZ9uKRYS3Mz5Zfek1K+OaQAgbMDxL78gMw7LtgFcBTYHYd9OXZ
	gMqBk1m150EBUiC+/dHN7PJRad4+lOHQl6YbUMDE7PPbU+iKW6mCOOz5ZXHw/7hrcqMCs2CAvHl
	R6Xx5zMTANuE5/1c3kVeijAPhmfbwLO/VE5bhhaSb1A=
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4b963c6674fmr87866635e9.17.1794235336889;
        Mon, 09 Nov 2026 06:42:16 -0800 (PST)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-497be726d9fsm1759034f8f.49.2026.11.09.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:42:16 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] perf config: Use va_copy() in perf_config_scan_cb() to avoid va_list reuse
Date: Mon,  9 Nov 2026 15:42:09 +0100
Message-Id: <20261109144210.1626450-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

perf_config() iterates through both the system-wide config file
(/etc/perfconfig) and the user config file (~/.perfconfig) so that user
settings override system defaults.

If a configuration key queried via perf_config_scan() appears more than
once (for example, in both /etc/perfconfig and ~/.perfconfig, or
duplicated within the same file), perf_config_scan_cb() invokes
vsscanf(value, d->fmt, d->args) multiple times on the same va_list
without reinitializing it.

Because vsscanf() consumes arguments from 'd->args' via va_arg(), a
subsequent match reads past the end of the argument list into
uninitialized stack memory.

Copy 'd->args' with va_copy() before calling vsscanf() in
perf_config_scan_cb() so that multiple matches safely overwrite the
destination variables with the latest value.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 tools/perf/util/config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/config.c b/tools/perf/util/config.c
index 287401f159e66..f567cc338ca9d 100644
--- a/tools/perf/util/config.c
+++ b/tools/perf/util/config.c
@@ -1091,8 +1091,13 @@ static int perf_config_scan_cb(const char *var, const char *value, void *data)
 {
 	struct perf_config_scan_data *d = data;
 
-	if (!strcmp(var, d->name))
-		d->ret = vsscanf(value, d->fmt, d->args);
+	if (!strcmp(var, d->name)) {
+		va_list args;
+
+		va_copy(args, d->args);
+		d->ret = vsscanf(value, d->fmt, args);
+		va_end(args);
+	}
 
 	return 0;
 }
-- 
2.39.5

