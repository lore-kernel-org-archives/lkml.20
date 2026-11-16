Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845834;
	b=d9e7alhlpVaFF81XzfQ7rt3rD/eyWBY9a9JvkROczaN4wDAarI2xUs15bYOhjSxWKu5z
	 8A3NjvkJQ+xk4xMr9hNSGXhsRrzV3j7fo6dnlNuYU4VwINB6RRYEvlMs/0qQrHvzoSN60
	 q28O7080ITrbpYhB318YhOCeysNLIb4lrdTH5u0kS/BkWL8vx8T14X/Od7lYPs30CGZJo
	 eNML8td3VTRw1MPShb1Nflf7IKLFCB4uVGOqVfvsRDF0cmlaH9JBfc4UZGs2dfAyWoydl
	 0uXiBDMwjrMpVoC19M0t58wWis8Bw2cS1xkysR8+WKNUryY9s3rXO4I+lisRl1eyYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LXLsnCGLn99Rii/zo7DVAR+4dbpEIfGn2iUPp4MhUNw=;
	b=hgoNZCvq+yRHFmzakDL6/5Y2dA2GhlVcO23imZgjCNSr+sEpI/Ozt+bg5QILQc3CW4D7
	 Bs5nuNA9Hnz/9Xdktd4iLULcGY+sl87prUlsw2cd6pLEnOzeHkKlHHpes5dgBuCgslqNO
	 nTdFA1ikrOtQfg5pOCKPn6mjDz3u5n5H7zJ/wQdssDmHUv8jJVrOA5ciHZ9brvcjZbEAn
	 EZdiKeoyregLHkyv4hvyzY3uE/jzPqcg3ZDZRv6VnuaKtxR6WB+evvV1lX3z6wGgVD1wB
	 UfhhuwpwZBsd9jpN9M7h8RwW7qeft03Gyp1pSwnibnz4oc72LKJbriGGE+3kWDnKs0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6ozuTIB;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459A606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7459A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6ozuTIB
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37628596783so6077797eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845834; x=1795450634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXLsnCGLn99Rii/zo7DVAR+4dbpEIfGn2iUPp4MhUNw=;
        b=S6ozuTIBc4jmKCgCpHjbegl56ihuUma84uTM6KLF7Q4bWuVvPXW4q1EIWZv7B/CesT
         hPF65gopp7Q7DJbay9/J55sKPs8To25z0yJOzJ0T1oUeATVw/6BesyzORu4a/KKZ+yn5
         jR1IY+EhtfPyPY6NwKcpT/wDMJuJgjx5shaMJCHRy4XGkk/8YjUVJNOFwqYqGiof7qTM
         Z2Ey+1t1AWiagPEyX4MwMRYcq1uWwcEERnucwp5PI4QosEPQw0gM9kwWU6r/IZ7/m6uS
         F1OJUCfhLsovD4hKFJlikaX8jqjsm8riQFGjtMJ5mvrjOFFTrLBUxMpQJhykp7le5Vrg
         f+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845834; x=1795450634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXLsnCGLn99Rii/zo7DVAR+4dbpEIfGn2iUPp4MhUNw=;
        b=tUdPVc18ZeEWSIJlOumAqg0AALyBmpCbvYmmLKEAS8h90G2QhqBfzPC1QEIyH/andE
         gaLdIwqhdo0OlZsOkxvcC+buPCS8Cu36kXDv5zXc4Lc38HRgx1h952nXveoPiSIuv1dL
         geVFtQXwkJ3ojgusidzA5L4EYt/AV/EOX9qox+orVmat549U1EWhCwPm/13/aYoh6GtX
         27Cbcqhs4sDXpZnV214d7KIgzHjjLPvTRcsgmh87ZhzxJU7KZriawfAm1PpcJa4vAJgu
         86LRsTAtxebUycjvQG+EK+yZH9obWyjiUkLP4+5E7gy2ahgtM72agz8jhDeGbjzjOCTX
         Nilw==
X-Forwarded-Encrypted: i=1; AL+hErHtdmq4lY3mw3QwaXQWoPqCm3rKjMFr2EYLS7SLUfzWCQ5/ry1abrBak/jo2k+PQnUr80sn/Xfip0dmdyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T8QaicunItgLCGvJ0WWyKUd3jjcJnuNUGkmgcIveBVuKikBvN
	UrG6LwS0cbk/WaDvQi7QrM3wPV3X1j80upYPGxbxEDYfTym0V4u3ls/f
X-Gm-Gg: AZFdTZc6jxrZOjER2zN26+X5jvjiidTIuBDkjh93AO2n+UVW7ztSfiM6Jzm5yXpp213
	8wfPn23TRlEiOvRcxGVq3NLv5WVdc3f1ifHq9oOqBcMMuOzMqe0bgFmBbcRiVWEUCWiqJlQGqDT
	WUaErLArvsezqzLsg9WeslFLf6pNNxoS+c0j0h8bRCDko1DitvGSea/eysTggwDCVSp5SPefrNR
	n8/hqERKdgYL5LPww7g5H+fLjNBlm+2aQWgcbcg7EFFJYgJ1pEqY7rGXWWDUw7164RwBA2dWmrY
	lX1EwNxk8mxfKYYoORKFERXIkdjwRNjT5No6ny0wUcUOL9fnr+5v3fepZIS3JhQieZ882rVeqqs
	W2lBvRqhn8MTFaNXl06WIUxT7hdCP9AeOGswW4mtCq/9aSMA+gvvkKL7S4AOnoSeeECg3FYDh1x
	RgG+/wNDGnmebgltUQQEAB69BpStMx7m2LHMIlscJyd/AbOr3xzIRLrkIwa3YL10R63s4Uvx/2N
	Ihvu9kXiNrd2vRF7LufW8V6lKlQQzaxUdZbSJCznR1qTeBXZVrRr/ACqC/Y0pQVw3u3prK3jrv4
	BzcFOpQ0ytHTp1MWa7MiryOBpfUV3QWQvNmCC2cLz1TQeqVEcIe5
X-Received: by 2002:a05:693c:829b:20b0:374:ba43:ae2e with SMTP id 5a478bee46e88-3796628d568mr12354359eec.14.1794845833484;
        Mon, 16 Nov 2026 08:17:13 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm53896543eec.8.2026.11.16.08.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:17:12 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH] ext4: fix wrong unit of ratelimit_interval_ms sysfs attributes
Date: Tue, 17 Nov 2026 01:17:00 +0900
Message-ID: <20261116161701.3664310-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interval of ratelimit_state is in jiffies. But the
ratelimit_interval_ms sysfs attributes are read and written without
converting the interval, so the values are in milliseconds only if HZ
is 1000.

If HZ is 250, the default interval of 5 seconds is read as 1250, and
writing 5000 sets the interval to 20 seconds.

So use jiffies_to_msecs() and msecs_to_jiffies() when reading and
writing. Also reject values which are too large for the interval.

Fixes: efbed4dc5857 ("ext4: add ratelimiting to ext4 messages")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 fs/ext4/sysfs.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index 923b375e017f..7cc3a2e663f0 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -33,6 +33,7 @@ typedef enum {
 	attr_mb_order,
 	attr_feature,
 	attr_pointer_pi,
+	attr_pointer_pi_msecs,
 	attr_pointer_ui,
 	attr_pointer_ul,
 	attr_pointer_u64,
@@ -215,6 +216,11 @@ static struct ext4_attr ext4_attr_##_name = {			\
 #define EXT4_RW_ATTR_SBI_PI(_name,_elname)      \
 	EXT4_ATTR_OFFSET(_name, 0644, pointer_pi, ext4_sb_info, _elname)
 
+#define EXT4_RATELIMIT_INTERVAL_MAX_MS	(INT_MAX / DIV_ROUND_UP(HZ, MSEC_PER_SEC))
+
+#define EXT4_RW_ATTR_SBI_PI_MSECS(_name, _elname)	\
+	EXT4_ATTR_OFFSET(_name, 0644, pointer_pi_msecs, ext4_sb_info, _elname)
+
 #define EXT4_RW_ATTR_SBI_UI(_name,_elname)	\
 	EXT4_ATTR_OFFSET(_name, 0644, pointer_ui, ext4_sb_info, _elname)
 
@@ -258,11 +264,11 @@ EXT4_RW_ATTR_SBI_UI(mb_stream_req, s_mb_stream_request);
 EXT4_RW_ATTR_SBI_UI(mb_max_linear_groups, s_mb_max_linear_groups);
 EXT4_RW_ATTR_SBI_UI(extent_max_zeroout_kb, s_extent_max_zeroout_kb);
 EXT4_ATTR(trigger_fs_error, 0200, trigger_test_error);
-EXT4_RW_ATTR_SBI_PI(err_ratelimit_interval_ms, s_err_ratelimit_state.interval);
+EXT4_RW_ATTR_SBI_PI_MSECS(err_ratelimit_interval_ms, s_err_ratelimit_state.interval);
 EXT4_RW_ATTR_SBI_PI(err_ratelimit_burst, s_err_ratelimit_state.burst);
-EXT4_RW_ATTR_SBI_PI(warning_ratelimit_interval_ms, s_warning_ratelimit_state.interval);
+EXT4_RW_ATTR_SBI_PI_MSECS(warning_ratelimit_interval_ms, s_warning_ratelimit_state.interval);
 EXT4_RW_ATTR_SBI_PI(warning_ratelimit_burst, s_warning_ratelimit_state.burst);
-EXT4_RW_ATTR_SBI_PI(msg_ratelimit_interval_ms, s_msg_ratelimit_state.interval);
+EXT4_RW_ATTR_SBI_PI_MSECS(msg_ratelimit_interval_ms, s_msg_ratelimit_state.interval);
 EXT4_RW_ATTR_SBI_PI(msg_ratelimit_burst, s_msg_ratelimit_state.burst);
 #ifdef CONFIG_EXT4_DEBUG
 EXT4_RW_ATTR_SBI_UL(simulate_fail, s_simulate_fail);
@@ -434,6 +440,9 @@ static ssize_t ext4_generic_attr_show(struct ext4_attr *a,
 		if (a->attr_ptr == ptr_ext4_super_block_offset)
 			return sysfs_emit(buf, "%u\n", le32_to_cpup(ptr));
 		return sysfs_emit(buf, "%u\n", *((unsigned int *) ptr));
+	case attr_pointer_pi_msecs:
+		return sysfs_emit(buf, "%u\n",
+				  jiffies_to_msecs(*((unsigned int *) ptr)));
 	case attr_pointer_ul:
 	case attr_err_report_sec:
 		return sysfs_emit(buf, "%lu\n", *((unsigned long *) ptr));
@@ -509,6 +518,14 @@ static ssize_t ext4_generic_attr_store(struct ext4_attr *a,
 			return -EINVAL;
 		*((unsigned int *) ptr) = t;
 		return len;
+	case attr_pointer_pi_msecs:
+		ret = kstrtouint(skip_spaces(buf), 0, &t);
+		if (ret)
+			return ret;
+		if (t > EXT4_RATELIMIT_INTERVAL_MAX_MS)
+			return -EINVAL;
+		*((unsigned int *) ptr) = msecs_to_jiffies(t);
+		return len;
 	case attr_pointer_ui:
 		ret = kstrtouint(skip_spaces(buf), 0, &t);
 		if (ret)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

