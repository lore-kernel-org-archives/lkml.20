Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633824;
	b=j4VUxl9WucGaCDvZeKkDGKcXWJyGczvfD2J/LAuC9VJzPaxfZGxR6RExv+hAncQQpzFM
	 MRvwJ/0OiyURb0QUe/s4X6Nt+a81KUJQupjkjKKu4vA2QhPhNRE+A8j69mJ9ux73ish3D
	 nbJE3hSSs4oTlKT28PqitpWjQSaE1Jmofo41xwhZOUyqigum6fzyyQp/VrCZxX5D6LVaH
	 NUIAq1WrmyiHq0YUpyyccCqC2mRfETGbbxMb6RfCQUWqnZbd8FMJ4MYd20LC+zwPWP5sY
	 98PKfeR3STtaC2IgVBmoyl4y5+r/2yT1Zxbzec3A/W2LArzUuvDThDft3Jq2h6ccDZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zTFnRhvBDyUF5JRAjEQ7l0v+FU3UL1Jli3F24C62wAY=;
	b=XwSNZJwt9os1HAQANlAO4cH6dBI8+v1LYMCJzzVfuBLY+Sr+G2vHjiDmVd6Kt8iQ2CoG
	 DBskbxqug54e6ssoPVcWEpSJLL3GAPPetZgknyhh/CbBISL3t+xXyYHYWdyoRmiPoO+i3
	 zFr5G9l3RIDO0RhP+qGog8CNCAStnjpsuq8GY25AQuAXP3QybqtL8VubngrKe5p4bGbCu
	 0JWSuqGhmDL0i//Fhn0I7r2DMFXKfhhPS1ksYFtgXD27S48vnqWAx3ul2EAelTTa8oXcm
	 fQQVy4BiG/rAduGu2A/qfbkWgnXH2ys1PXkrHIHj6x0lg3I0LwUjyGGRnvWYmROnVyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXLsDoSj;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D760E34D6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2D760E34D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXLsDoSj
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e60770381cso29776855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633823; x=1794238623; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTFnRhvBDyUF5JRAjEQ7l0v+FU3UL1Jli3F24C62wAY=;
        b=nXLsDoSjK7QlSr/DnZV29AOmi6/B614U+TOun2xkrK/KJypU7Mja/+yJSOyjJxJ1JF
         t92COURKlIfRrn1/scsE+b40xxlxhspMd2I9Q9Wqc1Rop+oBtvAxFRnfy7/O20ogpcFq
         Jol0jpmDSxb5uczvuaj2CUxAcq1MN1DpIGD5a6S/pHwoQuHxTPhPGC5pwjFRsZ1l6ack
         Yxc1p9QadsYcSW5Hy6Sl94tjJyH0r7PHzSrnzqQC6OPCxkrExXnGnS1VNa3II3GVUxcU
         umtILXOrPPXnRct93QK3FksTnkTXilahIdHh+nMJDQKpBK38etXfk9kUXiV6iKhvbFzn
         nRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633823; x=1794238623;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTFnRhvBDyUF5JRAjEQ7l0v+FU3UL1Jli3F24C62wAY=;
        b=kd4RnLf9PfNaKvJrQkGdxqH0x/SqrF9Qjzi5Kf7cJOST+F8DM9UBNhfRZ4r/onzTBO
         8gtPbnKqe8sWBlZqv6q/0YmyTFpufmSp6Cxgv9mmvmjV78xuZsp+wIbDB6LOU7zjyvIw
         v9xsEyku+E/BX7GiJwdBOf0yWgxORhl86zzIpre1NpfyUgogVjZcUqwpP7lKrXuyHfRn
         DLtfXxzUHfOSfuvzGud+5Yp2EP3IdaMJL+5BptVR8RcaQIIBBRA1r7aHpRJAiyLS+Fr8
         3Vsd6zv/RbqqxSXYELJIAmlmthNtVmMXGVN2qxsTa0CNLj8AyWpD0pL8OumpV0Z5uHQk
         wLbg==
X-Forwarded-Encrypted: i=1; AKwUvBzpK6vM/o2u0J4+BGqHC0K+cB03rGsXs4CaIQ1szzT8kMCLqvfmyXkNm5fRwYCd/0YvXDoO9Y3QuQVXLQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PlW0JH+4vkA3ilmmbIjH8IviSJgpV2phDpZ0Gh2C4g8D47SfZ
	pUnzO2qXPwyf+Mky9x+ss/Y119YUWaGUGpU164yQ6jF8Uw3XBfdyxUBTMaogOJQZpa0EArvPy1v
	oDVqHqTlCAw==
X-Received: from plar18.prod.google.com ([2002:a17:902:c7d2:b0:2e4:8c0e:97db])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce0e:b0:2e2:fc90:11a4
 with SMTP id d9443c01a7336-2eb364faec7mr97592545ad.48.1793633823158; Mon, 02
 Nov 2026 07:37:03 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:32 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-4-vipinsh@google.com>
Subject: [PATCH v6 03/27] liveupdate: Export symbols needed by modules
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Export liveupdate_register_file_handler() and
liveupdate_unregister_file_handler(). All of these will be used by
vfio-pci in a subsequent commit, which can be built as a module.

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 kernel/liveupdate/luo_file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index dbae0715220b..6aaa9a531428 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -916,6 +916,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 	up_write(&luo_register_rwlock);
 	return err;
 }
+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
 
 /**
  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
@@ -933,6 +934,7 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 	luo_flb_unregister_all(fh);
 	list_del(&ACCESS_PRIVATE(fh, list));
 }
+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
 
 /**
  * liveupdate_get_token_outgoing - Get the token for a preserved file.
-- 
2.56.0.317.g454f8302e1-goog

