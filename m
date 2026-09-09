Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89339EACD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914261; cv=none; b=T1xww3ZISmdSXS0R3jJk/YG+F3VHmxVozKLzgT1ll+hB1SCEOcepMz/CYC2C6f4CQXvcHL+EKtt3yNwnPpiLS3mY5ZuMjFzUQhkvZjb1O5Yg2YAY4ZwlBHIH1K4bg6H2ghstrMYVN/QCnm7P+ZtB1B9kK8de4wJHJQGrsImWtFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914261; c=relaxed/simple;
	bh=hWltHfXGF6tM0pJn0+dwTACm7KNrwHA6EQNSK8fnngg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIvQBB0eGzGW5/OKswLSO4K0k/xlJFPgxsTWZKHuNx7ciEgUo/juFQIWp9GNzy7uUjN6rU5SUBG2oWeuujZFfMFxwMprT9jl+kNmgL+6BYqGVBr5AD2V2ZmuNzYhM3h1hZmAb/xWW+4WXNfpiooTHW3lr6QCBuWNA0Uj/BIRTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b67E0KW6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b67E0KW6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so683180a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914260; x=1789519060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=b67E0KW6w76sjMa7IIOQV7KpwyutMY/UpNjhG+tb3pypdHWBMsRMiPbT4fqzjhBOZx
         pZUjjARIpymH0YYhqCq9Xj0DM6nSGbwVJnNNH6XozqSQ80mvspNhthpdyhQjpn/uqufq
         T4etY/QXRQ1ebVTmcI4Q0I+3j6YrZpfdWa6l+hYzzbTioaHjkmv189blSDS4BEMbq7qs
         q858JQ+KrqGGiEIJp3K+Zyn/Rn11AvL3URiuDsw57/+4bmXYXjPNi0RdubT3SBDD9H/K
         wfGxqzVsKL4T/oqQ1rNsPhMvs/xTHjCr2O6LQmeUUUpd+gC05jaF5EulbVrd0Fb4iv2y
         wZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914260; x=1789519060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=Ug6CmWWWEV+oHxekZ4c8m0bRFtAXfsvjDw0sOhvfibyTLdysIzFuFb+ha8fqOcS4rj
         aY2T/1iAeSotU8yfjskrxSJ9OWAlxVBB29H1ltZwUjU2Zqte3BEQ+JkBwjqQA+mjeinV
         RPyJOJM3plVxtIVQtQ+TTQiOoLWLWXyi7ynhIk92hyc90r34x0xWOJwDJDbhGBm+yK2p
         0cVZMtQlPo9qyKAfLI8HLCdwjXRDTIoD3o0dJNaJY+kGZhojfVoo0gqYj4yM0QKff26B
         8dKSJmq2K0g9qDHRYBQSDsdojCVod/ZnK945QHJlkdKDvk6+B8FtI/8JQhAeGnLlBSXy
         vsGw==
X-Forwarded-Encrypted: i=1; AKwUvBzRejc7QmcQLP+EsiiyF//1xLnlbNBEgj5jGc+oF10S8cpzWs/gLDepareRHKAU6JepuvsfCWo705XM+qo=@vger.kernel.org
X-Gm-Message-State: AFuF++kcTuyExybX9ADTxdxTFg4BZWxYqX0Xgk4ISPQhG6bdo3yEE7DT
	0YxJhmGxNBNgKWJyweYknOcH1fxd15yDPkgTVi+qlkbQyAWg+3fw9MAY
X-Gm-Gg: AYBFou2tp2QNgQp7RzNtpa9f9oMdq/RFc2OXSR1D8EvmP7boOPFaiplps372QXFrGzS
	D7TXSVdt+Cw1Joupi/zQCAzR1mG81MMZgOe0v474sfk6j/M31e4PmicFPb4WVGNBX+gmQCkeb0F
	YT3kgAJNuv2wnaRU4d9/xheXFbpEIQ4Aqp6h8e90SOwYamPzorSNlGF2uu94OQ0ARFf1cIJRFgi
	0LJJUF+PRSjjCaWYM9Bt9mMd2dqCLyQbh21OFjB4T0PmHtEl8eFIzhmXf5HUIrwFx/LhbjuoTmK
	OpFt4nSWFkYniO6TOSl+qzvMi1omVWp78DjJlqsXLb/O000IaJn5uOLOBPuL+SJPIWwR+eLaFhg
	vIqZkr3XkZ43pbi8sVeRPZ1yWZ4KMpDxEEUhVMniMN2znZCQotY22n++G+ULbKRX3Kt1BdDBsKt
	YcrQ1Eg/N62XQqlUJ8lwUyBBVf28GK0bhAPFFFgEwb0FgZFuu7QKIYyAy/92/Z
X-Received: by 2002:a17:90b:58eb:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b8bf497edmr7501490a91.15.1788914260009;
        Tue, 08 Sep 2026 17:37:40 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm35551055a91.17.2026.09.08.17.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:39 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Wed,  9 Sep 2026 08:36:51 +0800
Message-ID: <20260909003657.1570544-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
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

