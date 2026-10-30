Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360009;
	b=ZXP+xcYRiMV+pN0iXQv+aFiyS2TqJWARC+71Gie4qvPFg2IHV9rUtriXy3x/S1N6PnW+
	 6ZYra3PoGKAUPmhlRXuc0c7zNQ2Cyo7eLTC39EWkAG+NivqTQJUc8tHNPu0n32BfNDpKn
	 cbDeVZDqKqOr9pSxRwAyBGm2C5fIFcrsXlDbizuIL04ELt1lfzvfJxGJPdtaH1um8DBcM
	 nGxl7eVOWkvX0oBY69AchHR3LMY17nhkZ4nyCTnNP1ugsvAhVhOFfePvTJeUghPCmQwRk
	 XfpvfsuHg1gtEOcD0DD94JOcXZ4qo6wvBQUp8Eo/cZcLdfYc8FrJwXiLmQ3i9aEQ6bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bZaJpSBnRnIzHfby/IEH5papD2tr6l6Mxu5ubacaA1o=;
	b=FK46LHNmLy4RWc6T7SqXpWA9U2FSunOqK8LzhGVU0WzmA/daKYYgRoVuYyipkheIJgcU
	 hAhApL0VZAsuE1f5ywVn9Um5/wNfLjeTuzHlPyJ7EKA+UOoXWOstot9ImtiRhYNOJ27LL
	 UZvmyR26rOPRVufyNPbvrJnZiA9Q251jwlKDb16tLqcAKp78/znprOpL3nyGSgCM5Y+qL
	 LLFZsGaqovou07SoPhnvK4Pxz/Q8ufSbiYO/M9vm1iWEkp4v7/C4Zw0LTWi6v+NoiHtcK
	 wtBeGEpV5dt6n84Kq7+cwQKEhNUjfUr6BTVNzIDsXECJOBmlAMpGvcyBEBZrioto1hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QwfQ+M4;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QwfQ+M4
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3749835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360008; x=1793964808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZaJpSBnRnIzHfby/IEH5papD2tr6l6Mxu5ubacaA1o=;
        b=0QwfQ+M4pqkC5u62cw75u2+XSb+cYHQ6dcG52A4GcbASAjxWgw0XMJyjZq3w7z965Q
         JLAKu0c5yawJaknInT8nPk5L1yXlOc3cc6UYIoBKhaX4RWEKCNooF77f0gkxjjeQngG5
         mN7/nkjCl1PD5/QCcZGKA96hpmrrcbrG+5/HYKs6M1Iof0fzZTr0LRS8/FKop5OvGgBl
         NpXqGn+n6wI6ykjGQ8d1XwnBoQTH7Jo8X9kChGlyKIoSIKDz1p8HZJk33e7G8tjVZVGi
         jUH4rTJKlFjAuqHeG5nm5LT1cZUD6431jtWE+bqcEJuCJ3VQvuCwTWNKsNhOEDGH2xOH
         xu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360008; x=1793964808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZaJpSBnRnIzHfby/IEH5papD2tr6l6Mxu5ubacaA1o=;
        b=aePwoTf5CASFjNpWqgtkm02qZkib0nL7cpT2PeNawyJpwhEEaTN8F9FAlJ0xETh/ge
         cNXC94AT5m/IQrXgP3es+16uhjSIdfoYJpiI1JDlQ4LwumxtkqhjmubWLd+bnNJgftIB
         fFiJ1tTujkpkeVk5Ta7rA6Wj4PXZvXwX1J0jNlL+Ncupq2YulSNLAC4Cti4g8Ccbtg6j
         CPas75qKCtWd4azcl1zCcEqqzkUtaz9d5N0LDn6YTk6D6dqp6vWlFMiQdZiMMsKBY/I6
         1VuLlUdubL7p89t4sUCWv+z0Rd9EfvoB+fUqKYH7SUmd0UntTdds1Hy6EjR6qTOF7alq
         QRoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXpPdFdCeJrJVfiyWmNRvml9qJFjtIt0Ii+vlCK6QjTiQaTpFoKHh/vBZdxNPX8eE49AnrbVOGnSGNS3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6AsKLhrJ9GAdxOpjiBBytLV9PfgGl2RbX/H/10niNUPHeK4vZ
	2CdFOr0UYJ+HmfPTeR+kw2DqTPvTPZPTgV6wHvTN0A+Kkycd13c02q6ARA1EgqHL
X-Gm-Gg: AYBFou1pOePBlYTQ0qiqclsiJQAuOP0vIvzBki2fCkKLjtfpQpGNhf15N4kof9taRt3
	Ykp6Wj74SwecU4Z1PeEV7CfWUL2S9+jDXn6GbfGAkkGzbvf6oPUF6RtEhgziH1QAVRlYqo7h6nk
	FuWv6ETh1J+daFi5FJTvKfQKwSJ8bx0b6jwP34KCHRrghSP+TjPXMjBzGzI3eV+h1kLJvyTLmVI
	x1eFhAnDu7eSKlaw6EyRAdOPjMsnvYPiOByL5RNOmrCJii0i1y3KTt5Ik8s64B3Jm76jLM+cZjB
	M61H3kdLr8XebZqPZzB8QENWNPC8e/5tex+lOF8sdjqkc2ckrN+QS/rr+U+NdsLdQKxTrg53nX0
	nXZMhfmgN2z8qFNaqSIabuwDqXUvI1XJs7gcZH3z+2BxtRBTlIf1ycmMUvFED09Blf9z0UhedPd
	3Ik77rxzDy4OStwlZOQuKucrMNakBtNjpgUuiDl3RLX9O+DVZy555kUYN5ZTMOk51n0bcf8Oy69
	JsQ62Z/Gx+L8nWCpwOiWOx8k8Kb4oUJW6ormyR93IpARRD2YXr6n8MWmcJG2mLOpRFRechTChpA
	1i3n75npAxicGaWDcGsUxXKlFMbA3Hc3Ozdu
X-Received: by 2002:a05:600c:1f93:b0:4a3:2f35:38b6 with SMTP id 5b1f17b1804b1-4ac180f1e69mr43043085e9.24.1793360007504;
        Fri, 30 Oct 2026 04:33:27 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:5a44:fb2c:3845:1154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm130748805e9.3.2026.10.30.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:33:27 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Fei Li <fei1.li@intel.com>
Cc: Shuo Liu <shuo.a.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] virt: acrn: stop CPU removal when offlining fails
Date: Fri, 30 Oct 2026 13:33:25 +0200
Message-ID: <20261030113324.2265585-2-thnkslprpt@gmail.com>
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

remove_cpu_store() ignores errors from remove_cpu() and calls
hcall_sos_remove_cpu() even when Linux cannot offline the CPU.
This can leave Linux and ACRN with inconsistent CPU ownership.

Return the offlining error before issuing the hypercall. If the
hypercall subsequently fails, bring the CPU back online only when
it was online before the removal attempt.

Fixes: 279dcf693ac76 ("virt: acrn: Introduce an interface for Service VM to control vCPU")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Compile-tested CONFIG_ACRN_HSM=m with W=1; no ACRN Service VM runtime test.
 drivers/virt/acrn/hsm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index f170ff4617fdd..79f8e50f0ac5c 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -437,6 +437,7 @@ static ssize_t remove_cpu_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	u64 cpu, lapicid;
+	bool was_online;
 	int ret;
 
 	if (kstrtoull(buf, 0, &cpu) < 0)
@@ -445,8 +446,12 @@ static ssize_t remove_cpu_store(struct device *dev,
 	if (cpu >= num_possible_cpus() || cpu == 0 || !cpu_is_hotpluggable(cpu))
 		return -EINVAL;
 
-	if (cpu_online(cpu))
-		remove_cpu(cpu);
+	was_online = cpu_online(cpu);
+	if (was_online) {
+		ret = remove_cpu(cpu);
+		if (ret)
+			return ret;
+	}
 
 	lapicid = cpu_data(cpu).topo.apicid;
 	dev_dbg(dev, "Try to remove cpu %lld with lapicid %lld\n", cpu, lapicid);
@@ -459,7 +464,8 @@ static ssize_t remove_cpu_store(struct device *dev,
 	return count;
 
 fail_remove:
-	add_cpu(cpu);
+	if (was_online)
+		add_cpu(cpu);
 	return ret;
 }
 static DEVICE_ATTR_WO(remove_cpu);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

