Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF3747D95C;
	Fri,  2 Oct 2026 23:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982199; cv=none; b=Es3XjxYmt6uP09vckvz5loWIS8V9LBmwpdPwG/8Kn9HHygrZuM2aeyxYCSjycFd+msMjyeo1DFk22ca5659AsPkpppCAlc4QXAA8wt7ewJMxPq2FIo6UByPrgdE5QKRpWzqQZd9WDG9k3IoQL4/+LPaweQycekpD2+gpnYimSRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982199; c=relaxed/simple;
	bh=+zhJ5n2rQXVJZpnp51czddJ0mgFHdvH5jxSNiAxmzyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X54fcqQjrCqPW3cwb0NBQc1VCAs77xId+oJSFMt+kCYU4QKKyAkNaHMLsNedb2wpUD7bk705tZSD4ICgTr6Gruh5yeHTDMgXilrt5YJyi+5Pa6s7rPagh7w6jHkC6dzPzvfxZWEpq8AEK9p+Gf0Pmrph2BQkSMPQV1wFSYvtUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUKFWLFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUKFWLFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171891F000FF;
	Fri,  2 Oct 2026 23:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790982196;
	bh=LMv/HjtW/85pT4bAEcJzZ6kcFDGpcguHiAZY9Y4BPUs=;
	h=Date:From:To:Cc:Subject;
	b=XUKFWLFB2Ohak/4ODzY1yrLiNj3lVV7mJ/dWr+j3pW5KQ7a3sI26rcVxcMP80Ysge
	 2gSwdVVW6JHVFlvp+MmjwHy2XC8J0UsychY64QZXLSub0rMae00f4apd9bLu22+ibb
	 TrxVIJIDO+H15eyVAVzyDCgwRrM+WdniqzyCibnSIX5OCY/ZiWccUn/QKki/OCRPLn
	 KHmzBsEq2QxVKdX44I/P9hGpQENlHt6Sj7EwJ1xbwLSkyURvozIth6ooGT9SrzlvSX
	 KnyGAToyXNOpjC3LrGcLxycChWUuiSqnuZvgWzqoFopb8oY4AiXknzrm/CRzr/blcT
	 /xKAeVFJag/xQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id ECA491AC57CE; Sat, 03 Oct 2026 00:03:13 +0100 (BST)
Date: Sat, 3 Oct 2026 01:03:13 +0200
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the origin tree
Message-ID: <asA4MWPrTXX4Pd-i@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALJyjvfBoNYxYLhw"
Content-Disposition: inline


--ALJyjvfBoNYxYLhw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/hyp/nvhe/hyp-main.c

between commit:

  04447b95c62be ("KVM: arm64: Use the host's HCR_EL2 for non-protected VMs =
in pKVM")

=66rom the origin tree and commits:

  872383bd12e11 ("KVM: arm64: Add per-EC entry/exit state marshalling for p=
rotected guests")
  06499de8f998e ("KVM: arm64: Skip fixed-feature state flush for protected =
vCPUs")

=66rom the kvm-arm tree.  I am very unconvinced about the merge below.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ac64a036b0a95,c709a6ff7448b..0000000000000
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@@ -216,7 -693,8 +693,9 @@@ static void sync_debug_state(struct pkv
  static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
  {
  	struct kvm_vcpu *host_vcpu =3D hyp_vcpu->host_vcpu;
 +	u64 host_hcr_mask =3D PKVM_HCR_EL2_HOST_PVM;
+ 	hyp_entry_exit_handler_fn ec_handler;
+ 	u8 esr_ec;
 =20
  	fpsimd_sve_flush();
  	flush_debug_state(hyp_vcpu);
@@@ -229,35 -707,60 +708,64 @@@
  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
  		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
  			flush_hyp_vcpu_state(hyp_vcpu);
 +		host_hcr_mask =3D PKVM_HCR_EL2_HOST_NPVM;
 +	} else {
 +		hyp_vcpu->vcpu.arch.ctxt =3D host_vcpu->arch.ctxt;
+=20
+ 		hyp_vcpu->vcpu.arch.hcr_el2 &=3D ~(HCR_TWI | HCR_TWE);
+ 		hyp_vcpu->vcpu.arch.hcr_el2 |=3D READ_ONCE(host_vcpu->arch.hcr_el2) &
+ 							 (HCR_TWI | HCR_TWE);
+=20
+ 		hyp_vcpu->vcpu.arch.mdcr_el2 =3D host_vcpu->arch.mdcr_el2;
+ 		hyp_vcpu->vcpu.arch.iflags =3D host_vcpu->arch.iflags;
  	}
 =20
  	/* __hyp_running_vcpu must be NULL in a guest context. */
  	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu =3D NULL;
 =20
- 	hyp_vcpu->vcpu.arch.mdcr_el2	=3D host_vcpu->arch.mdcr_el2;
  	/*
- 	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
- 	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
- 	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
+ 	 * A host-injected vSError is masked by the guest's own PSTATE.A, so it
+ 	 * applies to protected guests too.
  	 */
 -	hyp_vcpu->vcpu.arch.hcr_el2 &=3D ~HCR_VSE;
 -	hyp_vcpu->vcpu.arch.hcr_el2 |=3D READ_ONCE(host_vcpu->arch.hcr_el2) & HC=
R_VSE;
 -	hyp_vcpu->vcpu.arch.vsesr_el2 =3D host_vcpu->arch.vsesr_el2;
 +	hyp_vcpu->vcpu.arch.hcr_el2 &=3D ~host_hcr_mask;
 +	hyp_vcpu->vcpu.arch.hcr_el2 |=3D READ_ONCE(host_vcpu->arch.hcr_el2) & ho=
st_hcr_mask;
 +
- 	hyp_vcpu->vcpu.arch.iflags	=3D host_vcpu->arch.iflags;
-=20
 +	hyp_vcpu->vcpu.arch.vsesr_el2	=3D host_vcpu->arch.vsesr_el2;
 =20
  	flush_hyp_vgic_state(hyp_vcpu);
+ 	flush_hyp_timer_state(hyp_vcpu);
 =20
  	hyp_vcpu->vcpu.arch.pid =3D host_vcpu->arch.pid;
+=20
+ 	switch (ARM_EXCEPTION_CODE(hyp_vcpu->exit_code)) {
+ 	case ARM_EXCEPTION_IRQ:
+ 	case ARM_EXCEPTION_EL1_SERROR:
+ 	case ARM_EXCEPTION_IL:
+ 		break;
+ 	case ARM_EXCEPTION_TRAP:
+ 		/* Nothing was marshalled for this trap, see sync_hyp_vcpu(). */
+ 		if (ARM_SERROR_PENDING(hyp_vcpu->exit_code))
+ 			break;
+=20
+ 		if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
+ 			esr_ec =3D ESR_ELx_EC(kvm_vcpu_get_esr(&hyp_vcpu->vcpu));
+ 			ec_handler =3D entry_hyp_pvm_handlers[esr_ec];
+ 			if (ec_handler)
+ 				ec_handler(hyp_vcpu);
+ 		}
+ 		break;
+ 	default:
+ 		BUG();
+ 	}
+=20
+ 	hyp_vcpu->exit_code =3D 0;
  }
 =20
- static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
+ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
  {
  	struct kvm_vcpu *host_vcpu =3D hyp_vcpu->host_vcpu;
+ 	hyp_entry_exit_handler_fn ec_handler;
+ 	u8 esr_ec;
 =20
  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
  	sync_debug_state(hyp_vcpu);

--ALJyjvfBoNYxYLhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasA4MQAKCRAv73Ows9A4
iZZDAP9uRmnTjPYS/46Ix4X08Lw5JNi3fpKFrsk0zYbKq6sb2QD/aw6ps9HYqWBp
iz8caPba1xbzkeXwVXzK1CA8vKvVtgs=
=jcWk
-----END PGP SIGNATURE-----

--ALJyjvfBoNYxYLhw--
