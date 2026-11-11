Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376813;
	b=HvB9ubiyfFvaLoi6yCIseweMMg+4gzr0m7Lq9X2O12/hx4thFluZVi3OULeqJJZVSVUK
	 LUV9Ff/syWuMYkMcqsYLTcDb8GV7aTu+srB31S7K5XXU9Kc/DZNOdW83siUTNel1w5dOH
	 uRXb2giSbA5CwJC9SxSpyebCZComEcApmh7VjKWLExCaduRET5qGKUtN50tmXBxJQKhg2
	 e3DVDqVxpeH1eL2oXGBKkCVin9Ry4Sk7EBPmkdtgIALC9PWHPY2spB0SyIj3650/lPrym
	 7S1a6RCIyhmeTjAEke6XgyKeRgOOBMdO7c8TuXV0KFfgUGNhlSkc5dBYC9SYWzt8TEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376813;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
	b=2jB0BjijKuSmHmgRuledT+zRIxd4Ppa678x0ePeogQFKsF/FBBDvMo6w5f7cDnwdIagJ
	 7AHnJ4Gy6LLiUx5PBbwxyOeikZt+FH/HmiUsjlGHzkpyDe0EKKGMQrI9Rhro+s6Z/l79X
	 zzgEU9gcXH93/5aS853Ww7cK0WApNEm0hQquCDlzDmbcNCAzs4vI9No9JcgDxz6RETAth
	 g431X/h4PnBiIH0nNTkZCxOwAvqgIvsJtRLJ03sX1A+m1DRcFT8xl7gQXGU2FO3t7DeVU
	 WFKuc7rF6yqavjsCkdEi6nOr8QL2VZE4oaB+vHEhgEyHb9jLaoUVkMcGMQXaSHpEgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjFvApRI;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406A260A2637
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406A260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZjFvApRI
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-91eb46044c4so35277066d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376812; x=1794981612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
        b=mm4csvSF0b76Qx54lMhXJgdjEZWw/q8FYyL9PBHk05GA/B3/Ysi0F/5hSn6LqhktzR
         TLuy5uRQwtlemCeV+7GR4RVtFtkzgEj/71aVKjZpmb9wxJXws2KuazaPKDHpdt2HOG1L
         VieZ1uwLXb1kbowJH0WaRKyr+7IMcGpklrO3QLetUSUDq1yeD4XCNmBOhZRhUspvK/PR
         yXQbEU2GRR5qJ+pmqCo4Ttuv7dA8iqMV+YHWwf6xEzM67BuX0BfAiZluqvH996DXOeI9
         2THytkiW0Vqg/i4L2J3A9jFRlgenED6jl3VS71KT3F/+wM4Wo2Ke092fIsoEwmdnOePw
         zaaQ==
X-Forwarded-Encrypted: i=1; AL+hErFcKwMVO3xPYI6XjTNTZkXkJiMuyEXE6KHi7v/b+oQCgTlfXVnDPc3Co8gB3uSsGwvkFUli+j2BzIL5ojY=@vger.kernel.org
X-Gm-Message-State: APuU4Z933gQc6PYuT2dBpVc4CwsUISp3cJhDMgXw3i7ayImYN7iEm1nj
	b/y5sgLBNpNTHp4jF9bC48pRA8Q6nAovs0e7/RjaCKN/UbHG0dIhjzYRJfy9gODhTlCrQAqY85c
	q/GtuNW6rdSYbqTwGo7H8yGG8t3698YCIWGPYQPPO+6RResW5bXOmPTvHsqI9PR/X2kEtD7bRXZ
	GzEYpfrLTrXUzFhB6TrO0vjj174x68zg95O/MsMHtl8wv+DK4KMYaxYJ/WHux9OYB7hPs/QfhmK
	UZ9d6FqieTCcXu8
X-Gm-Gg: AYBFou2NHTtOnQMeop/xZFQF9FiAaEeK/Dm1yhvG1y1sOaoAaOa7fiT+dhzABY9Gc0Z
	05mlJ2Is0HM0HE7ZtDhqH0hG7p51EkkfBBAJGpaOFBN5VSVtAfTfw8csmrgQ5/8lziys9Q3maVd
	y4v0HEJWBxNYygfcS+gGmIwueOjdneAJtaR0uKY1MyRVI+y8kdAgUJyd6+u1Kd0ZoLXNJDU4DU9
	WSGev3DdQ1WYE3FrDgNogW76amJsTGbw43hCCRleL0rAsb4n7UUXhQsNO6Qye/w56nUz4k6bBcr
	vTul5vExLppuddPM85GA7CoQ+q3iQ17cfnfn+6nshLkajrBnCZ/qPys0Gi+KyjjDnUlRcJ/h1//
	mkt157B7trnRr63/anhavlGaslRKGWNkgPk6g3DajhAvIYDBa0XamFaxQAVHjNqoQOBCmGFCx8C
	DyyhgLiAWms9SO1S3C0EJU/YxU2dhl4v/t
X-Received: by 2002:a05:620a:1713:b0:93f:334e:df25 with SMTP id af79cd13be357-947b00388e2mr222328985a.41.1794376811991;
        Tue, 10 Nov 2026 22:00:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479efcea89sm53476285a.12.2026.11.10.22.00.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so677351485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376807; x=1794981607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op/9/DpgcKIe0jcvYLiJPNqXkkmx6XxpHhTMkcCwGrc=;
        b=ZjFvApRIFsh5X67BEGnT6S/tCiy4gMnxOiTiBifW6Drt+KGNJIneE5/tzwMbbqtCaI
         wWn/hwbp5ViDEJsqFOytKVMZJF4tQsgDlD81YvXuiLTVio1CuU3HnOXlzvqLWikXEJ58
         EQa5SyazNYqU9R5FDBYimR48SIikcfIev0Xto=
X-Forwarded-Encrypted: i=1; AL+hErFn2YHf6RbBigVK84p8r/PYmW0sduVuZ3dgI7aoE6iDTJFU+xt0UicsugKbZVEOS4mzds0zxQcg+49yG6I=@vger.kernel.org
X-Received: by 2002:a05:620a:29c8:b0:93c:720c:94e0 with SMTP id af79cd13be357-947b001c6afmr209721285a.30.1794376807011;
        Tue, 10 Nov 2026 22:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:29c8:b0:93c:720c:94e0 with SMTP id af79cd13be357-947b001c6afmr209716085a.30.1794376806575;
        Tue, 10 Nov 2026 22:00:06 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:05 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 01/12] KVM: x86/pmu: Honor enable_vmware_backdoor for VMware pseudo-PMCs
Date: Wed, 11 Nov 2026 00:59:50 -0500
Message-ID: <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Check enable_vmware_backdoor before kvm_pmu_rdpmc() hands an RDPMC of a
VMware pseudo-PMC to the VMware emulation.

The pseudo-PMCs are part of the VMware backdoor, but only the
emulator's check for RDPMC at CPL3 with CR4.PCE clear honors
enable_vmware_backdoor.  An RDPMC that KVM intercepts at CPL0, or at
CPL3 with CR4.PCE set, returns the host TSC or time to any guest, even
with the backdoor disabled.  Inject #GP instead, as for any other
invalid PMC index.

Fixes: 2d7921c499af ("KVM: x86: Add support for VMware backdoor Pseudo-PMCs")
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index eef2f792dc9e..ca6dfb44949f 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -759,7 +759,7 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	if (!pmu->version)
 		return 1;
 
-	if (is_vmware_backdoor_pmc(idx))
+	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(idx))
 		return kvm_pmu_rdpmc_vmware(vcpu, idx, data);
 
 	pmc = kvm_pmu_call(rdpmc_ecx_to_pmc)(vcpu, idx, &mask);
-- 
2.53.0

