Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891742;
	b=lJCvmeQhZS5p8kekmrrcAsaIekbFIEa0Ws/pEPoyvYAj9BQ7F6zJYMIVMErHlTXLcQ0r
	 CfTxBkbKX5Q5z1YxKJAJyy62HA+pILWwjKR4mposHJpslVaZ+RSK+7AzkQQton1JLQThH
	 TGiaiksNfDiNLQQQLcXfyvrT7mhtEq0Km0/KqHqGfv7GGcS03H5OozrtzDRAV2nWnkppm
	 KCuMA1hYNK0/UXoagNY6ek9nfyINoT/rddflrFpWrIV+Vy109wygTSiqCeaTo89scuIa3
	 hrqu5P7bvYt2GLffcctFwJvLblpW7/TFVk4lPympSYiF5jQHFAYEDdIoAOdOn3aeH0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DTvieg65EmmbVfsOhPpX9x+IrMg5RYBWWbeds/DgorY=;
	b=FFQqlOCjyVMvJgjFfBJAk5Kjb3XoXQpkSRQg5pp6b564yfu58u1LfZIusYlap9jnV1gn
	 68WgSyvXlB65F2TYvTDG7vgiBabLguzUl1K0elYcJZ453fTl5oUHSFI/9Ja8NLFa0hTkV
	 kSVVCtS/3hn8+spGxn+kpS4iKKAFJWZiH7dH0nxiQs87GhwxB+FEjQBNahAesh+wXni9X
	 Jdh+5DIQed1Xrea7ew6dKBasq3H4Wyi6L6/jUtvYnEgNQqrkz4vr7Urq9W9Qa0pB52Eqx
	 j2jx4K08vHrj1AlhwIqBnpwQSM4CyEPpwt/NktrHOrEL16oLHPfK3hpoocR9wiz9UEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=oFezGpCU;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A04606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A04606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=oFezGpCU
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5364042eecfso27027951cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891741; x=1794496541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTvieg65EmmbVfsOhPpX9x+IrMg5RYBWWbeds/DgorY=;
        b=oFezGpCUrNjSG+SCEVEL57o3m8A8tMdNeLpEV2NyRztsSzsiNYMfKetfwAmhSUTVEY
         e86muBerPXrFtgoFHmgyTZclp1J+F7mIMDwJi9E8FURUsfEaVpDm/8CTlYwk281DPhOM
         X5WHWnW1faDOLeUJbRxoGMm+F3v8A8Yfj8vmQWG1pXanQ1zvUJ92OXR0piXdbKMstCEJ
         rl4myJT2AE7Jy6Qgc1XFWjqLyslvLsK08mlfeOdd6Gr31rs7zqtjcW0Pq1QNxGB0QUIX
         AKSchXfb55hU3P3I9C7jBOYSc94BRQ1GrK1houbJo6Mhdz1xXmHvnSs/aJMJpg+KglU+
         GwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891741; x=1794496541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTvieg65EmmbVfsOhPpX9x+IrMg5RYBWWbeds/DgorY=;
        b=eoR4PUxzJhxT8Q78CmKxBIHkMWX++rIsCjVFFigw3nEVdz37qgDmsuUk9coU+HNCzj
         KAUN0l5hrdb72tfoUSLnM4lZedoMLVap/+yjDh+O6d7DniYG58lCoICHKG0l7xhcmKyB
         04g2Av0NOkqWeg7Lh8cceYkH/vuYosguTkGnFd930ta4GDhEcP8HjjLMe/8f9V7JKDCB
         kUvhaKlZXKC/DQrjOwW0izIWk1tKLrgwPEikjD05FWh3XgpuQWLxfI3IxN7Yk78VajKG
         NrEWq8TbkJeBqwCpFbQslFT8Oc7jtvWotcw3vP+NvcXu1GUpk55sAl6MjSaynWQ00QPM
         wEDQ==
X-Forwarded-Encrypted: i=1; AKwUvBycNWdceX1ecrt5YfKQ5gEDhim/qevkWPE6U7LQtS3qC9fAmbg/QDTpNxDOSFTumIFyPA3B3sSoRRfHtMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LASNb8Ad+osggZ3YPWBUOGg0aZ4o7tWllXViqOEqFL+FPHWC5
	IvST3tolYwIgCDNcub4ZRbgW9NCkB6wUAquTa6ZnhZjC3DRbr+sXcqQi4s4cn+LupTI=
X-Gm-Gg: AYBFou3yOysPg6e5QdZPvpN4AHgxJGyhnPux+d9ZngCOpqdyPEzoKSCsl9GkvUN98SW
	scZf/KGXK6gk7DSatu6eWfZETMatHMkfZHy4sP1ljeqQ/CDLxxevEld4POYJOPT1nuW4uMoZOsO
	gvCOe38yCDguUq9ewqaser/i7MCkPZg29j3QApoLCbCk/5NF6gSSCvSE+qli8tjfMDgRVZlIz+V
	u86ZZlmQtar269HqZdGn8w0XfuIFY7kufAEOu1MmDwoTz+mhQYCFTS9jEropDLwYkok0q6jDOcR
	x571ilRjVGAbAWg4yFXHWZ2JYlyGghn1AvzgJpAjnBcGIzycQvBkTB0nDs+l64XK5YmxHkVhuO9
	t1d8zWpyswY6y+fPfrZeos7S7F/B88BHWzkBlxH7Zu0XzgFJdsV+JvrH7Tujqs6igDnZEAwIHaG
	Bvh9N1yb3EPsXWXo/qLBKlEnJ5HyX+nJe1I5Q2LD0NmyAH1Oo2zXEnbR9SyJK6a7AtAAYh5kNDc
	XFHGaYFe2BEB9NrXqXLyLXVAFWd1uSWiO2gwBd92HP72fEgYtmE23UponSuV9QJQXWg8/l7ulF6
	wBfmL50HlnPfI92Ix1wzixXjwRU4wxQ00eGpxbqEx3k/SQ==
X-Received: by 2002:a05:622a:1393:b0:535:bb7a:884a with SMTP id d75a77b69052e-542b62a5728mr333165041cf.19.1793891740628;
        Thu, 05 Nov 2026 07:15:40 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c49ab3sm53506771cf.19.2026.11.05.07.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:15:39 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:34 +0000
Subject: [PATCH RFC v3 42/90] pidfd: let pidfd_configure() place files
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
Message-Id: <20261105-b4-cells-v3-42-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=4837;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=HrZ7hOpfLM8uTyw2tN+osdrUdjxsSzd8LTpZf1J7bHg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNWtyoXBgpADOqby7hoXiq9tNoiPcqqDeLLOKMbLpw1JoipaDLBSS16TncGPRlBXjrlaH94KWux
 amu8jnfzKLAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

PIDFD_SET_FD with a decimal number as the key places a file at that
descriptor number in the new task. The file table of the task starts out
empty, so it ends up containing exactly the files that were placed.

The files are installed in the context of the new task, after
security_file_receive() has been called for each of them.

Some kinds of file are refused, because each of them is a way to act on
something outside of the cell: io_uring files, cellfds, namespace files,
and empty pidfds.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/embryo.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/kernel/embryo.c b/kernel/embryo.c
index f405efb195c7..2c65a99eaeea 100644
--- a/kernel/embryo.c
+++ b/kernel/embryo.c
@@ -41,9 +41,16 @@
 #include <uapi/linux/pidfd.h>
 
 #define EMBRYO_KEY_MAX		32
+#define EMBRYO_MAX_FDS		256
+#define EMBRYO_MAX_FD		1024
 #define EMBRYO_MAX_STRINGS	4096
 #define EMBRYO_MAX_BLOCK	(256 * 1024)
 
+struct embryo_fd {
+	unsigned int	fd;
+	struct file	*file;
+};
+
 struct embryo_strings {
 	char		*block;		/* NUL terminated strings, back to back */
 	const char	**vec;		/* NULL terminated, points into @block */
@@ -59,6 +66,8 @@ struct embryo {
 	char			*exec;
 	struct embryo_strings	argv;
 	struct embryo_strings	envp;
+	struct embryo_fd	fds[EMBRYO_MAX_FDS];
+	unsigned int		nr_fds;
 
 	struct pid		*pid;		/* the reference alloc_pid_struct() returned */
 	struct cell		*cell;		/* where the task is going to be */
@@ -75,6 +84,34 @@ static void embryo_strings_free(struct embryo_strings *s)
 	s->vec = NULL;
 }
 
+static void embryo_put_fds(struct embryo *e)
+{
+	unsigned int i;
+
+	for (i = 0; i < e->nr_fds; i++)
+		fput(e->fds[i].file);
+	e->nr_fds = 0;
+}
+
+/* In the context of the embryo, whose file table is empty. */
+static int embryo_install_fds(struct embryo *e)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < e->nr_fds; i++) {
+		struct file *file = e->fds[i].file;
+
+		ret = security_file_receive(file);
+		if (ret)
+			return ret;
+		ret = replace_fd(e->fds[i].fd, file, 0);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
 /*
  * What was configured has been used, or never will be. The pidfd may be around
  * for long, and must not keep the other end of a pipe from seeing the last
@@ -86,6 +123,7 @@ static void embryo_drop_config(struct embryo *e)
 	e->exec = NULL;
 	embryo_strings_free(&e->argv);
 	embryo_strings_free(&e->envp);
+	embryo_put_fds(e);
 }
 
 static void embryo_put(struct embryo *e)
@@ -109,6 +147,11 @@ static int embryo_exec(struct embryo *e)
 {
 	static const char * const no_strings[] = { NULL };
 	const char *argv0[] = { e->exec, NULL };
+	int ret;
+
+	ret = embryo_install_fds(e);
+	if (ret)
+		return ret;
 
 	return kernel_execve(e->exec, e->argv.vec ?: argv0,
 			     e->envp.vec ?: no_strings);
@@ -346,6 +389,43 @@ static int embryo_set_strings(struct embryo_strings *s, const void __user *ubloc
 	return 0;
 }
 
+/*
+ * The file table of the new task is exactly what is put here. After this
+ * nothing crosses the boundary of the cell any more, so this is where it is
+ * decided what may.
+ */
+static int embryo_set_fd(struct embryo *e, const char *key, struct file *file)
+{
+	unsigned int fd, i;
+	int ret;
+
+	ret = kstrtouint(key, 10, &fd);
+	if (ret)
+		return -EINVAL;
+	if (fd >= EMBRYO_MAX_FD)
+		return -EBADF;
+
+	/* Handles on what is outside, or means to get at it. */
+	if (io_is_uring_fops(file) || cell_from_file(file) || proc_ns_file(file))
+		return -EPERM;
+	if (!IS_ERR(pidfd_pid(file)) && (file->f_flags & PIDFD_EMPTY))
+		return -EPERM;
+
+	for (i = 0; i < e->nr_fds; i++) {
+		if (e->fds[i].fd == fd) {
+			fput(e->fds[i].file);
+			e->fds[i].file = get_file(file);
+			return 0;
+		}
+	}
+	if (e->nr_fds == EMBRYO_MAX_FDS)
+		return -EMFILE;
+	e->fds[e->nr_fds].fd = fd;
+	e->fds[e->nr_fds].file = get_file(file);
+	e->nr_fds++;
+	return 0;
+}
+
 static int embryo_start(struct embryo *e)
 {
 	struct kernel_clone_args args = {
@@ -444,6 +524,10 @@ SYSCALL_DEFINE5(pidfd_configure, int, pidfd, unsigned int, cmd,
 		if (!ukey || !uvalue || aux <= 0)
 			return -EINVAL;
 		break;
+	case PIDFD_SET_FD:
+		if (!ukey || uvalue || aux < 0)
+			return -EINVAL;
+		break;
 	case PIDFD_CMD_START:
 		if (ukey || uvalue || aux)
 			return -EINVAL;
@@ -495,6 +579,14 @@ SYSCALL_DEFINE5(pidfd_configure, int, pidfd, unsigned int, cmd,
 		else
 			ret = -EINVAL;
 		break;
+	case PIDFD_SET_FD: {
+		CLASS(fd, slot)(aux);
+
+		ret = -EBADF;
+		if (!fd_empty(slot))
+			ret = embryo_set_fd(e, key, fd_file(slot));
+		break;
+	}
 	}
 out:
 	mutex_unlock(&e->lock);

-- 
2.55.0

