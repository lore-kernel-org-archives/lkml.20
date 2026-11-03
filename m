Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716857;
	b=Gvi297k1Bm0h8HaMsPfktBrOTRygpTV5qLMvPyxapmhbEzIY/K5Bc30weO0IwO1TunDH
	 rERoMssBN/Tc1m3W0h+24+0OSCPwOLz9SXvF6F25J2dC7eN42dqsUyBWMKRiEWpzcE+Hc
	 Rvys/wxk3NFdBlm3Oi5Eh8c6bwl4R5lHYdaKnNZSPauD1zi9Xj7dURgVkaiLqQm2xNITC
	 UboNoPuGWitHdDS0GD5DmlDsbJll8W00BWP6eHYMMAT1zfyj2ykyvJ0/VdYa2oPfrqPnn
	 t8qCLQPvrtneR9EQpuQWQ+HmwHw28nRcJATxBPs3bIP+RbUKaMyg+SY3TtphpKGfFJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716857;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xVFCSnpoHTkjXKXkMIhjBkEu/g9NADtwh9818gNrn2I=;
	b=thz6aRBF+O8aFXlhxvcDLD5AMZ+8MrNQ/gm2opBufUpFgahlW+qTJ/7znwdCUd2d4Vk4
	 m7gd7gQeJeEroy1vMw5TetqeGfrsCmRALarg0TjaP1TLhPMIEPMdyxG7FFgQepu8EciI1
	 2ehfH7sHvtwDsVUKeSIvr9ALr6gz2FjYipHKNSb2g5g6Zy3ijiBzer/yIFonSGIvKmii6
	 czQow1QOQkcjcvERnjJdSq1CUPIhq2X10p9QQqPRT8CXiWVZsUQ9m8+CmZrzrq9BIfp8/
	 TubV9u7V9YaMlfWzH1/gn21gjkSKMvRuuIWJQsU02kAanUw52UAosotH8yMwTLcb8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=qSiyKrbD;
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C810608360B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C810608360B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=qSiyKrbD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793716845; bh=xVFCSnpoHTkjXKXkMIhjBkEu/g9NADtwh9818gNrn2I=;
	h=From:To:Cc:Subject:Date;
	b=qSiyKrbD9Y4voQ9Fs6r/Q35AxSWK4hFLCmgnAStkO/lqYzLHKXxiByU0nkwdQGTHZ
	 qJDHnFhl5o4bZZb177CY2tlelCAdck2S2plOqoowKyOFYFSA1vO+oWjLsQ6haQ0kuk
	 qpVWSq5Nc90QV+qcPUgoQu4N3/GzNqlR7trL+9vc=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:4bda:7622:58c1:3569])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A2BA52E5; Tue, 03 Nov 2026 22:40:43 +0800
X-QQ-mid: xmsmtpt1793716843tknjl8b9d
Message-ID: <tencent_5D9DCBD693C37FAA4FBCA042AB2FCF222207@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoevRnewaR+VRSu82L8Oc6hrJPIY8Yks3UcTtuf7gfL1MF9P38NMd
	 3hyVqXjbVcDEjZ8Ojda7gCI5FgTCEbw9wFSlxS4ChzctmilFtZov3O73q0g0ddHz1fxLjLTSG+KT
	 tk1GGSjuLJXdjRUm5nB/9Df9twUQaiP0vFcwNLkFIZwnQEOYiKAJFtqu7Zx8Na2ggULhTMYO/g36
	 26DUYpCKQj6PgW0AiogI1qOM37jUX6P+fM6JqUOOLf5rAhUGFjFq6e1AYw9abz1WZcLvjrUFa6O/
	 dpuh19yFHMVVvFDMLdKnQDruWYrceBfeCkiylgNwYHihVULrh7RZSVdJKTPCaFPPt1Iq2X9V8Ve5
	 UbgtwQLqxKxa66YCvAbSLpoG9kynPXIzB/5WaiPZiJp6pXQWzpLjQ8u5iDfWlQnX0o/rbTa4UNzS
	 bffIDt3A7wFNgmzagW6x9aGT2tZRA5ilZ07IHBtDVOBhBXzE6mWLS1vgiT7jiFxrzOgMcVzowxYA
	 8hg5g83IJsEwW2w2v92IPE0XC9p22QniedTV4cKfPCcXjk0ZIobebMydgLnBKjBQnLWFQ1BMF/iX
	 SDTTPRlF5YshyQk8wycIcWShgpnbYlTMpkR1HfIN2ee3k7s73JFjRnFbw1NH20gFTxcGezL6L/X5
	 846rkqykM67EBQ8iOEu6Px23zKqG1fxylkqs0jEOBiR0ShnrJeZklonozTRzCBa47yOqY4Z95UCB
	 +2yabEWnFVKp2j45m4p+UygZxWqelAw73u5mRJQp4C05/0wKnKpGWsRRkaUPD4BuMuJvRM4gdEAL
	 PdVo3bqTJOVCJqlwhvESOloboeqgzktHwvwy0wi0G0bnw1eQ1Lvu+tCP4MWgsTXmQ2YR3aIzm+4s
	 iujeytYq9a7xGW+9ALY2bVKXDQIaCoYIQEAW6jTdaNDDKVmdXay3eG5i3lyVfE82rkSUP2ehhDoy
	 u9RabZ8yB1moU7oligu2iQBzMN26pedczhea9daLQzBgbUskKjGUVo2611WTeRskhZGVYVqJKcCO
	 m4LWOyrgwd3LVym/02Y8WwgKv5bbMNOK3GDJEikQtI4NqKnmjxMUTFUZYDa9ajaeYBgvHE8TTPhB
	 AfJ0Xc
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yingjie Wang <1075151112@qq.com>
To: devel@lists.orangefs.org
Cc: Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] orangefs: bound op_timeout_secs and slot_timeout_secs
Date: Tue,  3 Nov 2026 22:40:43 +0800
X-OQ-MSGID: <424a00604a8762b1b9a65b078f03df6e74b436ea.1793716831.git.1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
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

service_operation() and wait_for_free() multiply op_timeout_secs and
slot_timeout_secs by HZ as int and pass the result to
schedule_timeout(). orangefs_init() only replaces negative module
parameters with 0, and the /sys/fs/orangefs attributes store any int.
Negative values are not valid timeouts, and values above INT_MAX / HZ
overflow the signed multiplication. The result can be negative, zero,
or much shorter than configured. Negative results make
schedule_timeout() print "wrong timeout value" with a stack dump and
return at once; all of these cases can make the operation fail with
-ETIMEDOUT before the configured interval.

Reject values outside 0..INT_MAX / HZ when the attributes are written,
and clamp the module parameters to that range at load time, as negative
values already were.

Fixes: 274dcf55bd4a ("Orangefs: kernel client part 3")
Signed-off-by: Yingjie Wang <1075151112@qq.com>
---

Notes:
    Tested on x86-64 (HZ=1000) in QEMU with the orangefs module and no
    client daemon, so a pvfs2 mount waits in service_operation(). On the
    base kernel, op_timeout_secs values of 2147484, 2147483647 and -1 were
    accepted, and the mount failed with ETIMEDOUT after 14-29 ms with the
    schedule_timeout() warning; loading the module with 2147484 did the
    same. With the patch those writes fail with EINVAL and keep the old
    value, the module parameter is clamped to 2147483, and the mount waits
    (stopped by a 3 s userspace timeout). 1 and 2147483 behaved the same on
    both kernels. slot_timeout_secs was checked through store and readback
    only; its wait needs a running client. Also built for i386 with W=1.

 fs/orangefs/orangefs-mod.c   |  8 +++-----
 fs/orangefs/orangefs-sysfs.c | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
index f591f09531da..7a62d4987175 100644
--- a/fs/orangefs/orangefs-mod.c
+++ b/fs/orangefs/orangefs-mod.c
@@ -83,11 +83,9 @@ static int __init orangefs_init(void)
 	int ret;
 	__u32 i = 0;
 
-	if (op_timeout_secs < 0)
-		op_timeout_secs = 0;
-
-	if (slot_timeout_secs < 0)
-		slot_timeout_secs = 0;
+	/* The timeouts are multiplied by HZ as int. */
+	op_timeout_secs = clamp(op_timeout_secs, 0, INT_MAX / HZ);
+	slot_timeout_secs = clamp(slot_timeout_secs, 0, INT_MAX / HZ);
 
 	/* initialize global book keeping data structures */
 	ret = op_cache_initialize();
diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
index a02bfc7b3542..1873a4f5cd16 100644
--- a/fs/orangefs/orangefs-sysfs.c
+++ b/fs/orangefs/orangefs-sysfs.c
@@ -270,6 +270,21 @@ static ssize_t sysfs_int_show(struct kobject *kobj,
 	return rc;
 }
 
+/* The timeouts are multiplied by HZ as int. */
+static int sysfs_timeout_secs_store(const char *buf, int *timeout_secs)
+{
+	int val;
+	int rc;
+
+	rc = kstrtoint(buf, 0, &val);
+	if (rc)
+		return rc;
+	if (val < 0 || val > INT_MAX / HZ)
+		return -EINVAL;
+	*timeout_secs = val;
+	return 0;
+}
+
 static ssize_t sysfs_int_store(struct kobject *kobj,
     struct orangefs_attribute *attr, const char *buf, size_t count)
 {
@@ -280,10 +295,10 @@ static ssize_t sysfs_int_store(struct kobject *kobj,
 		     attr->attr.name, buf);
 
 	if (!strcmp(attr->attr.name, "op_timeout_secs")) {
-		rc = kstrtoint(buf, 0, &op_timeout_secs);
+		rc = sysfs_timeout_secs_store(buf, &op_timeout_secs);
 		goto out;
 	} else if (!strcmp(attr->attr.name, "slot_timeout_secs")) {
-		rc = kstrtoint(buf, 0, &slot_timeout_secs);
+		rc = sysfs_timeout_secs_store(buf, &slot_timeout_secs);
 		goto out;
 	} else if (!strcmp(attr->attr.name, "cache_timeout_msecs")) {
 		rc = kstrtoint(buf, 0, &orangefs_cache_timeout_msecs);

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

