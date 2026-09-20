Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753637E5EC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886865; cv=none; b=Wi7PaNDyRrvGFYO5wb0V9rnAuaen2OEpnGQQr8m/L+37biiNW6lOYairmaNGL4+Ud4ZJ0ZPPKRbAhv4MRKroH7CD5GNjcP4JLvfxlWGqSpdA37ousMz188l+Jhao0jZfn4Wxx+q3CxF8S7NIIvdkf/rY6lgqZt7BWYIRyoB0+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886865; c=relaxed/simple;
	bh=gTmgzrtRTNi0pnoGcGCYY2OCjhKa0mHfPxUgmpCGYoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVMTdkduEsfnTl1emE0tu8vXbraxuDGWlZ/5N0ggX9IUQ3pujEqu1TS3lk20z1L9uZcQOXMGIqxl03WVxc6Hp42l7FsVT9RKR0btaPsVWv3uqQ/EI68aStzX/Ltaufbkoym7yIcITA7riVYmsR3v8Ch0wiCZK1ySMwvi1vMmqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfFE2SU+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfFE2SU+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso16447715e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886862; x=1790491662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUx2kd5N+hlzcFFuusyp2pQWQI+Tq5GjSNNKvVMy28w=;
        b=OfFE2SU+SLj4d3hv89jWrTN5o1kT1PEGR7GXY0X86n+d8IE+voYQdZgNAsAZmCJZGh
         BHRuXQeziHlZvZ5snDnNqrPuCg8Sg/+TlCGjwt2x0ewmthEv7E8uzKwwajyDJAjfI247
         re8zONmxfEoequSfBI1WQjnWThsVbcnhJa944babLZRBD/1A6EdAJO9+RMoN96H1WSoo
         Cne1zw1w1bKS/grVwyXnhTYZcsArP5Py1BzJ/nA+WYmjVwmjb8CYxlmFnDD62kCPmvui
         HvmrWXEBsAHao8OUp8gKN8NOTkybgun+MoQExeZIyWu9oe7kxqeboK09MeTe+GRc5Ktx
         Jf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886862; x=1790491662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUx2kd5N+hlzcFFuusyp2pQWQI+Tq5GjSNNKvVMy28w=;
        b=i8kFck3FDP5rdDtXTz3Ksa3GX0dLOusiHOOZiahcWgW/J4SVIH697XI1Pkcjjvz9SC
         pAhsJ9XVvae6d1tVFaaJiJjlCoJ3anXB4ZLNdIE9Ydd8tsRNko+Yb1mGGSf4yKv1yyfg
         iCck4YHt5Eu8ZbpQoNBBMWXVbDuVlYV2KpaE651Kp/4ALOu0dkpYipaW8SLTNKyUhkKC
         8imIbkvJURjvS+2kflwTc/kjcEcYicV+xaTbs9vpNAo/41jdM2vQxD/Hrvu0dlrwaN0S
         kcNq85r2e76S8cQlw6PG1jU8YJtvHjTk0Um99tej+K3ngpidx7a4Qh9tc85SJqfvkfne
         QSmg==
X-Forwarded-Encrypted: i=1; AKwUvBz0/VQBXXvWL3wIUm0CmE0Ypt5PzcMJ/0LPNMPlJERPPvUT8wI5K5ki+cHdJyDWWvmXGdZH1YSJQGDgMYI=@vger.kernel.org
X-Gm-Message-State: AFuF++moQLuv6vqxkulJIbz47ur3uul6e2oXh0S0f0Vig+tP4U53QGLW
	uplvkCNsiMzX+sNTx9OMnz6Xf6uCnc3HBwev7cJ6FLzFJKjk4WEheuox
X-Gm-Gg: AYBFou10o+imZS4oOdG//DEyNkyyAwzuSXMfFI71dlcQsHbbPgBF21/rWz/kVQwoEl+
	fPIK519MYfywcLf2c/BWt7hxQpfFH4Spc8at4R7QZLT1dq70FBleTp+FjW64B4X9ksa0Sk6R3Zf
	9Xn6sbkJf2EcaRhfTnc6V6x5nm6U1v/IjTCjv1LOm4uyVmopZe80lFMhHt4eGLiff9wnRst65zy
	EhM4khSZE5HmQA8N5SWTXNBTnUf3uYFfzFn4ec9gEkYBvFU1OMvDw7WT6Mx7oHQSZt/09vmzyYw
	mDXbvq1J3YJ3PLgmVyvyzZUMEHuU5TrFEkkqWQsQO5KK5OLbHW0wkQMorpmBRrd+g0i6ai01AQU
	A5ZdWzQQcEcI4AKSGmJjIv+DePpHORTwAu8301FFMWabAaqutJjDMjsR/zAk0jkHb9TKfMXASsd
	hcRs4bvjhDxMdm3xlKRXs+5PHs17yNbgHAoPyhTD+47l2ox8g+voGbQL8YJtK0G0dpBI22UF3AV
	M14dhvCt14ROUoGr9XYda/VLZW3ozl8wAdrSKW8Z3ZmGsiys05kgtIk
X-Received: by 2002:a05:600c:35c9:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-49fc5736229mr113604215e9.24.1789886862139;
        Sat, 19 Sep 2026 23:47:42 -0700 (PDT)
Received: from voyt-laptop-dell ([92.115.55.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm141442235e9.2.2026.09.19.23.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:47:41 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH] scripts/config: honor $KBUILD_OUTPUT by default
Date: Sun, 20 Sep 2026 08:43:50 +0200
Message-ID: <20260920064350.17999-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If $KBUILD_OUTPUT is set, use it by default if --file is not passed.

Fix the issue when the script silently updates a stale .config in
the root directory, while the user expects ${KBUILD_OUTPUT}/.config
to be updated.
The problem can be worked around with --file, but this is easy to miss,
and is inconsistent with how the Makefile and other tools work
(e.g., scripts/diffconfig).

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 scripts/config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..f52ba5e6e27e 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,6 +130,11 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+if [ -n "${KBUILD_OUTPUT}" ]; then
+	FN=${KBUILD_OUTPUT}/${FN}
+	echo "Using ${FN}"
+fi
+
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
-- 
2.55.0

