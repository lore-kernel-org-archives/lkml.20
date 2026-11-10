Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318216;
	b=JnURt89hVlNAu77ZUokf3t5EeAhyCGIU99N0lUA4frfUQih7opxo9NL4hXFlsOORWPhW
	 akwn+IbDx2vE8aE2cHqaoo2C//w0gLJpEQur2vcgjjR37hz42NOXC3XkrD3HYJvE630+J
	 eOGDie5MZNhG/mr36f2Z+iNHMmm8DDs3pwAXDCWTJaE2gkvb0ooT3XKTbT4iSFLTKhbV7
	 5B00/z1BMwh4chkRBGFXDNGaP8hYL6m4USbNL4Z270Lvnn85ahiKstMFOxNBDIvjBd4TQ
	 TZ4St0I5ccHkD7zLv7YhUGF9qf/I2ui5uHPwucLVtobKy1oY7wERpGRktk8gC41Dlkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SF0VorXBRqQHhsbCyIkGXlS2ClFfeF3LBlFw4KZVLng=;
	b=B74WpEFQuQlRKGFGfQZ/ZjSSINzismdATCsMvUpNxdITx97/J5IcEnzjhSlKL0nhjh1a
	 7N8EvfOrXaGtJiG3vTBeeMgHLoo5l5OLuD4ZAwP18NgurwD1qJ+/2vvVcs1+2Cj75SqbL
	 Ht7fBOZP6Apu7XbwTZJH5bimDTSSt96UcVeIpN7P+VPF+ouBm6ouslrcAIgTA/PKrsdW7
	 Ju8EA+Ny5mEdk3qEcMl4Um6HESUXgLHcSdVP59OXeEjwAIFWHzK1tm+VW904KO8HgGmQ9
	 cC8Xy8Tk0XBLRx+HO8PfyMXm7n0ssGcLghPQ02M7PgVhHxq/MkhWl5asBd3BHALX+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zs9EIAfz;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A555F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zs9EIAfz
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so3106339c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318215; x=1794923015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF0VorXBRqQHhsbCyIkGXlS2ClFfeF3LBlFw4KZVLng=;
        b=zs9EIAfz/Ty4GxANOrmMJkA3b40lypTXNPYlC/hoa5kpBgUKxBsuZpl+n+/K7asrv3
         fhpY0Z41XPKlGB01KpjNFmMC9+Fw0DupscRll9lvx2dXJTp2jTka8jBMYm/PmTdEW1k/
         F2abVvZyqr1+m3I5PBzdnEDfWS575PdFY5Oi7cktiirxiJHESq3eoD4dmCK2ocLVJtsD
         gG+2yRTubtOir3pFCOfoLY9y0FT+ppo4FhPugt5K2NCL3om0gMLAHKhCIMSfJBZLlif9
         pTpIV9uipZ8/PHrvnpqbnnvyHQQkBmijof9fClIn/bar/wYbQA4eCdUvLLVIByK7rLM9
         t9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318215; x=1794923015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF0VorXBRqQHhsbCyIkGXlS2ClFfeF3LBlFw4KZVLng=;
        b=0Gm8yfQuUfYZ3qrbs5RZKssG+C7TRutC4T4JiYrdkNPez6EKlsF393wYuTGbkLOdKx
         VZ7l0MhG21b8HLH3g40elRVn9aKu/URweIPwwSuFXXewg5eBTUwsysZiDb7H9toU/ZiG
         Flrt33IYwbCnpAhh6582ysuFnatVopJSTR23/ZJ9IE0xHs0KF1aQyhmKThGwb4FLcIPq
         vvrAYrV4HFC5WYuQqQNS4aosj/FDmMB3yVRPT3uk1+Wz49Ckipj0mQIjiCqiamCIUufa
         bdECKr4kKAP6AvCWte7ixEiOd7OXOMWVB0/nvgsI2qyZ3PMaHBV9pzPAi7oniXxh/xSU
         v7JQ==
X-Forwarded-Encrypted: i=1; AL+hErH8+zhALIJnUjxx4132TBlkDRnF9w9M3jyRMlZe1H6t6IK0ZMb8EIpDfDqbbyWT4O9zKI5SkjPEKrl57II=@vger.kernel.org
X-Gm-Message-State: APuU4Z/reiFcN5px2wCwbetlCGJeDSrPepC5lHGVxUirWOaptgao5qAB
	G+gqvJp8kET5AG8jVinp+9EsgUfFtvYyZQAwmhyKa9yfEin1iVqvJyAbJNK11BJe
X-Gm-Gg: AYBFou19Zhf2AY0/oOnKibcN7DedaKSCa77KDfKMpi4HoKGD5yNdKyw/YOfiS6aouPj
	PVScX9JD0NF41iQaS/iPkZdkyclY/2TOdQCs3YXLsVvlrkMxsytwdTrIlgfrC9gfZgCLiCk6l5l
	cvSbFt/vXIPufmDx3SzvMFkdig7ZJvwyIjN+oCXWzWBX4IaDHGTAKL5v/KLSkPd285jYqfrLNaD
	xwTW9u4+dMHFNbayQuYlasoKEKZo3lif9JvAwSLQTpQxv0SIvPyOhmcI/SAI/WeOx+U0U8zLLUG
	TxM7HRojLmXdGpGPYL6TZXkGWRMtA9s0KybtUBwOXROzf7b803yAKisp+gGH0pci48tDGCq2tPU
	gIuElKQdZSG4XoWuyqCWUgnRN3lfLuGeyJTp5T67SljIQNHMahgbfQvavNIGoQ3JWsh6yKIeasi
	Cv8V3iJhs/ci2GJ+sh5mx8Ffar9E9MxG4S6foMI7JhFk1KUvIMbX96hRB62vVVGYBQPTJ2YGPNa
	oD1YcoZBU2cf0VFO0FpGJM2AJ41T/Mq2d8ZWkBZVvXkZSejfcggGUguMmpgyJ3qa8RkgF0NAbmw
	ea4PhsMLWn0El1aeNvju6DikFP/LWzOANw==
X-Received: by 2002:a05:7022:458e:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3b5fcdbefmr5046056c88.7.1794318214706;
        Tue, 10 Nov 2026 05:43:34 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm7500065eec.6.2026.11.10.05.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:43:34 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] powerpc/smp: Handle missing ibm,thread-groups in parse_thread_groups()
Date: Tue, 10 Nov 2026 19:13:24 +0530
Message-Id: <39282c731de90f47678952e471236ef22e9d4b15.1794317777.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Power systems can have ibm,thread-groups properly absent like in one of
the PowerNV Power9 boxes where there was a warning splat reported on
7.4-rc2:

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x174/0x1a0, CPU#124: swapper/124/1
  ...
  Call Trace:
   __kmalloc_noprof+0x490/0x690
   _kzalloc_noprof.constprop.0+0x1c/0x7c
   init_thread_group_cache_map+0xd0/0x2d4
   smp_prepare_cpus+0x2bc/0x484
   kernel_init_freeable+0x168/0x3c4
   kernel_init+0x34/0x1ac

This happens because today we don't check for whether the properly is
present or not and directly pass the return value of
of_property_count_u32_elems(), to the allocator.

This went unnoticed because earlier kcalloc() caught the overflow due to
check_mul_overflow() check and returned NULL.
But since commit 0af298e62e5c ("treewide: refresh kmalloc_obj()
conversions") switched this call to kzalloc_objs(), size_mul() saturates
the size to SIZE_MAX instead and we now get a warning at boot.

Bail out early if the property is missing or empty. Follow the return
value as documented in kernel doc of parse_thread_groups() function.

Fixes: 790a1662d3a2 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/smp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7a25eaa59e62..9a0f63e43821 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -824,6 +824,10 @@ static int parse_thread_groups(struct device_node *dn,
 	int i = 0;

 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
+	if (count < 0)
+		return count;
+	if (!count)
+		return -ENODATA;
 	thread_group_array = kzalloc_objs(u32, count);
 	if (!thread_group_array)
 		return -ENOMEM;
--
2.39.5

