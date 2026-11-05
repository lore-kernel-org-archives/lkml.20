Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891853;
	b=YD8GF+MkSH4L6zwmGJU78iHwxR3QsJYIhBNTcUVrhoBzCy/JQadwAAmYixaqCON8dQo6
	 TE26/R7enl7c1D3BtOZfKIuXjtJVx3NwdmO0nDOgZb8nwk1kTh8I3WygotwWHnFNl008p
	 kTKo97YrfvRix24tlmc+tAZvsrAzGDcUwSUkRfGXJxE9pd4r/M++0EMQ/rkMSzAYX6Fkm
	 5uZBqA1rDTpdPsqToRgu/Bbs5oEOGRHRbOA8IgPH867+g8CruRYOxWgK3u1yWtvBh2vFR
	 ojFkwJ9kbxLCaUP7ZoqoQmvTvrtSHxg+/YlsWkGqwXlMsDsbDvB+4L9f5Otira78hIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hCrRDaWNdKi4upmnleWZagusoBbB25CEWE0iViCpCb8=;
	b=jsiKqtnrVTWvAVgEAO+h/kI3wVdevjUQwV40mmPpouembhOn6DAfXOoRipJOWPruul/F
	 NAO8U4jLMbM7eAXU726qDAn3VDbbt3wl/uKlkei4x0IFZU8tg4Sb0bLzvsagu8y3sJR8G
	 Klxe4nJE7wTtmF+mGeK+uP0RKvAjJdAKMZf3Jm/JCEyi4wCJWSIcJQJty+Bn/1aptMqOx
	 6pWQAh1OQYZhfGgEAUml8VsuATFcNodOncsndPAQxGrYJl/Y6Mg/9ZSHxQoIxQnABAq+5
	 XBu6YPcKFpLCc0qTCCBmZU/DPL476lBPoVhRewawCaAT4TkBlvF8bWJVf3lSwIqUy3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=C8TImVMe;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C9606D80E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9C9606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=C8TImVMe
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b305d38bafso20426617b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891852; x=1794496652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCrRDaWNdKi4upmnleWZagusoBbB25CEWE0iViCpCb8=;
        b=C8TImVMeR5JHDNE7JleZZD5zOWU+4CRoS2EoF24DKNkClMcmi/++eVVH+HEek2+DyZ
         OVd/6NREo6JNMLDtvWth5AiZC25r2u31XVtNqU2w3h/L7n5ETjApH34KhIfNJqECUn2K
         jjKrOAb7F53Yxr1WcOilHSbjrhoRyMMP9evm/M5+GgIhEN+zigzw4pGoAc3JOl5FbZ9e
         gMseJy2oLaLz8YECm45HWVwiui7/oV1EN3z/rx8PvkJMFwTjcQ53LTcdjRdxL8B+ZhMy
         OKWXlWWgcVvpnbVkdr8xIyHimZfa2o+iOXgmbGI7EIjPV81lFvwJuzSu+K7zG6e333XU
         GoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891852; x=1794496652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCrRDaWNdKi4upmnleWZagusoBbB25CEWE0iViCpCb8=;
        b=Qi/maL30FWwTzpORtEKl3Vss5DoUwiN+ANGziNFCDg0czTeRhydb3mp7ksW8nPpGlP
         eo+/Hne9+KvBVH8/GwRboWjp82S0kK7R/kTbh8vO1MndYa9ThtVVTQdOMGq+KLQ4xXJ+
         AdPvyCo6BVrQLGaiW2HcZkukvnuhcZSrpD58Mi6E4et3agHjUWawsoqndOudWi/ydYe5
         4sNst7jLpaPv4SADWNoGs+QifOediIuoHcBEs6UW95OPMD35gweMobrNrypyXfTVzM18
         DqLx+G0fwTuIAvAOQA5Vbm7yujbISDjctq81X9huIBrnMBMvzy5Bf7swQB/e9Img4RdX
         cxuw==
X-Forwarded-Encrypted: i=1; AKwUvBwAXNgcHNscJyTVRPCiAMunvgPDy7/smwbmLBMNJIMCN/deH3xoiM0CNPslqdROa0++x4JRxxxBwH2nZh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0iVHXdBjF0/cnwPrsNuQAXfhWKMTPvUaJn/oSDcjDgoSTJnj/
	1BSu8jPoO5tD4kPc9/EFnFop5Hp+j7Fl+NY9PA8v306/5dKzgBoIqOzWZZa5n6a7GAk=
X-Gm-Gg: AYBFou1Gny9TVw6FLu7EjSPtQKZ1xlonD0xjhkCMVpBSY6hhmU/4XUY6DqDdBbLfWSH
	p6asJRN7pdVmUgUH5is1AxRb6g2iRSP9dad0W4YKUwj74I3jOu07M3FSprVJYp2folTiXL5tdaR
	w6FGx8o0RkXDGjylb6LxDWQbmszGze6snfH768lHX0Xa4WerXnUuGUn6m2kKyHBuTX/R/Y663CV
	hKmK4Eq4tkEsoj9OatuFvZC5SVrvVt06iBGd4sJD4QYwBGFJ+4L/kmmi2A4CKqul7aqkX+edl9X
	GntL7YdQKgRIbPhr1MlWwbiWJHq7ZlzysZQyURx5+fagVWQITJD3v5y9rmbviVcem9Xg5RNFr8h
	ak0N9vL7lP/b0GBe/JyfRVDmBW9fxU0Fl+Y+Xb1MIdbzCjj+/qI5yHfi9MgcjummfHKGtm4BD3u
	SG2zGQNH77jzkk9YTb8WVvmvd2iWSCYQFoNbEBj0H1KQxvxuXvHGraxThLFzakZUKQgg4F/u7dB
	CUn23q7/vBx36OxRFK/sdooDSO/L2U3W7L/7rIknAwKpBdJpMyembDkKNQbSNYTFOB/QQbdyV+5
	DKXAdJuC+wqpyeUfmvd8qRFbve3wcwtzJZsUz8+vFvaQ1g==
X-Received: by 2002:a05:690c:c702:b0:8b3:5d3:4f17 with SMTP id 00721157ae682-8b305d38d03mr38816967b3.2.1793891852126;
        Thu, 05 Nov 2026 07:17:32 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b32f0f9631sm12377047b3.36.2026.11.05.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:17:31 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:39 +0000
Subject: [PATCH RFC v3 47/90] cells: refuse a task of a cell a change of
 namespaces
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
Message-Id: <20261105-b4-cells-v3-47-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=2030;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=I2NhuCLSjPnuPpaxv/cLj2N44Ay4J4ZB0gMzgaeFU3w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPEwElGC3io0zEiypNNS2/bqSNHE3cPBK1FdSHbV8JxWqh5/8fMvlDcC4n2tbdYoEItntOiJyNJ
 Q0IFb6Xcs1wY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The point of a cell is that inside and outside are fixed once and for all.
setns() and unshare() turn that into a property of each task at each
moment. Tasks that are half way between two sets of namespaces have been
the source of many bugs.

For a task of a cell, refuse setns(), unshare(), and clone() with any
CLONE_NEW* flag.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/fork.c    | 8 ++++++++
 kernel/nsproxy.c | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 119b59f30f4d..134409910215 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2080,6 +2080,10 @@ __latent_entropy struct task_struct *copy_process(
 	if ((clone_flags & (CLONE_NEWUSER|CLONE_FS)) == (CLONE_NEWUSER|CLONE_FS))
 		return ERR_PTR(-EINVAL);
 
+	/* The namespaces of a cell are the cell's. A task has no say in them. */
+	if ((clone_flags & CLONE_NS_ALL) && current_cell())
+		return ERR_PTR(-EPERM);
+
 	/*
 	 * Thread groups must share signals as well, and detached threads
 	 * can only be started up within the thread group.
@@ -3300,6 +3304,10 @@ int ksys_unshare(unsigned long unshare_flags)
 	int do_sysvsem = 0;
 	int err;
 
+	/* The namespaces of a cell are the cell's. A task has no say in them. */
+	if ((unshare_flags & (CLONE_NS_ALL | UNSHARE_EMPTY_MNTNS)) && current_cell())
+		return -EPERM;
+
 	/*
 	 * If unsharing a user namespace must also unshare the thread group
 	 * and unshare the filesystem root and working directories.
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index dfe47a235cb5..5d6cec2dc4ce 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -664,6 +664,10 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
 	if (fd_empty(f))
 		return -EBADF;
 
+	/* The namespaces of a cell are the cell's. A task has no say in them. */
+	if (current_cell())
+		return -EPERM;
+
 	if (proc_ns_file(fd_file(f))) {
 		ns = get_proc_ns(file_inode(fd_file(f)));
 		if (flags && (ns->ns_type != flags))

-- 
2.55.0

