Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800726982C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308409; cv=none; b=bb6C8QiI1N1zGZ0Jj8RXdsyg3TygSqwSGQ7K54l48izaN1UkxNcAG3BP5OfIjaF3vcNpqPEB/ald8cUZTZEvaLBH62iH4xr/3RAu8rKfPD57SxT8qc4YR5KOP8z3rLXxkdz6EaG2Y62FRtzNs/q/UmF1KOtvcGVtcjjJpvAzSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308409; c=relaxed/simple;
	bh=BXRcOixdMzXQLW85aUU4Wf/qtNPkoLSWJYkLfRBdgIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O4bu3aGwKTvQP3ORqqmmnY0Fh5F3c2sPRtI9PQHncevQ+41RzLplR+6HM2RangY9xTN/Zc/MKtNTHqKfxLPbSzUIAncewBXvgdne/wfp+126UsnIB0cKEfS6Bs9Ug6UrPHoucs/zPyp/EFKQKA6QTiMKjd13PrUOk1U3U+WPzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGyIGDlg; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGyIGDlg"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d70d8839f0so4660705ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788308407; x=1788913207; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSeD0zkw5d62oYTgpl5Wd4yc4wNF2jb8Exvm2SVVImE=;
        b=EGyIGDlgDWZrrSLSvNuT/1WXenJlnWO5SjMinOZ8UbwqKh01OpqSgOrgeJ5Tlqt/Jo
         t/gTxRsVi6C4GGTDumBLIg+LC7MSbRYijzaYmB6sYehrhASarUYnQHVvhMf2k1Z96+zY
         jH3zGfhrwB34nraqZszxU5Zw6lchIL+WturKcKbzioZdWI7qU8eF4AQI3X83aGOb60jC
         2XbhzHfnuSUpV4OcjH67MTaubQ4jXl119tB05S6lHicEjLfTQCmlrCHdGowuxaDDKWnl
         x0L9hMhhTkqanqO4gWlwnRwxfw0wbgNE3bSRRdyxXIZMIThivqJ/LP0K5pLaE5Y7q6u9
         PvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308407; x=1788913207;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSeD0zkw5d62oYTgpl5Wd4yc4wNF2jb8Exvm2SVVImE=;
        b=XlcUbO+KMzMbTxH7/80lNZHwM+lT9SXPfnfosirt8+JAV0WMDMN+xdfzNjNQfKhr8L
         aKyYcFkiE82CcItYvRa3sFN3a2osRfQk7ZVDF4c4zq7btFsnXMDxMl8oMeO8qPTEQBjR
         sQ+OCob0QvzO1RAedHhur9Vkdq12JXvmIQG85KS/pRqV05+u9IQzURYfBJwWjVFaoaSA
         76PUv5ePQpn9GcvNs7nDZiU9rlMZQHCwvQSwY+J4OV8B9tCARUAEPSn1Ry3sVo0nDNt0
         J5lUkLeRrwhDauqezlxCtyWllgd4+KY0fR+i3a8JcrZHZmO1TMfJK+IeeClNDHP+1fAi
         duLg==
X-Forwarded-Encrypted: i=1; AKwUvBw2htIyt5Z3DuFkeGelEJU9jKoGcHo9KbzhY+vLI2+yS4wCkYPwctARZAoTCDUwfFPOoeWrzggb/iK99Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++mnP/OAcVPI68gUNoAmTLlfk5mhCyGhuseeUjB/5/VH+vXDW3p+
	R1rTyXoLUI7XqusGspysZIafKeegAc9nz0n6ZVVgcrpzhezm2jnDcm3xDKImCPvq5UAUrCNYpT1
	3nJUe5A==
X-Received: from pgco28.prod.google.com ([2002:a63:731c:0:b0:cbe:dc75:c58e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e787:b0:2d9:4358:73ab
 with SMTP id d9443c01a7336-2daec775fd0mr16568335ad.19.1788308407429; Tue, 01
 Sep 2026 17:20:07 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:20:06 -0700
In-Reply-To: <20260730110524.2539316-8-ewanhai-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260730110524.2539316-1-ewanhai-oc@zhaoxin.com> <20260730110524.2539316-8-ewanhai-oc@zhaoxin.com>
Message-ID: <apdrtnMGJN7K0wRa@google.com>
Subject: Re: [PATCH 7/8] KVM: selftests: nested_exceptions_test: Add Zhaoxin
 CPU support
From: Sean Christopherson <seanjc@google.com>
To: Ewan Hai-oc <ewanhai-oc@zhaoxin.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Frank Zhu <frankzhu@zhaoxin.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 30, 2026, Ewan Hai-oc wrote:
> From: Frank Zhu <frankzhu@zhaoxin.com>
> 
> In the test, the ERROR_CODE_EXT_FLAG bit should not be set in the #GP
> error code on Zhaoxin CPUs.

Why not?

> Add GP_ERROR_CODE_ZX and use it when > running on Zhaoxin hardware.
> 
> Signed-off-by: Frank Zhu <frankzhu@zhaoxin.com>
> Signed-off-by: Ewan Hai <ewanhai-oc@zhaoxin.com>
> ---
>  tools/testing/selftests/kvm/x86/nested_exceptions_test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> index aeec3121c8e8..bacbbdc5dc69 100644
> --- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> +++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> @@ -38,6 +38,7 @@
>   */
>  #define GP_ERROR_CODE_AMD ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG)
>  #define GP_ERROR_CODE_INTEL ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG | ERROR_CODE_EXT_FLAG)
> +#define GP_ERROR_CODE_ZX ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG)
>  
>  /*
>   * Intel and AMD both shove '0' into the error code on #DF, regardless of what
> @@ -139,7 +140,8 @@ static void l1_vmx_code(struct vmx_pages *vmx)
>  	 */
>  	GUEST_ASSERT_EQ(vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_GP_DF), 0);
>  	vmx_run_l2(l2_ss_pending_test, SS_VECTOR, (u16)SS_ERROR_CODE);
> -	vmx_run_l2(l2_ss_injected_gp_test, GP_VECTOR, GP_ERROR_CODE_INTEL);
> +	vmx_run_l2(l2_ss_injected_gp_test, GP_VECTOR,
> +		   host_cpu_is_zx ? GP_ERROR_CODE_ZX : GP_ERROR_CODE_INTEL);
>  
>  	GUEST_ASSERT_EQ(vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_DF), 0);
>  	vmx_run_l2(l2_ss_injected_df_test, DF_VECTOR, DF_ERROR_CODE);
> -- 
> 2.34.1
> 
> 
