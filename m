Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493028;
	b=WckJ2g5Vh69kQt1+MW8EkGLWcfXbWI/GHFQWE8lCYfXgl2daYgahJwO7Abnh+TR/IJCr
	 ZGYpTOV6y0cu7nLIZMEggTWbNelIe3TNmyCTAXmf716gVMtBunckPcDLKGW++lCaySryu
	 Mx9RM1soVZfYwIGzfL+jhedSOR0ef6uyCTNbDeeUnMpastya1atoLVSFUEzSxYP5pKlCZ
	 X/ei/x3ytjN0BECrkHTLkVeCXu85goHNjqlmdN67pQRcDFtxFEtXgzqqKNynMKBL+6Sq4
	 3bKICbON9/gzEN4oVm7Q7rqzdM6YnmS7bsFjipdZxERJaU33FdSedISpAlJ9AzJZ3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qrF09GR+ihkQ4thcmIGrsAzK57Wx7VRqM+yLsEJ4p3o=;
	b=pyTvt4xfAvdCnB4/Y4cf9rW6bOlmEY3GAvkehv9G1Ua+/vV+r0NC9TGaInx7qWUbCWUd
	 uJEZGzN+o79fTTt92nohYobftR76TE3pxKtgKPGHo4KXLjsGFz+8kArhzekjMdmRdd8c5
	 wJIyPFKnD3peQBtkx5KU+Hmz3A6WwGJI07QkGfXRppLCI26KAwE2GN4umCtA+j++X0JCK
	 MRz9RwMB/rK707mVpzClPhNkrsHiL84+3xzyO4MapvYgL/polCBeGYwYuddEWvT7C4hIy
	 5+xKd/YIslA1gxz3SvE3vpWxxZo0GVq9bIkXVm2xvmvsMNbk4Dwz4j54BlDmdMApPbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BUc/oAiX";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C33D606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C33D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUc/oAiX
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c506094fd93so413455466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493026; x=1795097826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrF09GR+ihkQ4thcmIGrsAzK57Wx7VRqM+yLsEJ4p3o=;
        b=BUc/oAiX8fnhkktLnZFvgLNatm2C/o2PyMn9TAlcNkOqWquh+iDGcpCDApB4TUPIJe
         szU1ye7M0VlqedHpuHo/UjjBFRdDNznR8n86L+9cZfulBPjCPrQtsGj7cS9Jew+uiz/j
         BPM2QVXwGTts7clvGUtG+K8M67nUK8uC0Cy7JTV+R5igmEOwF9B6Ay83mcEKDbgyCzU8
         0ba3S1RFeRz9kOPxUzfcbou1wF6kupEGcm1Essy2qdmZWVGY/Xt6wD9LDnb1R/zYFUWf
         G+vAbannvJsIZA29ZLhmQMtaQPfFA7Irx7D2rAaAr+v3W5Di5r++BfmcU77pSyYkI8e7
         hmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493026; x=1795097826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrF09GR+ihkQ4thcmIGrsAzK57Wx7VRqM+yLsEJ4p3o=;
        b=vwS5uG8WIRfE8bH5tZpCXDHqnwGwCjxlwIevJBdhSHJFRvldWJlDyFgtPo1HKsjehA
         okUKYlVFt8+/etDRsTWe92Nzo6zrxKcpvZn9eGkLKRKwBaRevF4ht42q3f6WUQD8BD+S
         mKPj9+GZcZHXbX6WmzHQcOo0PM7JZ2fWxaAZ0UO96xnlQ8xsUlozHDSqG+LYNGJ77kXk
         yoyT1BKHeLyeTk7tR4FxvhMf/VCskQw/32EpcbfIk6fEY6pCEqxzbIJLby6HPg2sYBff
         Pq5zgMwnesvXNhdnEbF08TZ97O/z4x+cAZ17snG/jzwREfJvfI+UMDzCXyW25b3s8OMf
         Xjpw==
X-Forwarded-Encrypted: i=1; AL+hErG2xzVrxFRbsy8e0nkX1n0AqL69o3ssqu4GB6+7/qglymQUFwuaCT3KbWOpiDWz8xBj6L1aicZbvrcjpaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vwVuYdyZBwmZPxFHDINbPkD9nsjmM2OKn6/gT0VF7VJ4T99gT
	UvYIfO40W6qQaisXTdpT60FkPeuaG/tct/XWDnKzEEj3Dbw9dGPcrcVr
X-Gm-Gg: AYBFou0enwgjJB6rWDoRWiRAwOh2YJyWn2DvopI2bv5YunNLWZ7IeyBXAZjw0arleSg
	dVc82Ors7qB8SAPEDHD4jcoazGePqwB/20lOlICDjyd7Jn98eaCCKp5PInBpWJ5Pc+vviVkafRz
	kFf5UbithvAdiWgVw/kD0UeUtWb3XmYrtQP27890IUIt2V+7XK1o9p1V38os66/rS7ddehTt3Iw
	bwDCnxIO9ZD4/WpIIgYddrvfe5731EJXawK/tltTH9KxZXraJshCc+JyVKzxbi077flPMKBE+oN
	fbpo/f7afYt3x/riqS1EyticLayUbF5Ss2XNI6PyZ9RMpGXmNw1d+KNJTOhz/YTb7jtGzLBJkw4
	scMKRT44yyFg85IXAXtKPK7IoarGkNp35e/jUgEwQw7CTUGo4BOVWKV77ygw48TumDX8B8suZMO
	nP4sE9X93FWdhHHGgxcmaJcjBc/eyaEopXZED8DdQOGlbSi5k/sVmf8dflWEoQ1KdW+udivyVPZ
	Awx3Tjudd2RI43chanOy7qz6SZdfrBChZAqq8GzIYPzmO1Zva886VeD6PEbtA4a3ZDOIblA0z5Y
	WM/n9ek6a7z1k/xBJya4z2t/kXJXYhcPvCMn+WA4h8206tvFpPUoNHWL4oaRv+oJswGTF6QN4MB
	cwgLjbPH1a7xwFD9kTDr5wz3ms9ESwzSplzukb6g18HIgZ+3ETWYCPzE49dD317Sxl42Vb0yHpC
	tBs6/NRT8hMO+NuQpeZz2RUrKyUHxCufuPP5BKa60lkv7hKQb/hg==
X-Received: by 2002:a17:906:9fc4:b0:c41:5a0e:3356 with SMTP id a640c23a62f3a-c5066cf82b8mr489669866b.41.1794493026263;
        Thu, 12 Nov 2026 06:17:06 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm360156466b.16.2026.11.12.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:17:05 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ian Kent <raven@themaw.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH v3 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
Date: Thu, 12 Nov 2026 15:17:00 +0100
Message-ID: <cover.1794479968.git.krystianmkaniewski@gmail.com>
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

This series refuses splice on writable opens of /sys/power/resume and
gives those opens separate lockdep classes, as Tejun suggested in the
v1 discussion.

The reported cycle is assembled from two operations. Splice into an
ordinary writable kernfs file records pipe->mutex before of->mutex. A
normal write to /sys/power/resume records of->mutex before the autofs
pipe locks when resume_store() resolves a relative path.

Patch 1 adds SYSFS_NO_SPLICE and kernfs_ops->no_splice. Writable opens
of a marked file refuse both splice directions. Their of->mutex and
seq_file lock use separate classes. Read-only opens retain splice
support.

Patch 2 marks /sys/power/resume. Normal reads and writes stay unchanged,
including a write which resolves a relative path through autofs. Rafael
acked it to go together with patch 1.

Other stores also look up paths. They remain outside this minimal series
and can be marked in follow-up patches.

Tested on v7.4-rc1 in a QEMU guest with the syzbot kernel config.
Without the series, the C and syz reproducers trigger the reported
lockdep cycle, and a splice from the autofs daemon pipe into
/sys/power/resume deadlocks. With the series, neither reproducer
triggers a lockdep report although autofs receives the same requests,
and that splice fails with EINVAL. Plain reads and writes of
/sys/power/resume, read-only splice and splice on other sysfs and
cgroup files work as before.

v3:
- Rename SYSFS_LOOKUP and ->may_lookup to SYSFS_NO_SPLICE and
  ->no_splice (Tejun).
- Drop the mmap, prealloc and binary attribute checks (Tejun).
- Add Rafael's Acked-by to patch 2.

v2:
- Replace the v1 locking changes with per-attribute splice control.
- Preserve splice on read-only opens.
- Split both the open-file mutex and seq_file lock classes.
- Reject incompatible mmap and preallocated-buffer combinations.
- Reject SYSFS_LOOKUP on binary attributes.
- Rebase onto v7.4-rc1.

v2: https://lore.kernel.org/r/cover.1793715774.git.krystianmkaniewski@gmail.com
v1: https://lore.kernel.org/r/cover.1792577179.git.krystianmkaniewski@gmail.com

Krystian Kaniewski (2):
  kernfs, sysfs: add SYSFS_NO_SPLICE to refuse splice on writable opens
  PM: hibernate: refuse splice on /sys/power/resume

 fs/kernfs/file.c         | 46 +++++++++++++++++++++++++++++++++++++---
 fs/sysfs/file.c          | 18 ++++++++++++++++
 fs/sysfs/group.c         |  4 ++--
 include/linux/kernfs.h   |  9 ++++++++
 include/linux/sysfs.h    | 22 +++++++++++++------
 kernel/power/hibernate.c |  3 ++-
 6 files changed, 90 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

