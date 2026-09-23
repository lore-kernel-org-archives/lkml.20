Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21F56C627
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192990; cv=pass; b=Fx8uy3FR12zhYkXwsv1DpzPQGZFwRO5WlOxA6xpcAjh6s1ecbQFC4CDrrZ4g8Abg53lD0Cg7wB0kH+6GM+2ZrP5AUvEckOsxpj/tnaEWOuNyrNJU7nE1jHVXFuXqag7hssSBs3o515yCWKQx6nNmgiYg2wIuxXLGd2oA+OfL7QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192990; c=relaxed/simple;
	bh=RksxLKnB3yS+nYXEiKhMFhIcCH6JcEIqRI8Y/4IK6Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3AoXhgvOgO/l57di00FCIb1n/ArvjEBey3hK9RNk69/sKGwgGgSfo30GWKoNh+3mvWVsqNMPVuF8cldyG9CoDvy/Gia5Rdm/ShnJMORKK0F7PITA0xn6B77hl+CmL32aBQA049G+83yyPUqi+7YEdKlSNZD0WCTa3lcQlergig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LaEh9T+V; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LaEh9T+V"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so288a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790192986; cv=none;
        d=google.com; s=arc-20260327;
        b=KMSp8xGs64uz12wQUB0A9avsYzER1xdA8Qe4nLnWWXiwf/Y2yLDy6n6ZgpC/aXaz0W
         WTu/EwYNwBjCwagBH9xlFpXsc6TA0rbsD5W7vnQaAKBj9ruYXyHXSkyBRot2PYTEF/6b
         aHKDUh3bTB4kxrXd6KNMQhsBmT/UPsoZ9Y3RtTDTqw3P1vfjdUB+1LHIuN2rVwKs9oQa
         P4vCU4KKGSt7AwZ/q/Ri3+9fH0IKNdb8CA2hreUmiO/IuZp/qcI8Q83cdJ+12WhUPsI6
         GTVccnCQmHWJvgHE8UK8E5AC/W1Y4A1CU6G2BhR9pmhVYjzVNtJJgoYp2s288I1Hgu2u
         bMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zg+TRF2hlMBWlKMGW490ituj1VT149iHCF+fbR91AZY=;
        fh=4VbjQ0uOfmsgD5Q9R84cHX83Ur8mEMxcecQDvhRzQk8=;
        b=sdFx0ZUPQk6hdin7jQ78QcvZz09d31vVUA7HTk+lSlYGO8i+K2ofU0OjZUP/SPdvmt
         xaquTjqV3B+cDRaR/8fkgBehI3hBGgJNiwjtOLCG3xo6W0Rco5iYdbNTB3boYbqSk8TJ
         n7ZkteDfg7LtpTN1g4ddILL2gc0FsXcFIS4yB0J/BMSwxbOr2P5vTfmeZgct/GzvyaM7
         OAfON1PMoXxnOXoTmE266NM6bvneIts0yl/0fVhCPFIxSFVExC27K8mjwPU3MkpkEi/0
         79F6QoHLpbG1+Z+SCYO7Kztxmm/AxS12nph3QItMn2ytzsK3wZ5oPquwOW4Bv/ltK1jF
         V8PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790192986; x=1790797786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zg+TRF2hlMBWlKMGW490ituj1VT149iHCF+fbR91AZY=;
        b=LaEh9T+VhpbtNX3w/zEMWVHTzQaNgN2gquOOZCGIATw0zL58ufmqhUvrJALMVBT2dI
         5M9C6MHdaknAoJUBO8gJa59Hd7+Gbp321zW9hwkUUZI4DxbdjLsnmdFG94knMYDYzlgi
         UaoEF1dgi1mXvTpU+nfoE/dIsBxjSbA76K8nOxHTXmwauJ7yOB9b2OuONgns9v6NJOL8
         DTWLoO/EIIDhWLzQp7RRj5uP0tl4iLYfR+SBKXYD13HC1iYWVSsQKeN/1cGKADA1W2y/
         LwIWmo7Nf/FqVmEC/MHG43lZIvmiRlyF88vV7h//Pkhx4J8IyBvGFFc729mJjUCNYQ0X
         BqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192986; x=1790797786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zg+TRF2hlMBWlKMGW490ituj1VT149iHCF+fbR91AZY=;
        b=cTtzOKGRf39jVwvTIP3q84HebgAvBbQKg0lWqg29tp7MtLuLI7UY7oQD7X2gilPPEk
         YBVXidFrq94yZig6+vOQTjSCgP8uGim6mJoXR2xuZ1kOKacTDqKL+Q75uUiphrh02EnO
         C1H/cYLvbqthaWDm3sjSgWFm8jyfwEVH6xSO43rdxTgEfYhNVWlwzkg5ui/q8emCBg92
         Acrirg3xcvP5lABmOIiIOtxngncqb9MOipN+tnaj4Fq3br3ENh6t0eDRs1Xh6QsfhUtw
         WYMYtu4OPxzRviIW4GOl3vonGZoVkjubd9KzKu98PWU7TzGkTxMZ2atylbmbiOsVscSe
         nvWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAikiN+Xh/zgcZY5mPYWy27pOwNDfdDqJr9NedmoVZBgNqABFMmTXT/jTxQD1iJirpcvlZlQRvy6f7Lqg=@vger.kernel.org
X-Gm-Message-State: AFuF++keyIrETNykgJynCRUiRcdnumjKxQ413iefcqhT06g+ulZRK9fO
	M4i/i2JXJDgORChep5qeuBKwC5osHQBdHFN/sya383RTL0Qn/QZFZxEog+62qL4KocZTQxk+XiD
	dsyvTwFSEaq55EFVUAld/KzsMJkGz9gNlYpnmEOtl
X-Gm-Gg: AYBFou3YOUaZZFl12Zxs6EDwB58+a/87dxYYxzmy7/hLGRlpQSGlgF6+oqi9mR4FPbo
	01NjCx8wRnRGxgdqFlXIIPTLHaf2J+n+dP8BMXhTU9uqg8VcAWJAZTUyz1PAw4C34Sopnk5ov+j
	4atv9FPbNEFUcVQzTpQZuFlR5Whs5XizE7UCJq/ZdSqdVH/U91Lv4F1npg8mDZDSVZTwy2zMH11
	EKjJ6jGj8acRC433dR/kFW6KuUHVHs3vtsrLZaZBFyv8omUZLRjWvOcaKLe2tF7UmPWnT1APRc3
	LKPHo4vRyVqKkkIW1gKO4KijrD50yNdvjxGLDttw2NJEBbhhISt1w2w=
X-Received: by 2002:a05:6402:1c0f:b0:69a:f1cf:4849 with SMTP id
 4fb4d7f45d1cf-6aac7c0a102mr17386a12.2.1790192985525; Wed, 23 Sep 2026
 12:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790171702.git.zhang_wei@open-hieco.net> <ece0aca2e99edc2cc626e0a8e61ccace80a28d74.1790171702.git.zhang_wei@open-hieco.net>
In-Reply-To: <ece0aca2e99edc2cc626e0a8e61ccace80a28d74.1790171702.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 23 Sep 2026 12:49:33 -0700
X-Gm-Features: AclHuK9wDS3j_kFU_z29aQCAAxsQCqLzUICOjyr0No49JpSQevHnMBu9QJNROds
Message-ID: <CALMp9eTyC5fhWnhbf1_npF30NuQzoAmuTbJe5mkG5Kv3_P3a=g@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 7:02=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> INVLPG's memory operand is decoded with NoAccess, and thus src_val does
> not contain the operand address.  Intercept handlers therefore cannot
> construct exit state that reports the linear address from the existing
> x86_instruction_info fields.
>
> Add get_invlpg_linear_addr() to compute the address through __linearize()=
,
> using the same flags as em_invlpg(), and pass the result through
> x86_instruction_info.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
