Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0B349B1C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712451; cv=none; b=A8RvlRIjhJKexhSBwWD9iIMbHeH00LzlwItrkzazvT3NNs8jfYM1DDUCAgG9XfyRbXPieyF/LEPVEK/uKr6iE2mOnxxBZemMrje05Bydz9WyQoWBVweTGvH2s8/ajsQfz2o+qBktxIJx6D0Y1M3CkHyxnzsFXcZ4BUkPTgk/cCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712451; c=relaxed/simple;
	bh=noTLfj6qvE4G/3YGJrqQ+X+o+vSSS9003cx7Jk2ZdtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rls85CsfQgejulh4ZGOnOQWkKzBwKBFBv08+Zm6KOjsUIqp+0dPVTVk2kzY5SfE2O1JBqHhQlD6yxupn4f3Oih1rbpWwsF+cas/i4LS9k/Ew8hdxm/+EZbplQZjxMthWBmMMMqkHuoGEuLMUITkh8pbcfFU6+AVgfoGTM5YKh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMkH/tRo; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMkH/tRo"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so237806a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712449; x=1790317249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csLwFhMu2XInJLQYNP1JrwM1YZ634u6gItc/PhWTvTQ=;
        b=aMkH/tRo0sLLu/oEqaLjgyoWkMaf25hcaqkdSB+rW8er+/aFxrSokxMf4OqUQRUGiS
         aiU4dbNKz2Smx42Npl/ycb15ZVJA14ULRSjd2vo+mlREGcHefvBGHQxpsDfIcWZgieyj
         zGxKeJ5Dac294ehAwafIz7FxVglsAvP6iUWSMjdlfhyx+9mGhWL1Rf45cyxo6r3FoLw2
         rh4eBI18v1y0t2yFqtDJrFX8KhG6xKfWfZuBZg9NqE71chrAQQHm1SnX3IYiv9tsCkyK
         C5jUXQn/mwkwesFq4bP2XIl8sixzX3A5HJxq0ru3sFaosvUYEpjN/+fLtyMM0Z5GDE1G
         2iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712449; x=1790317249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csLwFhMu2XInJLQYNP1JrwM1YZ634u6gItc/PhWTvTQ=;
        b=ZAmCmDBSUakg9fFoTOWe9fa0H3DgU1Ot3WN30b5xPiq0/gU7qnmLLnEwAGw0X+rk8S
         Vo2q9mz/rLd0U1yhjJSIJOInTO6WbZvoY3D0huLOkpEwSypIM+HJLjbNUQgqBYaV0j3m
         lwo/Ve6BV+wmOgRO6CMRK7lF5lxL5U2kb4es8fCIl6UcqLKEJOhwtkiVbzg6dARW6IGE
         maMU11kg2walH1iA0+DuPkq0C3y7t/ql2Ww84nj7e/jzAumk1WSqosyRRsYg+EcS1jZV
         0rvtslAU5SxM4Ql9TV738NOWePg5Pxm71kBMJdBtmosQT1tiw1Il0vkAN376JT3bT3vH
         Q9iA==
X-Forwarded-Encrypted: i=1; AKwUvBznzjDjoykGAShSc9m39hqvvIQjjvtjFKLasU40+pfn1LTTUbnlvqie1TfNK8xtFb9/JfAoaV4WBxk+Dr0=@vger.kernel.org
X-Gm-Message-State: AFuF++mqSV0Q5qgjjSP6KTOHqoPTe7X23RWu3344IVYfHFEp1jBOTxKt
	I5OrvkBxccpwWvPC6k9bPyFWMjKfJeqktjCkog9FzPsh7nR3Y3GqOy1etrG80iO4Q7A=
X-Gm-Gg: AYBFou2XqeYVn6jMEmmGWTv8+Rk1DL6gUCjHs53ohGF0eYqjJUrNBsc+5lXEzO3wSrb
	SlCpxpKt4ANZJirPkRa8dUFVdYpyPO7AyvKvLxYm2ZYJWS+O4M3TTjRJOHI76tZsc1rFfLldN6Z
	xk6xFYreZ6mbg2VskU0h5LlV+cnD9VKGcglVhSoB3rzAVV6ajNKVbiy5aXeHYQQcn6TPWsoSsiT
	/9dUhW65WD1syIppoOiyu+6DoPvrACOHnxndxLMaBK8dpITtOE2g3uCgfvdSN1s3KssWSUSUMCE
	ciq8jMFgyu7fWbPnKlYn+G8b6uUcwgbgqbOMEkLdkosvkYG6PVmqfFgJcVWBxfShLpo02xmMT6V
	u9wAgd1wKOgwwUGh+GNz3BG4K/UkAlnX9Dj2KJIr7QJAUUqP6zIgHzmcMvpPOSNePLOV/gVqCJW
	WCvb9Iw7buGU5hgfPRDBPVxyawzRGjghoO0lg8GFyYDqhBEpu8AKvJzII7WDry1RkUIwYyHf0Ct
	Ee2IYIC2qHt
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr3597578a91.3.1789712449109;
        Thu, 17 Sep 2026 23:20:49 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:d8:ce84:354e:5319:44a6:6a2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b7266sm8675903a91.13.2026.09.17.23.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:20:48 -0700 (PDT)
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	inux-trace-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	woradorn.laon@gmail.com
Subject: [PATCH] tracing/selftests: Fix incorrect invocation of exit_fail
Date: Fri, 18 Sep 2026 13:19:13 +0700
Message-ID: <20260918061913.28069-1-woradorn.laon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all `exit fail` and `exit_fail;` with exit_fail to keep the
usage of exit_fail consistent across the ftrace selftests. This also
reduces warning messsege such as 'exit: Illegal number: fail'
in test logs.

Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
---
 .../ftrace/test.d/00basic/ringbuffer_subbuf_size.tc         | 6 +++---
 .../testing/selftests/ftrace/test.d/00basic/trace_marker.tc | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc
index d44d09a33a74..8cfe59d32b1f 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc
@@ -60,7 +60,7 @@ test_buffer() {
 	# the size must be greater than or equal to page_size - data_offset
 	page_size=$((page_size-data_offset))
 	if [ $size -lt $page_size ]; then
-		exit fail
+		exit_fail
 	fi
 
 	# Now add a little more the meta data overhead will overflow
@@ -71,14 +71,14 @@ test_buffer() {
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; exit}' trace`
 
 	if [ "$new_str" = "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 
 	# Make sure the entire line can be found
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; }' trace`
 
 	if [ "$new_str" != "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 }
 
diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc
index 9aa0db2b84fc..1986c1bf1606 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc
@@ -68,14 +68,14 @@ test_buffer() {
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; exit}' trace`
 
 	if [ "$new_str" = "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 
 	# Make sure the entire line can be found
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; }' trace`
 
 	if [ "$new_str" != "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 }
 
-- 
2.43.0

