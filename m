Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343384;
	b=iArcHm/b/aaS1gSh8KF/lYhG08WY5XthjrOf+4SSDWdS2VVuDteXScXq8L45ylceIS0o
	 2WQehTharozbLoNkNRRSALQetRf+wLpe+FPTz+ouRgcLSj8BTvAZRJdT0HzGQ+uuwzPJh
	 FNucZdT8br9o9QcNgEsTX4wHYKs8/lTeHeYUu6kDYbUCio9fhDlIbwsb0Hn72/iFAYv+U
	 PlMai9ULS533ZRcM8E1Vygb7NK5HUAQfcFA9rDP27EYLfqoqKpxzHi7WvOlqizZ8+NKAd
	 Y7Ikod+SbtZLMjY//LQZ8Q6+cT0mtQJYaRC18S1P01aDNaDa8yOZLRdip8pb4YhqJ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343384;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6NInI68FLUylWrhgCpXBz1AP5EYWXga5qw6E6p4zJEg=;
	b=0d/SG29VNnPfAlNnIol7ZaE5J0BUESYtpWVFc0ErS0yvcfafowKDXr83eKE+z2PXaPRW
	 sWRkz1+DK5fcjNmKqIyRMGmz7QnDO1vHnysEEOiyhD4JXonrh5F29sZdFlkE2I31iPlVt
	 dA+XJhgWbLjbUOr4bCTkQlBjfIl2RRSUYGZjwKjKOgi8xcBa6YvoPXuU7Xd4YxQSWj0SP
	 8n5nJnJiIg7180qehwvlt5d9cFcrhBNCojZ5MLxBckCwBzA39BQEeeEe0UA96IjynYEDN
	 DwSAykQnN68WO6ucHn/TBxHLLXCZEp3qs3MW3NcImw7Knibko+Lzxuaj2Cg+pOZprDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Dt3RBBR;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6D5606A324;
	Fri, 30 Oct 2026 06:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C6D5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Dt3RBBR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6NInI68FLUylWrhgCpXBz1AP5EYWXga5qw6E6p4zJEg=;
	b=1Dt3RBBRT2n7vdMoPAjgRYh7Th5GGv/nngw3q8ATWLLm373zlntIDqZ5Z2eWzfgrVd/IKVkWU
	sDZlkG2TrR6Ickus9haCPKmRWK7qUwc9qnekEi2/D/wersMPzo+RMHDxlKnbyCklW+z5Buw3pjd
	NbuNxs6DAhcZxlBaqAmBK0g=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhf0cydznTVn;
	Fri, 30 Oct 2026 14:56:18 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id D794640586;
	Fri, 30 Oct 2026 14:56:19 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 3/6] KVM: arm64: Wire up TLBID vDomain configuration ioctls
Date: Fri, 30 Oct 2026 14:56:14 +0800
Message-ID: <20261030065617.4090073-4-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261030065617.4090073-1-yangjinqian1@huawei.com>
References: <20261030065617.4090073-1-yangjinqian1@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)

Report KVM_CAP_ARM_TLBIDOMAIN from kvm_vm_ioctl_check_extension(),
and bridge KVM_ARM_VCPU_SET_VDOMAIN and KVM_ARM_GET_VDOMAIN_NUM to
their kvm_arm_* helpers, letting userspace configure each vCPU's
vDomain bitmap and get the number of vDomains.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 arch/arm64/kvm/arm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 809d33b8e5be..4dfea015eaaa 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -598,6 +598,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		r = kvm_has_full_ptr_auth();
 		break;
+	case KVM_CAP_ARM_TLBIDOMAIN:
+		if (IS_ENABLED(CONFIG_KVM_ARM_VTLBID) && has_vhe() &&
+		    system_supports_tlbid())
+			r = 1;
+		else
+			r = 0;
+		break;
 	case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
 		if (kvm)
 			r = kvm->arch.mmu.split_page_chunk_size;
@@ -2437,6 +2444,17 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 
 		return kvm_arm_vcpu_finalize(vcpu, what);
 	}
+	case KVM_ARM_VCPU_SET_VDOMAIN: {
+		struct kvm_arm_set_vdomain vdomain;
+
+		if (!kvm_vcpu_initialized(vcpu))
+			return -ENOEXEC;
+
+		if (copy_from_user(&vdomain, argp, sizeof(vdomain)))
+			return -EFAULT;
+
+		return kvm_arm_vcpu_set_vdomain(vcpu, &vdomain);
+	}
 	default:
 		r = -EINVAL;
 	}
@@ -2578,6 +2596,19 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 			return -EFAULT;
 		return kvm_vm_ioctl_get_reg_writable_masks(kvm, &range);
 	}
+	case KVM_ARM_GET_VDOMAIN_NUM: {
+		struct kvm_arm_get_vdomain vdomain;
+		int ret;
+
+		ret = kvm_arm_get_vdomain_num(kvm, &vdomain);
+		if (ret)
+			return ret;
+
+		if (copy_to_user(argp, &vdomain, sizeof(vdomain)))
+			return -EFAULT;
+
+		return 0;
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.33.0

