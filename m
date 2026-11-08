Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107812;
	b=OcIuvX8H7eeHN8J8X+YhxExK6kzhH70RoUv9LsyWNVLXtGLohVx15sQ+v+fthbyAN1iv
	 TQne1NnRi/hx+/lDEGLatydzocQBUUsrw7NJcMbBY3vOMtCDXBZhHEOkXJWJVorP6SQUR
	 w1OVN1Hj9gqLUC++lsX6IN2dehbr0CYwaKI/zhSqRKF3ZuIdy+9VWMvBCeakBb2mho+NE
	 ZCnBNcjlZURDV/VWL1DfRNdmHF3h+yIH7/ToutjZxPlGZbUxSl5cfVK7Ke4wgjIbg6GO0
	 PED6L0pQsE3OpgEqnXXXWah8OsBXpN1JoSWrlsveFgl8MRDoHIfgkfsp7cL4xrzaBIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=CYbXanoVIznje4wNLs5CNwhXIty16UVDrSGIc7iuqrM=;
	b=Iv4rAtRqtI86OnEBuTqvs9KxtH2tXvlDSS+aUVFTIfmfPNloKZ82H4rMbQEH1/GaHOQx
	 m7+crI3VDSbPmwWCAQuonSjl1p2xfcLM07cFzbAqPTILXlTfhzKlfawX3hGxOSvruHrXX
	 d1TwI+rGdMrhb6o5evAeWoYwsGOapZPQGIb6juEZZ7ZG4GB+uIrRkj9G5FRS9ax8hfzI/
	 Mw9JqNiyb1pDzQGN2axl+9EoifWEffuI67PQbd4DVQLqHFAoLEsUIMQ/R8jbqqOK2OrU6
	 V7H1QnrHlG2RIrJx93ssL5i262Vwt+yiqY5ip4y6aelDUnOy7/hAhN1w7w/0siQqoCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZEE4WdQY;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE34606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE34606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZEE4WdQY
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so114651a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794107812; x=1794712612; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYbXanoVIznje4wNLs5CNwhXIty16UVDrSGIc7iuqrM=;
        b=ZEE4WdQYEwXXZXioxDQ7Kuk3roMKT2YUNju7Qb+mi3Mj+DlEcvJicx1RjVPDg6N/qP
         +5cNNcQfUGlKmyzSE8EVFvcdn0ibcpdyENZOTt1njCFRo1N76sptGEqrSxgjgNebgmJ4
         +zacY+02xOI09uZ/WuqkSXZrp9L5SxHOhDNJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107812; x=1794712612;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CYbXanoVIznje4wNLs5CNwhXIty16UVDrSGIc7iuqrM=;
        b=lmadIs+kLBu6t5+YSTb2IBZj0zbs7y1o2BNhXBgmGqpVvf3A0P1p5GXCihRlf96Z6V
         XwqdO9CshgjrTQE8VFc0qtzPeAGdXkK44YNiDCk9cwn+OrbuT/0Kglk1hdgYJbeA6VVo
         6zzjs8ubq3s8yFv5IswU5BLGaXWiAAuy7XyM/KAXC4CGRm1D1a0hNbYLG+Rq9lBvb7QU
         fhJfkGMB5qFqvzQhnNGeGN2s8VKaGFKPytjzKcSy3lKINY5/0T1Ci550EGvu79Sb0+Pr
         tJWiLxy3TeS4x9St7lXHIadzFqHNRLsGXlso+gJVVa44s/y22r95y/dt5sLh1S6tkC4t
         RDmA==
X-Forwarded-Encrypted: i=1; AL+hErGBx8R8GRoIjuW1gXjqZt/WDNKoGy5xVxGTnJB64B+nSsKLWAvhgooMbfdT0RvKgd3iqZqXQ4/Elrww+9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M0Q6J5T2C0WCgfmucmZzQ1DVAHHVDbQ9ldChw1+lreUtxwF1S
	toLpgzJ/qrsgH28uN1p6TbjolhB+KcZz6gATcFD9T3hkudePlmF0nzh4d6osLTDo5X4=
X-Gm-Gg: AYBFou1iMSRINCM0ZtoEl+PRySCHx6P9dfxJOM6rj2tvrdpo7EKZWaaRyf97oeB0wuX
	iAfrcTo7sHt3K6bOH+70PsixuqwZAvvvX+qbo4gft6WrnVFY+vB8TqXskmZZFtjyZK3FMObqV6p
	M4VSjD0mWVvtCAhRyX7MA1IlLbJFVFtRh7P6TYc6DlxlbzQjWwb8hi9f/FubIXS0bEkPuzWDZun
	ag4QCL14UbZIQ0hSLoj1swPeFm3UeyvED9zjwgRCs8NdgeYNct74qCQgkdJ1VF5QwLaLO9kyGpI
	CTBGsS4jU4IAYFGUW7/PWY7HbKVGa5hAU/vDon0S4CkpLi1wrGOj3Pq/cuRA6zBmx8QbOXCpKTM
	5juhHkFvhgvlfEjC9GGlcrycHujNmBLDsNhLVuW+nx0DtMn3QRKgPVUTP2WKctgZVNv3W+VcXY9
	wCx+juiyT8bzGbBmJOvyxfUhWC9mEyUa1F5mteoaZHOq2XzNtHzVhrAmDGi/JzxHUtNPcVEz9M4
	dlCJSWyNdQ+LRf9lHjZEV5txdFM8mP8R9vmDIjq+pq9xyUoJt86w0NLo1x6qcBnBuPwbXXYsFB/
	2cx8D8Sh9GMYPI0mF+XCxCSRWGA0NLtnUy8ua/GHBY+zbj27o7ApOE3PQ/rlwyjRmXCmApI/2s/
	YWvpHHZ2n5Ltn5jYaO77k4FbH/CFD77zUOaMeV5s32Jr5fQ37AU4X6OxLqeeB7OSmg34gMpm7AL
	B7nvwm6O5MkSHKA+RMBz4nNjD+A0rIVbHB6rfAYCw+7T02Z7FB5m3e
X-Received: by 2002:a17:90b:274b:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b12d3cbd66mr374011a91.15.1794107811685;
        Sat, 07 Nov 2026 19:16:51 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm5351700a91.4.2026.11.07.19.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 19:16:49 -0800 (PST)
Date: Sat, 7 Nov 2026 19:16:46 -0800
From: Chris Down <chris@chrisdown.name>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Serge Hallyn <serge.hallyn@ubuntu.com>, driver-core@lists.linux.dev,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] kernfs: Build paths in linear time with respect to depth
Message-ID: <au_pnu4s141ylqHD@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

kernfs nodes only point to their parent. To build a path top-down,
kernfs_path_from_node_locked() walks back up from the leaf for each
name, so the work grows with the square of the depth. Reading
/proc/<pid>/cgroup does this with IRQs off and css_set_lock held, so a
read from a deep delegated subtree can hold up fork and exit elsewhere
on the machine, which is certainly suboptimal.

Let's improve this by filling the buffer from the end as we walk up,
and if the path fits, moving it into place directly.

In terms of operations, with a 15,000 deep path chain and a 4 KiB
buffer:

1. Parent and name pointer reads go from 112.6 million to 75,003 with
   this change
2. On my machine the second read of /proc/self/cgroup takes 99.86% less
   time.

Fixes: 3abb1d90f5d9 ("kernfs: make kernfs_path*() behave in the style of strlcpy()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 fs/kernfs/dir.c | 61 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 800af10d9511..1ac6a5ec451b 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -94,6 +94,14 @@ static struct kernfs_node *kernfs_common_ancestor(struct kernfs_node *a,
 	return a;
 }
 
+static void kernfs_reverse_path(char *buf, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len / 2; i++)
+		swap(buf[i], buf[len - i - 1]);
+}
+
 /**
  * kernfs_path_from_node_locked - find a pseudo-absolute path to @kn_to,
  * where kn_from is treated as root of the path.
@@ -130,9 +138,14 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 {
 	struct kernfs_node *kn, *common;
 	const char parent_str[] = "/..";
-	size_t depth_from, depth_to, len = 0;
+	size_t depth_from, len = 0, end, pos, room, n;
+	bool wrapped = false;
+	const char *name;
 	ssize_t copied;
-	int i, j;
+	int i;
+
+	if (!buflen)
+		return -E2BIG;
 
 	if (!kn_to)
 		return strscpy(buf, "(null)", buflen);
@@ -147,7 +160,6 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 	if (WARN_ON(!common))
 		return -EINVAL;
 
-	depth_to = kernfs_depth(common, kn_to);
 	depth_from = kernfs_depth(common, kn_from);
 
 	buf[0] = '\0';
@@ -159,18 +171,43 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 		len += copied;
 	}
 
-	/* Calculate how many bytes we need for the rest */
-	for (i = depth_to - 1; i >= 0; i--) {
-		const char *name;
-
-		for (kn = kn_to, j = 0; j < i; j++)
-			kn = rcu_dereference(kn->__parent);
-
+	/*
+	 * We can only walk towards the root. Fill from the end and wrap
+	 * so that if the path is too long we keep its first bytes.
+	 */
+	end = buflen - 1;
+	room = end - len;
+	if (!room)
+		return len;
+
+	pos = end;
+	buf[end] = '\0';
+	for (kn = kn_to; kn != common; kn = rcu_dereference(kn->__parent)) {
 		name = rcu_dereference(kn->name);
-		len += scnprintf(buf + len, buflen - len, "/%s", name);
+		n = min(strlen(name), room - 1);
+		if (n + 1 > pos - len) {
+			size_t head = pos - len;
+
+			memcpy(buf + len, name + n - head, head);
+			n -= head;
+			pos = end;
+			wrapped = true;
+		}
+		pos -= n;
+		memcpy(buf + pos, name, n);
+		buf[--pos] = '/';
+	}
+
+	if (wrapped) {
+		/* Rotate the two pieces into path order. */
+		kernfs_reverse_path(buf + len, pos - len);
+		kernfs_reverse_path(buf + pos, end - pos);
+		kernfs_reverse_path(buf + len, room);
+		return end;
 	}
 
-	return len;
+	memmove(buf + len, buf + pos, end - pos + 1);
+	return len + (end - pos);
 }
 
 /**

base-commit: a42ae51fe3c36cef82dc687ea594ca232a785fd4
-- 
2.54.0

