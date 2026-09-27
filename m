Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105332D3733
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519704; cv=none; b=W9rLogzP+yfY25nkMtEUlFFqEAGZb59oaSfEyOnFRIoXn7tQmZ4phyBAAO3AedZ9iW92rS0SQvut9ktv5XY36h71s47772b6zWobqYvPDpei1Z4nGXGGKUpKGx1Eg8et4iU1MYaGZnS0sMIkhy1mRMLOsA1F+nburHxkdxZ7Z6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519704; c=relaxed/simple;
	bh=pYBHmK/aN2Rgn0QJwcJ5+nRVxP1vjeRzoCP5t1XcI/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOyToTKCGshV8a4YcktRmTMJn6CGPrH+IuOYKC7i8o0US8CL3Wui4tM66lYUfFv5O3jJtH5kOogrLb1IWI8fNexSd5Y190JwWv91CnO8e2w6L0qHDBAKjy9If4ZbQCQq/ZUpQaOsX09i5TpVlR5j3L6G/KQv66ZSd97JTk8jM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iX9GFDJU; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iX9GFDJU"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so1762397eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519701; x=1791124501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
        b=iX9GFDJUVv5taVCU0BITxB3vb8FT+qmBVyElW6KLXilmm4CFtBQAwULzE3n5wzGrxG
         WPzZmKR75o8PbPc6We6O0X81mOxmDKjkW9DsSWv0ru+3Xen56O4H3cIXvUhhOHUHFZ27
         jhN9locW3g974l+DF9r+nFdaTjUiE2nRumUa2TKbNsEOlcoGhtnlzDgGgoI/nLlzbUB4
         AXvNX06lN6sJ3idxPKvbpfaWCdMRf4NFQtxb8UkG2EOgNj7+BrbFFODInw1Uoefbk1Qz
         v5cJ3Ud6Y/MqhPpZhtEKA7gwFsmQxRYxXue7pRdBFR8L84j/QIOY0bHhRtwQKX4KZktI
         xEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519701; x=1791124501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
        b=I/a8ilbF6nClqkEB3yFYZMKvIkp1NyF0p1IdQnGKuwEH0xzCopin3rh3elAd8IDJCO
         Vvawu7RcGtmIWwSOZxRqo2qLO+OAf4l8DidEQOGrDDDl4Cz1PDewuzwDmrE+OgRvNCKI
         MBGM6Vx2e/rXzbRajuc8Cr0aL1JjSwoMWrFR1D96tl04upin/rhFfUsTqDWSXdJshVKH
         42/ZvbuPG3wrIPeSfL25TF1Jckt2UXECVGFzq+hK8AuK8OwseF492cEZd8PXUIbOa+QC
         rx2J2GfJWVICJqehBKGXGgthwWJ7tokdQoxKZQanVAm1cvgPWaSQnwega7U+9/Em/t4o
         00IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG14kz1eFKW8bka+o88rmz/56nArQZbeCBaiIr7zoxxIFZxe+5rlCs7QfCkSOBF8MKGSEOoOJKqjAmeSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXyzPzMIuj0ScxIeEtGfFQlhlnVCiV9bHmkMsoUON/+Ch0lgEb
	oYAfDclPFZNJYJDmsWHER0fTnztVQbBqhdgrbe1YvZ90W896rmO1QLtc
X-Gm-Gg: AYBFou2dEunxmnAeXD9feLWbYV8KtiRMcXbbK2rU0ME/0gxahCe5EUn0W1PQxJieLh6
	FwiA32SXX1juIOKODlUsOCWTjNKRwc6r0enyi9FieYo1cpvYYRkeKEnhEKyJbHj5VOjhf2+l73q
	1CL7iHWnt2uuJAU+Z7QN1UBALfnRT2e9IESea4sWinhw/55xPcmZ/dWRwG8iQZ82njL2ABB+qBF
	kZw72SOPx5QoQ895WgCEK8Y4X9nTTZsa+vUYzXhqB3stcoyTozwG/ieU6Mbqd4bpl+ezmzKue/w
	gjL8FdPBOPQb55vp5h9r307MpIGz874S/xa5d7eBfJQoorjaC2ygiCAzsICIowr+vq+mCC0B73N
	JxgMH9i4heXcTAQ0hrkNW/G61Pd/ZIFBqoS3jjWa69ZwcxGzl3VIwHP2a0rltsm9i3zzZsro2t1
	1MCaAn69NXJibdyX1xcpsbLhBbZI1XLwxFPAd0wnGSSWjHPABCZyjUrrAB8B80wwDCLt11I6/q4
	QtcfLW6UarWPSzwWHGwDYFntyml2T4Op90NEXJODlWrGn0jvAQeuvLqfIHupzsxJAqO4Wo=
X-Received: by 2002:a05:693c:26c9:b0:328:3944:ee53 with SMTP id 5a478bee46e88-3426f9bf753mr5911416eec.2.1790519700325;
        Sun, 27 Sep 2026 07:35:00 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:59 -0700 (PDT)
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
Subject: [RFC 06/12] powerpc/pseries: Annotate the RTAS indices sequence lock context
Date: Sun, 27 Sep 2026 20:03:47 +0530
Message-Id: <fb39a6ae865a14d277a2cc0332f4fa853152c1a5.1790517984.git.ritesh.list@gmail.com>
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
  papr-indices.c:145:1: error: mutex 'rtas_ibm_get_indices_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-indices.c:158:2: error: releasing mutex 'rtas_ibm_get_indices_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to indices_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-indices.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-indices.c b/arch/powerpc/platforms/pseries/papr-indices.c
index 3c7545591c45..3f3b88f708a3 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -126,8 +126,10 @@ static int rtas_ibm_get_indices(struct rtas_get_indices_params *params)
  * indices_sequence_begin() - Begin a indices retrieval sequence.
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_get_indices_lock held. indices_sequence_end() releases it.
  */
 static void indices_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_get_indices_lock)
 {
 	struct rtas_get_indices_params  *param;
 
@@ -150,6 +152,7 @@ static void indices_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by indices_sequence_begin().
  */
 static void indices_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_get_indices_lock)
 {
 	struct rtas_get_indices_params *param;
 
-- 
2.39.5

