Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50F2D47FF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788668515; cv=none; b=iRKu4BGKr2pWgaLbZ9OJHzZsb0l7ZAEd2RxpZiWE3KUwNNoaYgV9qDBD8pjmwde+u4cLP1WtHjV39+0o+Qu1q7mVCr/PmHpCbuGdHBX8JvVd/5zl5fJVz3kiNiG1/Iq7wWrrbxZn6WbxV4yDDOq+GAn+LZ2sjSoBYeWmddD7Xpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788668515; c=relaxed/simple;
	bh=vdK3wtpjZYQNeaslASnAOYg/PCjcSi/RbT91Z1Uest0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UN1bBHBXvFpoblNlNMdkg3darqLufgoW3K4MECZmRJwCQbRzM8l8rEgWypfxLkNp8HwO37NMG2XNc/SzXuZdIIficMnRFB21YH7sEO7AdfqYpD/Hxv6P5cspeuCIkb0s57Wg7aM2IRbXP48pYID1eL0emexN1CJ2z3PVXSnBXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO+e6Hc6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO+e6Hc6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2849112a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788668513; x=1789273313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVHZoxQnI4RGBc2Se+Rzzto/jsA46jGgtEifAbeG3A8=;
        b=JO+e6Hc6KGrWCldK6My/o+Bquds45AKpAqktRB6N61AflFaGAoLtY8IOjZwRj+Rz23
         mDSEf7BjNvelbembqo72Y/e+uZk2mK6MD9stlrPEtU45OoNmsEaAY1foYEKdYMA9fhRs
         0p19GdDHixuycMJto/tLitHjHwGvVRG/0pAjVkTvsvELP7NFXh6+cuSKiGYUeumEH6tr
         Un6qVsnyJmXy+vroLP/osFxDt/JUhQ90XhzJ1gcPn3uNIXgr1D9RpqNjxnu2kdgyNr5e
         xQpxxAnUS39woI1skNacI7f7e0+TOfmbsS0Xj3boMc4Vq4Pr4/gLfYmqP6NcAT5Q2ri1
         GtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788668513; x=1789273313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVHZoxQnI4RGBc2Se+Rzzto/jsA46jGgtEifAbeG3A8=;
        b=YNAxC5jxUgeCCNB9IwPL/fdrUM22frZLsbRiwSy51SEZ4oLBA4u/jcWm5u/9hj72T6
         JZFQby20jV7YPQ20G4ZTSa2RF++Rk44415Qtipae4kLk/d39A8no9BzgCdv0mcieoRVT
         PxdS7xpQD5f4elQMR4wmCTQnmrTmI1Qn7RmS6y4msFuvsB+7G6c0KxwmaI5Inm+h93dR
         iA04d/hJstHrn5ACPrxBtOhqGWoApSzxMlP9jCrQAwIEY37SB3yJs2O4nszb8Vbd5gNA
         oEboiLFrl2+ZcPr+CStzE94uGssyW5dD2paBctnm9KJVPdNC/WSoX8PdWsEPKj1xF1+X
         PiZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/i5nggPIgzUz2+Pq3y3xlR0QO7wXMkykDBuTYRMVrNhuZUa/qoVdK6XLFKj7ZqTtGeKiTIGuWsKGSBoc=@vger.kernel.org
X-Gm-Message-State: AFuF++nYKKbBPmO6qlLYxJnDDQjIdcpTSbMDZWx89aJlFv1duyEdB2qS
	6oXaR9X1chTVCdR4wvgtgfblxaQyTXcn1QPyP32nkL7rFaDrr5sY2uHK
X-Gm-Gg: AYBFou1faKBljeS/1xcRSe6GvW8I9cOWUIT43CwKDpgfOrhePgtbx8aeiOUPPol8JJg
	P2CPFLbwNsmtBdC8B5zRCzZx1dX/evyWkE/vV0t9NuUQzxfLO/4oacCEQqqLWgTRSye08xUCeh7
	kLHKtSIgLK7vC44ZjL2/3oF70C4NlHEosFP6laieErry8Zacn/fPeZm64pRUTZMDp2wEPv4Srf1
	z+Cv+OcH/KJTYvwA/jUYh+8mhnfX5Mg+lC0+9ildLVqyTYvdRNX+HirM5FyRHRXTcmFqNZIhSp8
	7eIlbcnkWa+UO4w/PGxdf0+uApPQvp4rP6E2HewGv/Rufh7aXheJPXtb6N4HuXZZspxyB+xlypl
	AdkQFzKVYq9feeLvO8n5k3soTwF6T+P6lAzn0Sn7CUg2zhGSLa9fX95t8GylNqWPTxv7y/KgHwL
	ni/YXz0rFPV5vrG1t/Wo5CQawReNLRqi4IYrTvKAPyvalN7zTkxJ2iMIKGMRJCQZ3dfMjbrDbyP
	lmDmjBGAXyOVqCUy5yQlO/AULpBZTN4nYl3V3x1EI5fsgYyBTbCO90=
X-Received: by 2002:a17:90b:1e51:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39b26260f7dmr22268351a91.22.1788668513437;
        Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm9412489c88.8.2026.09.05.21.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix reg_list and VM leak in get_reg_list test
Date: Sun,  6 Sep 2026 04:21:31 +0000
Message-ID: <20260906042131.630-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling the test with --list or --list-filtered causes an early return
in run_test() which skips freeing the reg_list and vm.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: 17da79e009c3 ("KVM: arm64: selftests: Split get-reg-list test code")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). Running the test with --list and
--list-filtered now exercises the goto path added by this fix and exits
cleanly.
---
 tools/testing/selftests/kvm/get-reg-list.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 216f10644c1a..6eb91d5c739e 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -189,7 +189,7 @@ static void run_test(struct vcpu_reg_list *c)
 				print_reg(config_name(c), id);
 		}
 		putchar('\n');
-		return;
+		goto free_reg_list;
 	}
 
 	for_each_sublist(c, s)
@@ -306,6 +306,8 @@ static void run_test(struct vcpu_reg_list *c)
 	pr_info("%s: PASS\n", config_name(c));
 	blessed_n = 0;
 	free(blessed_reg);
+
+free_reg_list:
 	free(reg_list);
 	kvm_vm_free(vm);
 }
-- 
2.47.3

