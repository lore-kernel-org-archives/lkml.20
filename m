Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985AB54705C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640163; cv=none; b=tUGLlzagH57boW0EvDr0K7r1ulxZ3/XrJUz3ZSOMCiJY7PHQfvyR9j/N/EiF4vHgOgH5PT+PV7rxHLMPGiFOju9OprRIxj47xOoY5CTbwP0bsk6sWb+bLYALC+9txx8uhR5TL1R0105PRy/PICmF39q/zb9iRyVfvCAm0iHCsZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640163; c=relaxed/simple;
	bh=qCF4YDD/XsuzUV4vVc2CamBK9oEkCoUqKNTtLhL93p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3FPMYgiZDxsJVrWLEuywayUZVEuQyPKRAYDU0H5T6a+CPHM82uGMj6LXlIn6cxHdGGO04IXTSvRARRwLagj6i/nXGwwzujKvRlHzPgvIVMSCBYYaZdAiS7q2uN0VCP9568OoC0OSxuuXN1TNOrfOeME4XVKMTTAhMMxCELb+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CwOxi5xX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CwOxi5xX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8facae850so18545ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640162; x=1791244962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DCH2PLXbYkrNsME+2zyrKMJYI/Q00cD/tf6UVMp0Gq8=;
        b=CwOxi5xXqv3UyOXG3uugQYUpmYBrcuV4FDH+KRCcerHHHsNsAeMS+nFuMY7V0y/gPB
         HE5GN/9AW4poYPHXazdGfjqeHaeHNpUVLKTJ02vQNG7HZ9uMUQaSM2+kQ9GBw8WfPLd1
         C3o9m50NGPojel3KTquQ4xhVeBxOFZdeGCBkdJjrGH640YKzWYNTQZFRyqobT4p5B55q
         MXefnGe5P1VO6mEIx74/nCYqKkSvLX/bBkVwQE4aBgxrFHZ7jGSU+cKVnNls2PtV/Lb6
         Csi+ZSPQPuocANya1GAkYp82qI/gKEPD9L5lurxcQ/SODjyedocJ3BVm4DeURNo6GRal
         XNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640162; x=1791244962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCH2PLXbYkrNsME+2zyrKMJYI/Q00cD/tf6UVMp0Gq8=;
        b=TgcGxYdSU8zkxE143TjpHPkhCK3/Mjglado/BqFgR0fZ+jQ1J2CEYkEcDRiyzFcw3v
         53v62plDUXmOW1dpfCVJKJCGYZdry6zpw1j1yq0fceUPFBa7Eg+kD0AUrOxZ7N8g3vBM
         oEsmxWT5Y/L+Iq6T31Z8o5P/9ewjc08VoZhLxdeMXohaSMeNgE7AnmqT6EJuyeFB3wJE
         907lPh9bmLBPTCwR/7kvWeH4TL7K/F718YE0Z6/ZC2YAO75EHTRWWq3Q8cPV9lAOARQv
         EXdljUchRKWhImjE61gSyKWI556rLXhUjE3k8fJ42efIsu76g7o1OsrnWR2Bvw5nV9Cw
         pZ9Q==
X-Gm-Message-State: AFq9FYI542Y8DDuzfKT2aIY7XeqbZJnWeIwBKy9z7cBx66sYSVBe/m/C
	sfX6SPHepjV70XnLs5AoBq1aF3I4+rr4BBEDbhjWmysrGmQuK+TQSARJkA2ryi7gSg==
X-Gm-Gg: AYBFou2hyf0hiCJxf+jxFlOf6fj8s3bluG9ZZUgBupvxljAwYfnmHZxImvN9fpuBUdN
	N/jFi8Mbjyhz+ZTf80JzMNMdYqn/yDbTjok3Rv/l/OH1TPnB0zI5XYMEJW05+xIR1dQM8EuuzOW
	UKafdluk1TLyAdG07+6HDi8aHzj4SAyXwexOI6NXaIPcNtomFWqMI2L3+YUUrKbxlIxtfyDizEy
	8hqsDPWgsqVucY3aDtaRnPKkX/IhB6UFBPyqMVbi+AMn/aAC7kwaDcUwESZ9ZOhgnwdo1sg4d1M
	TUDS0Va2LnCdf35HOgbOjUMzCyNsRIMsKSU5UmESRmKrixCzy1/Ic2TzfW7yahOuSUglbCfscmD
	FVfz8ssiacT6ED9lKmZsfnYVfwUVz42wV0firsg38UwDKSpYBGjaaMG1xUYJjP4EA/js2mT1JEB
	n8XYQ0CvczmseticdT1G9SfWOwPZymm1I0hKFuXqp22LIWrm6WSsLdnCPUfmERyDGMM5KlRtgCR
	xJgroXdsVr1cGDzfmDt02OLY7+IZPzShR5S+xucOe4W2go=
X-Received: by 2002:a17:902:ce10:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2e2c6307fbdmr1665605ad.4.1790640161333;
        Mon, 28 Sep 2026 17:02:41 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ff85sm4796244b3a.19.2026.09.28.17.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:02:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:02:35 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 4/5] iommu/arm-smmu-v3-test: Fix OOB in
 arm_smmu_v3_invs_test_verify()
Message-ID: <arsAGwY09NywKcqK@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-5-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-5-smostafa@google.com>

On Thu, Sep 24, 2026 at 08:56:15AM +0000, Mostafa Saleh wrote:
> arm_smmu_v3_invs_test_verify() validates the array bounds using
> KUNIT_EXPECT_EQ(), which triggers a failure and continues execution.
> If invs->num_invs was smaller than expected, the next loop over
> num_invs would blindly read past the end of the invs->inv[] array.
> Switch to KUNIT_ASSERT_EQ() to fail and stop the test on bound errors.
> 
> Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
> Reported-by: Sashiko <>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 366dcb2b5554..244cf34e5a0b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -643,7 +643,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
>  					 const int *ids, const int *users,
>  					 const int *ssids)
>  {
> -	KUNIT_EXPECT_EQ(test, invs->num_invs, num_invs);
> +	KUNIT_ASSERT_EQ(test, invs->num_invs, num_invs);
>  	KUNIT_EXPECT_EQ(test, invs->num_trashes, num_trashes);
>  	while (num_invs--) {
>  		KUNIT_EXPECT_EQ(test, invs->inv[num_invs].id, ids[num_invs]);
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 
