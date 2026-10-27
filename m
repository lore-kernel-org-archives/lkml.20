Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123425;
	b=EO1l3TrA+lPFSRnAzeH6Bih4Z+j4Zi4GHy2drJ8NPfhy5H8lhmZkOUOHe2my7nZ6II3b
	 y0SXA6uFIfUTxkVfv0SMe3yQIsCXzVOpsAlGVRRcUUYGmqrIWsqLEj9ILEH4yfVETSKEA
	 s8n33N64wyYxxtmgpS2QOc/qyvc2VDAJ4eAmx41D5jxE4uSkM8Bu6BzSU239G1Kx/1SdK
	 axA/bsOoQjAVQLIF3Q0saKMu/1Y1T7p+ompG0osC/WeqQqxuXTIesMt1fXYDEh1P7pNoq
	 ZYXlgNcXAOr7lsuZhVi3dJp5LkgzzTsZnDE33jqnwqrSxFGw3zk263852fIwiTP+cWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=u2t+BU6YM38qKUNb8LxM2rrX+fVNC6kao+NGos+aKQI=;
	b=CZq/2zzEOm0/BhSHUMAq0iWa1d8koHqyVPheVploEcMz+GB5/uW34uYl8Wrn9RIj3/u4
	 EBlJX7xIjiOGj0ySgiBmRUxTcQxmoBMf2MXj6z1OeAPEmQ6z+W373x/n1EQYZXWa+NcrB
	 LrF94ccETaNMVBdm1W89g+7U8QS0azXl3gPrWwDHB5PyPACOUK7rGmWcYEYPNKRxEJzGj
	 b8f60/mX1blu+U2FSJ7ZwbWfDQZpq+yAHe0dSe78wfuqwZiXibEhFXxc1vw4QXbkjLhEE
	 s3oTL5xzuSaOYkztpScx1qhI7SCApsRgPhXLKc9c0IeK0fj7gYO1RpwQbRyiqqs9V2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fm7CQuyg;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292A7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fm7CQuyg
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08903566dso934239b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793123424; x=1793728224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2t+BU6YM38qKUNb8LxM2rrX+fVNC6kao+NGos+aKQI=;
        b=fm7CQuyghppiS7nbiNxZWu4F8SHltKLvRa8uVkeZlo6ObkQaSp/St1X2tIOv9PHw+g
         NBfCHqvpIRIEFLjrlhjT+jINZbABPyxZGsVETn5DXVUsRU4feoYPe+iExs6Ebl8BvkP9
         SoNtIrXTABIWfj7Sd5rlh5KJ8edW6oLtOwFmQ8hiKULFrx6IoSafQoxtt5fl3r4r0GXX
         xxWteNGe9V0mxecAKUVGsn5gMRyzuQxj8rkpd97LDJ1X9KTAgT0KBLg/6WSNuHV+TpWI
         VCrgaKBOX/2Mipcw96RB0ZDlfIieytTc8LaUDeh5/bvmBKxZu1LGjJ1Khoc9GdnOlL7B
         R4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123424; x=1793728224;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2t+BU6YM38qKUNb8LxM2rrX+fVNC6kao+NGos+aKQI=;
        b=iiNgfT1tGr8PKINaGhjC9fW7Q/91KeGXb9xpjX33TnrlFMHSBQjGmzg0KWVVFnG8Nw
         IkTLhwsC4Zb2BhZF5d0G6euSBtJg1Xmqu8erD/BhKsSBliKl9JfOXShTVIZbmvcd0puC
         qd36vyAWrzuXsupQC/vY1ykyavvMMAgVMttaFMJ+9sNJ3SaVb/TEvJENOvPFQCeVt2VJ
         2ZiEDuF9YkkObIZSSJ7q91FKFY0lNE6w4trK18u5/9VeSRB9Gh720VtU3uCQAMsdVUxs
         AFz7oSy+92GiKOJG/F5jidIrK5+kqVbwInXhm8i0zjqWHoQ3vOJGnsQUd/c6u7w/IQJ+
         hxJQ==
X-Forwarded-Encrypted: i=1; AKwUvByJWi+WA2MX08tKdcMsIYyMQOlY8OiAwqeHzLrHWlpH5YO2ulMe4uCH+F4clowW5KPr+h12NmTXMDWFkyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzhDeZEiqyYYyGu5ezbRkSnxiW023IcByIj0tFP0IuE2A7khL0
	j9NVoCZZkaxtEzs+7KYA2TFQjOX68sUdK2IRmTQ4J9qJgJhaIZJ2NhHsj/PVvcQwfOMJC51KweD
	VWnWaOg==
X-Received: from pgca11-n1.prod.google.com ([2002:a05:6a02:638b:10b0:cd8:c70b:ae89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9190:b0:3e1:37c9:5ca2
 with SMTP id adf61e73a8af0-3e8ead1c6eemr2057958637.19.1793123424278; Tue, 27
 Oct 2026 10:50:24 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:50:23 -0700
In-Reply-To: <CAO9r8zO8ViSqCBer4rV5qBQGcDKA_60Aj_KEVQx2obd9zU7-Hg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-27-yosry@kernel.org>
 <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
 <atqRyeqSXViiNIk6@google.com> <CAO9r8zMqiW=3t7zRo_WAhKJfpYsDwuG3e=nK14GXhrq+foYnOw@mail.gmail.com>
 <at-O8-tzgezj2du-@google.com> <CAO9r8zO8ViSqCBer4rV5qBQGcDKA_60Aj_KEVQx2obd9zU7-Hg@mail.gmail.com>
Message-ID: <auDkX94UTjrLNmqp@google.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026, Yosry Ahmed wrote:
> On Mon, Oct 26, 2026 at 10:33=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Oct 22, 2026, Yosry Ahmed wrote:
> > > On Thu, Oct 22, 2026 at 3:44=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > >
> > > > On Fri, Oct 16, 2026, Jim Mattson wrote:
> > > > > On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@kernel=
.org> wrote:
> > > > > Moreover, does this change the semantics of PV TLB flush? In
> > > > > record_steal_time(), we have:
> > > > >
> > > > > if (st_preempted & KVM_VCPU_FLUSH_TLB)
> > > > >         kvm_vcpu_flush_tlb_guest(vcpu);
> > > > >
> > > > > IIUC, an idle vCPU that wakes into L2 will flush only L2's ASID. =
In
> > > > > the past, with a shared ASID, L1's ASID was always flushed on emu=
lated
> > > > > VM-exit anyway. Now, L1's ASID will be unaffected. Though I can't=
 find
> > > > > any real documentation on PV TLB flush, it *seems* like the remot=
e
> > > > > vCPU would want L1's ASID to be flushed. OTOH, this change makes =
nSVM
> > > > > behave just like nVMX.
> > > >
> > > > That's a bug that absolutely needs to be fixed, probably relatively=
 urgently.  We
> > > > should also document that passing through the steal_time shared inf=
ormation to L2
> > > > to utilize PV TLB flushes for L2 is explicitly not supported.
> > > >
> > > > I hate to re-introduce deferred actions for L2 =3D> L1 things, but =
that seems like
> > > > the only sane way to handle this, because handling the !tdp_enabled=
 case, where
> > > > KVM needs to sync the current root, requires knowing what MMU is go=
ing to be in
> > > > use when L1 regains control.  Yuck.
> > >
> > > Are you implying that *you* will be re-introducing deferred actions? =
:P
> >
> > Heh, probably not this calendar year.
>=20
> Are you opposed to this series landing before that is fixed, keeping
> in mind that it will expose nSVM to the pre-existing bug?

Nah, though I should just fix the damn bug.  It's not hard, I just don't wa=
nt to
do it because I don't want to reintroduce a deferred request.  Untested, bu=
t I
think this is all that's needed.

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_hos=
t.h
index 0378577d9d8b..696aae38f619 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -879,6 +879,7 @@ struct kvm_vcpu_arch {
=20
 	struct {
 		u8 preempted;
+		bool flush_tlb_pending;
 		u64 msr_val;
 		u64 last_steal;
 		struct gfn_to_hva_cache cache;
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 97c17b120a57..efa54f9f9e9a 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -469,6 +469,11 @@ static inline void leave_guest_mode(struct kvm_vcpu *v=
cpu)
 		kvm_make_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu);
 	}
=20
+	if (vcpu->arch.st.flush_tlb_pending) {
+		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
+		vcpu->arch.st.flush_tlb_pending =3D false;
+	}
+
 	vcpu->stat.guest_mode =3D 0;
 }
=20
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..15eb033b8e17 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2117,8 +2117,12 @@ static void record_steal_time(struct kvm_vcpu *vcpu)
=20
 		trace_kvm_pv_tlb_flush(vcpu->vcpu_id,
 				       st_preempted & KVM_VCPU_FLUSH_TLB);
-		if (st_preempted & KVM_VCPU_FLUSH_TLB)
-			kvm_vcpu_flush_tlb_guest(vcpu);
+		if (st_preempted & KVM_VCPU_FLUSH_TLB) {
+			if (!is_guest_mode(vcpu))
+				kvm_vcpu_flush_tlb_guest(vcpu);
+			else
+				vcpu->arch.st.flush_tlb_pending =3D true;
+		}
=20
 		if (!user_access_begin(st, sizeof(*st)))
 			goto dirty;
