Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D793E2746
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906985; cv=none; b=liZ3J4P2Ug7UigbdPqVsRh5ICvQHObIch89R33nFkekPVtHDa9Om1JMaK6skbyfikaXj0NTMn+2mXgSDD5LYHglLBqMjrHi2L05qYvlEQWjRAFC+LJN+3uyDYEWpP1LrxKyzq3+dUBdfvQ/hBtGf7ZodeXUhaivoPBsC9ZQnd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906985; c=relaxed/simple;
	bh=hWltHfXGF6tM0pJn0+dwTACm7KNrwHA6EQNSK8fnngg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6c3YR4z9SB1PjOKyrg6qn0FN3P8M+JCU0BzVSOCPNNL0xBiFhk9BEwiOIkBkdzjNa16WnDF0e3T6ECFGD6mqpUoGSD+MXd8HGkYJbl35zo9ZdWdz8dVB22IM4CBMKb03crmpSkh19qJvZnolggL4Hl03gepYwuSeHCyTBOfioc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ2x9Onp; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ2x9Onp"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso660084a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906979; x=1788511779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=lQ2x9OnpqRZqbI8RdP+g0NJWARSK2K0kIaSW62gdaQDTkHhnMbO07juJJphSIUUyn8
         vUXTMdm3qJ6yVHbiSbVt8OGC8tXZUG3dqHQPO50uamZq6TOw830dBMs0GUvBx3B/rViW
         Ap8GZa35iDWlAMafzjF1XEoYfiSiFs3yAdldakUL7wOR9D49s3dOlJpD0jWfQQXgCLxC
         L/ds4ZeU27w3DkTCUhCCgW1hOHS1BMVlvbBBZmqxwRZwQfPnfj4T1O95RRtZVRnUF3/w
         w4mwTC7EvBnrs6vIeXy02xJJgVZbGW4CPZP2tO3YqSuK12hF9PtiYtqAiq1yixgD9xsa
         Iymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906979; x=1788511779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=LAojWOUUjwf4Q09/sNAmpRWyMX7QUJDvQqP8EtFMDa+Hh1xNnsI6UGNMecXVovJpem
         ElzIx228FLVtwI/Aci/u/cg6MUk0Kh78hG74U5tOpB7/MZ3JvsKes6qM8WLhahWh6sdL
         IpzmCbOJLaeuQmxbDWyhaiQvWsPYhn92uGCGD99wu0f6h9G3l7qY00RGlVUKFSAS/Lju
         RchUfjYIO2oMIoIG4oljt8AQG11M+P9jWoo5T2icbmP4UndIhnJ48gedrpi27aCleAsU
         SNgAAnfSkkpSkVfEznPCcM/wZTxi0VaZh5OIO/Zc8qI83aiUCuucMakc8KbZDetiQIyp
         /WXw==
X-Forwarded-Encrypted: i=1; AHgh+RrUuZYIYPeoogzngpTr8/A4m+4cfXQzjMJWfCqGgS5xM3HUVrboTwbZaloKOMohPPaRrbmGXgQCzWzEUnc=@vger.kernel.org
X-Gm-Message-State: AFuF++lba3PoPBEXvajMFX9C4FnVz/NEaJTeXMWZlFWESNEbLoH5tRkm
	5QEarO0cjd4HtDFzYBiM2OjchXjIJGJKVMEaySauTlW3ftXn4Pf6z9Jl
X-Gm-Gg: AR+sD12kHqQMIJy7+f//n8uFKCmId+m+H9XqBydOnFSTzPsqBsep41wS4sxg07Dh7zb
	Dg0HZKZN9YVGuTVGu4GEPHvj1QKVjzf9/nHRE8OjRD9G0ErLUPG3RddbPjM9mqum+535YP5dzoh
	loT8txZseDdAxzZK73QzKjB4rAotRZuGvBLkQEdPmi2rtvo9MygrV0ZU5bd5REPQ2qCTmSDpGIZ
	EkeLtLdK+dKsVhq0d9dCBqj8qLrPapWQAVzD1r79ICMz+HKmPuRitezSwViAMvG5DG6r4dV7CO3
	IEL55nkBj4Yw2vwbqjKvb0O3bxvz1QMSTFpq6oqsOqkf0PgclvwfKCXFOR+u4GZEbC0C7Tvf7MR
	g2zJ3/5n3zuPIWgNxMY/UeChyo6Nefsen9b+ohfvRyHifOiTlBoDlHD02VLrzTPzYjnxYEU/+cw
	S878ZXgWyCO9bkzBnrLoz6epBqTWmJa/b0UMTgEcVsvSHj5zU4iuvL3RcXdL+Q48r6giAgtQ==
X-Received: by 2002:a05:6a20:db0a:b0:3cd:9f0b:f788 with SMTP id adf61e73a8af0-3d267b656d6mr11291974637.12.1787906979500;
        Fri, 28 Aug 2026 01:49:39 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm3801546eec.16.2026.08.28.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:38 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 9/9] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Fri, 28 Aug 2026 16:48:55 +0800
Message-ID: <20260828084900.1496839-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The encrypted dump target support is now extended to arm64 and ppc64le.

Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 0bf2eb100a05..36ad6125c670 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume (only x86_64 supported for now). User space can interact
-with /sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
+space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-- 
2.55.0

