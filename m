Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F451C33E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699387; cv=none; b=lw1KJ1loKtr//ELrl7DEZg7ongmyvRX8ly3BLOGAom/VJ+7HHRFycYW7i4Uj0ybonpGvNqGYj9Ge1IT+DxKz47xLHaG5IhWSrSJg+ssJfNxHzDV5cwF8H7lQONI5y1bMIhaaMqNoLs7VsSzGRl0lmTxWpOSIWJw8j5xg7+ncPWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699387; c=relaxed/simple;
	bh=1v42kf6QbSA3YM4j5AXbRMkgXRvycLkyiH4QtoAzOWM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=HkQb7xKF+90PTXMzF574JbRQdhr38/Uk0mExXzsOGhdql6jMStyRZmxun3QiLfvHECEuzDgIiR2xTdwwxbA6mKoUZXLL+ftGPJxbPjBeZfGgo4gr/SCuGxwLwfUpLKj7wCpFSFdX1T6RNRoo2rg4rxDRcAWuRLrFeUBCgM9phLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6xx2Tej; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6xx2Tej"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so2002398a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699385; x=1791304185; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5gmBRPrdCcT1/ykMZonXArmE29LxS0sCmqHY0q+fG44=;
        b=L6xx2TejdRqIhaBrMBIb3iOcbTsSSHWSDFs4OCbNfSBPxKXKZXh9T9erFgbQ9iJYws
         VVvau+elTqmwv1S/n6WNBbzLZAyRENxuZzxBzE/Tlm5ez/eTjf+400gdvuQoSpUyp0rP
         q56037nOmS49ZdG09AaforitURhLYLCyasQ8AJmC+6gp9D7alAtaaFqWLP0FGzNTlFME
         WylL/WvQBlkW9dRpVKKSZvaU67xwbp3E89K+qUACRTQhdh+/KO3Zqzx/qw0M29aNtc/C
         aRldIGDeOOjr+B6mhe6nb+QLP71NWsQUl9+aK1mSijOeI6oOZXAXY65YdaDs9fpQ7lsi
         MW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699385; x=1791304185;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gmBRPrdCcT1/ykMZonXArmE29LxS0sCmqHY0q+fG44=;
        b=oyp98M+FUVY1ck4JqfEFhEE87G4T1vYkF2aP9Ei+42bu6lytIoV53qHN5mX6g4HdX+
         RDIeiFhrXxXvh5+a4UHe3nH3SV/uwz6qdNxgP4dfj0zgnYulUay7hrbX8BBA6bXS4dlI
         KJLBCgnZTNHN6t172w4SN/7MgXicBW/Bd2ylVtjvudDlfyoOgiuqjVP3HlhHDlF+yX7y
         NiMVRPRA7uqqhU7M3GN8R+S0tz0Z5F0UBv7dCQ+FUekma7MR92jhcg/qVL9mp0gxyln2
         ySK3l8eLoh4DpynLizkk7PFOg6mbKMKVq0JnnTL3wp+tKE5AQSeOjyEhjDVLXtwyFdek
         JDAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2sJZka80bY0gOS4FKZLoZyXmPWNI6r21g26OBYwaB0/5TzBO8X9im2X4TVwQ4Sznjd2CF1GgRw7DL7C8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT6+8TLKzkyQP3Zc+Oa1y9sAw8RlutrNHR9Ke4s2M6H9qmjFlc
	K/VD0uEfoKAETKfC36f7E78+yl/eOhukZwvpELBPEnEg+fCfq7IkUZY6
X-Gm-Gg: AYBFou3UsuVRMSaxJg2XVQ6OQ0s+EjAHRHd5Fm2HNwQiremFGrHuwdjViPc2N1Nbx50
	S6lf070xgnI584TbBy1MNyJ5jOlN4+GK7dg/VMC/5YTySEtPacCuBwlMElXA72KAT4DhFuYHKV1
	RZP/8yUjATDXo8Mnea/mbgxfHuEG2avQM5YiUMxPc9c9MMKuUvo7icITq/no5PDXQeGNznnk6Zw
	q44uOQW7cgGrcjPPK2bz5Em3NZdyeUUf82FSb4VhaJnTfFzrfyrtJUlrYtfSXhrJ/j20aLJUMQx
	UMsq2mE0ID1zlEej6C9+6xNhFPdmIXzwpcsbzgjq96v8d5vdyUWQeA5S+9uJ40XRsMyNywc9ikc
	7TXKCXpKvuPwV12gQ+kya11wTndOZ2/68ME1DqPSDFG3Qpw+5J34Jfu9jGj+VV9yPKz0bAs//sn
	trm6ASvYG6MWaeEVbLfNADtaYHSEljGc6/1UieViMRG+qD8xJyLzsg7XRowmOY2MokC+mjC50oO
	T5Ar+QJyzlfPFiPU3oRObxAE20hs9HO1WS7PleLRgRjZBWWiTEDuOG05jZDw7iUDnv1Beru/Qrz
	kys=
X-Received: by 2002:a17:90b:4a89:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a098fc84eamr14040423a91.62.1790699385067;
        Tue, 29 Sep 2026 09:29:45 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498596aefsm7239381a91.6.2026.09.29.09.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:29:43 +0000
Message-Id: <DLRXYC55FZOH.3CRQ4XBJ7K3CV@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 5/5] selftests/bpf: Update DENYLIST.riscv64
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260929083924.1851840-6-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-6-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
> diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
> @@ -1,2 +1,4 @@
>  # riscv64 deny list for BPF CI and local vmtest
>  exceptions					# JIT does not support exceptions
> +probe_user					# kprobe hit in trap
> +stacktrace_build_id				# kprobe hit in trap

stacktrace_build_id is already in the generic DENYLIST.
