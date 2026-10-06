Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21B13E5A17
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282596; cv=none; b=Cdn9WswvNTHCsCtgckGU52k4Uftmim9r9sfJAe+YADKhWcw5YGYLubZaX+15Hgl8MU1bOTjVFMMNlCh4ZZqLhsxzJRkFqsmxu0RF3Y8OEhTUP+orGsOAt8ZZ4eE7zPYi6ug8yqlkIka1eKKkB56fqpol9XVPq+gyJ+7+ljtGwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282596; c=relaxed/simple;
	bh=ieMns+VuICSUp9NXlt0XX34aaudxaGmdtmEZKYAoATQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JTIKX3WxFVThsz7PONX+ufsNCmBlIWkxXiNn3iHj2RnkcXHD//SZsmGn4G8lH2m1WA0rM9rY5vJZj9e+Nd2npJINi8rk5CbJhof16f16hEWDfBYszD51/qWmh/FCbhih1TSfIivY7NnEnkZlHFdFOdC0EsAdgTPtPGHu8oS1WPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/ybWh/0; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/ybWh/0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so773972eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282594; x=1791887394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvsvTbnvAWg2QlsgwTzrwLWl+8GGTvt/3AFTkgMeK8Q=;
        b=X/ybWh/0wAbmBczTbMSqSYeJVdABhMnO8cWo858CQVRZN7lCVMZmHF69oZemxaAHoK
         8dNV89kMzKls9x77DGj19qBk32h3RuNsN9tsoys9x4cLe2IQWqhkkWiOClfsPfmHI+Ug
         oCWLVPtCuewuUuvGpfhv2wn1v8wJAPX2u+GMEfiAn0Lyyv7dIP0flK5EzZFWq/N4wAGX
         RvP6ZN2jg2bNYBhlEL257e7yvfBbTEACCw24qV3bhkrYHVDxgzmEsX1poo+BlfYlgnmI
         iDDvIegts+11GuAb/0ZkrKaNQJsRg0OVEHfJcL0F+0eAg2VMKFCWwotMhZ3asvksvizA
         yV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282594; x=1791887394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvsvTbnvAWg2QlsgwTzrwLWl+8GGTvt/3AFTkgMeK8Q=;
        b=X0G9i3AJFpsYxe8PlzflRkF9fnUGOeE5PWA7+cz+goWV20v1utizYjxu0gt0XVWFgO
         pVFtb61NtCKaMUcuTAYKduaK8t7nm2hNNLLTUPkTvRNOfwDHM6xre05qOupveCHcA5QR
         9vaYeFtI7vrDkgq621mQh09eIPyYG6IokB2f9rdHtlg5IsOBXEs3nGyD5k0Fk27kJNvO
         h7CKMbTDoLXuQ/dJGrajxzKnwz81n1U9BquAphrp5/A6e6uWDLW9gy+3C+/rcU4BQsIN
         6Es94faq0BwAcd7zXwUKCLFH1ERNqa2NUJsmF6NIEwkV6GfPDtJgBvnA3BREA4rd/bqH
         qYMw==
X-Forwarded-Encrypted: i=1; AKwUvBwKaGyc96vSXuN3bJKo/2l/rcQHvWxEZQcI02q+WkblRryx+ktOcvtYWLVsmiDU38mQ3NxBxIjrWQwZiZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIckk5z2oc+WDeNtjNnTOPwFOp85DWIdogPalFWO7FL/JBG0eCC
	RoCDbFuCZ8DAHxAeb7Y4NjfNnyDAtZ6w8+wguMGdt7mJiB0fwu1/vGic
X-Gm-Gg: AYBFou3TUmQZ5nRvnVXTCRbs718PHQSM4rQy5deCuwM64fqDsG3+Pi9e3UgqLdHZB8p
	cEiiBSrnj4QbL5Ti7c5QEulaiN7AmZx5avyDSupQDthX2QBeiG6CxMhZ2iy7SHFdiXk7OmyNdnX
	6tQIs2w37AHxUZp3nyR2BKMdUQt0eeT/X14rCebayCN77wPg6kAw8+5TDHKyugTIlD+ruPfFNpS
	sSNem3VYnddEVb1z3Vb1MKYV6WEe9RiSzSyPJSbMmSq1EoYccMh4pT7ieqJqoy/sDM6ePzA9ISn
	HTrXHdqyoVEkCfPrDoJ2v0nTEue1Kde0zgyq60Rc089Zg2rAFQlrWSDzPZd4uSegXVoZUBfOXl/
	RZ05m6/4GgD4dsRrGLiKhOEEKzZ11voNiC5fxZMdI1UWC1T1CdOa99AdrPx4GNDzVUxj3ApmWNe
	JEgcrkQckIPwAYm6NJJNL7tTnS0gA/xuyg2sol5HTXe6Uf/8KKwNBKskte9imrb2ObC/G1qhv8P
	2UH7ZmQn91PkQG9btQBkhzuUNVDHNJaTvL2MZKHw0PnQyL7Mu7h1D2D08Dj
X-Received: by 2002:a05:7300:ea10:b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3514e2f1dbdmr892976eec.30.1791282593578;
        Tue, 06 Oct 2026 03:29:53 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm7443970eec.6.2026.10.06.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:52 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v7 2/8] KVM: selftests: Move memslot_perf_test off the 256M ELF load address
Date: Tue,  6 Oct 2026 15:58:36 +0530
Message-Id: <11b5712b213b7359bbf3bad32601e4373dac43bc.1791280439.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791280439.git.ritesh.list@gmail.com>
References: <cover.1791280439.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM selftests are built with -fno-PIE/-no-pie so the binary uses fixed
load addresses.
On powerpc64, GNU ld default links at 0x10000000 (256M) which is also
the MEM_GPA, so the identity map trips with the error:
  PTE already present at level: 4 gva: 0x10000000 pte:0xc00000000002018f

Put the test slots at 512M instead which is past the ELF.
e.g. failure w/o this fix:

./memslot_perf_test -s 514
Random seed: 0x423558ef
Testing map performance with 1 runs, 5 seconds each

==== Test Assertion Failure ====
  lib/powerpc/processor.c:235: !pte
  pid=371 tid=371 errno=2 - No such file or directory
     1  0x0000000010018293: virt_arch_pg_map at processor.c:235
     2  0x0000000010008b3f: virt_pg_map at kvm_util.h:1325
     3   (inlined by) virt_map at kvm_util.c:1571
     4  0x0000000010001cab: prepare_vm at memslot_perf_test.c:353
     5   (inlined by) test_execute at memslot_perf_test.c:816
     6   (inlined by) test_loop at memslot_perf_test.c:1062
     7   (inlined by) main at memslot_perf_test.c:1136
     8  0x000000001001d713: __libc_start_call_main at libc-start.o:?
     9  0x000000001001db47: __libc_start_main_impl at ??:?
  PTE already present at level: 4 gva: 0x10000000 pte:0xc00000000002018f

Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index 844ea9b7bb41..2913a4de4cc9 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -30,7 +30,7 @@
 #define MEM_EXTRA_SIZE		SZ_64K
 
 #define MEM_SIZE		(SZ_512M + MEM_EXTRA_SIZE)
-#define MEM_GPA			SZ_256M
+#define MEM_GPA			SZ_512M
 #define MEM_AUX_GPA		MEM_GPA
 #define MEM_SYNC_GPA		MEM_AUX_GPA
 #define MEM_TEST_GPA		(MEM_AUX_GPA + MEM_EXTRA_SIZE)
-- 
2.39.5

