Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661275;
	b=kfGFNICqj6qusiLkHU1aVhgwFeyoN1PhRqSOZVufBOrTFim97BQFfiHiG22sHXFbThGU
	 ONHQGabChhL3It9XZYGnfvSlTuUqiuLpNtTIou03DhOvC6ewpfdkyeO6TCI1te7atrfTp
	 rOdBOUo2HT3H+5veUnsEJSj9Y+tKUczZqyHdf9WfX6OIuMBY5jpwHb76ecVCZGYt9PlEN
	 h4qH/LgfW/tPNTjuhLjbdagLeoVJ1j0Jqrn8rh1KMJAvV24tGLJfWz483v94FxJewCkAP
	 t5NE8WJNIi8TIwuwdnJESXQ/60ttsqs9GNevD+E8B/s2jIhBq6rr+4vJ4AcHhFlItXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661275;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=VFOpiJBU0+gSWaqRBXnhqnKbhLh4U3kkAdTn+n8aSUQ=;
	b=k/WoBQGtyHQT13RJcnM6HpCXwd3RrEKH+A0tu+PxlEiBqOzNnE98gSoA3soWaybBYbC0
	 29Na+jZCvXsVH0Ps+vT8zCqq0Ur2EHjqiVK+RrGSqEExNume/+3Zzh53w/4taaLm9eIAO
	 JYnyruFKalXr36V8AA+wD4o2EM89JmsXchwjKHmSoAnyJfs8FOKSVarhdVVl8PULtyk1p
	 7nWmZxaIHRm1Fhl0eOyMenwIKGHHjWb7INAxPN3/2sgt1v9p9jmLb7rC2ibelba0hy1Ue
	 AY9DwiqrPkfNCPtUDNW6b4VNqw0+pwSUvpivoLgJSSrPzzW4QREyVR8v/67luXfvtuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqaRYMrV;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D39606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D39606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqaRYMrV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793661274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VFOpiJBU0+gSWaqRBXnhqnKbhLh4U3kkAdTn+n8aSUQ=;
	b=MqaRYMrVhcx7gk5UiRiOARIYXQHZllHU4gtmRE7iOpuUU+0vayKHVQZrmPH6pI5m97xpPE
	BLo50xbbNl0EcBYd58YazdqtRFWG3oSjpVKTMsWf4H6LbIbXaM9wtmdLsRJwhEv0kPzsgp
	nVKRBO/PsnNx5oE4kMAt8KoeXhwf4d0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-0zvIUFlMNxaztrUkky_fLA-1; Mon,
 02 Nov 2026 18:14:30 -0500
X-MC-Unique: 0zvIUFlMNxaztrUkky_fLA-1
X-Mimecast-MFC-AGG-ID: 0zvIUFlMNxaztrUkky_fLA_1793661269
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF6A518001EF;
	Mon,  2 Nov 2026 23:14:29 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A64A7D5;
	Mon,  2 Nov 2026 23:14:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 0/7] KVM: a bunch of fixes
Date: Mon,  2 Nov 2026 18:14:21 -0500
Message-ID: <20261102231428.13523-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Seven fixes ranging from performance issues to missing checks and potential
use of a stale role.  All except the last one are Cc'd to stable, and all
of them are already on their way to Linus.

Paolo

Sean Christopherson (7):
  KVM: nSVM: Check validity of vmcs01 save area copied from SMRAM on RSM
  KVM: x86/mmu: Conditionally resched when retrying gPTE walk on A/D
    update failure
  KVM: x86: Conditionally resched when restarting REP string emulation
  KVM: nVMX: Process each host MSR entry at most once when unwinding
    failed VM-Entry
  KVM: x86/mmu: Cap number of parent PTEs per SP at 1000 (the arbitrary
    rmap limit)
  KVM: x86: Unconditionally reset MMU context when emulating INIT
  KVM: x86: Flush guest TLB when emulating a RESET to strictly honor the
    spec

 arch/x86/kvm/mmu/mmu.c         | 10 ++++++++
 arch/x86/kvm/mmu/paging_tmpl.h | 11 +++++++-
 arch/x86/kvm/svm/nested.c      | 23 +++++++++++------
 arch/x86/kvm/svm/svm.c         |  2 ++
 arch/x86/kvm/svm/svm.h         |  2 ++
 arch/x86/kvm/vmx/nested.c      |  1 +
 arch/x86/kvm/x86.c             | 46 ++++++++++++++++++----------------
 7 files changed, 66 insertions(+), 29 deletions(-)

-- 
2.52.0

