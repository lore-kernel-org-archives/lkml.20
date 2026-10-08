Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8600399352
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469641; cv=none; b=t0T48rS7oPEpIP8tajw+O6ooxFjQj+eO71DuHqnnA03ZLwF23pOpfaUJ+OZRl6aMzpxVeseWM+fB3pgnZzimkDMpiksx/7xmvLlRMLaAkV1dgxB/5rEA4jQqINdhK5Ba2YFHQr/FgAN2FsnJAABG5WPOCWg2rDTo1zNalRwDzc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469641; c=relaxed/simple;
	bh=n275S+OuVLkos1DUHNi1EQKOQFtolKWeIjbbDIOX8g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lEPLK0w/KU2cAyHamixDlkc0i9J8Dm7r73qCJRpegVSIc5Po3zdFMlufBdnO7pQI1Wp5anX/vL5DszaXlG/neJ650fAxuJ+JT3Sr+Awe/qaRdvnpAQUoF7YfBxP+eZf71Odl9bXI1QgO/tHWdWuRx3Fp0b85eFmmkgiCDBM4GV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO0jL8Rd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO0jL8Rd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so31024475e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469638; x=1792074438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIdXfHWm+XcWclaowIlCf3zzp2UMJw9UWgeDM7YLbIw=;
        b=EO0jL8Rd58l4LT4J+5/cqo3MLo0ClMO8CNcLHRxFcqV01gCSXhP9APCXBj05C3A3Sj
         1mBxY4qGWNqfYEv/sZrPYO/brMDyKu3iMJgRYXcOPzWGRa+l4HcjVJLYChcFX23MEBzV
         D/IZ+RJSd93ISMSQ2B58eZwF0NO5xqFVvrJFGj8e1k8jrdK85Bo7WbXy8Iy2r15vpBDl
         Mt8dVGX1344PQXaWOTIdNRpGoQRlJ3rf4c/fZ60CynMFoxZyqsREpXJ9jbr+7R6A8+z4
         TGIVyJ9rlrphdalfEJIjHoH4ymgXyKRFdDYJ2cS0ET102dBtxIANTubBtXEZk5zsNkon
         wp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469638; x=1792074438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIdXfHWm+XcWclaowIlCf3zzp2UMJw9UWgeDM7YLbIw=;
        b=klveYjiHo2s5EobiMGHniF/HM3DKCwlYAYUhMgpJlQLEwOZATmLPGEWXIxjWWOlNnD
         UoU3VbSea1oaPJU8R9y2yIFbQQjUnJWm4MBKb6DbW+k8gdlURH34y72trqZQfDgbRCCW
         ZMBhcpTMBhPjXZYPRtjMrtm/IZzbTTDktbS+si/7aJulKKdoLACZzDPQmwnDlcpIHtIt
         No3sNUKUc4Thl43swqg1VzAHrVEhgbn1246w/WPfW6YITgqGsOJrERx7baCJ0FNcvk0f
         sp0SQZ7PGwL7xkufm5ZlHG1YMFjUFVFAi1mhK3ZTMLrEclFy68rOOcTom/0quZfrvnUV
         9VDA==
X-Forwarded-Encrypted: i=1; AKwUvBycHiPz3gzvtuY7oCZXfh+KDP8qMyP6GyCfe21+GSXcDl7uiv7l+eJ6BcedzjP041QRK1vFMAHbRjs5TNE=@vger.kernel.org
X-Gm-Message-State: AFuF++lTDGlMz9OJcpU/EFQtqk9hY4zBzBnpV2IgC06om0DqNrhUaz+h
	PUaeEkb5emmJ2N9v2x8dfkkEL7brypqo3n0dFnLqnw/eSDVRDLRZ7sWT
X-Gm-Gg: AYBFou1TgTUSXtPkKj3tKC+KFezCvuJ5RSGDMJ4O4zWpEYCTL11odAlk2jHhZGWwmQE
	obqx/WTdlegEDpqn7L7fMHav7Sqz5psTUGDaumvC4U+2wRwmV7UXExivXJxC7o9enFYyOB6NpWG
	UohoJ7liDwHASlnFMqHgYjcWXq94wR/KypFQmCJN3TD3eDsHvSvjErGnZpG3nvh/2REeB9VHrTW
	F5NaOFWH8CS+mWrlnWS/G25i2aNmgzHp16SQshVUIofA0+p9cEmvgc+AX45TZySRY1cQ64IJjzP
	LlcnGW6SKX28zNMu+tLhMagQVKcupDrXykLXNBr/fqz2MqnbAPP+VqsGNqLQtKCIPnHhJdDIsce
	pnNHVWIexYG/niq0QvBso4K37cjhHxvBtVjsXxEF5OR4Kd/0kepPMfcti4ygEr2xKHx2jOtwtDT
	5VerLcbww8qhrp5IVfy+BNAzKuuKKE6wRa1P8pRatNarGNd7d8em9I99Hu1Mb84lHtR8d8Ip3pK
	Iab8bZaeHRkTzS1DJWyBYI=
X-Received: by 2002:a05:600c:5250:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a1800d3944mr95506635e9.4.1791469637826;
        Thu, 08 Oct 2026 07:27:17 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1e9c2sm10963344f8f.30.2026.10.08.07.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:17 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/27] selftests/landlock: Make audit_message large enough for any exe filter
Date: Thu,  8 Oct 2026 16:25:43 +0200
Message-ID: <20261008142604.39107-16-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audit_filter_exe() copies the filtered executable path after the
audit_rule_data header in struct audit_message.  The message buffer was
sized as PATH_MAX + 200 bytes with received records in mind, but
struct audit_rule_data alone takes 1040 bytes.  That leaves only 3256
bytes for the path, while the kernel accepts up to PATH_MAX bytes, so a
long path overflows the message.

Size the buffer for an audit_rule_data followed by a PATH_MAX string.
This only makes the buffer larger, so received records still fit.

Also check that the request fits in the message and return -E2BIG
otherwise, in case exe_len does not match the filter's buffer.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index 1e533b4e26db..173dcd1088db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -41,7 +41,11 @@ struct audit_message {
 		struct audit_features features;
 		struct audit_rule_data rule;
 		struct nlmsgerr err;
-		char data[PATH_MAX + 200];
+		/*
+		 * Large enough for an audit_rule_data followed by a PATH_MAX
+		 * string (see audit_filter_exe()), and for received records.
+		 */
+		char data[sizeof(struct audit_rule_data) + PATH_MAX];
 	};
 };
 
@@ -171,6 +175,9 @@ static int audit_filter_exe(const int audit_fd,
 	if (filter->record_type != AUDIT_EXE)
 		return -EINVAL;
 
+	if (msg.header.nlmsg_len > sizeof(msg))
+		return -E2BIG;
+
 	memcpy(msg.rule.buf, filter->exe, filter->exe_len);
 	return audit_request(audit_fd, &msg, NULL);
 }
-- 
2.56.0

