Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924283;
	b=XwF2pAAP+ChsmPNJTcODTka4w8Ou/u2F595vpS1btL8mDBlq2FUTlvLRbdCzx2BqtpX4
	 bY0BLgXUrYR2UN60Dns8ql+TiJybDbyxuiAZNPxCu2VwoBzatd27M8WhflFZEiVYFv12v
	 oREW9HdREJn93guRLUEGbSv60XerR9b9mpSXtitWa5n9ECgJJG5OApfOX6s7x9R7e/KnQ
	 pW9LfEaDdGPrGpKYbZq4Im68FfLguf9Pw9+0b25x0ejmNFinP92nNzh1GI5p02ifoEWts
	 mCgE0jxf2iBGWuitV9sJZrUKaw/liXLs3iWeKgJ0n0n7sGJBWgSeZ9sB5EZTfYK+MbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ih5wuFzd5osSi9x65JorD1df2Cat1TS/BqOFxkckpOI=;
	b=GtlU1NH7HQHRPehZ4sP0QHWy4EAoLaIjlAmVPVqLYhYMcdyP9iYfa3Ax7q0ae/zAeG3f
	 4gGop1v0hyG/6r40caOkjS85M5hmSQuv3t0fVTjD6z8kMtUO2og/FeqB3sAesz0jbK1lD
	 VfCquwC26pah+FfMTiTxcaNFKxSdsAgLrXdtutps/598d5fn5iqnLZmTWF02SAHNirFgP
	 eBhuRw/Da/VdwHHjWeLR1LbvvL/xzzmxBdr3mTWp55EIqL+gBqGi1Ljhe5Ar9HnBYfrZT
	 z1lfAmlvo5Xd1rxWS6eLHa2JrsxaWmuzI92bUYwsR064eOIj2z8qs+sMQj5gEwm+vGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4y2HMKT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09277606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09277606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4y2HMKT
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5383c97c8cfso3031cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924282; cv=none;
        d=google.com; s=arc-20260327;
        b=UPVakv6qphpj2qnY5bagmOYFUoNPUKYXrLQWFbvcmOLUBfAEZGn5YZ8RYxvC/Xl5W3
         0iCg+vX6OaqA4V7U9ds1tGjLQTS2i2BsM5hqxjesKN1UysR0OFrF2JsgE7uqugpReawK
         rupsU5wnqzlGLMyuEZ1qhNfaqC7fNaEct3+jHEk/6yIhLz7lfNPtbuG2my2QMsFhlbhA
         OCxxPer9Q0eruv+0N6T2Ij9b7bXdqsya7wPuhlPx3KFXbc5siT+7+bEyjy7UFqfldwdl
         4xCAvvxXrxFj6qDlNi/sC6rWSwDbbGGZV9UC4tStzOvz+W3Wbj5ExFPA4VcN5wtG9b7N
         2szA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ih5wuFzd5osSi9x65JorD1df2Cat1TS/BqOFxkckpOI=;
        fh=0WDanIQSGL3L32guESNJZw7sRM5kqfPPA7zkHMoluoc=;
        b=p+N87ffDDXjtkMuGI1uUUlWKeGhcSfGxnOblAp/0kF/Vbkx08LFG0DZdP/aIAoeK/W
         EmvJ4fhW4hz+FGrqVavMTradqGT59sVIFLwMvBQl/cgV5hNqkdHXfc9iIfxmhQcoT9k4
         u9LGVyVSqv3dkXRdm4MxCISd6AuJijwPMElI4bb3oVokmr474OXxzSuwRMR2j7fv9724
         yTDYiLI15f1/cQ+spKgtHVSsmuA3q4m39PbvvYc/I05Df8dvvrz0USuOxqH1K8EKBdjd
         TlaJRIEdbrSr6BdSwEL++7gCaR02ygpZf1NT9i4HhkPESv90d+fLHS2B370ZD+5ZOHC3
         9AXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924282; x=1794529082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ih5wuFzd5osSi9x65JorD1df2Cat1TS/BqOFxkckpOI=;
        b=G4y2HMKTb8lIb6Sw+aYPJfpoDTj8btlRBLHzJhRL577W1fB+LispT8/CxuUZZcuEE2
         Opd9bra72ylskhvSfdclso7f/GLYcPRg4FSOYRsUXgQBU+jmjyzFZSgFS6QXa4zv3+zn
         gBtIWdPmLM9W37vowR/RIXWbpNSnp7y67vTdzgIx1WdUzIA5cFGCtTcAyDHDnzW3VHNi
         sFMWCiCGFbSyjTvtJIBlgEy5dx5nk7+NhYwXz1Jjrd0DONoeZeP0a96eZ6xNMpM9BByk
         L8tx98aoCcMrWavw/KcsAc1yoXCeCXL/X4ZiXPHSr7QNqkQyvIl0mBnw2tCRUBmv0Y2T
         6b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924282; x=1794529082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ih5wuFzd5osSi9x65JorD1df2Cat1TS/BqOFxkckpOI=;
        b=U9/DXbCAmcVjrjdYtlvnWj5YWxvOGYbzBiDUDOzpfU189LJ1SGqN8/GuOodYNpnv9+
         1LhYeW0M7o/7dVkklIrLqmMoiTgXdKQg8eCEt08E+lAWP1DxOBQh17Pq56AyXhx4E9Gn
         t6ArPnbdypQxEtMfbvFcQ/y6n489jf670X/T5lxvWxU+ZaVaZ1wJZz1zY54tijXjDn6q
         H9F1Akxx4ROtQts1wpPfHoQbqFH31E7YtV5dArbMocHVJo8uYI1+ZnZ5+7Zl5K6d9cCG
         fCdsodjYMO+XxvnoOUfcKVuW24lGosmtVmXtq9suQyt6cMyIp5TeEhVL++nEzpqlepap
         E4eQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4DaddpTaAj92AkI0pw/f641GbSOpv/0aYufWxIRa4uMcqGctEmHlDJOjlqknaGzQO6XI7zykw3s6dKac=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jmDeOf403+JW3OTkQHipfs5QWl1omyt+oA0E9GwXTCr1KmRSm
	jXGQNtXzd9zIUKp/daYh+PFRJ9stORIckV1DBKbli/lofRlLH6xdblwprDSrxfLC892V8J/XEZI
	BzP/Im25jR7mb491AgcojwLxdC+p0jPC/hY9mY0Qk
X-Gm-Gg: AYBFou1kcDhjYD7Trhve4Qo4LQQkCoEW9wuk2qSfaw2n94B+WG0vRdNZpr+aP5AUm5t
	xspSACxeWvb4K7sr7FZKMp3fhCyhRvzBlCV2JV/D/fG7ANZQEQj81zs2yr52nOIFrxzk+EjJ1JW
	gu7YKHH9L6//rgiC6RPl0lA8YAjkIp4t+ypTKjDSh1tMVEgEz/URK0CXzetEtEE/HvqhLXiGGle
	PA3Rd+I1NKzL9Oppo23nqMUPY4R4AHX8QIY4SPsFJtIVgWh9Lsff8CUMtUuLrIvxC6MRszFxZSZ
	/LKrXfujL3QNXbt34crprlUJcg5hvRIMOfpoLMyhNXQERTIDkh4Mb9I45zise1VD576wiEYBO2h
	YQ5UQle9mfgyjft1fUf1RywcQnAkDezYfroEZS479a2ZDhf5SVjyilSSBwnWuJyoO3B2fFWumfy
	K26pSDED7vYpvJs1/BVCg2uucv
X-Received: by 2002:a05:622a:4894:b0:54b:648d:9ab5 with SMTP id
 d75a77b69052e-54e3f3c52e9mr4038051cf.11.1793924281376; Thu, 05 Nov 2026
 16:18:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-5-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-5-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:17:46 -0800
X-Gm-Features: AclHuK_4dE4lquzCkniST5LMpFRcRmZQdd5dMWkqjtU3_cYfaK5fa1ffyf73dJY
Message-ID: <CALMp9eRPUrW1kjWcDkM6WVe=0904U64uaOWBQbbhCzhb9f+xnw@mail.gmail.com>
Subject: Re: [PATCH v8 04/20] KVM: VMX: Refactor VMX instruction information access
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:20=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Introduce a helper that returns the instruction information as a 64-bit
> value and adjust existing sites to prepare for a wider field.
>
> The VMX instruction information field is currently 32 bits. Future
> extensions may expand this field to support extended register IDs,
> requiring a wider width. The change provides a single access point for
> the transition.
>
> No functional change intended.
>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
