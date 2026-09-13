Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758CD2F531B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302740; cv=none; b=OaAJVu1i3us+OGD9aOF6SMoLTEtZDMqztdM/IPLn8wOz0Yx3kokl7VCMdDhGjkoTcLbunR1sRRPBCKrgvxV59PaNCExUsWpJnRD0/J7onssZ7N9BKsWs+jXI2LfAHPnkN7g6eCoSXf+7bavYCKXNm3OUaW3vOiO1KPTtuGdtWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302740; c=relaxed/simple;
	bh=A77NeK3+mjmFazNZtRVxwf6fv29s5tAKxMRe4cpoOf8=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=l4+Pp0XVpCH6x+zVT9b6rtQrNMnhaU2o+wIS0kN5bjBbzYlxb/TY4cb7I/iYX2heSyKsshqzdoIpnve0Jgdf8c8YTHplZrle6GGiRztByRdsemc4s85xJze7UT6VBUE/b+jIfho7v+bB1T62d+Hy8v1cZQb0kNsTsTkJ/1J5k2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjK0oRVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjK0oRVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2661F000FF;
	Sun, 13 Sep 2026 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789302739;
	bh=4H7nkl+x01dYMJ/BgN2z8qugysv2dLiAVB+JlfEitcQ=;
	h=Date:From:To:Cc:Subject;
	b=MjK0oRVcXeCVSR5AnZFZMYlul/o7XI4ACYLO4+7SU67K7OSvGIWv55/HsnMUpwKx2
	 3rpc8mZGmpeILsGQmiwUuYLfd/0bP/25H5D00Q1OcGGLLHJiDK3tCy1pmDoq3CkGXu
	 qqIvgIpwTTsGzxoFECQ3ekJr+zv5DQt0YGgUkNRBPtoDHuXU+3TI8JBK2XktwqFhRl
	 wTZQCZ5oi8NLfa2xz9GcoP8HxJJHdFDA6WHIEHjPHvvs5/Dm0tkDVmn7bg+rD+Oxzy
	 LafKzBRgs1IdNAa3O0CBFP/2YVv/Qoj9QCA/7cwC/Zag7w8/b1xHQCbn6LZ1kdKLe8
	 Akr4qGNoADmSg==
Date: Sun, 13 Sep 2026 21:32:15 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masami Hiramatsu (Google) <mhiramat@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] bootconfig: Fixes for v7.3-rc3
Message-Id: <20260913213215.664a6efc4b690c9c78d7985a@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Linus,

Bootconfig fixes for v7.3-rc3

- bootconfig: Fix integer overflow and truncation vulnerabilities in size checks
  . tools/bootconfig: Fix integer overflow and truncation in size checks.
    Fix size check bypasses caused by integer overflow and truncation
    when parsing initrd or standalone bootconfig files, preventing
    buffer overflow and out-of-bounds writes in the userspace tool.
  . bootconfig: Fix integer overflow in initrd size check.
    Fix pointer arithmetic wrap-around in get_boot_config_from_initrd()
    when handling crafted huge size values, preventing fatal kernel
    page faults during early boot.


Please pull the latest bootconfig-fixes-v7.3-rc3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
bootconfig-fixes-v7.3-rc3

Tag SHA1: e4d95ea65a846d314cd9ef7655ad4ba3f7ff01ad
Head SHA1: 7812d6dab0698001e50e8c2f901e17da3eb6f429


Masami Hiramatsu (Google) (2):
      tools/bootconfig: Fix integer overflow and truncation in size checks
      bootconfig: Fix integer overflow in initrd size check

----
 init/main.c             | 25 +++++++++++++++----------
 tools/bootconfig/main.c | 13 ++++++++++++-
 2 files changed, 27 insertions(+), 11 deletions(-)
---------------------------
diff --git a/init/main.c b/init/main.c
index 2613d3f9b3ce..16749bb7a219 100644
--- a/init/main.c
+++ b/init/main.c
@@ -277,7 +277,8 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	u8 *hdr;
 	int i;
 
-	if (!initrd_end)
+	if (!initrd_end || initrd_end < initrd_start ||
+	    initrd_end - initrd_start < BOOTCONFIG_MAGIC_LEN + 8)
 		return NULL;
 
 	data = (char *)initrd_end - BOOTCONFIG_MAGIC_LEN;
@@ -294,16 +295,26 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 
 found:
 	hdr = (u8 *)(data - 8);
+	if ((unsigned long)hdr < initrd_start)
+		return NULL;
+
 	size = get_unaligned_le32(hdr);
 	csum = get_unaligned_le32(hdr + 4);
 
-	data = ((void *)hdr) - size;
-	if ((unsigned long)data < initrd_start) {
-		pr_err("bootconfig size %d is greater than initrd size %ld\n",
+	if (size > XBC_DATA_MAX) {
+		pr_err("bootconfig size %u is greater than max size %d\n",
+			size, XBC_DATA_MAX);
+		return NULL;
+	}
+
+	if (size > ((unsigned long)hdr - initrd_start)) {
+		pr_err("bootconfig size %u is greater than initrd size %lu\n",
 			size, initrd_end - initrd_start);
 		return NULL;
 	}
 
+	data = ((void *)hdr) - size;
+
 	if (xbc_calc_checksum(data, size) != csum) {
 		pr_err("bootconfig checksum failed\n");
 		return NULL;
@@ -394,12 +405,6 @@ static void __init setup_boot_config(void)
 		return;
 	}
 
-	if (size >= XBC_DATA_MAX) {
-		pr_err("bootconfig size %ld greater than max size %d\n",
-			(long)size, XBC_DATA_MAX);
-		return;
-	}
-
 	ret = xbc_init(data, size, &msg, &pos);
 	if (ret < 0) {
 		if (pos < 0)
diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 7dc9fff9b637..17d971d47f87 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -140,6 +140,9 @@ static int load_xbc_fd(int fd, char **buf, int size)
 {
 	int ret;
 
+	if (size < 0 || size > XBC_DATA_MAX)
+		return -EINVAL;
+
 	*buf = malloc(size + 1);
 	if (!*buf)
 		return -ENOMEM;
@@ -168,6 +171,13 @@ static int load_xbc_file(const char *path, char **buf)
 		return ret;
 	}
 
+	if (stat.st_size > XBC_DATA_MAX) {
+		pr_err("%s size is too big\n", path);
+		ret = -E2BIG;
+		close(fd);
+		return ret;
+	}
+
 	ret = load_xbc_fd(fd, buf, stat.st_size);
 
 	close(fd);
@@ -218,7 +228,8 @@ static int load_xbc_from_initrd(int fd, char **buf)
 	csum = le32toh(csum);
 
 	/* Wrong size error  */
-	if (stat.st_size < size + BOOTCONFIG_FOOTER_SIZE) {
+	if (size > XBC_DATA_MAX ||
+	    size > stat.st_size - BOOTCONFIG_FOOTER_SIZE) {
 		pr_err("bootconfig size is too big\n");
 		return -E2BIG;
 	}


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
