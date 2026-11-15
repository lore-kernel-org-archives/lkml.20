Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760679;
	b=ESaqLKWOJUwJKz5/YOOIyh0pxJ+2Xg5i7kiwmFOnyNoqpjJf2MJ0nTGvVIVBV6tXCZeP
	 8eZCQ5mx6P8so7E2NYA9/82pe66T5GEcqCOj+Bh/PaRMXhzM33jq7mCJ6gnJ1gwbkaBXJ
	 9mbqIKIlYSBlFuOunSB5a7keLkCVl+zu6ck5BlDp5W/2Z6EuVS+51hXDT1S4p8yjB9eP+
	 Rf0ByIjuttouM1LetXYv27L0dSl4vSqMzcKSaXTF1VF1WY19/RupcVdtK8JyPEhDX1kfR
	 L630KGrAjFAIHHY+Fl7sC+KYQ2tpMQWGa0471Wf0SzJmnyvQ0Ax5cMKp3fkoD7FGyKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ymzKP1oas212pEhPX2Z/5nMyyWnw0Gl+Dhw7a0DAT4Y=;
	b=DG2QgmZirrtWQmtR3w6RDEfZ81ZtrEL24hGBxtov8QvJdgF6kWOZVnzBCqwqOlYe5WzV
	 as158TKt+hvApIZkPyK8ALaY/HmKYDeX2ib+JJEF7eYbQdt8LJ4eNCX/lLXszHYScCfTK
	 CxVI04j6obmvaofM3CN0kHVQqhVugR78qCq2AfvseGz41Rx0EJByAJxD5zRPO+HmhqpeY
	 wPzODQN42luh6bnm4kiN+8O/Hek3CAXbG8vtVWczyS0AgqzaIcMnAQZ5fbln8EffWVuet
	 R76ZTX5JPMN3rlMUdREYS5FqpV5iUiZ/hIob5KoSmQk/FKkyUNQeRGEd/I0TUGCG95Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWtr00Xx;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA15606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA15606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWtr00Xx
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso3915990eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760678; x=1795365478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymzKP1oas212pEhPX2Z/5nMyyWnw0Gl+Dhw7a0DAT4Y=;
        b=XWtr00XxTcJ8dR3zblXxv1NzAOF3iOFj2kpCoR1bxg2LYV7/Uvhtg613igZja5iydF
         TZ/3i2Jw+l8+ihGkj1tu/CHlGBq+aNR+SlwprCsBkcyLLdydt+IS21UDiIuWiE+Q648y
         V7tvt/wUjQQS8fdbfPO+nmzBLUNFqNLNu4mdalCQSO417uhsvQ/upCkMfXZJ/u7WneMA
         RZAu23n9Z+4VnfxyCucFFIHtqX9LOnXzTqqZQz7n2tFF+6w1Ltoj48nmWIh6rTyK1/Qm
         0s5BFkjcLHSiixf+mDA9UIhNKQGf1hI8s5dhxWcV+bnEwgD15iVrgv1jmVR7197S2A/G
         YOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760678; x=1795365478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ymzKP1oas212pEhPX2Z/5nMyyWnw0Gl+Dhw7a0DAT4Y=;
        b=XwGRA0bXfZtfdU35ynfpdCeyrfZm+nAZFgsIJxinKkWkN2R3YkfUvLd2Wn8eOUKish
         kbogOdRA5XtapVLSdFbtxPh2gqwd1bYCPhaTo5gH1n4wT6jaFsRwDX9+JWKL+HrTJfQz
         kgvcO+dVYmhR1ddfdCnRtRBiTCRNzLtXp4E7l5/9TXF8kt8GR4gBf/QGiPWu49UXH0pi
         acgsFaHsE1YTzbrWF0OFzDGljDPcu6ZTFuypqa5s339lvhWieptlSJllmNP3AvgbVufD
         aWG294noS7CEPa/p5Z3ojKOj2ji4NjA1Ica01kfaAlOY6+7lcL+1wQIwjQSZYx5z93UI
         z7zA==
X-Forwarded-Encrypted: i=1; AL+hErGbUVpw8b7OFR+2tXdeDaGUXjBUs2C+2dbWES/dKxRa6ev4+y5HzezwrvPjniFFc+Na/q8JUrXyZVdngWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yL9Dui5pfQtzD4rmcMnsAaz42PZTBlI21XkTqc1mliNI8oRVQ
	xC204oJi09snRTYQe6SrI1YslEI/dZKK8/bcv74E6BQOo6UvVqcZyVoy
X-Gm-Gg: AYBFou2sK85XPmfVWGPhkn1Yx8uotLfSAIZE3NMkYPUxdBBnLrIIf3CVFFkcFi6MNYw
	vlr7gYYljrHEA2ZzBHIFo+xHx4B5SD2GdfZ2VXIRk64ca20Mv8sxssx70vEX+yeykQSArDjnax6
	OW+NGK1EAc2pu1z5/PPACWB/ViKWF46/10uHExM8rv80wX6Q8aJRrJrDvMQubj6JQx78zlGqI5m
	M8kw3yVHnH65KNGFP+/sxO3kVMnsLBUBNgmSb8p+7wFicVsaXKJGNt4cxpdp86UoK6q0sEgzPId
	+POHRlUJav09ejoSCTLV1Ze79yu2HVUvyITXHMrzqu/fv2xbu5amqK98y0UEhILqCixQbc78H4d
	ERA5OAhX0ovxbPdOh+daDahTwLPdaVJQdTpQC3aXKYbHae2Kx8/pDVY3FYPvc5WRdAk26VRyh8R
	1pFaq7Pi3CkD2RdoRRdFJ3U/ApBxWf4bJ9cdEVxrMcGuI+u3GqvaeuyGxJbZ1T+a+350+BZq9+w
	jsIq/ZNNd6x5yyr24al1NYRHZS1ph5LFnUMTZ5W9RQzcD5aTmkgDHT2fO+V3v6vWBY/7N7Fbn32
	wJFXKpEzTKsKhudcQreWfF6eAUyPtIyrZC+MsM5DrKrCrH0jIQ6KOwAYb/Aj+MfjgikD
X-Received: by 2002:a05:7300:fd0d:b0:36a:1f:9b74 with SMTP id 5a478bee46e88-37967ed53d3mr11417188eec.27.1794760678243;
        Sun, 15 Nov 2026 08:37:58 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm25654282eec.17.2026.11.15.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:57 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KVM: x86: IOAPIC EOI can race with KVM_SET_IRQCHIP
Date: Sun, 15 Nov 2026 08:37:50 -0800
Message-Id: <20261115163750.227354-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sean, Paolo,

I hit a race between a level-triggered EOI and KVM_SET_IRQCHIP. It
needs the VMM to restore the IOAPIC while vCPUs are running, which
VMMs normally avoid, so it may not matter much in practice.

kvm_ioapic_update_eoi_one() keeps ent = &ioapic->redirtbl[pin], drops
ioapic->lock to run the ack notifiers, and then takes the lock again.
It does this for every matching pin, whether or not a notifier is
registered. KVM_SET_IRQCHIP can take the lock in that window and
memcpy a new redirection table. The EOI then clears remote_irr, and
may call ioapic_service(), on an entry of the new table that the
guest never acknowledged. The outer loop also continues over the new
table. The KVM_SET_IRQCHIP documentation does not say that vCPUs must
be stopped first, so I am not sure whether this is meant to be
supported.

On v7.3 I alternated KVM_SET_IRQCHIP between two tables while the
guest EOIed a level interrupt, with no irqfd or other ack notifier
registered, and used a level entry that can never match the EOI
vector as a marker. Its remote_irr went from 1 to 0, after 81
SET_IRQCHIP calls in one run and 30 in another. The code is unchanged
in next-20261113.

One fix is a generation counter in struct kvm_ioapic, outside the
copied kvm_ioapic_state, that KVM_SET_IRQCHIP bumps under the lock.
The EOI path drops its match if the counter changed while the lock was
released. With that change I saw no such event in 247,039 SET_IRQCHIP
calls, and basic EOI tests still passed. I can send it as a patch if
you want one.

Thanks,
Cheng Yongkang
