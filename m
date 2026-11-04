Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826578;
	b=LMpvE+mBwuh0Yx3iraCdQIzRtMu5MyyJueB6bfys8NYEhTzfFbk9H+bsX1y96buzXvhG
	 218Bt0/Dwy5tqUSvfQNVmi7hmLR4QTvg+mvy+X0ROuRVlyyfm3SaFZNhted0CQVPGeWky
	 snI0KHyNcJrxdFhLbBCssMjbGx8BOrj2oDmx8f4s5tTloF7Zm0OQZR+gtUI+XT+6LW5AH
	 tZR6ot6QTxBU4nG1W/v4y+TBukMXT62mIuQfKrZjqFb8Rq22OL1Sl/fKh0pZ4DHYE4Wn5
	 c2Ho1ovlY0DSlJTkN1pf1hZWhHtqFOghKP/1CTguTDayjM81wHIRoJClT2R3DeW7zpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6jISF9e7oc9q51mTvyRG0JtdU4PgALd10HFJdmI+R4=;
	b=VrBe+5I6X3dIYgd9C3tp7K7xBSMoVE60cO5wfTALhYTlQJHnIyBz/YmVx7mw36aq5627
	 SxpKJjJes0sVlyo0IhGlrz9ivloo99teFgaIVfi49Bl1C6J9LXfe0KB/MuOQ4xqtsFrNu
	 3lqUGulge/OLo3wpUQ9g6BQUT+LJXvLNvwmIWYgKu6fdgUPrZ3zW1OkfKlYYrgKfvxgx+
	 doS+G8YhitWfy50FoHhIeli7xnAciv+2ed7lyfX7t9h7JTCUqZ7++RrRgrX+yWl/9kveb
	 BtvZoFYEbuTziSgSbaCKiceBkFvZqjv2KQ8/+eC3aLmoZr9MC8GaT6Uv19x6M3zUDGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fk3jDwHG;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FFE607F2AA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FFE607F2AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fk3jDwHG
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7486615e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826577; x=1794431377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6jISF9e7oc9q51mTvyRG0JtdU4PgALd10HFJdmI+R4=;
        b=Fk3jDwHGWZfkbPvav9AHgef12S97zgUen80Hgkty1sjNmjONAWViqROOwt1cyBEFNi
         zD4dObV4UBbKU8lpf1GM7P4nPZNbRI690PqHxxcA0GZsAobckxCPzjbm5JTmhhASHA7A
         hFOwxp+5X+c+sUbS0KAiZWf58KZ6bhPtMho2Dh8syFSigFZLCIiRfGbyk+V3p1S4V6IT
         forb7NOfgWes9OPPHVgpDoJzgXY+xlf/XKazwsSv2sY/gQDkoVWGx7Px3VKoUXfjQMB0
         0ByEl7qTLXAjWJOhr6GY0c7YJ9ff0S/i5v6kWrfl7UWdVUZJeE6Nz+Nv/cE7qHlMSURF
         q39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826577; x=1794431377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6jISF9e7oc9q51mTvyRG0JtdU4PgALd10HFJdmI+R4=;
        b=eHjxUbCqpWglGhDZUL58fc/oiI/XkQJWODHvG29Cr52/UIBRjRgbcq25yrCo1hbIHN
         7G0a2WMHJL0E9y77sQqmfK1cGVpSbqsdEv0ppUv0kZthdLs/l/jNdF+f8CefL5XXoU0N
         dxsJa+t3ZbEs7U0GbGE3pz/BP5MZYPo1FW1owJlCaWyjBseCW9cpuTYTST8UflLBvPiD
         ftAcgReifDLEqgFAcRiI6Rjk89g5z40qb6SMOihYbgJrVRe4qr5Bqm44HkLWrwc+Ymcj
         TfO19/3CVo7vF9L/WEXkeGfiFTQgzu9V0mlRGKLorlbuvYUch3EgWsf+R+fiZuNR2DD/
         PwVg==
X-Forwarded-Encrypted: i=1; AKwUvBxrY2LlZanKzKim1X9sDtgb4iqzdHgpNR27saI9BtY6T5f1D2/GimwPFz6bh6UR0Zup8oneUpD/IZURwRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fppuUXongaDhf6sKdG51XbSvzBrGu0bWfqV41daNqA5fi8b4A
	jpOJumFpwey6fv3AMiSEThe5TMYGlDCzYeKeI+lbhPciiAKwdgQZOtgR
X-Gm-Gg: AYBFou3mznJU/OXSiQT4C1AuRQumu3AhHxYNarZKI0OdngRr7T+fS2ylDATfQhSe0SV
	ToB0xtFYQd00cl8LB0m61R0DoU3+ptumc9ML35sGRpPiXiJ41aJGrwysXVkjd13iot108CZfAto
	kmIfizboz/pAUKtOGLxd8f8B/vKOnfgGuIj5zw4uUKUh5q2qwW/NXs6DT1DMA8llj4ik+RCm1hv
	Em7ncyq/YHqwq0JNsuJOhP7Q00CyVUoUmgp3e80gchRZ2fFaQMB8SMaNyeApSg6rSuf+yS8e6Na
	QJ500L+Ag+WiHD0o4QvPv0JqZvHSmH8mXhNoldOsIXZcsQjvBJ7T56MAWUywG7ZcWQkb5GOUlCI
	2XvqDmsN7KB2U3sIYcSHmcpjqB6gJPSWCRzSBoDqDQT9fjzsiJqT+PLOgVWL0awMgper6HkKBXi
	r1kd9l5JR3YxZnw/ddaqNiCpdpkzQPYvF2I69MP0oMyFKzInd8FlyJcQ3Ni70CHjhnd7mOpB7oa
	29YRfPspTYMMq9JSnIQ5k94DwQZqnq1UiUIUHz6rgKOs10zDcpDasj1SkIduK11n0YLdoHaYJgP
	GA3evqOsKRsGQakJJmHDOB6sL25u7Sp9hd80gCINCC1JjpOidSg0Ww==
X-Received: by 2002:a05:600c:8b46:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4ac18c73238mr397433925e9.33.1793826576862;
        Wed, 04 Nov 2026 13:09:36 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4533873f0sm77714765e9.4.2026.11.04.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:36 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:04 +0100
Subject: [PATCH v2 18/27] selftests/landlock: Fix regex_escape() error
 handling in matches_log_fs_extra()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-18-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Use a more conventional error handling interface in regex_escape():
Return a ssize_t, which is either the number of bytes in the output,
or return -1 and set errno.

Before this change, the (log_match_cursor < 0) check in the call site
was never true because log_match_cursor is a pointer.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h  | 20 ++++++++++++--------
 tools/testing/selftests/landlock/fs_test.c | 12 +++++++-----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index a662a68bee7b..dcfdcfecde86 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -277,11 +277,11 @@ static void __maybe_unused set_unix_address(struct service_fixture *const srv,
  * Escapes characters that have special meaning in POSIX Basic Regular
  * Expressions: $ * . [ \ ] ^
  *
- * Returns a pointer to the NUL terminator in @dst (cursor-style API for
- * chaining), or (char *)-ENOMEM if the buffer is too small.
+ * Returns the length of the escaped string (excluding the NUL terminator), or
+ * -1 with errno set to ENOMEM if the buffer is too small.
  */
-static __maybe_unused char *regex_escape(const char *const src, char *dst,
-					 size_t dst_size)
+static __maybe_unused ssize_t regex_escape(const char *const src, char *dst,
+					   size_t dst_size)
 {
 	char *d = dst;
 
@@ -295,21 +295,25 @@ static __maybe_unused char *regex_escape(const char *const src, char *dst,
 		case ']':
 		case '^':
 			if (d >= dst + dst_size - 2)
-				return (char *)-ENOMEM;
+				goto err_nomem;
 
 			*d++ = '\\';
 			*d++ = *s;
 			break;
 		default:
 			if (d >= dst + dst_size - 1)
-				return (char *)-ENOMEM;
+				goto err_nomem;
 
 			*d++ = *s;
 		}
 	}
 	if (d >= dst + dst_size - 1)
-		return (char *)-ENOMEM;
+		goto err_nomem;
 
 	*d = '\0';
-	return d;
+	return d - dst;
+
+err_nomem:
+	errno = ENOMEM;
+	return -1;
 }
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 100ef02b5d1a..10a386a573dd 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7450,6 +7450,7 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 	char log_match[log_match_remaining];
 	char *log_match_cursor = log_match;
 	size_t chunk_len;
+	ssize_t escaped_len;
 
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,
 			     REGEX_LANDLOCK_PREFIX " blockers=%s path=\"",
@@ -7467,13 +7468,14 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 
 	log_match_remaining -= chunk_len;
 	log_match_cursor += chunk_len;
-	log_match_cursor = regex_escape(absolute_path, log_match_cursor,
-					log_match_remaining);
+	escaped_len = regex_escape(absolute_path, log_match_cursor,
+				   log_match_remaining);
 	free(absolute_path);
-	if (log_match_cursor < 0)
-		return (long long)log_match_cursor;
+	if (escaped_len < 0)
+		return -errno;
 
-	log_match_remaining -= log_match_cursor - log_match;
+	log_match_remaining -= escaped_len;
+	log_match_cursor += escaped_len;
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,
 			     "\" dev=\"[^\"]\\+\" ino=[0-9]\\+%s$",
 			     extra ?: "");

-- 
2.56.0

