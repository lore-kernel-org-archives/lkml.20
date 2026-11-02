Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632166;
	b=Cvfzkxl7yDe7XcDSks2WGsBolKVbntFAZunAjr9OCSDpo/IMQHLwSzrvoJMD6LmTBYx1
	 MCs22MCN+qqHDd5hpf7GqRJZ0j37AG/DJQIab1xI0gv4Jeaq73Ye1Ghor4nji7m0MioP6
	 piPMI4HvBz4M95sZn90lf3o8x0LUhKF/8pwIAKWn9I9+GlaCLpIfOhX9Q0QnUm6pH7xZc
	 oGE1wTXXnJIsYjcT+MeLrTLCHua0xW5Oue67+kfODIckOVCOVQbT8hvliZ5ejkd2MNOGK
	 Od7Ged69JrEXrXMAje9iAcBkdRiHOlmdroT1idJiObyW4xMYtNrwLQxswGRWt2b5+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o4IgxgpOO75bp0sEBS0oXx8YKo2RRQODNqfIXlf0zNM=;
	b=sH/FFrE45uVDhGNRkFsoscjZDmjm3PaPn28ui8u4N74/y+Wgl9bVPtglpgTuWtUmbCox
	 CNanBNXnV99oo7zq6ADdFwwbjFI4mrfCvZbN1HcedXaCcAnysqRszWLGAGJcOTsIgaHGq
	 TU3ImkmLQEcZaActN/kYKDoyGrpC6bIZ6kqXiNlVobZvq/ctWHxmeZ1EeUAVYareSP2ea
	 eVfc1h+yVXcGmsAkAzZXF+sYB3SOJOByngYjy8g0QR9jb9quvFElK414y6ORZlwSJYnqs
	 7yt0jwrI2GeKvPK+eAdT6nEo9w14VVg1g22qLl3Q6BCTg3sS/M8+H70/2WiJit0Sj5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G1VbHq7o;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B8606B901
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892B8606B901
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G1VbHq7o
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3383428a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793632166; x=1794236966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4IgxgpOO75bp0sEBS0oXx8YKo2RRQODNqfIXlf0zNM=;
        b=G1VbHq7onzFVI6iV/KeCFXFFlbyvkiA9SY36CdPNhjdYsXmPoObJ+5LxmnTp4hgxMY
         1egvPRwlAtbp0AaJRJm3vDmTV5XfmZYol5ccc41eIXolKOcxY3sXrAukXUWRHfxt8qbw
         WhqrERk1nhrNwXAHLCdyeEhq4Bur9TqnZbLlHueqb7T6c/Q7EWSAskY5OajDQKmVaJ4X
         L6SemLcogIWnhDK+i3lu3lLUJztWu8l2Hn8kCspLVRHLBvQvMipAZL5WQz1pR3rUFt5c
         Th5QoQLcVzdByR8A2aDtl2XsNn/SQjhdze3wIXTSI9fk2fqTwyaNqNP3JAcb++fOF67T
         uL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632166; x=1794236966;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4IgxgpOO75bp0sEBS0oXx8YKo2RRQODNqfIXlf0zNM=;
        b=b1zyrhxNbxkQcKpDyLgPf/aNan7jI2VM2cFTwmKfreIgU5lWrpFhwbrdGyDTQ+LyCN
         zF6RNopJLXEPbFZgGkvIvIXIEAFyqutEwil+v3V+0Dm7QZjZj5sgIKWwuVa7eAoL6Y4e
         kbsVGsJAVk6cZcn2WDiC1bZYNLbd5DsqYSvRKw/LLbyYR2rFVHNmmiu1Hr2hO4iLKpXE
         nJVACBubNR8cnay/k4fkxbu/Bkc5KvyOb/8/hQWEfiYpToo5vMtNbrvSbnXJ57ys0STx
         NFXbtSngEYTemheX/zBr9sdrLpVXOIvWXfvfnlaL3PqN0943mhTNHWDK2RiyLVUn0LW0
         uAUg==
X-Forwarded-Encrypted: i=1; AKwUvBxPH+PwEKwZPaffae+lmNURoRRqxwl/vYqWkx2iA/IPvEOqoSsX7CJIlNyrcytnWS7VSVlIdNi1JoDjOyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGWLovDU4CU1EWLhh6Xa1nuJzZeH46+Zg5G25dUA6/laXV3G7f
	S3Ifc+UkVPZ0d0d275wCt3abGq5O+0juxzU8MstotXGmb6wH8ydtnSQ1OxfpHuQAgvqz3+80+dk
	p2IdI9w==
X-Received: from pgve15.prod.google.com ([2002:a65:648f:0:b0:cc7:caf5:50f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7747:b0:3e2:8513:a1a
 with SMTP id adf61e73a8af0-3e928c5dcbfmr7462789637.15.1793632165658; Mon, 02
 Nov 2026 07:09:25 -0800 (PST)
Date: Mon, 2 Nov 2026 07:09:24 -0800
In-Reply-To: <20261029221710.1871112-4-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029221710.1871112-1-dmatlack@google.com> <20261029221710.1871112-4-dmatlack@google.com>
Message-ID: <auinpIEk6FdGwDS8@google.com>
Subject: Re: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, David Matlack wrote:
> Use the VFIO selftests library to pick the IOMMU mode in the IRQ test and
> drop probe_iommu_type(). Pass NULL to iommu_init() when the user does not
> specify a mode with -t, and skip the test if the requested mode (or, if
> NULL, any mode) is not available.
> 
> The VFIO selftests library now automatically picks the IOMMU mode that is
> most likely to work on the current system, so there is no need for each
> test to probe for a mode itself.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/kvm/irq_test.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> index 791e576c334c..f9c11d80a306 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -148,22 +148,6 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
>  	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing);
>  }
>  
> -static const char *probe_iommu_type(void)
> -{
> -	int io_fd;
> -
> -	io_fd = open("/dev/iommu", O_RDONLY);
> -	if (io_fd >= 0) {
> -		close(io_fd);
> -		return MODE_IOMMUFD;
> -	}
> -
> -	io_fd = __open_path_or_exit("/dev/vfio/vfio", O_RDONLY,
> -				    "Is VFIO (or IOMMUFD) loaded and enabled?");
> -	close(io_fd);
> -	return MODE_VFIO_TYPE1_IOMMU;
> -}
> -
>  static void help(const char *name)
>  {
>  	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
> @@ -266,8 +250,7 @@ int main(int argc, char **argv)
>  	}
>  
>  	if (device_bdf) {
> -		if (!iommu_type)
> -			iommu_type = probe_iommu_type();
> +		TEST_REQUIRE(iommu_mode_is_available(iommu_type));

This is very unhelpful when neither IOMMUFD nor VFIO is available, especially
why the user doesn't explicitly provide the desired mode:

  # ./irq_test -d 0000:6f:01.0 -i 10000
  Random seed: 0x79d386bd
  1..0 # SKIP - Requirement not met: iommu_mode_is_available(iommu_type)

I helped write the test and I had to go read the code to figure out what iommu_type
would be, and then read the VFIO library to see how it reacted to a NULL pointer.

How about something like this as fixup:

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index f9c11d80a306..63205afc04d1 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -250,7 +250,9 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
+		__TEST_REQUIRE(iommu_mode_is_available(iommu_type),
+			       "IOMMU mode(s) '%s' not available",
+			       iommu_type ? iommu_type : "IOMMU and/or VFIO");
 		iommu = iommu_init(iommu_type);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);

to yield:

  # ./irq_test -d 0000:6f:01.0 -i 10000 -t vfio_type1_iommu
  Random seed: 0x14e21328
  1..0 # SKIP - IOMMU mode(s) 'vfio_type1_iommu' not available
  # ./irq_test -d 0000:6f:01.0 -i 10000
  Random seed: 0x160225ae
  1..0 # SKIP - IOMMU mode(s) 'IOMMU and/or VFIO' not available
