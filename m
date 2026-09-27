Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE19131354C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519707; cv=none; b=hFWSefL/pNx+m8KZnb0vsPzjjNQ4fwT4Yi8D3ofKqFDFz7/z2qa4mHH19CXF0nkX/uVUVjvra0AuAy9wkL5Z8rLBlheYK3z0qP8Ce0YqeIuxMn1rqpqTOTylSarqpaZYilf9Fv1A5DQWx04Tl8TPI+Kqfk8LqsZ0uptv5mPKcK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519707; c=relaxed/simple;
	bh=uuYyy7vFt2lrsYUQ5T98+aCOrvwL1gkEZsuyxNh0/Dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=azxjBV/6NvZngRkV2LfzD/f4BGwGmQS8n0zkYXzrlM2GR04TVylAIWgxYBSRJgNgAh31Mh0ftyN8c/BO+VtIlj7Qla507fDmnVcK7LSaJK2Vf3XoxeWxOlvtIH+5vm2mWVP6usNlPi+3q7QwSeJ9CVWerHzeNgWnsUFqYJpvTMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L86qfMG5; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L86qfMG5"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so3246218eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519704; x=1791124504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
        b=L86qfMG5W5V5+yvO1miM8CQmq4/TZPCDqizzNvC3sqtvlKtO8D3q2Y8l3CVLJ9vnrT
         ucLkV4JX1/PqKCGiWtOYY6e2qjHz5JdzsJSYNMpN1+zvYx7HyDcJW/vENb8eNe6vxwAH
         /upcFjpxQ5QU/rU0dQB/nip8pmJPSwXki9Bq9CAnatcWI3iIhB6oS2gd3sZS9YoC9rje
         DZPnnVeWlFO3MpJ2aXGDrv/TfSQHg2tHmaMykPl5KPBjiUu6v5FecrX1mmp4xV4F1UJc
         OOy0c4whjnB6ijShkxoXXOiRNffsv/9IJuAJV54I7td0btc76Tl9f16EiyexKD+3eDZG
         Gqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519705; x=1791124505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMwW2JLY+HI916hc5v6/gg4kWQ5njDV9vffDoqUd5vA=;
        b=Ez+6cIvxaXXuUlvvlMa4M9qt8JsowqMptGpGRoIe3Z5O3fffuWIjOa8PatSI9KxJ6i
         pau56lnGcZ/RodGWBcsu7Gss5CTcAHacmix2dGUrCg42K6Tbbstz5w2vrZ9NZo8filoN
         o2dC7byuiESbliWfbIbGaANydpwoONJXZEsh8xi6rPVn6GE4acXjkGu3Uty22ho/EvhS
         HwonjXC4vuKnceyKrUqCFK+yRrhAZuJwV7k4lannEdKS2FyN4oG8yxAmgk1Lb3gXfQ7C
         GAuRcYImJu3Rd+rt7X6qmuRBA9YJmZ9WEagdtggIBcjax4s0p8pfUb2YRZ4bZ1Q8NFGc
         ka9w==
X-Forwarded-Encrypted: i=1; AKwUvByHHZ9BQpOyYJJTrs298gDy6GeNPDhl2YgvRfqobNx4In8zsyHkhJ6qo+afUNFN71FzMbRey2uewo5sWGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlyNQAyQm/eKRQpmkTZBaTO1N1meMBR3WCJqn98N8kNaEWlxla
	fuG+NNCh2YqqOhtozAb7wBD5JjaC5wq7JDkz1RLFwp8SU9y5IKOWoxgnOUdUAA==
X-Gm-Gg: AYBFou2+PGbfQkRuuy9MRAkhAH4QAFSEs+VMo4O3zsPID5vMjvuqv4yxu/H1JRJgG6Z
	7Mh3syf7wi4iHkhsJ7CYyw2mIrIzm7bviABVkM5BRMso5lYZWybOmbq32Xfg1HfGdE1q2U8y+1b
	T9hVs8/AyiV2jj3FBohN37fl8tsSgiwbMfC34ruLn09UVFdzYWs3UsXRL6yBCIB+3oz5qnoUJkq
	OBb7jfWiqDOlk9tjWi9cblb2VjVGJ4FixqzbctczmjOGVDp/QrOH6SI360WmHbQzL3wewGzB/op
	iTEzKNrkgfpiZYZTm+2UvdTijMc2OZuzwM6Mq7Q40SpavqMU6pyTIe+3fC2rBSLYQzhsgenpnlM
	HrPtefWgJtGQ3BMzYvoLEIQFUB3Tat1LVgcOVxJrM0bztthax7SZoOGeW8fuydXSJUIFqAGUP1a
	I0kbNoZhtC0deFA12VOwnCbN3K54/jbZwl8ZPDt+Aqm8ccik+4KMcvGOexh4O+9VBdLnQ4Fyea/
	B0SsvjHFpLuhN3IjhQrRInKygaAHRFwq+RYAqVrHftHZnZB/nklBXocgVtKYlWOjBevQHg1
X-Received: by 2002:a05:7301:1403:b0:346:d790:9e0d with SMTP id 5a478bee46e88-346d790a2a7mr1438024eec.19.1790519704521;
        Sun, 27 Sep 2026 07:35:04 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:35:03 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 07/12] powerpc/pseries: Annotate the RTAS physical-attestation sequence lock context
Date: Sun, 27 Sep 2026 20:03:48 +0530
Message-Id: <8ba89d7a07cc356a0b31a09b01faa761ebd56504.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's context analysis reports:
  papr-phy-attest.c:154:1: error: mutex 'rtas_ibm_physical_attestation_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-phy-attest.c:169:2: error: releasing mutex 'rtas_ibm_physical_attestation_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to phy_attest_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-phy-attest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-phy-attest.c b/arch/powerpc/platforms/pseries/papr-phy-attest.c
index 350ba26e5962..d2bc5c0da422 100644
--- a/arch/powerpc/platforms/pseries/papr-phy-attest.c
+++ b/arch/powerpc/platforms/pseries/papr-phy-attest.c
@@ -133,8 +133,11 @@ static int rtas_physical_attestation(struct rtas_phy_attest_params *params)
  * @seq: user specified parameters for RTAS call from seq struct.
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_physical_attestation_lock held.
+ * phy_attest_sequence_end() releases it.
  */
 static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_physical_attestation_lock)
 {
 	struct rtas_phy_attest_params *param;
 
@@ -161,6 +164,7 @@ static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by phy_attest_sequence_begin().
  */
 static void phy_attest_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_physical_attestation_lock)
 {
 	struct rtas_phy_attest_params *param;
 
-- 
2.39.5

