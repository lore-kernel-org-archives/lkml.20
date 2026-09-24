Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71F4BE427
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276191; cv=none; b=I738SNhlFjMCzALmpGdXtXgXhhalHV42oGfr2+trS59aAuKH6ljjObgawQ1tMWK5QmhUyYjKBb2lG1G952V1M1YRQWL4Rp3RA+D6vXoAT+uiFrNsYGP2xCdTqHBa0WekB7/2TCRtzsjPbrfwOZNaCj5u6MNoiu0bzF0MM9g1vdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276191; c=relaxed/simple;
	bh=egCmu1YLgCd9/Gj2Tb3VskMUJKGWa4dyhPZZKWuYzg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+QbyhPZ4MpXM5DpW5Kg2TtFJg/nVQNPThhINyXO0ZNG8l886Ymbh5RAXQl3Fzgm91o/38xHqPe3x4s0yH76KeK0w8tqDH+6VpAHhWskdYON/TeE168M1THgTVgsm7afmhG9IPAXX5UE2eO1YrFlpFFU9dOBXav9IU1sI1lqbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gmO101vg; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gmO101vg"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a3so117910b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790276188; x=1790880988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebULXkvke2eVNYiXcNmbifnRben6gnVjY/5N0AQ+E08=;
        b=gmO101vgAlryqu5L/dUPfP8G04PHb7Vcq31HMKbIAoRMchbvrUJxRVE2WCp5dqa6px
         kgaJKUvxglWjn4PYbdGcZ9nJSvVFoDibhfXRCwf6YZEFcQUycAPck3QPNb9PMdJYT2f6
         3hWt8h2/MwSuR6yCY4ZEa6Pik9L8vTmxzatCRn3zxa0bKaSURJoZBDnZNt4JyRjkkAta
         oQcyI7oOhaAW3hHjxE8LvL6jVCY5QZEG35pyFpi+Rgog53vKNU2a7aBztR+ZnvFFPcaa
         /OqzsMCCyFEnWCZJehYc+fMZTmkP5qmZCuMCy4kt/dZk9u29mBcBhjxweXEdt7+gXlrj
         tGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276188; x=1790880988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebULXkvke2eVNYiXcNmbifnRben6gnVjY/5N0AQ+E08=;
        b=CtiMZOEszUltki767MyUzVyuxr7llL7L9ZuVKFJqKGpe7uAOgPjNwmsaorJC3I5Fsj
         5VLRkcJta8iG79jzM0pauOi2EgrvdQjRAKOX4roMgAbjaPDqm/A0vpabnkJnp4l7YD+3
         sin6UZ1Tr5jw0gRLT8FcC0yVWtxqDNi15mo7eUTbjhdxbsWqdg6SK4db/PwuslQTFJ3f
         xocLtQ4eOBF3P3t1pr+nWkzK0156qN8fOwjiC4atVgEVwkcC0dqRsOy9ptdKRC4ZL7Vd
         FWDCj1PoUkKn8f99T6pv6UcV3MYbd4v6Y/G4TcEJXciVDnTlEb4Wunaof4Hct4t1F4pG
         DzHg==
X-Forwarded-Encrypted: i=1; AKwUvBxErgRdBR7C8OdvH8ZPdNc6GCfXZx+vUTT0ZWIFcIntno2A58LLnoz5k8y16XC+PIjDNUbhyIqByvHqyWc=@vger.kernel.org
X-Gm-Message-State: AFuF++k+kSWt5F71NpOzVlR3Yi2CCXq780pJQu8N7nfw8QLYysGY+sJZ
	vF3wR+FnHZhvTPTSGG3rrBtwBcfZ5sP8zKIIrytPPkZK2kiefFdZlpot3ls5+kEaDA==
X-Gm-Gg: AYBFou3J53eOlV81CjH/7rwYZZW+jHJLZCkNuRXP80at2hpDM6rh2zcPx7vgHlZvVSd
	Keomd1io64YW70tVFLXPjgSKzzNfYby+6x6dnEw1eCsav5zNo6Q6qTphhmdj2MTUXdeZyfUHxUz
	IOnFPmQjVxqm5pk2wxnWj9+jol35/cQF3VIZHkPVkFdxW/Kba3Yc6ClSRLekN0yQVTie+I1giWy
	BYnsSIjo5ssJvmqc3Ec7sA7P+eWMNeyQgsBZDtSt5RwTj/uwAz9XizwmdyNyLAFlxDk8q40W4Xb
	0hqchU5KamH+fAYoEgu2V9SqeCz+O80BGe4m8EvJTUCi0iQ88nntiub95TVMMx+ww2IFjY3vb7N
	C3DuAEsmhD83k0EuWMgPXvPqGNxK+E/Zfe4LBiFKAvFbpgbORhi6n5rBZeqFcAICunuVkejLK5o
	jsPHsFebETCbjhf+MZSByb+S+0VH2Mi5xwDIX5S2nXWxCs6Wuq2JpQubr8Dj6bIeFCrfQ7PrEEX
	MZmvHtHiMzpT0kPh0dmt+DePaM0vA6M08KKUzNV
X-Received: by 2002:a05:6a00:aa84:b0:878:3538:8f78 with SMTP id d2e1a72fcca58-87e9f0527b4mr2807896b3a.38.1790276187619;
        Thu, 24 Sep 2026 11:56:27 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea88a1a2sm100923b3a.25.2026.09.24.11.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:56:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 18:56:23 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm <kvm@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 2/4] vfio: selftests: Verify a failed second open
 preserves the vf_token
Message-ID: <arVyV9JmpH2Opn2q@google.com>
References: <20260911170429.1642480-1-alex.williamson@nvidia.com>
 <20260911170429.1642480-3-alex.williamson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911170429.1642480-3-alex.williamson@nvidia.com>

On 2026-09-11 11:04 AM, Alex Williamson wrote:
> The cdev path enforces a single open per device and rejects a second
> bind of an already open device.  That rejection must happen before the
> bind can mutate state shared across opens, notably the PF vf_token, so
> that a bind which cannot complete leaves the current opener's state
> untouched.
> 
> Add a regression test that binds a PF with one token, attempts a
> second bind of the same PF with a different token, then initializes a
> VF with the original token.  The VF init succeeds only if the second
> bind left the PF vf_token intact; a regression that clobbered it to
> the second token would make the VF init fail.
> 
> Additionally add a second separate test that enforces the -EBUSY
> errno on second open so that the vf_token clobber and errno testing
> are independent.
> 
> These hazards are specific to the cdev/iommufd single-open path, so
> the tests run only in iommufd mode.
> 
> Suggested-by: David Matlack <dmatlack@google.com>
> Assisted-by: LLM
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
> ---
>  .../selftests/vfio/vfio_pci_sriov_uapi_test.c | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
> index 19d657d00b75..b57e4498443f 100644
> --- a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
> +++ b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
> @@ -157,6 +157,63 @@ TEST_F(vfio_pci_sriov_uapi_test, override_token)
>  	ASSERT_COND_VF_CREATION(ret);
>  }
>  
> +TEST(failed_second_open_does_not_clobber_token)
> +{
> +	struct vfio_pci_device *pf = NULL, *pf_second_fd = NULL, *vf = NULL;
> +	struct iommu *iommu;
> +	int ret;
> +
> +	iommu = iommu_init("iommufd");
> +
> +	/* Create and bind PF using UUID_1 */
> +	ret = device_init(pf_bdf, iommu, UUID_1, &pf);
> +	ASSERT_EQ(ret, 0);
> +
> +	/*
> +	 * Attempt to open the same PF again and bind it with a *different*
> +	 * token (UUID_2).  Return value intentionally unenforced.
> +	 */
> +	device_init(pf_bdf, iommu, UUID_2, &pf_second_fd);

I originally suggested a single test here and I think that still makes
sense. There's too much duplicate code otherwise.

If you want the rest of the test to still run independent of what this
returns you can use EXPECT_EQ(ret, -EBUSY) instead of ASSERT_EQ().

> +
> +	/*
> +	 * Attempt to initialize a VF using the original PF token (UUID_1).
> +	 * If the failed open above clobbered the PF's token (i.e. updated it to
> +	 * UUID_2), this VF initialization will fail.
> +	 */
> +	ret = device_init(vf_bdf, iommu, UUID_1, &vf);
> +	ASSERT_EQ(ret, 0);
> +
> +	device_cleanup(vf);
> +	device_cleanup(pf_second_fd);
> +	device_cleanup(pf);
> +	iommu_cleanup(iommu);
> +}
> +
> +TEST(failed_second_open_returns_ebusy)
> +{
> +	struct vfio_pci_device *pf = NULL, *pf_second_fd = NULL;
> +	struct iommu *iommu;
> +	int ret;
> +
> +	iommu = iommu_init("iommufd");
> +
> +	/* Create and bind PF using UUID_1 */
> +	ret = device_init(pf_bdf, iommu, UUID_1, &pf);
> +	ASSERT_EQ(ret, 0);
> +
> +	/*
> +	 * Attempt to open the same PF again and bind it with a *different*
> +	 * token (UUID_2). This must fail with EBUSY because it's a second open.
> +	 * Previously failed with EINVAL.
> +	 */

"Previously failed with EINVAL" should probably go in the commit message
rather than the test.

> +	ret = device_init(pf_bdf, iommu, UUID_2, &pf_second_fd);
> +	ASSERT_EQ(ret, -EBUSY);
> +
> +	device_cleanup(pf_second_fd);
> +	device_cleanup(pf);
> +	iommu_cleanup(iommu);
> +}
> +
>  static void vf_teardown(void)
>  {
>  	/*
> -- 
> 2.53.0
> 
