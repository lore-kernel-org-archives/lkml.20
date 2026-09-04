Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8D24A8A0A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532102; cv=none; b=YlIHE0W0H87/y7TfEGJmhZ7TPAc+jDIWSBjji8LzSJwNQ5dyOJdjDot+k9oUhZ+SoM0WxoOj6X32EKtWSQjcM+AYyn/+UOC+Y35W8Bu2GBzKnqLWxtLXmy+k2aJMk2P8lKl3afroknuyXv8JNiniL0igy8H7yJ/cuGp3AAb/+wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532102; c=relaxed/simple;
	bh=kf/1ey0GqeVu9fPQWj2L2Mm5Rt20DZ2y/xGWZmN2GIQ=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=SZ5+vAq/MtjFhKx5UGvsFK9eGQh8W8WYwLcp34vjymJIa5glWKsw59eQuTNkaoMKezAvwCTlrVyajLmOzSBPUek12OwMbj2xrU9Nfgc7wAztnnAzcl2HlcqRfivaEmfWwgo8DuVChWGsg57WPLhT/Q8F6860rNkxNju7jbEaNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=e4h2L2E4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="e4h2L2E4"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so130629466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788532098; x=1789136898; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNlQHxyERxR0BCf4rdmfxT/+3TEDXoy4SOv/36YNyCQ=;
        b=e4h2L2E4sNxwcg/rMrmYH4uyGNjbaU1O9UWm2Ubpi5HR9o23N+3u7u3hk0VSVPkUNT
         2wKfIzEz5fPVA/A4DMesB6ckAB7y7ZzhHw/mJVXoxLk08wIAtQJGXw2EY8zinrFnD148
         nD2FoyVHh6T/h7lvr3UFdJNZEkeZWA0gSoIrZ9vLj3DnERth4R23wa1rcjo7CtZXywIC
         LritYKRA9Uzu6i7JyS5wO71eN0JxfqTA5/het6r8uScBN+NY9x5Eu98zL0aAdxYnspYZ
         gkpM21l9v1t8kyCMCoZl2q95ajD+uPeTckAzlEGy9tTVwG+907+IctrBYgIyeJAxbeDc
         AbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532098; x=1789136898;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNlQHxyERxR0BCf4rdmfxT/+3TEDXoy4SOv/36YNyCQ=;
        b=XflJvPx4AvZj2cWbLx8mccPz+KdeJt2hw+YzZYQF6Br4Q4b+hn+Hmkks/31KJXleZt
         yGEpi/e/OZgFltFYhSLuryPZgtea8y0pgW15KhEEO9G0cUc2mlKiHaKK3BSPjDokUJxB
         f9FtXk/ZlenppcJOWHFVn5dfF2hjMQjv/AtMy+GjHSFjpPgG+rcThYRqxCjd0ooeLvie
         FiQZw/g7VOaGLawKqFBPfvSjMTjV68phLxMAkFlBEqO7KRNbx3eHEMkk2uk/SdS5d/oe
         +Br+k8BbI41DwFkoN94egT6HqIaoICcSebX9O5SnBTCO8b9/naRThb97xxeM5KrWFB1s
         TuDg==
X-Gm-Message-State: AFuF++knLKcS0b/q+98fsH3vf1O1wEfzg7qe7nHY7MrE3UoS668Lddsy
	IiWlxQTQwzGZYC9/EkKzE0iGV5tITa9IwcQ/aaFWwhsVLPF5+hgjOc5yV/juRiMT5VEJJI9mpPx
	iby7V048=
X-Gm-Gg: AYBFou1mhUT3NxQUuFiEW28xGkFwGjzDIwF09I7q4VAHtmKQOfwIIKRenCaXOS9WMcW
	jabE3zkqU1OG0vjC0VJwGwYAqXZpwe2R3/+catJiz3EsSGT9pbASZ4T1AhLZYb+ywzhi3YaDMJL
	rRjL5zJci38CVm72pyeLubj6aAQIPRgnFTwQbL2RvEiAHA/YB896t4H36WJVO+utFn3XzPMV8fa
	DOGNqDJ9/lLpDpnLcw4lqrHXjPQP9lgDHaI4okAKVHI9c+4x70Kh4+obshpRh+9xFWnCvmca6Wj
	/3PBQdriMS59aLtFxHzdXBaUcH/b5qAGgoFmsLx3/96CLO1iJuJzuQkchlI6LaQt4YxbzsGxyO0
	FehY6XbZgGCFCbwf2kDbnBidwhVu/8BGYg8KCL1vrDtETx7mzbVxjEkX++p/GU9hjYCIttmx1BA
	HTCCXOavbU0JOsB43XQqgmBK7UcWo3EwKqFYAGwrZg0zcCm0JLtTUOWr0i6Ht0bwD1xwB7QKwzr
	P6Zz5d49bY6cuYrhY9asp1JPNjmYXva73JmK8r6BXFyg7REbgXfyZY=
X-Received: by 2002:a17:907:728f:b0:c26:19e3:e97a with SMTP id a640c23a62f3a-c2619e3ee84mr151939166b.26.1788532097705;
        Fri, 04 Sep 2026 07:28:17 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.35.ipv4.supernova.orange.pl. [83.10.35.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm114864866b.15.2026.09.04.07.28.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:28:17 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH] nstree: check listing permission before taking a namespace
 reference
Message-Id: <34C54FF6-AA8F-4124-9B40-C68EADB26D99@doyensec.com>
Date: Fri, 4 Sep 2026 16:28:05 +0200
Cc: linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
To: Christian Brauner <brauner@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

legitimize_ns() takes a reference on the candidate namespace before
may_list_ns() has decided whether the caller may see it. The
__free(ns_put) cleanup on the denied path can drop the last reference to =
a
mount namespace while we still hold the rcu read lock, and put_mnt_ns()
may sleep there. This is the same problem commit 2ec2aff3c8e2 ("ns: make
sure reference are dropped outside of rcu lock") fixed for the =
put_user()
path. Neither ns_requested() nor may_list_ns() needs a reference, both
only look at the namespace type and at the caller's own namespaces, so =
do
the checks first and take the reference last.

Fixes: 76b6f5dfb3fd ("nstree: add listns()")
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
A reproducer is available on request.

 kernel/nstree.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/nstree.c b/kernel/nstree.c
index 6d12e5900ac0..831f279d174a 100644
--- a/kernel/nstree.c
+++ b/kernel/nstree.c
@@ -533,19 +533,13 @@ DEFINE_FREE(ns_put, struct ns_common *, if =
(!IS_ERR_OR_NULL(_T)) ns_put(_T))
 static inline struct ns_common *__must_check legitimize_ns(const struct =
klistns *kls,
 							   struct =
ns_common *candidate)
 {
-	struct ns_common *ns __free(ns_put) =3D NULL;
-
 	if (!ns_requested(kls, candidate))
 		return NULL;
=20
-	ns =3D ns_get_unless_inactive(candidate);
-	if (!ns)
-		return NULL;
-
-	if (!may_list_ns(kls, ns))
+	if (!may_list_ns(kls, candidate))
 		return NULL;
=20
-	return no_free_ptr(ns);
+	return ns_get_unless_inactive(candidate);
 }
=20
 static ssize_t do_listns_userns(struct klistns *kls)
--=20
2.55.0

