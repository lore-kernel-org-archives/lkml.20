Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFBA45560F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323031; cv=pass; b=lkMNBwBK3DhlCVP/Ya3NjtCuKY7my2XXGM4BQNn96o1hV+QHy4maSKBN2V/Y0UBV2Yw4N2y2rgJ2HiyBsFJ6gwkr+ek+Bu6fd2hIyz84177nFF/eq7TZS+DDNNh9w+t6PKmPuSZVV3RmAySqxIdtzAwPLfvNzV+MwyRuwAQjpd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323031; c=relaxed/simple;
	bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MN3gilEn3kGzR8liJQ3FWIu1UVTuMf3h3CaQhDCOCT3oXK3REiNxmCX0gZghtIq5npPfYlp9f1QU5jHI9+uUFBREYxPvFHLya7mznNdEQR8gIUTXD+c636N/dfyuUeBVdqQ+75e4yerSXWXLYGWDFo522goctu3NDPqnrwOLAkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0HPTln+; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0HPTln+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so444947f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790323026; cv=none;
        d=google.com; s=arc-20260327;
        b=tCA9sWJ2baC3jemSZAk5loWodBQTXlAL+ml8M1LT5xGBi+NEVHYVCkckuGZhyLo80T
         9wccC4nMNoDlsPdrF/AfTWvxrIsbCAx/i7A1U2j+kJOwrmUN8oEwytnOAizlnvtPYSKX
         KXGIlVIrOEl7Gqkg//SMH0OJ88OAq33hBbNm2nJCacRT0j8O/CGlNUGuZQXGBKt/Hi52
         IGWkUtz0NvO2zALvZgQNbQahRqK/s53C5tVdQwquoEx88jQH3/rOYYkNM3DQuaj0wBQf
         +NmystKJkBl81zJfKe+F7WCbyr7sdVI3tBtSGTHGvFcgp81jNs3zmg7dMUXD1bwroBZx
         JQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
        fh=/ug0NRIazpvHpT8l1s6eWXoCLwGMbni1uDiXQNzEPXA=;
        b=TYxJxhRiacqFhkhgker2llmy4MXwUw23xIVM4bqzVBMhbpI3IUmadD7OkveYu4edgP
         nAL7D0uVC2SCVPxYClpG7kQo/RMtNQMHXMSzAvRx5QKef9F72o/8s4j/XT+hSCBJdxTr
         YhY83B5pRW0vyxsao003jBC4JL00GZvKnOHsxkC+EmVRRzWmmEq3hJxHVo3e2C+qfAj8
         lCw6t+ssAK4v4LBweNsbk3Cy2Znh/DsTfuvsEm2yXGYpmLxVkfl6AYKKXpb05sp64ug/
         NHH186Exdk6W8MEVsz6SzKgNroaUYkms6dmqJUEp03ypgvqQ4OVEjirOMDXEKo16ICw8
         MXfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790323026; x=1790927826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
        b=Q0HPTln+2Q9jbkFozuLfv1RPDFI7q2UhIlC+g9Rq/CyZTTGCb+6WoX95k5MTH1bt/L
         qtPn/ImTIbuDEtUEp+4uYF7WoXQiY36luHMahyUyRN2+dK/B5oM+BMwYai48FXIJ5lS9
         UT+r9TuXP8TewLgaAwI/nw8LcYUrVbW907xyVW6q24ojlAJtNhm+0RZirxLQ6UhI4ky6
         CyZBPtH1GyFSUjFZujhvl0aztMdlWC0syZmzeaHdjNhpXXYf5V0kCPMVXcLTDOrMiVuY
         eOsJBoly5RHSMFphAPJN8NA3UlARjO9910bq1OA+bzwpnillP6EE/RVrJ4u3YG2NVVpW
         HEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323026; x=1790927826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
        b=LSsXMwm06BW2zNMYrIzvd9o78PfMH3VXXt+0Jk08WJlkRJGf8bmk9kRCnBd1UR7cIV
         BzXyooCKjaRzzW6aVMGcZKadVf6o3x8BvCGlaOajP7YH1gzigmFVpYL6Z90kPRfoiuhu
         DA7n2TQXDZ+2pMW9qLYlmNGasKfibjOM2rRoHO0qmAoQMzWVDJK51F6ov8dbWN5dZpc9
         GJ6sJ+8Tct98Y0sUimIchiQ/NF+AAIhZ07culdSECrpQyTXAe7oHRADwifLtRY6sm0NI
         47n12WlTLI9cH6GZr8k48mIpDVtuZ8h6lhOkZGWLKPNQM6ACNN/9Iz5ciaDmuE0dCahe
         9N3Q==
X-Forwarded-Encrypted: i=1; AKwUvByetxgWHP7uNfa4irWxqRL0uJRWAxJ7+4Z3yj4t+T9jjclDtiOvqLUN3FrZfzFoOAJ9vnFxXkLYPt+4zMM=@vger.kernel.org
X-Gm-Message-State: AFuF++nBV7qOHjjw7y28PbigAkPpaX0sf8dvy3nbO3AOTjEhmACu7A3I
	bDJvP1l+wypZhITwGM1qbboYHx/nn4RdKpJRdmeBA+NxqjPgHr3r64wuXMpnbX+saLIrYJkFl/i
	M2mVY5cq1tT9QXHki8qTSJZOsutKO3EzG6LHlBZno
X-Gm-Gg: AYBFou0dFTh3YFhTRFZzU+6vm1x8I9qAgWqxyVve7KLKYhlpb0dcL70BcsOdM/HtvVO
	dcWmMPYone2aXJBATLJiGTi9rckEjDdbC8f+fxgZXvElard9yp7wj367Exzsh/eJP+1EgnISD7J
	7ELVpEuu3KOnYLZLCKeagWPmWo5an11qiHyPVMlBl2OSEKh5f1tj8BCCKxKOFxkV/aPPDXF/mGm
	vaCATueywkA70gZIqpfSbqO64Q6iEO911f5HF0RB7f0u4HGQbBlF3Rq1bCQA0xx1DtMbxD2mAPh
	z1hIDkOqqL+LE7GzNxZkb7LlrENRffDvpFj9OvYlhcjO5t6r83GKZ8P/GmxVxX7SD2+fFwOSDha
	HcUYhYki2sk2ywMhEUJVmtHmHRQDFhWLUFo3XOjS9bYiQ72F6HUyn
X-Received: by 2002:a05:6000:64d:b0:488:7da0:fedb with SMTP id
 ffacd0b85a97d-4887da0ff09mr2217956f8f.40.1790323025312; Fri, 25 Sep 2026
 00:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com>
In-Reply-To: <20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 25 Sep 2026 09:56:51 +0200
X-Gm-Features: AclHuK_Dn3TRdt8_mIeczM_Dej9VW3qvC_z6fo4fHT4gwnLFIhhWWIgyFak4gco
Message-ID: <CAH5fLgj=h_riWoOvEX_TOH3+0FNbKBtjO1OrxzwHDQq7uzXg_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tyr: safely write GpuInfo to userspace
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:22=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Tyr creates the struct drm_panthor_gpu_info from the Panthor UAPI
> bindings. It initializes this struct by querying the gpu and then writes
> the struct into userspace memory faithfully byte-by-byte.
>
> Currently, the struct drm_panthor_gpu_info does not have any implicit
> padding, but if implicit padding were added in the future Rust does not
> guarantee that it would be initialized. Then when Tyr writes the struct
> back to userspace it could expose uninitialized kernel memory.
>
> Tyr implements the unsafe trait AsBytes for GpuInfo whereby the developer
> guarantees that struct drm_panthor_gpu_info does not include implicit
> padding, pointers, or interior mutability. This allows Tyr to safely copy
> the struct into userspace memory. However, relying on the unsafe trait
> AsBytes is fragile because if the Panthor UAPI changes, the SAFETY
> guarantees may no longer be accurate.
>
> Instead, use the derive macro `zerocopy_derive::most_traits` for struct
> drm_panthor_gpu_info. This macro will attempt to implement the zerocopy
> traits for struct drm_panthor_gpu_info. If the Panthor UAPI changes so
> that the traits IntoBytes or Immutable can no longer be implemented, Tyr
> will no longer compile.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

So this looks good to me

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

but needs Miguel's ok since it modifies the Makefile. And I imagine he
may ask the commit to be split into two.
