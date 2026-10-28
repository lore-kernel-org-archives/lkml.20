Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793196314;
	b=H3yOTOQligiiSF0wCPsU5JjiUTy5vMW5k1nwowUAlViwoIHKlBMFR2GMRwAMY27qEIdm
	 83SwcRwayW1ffDGE62VgPfRXOSabuS2OgbyLvgvpFCAVx+ADzgnBt8ocXxbaHhwy6yT6q
	 RXF1xK00fYCpqslYTSJwd8F3Zd9rwYtmfGGuH2FZkh6fEZllFilCykdpTMkweVaBZ6QkC
	 BU5Jx9HhnLpxbe5jFIKeaf2RgvMB5G9KLZGjaoxFVf4wTIAxMStI44n7tCiIHFS9vlZAJ
	 /msyI+wB9fHYjOMbC+k4p70OmnCE9tAnU56T37bWUyOzbo13ikqVw75UdS5rua8fuZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cGXU/zFPh/QfHX0K0nlme8hTRMwERinrVSJ748v2N7c=;
	b=3axxHDPkbiB/Zna403a400gc2pWKYKaN24MOlP08BzsQTHrLno52C8F1JvplOYSsOC9L
	 SFB5CJnl8GnsflCHARwI86PND6kh97iwbVgD0GbikyeHtIkxSzMZE4xeRdEZxf0/ZDfqm
	 e2wChigcRqGlwIvfdpXbiqwBK2eCok3jsDq2oBoIiJ4E/CLvzgOoJD8qMCCAf4QJgVJLD
	 eDpiCabBZcR9wVoybI24IjTw7QxyyFZqhPM2j7upIvaLqqdzIESXKNlov8GRLHxGPJ96H
	 yEO67nnAZmRRVTe2tIkuQ5Sd8kYwEmX3bvjeVJqcszfwii7vz4T0heAMewx4GXmyoOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yhh+Ujbn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A98606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A98606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yhh+Ujbn
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso13606a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793196313; cv=none;
        d=google.com; s=arc-20260327;
        b=chQ4YLGjOiDzU6ciT/4xrWuu+2Bqzf5m51/KV8zvay9yTvtnAEzyYhaqV0MJqQOL6G
         9Ug39KxdSuW/4o7Me1x+U6Nxel2Zo468A8o9FMIkplOtjBD1yOngs5m+vK6NSL7ktLsr
         xCZJQ/pv/xuz245HlGivhbx37GObPJGWURz1l0ndRqS8T3FyeB76bD1oUkpSrydaaLRQ
         bGH+SFIMPLKodDSSHlcDPTZbK9Tu+kknjXV8veHuKpX2MTkWtf9qiNjXUw0ETpwe225+
         kv109haurEt5uzgstcFmiK0c68h6hwgSVqhcTEnNg+0gvLHoX7IxsqmqjsMv6d5XjPND
         DRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cGXU/zFPh/QfHX0K0nlme8hTRMwERinrVSJ748v2N7c=;
        fh=afclie44otyX7ozztYOig5ZIss1pFCbN6xFzCLfwcBk=;
        b=jgZ1ZiUEioq6CFXsSPuKpxXwdaehpZHKkdOqFg4F/M4h9O7vfO9s304geWQXnt6QQh
         rVdWqn0Bj1suHPKmd4zaqiuAuyyn1Q+BU9iqG1bDYQy/aSFCr1dLDY0VLHm2lZptO8np
         Rc1+feWv1PaMIPKyvvQcKXNseQYYoqHggFq2/tDQ3DL89UgwI2UeeySj0CL18ZqyLNaK
         llyusveWAUPBK3+NCKL+YYqOCSdINi7eLYGk/GMmtuS5mh1bVo0CQ1noxhJLWRXJMIKd
         z/G0vGjOVvecyiwGZuA+6V1WJ1Lspcq4iwPstVYuZuydHv/gDVf+ANPKPYFfNvnf9vnF
         qQow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793196313; x=1793801113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGXU/zFPh/QfHX0K0nlme8hTRMwERinrVSJ748v2N7c=;
        b=Yhh+UjbnvCWZnvqiAgMqv2HtaYmX1l+fS5ejvIu+T8UA7oXrydYu9XNxu2r7wnadza
         1apF9YZ5+ObXvlh+6hV04yhVS1Fw3h+X/jIEzuMaQC/F66OG0SG7zMWzzOEr6hyN68mA
         3ifLYbZqAkBA6SIFgWNbxNs5s2gEN30IJBRAjewx+vKPu22SIPjd/GN8pPfGjWjore3X
         s0MpB/YJ2h01VHF7/nP2Tjey6sJCI8NqzrM5CAEqotlAdwpSjsTEfeORoE3w5Mu3rN1s
         IgOPlNzPbm885eFmPaCeksTUwLZBDYi5qzM/wwHP7x73q8rk5zJn1OpsW5HjpyNAUhoG
         lzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196313; x=1793801113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGXU/zFPh/QfHX0K0nlme8hTRMwERinrVSJ748v2N7c=;
        b=OIh7Rb08Zv20tQkZ3XKX7FdYUUPddcwDJJ+IonxkFHnsL3n4AYkBj2pu+lBr+lVSU4
         Vfzw82tp7ZLLNK2T7k4kj42/teKYxrYqrzxk6gq9riL1f2nEm0uEjHMluRH/XXH0ssqp
         SNPcW+NfSea3pArTWslyBVOz48Eb0w4lkzDRBfgMbe3eY1MIIGgXRpL6c+VyBJVxOzeb
         6UVtmqSMyzjyDCVi3beqN9LqahyT824AlPwE/d5gwZT5GWJ8vfC/g1n+eFNRWM/EJgfx
         mOjPQkSyBVS4a2mmBj44HeQ8TifRVCy2bmsOgf2tXnBLSpojZKngXTAH6Q3jKttT1Cjg
         5C4w==
X-Forwarded-Encrypted: i=1; AKwUvBw1xa5BtjmAOoyY+x/cjLDpMnlTZ9pBNADl9x+8uzS6sa5MtGX3nd6joY6BrcrcNcyoDthp/rEdGbTWSuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOU17jyIIKWqBSTO8pt6cuIhAPuZOrKWuKIog2hi4vDIplSYTo
	ezofL1m1SS9VVzu5vCRdW8pUru4BucDAlF6x5b8MN6hwyNSsHnUhm3p+ca76Wu9M0ySo6vVREYS
	DzSAQVbjwgG3oEfJ2w9KiUQbqzJkHtMzBHKPffHFl
X-Gm-Gg: AYBFou2FIzcTHf9rjag76n/ao0v44gCyMadip5TQucjYXR9ktZFwTqTrYQ6kNzJ0gse
	ll570O57I4aYQKZwtCDV3bB6qy1gljjmWUto3krO7xvKSEAAA5bhOGCt0n0ph6sr0jdzMH6DxKg
	dt2OFR87IKHO4L9hryXkSb89BZGTPXytFCfisHiR6pYNxzeTDsRh8stLfqB/zUJ1HJfsXAO6aag
	gRjhd1yPUmQTX+hZpu/5Mt4bUdhSGVF+d1DQkbShPYlRi9YX0+ZQuv3HSeCPP+WtjnCQA97/fBW
	gZsDMfzM/yY87KjU/EDDpoWYoJ/eCb2HRtvVbKwNvz20j8fAtBd+56dbu8fdysmQ8IFqyBh2FYm
	KmMq8/lwVIs/gU9gg8Erz/CIgt6Raqjmgso85
X-Received: by 2002:aa7:d80a:0:b0:6b4:6725:f2c6 with SMTP id
 4fb4d7f45d1cf-6b49c12b944mr57975a12.13.1793196312136; Wed, 28 Oct 2026
 07:05:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-3-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-3-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 07:04:59 -0700
X-Gm-Features: AclHuK_P_Tsz05675NXoOMY2lyrRrl7vfF0oUfpnX6EhSHO04vGfW7E2mOJpauI
Message-ID: <CALMp9eQWU5Nn5QS=4hEbgL-HD43pMmYQfb9y1vnBJnCcrHXLVQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] KVM: x86/pmu: Rename all_valid_pmc_idx to pmc_exists
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:48=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> all_valid_pmc_idx is a bitmap of valid PMC indices, not an index
> itself; rename it to pmc_exists to better reflect what it holds and
> keep the name consistent with other fields in the same struct.
>
> No functional change intended.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
