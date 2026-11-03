Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732372;
	b=f/DKYdhISeSnzrP1Zq8CTPcG8mYjWThL0YF9WKSMyyY2uDyMBF0woqrypwlKCbdbXGgY
	 OuD0WtcArL7yAsyTmNCOWol/LaYkqFAo5SPqEMLHqe/BqI5vi5PiWF12aCp0B1hp2wKss
	 h+GvDOyDBqQ17ECgQwAa2vm1s8yp47IehIBBa5cF9lSV0nU4/Dbck2+DMYboR5TyVoJCV
	 Wron2QHvoJRmulcvLrViASEeXTvuQlGs3QUZOEyEVMWw4HyaHGEBfeuBaevv9v5qiR3sN
	 dQ/MPv5BvMYBfg/Svz2kf8PhPJcg7XIiI+30yFGRLdCnm5pW/wHtvPU7BOyFMh3i+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732372;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9uUHBQoWHu2fwTWcMgZXDotchEuaMSHRKHPGekT9dqE=;
	b=oFkLoVpg/axS7dQsffunKYRWDXE5PYuOQ/WRnrwaP7Wg55hwu4JiMPc3+JJIaCrnvsug
	 jXYdZbyxJ7w1/6ZnvMS2bNcPCy3GjgDexjms5Da9rVjrgU7tksbdMUvz/Dn3f9S6/ASiM
	 Di9OyH2wn3ksYbgMGd9lBlb44gRmvJORYBBFM3IWzvY+/QDqd957VFt76Y9SDfcrJu279
	 C+3GK2UzYGs3pFitdEDtwwbFVcTdZbsj1Q2R7ymgOwNQBbtIJoFIlUMyIVui0fzx0QijG
	 29waVtGEBd5xxT35Smd4nis9gb9I+7VkonvAd80abZ2qidTnNM9sTI8pNYSKLn7uqYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shazbot.org;
	spf=pass smtp.mailfrom=shazbot.org;
	dkim=pass header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=MY30eZ8q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KIASToQz;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5A7606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D5A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=MY30eZ8q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KIASToQz
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 4A9BCEC0650
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 03 Nov 2026 13:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793732370;
	 x=1793818770; bh=9uUHBQoWHu2fwTWcMgZXDotchEuaMSHRKHPGekT9dqE=; b=
	MY30eZ8qvY+Fny7Husj85CkoubyF0L8X/RK3C/ZDaq7wuAc6SAHgClCTE6lWNxaH
	AiTtY20LUyTpyLKIQxQMXp+GXuVxRMCrrjcO9MnqI+znArxe/2nzv8eUbdqHOkOv
	311ZqVV4x1bDwv3aEijzVu3vuM81CmsMYN2vnZZaqGh6RV6X+pwgQt5zqE7F+GpQ
	ChgEbuwAipfplUWSIKwPG/AnD5pHNKofsAGFLzZLk8vn8NdA/+x0uFGQTPki5hHC
	P+82JSN5uq+hpHfK44Wzg9cUtlggVmDWulS3u9oKAbPar6uz6Oh6/mD9O4/vfY/9
	L+K18sqzQ8EOMNWVza3gOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793732370; x=
	1793818770; bh=9uUHBQoWHu2fwTWcMgZXDotchEuaMSHRKHPGekT9dqE=; b=K
	IASToQzVQm2GXnHxqcTEmWsl/1tW7CoX/eIvm9wZPp+A6p2Bh3H/4jhEum2nq/mF
	o9ISg2OaxiLoVtSsbs0ISDDVKIdfFGXr6gwdVT2dELGGMluwFoEKU2X105Mi9wro
	S/2IZHFpgcjWkIa442TFX066nrUpEdqIl9hL+nRzYg7hG0mJ7jSSnfcHjsF2e4MR
	DorCrQh6Fg5SbqiaX3wtTJqPDUBVgujA1Zx2H/xE46XVBzqYECEjlSNwU4q5FfH3
	NmgieHo9Z0Dy1sRhxRlTnXN9YuqcP1vqbvDHd29AXmkdTFsTltcbcY1nkBru4U9o
	9vnvQNFrXwm9U6zFxXXyw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shazbot.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793732370; d=shazbot.org;
	mf=PGFsZXhAc2hhemJvdC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:0IAsBBTGFUDatZMmYQhkOzyxZnLXqgfArdjJGUEJLpF7V9m
	5ZdrJWejbGs8HJTOmOcix0k4b43LGBLkH0WcHBO+L5YMOLw3aNwuQIzTsqmL5lao
	nOa9Cj3l7yE7UisXBinyjz77Rzz51EHPEyTbzblOgY3+eWde2EkoIuwJk4KL43ny
	mKBLJBREAE3k4JNAfLfgCL6j0FKupazI3Kvvm7Fvu5viV42L+ZwoisK3tpXDansV
	ZDa4Z3LZBC6dRaySDPRASo4Fe6cq3KQbuZ4sRiwvS8z0Bz5JY4g92BwLkA3U1l+w
	CgAL7uXXetC5d28ChVmFi82ZRqlkbWXnJhb170A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zDqmUyDhbw4TSHzQfeu/wRUhq1QCWUKLvvNR1Kslhzs=:QM7rQEK6TyYmnGgEPloLheqtEqu1IrzPSIQFwRMIAGU=;
X-ME-Sender: <xms:ES_qaoX4qs6K2UmWra3n9HapAh0eMJqkUrZwSZVe_PunoJEFNy3PaA>
    <xme:ES_qasByFiYaaAg5yT34M5ZC-h9SKObqKnOkfQbUlSAn9fMRuwbKGdotDxPu0Ubm0
    -BbEaQnLaMu-OkETI80QOLpAdBkvn4ywETWbFFSE2_jG2R7lfCbYw>
X-ME-Received: <xmr:ES_qatdg0j9d8XL3plhUiXZgzKVs6YUrD8uI1-4o9xvmaSxVXwMSLcXTdYxUGQ>
X-ME-Proxy-Cause: dmFkZTFbA/NjBu8a6DXhPDuHTwswxz0MafSRuwI+pA5pQJSphE8apiGMPgMFjCLWGC8bEh
    uwY+2Ovrjdo0KXWHO6Q2Y0pVIRHju1PLiJ5LlbWKEoosOrjUHNc79DHSINjQpzUflr1clw
    Ssi1wlgxwYFCsy0kaUEnKIP73NzKGydfeq88YTpVQjW90DSfe9/OKXBhdN2DRYxOZF/x2n
    PR4N+Q3Q/WhI6ctiGEvfMl5ueZJAzs2qPhjfVBIq9kb5skVrkyqAIrYkTXfg3s9KpS1fet
    N2zcc5oIKtfWT+JuYfo9m7GE7Q2+DqsZn+OQP7lj498RZhaXitq/XxojEEN9rpcV7qLLW2
    AJvYLbM4YUIa0KzuEaG12RaU+PQJZC8H5MvkofS5DOUyX51p4Q8OC/fEgEeFvBrE2vRmmW
    5VuiwkB8CSDab/q7cRKoT606TszCRS5oh433xkmhe2c743FRkjBbSFJPmkl9pa+siwUBt+
    oDp5ENYxZPH8JOvQ8p4sNi4W+4n7cKyea20X12NeFJkVDC553KcBYHM6JbUG/Bxnkxl5gh
    p8SR2CPb4T9bv/Rr/GzrrInsr9drweqhhfJtDwLLb8103JwQx1alcz9T/5LXoFsSxpS2OU
    RdGoHfI+TmOAyhaeFqBCnjx7y0NXQqj01npnrNA7oR8bQmGbDcjwl1HkhGaA
X-ME-Proxy: <xmx:ES_qarrYchthmKAfEi2zhJ25CrFTyYZqIHobFe5gy3pvsimCaReVnQ>
    <xmx:ES_qamTT-Fafq4sOVrt5GXFfMkzsv_OWy_ITcHrU40RN6ykUvTX00Q>
    <xmx:ES_qajWpn4TjMdlvvbQxMAMcKJWQ0IHCzRgrMSMqNReiyXSc0iBSmQ>
    <xmx:ES_qaje0h_duwSJEbgvjFlVP5W3ZmwLGgiVZKj1Bsn9M8jJ-2krvhA>
    <xmx:Ei_qakRNiTZATV2bZ2_1b79q6793DugdswgYaupO-YI2zm2WMYabCb6A>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 13:59:28 -0500 (EST)
Date: Tue, 3 Nov 2026 11:59:26 -0700
From: Alex Williamson <alex@shazbot.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, David Matlack <dmatlack@google.com>, Shuah
 Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma
 <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, Matt Evans
 <matt@ozlabs.org>, alex@shazbot.org
Subject: Re: [PATCH v3 2/3] vfio: selftests: Add vfio_pci_find_mem_bar()
 helper
Message-ID: <20261103115926.39e092b8@shazbot.org>
In-Reply-To: <20261102230445.3993629-3-almasrymina@google.com>
References: <20261102230445.3993629-1-almasrymina@google.com>
	<20261102230445.3993629-3-almasrymina@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  2 Nov 2026 23:04:44 +0000
Mina Almasry <almasrymina@google.com> wrote:

> Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
> a BAR) of at least min_size bytes that behaves like ordinary memory and
> can be safely read and written without device-specific side effects.
> 
> Detection is backed by a table of known devices, starting with QEMU's
> pci-testdev (1b36:0005) BAR 2 when configured with membar=<size> and
> membar-backed=on.

Should we test for this?

We could toggle memory decode around writing a short, unique pattern
with read-back verification.  This might be unnecessary for a physical
device, but per the definition of this function it should also be
harmless.  For the pci-testdev, which is our only match in this
proposal, it validates the BAR is backed by real memory and not handled
as an unimplemented memory range.

For the use case in patch 3/ it doesn't matter, but for future use
cases I'd rather see that we generate a skip or failure based on the
test here rather than debug failures in the test case consumers.
Thanks,

Alex
 
> Suggested-by: David Matlack <dmatlack@google.com>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Matt Evans <matt@ozlabs.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  .../lib/include/libvfio/vfio_pci_device.h     | 10 +++
>  .../selftests/vfio/lib/vfio_pci_device.c      | 67 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index 007adc322c1e..19d458adba1a 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -15,6 +15,13 @@ struct vfio_pci_bar {
>  	void *vaddr;
>  };
>  
> +struct vfio_pci_mem_bar {
> +	struct vfio_pci_bar *bar;
> +	void *vaddr;
> +	u64 offset;
> +	u64 size;
> +};
> +
>  struct vfio_pci_device {
>  	const char *bdf;
>  	int fd;
> @@ -162,6 +169,9 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
>  		(device_id == vfio_pci_config_readw(device, PCI_DEVICE_ID));
>  }
>  
> +bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
> +			   struct vfio_pci_mem_bar *mem_bar);
> +
>  const char *vfio_pci_get_cdev_path(const char *bdf);
>  
>  void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index 4063a0e2b3df..d5308fe61490 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -19,6 +19,7 @@
>  #include <linux/log2.h>
>  #include <linux/mman.h>
>  #include <linux/overflow.h>
> +#include <linux/pci_ids.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  #include <linux/vfio.h>
> @@ -245,6 +246,72 @@ static void vfio_pci_bar_unmap_all(struct vfio_pci_device *device)
>  	}
>  }
>  
> +#define PCI_DEVICE_ID_REDHAT_TEST	0x0005
> +
> +struct vfio_pci_mem_bar_desc {
> +	u16 vendor_id;
> +	u16 device_id;
> +	u8 bar_index;
> +	u64 offset;
> +	u64 size;
> +};
> +
> +static const struct vfio_pci_mem_bar_desc mem_bar_descs[] = {
> +	/* QEMU pci-testdev with membar=<size>,membar-backed=on */
> +	{
> +		.vendor_id = PCI_VENDOR_ID_REDHAT,
> +		.device_id = PCI_DEVICE_ID_REDHAT_TEST,
> +		.bar_index = 2,
> +	},
> +};
> +
> +bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
> +			   struct vfio_pci_mem_bar *mem_bar)
> +{
> +	const u32 rw_mmap_flags = VFIO_REGION_INFO_FLAG_MMAP |
> +				  VFIO_REGION_INFO_FLAG_READ |
> +				  VFIO_REGION_INFO_FLAG_WRITE;
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mem_bar_descs); i++) {
> +		const struct vfio_pci_mem_bar_desc *desc = &mem_bar_descs[i];
> +		struct vfio_pci_bar *bar;
> +		u64 size;
> +
> +		if (!vfio_pci_device_match(device, desc->vendor_id,
> +					   desc->device_id))
> +			continue;
> +
> +		VFIO_ASSERT_LT(desc->bar_index, PCI_STD_NUM_BARS);
> +		bar = &device->bars[desc->bar_index];
> +
> +		if ((bar->info.flags & rw_mmap_flags) != rw_mmap_flags)
> +			continue;
> +
> +		VFIO_ASSERT_NOT_NULL(bar->vaddr);
> +
> +		if (bar->info.size <= desc->offset)
> +			continue;
> +
> +		size = bar->info.size - desc->offset;
> +		if (desc->size)
> +			size = min(size, desc->size);
> +
> +		if (size < min_size)
> +			continue;
> +
> +		*mem_bar = (struct vfio_pci_mem_bar){
> +			.bar = bar,
> +			.vaddr = bar->vaddr + desc->offset,
> +			.offset = desc->offset,
> +			.size = size,
> +		};
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
>  			    size_t config, size_t size, void *data)
>  {

