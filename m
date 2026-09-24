Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35EA4F3934
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286900; cv=none; b=eN7+ZPoq2HUKxfs0b0o8Csq0zzjqAflz1Qza5Ez3DNK7wjOrI7kM7DK/D7TmUgpFArV0YAPkBKVLlFibvYn+hnfWkppCOmEGFiwTvLByx8fsMDFxMnROvwGdp1IADslaAlLr6rD5/FezwYZGkZhkGN1o3HcBMYcTqcE4Z2MqkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286900; c=relaxed/simple;
	bh=kWppslkOvevKc9mXoahTnUM1fVIuXlqznuXN7nUb8rE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LxnjxCdrTLxs2AKB8zFIzlIIiSLNbMe6NOIm3xqgsX8gONlTQV2+kpaGD9zHE/PNIHrn6sWmWQdcgud7r/Hg3oW9Y1DcrSbI2rZpRARNyvxI4f2JPtHdmOvI2Ml2QHtEOanAIzqcAdfqsdH5YNvwb9AnQiwNjdEbW7BIS2IThPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kV6eBjNC; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kV6eBjNC"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso2759035ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286898; x=1790891698; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rfF6bxfqiDojUVP/uewObFMINnHxIN7q+IPmVtdXSU=;
        b=kV6eBjNCrVDVvk4GqsWLHVTSCujSoFEsjxW0fCEVYL64ZMtMRJqyMhR6otggikeDv4
         zwDN3sFPD6i68xFMfWgtoZ+4tk1GCHLHGII0AbqriR0jzizIxEnLLvtbi6xeEy3dci3C
         7B5I+Qsl3KoWVGrN3tZYkKqlCsvt2f+E+repxzq32Ws8v+NjIPoZT3N2bcbNiVmwv5DK
         GO9DOhaouZtqJElQagRMvmhuvPzRDPD7r9CJfrSBbLoq64Cj19SBiieUegxyxWBZwHue
         b6skFEKcpYQ29481B1CLvzeFniESBn6hZ3EaVQrqZ41BqpJ7u5lx7a9j++lJh+m/rfvp
         wYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286898; x=1790891698;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rfF6bxfqiDojUVP/uewObFMINnHxIN7q+IPmVtdXSU=;
        b=x9I+7OsfOUnqgWe2PfONdBXngjqsUj6VxQX+MUKrhWDE9ojDgVM7Z1ul9f0EWPzHAP
         PAFdbjDWsOWAE/GnhrA0U6CxtjJKC+eGfkW0gn32Wpc9ibGlgk1PmSLsBaQ1HqQf8Mei
         zDuNCHy2kxl1YBSplo5uUTX5n2seSAMbuxvI9Zm0h93BcXsktAIUANjEEYw9HtKJoDdW
         7WHdweLIAibNs2xhWZb3hXr6cot4SDL306EkWOBk/JZ/sbqS9URam4Xb1KpbIRNnv8qm
         /GboTGbCCDwE0qhSZCew1E3M9TiZwbZloqqdoskfeYzBJxT+Gx+Exnir166UkWkyXttv
         CEmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz2no90MCoEAdzCzba/q+PBu7FlEn2HJU85a59E/gpnsFUKnV3OQBInuI5WUiK7Wos5fWbULsoReDzqQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mBy0ouqp83b0hTLoeC+Nw8HB5SvHAsW5hpd8YElHcKzMJ6Y9jY
	T4dginQ3h6A+5IfiwgiwxUmdQLHz5SKCDnxHW3jecDfNwndrMzpeiCnCmhkibtpCdePR4KxmHNk
	vkVrzvw==
X-Received: from plas21.prod.google.com ([2002:a17:903:2015:b0:2df:9534:7dba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:228b:b0:2df:90d4:1193
 with SMTP id d9443c01a7336-2df90d41a8cmr5867085ad.45.1790286897703; Thu, 24
 Sep 2026 14:54:57 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:52:03 -0700
In-Reply-To: <20260921102442.1232375-1-zeng_chi911@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921102442.1232375-1-zeng_chi911@163.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028359974.2001539.452762182755622284.b4-ty@b4>
Subject: Re: [PATCH v3] KVM: Don't treat reserved xarray entries as having
 memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, Zeng Chi <zeng_chi911@163.com>
Cc: chao.p.peng@linux.intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zengchi@kylinos.cn, 
	David Ballesteros <davimaba.v@proton.me>
Content-Type: text/plain; charset="utf-8"

On Mon, 21 Sep 2026 18:24:42 +0800, Zeng Chi wrote:
> kvm_vm_set_mem_attributes() reserves an xarray entry for every gfn in
> the range before storing the new attributes, so that the store loop
> can't fail partway through.  If one of the reservations fails, e.g. with
> -ENOMEM, the entries that were already reserved are left in the array.
> That is harmless as far as xa_reserve() is concerned, as the reserved
> entries read back as NULL via xa_load(), but it confuses the "does this
> range have no attributes at all" check:
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: Don't treat reserved xarray entries as having memory attributes
      https://github.com/kvm-x86/linux/commit/277d3623d99a

--
https://github.com/kvm-x86/linux/tree/next
