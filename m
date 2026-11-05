Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891897;
	b=RFzeN2cfeO6+d0I/uN3yd2vQmbGlikDq8kxTVp0hZbOehQjdB4FPRBJdYEDa4HxgVzHE
	 JgU15JPspNiVvxZjYafbQHlgS2d3ua9jpaGwkeGS0HFaVZ42WV3ZbN+6xDTetsh1teI5E
	 7EG5L3VxI2chjL/hEx5xU5Mp35ggr9oj1F7egMweYL33eVJcUkgtXDK+uqoo0X7s0LsPx
	 gDtfHnHdAHIv/Rttl1bBRMO74MBHMsCx73mLS6q++sueR4fWotUBDml3/JB5dQgUtMDia
	 pCH8GJF2dJYQN/klg5toB5u1IVzjUBv8t4ftNVyyCaLNAdeOJOUJ/Zu1Z9eSDKsAVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jNN7xmLiVZyF6Z8erpVxlHPtOJGxm7l+TGrLpW+rRHg=;
	b=w6J/V1ajEZeW0Ba0l89AaOTQkvQlVexDKkfmob9RiSMSMZZ6IBPMxzIhNYJa/lIl2OHy
	 noVO53xnt2jrvrVrg/6EGTDXSCAAlb5U2Cg2+PXLAgn+k0rKH5iUqsvE/UWN7s13yxz/q
	 VCgmZ6Mf9lFOrhAZAavq7sHRzs5tFEttKZo6xR3UL5QgmqyhZUwx9aEO3By+JMn2CnLyl
	 uugdECXUTh866K44goRFdNgyLPcpSk5oyQtoLjJLS4axoTx15Wt/5jSUQ6/0+LGWTv/7M
	 QB5anNwqif8G8VP3nNOTItGqgCIqIkjCx5vzrtCx2lt94evU9SL1en8++QZog03NoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FDODKT+y;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755DF606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755DF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FDODKT+y
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac01ff101so787777e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891895; x=1794496695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNN7xmLiVZyF6Z8erpVxlHPtOJGxm7l+TGrLpW+rRHg=;
        b=FDODKT+yCZvX632Ezhykp5+NIog+ZfvjV4ZHP8ElO4cX1z+hJUD03xfZCdtWtK7mkG
         Qp0Lmrhy+4/b1cuNuFv6KOxs4D7I4vevhZYErIXR9iVQonne9p67WuDecz1EA2mUVXsz
         cN+fYjXe3cOIGsqeQ9bMH4PpokCEOargrWTDbuZfr5rlUFUoO/0AwHeazC8ANOQ8k7tf
         ky7+RhM2C2/VzirQgE9yGnC6iLGqjMgpx2akdxAvJLApctKnOu8yONJ6jaHEU8/p5xzL
         jK+JvjRyUmZ0hqzYyAG0lDBd6/VHxTiOGW7qVIOJEs3izWCp1Btn7Aba7dytuktC4U1F
         Ucag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891895; x=1794496695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNN7xmLiVZyF6Z8erpVxlHPtOJGxm7l+TGrLpW+rRHg=;
        b=etTpK3Sw4w+qSh4Wf2lccDksCcRAEk9c11j+9qZVG0MlcgWRFYZTYf9/tNnLuv6TeV
         DqgFG/4zFwwsvwVOBgh9/CYnvQtPIwM9CJm4/x4PIKggBx7mw8mh1gm/se+AtrSHYI1k
         //TuhqB+ggBc5wAadA7kTwjcV3eXeU9FD0iLxaU+xeooUAL0glqg+P5/ZftQ3I2ktsGw
         Zt19G4LNz+4iDZZxN/Qpniqq4RlCwUNBDxCc87IJgx7TTJP8goqvz2THiqYxsmGzdh70
         92JjdVMlk9KrgMgRomAmIRvwK+UIR7fyUtuCLsG0/oV7w9GrcUJhnvS8NLTvXo5+MzWN
         cY1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+frSkoWCyw6bnH/cLF5eMpxbh6mT6v4danhuW3HBmwQLyrI+MwD7iq+CG1j6myo20Sor/XukZrROVyCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lvXrCf8K/mC6bJ2KD5zUzFSNS/lUOtE6kSi+MTlYBH1RceLFM
	A0zPUkubNRj3KnhJgBonsHxn/iMnR/RiFwQX8dKEyUhf+hsWu5iXgfKZ021TSantU7A=
X-Gm-Gg: AYBFou0o3vmFpOKS9UxQtu7n1Y9cWEos4tX1QDC1vKnzv3aUDoAkK2N916/O6NNohHn
	eVG5BFPEuWxjWILY/Qt9chvOwdP7VluOOwm+C/4dEP6qRLQd3tE9pWpkYgoZ+4TfdEzVxTrSr9T
	6r/hDhSds4yXX1NcF2ZG7zyHBtQe8DLWLnYl67h4hfbwoWRWS0/8vnH46VLwUH1gV7XQADt3edA
	kEbZA7pwZTw38I+BHMMchp3gMIol+m9XKSStCo7/S5CqC8JWG79FzKImrfNR2BwW3ac/XSnZuju
	+T9/gB579aKqpal5PL0SidA8j5zKmED5Af1Q5F7tIY0plWsgSxgOd0YHa+z2CPxj6BJFmVAy7xS
	iWhNZxVnaSUv149iLBr/DQ+W8MZzZeiDqHIH79Qor1604mt2+yu+F+x5+PuxS1Eij7XRGoB+pjB
	z94Q/UltL8QRlPDW5XecHKagKLvrVmdJ+1WMm8L5MDyYc8dkadxtQtRt/8uDfLk+sbpp7//2Pmx
	C6pTKcrfq5BhYtkIuPABwNejhgVG0oOw2n1ackzkL4U1YmEUuPcUd2cAK5iqVeqdVZwDsFjtU1w
	HExIPvM03Esxo8kFAo1AOplGX360FYn0l5wcUyfq+eyq
X-Received: by 2002:a05:6122:54e:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ec6899f507mr9340924e0c.22.1793891895290;
        Thu, 05 Nov 2026 07:18:15 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d774dcsm4443181e0c.5.2026.11.05.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:18:14 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:41 +0000
Subject: [PATCH RFC v3 49/90] nsproxy: refuse to enter a namespace of a
 cell
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
Message-Id: <20261105-b4-cells-v3-49-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=1730;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=IILX1LIwrnxWBZrztmHqMqyOMZ8/KSYL4VYD8k3ZAQo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFJkp+7bJCgWrOlQjezAwrMkgj31NOMOyZP6v++VL2xLlGELRhRo9nkdLV49ycUBRzSHqaKGrBA
 BxbPQcDy2KwI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

No existing task can enter a cell. Refuse setns() into any namespace that
is owned by the user namespace of a cell.

This also applies while the cell is still being built. A task that entered
the pid namespace at that point could become the init of the cell while it
has the credentials of the host. Or it could hold on to the namespace and
fork into the cell later.

The mount namespace of a cell is owned by the user namespace of the
builder, and has its own protection, see mnt_ns_seal_for_cell(). The
network namespace is also owned by the user namespace of the builder. It
stays accessible to whoever set it up.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/nsproxy.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 5d6cec2dc4ce..6b9b220a2bae 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -467,8 +467,21 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
 
 static inline int validate_ns(struct nsset *nsset, struct ns_common *ns)
 {
+	struct user_namespace *owner = ns->ops->owner ? ns->ops->owner(ns) : NULL;
 	int ret;
 
+	/*
+	 * Nobody enters a cell, and not while it is being built either. Whoever
+	 * got into the pid namespace then could become the init of the cell, or
+	 * fork into it later.
+	 *
+	 * The mount namespace belongs to the user namespace of whoever built the
+	 * cell and looks after itself, see mnt_ns_seal_for_cell(). So does the
+	 * network namespace, and whoever set that up may go on doing so.
+	 */
+	if (owner && userns_is_cell(owner))
+		return -EPERM;
+
 	ret = security_namespace_install(nsset, ns);
 	if (ret)
 		return ret;

-- 
2.55.0

