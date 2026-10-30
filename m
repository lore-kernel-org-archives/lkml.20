Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330999;
	b=E+NWahYZJQhN7/DEEk/DQYJdCqBS0SUO9/RPySAoVEnLcGBKMgNw4ay838/P/deFF/MT
	 1sPNqQYzljZbsn4AbPuxCkjx9/GaUZoeLQvRZgGviLnQ+fPJgMGz1/uGlvvz9QP73L9l3
	 K8k+u382idF3nHVxJk42aW05iwwBkkc0pQfM/pGoF6gEuUIkkMQ4cw8vGbwaebrXM1ZgP
	 cCwWcDKH/+c58lX+GovcGr8vE6m7zTb6eIPGyCxO85QW5aKMbYPPDccQ59olaSG07NrG4
	 jU8X6Bb2HR7eyjhndNTGxWPC4PVqqExNZ47lBc5nmIdmEK3XmTwwxIIAEYxYgkFMF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fHqIvwCwjfUgesmssbUyzagyO3sOsIFnDyPzXS5ogoI=;
	b=UNj5sueVzgUHKSYzHoac6fIcQ7hSc2lzTgxpuD8Wo1yj+0RbjJhXY858pIk057evsJOx
	 A4Yw6d+nTUEevIHlXmhMCwll5g3i6FkR6eWcW04+9jGL5G2FWGjcJFis90OIKBusUZyee
	 mL8JKooYvSHQTqekNWGBZNsQMBAY+pmN1lKAwOv2UOnpWpXMEeDl6nVYDCp0cIqKs/xnI
	 pRGCGyOm+MQUTVQyF8iOvMOtwksqjK14JTvANuQCpAC9VDScHXoHDE0zkSFU7TNA6bmiu
	 a8yPRc7R0XJJB0S3lzQeZGtlHlvR0cU1whuB+zZr9paseQ4WHkhnTAoTQ3CBtOnGafg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cALrW9Kt;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE12606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cALrW9Kt
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-881269371acso737503b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330993; x=1793935793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHqIvwCwjfUgesmssbUyzagyO3sOsIFnDyPzXS5ogoI=;
        b=cALrW9Kt1d2vLHLVZ0qIIAyzP5PeKtfJ6STl+wrB44Re6i2+74CdFW7w4ajlYKncOe
         KhyZM7pFJl7WfWHSC5Y07TY3iU9psAVcMfBctFvtluyjFvTuhyEjlExMNXvyCH94xMu4
         qFgOA3wxvKRqPQ/DJDiregA9M0TQN6gLASfjiZq5t6enPe9nwqaPteBbPTYlPBuP/oGC
         qf3bn+M3k14oSJTzMgXqqXGuWWKmyUhcApVIm4sk9Lmj7dlLfUoMhp+5IqtbM+wdnlql
         KoRRN6ofYF0y5Bxk9WK5GZASdC1WCKFj6C+mv2Rn2P6ezjvJrp6Ts1EoURikLUNcrSpr
         eCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330993; x=1793935793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHqIvwCwjfUgesmssbUyzagyO3sOsIFnDyPzXS5ogoI=;
        b=DWzO61k/bCzQyKvZNNwuflcltnnDbnZYdTP2Ng7Dll6X2FUhjDzSQ2B/EXVo5nVRmF
         EARt+5cAt5xRQlbJi7envjLWvzRaf4UN166PFCehVhJGPK4nQdA3xSWMFhAWp3T5FlQy
         jOglbgdzsOgr7fjTzj0tmw+0/D4hU2eOSF007RZBMjs344TP30tWeCi0jsAffmX6977A
         yVM4vfG36m+0RNbgnqIPYG3mAG7oyPTf1tUMr2C/V6fetZ742h8N1KHNQxeR+EIfU1n6
         XyGMnUseaLhZmMqD9yIMM2paytqx7KU+j3jLYMlOCOPXpxBIoJZU+mGSUPhzeF+oIRya
         L4rA==
X-Forwarded-Encrypted: i=1; AKwUvByPJiztXKwI8SuKGqhPSVJ7AqiRCOjRi0iE7aPkHSeOtLLXty2d65zyEgiea9n2L6VeVZwM7WWSX4Rcuzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRoGWDTUZ2M65KJRRcDBQBTUnNkXIU9CsseiVRNR1oXiLaUW/+
	wm5nhOJCZqwjZuGXEs7RHhQYSu8R4hPG/wMl3kvSgbvYF2wv91/TBGhG
X-Gm-Gg: AYBFou2lEvoJDSwZ/UX4j1VwUkitaAsAZ0J5z39PhMqat2fnv13ridFcRtq0jWjMS0s
	v6Z+2t6HjVft8JQB2H6p7ajUlB7sUBmB8tSsxZt+HeJFKt2sXOaxfTaQQtSe1XHyOEHinrP4B20
	piMxsi/A9XYo0ilG9zaI/SxOW7+uqBkuWjGxW8zxEwEhSGgJJE7x1GYfog0M26tb+qhQi2voyH3
	zEAMIo1ThhTDoh4H1YodkR7ADcoP5NqeHSzhFkJvAzFVv8WuS1M6Km/2IHFeO3le1w3JzGA6dly
	mVZwhgFyONRu0vZyPD0oGZ6aJli0KY/KiC6IHC7tveH6NFny6f9VZx41FA2W2RHdZRkAfaIE4Id
	1P6nuB1ux3KJWLpiDOjn4RiihqkKYf/Y3IepUp4hn8UcLhGhcT5MhAVvvM1c5b2gQYmG3nGP4+0
	SotwMXRymJ8Fa4KaYpKBTM9USy+EM5wBrxZVI0cF+59tGTkbUxExL27HmtcmA46qQnT6HTrdQZB
	15Ov68r88UqQKKQ/BCFl4vtLyHlRrMhQlutu7P3XGra7Z+1lasPHxLOafMOM2JGN0nOikmqXAAR
	FYKa2pXXRTyTB4uMUcrOrvHGkb8KaB9NkVhD1AJccGw7jfeXHOLnyqDLgj1xtkkCS4OeM1bQI5u
	guvYRlYjSVhnEhBojnPnhPEOWNvQ+qdp5zI6VRh5SO0l27o/ENfurD9Uw6SG+8/04sx8a0VGq
X-Received: by 2002:a05:6a20:c903:b0:3e2:4a0e:6211 with SMTP id adf61e73a8af0-3e913b67a66mr3504067637.26.1793330992605;
        Thu, 29 Oct 2026 20:29:52 -0700 (PDT)
Received: from localhost.localdomain (S0106e0dbd1c8af8c.vc.shawcable.net. [24.85.96.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0981c5desm111713a12.27.2026.10.29.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:29:52 -0700 (PDT)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v2 1/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits owned
 by L1
Date: Thu, 29 Oct 2026 20:29:36 -0700
Message-Id: <20261030032937.2813-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20261030032937.2813-1-ma.mandourr@gmail.com>
References: <20261030032937.2813-1-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When L2's LMSW exits to L0 but not to L1, emulate it through=0D
handle_set_cr0(), as is done for MOV to CR0.  kvm_lmsw() ignores=0D
vmcs12's CR0 guest/host mask, so L2 could change CR0 bits that L1 owns,=0D
e.g. clear TS, and read their effective values instead of the read shadow.=
=0D
=0D
Fixes: eeadf9e7558c ("KVM: nVMX: Handling of CR0 and CR4 modifying instruct=
ions")=0D
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>=0D
---=0D
 arch/x86/kvm/vmx/vmx.c | 15 +++++++++++++++=0D
 1 file changed, 15 insertions(+)=0D
=0D
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c=0D
index b341af4c60..3633496299 100644=0D
--- a/arch/x86/kvm/vmx/vmx.c=0D
+++ b/arch/x86/kvm/vmx/vmx.c=0D
@@ -5748,6 +5748,21 @@ static int handle_cr(struct kvm_vcpu *vcpu)=0D
 	case 3: /* lmsw */=0D
 		val =3D (exit_qualification >> LMSW_SOURCE_DATA_SHIFT) & 0x0f;=0D
 		trace_kvm_cr_write(0, (kvm_read_cr0_bits(vcpu, ~0xful) | val));=0D
+		if (is_guest_mode(vcpu)) {=0D
+			struct vmcs12 *vmcs12 =3D get_vmcs12(vcpu);=0D
+			unsigned long mask =3D vmcs12->cr0_guest_host_mask;=0D
+			unsigned long cr0;=0D
+=0D
+			/*=0D
+			 * LMSW leaves the bits L1 owns unmodified, as does a MOV=0D
+			 * to CR0 that writes their read shadow values.  Emulate=0D
+			 * it as that MOV: L2's view of CR0 with LMSW's bits.=0D
+			 */=0D
+			cr0 =3D (kvm_read_cr0(vcpu) & ~mask) |=0D
+			      (vmcs12->cr0_read_shadow & mask);=0D
+			err =3D handle_set_cr0(vcpu, (cr0 & ~0x0eul) | val);=0D
+			return kvm_complete_insn_gp(vcpu, err);=0D
+		}=0D
 		kvm_lmsw(vcpu, val);=0D
 =0D
 		return kvm_skip_emulated_instruction(vcpu);=0D
-- =0D
2.25.1=0D
=0D
