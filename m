Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258521;
	b=JJwLKxu5ZEcnnQCC+0uq/8TF7mrYfn+iIYs4mfPusuX/46OdEjg0KYbPt87TSKF3z8VF
	 723mMzWvfzQhXxV2gZ7o//VlKCZDL0D/NFPxn7uk5A8PI3sRv0rBMU0LjSkonvypVu69e
	 BTeO9Xp9qfWvX8lZJ0sxLRkfOTRqvUSWZ4G6d9kZ+fERP3YIlZNGyQ/+Dvy9X43via7Ji
	 EHBWpK63wc8Phbv9ffEhQYLovJnhBSHE7XmMd6PeGR/teHr3yNuCleQwC9s/Q78AF9U08
	 qG64jwnFBlT4o3YvltNgs6CtbuSw/xCEbq4slgLXIEeYfOP/vk2QmBW7BBCQa88jH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wumk5mwNJr5KP1IwkSlRViD8R1WfLH7S/49T7W8Gkq4=;
	b=PDzb0hNphpQteLVp2FJEs6dhZ+suJ3VZForaE3ZM31uwKtsAuu3vrun8Fo9bJpTy/p5U
	 sc2lyWblV8qRFRbMMAWyyiV5/XFmUU88Yr1JqF6GO183Xt9n7+y+8Rzz9HrpM3YtaIB+q
	 A8ys+fmmY1zkFRSlmj9RNI2hmnDljxJ4alGD4BGo2cfs4AjU7Sv40RPaIpDvwGKuz4ar6
	 6/bZt+iMgkl1gkhwkiIJvADXXBZUkfaLm+tfcrwKjFVEi4zaMMxUeIxcmM4zClMp01pe+
	 xaIyvE1eW1I9rVdlg/7s6j2IpwbeWz0/iM35z16mokBtl9FNhm+0bb8xI4GKTD3/hXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0S7vdPC;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE060A2630
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73CE060A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0S7vdPC
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so865903b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258520; x=1794863320; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wumk5mwNJr5KP1IwkSlRViD8R1WfLH7S/49T7W8Gkq4=;
        b=F0S7vdPCEh3zpkLxuDnPH8w//ucHuqYZ/WaHYBv6bPnaCS0uKvyrKWkw5cKuA4xe0C
         s9YLhasEEbTTDLR9M/etmHLjWMJYz7W021UjCPs4fiREjkAPE+rSn3HLQIEAaY9GwI40
         If6UniZSi8Js/SjUCRJtrFGW5ihoCkWMyMlC4Bed8S1gCSciWgrIDsDTmsEmGYvG7t0s
         Pfht/uc8WDB0h12ENY97ex+bkopjkOzbUGGTMrMEhZWfNnMTLCbxySO7jOTQUiJyNP6B
         eIeSf/9yKQON4cdc/V1T4dd2PYNZG9mJloF+B9KTzbkKfhWqKHOrGAQsVklcA5oKUbI4
         S15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258520; x=1794863320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wumk5mwNJr5KP1IwkSlRViD8R1WfLH7S/49T7W8Gkq4=;
        b=KEp03BquvTulPW8KxA/8WhmGUj+FROCMN/KUDSk6fVexeguGRG4M4PG4H5CmdEYheD
         UO++EepQNKaIalD//WtfgTaepkPw/sZKaQUibEu72m5EBs5MM2nxLwQWPJeUpf/Dkm76
         OAir7hTxk47PAfpkdKdOguOwQ0Bn5TeYC+aGHPpd0TawocNleOsEH2Q7WrUKscYzSmcu
         MOeMJEbzmcywt1xto5LwTQ5v4PDer7tl7394aL4O5VS/HvG1opYGQZJLnBN1M7bdStG6
         eWIZMaAEgVddREas08uRKhXp4bFey158XxgUKIiPsO+xPkD4V5gpoqKo9sVtNtxfcxRr
         IArA==
X-Forwarded-Encrypted: i=1; AL+hErGJZFFYS8EGrHQJAFEwFbqlK/L0fDd9X+XGJ+WDq6HfPyGgNDFLdg6YP7rU157dVgzWeorSPOMFX3EBZV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sjqhuCso63Ny7WkOjZkn8RtvEsIledC3QbJwbvtFs+imMEuIe
	uklAPR8PeAGuCmuxy+2TPOuNrspGlloGSFA5koSwMrywk0IxOecKClZ4xnvp2NL8FZX0DcWT1yf
	aTZYQAh+COpDZ9w==
X-Received: from ilqu16.prod.google.com ([2002:a92:ccd0:0:b0:53c:3409:afff])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5094:b0:4d6:90f3:74b2 with SMTP id 5614622812f47-5683cb012b7mr675827b6e.50.1794258520143;
 Mon, 09 Nov 2026 13:08:40 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:32 +0000
In-Reply-To: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109210833.1250548-5-dmatlack@google.com>
Subject: [PATCH v3 4/5] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in irq_test
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use the VFIO selftests library to pick the IOMMU mode in irq_test and
drop probe_iommu_type(). Pass NULL to iommu_init() when the user does
not specify a mode with -t, and skip the test if the requested mode is
not available, or if no mode is available at all.

probe_iommu_type() picks iommufd whenever /dev/iommu can be opened, even
if VFIO device cdevs are not available (CONFIG_VFIO_DEVICE_CDEV=n), in
which case the test fails rather than using the VFIO container. The VFIO
selftests library accounts for this when picking a mode, so there is no
need for irq_test to probe for a mode itself.

Note, this changes irq_test's default container mode from
vfio_type1_iommu to vfio_type1v2_iommu, which the VFIO selftests library
prefers. This only matters when iommufd is not available.

Opportunistically rename iommu_type to iommu_mode to match the
terminology used by the VFIO selftests library.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 791e576c334c..0d6ca1a052c4 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -148,22 +148,6 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
 	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing);
 }
 
-static const char *probe_iommu_type(void)
-{
-	int io_fd;
-
-	io_fd = open("/dev/iommu", O_RDONLY);
-	if (io_fd >= 0) {
-		close(io_fd);
-		return MODE_IOMMUFD;
-	}
-
-	io_fd = __open_path_or_exit("/dev/vfio/vfio", O_RDONLY,
-				    "Is VFIO (or IOMMUFD) loaded and enabled?");
-	close(io_fd);
-	return MODE_VFIO_TYPE1_IOMMU;
-}
-
 static void help(const char *name)
 {
 	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
@@ -205,7 +189,7 @@ int main(int argc, char **argv)
 	int nr_irqs = 1000, nr_vcpus = 1;
 	bool set_empty_routing = false;
 	const char *device_bdf = NULL;
-	const char *iommu_type = NULL;
+	const char *iommu_mode = NULL;
 	int i, j, c, msix, eventfd;
 	bool migrate_vcpus = false;
 	cpu_set_t available_cpus;
@@ -235,7 +219,7 @@ int main(int argc, char **argv)
 			use_nmi = true;
 			break;
 		case 't':
-			iommu_type = optarg;
+			iommu_mode = optarg;
 			break;
 		case 'v':
 			nr_vcpus = atoi_positive("Number of vCPUS", optarg);
@@ -266,9 +250,9 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		if (!iommu_type)
-			iommu_type = probe_iommu_type();
-		iommu = iommu_init(iommu_type);
+		__TEST_REQUIRE(iommu_mode_is_available(iommu_mode), "%s",
+			       iommu_mode_unavailable_msg(iommu_mode));
+		iommu = iommu_init(iommu_mode);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);
 		irq = vfio_msix_to_host_irq(device_bdf, msix);
-- 
2.56.0.506.g506a7eabc5-goog

