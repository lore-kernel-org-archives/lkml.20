Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694546;
	b=2a8QDXL6f+rUYVBWFB85b9dovB5QStpdLupu4UFgRBRcbhgnzrDvbLBZYDZYLlTW2Wbo
	 pMj07TX3lDJE7fQNalSX1+QltMbDpWUVhbxqk2snY4DPwrPEFUrQxwl58LroMSdFaO6no
	 bQIw/Z/bA20aBxS0maCC/7623hr9v8x6Emiu9qLdP1EfPFyw4ATXy194EgFevk1Y7y2g2
	 x70f/NSixLlb5LncA1pLJrmhIHXhuYzJS0AZYDgHPi67ZieFQv3HbJTgatu91SJPxYCNQ
	 qG3jxaxLJNNuFRNA+rPOvCjFKQW4MjALGtC3QDcD7dSshzW4tITsa44RyTapFEHmQ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
	b=Zgb2HzkrIMNomfjwDhvyjFFJZfR717DCghX83NJGb3H9rA5bo3vYKg+DxbUCpXWUVPdI
	 FHQQlrmDovb+0eVpGh8n36TQj5yZAWhbSvkCQHz9PgRXFZcVUkC7fAyUJiko65grKico7
	 auFAEzNJ+NNZvvCoAw8GYogiTR0SLugAh65x/AnOVExJ5kdjlSkd5MF4K1Ga8l9cR+zMj
	 Sxwtpp0zx+WM0H5E+KCq5IDxJWkLx9e8c/sZv5efnu3Wngxpl2isG3HVc9bal1zuDIhbR
	 wyqKolUyw4gkpuQWcXWq4/5gwDbLfGdEuNxiA9GWpCQr+fGmPXM9anH5EfEJhDfg1Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4X+qHoj;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025660A2607
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E025660A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4X+qHoj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso1881202f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694544; x=1795299344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
        b=H4X+qHojpx1LYBhdEpFy045MEYW1a0DsOUuqj9IZciuzX2vxbU4HMPTPB/vI/QGdNQ
         SUKKBY3GJ9lznikm2/qJVPbjf49w3pMTL/Px21cLCmvajf4PuwizmPJ/3AKfLyaAdWI1
         AeSWdVdKtIOrPHAURT+zj5mDR5z8qLFRop6mixyWs28i+GYco4APZiDd1O2olKySZ3/V
         hofz0o/vHP+oNT1OEILHosZYGRBibYJHy4Jxb39zExjFqFg7uk9enr4qPN85qNtQi6Mw
         DtUO5su9K9uxFQOEI8rJ+uVj/XiS+s+xPtEtMxHqeMwIhF/0hb3sua2zXeSoh5gvUYx+
         cUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694544; x=1795299344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
        b=WPn2ZDdTkaCO5tWayLHxvcaK2VhUfwOKDANIPm2WTog/BGSoxuSDWpGpR9dpgdStCE
         NTfEYOEJfuukzHCApcD6Egho7tp7H/GdtDeaYSyD85eZ02EUsx9UcVtE8dtyX7ecyWPm
         3iC01KhguHBRVkO8heeCmRGwZaJHdPx+OmYeka1T3AzXG5RUDxPXVQblMT72sdFWhCI9
         VbmUTRlBbDxPIa4wN+RbETQk9WbQ+aExM0a5YtRJu1mvQNKB2EZF5R5NXzL2T5hQSaYR
         kUo5LEeDAPXmK2+FkvdEvnLHiytWr7B52TCo6UZ5tE2NdGEf42BqBljEfxJwxDH1sGSW
         ML9w==
X-Forwarded-Encrypted: i=1; AL+hErH+lipgzx/fp5wguFNryGUlvm4jj2RS1zx+YCSjxETZpQEd+enlMu59sLdx4fd9MettOkS2nYp8kbteaS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+DP3Q4oa1PHSmGWvYjElGOcPR+rzjMUQK/hmH+Ler07orn8ZE
	RuW6KZ8+p/R0x5n0++pJQZch33PVuUAF2wC3lVOHNU3UuudeuBLhnx1h
X-Gm-Gg: AYBFou3Zw4b5xINLXWeEKPdviEgIsHjuNUCVzL2qcj1ha0cS7C8x1BuFY7pyCvxuo1I
	02mLoO4hkfNgH/KyM0eG+m1XBBLAlcvOtrfAwLZDghnYDxfX+wpkwK5mpqu+9AwELYvHFLIjJRb
	c/7YMFLcuWURg1CQt9MmDtmDe89/tYKjrjlmiHvhN4uLmiZLyA63PimOJi7HD7FL5HhbsY9szAv
	J92783jUj2WuRmEpOGsLLGW4IZFitIjS4zo2982kor6McbV3f75dapXOZiZTU+tERTKeCrMgdcv
	0NTMNzW9BKJZNvbib5xMh8v97506MT37D0fXejlFwSEhCIe/3H+4YciRpQ/9qB3PeeUqvbgI1yV
	VXYvv2aKb0NYhenI+At4mZdHPKhV/zRIe5UTxrCuMyJ9SUiF9LRY08DUcu6IE/OKG4LFSnlS9UB
	SmTxNENf0Hi1QgiRfBewctN6wsCfGVjEALIBTDP/dYmFmR8fJoFQu/Fx0S3Ic67RAww6v4LnWwO
	odvuPee9p7hK6/BuKTd6j8/ap1MESfMY5+20KLkLD1Ykhu4lzy+a35sJ/MsmjEDEvkLx4BJSm0p
	lTFyzYuFjoks1xA9OFr4NoIk
X-Received: by 2002:a05:6000:24c8:b0:49c:9e8a:31b9 with SMTP id ffacd0b85a97d-49c9e8a3318mr13880612f8f.9.1794694544235;
        Sat, 14 Nov 2026 14:15:44 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:43 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 4/8] vxlan: vnifilter: account per-VNI memory to memcg
Date: Sun, 15 Nov 2026 01:14:08 +0300
Message-ID: <20261114221412.255825-5-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_vni_alloc() allocates a struct vxlan_vni_node and a per-CPU stats
block for every VNI, both with plain GFP_KERNEL, so neither is charged
to the cgroup of the process that created the VNI. A netdevice's own
struct and its Tx/Rx queues are already GFP_KERNEL_ACCOUNT in
alloc_netdev_mqs() (commit c948f51c1654 ("memcg: enable accounting for
net_device and Tx/Rx queues")), so these per-VNI allocations are an
unaccounted part of a device that a cgroup can grow one VNI at a time.

Charge both to the caller's cgroup with GFP_KERNEL_ACCOUNT in
vxlan_vni_alloc(). __GFP_ACCOUNT only charges an allocation made from a
task in a non-root memcg, so the sole caller, which already handles a
NULL return, is unaffected outside a memcg.

The charge lands in the caller's memcg: adding VNIs from inside one
moves each node into the accounted slab and raises the cgroup's per-CPU
memory. This covers the node and its stats only; a VNI carrying a group
or remote also installs a default FDB entry, whose allocations are not
charged here; "vxlan: vnifilter: account the default FDB entry to memcg"
later in this series accounts them.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: name the FDB accounting patch by subject; after the reordering it
is no longer the next patch.
v4: reworded to cover the node and stats only; the c948f51c1654
reference narrowed to net_device and its Tx/Rx queues; rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 127ed5b2a2eb..07aa641f16e8 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -826,10 +826,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
 {
 	struct vxlan_vni_node *vninode;
 
-	vninode = kzalloc_obj(*vninode);
+	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
 	if (!vninode)
 		return NULL;
-	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
+	vninode->stats = __netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu,
+						   GFP_KERNEL_ACCOUNT);
 	if (!vninode->stats) {
 		kfree(vninode);
 		return NULL;
-- 
2.53.0

