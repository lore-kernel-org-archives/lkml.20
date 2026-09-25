Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA3416843
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360457; cv=none; b=guV3pwr3Iy0dMUWxkvJBjFnzatadMndiemVO9R/y6tYWfFa9toPQfSe8GgvU4icck9+DCEUhHNCoXhPzKzaMagf5EV5UmB+fWTn+u41dk/6nYvbDSrUr53aX8Ai7yQrzif5Vr4tkDgWfo6aHNdo/aL5VyBk3a/fzcWji9kxr4n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360457; c=relaxed/simple;
	bh=ZdDl2k6VSNRAjMa5sv67qNx0uk5Bqx9XHKnqQE++CRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=USbMaUjlAuw+1u/Qb1yyG8M3cB9QqG9ZlioqxjWsnECNEN3txgCDi3r9cxU0om6KEU77Mwr3pSDXCAvnLGTSDQRO5buUcf7aeewXlWQATzS1ySvaC0C+UZGlgCtddoT2/mH3ycqbP4tpzW+KgvsyTLlzxZ1x6MfFOHSTrgATJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WLXuwkeW; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WLXuwkeW"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so1016357f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790360453; x=1790965253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbJed3QIlE5is+wfCiIzfB4icHHTL/FXBZcCdh6MKMc=;
        b=WLXuwkeW4W8i+u6relJA23AO2ZTEsUeV8Podz5ne6NUwy3CvGclMY3iJ1KLe8FUW2n
         uL/2sAH5e6lV5W5Zz0xrFpnQH/WinwdC+h+cQtsnKjcevP/VovuI1tlONLwPeiHPkGm4
         MB9DiLMzopZTLxDxtf+4OVgnN7ILKNIcLnwSWqVZCSEcVO0YMQ9yhrHJNj3u72KEkbW9
         6gK/4dyWiqDPs+RurAzISqYYWAs1WMCPK295lpqUT42nIPDa6HamtQ0/NMr1qwfQkV8+
         Q4K0KJ+VUdqtUlMsRhHNquPId6B87c6IFSvgQP1Y1pMLUDd7KZCAgDfy+qtBMNf/t2EZ
         2esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360453; x=1790965253;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbJed3QIlE5is+wfCiIzfB4icHHTL/FXBZcCdh6MKMc=;
        b=Ki5RdqUZoxIko+097Y+RJU8Rts70BGk8sbIYp94Uxas4wkJOFYz7nEoNHm9ZG+8OWY
         MMauGmQC06RliBF5jJrNar4/ch+7+Tx55SZn8+dcjQY1EDxBsxg4KkqqawYwVQGnoajA
         KVufj81at5IKLM42voNSTjolFJGoq2pWIMGijAlZ3hgx6Hm5dXZwQLvPZOYtEUoTzTgI
         vWt/IPLBscXOl1gOXVrr1JSk+6tFhF3Hkn6znGJUxasql3dmi5xeR9PkBw2y2s+mEW5N
         zIoud1/IWl/XbVSlwooprLr5kbCCVDQU79FJV5DzRNsFp7MCNpPrZrPJCDo/53svBIX9
         g4Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwjgavOcA6l10DruyZRa2ADAQw1N9+rssuZJD/qH7MQbt13tv2bTOncNK5VuqVgCyS80yiKS6Nyf9QUSfA=@vger.kernel.org
X-Gm-Message-State: AFuF++mCETi432+xfmREYJHVNuWeoobAiSMnk2huD4ixZEx/LSjQEa2g
	FGlyEdLm6I1Ckqi3L0+QKcK5FGMvJ+MVUdyW3oKKw0Nd8VITM4GikZ6NuF1fYtGcwm4=
X-Gm-Gg: AYBFou23ipg+iVIHoTAVVZP0SJRSZLxRobcPx1v5Zb/HGonbOiwlgWSzzo39bTb7HHP
	47D9eK2fibmJxsFI7dJ4VH7ikMmCuzVehjIGoa+LB/CJLf5uzmvsutpnuLse39U9dM7fTSqallg
	I+BamViGC1Q31JTV2CKQ/N0M0D8NNYKBtaiwh+YU2A7vvbdoGEZeVcK6JpEPWhFiHk3wWs1RrPb
	BiowuO5NPkfTrYpZ8Tx8G6uCNdkP42k4BtmOMysGu+ryNZmg9SjGUQ1K1gQcEt/0p8+EjvAnDa3
	xRlEphsYIty07p4brxl42BmhhPiz5sQJWiJSg3CM1GaNNDrTY3pXTAhEPSEVdOvRS/gREDohHfN
	zU6QuxawER3dkDA9Y2gOiaHnoBVPMfjbbsF8RC2n70XaJOmjb3SzGK+YJfv4jNxca9Tw9T+FvOx
	6TixKJDdmH9qZNWH000cZd4ahAmgEne0BYo5OQRSokFdXBC7kaQSW9DdCZJUV26O3wS3NiLlBaj
	EfComq9RbTGAOrSoYmOnI973qw2d6XTXQJgM+9/SalzWYFj7V3Dg8ZGZ1bO5A==
X-Received: by 2002:a5d:6f05:0:b0:487:8c7:a275 with SMTP id ffacd0b85a97d-4887166bba6mr12471077f8f.0.1790360453543;
        Fri, 25 Sep 2026 11:20:53 -0700 (PDT)
Received: from localhost (p200300f65f19a904b61bffe3a87d7bb6.dip0.t-ipconnect.de. [2003:f6:5f19:a904:b61b:ffe3:a87d:7bb6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4887a2acb4dsm8909485f8f.0.2026.09.25.11.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:20:53 -0700 (PDT)
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
Subject: [PATCH] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
Date: Fri, 25 Sep 2026 20:20:40 +0200
Message-ID: <20260925182041.1025371-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6316; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZdDl2k6VSNRAjMa5sv67qNx0uk5Bqx9XHKnqQE++CRc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqtrt5auzK2O3znYA5mSO75OtU4S4MLYgfvL8SR fExzta4CP+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCara7eQAKCRCPgPtYfRL+ TgXBB/4ipbjI6msdOdOEh0N1yvy5qoA1pPLxBUK+WO0FZ4y07WBzGVebN2SFV1WLEuqGhxOGPiA lRoDLT1Y0fv+jICbdribCbx1WDBpkM4Z9ZGpQTpiohUhE/OZG2pFnTRlQWJTGm6C8nFA/2aMC24 WPAmCCkkonSxzTWTWFa8t3Z8pIsyMBv9ZzUL6e2izfQQ+GscGlpdFWHVQqiHrLSCsirRPFXFO8e YBpOgaKJg48nUyjb5K/Tv4JGgyE+jvLtmCRqBP2cs3ebSzP1an54iIN3ttm5LgFetJ2pOpQ4znH F2erxa9l5WWsxpsou0IytKTz1nTp4w5rW38OCCdm/N633Aj5
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

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I first considered to just set TAINT_FORCED_BIND when driver_override is
written to. But IMHO it's very useful to differentiate for reported bugs
if bind/unbind was used in combination with driver_override or not.

Also if only bind/unbind was used and driver_override not, a resulting
problem is worth fixing (opposed to what is considered for
bind+driver_override).

IMHO it would also be fine to drop TAINT_FORCED_BIND, but let time prove
how many reports we get with TAINT_FORCED_BIND but without
TAINT_DRIVER_OVERRIDE.

Best regards
Uwe

 Documentation/admin-guide/tainted-kernels.rst | 6 +++++-
 drivers/base/bus.c                            | 1 +
 include/linux/panic.h                         | 3 ++-
 include/trace/events/module.h                 | 3 ++-
 kernel/panic.c                                | 3 ++-
 tools/debugging/kernel-chktaint               | 8 ++++++++
 6 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index abbf5e3dd749..75750a9533e9 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to the aforementioned
 script, but if you need something quick you can use this shell command to check
 which bits are set::
 
-	$ for i in $(seq 20); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
+	$ for i in $(seq 21); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
 
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
index c51ad96d4de4..6e91210aab45 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -513,6 +513,7 @@ static ssize_t driver_override_store(struct device *dev,
 {
 	int ret;
 
+	add_taint_module(drv->owner, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
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
2.56.0.rc1

