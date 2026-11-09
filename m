Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202734;
	b=axXCfkr01ezJMBKNOPzW2XPz4jB6LPHgtjfzSC31JbYHdK51nYl6Fck9T/03SMJ7YiKn
	 8dVZfeXf2XDSiSSz25qL75qsqbEv82IU+/MViWg4gv/a8bqezwU7/Vr3DmTE+UEDPaA7p
	 dFIPS2Uee/XBVjhrs5axACZwsNWYerRwDwx11gfNRjaQezWDdkULhVgOCaaKnULngPkMK
	 NBgZayIaCeUrYPpAKh0z2sJN4EaPpSRG1QG0cqPgGbzKLRyBwi/6MdAIesLSFhx6Repem
	 CiIwGfiamDBjDON0lj4eaS3ZccAG3egW1rBktwR71Xp51QoWTwecU9bTMBGw0ftB2Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=1IS9bB79S6ELO3/6XYypihEImNKjKlv6tMYPTAYxBWM=;
	b=ruYK3OQqRdILdJRjPBq9hNdPKoJq+nTToCHJX2C5NmPZD91gaIFqGKParyJ2DtGlVFWD
	 Q9NnfrZMa/DgZPNeVy136pahbP8+uvWwTksRZOFo9vmozYtF3UHR5ljPmVJL51ZEIi5YQ
	 74vEwl5QixnWLil8a+Xc8GbgUFmL79RlGScCR+rrt2IcPsS2h1Ko7/DMWX+vtc1YU/Csz
	 NkRmcAx28NSrXpog8Ja4aWcqh0NbkQNBCm6QmpczegUBN3Y/BTVCBY2utHF3tawmtES45
	 IoHXIle31vVTDCNwuNruJt91omKLUPUCGadYza22FMyLkOctL38MGixLFs9y6cAibEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P52m1tCu;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C81606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C81606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P52m1tCu
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso4652355e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202732; x=1794807532; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IS9bB79S6ELO3/6XYypihEImNKjKlv6tMYPTAYxBWM=;
        b=P52m1tCukE761aWyH02DuccwGLNXxEJHkzKsb0kG+eBy4GwBBl7L4AQi/DJfVfOqYQ
         4CYkp5AThDEMyORh4Z5vQG+z0rwNRFbX70PrcQCcItiGahcuHnh9v3KG2E3HkQpUDx1f
         lOV27Oyi9b5p5vDUxkwQsXTjCGxqOn7g2rzBba7ecJGZgvNR//iGmxoG6w2/ri5tbm5H
         yU73DsRp+blZAZ1DMNm7WlmQL9D0usA1+bWzpn0DOhJ6EoVr7ayvg5+n4e7fmDcBJkGN
         NatjWWp5iZQyTWn+A00Ono9MlxIc301c2WuYI4p06abSS8WfUcW0gODmCHRhQM7A3W79
         Cplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202732; x=1794807532;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IS9bB79S6ELO3/6XYypihEImNKjKlv6tMYPTAYxBWM=;
        b=r85nSpN6FmxwX/5VncJ0XAoBMhPwKn4246cjCTxb403lJIP3W54fiHUPG7BR5JMFpv
         qXJ2XoMrTgQIfOUInevZvCMyKxrZe4SIF86aD7HBceDeWb8LXX/HdsjzBOFTgkTat8DC
         PV+OPq8lYUvsk3zJAuZgzF1wIGLxEIV34LPgsRasIucFW7A28IBRe+w0BUK9jtK1JKZ9
         9DEIYHFH3CdRo4+OQuCzyIIp5zrdsyBi+olPoVRFdlqSRzhL5dd5gVws+PtJGwwQgMK7
         DJAHdRZ1pJeBTXmgAPD7nV/aDgZPLAF98UYrYjKZ6FNfcqkMCsoOxEwJ82aCiTqXBuvU
         tcew==
X-Forwarded-Encrypted: i=1; AL+hErHW/XpdNCyuYXQNYzhZu1oqn26DAh2D5Nqjlb+vT7e2DfXVV0F5IThImOtavPsOwk59+xeTX1aK8/2pSvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KTxMvIneYByaqgY3xB/OsCoJQd7W8KhXkuydYlPp1q0SNtV3p
	EYJ4sJy6VaAT5T0Zc9FGl5SpnOkVXvbEDpkRSHS+q9W/Eyl81DZmsEdb
X-Gm-Gg: AYBFou17Vlu4GLw9ahW6q4N2g4oTf65nkHZlsgdn974kWoa4/p3Hujmbr/Jn4hCV+Jy
	2OpbJzETHS8Vsjx4ojiwn7x/R7Wagj9ifFzosQaxbrQUE7l5hDDe3XFWBrCIf1Uy1z3b5dqntfy
	5FdFGqGDEVvObpAXBpBRFaHtmjw88mLsasaDmHGEkTGLE8PVLBQi63nhfw5xQWRlQvyGhSiOroM
	0EEwobimIKbHJbOZ6I0g2BACIMSVjoQMw3Czmgey8kAZtZzXKQuwYwVfHWfxdobTdOjsolkubM7
	AbJ64ntpkiO5z9qeC26Td28KCFOBpBsmtsWZ6dS9lIjGtNBLH+Yp+jRU5n2PngCLw4G28+fohhF
	ZhJPcAzYuRF+EgGcLt9g68ZUpBnWYzr6el0+ASLVTgX3pqyu9VTHD06fEMw4dQRu+iXJECeVFa9
	h/4ZqpRmT8gmPdbw5VzQHXLVqte+5ngGsK37ve5yaC2U2XPFjQEczvyoJpqqqGnGexCzKL5nNRI
	ORqdQtcT8N+OJeSats7v3pAyOkN2dgo6LeeZ9nly3GslIcYaxyy1xFE4IqUOCIrke2MEoZPRYzl
	7BDDVdVkbUSErArdz9ccFFSL4d+ghUrzwIVl2u3m34BMUV2+nFAJ/sGoYGa/10sc8p8LUxk/Oty
	jDUg/sG+Z64ukejiXgJMk4zj1feBh9Yxnd3AsN6ntFLCkGv3kRdkC181qzyy8QzLI0TPX0pwu97
	adgpBRvsGQ8Dqz
X-Received: by 2002:a05:600c:8b6d:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4b963c6d1dcmr53426495e9.8.1794202731953;
        Sun, 08 Nov 2026 21:38:51 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm99903155e9.8.2026.11.08.21.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:38:50 -0800 (PST)
Date: Mon, 9 Nov 2026 08:38:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: nVMX: Prevent potential user space corruption
Message-ID: <dab486f129c36ba1cfb322ceb56ec6fdef020ca3.1793959700.git.dan@cryspen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

At the start of the function it does:

	if (is_guest_mode(vcpu) &&
	    nested_cpu_has_shadow_vmcs(vmcs12) &&
	    vmcs12->vmcs_link_pointer != INVALID_GPA)
		kvm_state.size += sizeof(user_vmx_nested_state->shadow_vmcs12);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This says if the three conditions: is_guest_mode(),
nested_cpu_has_shadow_vmcs() and != INVALID_GPA are met then we are
copying sizeof(shadow_vmcs12), which is 4k, bytes to the user.

Later, we check if the user has enough space to handle the copy and
if "user_data_size" is too small we bail out.

        if (user_data_size < kvm_state.size)
                goto out;

But at the end of the function it accidentally left out the
is_guest_mode() part of the condition so potentially we could copy more
than "user_data_size" bytes which would result in userspace corruption.
Presumably, users normally allocate enough space and we don't often
corrupt memory in practice.

Add the is_guest_mode() condition to fix this bug.

Fixes: fa58a9fa7497 ("KVM: nVMX: include shadow vmcs12 in nested state")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
This bug was found through our formal analysis work at Pereq.eu.

I do not view this as a very serious bug because it requires userspace's
participation in corrupting itself.  Userspace can corrupt itself
directly if it wants.  However Claude says it cannot share the
reproducer for this bug to anyone under any circumstances so I have not
been able to test a before and after.  I have run the kvm-tests on a
patched kernel.

 arch/x86/kvm/vmx/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 879183c1bfa5..a9c126f702d6 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -6878,7 +6878,8 @@ static int vmx_get_nested_state(struct kvm_vcpu *vcpu,
 	if (copy_to_user(user_vmx_nested_state->vmcs12, vmcs12, VMCS12_SIZE))
 		return -EFAULT;
 
-	if (nested_cpu_has_shadow_vmcs(vmcs12) &&
+	if (is_guest_mode(vcpu) &&
+	    nested_cpu_has_shadow_vmcs(vmcs12) &&
 	    vmcs12->vmcs_link_pointer != INVALID_GPA) {
 		if (copy_to_user(user_vmx_nested_state->shadow_vmcs12,
 				 get_shadow_vmcs12(vcpu), VMCS12_SIZE))
-- 
2.53.0

