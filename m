Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428382;
	b=IwJiAuBkwLYyXhlUelG7QXF9kqAu3GQU7vAPLlxwvW9Bp3B88FiBVJFErhU0qhzGHP7X
	 bFJiomILipO/RNf8qn8VxlLZjhmhGf0B202L3Wv1YblxO1kuSnB3WQoWBC7X2KpUI9iee
	 tjQ5PgnzpjhZWSMPgeVUJF378BzI+aP7LlSW0hT2YYcUYB0bs9BHnDvtnGp5tsVU8GIDA
	 webky5bbyT8EVTwbaK1biJslPT0y/A6n/EHiwqz0IQiy6gcusQPijjsSc4EMZBBSKKce9
	 loyWi98/ix5SkYtfmvuFimJcZJUxUjYlsBWBtW1FcEDYunUgvPXSNW8jDw/R7VLmhWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428382;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Ott1dM7VdaK9PpdeTDrYGlrvyU2cB6X2X/fYD8MccmQ=;
	b=IT/btT+tNi6RXduUECHbtnVoTo5nPd9o9XBzgxp0LBN6w5252nHUJNe2W17X2QhCpQF3
	 ZlUKMduGNWw0Fb999DKAHXiFmT7EWzxDoJPgOjCgbRz2i5+3OFci93Zu1QsmFX3d2eEgQ
	 s1nWfbCOeuvMWvl5Fq1e+LBZakBcUO66+v9Xgtttx//4RIB34o7NQ8Fw9rLcE8Bu4DKJY
	 sn1OUqzhBIcl/FSJ8reBl8PUlWEgZbYH04UVi+1o1+qsBFlGEqHdkdQvGCVTgjB/d1ZeW
	 Jq9E+YbBOcARJdXfI4mYOxMORmVAc3q5Bz2hvv5ht1e8+ChCa1eX+VIowHjO6HEwalA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+hcNmaJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CF606A326;
	Mon, 19 Oct 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+hcNmaJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289381F000C6;
	Mon, 19 Oct 2026 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428381;
	bh=Ott1dM7VdaK9PpdeTDrYGlrvyU2cB6X2X/fYD8MccmQ=;
	h=Date:From:To:Cc:Subject;
	b=n+hcNmaJ4/P+AvSQVcKPCojzVCwy3mM5Td5qj1ynPyL9JHLxZ4Ne5VUGoxkn5sOzt
	 YlkogA4RGbSo8U76pcLhmou2Xcbn8QGcJCV04Cr639QtUDvSICKyKi2A1ueViGch/f
	 k8YoKWXqumsJKP20XkvmIherVRmXHBXK1mYbgyZKipG8brlTgSrqT7HHoEi7yojdak
	 ZmejNTLa4DeXlslCUoiSVL3WQflYaM2dNlZewYbH/903+rh+pqTzoP4BeHUMNtkG1Z
	 0nkYwoKVsAnA4WHI0S1qzz+8ZvfNViuCfL0/ApSQopvKEnFjXcPT8oVEnP4NmO0Skk
	 Ye8cOAHvk7Fvw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 19B111AC57D0; Mon, 19 Oct 2026 17:46:19 +0100 (BST)
Date: Mon, 19 Oct 2026 17:46:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm-arm-fixes
 tree
Message-ID: <atZJW7bMdSGZtwoQ@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uz0hAbouyhfhWe/6"
Content-Disposition: inline


--Uz0hAbouyhfhWe/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/kvm_asm.h

between commits:

  ecb6b43cd2224 ("KVM: arm64: Reject the GICv5 CPU interface hypercalls und=
er pKVM")
  8c6599d4e4893 ("KVM: arm64: Reject the stage-2 flush hypercalls under pKV=
M")

=66rom the kvm-arm-fixes tree and commit:

  421c18edc7f3a ("Merge branch kvm-arm64/pkvm-tracing-7.4 into kvmarm-maste=
r/next")

=66rom the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/arm64/include/asm/kvm_asm.h
index abda476e023de,7d799cd05dcd0..0000000000000
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@@ -63,17 -63,6 +63,17 @@@ enum __kvm_host_smccc_func=20
  	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
  	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
  	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_selftest,
 +	__KVM_HOST_SMCCC_FUNC___vgic_v5_make_resident,
 +	__KVM_HOST_SMCCC_FUNC___vgic_v5_make_non_resident,
 +	__KVM_HOST_SMCCC_FUNC___vgic_v5_vdpend,
 +	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 +	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
 +	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
 +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
 +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
 +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
 +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
 +	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 =20
  	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
 =20
@@@ -82,6 -71,12 +82,6 @@@
  	/* Hypercalls that are always available and common to [nh]VHE/pKVM. */
  	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
  	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 -	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
 -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
 -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
 -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
 -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
 -	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
  	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
  	__KVM_HOST_SMCCC_FUNC___tracing_load,
  	__KVM_HOST_SMCCC_FUNC___tracing_unload,
@@@ -93,6 -88,11 +93,6 @@@
  	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
  	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
  	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 -	__KVM_HOST_SMCCC_FUNC___vgic_v5_make_resident,
 -	__KVM_HOST_SMCCC_FUNC___vgic_v5_make_non_resident,
 -	__KVM_HOST_SMCCC_FUNC___vgic_v5_vdpend,
 -	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 -	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
  	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
  	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
  	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,

--Uz0hAbouyhfhWe/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZJWgAKCRAv73Ows9A4
iY/OAP0ZSX2Mlukl1jyX47bXSLC/KunmgtAY52ILAF1vN4AI3AD+L1lTVRjfgpIC
mhQ/z0fcLCo3JNQ4W+5vIo1U2AF2PAA=
=y24i
-----END PGP SIGNATURE-----

--Uz0hAbouyhfhWe/6--
