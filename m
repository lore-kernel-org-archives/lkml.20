Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519B3CC7D6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496219; cv=none; b=COpIpg6i4DJx9wdpgZYwT/+5ZKwQVgZcpUR8PvZh7jK/RG5sS8OzCLdJXaKwT+d2t9GtbWlY742C0EMQBJPCuEUW6qYjbHoCbG5QFjDZHFx/5Igo9BhR5pdRj57hr/b0KSlpSNuLb2yuqU6Xgi3KycLT7Q72ptIZ4D865qlvoCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496219; c=relaxed/simple;
	bh=tbED6H+uNO9j4sNeW1XfmIj1+olsJu6Y+XghzSg+0Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=meWKvJbIoy4/XatXG8mnxb/RD/IBgD+GBwmddanq+7TlnscnM9UdbNKuNLZmklMLFGZjlysmyEYGWmjdYRKxUYVlld+JrLdyeeEEEIdtygkhsmRFLJqf3sVV+VmVdmPid+y5wMBauyUMiiCmWM8ZlMQdcbUdTLNsLHtlCEURTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nw9EkcWS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nw9EkcWS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so3139535e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790496215; x=1791101015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3FHA95YzK5XgbQOZn9cxCZwWxEI5XaJfmnxPWMGYwk=;
        b=nw9EkcWSLsDXniA/Dn+8G26UJ2Tgo3QgSD/DbH3LeqD6OKNwlYZlKnvr7ivEWaJxTZ
         Ptow1+i8e4VatRXw9BEEZycQSs6Mjk09hjz+ycDeunRd9ciypTssje/HSj2FnBsMdTmh
         UddmRVrmO04CXFYEycvHiYpwg16+aSgmfAsy2STMGS2rRJmQ0HhyxuRp9UPqj6CvQDs1
         Q77s38vTBK+9Sv1aY8/rzWgUsOATPi4vyJkUQL8+2ScRCbhEklGNpG0xod3lYALs4uVD
         SoeQJKr7H39XOeoNYCLbLAYJzyuYrMrVvyAPlBK7xLBX4qsJoJl2slrQahp04j4ebL7W
         gxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496215; x=1791101015;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3FHA95YzK5XgbQOZn9cxCZwWxEI5XaJfmnxPWMGYwk=;
        b=OXAA3tAxYhc+G9C2nsJNezUmmUYu7NZJQz0+lEsJYAgKRqCU8vAt4rNeVCSzlGPDYV
         GSnacudzPV8zEkx8kfo5+pzuJ8Phm7ZPeXpZBP4JlIH+odaNhNLfjO3TDgrY3+Us6V4v
         klTbJoLSKQyplXnGycpK1Od1Axi9hW4qjyHSYIJIk8CYTIuxJzUOnyq09rhIKfRBMTGv
         nmhavN5XihCFrf5l8yobb+NsNtCTgLzq9BkYnw2UI//Ers+6HzyCjJ7o0+faBefX8GMW
         XoEwTZW8yGRwE7RBztse54dPrjYs+r5GMpm6AZjY6Nzv6oB7gPuPvx0adnkUPA8+MSZw
         ZdjA==
X-Forwarded-Encrypted: i=1; AKwUvBwx+KYwnXZZ+CKIgCPpeLDGqogeUyULsWRF5Gz7W/pPSLLRjpswcNpDQmpjbpPkEUpCiWHAcW/+3rK9Usc=@vger.kernel.org
X-Gm-Message-State: AFuF++n37DR+bWnXZxycjbwzLcUYl0hUtin4+goewqyPxoKDJ8+Nks0d
	3H6II49fQhZCdhbUI9YxTyefnphzKIfqMQMEUCwH1ck9+kCx2uWN7mX/FYXMdnO9Ggs=
X-Gm-Gg: AYBFou1EKpB4SAX46xNfQol1ZQ9umN8acfPZnELVALuoJvp8w2VCDlvzjGG2UuHF87o
	2CFI/WPvdWJ0y3CKiFqrTUTK92GV2znMpxhj/W37oBCqAbo1NA36h4aB2b1PFjotIN32if4Ok3b
	i7QTrCiNhplwVhAjfy0Z/wXVjJ+YpC0TF7ndaozmuXuWZsi7lVwkuLQ+Y0dvx4f8kjf0mHm6RFn
	QFE8CCGoEc0KaPO9U4mydGvkNu46InHrGx+pFPI+1HDi+R9HRmeoQxjbaQMe61aqTiPJyvt9TU6
	L9124F1K06stTp79MJVeImjLCpE37JqmLSicz0Ki8fyZ80KCmKbxnEjlzjPDGmfokRxFxJtoSeO
	cB0ay5T36pj7X7suE9uE88ldYL4sR+oyAYrO+LwVDzaLz7qCoc2JvGAWEMuUzYVhRzcm3tmE8Ea
	rD7einyKFaArBdImogztv4VhMiR1HkNSe77KFvWUkNYMFB9ODI9NrhwOqw1Dk01LmxZG/M9ue48
	GacsQ==
X-Received: by 2002:a05:600c:a00e:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fe66f176dmr196415305e9.12.1790496214713;
        Sun, 27 Sep 2026 01:03:34 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a001771ce3sm40988705e9.7.2026.09.27.01.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:03:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Bradley Morgan <brads@mainlining.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
Date: Sun, 27 Sep 2026 10:03:15 +0200
Message-ID:  <01d7a085e56b860e83b65c96ff3dd86c4498804b.1790495516.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
References: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5814; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tbED6H+uNO9j4sNeW1XfmIj1+olsJu6Y+XghzSg+0Xw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBquM3I90huLNWoqer0vecmHul1P/4PZHEY9saxd L+Hp2SR8j6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarjNyAAKCRCPgPtYfRL+ Tk9HCACsuJ499gdOCZc+4Gi54sNr8y5PJqDOvUUtWk5MnlkDiy9SboZvlrRcjk9M6v0ViGgTyvw jtxAZoeES68zv17ShZgCddnuqfL3tLTdBoiT8MdF7q1h17h+40QjQaAhDYst1zYHlZZAxEixthv 1iRLov83u8refdKANJXnbbe2uEnVyJOCC676X+GNEA0SWWQdbNPCoO5QDDY8QURPBHVX0LnsUP1 mwHelKtK1REFccpF7TiSOACvyrREuLK19wyz933jvoUFNKbClg/IPph+JbXiEN+drICM/SteAr0 Q0HMd+VU/Gh8tWX46HW7NNL6vFDX+Gqsq8vPGfzWB2csjO8B
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Commit fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when
userspace manually messes with devices and drivers") introduced a taint
for usage of bind/unbind sysfs files that manually trigger driver probe
and remove respectively.

For drivers that do their resource management correctly (which is also
needed for module unloading) bind and unbind for matching devices are
not critical operations. The thing that makes bind and unbind unsafe is
that drivers can be forced on devices that originally don't match using
driver_override. The result is that e.g. of_device_get_match_data()
returns NULL despite all .of_match_table entries having a non-NULL
.driver_data member which yields a NULL pointer exception for several
drivers. And given that after setting a driver_override a manual bind is
only one way a driver can be bound to an unexpected device, a separate
taint for such an override is justified.

Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/admin-guide/tainted-kernels.rst | 6 +++++-
 drivers/base/bus.c                            | 1 +
 include/linux/panic.h                         | 3 ++-
 include/trace/events/module.h                 | 3 ++-
 kernel/panic.c                                | 3 ++-
 tools/debugging/kernel-chktaint               | 8 ++++++++
 6 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index a208811ad525..9ccac96b1f75 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to the aforementioned
 script, but if you need something quick you can use this shell command to check
 which bits are set::
 
-	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i&1));done
+	$ for i in $(seq 0 21); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i&1));done
 
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -103,6 +103,7 @@ Bit  Log  Number   Reason that got the kernel tainted
  18  _/N   262144  an in-kernel test has been run
  19  _/J   524288  userspace used a mutating debug operation in fwctl
  20  _/Y  1048576  device was manually bound or unbound from a driver
+ 21  _/Z  2097152  a driver was forced on a non-matching device
 ===  ===  =======  ========================================================
 
 Note: The character ``_`` is representing a blank in this table to make reading
@@ -193,3 +194,6 @@ More detailed explanation for tainting
 
  20) ``Y`` If userspace wrote to the `bind` or `unbind` sysfs files and
      successfully bound or removed a device from a driver.
+
+ 21) ``Z`` If userspace wrote to a `driver_override` sysfs file opening the gate
+     for unexpected driver binding.
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index c51ad96d4de4..7d5dc016a457 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -513,6 +513,7 @@ static ssize_t driver_override_store(struct device *dev,
 {
 	int ret;
 
+	add_taint_module(NULL, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
 	ret = __device_set_driver_override(dev, buf, count);
 	if (ret)
 		return ret;
diff --git a/include/linux/panic.h b/include/linux/panic.h
index 23976b1dfdb6..e6e24d8afcf7 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -90,7 +90,8 @@ static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
 #define TAINT_TEST			18
 #define TAINT_FWCTL			19
 #define TAINT_FORCED_BIND		20
-#define TAINT_FLAGS_COUNT		21
+#define TAINT_DRIVER_OVERRIDE		21
+#define TAINT_FLAGS_COUNT		22
 #define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
 
 struct taint_flag {
diff --git a/include/trace/events/module.h b/include/trace/events/module.h
index 19df3e39bba4..c7cdb1f53bc6 100644
--- a/include/trace/events/module.h
+++ b/include/trace/events/module.h
@@ -27,7 +27,8 @@ struct module;
 	{ (1UL << TAINT_FORCED_MODULE),		"F" },		\
 	{ (1UL << TAINT_CRAP),			"C" },		\
 	{ (1UL << TAINT_UNSIGNED_MODULE),	"E" },		\
-	{ (1UL << TAINT_FORCED_BIND),		"Y" })
+	{ (1UL << TAINT_FORCED_BIND),		"Y" },		\
+	{ (1UL << TAINT_DRIVER_OVERRIDE),	"Z" })
 
 TRACE_EVENT(module_load,
 
diff --git a/kernel/panic.c b/kernel/panic.c
index b824b68fcb08..f5476a61f6f3 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -826,6 +826,7 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(TEST,			'N', ' '),
 	TAINT_FLAG(FWCTL,			'J', ' '),
 	TAINT_FLAG(FORCED_BIND,			'Y', ' '),
+	TAINT_FLAG(DRIVER_OVERRIDE,		'Z', ' '),
 };
 
 #undef TAINT_FLAG
@@ -862,7 +863,7 @@ static void print_tainted_seq(struct seq_buf *s, bool verbose)
  * exact size is allocated dynamically; the initial buffer remains
  * as a fallback if allocation fails.
  *
- * The verbose taint string currently requires up to 344 characters.
+ * The verbose taint string currently requires up to 364 characters.
  */
 #define INIT_TAINT_BUF_MAX 370
 
diff --git a/tools/debugging/kernel-chktaint b/tools/debugging/kernel-chktaint
index d8628be37214..14d8febd6b16 100755
--- a/tools/debugging/kernel-chktaint
+++ b/tools/debugging/kernel-chktaint
@@ -219,6 +219,14 @@ else
 	addout "Y"
 	echo " * device was manually bound or unbound from a driver (#20)"
 fi
+
+T=`expr $T / 2`
+if [ `expr $T % 2` -eq 0 ]; then
+	addout " "
+else
+	addout "Z"
+	echo " * a driver was forced on a non-matching device (#21)"
+fi
 echo "Raw taint value as int/string: $taint/'$out'"
 
 # report on any tainted loadable modules
-- 
2.47.3

