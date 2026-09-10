Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A459480C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066820; cv=none; b=fsVPPkt3L8g0o7++Hug8wbwGFVRhGOxp2WmTuh8nLCF4rDmOzGklkefBEEik9B+gMAubLQ8cTG1nM2jzgcxafWztHXp/XZ1DjLAMGo6uLOkrlsu8ZNg94b5EO5BBcShjQsDn4QUbU8ij//QZGG51avj4ObzhkvogGVTOJG3AVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066820; c=relaxed/simple;
	bh=0vvZwREGhVLOGIz6V7/e3vYEdb98WjrdXPg4bmpdzmM=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=eqDYUocOz0uT+sif201qCeuqEs/qGwAtR4BmgGA07K7EOmd/wCB3CxWrvfRQSp11fbY4ypz4ULUgIT3hfxp+GBZz1cW8fqCQobm1mMU5B86OQPAMdJLPRKQPCmBUlChbgHt/hd/cRqktVUNbYxk/F8TBpUkQXRBRTKa08Byxfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KfUXvnD1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KfUXvnD1"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5300bdf61d9so1355961cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789066817; x=1789671617; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy7q6C+WBEDRAlNlGjV9EVm7qH12BqCcTHIyf0ThSEU=;
        b=KfUXvnD16lizCzF9wvGLcS2je7B/yEqIi9sboIHbA1cMJ+emGPxk+sSiCucig8SpXK
         hYv3/m8+oYneYZlQicJmBZfZBqM6aID/qplSJtPJL/Q5U3GHW6Jat3VX4ypsnLkafnxg
         jkelDKYNQTbL2awAL4/xmSnPGgySwJ9KjipDv/S581d4aW0sNobZQVJuOSw6jvrFwAL8
         5o7orzIu8kaSOUEw3aBSuMIfjcrorTOYzxAO8BmXf1XitD4t4xG8M/O8K6PF+fK4AMWj
         Xsu1ZTknwnfunmzbay0cAuhsVOV4vuGJHIH7F7IH+8otWPTFga7D9poq/fsUmz+gcKrl
         USLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066817; x=1789671617;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uy7q6C+WBEDRAlNlGjV9EVm7qH12BqCcTHIyf0ThSEU=;
        b=lucM+pHhFvmAsaOdKWvmvy0U+PrF6EeDHxK+iiWY1y7O79tpm/dkRd+6YDncjHofa/
         2qn6RN4g6MrGKsAX3Pprh/uWVB0GlXf+MejhrmOVCqheGpB9WupMvkt7x12v7vhlqphB
         LYMyaQ5/TS4FdLdI6xYzbFShzcZ6qrC5BCYNBIVbn1dTRNL8Afptt21aUByJ5yaBNnS3
         S/NfswpcDWC0GSu9AJOIcsIqN93F5GN1WE6o/ISupthrJN7loQxoSd9C27+Ah8Ch/7jx
         zpaavj+2DUUZ7E/qlIE3PjRuoG2/wYCJ/cUJS68ny8iAGHxUlGa+Btb/NXCL7nGqYteQ
         sHlg==
X-Forwarded-Encrypted: i=1; AKwUvBxD/8St5q4R6ceRwghOPR7uFuaYl2KkaF8XbxPUAymHZFTvzkIwzSRuI0XQFcLLagleBP3hUfm604JGnSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ljzwSK0nw2o7fqiFGJgGYim8cp2eFaYyuSY9BdRSJzCTbQuqmM
	noc+rfT9y5lmjcHGOT1mHrCb1CdOgLX/CmER7NLCjA5K4OBFD4Hd++tfKD6slAthZg==
X-Gm-Gg: AYBFou3BbckGpraa3h8FYj8lCiqtRyFqxOkO0S/Q2ZifCQNyWbH4KfWH0QjRpU8+IfU
	ZbPOgBL41P3eJ5DRUrMkPvsnff47Lqi5ZC80TS4Hm/ouXiZHawxB3rj4AUK8rwia8Z808DILD9M
	baPgmcnT1jaGyrY8e0/XaCaA/GAygwJTcgZhvY3Rm2ea7NbhAsPHQifmQ1oWvoPeOEXyULTxHVX
	/rIpj761yc1uA1NTaaJyg8OYNsfHMPleD09iWUEas3ZD8wE/mA3R3HxgX7EWFj4guNdCcAzUhwk
	2xE1v0RZ4Cn0o7EaCZMTNL0QJa4CY1Xso2Ur8mlumAoAOW2C/1hbC9Yy6sYv7hbH9tG7uZgw+G8
	QOh0uxiRukiZUWZiI8MccziRH9rJ2rGW0vZb+ymeW5Rs4lfyItR94sqTOp0eEdLtyMF66ZwafCv
	IkrkqxuaUqvAtChFsq1aVTyMfZbU02f0ItZo3Y4SN/j2tK/GAe8XqIpJ97ZrUGpYPRLzaqocFmO
	d8Q42GhHys1YoCXQJbsJAtjar9x9Iz0ucjZkCCCrpuTgVyk7Cdp/IlAY5m3LGhx1yX0vZ+ASMUM
	hg==
X-Received: by 2002:a05:622a:514:b0:530:b2e4:91bc with SMTP id d75a77b69052e-530c878ffdamr12092271cf.53.1789066816931;
        Thu, 10 Sep 2026 12:00:16 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca50cd05sm270221cf.29.2026.09.10.12.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:00:16 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:00:15 -0400
Message-ID: <f7363063f6457ebe9eed74f878ec579a@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260909_1743/pstg-lib:20260909_1550/pstg-pwork:20260909_1743
From: Paul Moore <paul@paul-moore.com>
To: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Nils Lehnen <nils.lehnen@proton.me>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with  `pin_init::zeroed`
References: <20260828024335.946-1-nils.lehnen@proton.me>
In-Reply-To: <20260828024335.946-1-nils.lehnen@proton.me>

On Aug 27, 2026 Nils Lehnen <nils.lehnen@proton.me> wrote:
> 
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
> 
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
> 
> Link: https://lore.kernel.org/r/20250814093046.2071971-8-lossin@kernel.org
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Nils Lehnen <nils.lehnen@proton.me>
> Link: https://patch.msgid.link/...
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> ---
> Resend of Benno's patch from the Zeroable series [1]: only patches 1, 2
> and 11 of that series were applied, and the issue [2] asks for the rest
> to be re-sent. Rebased onto rust-next; it applied cleanly, and a
> defconfig build with CONFIG_RUST=y and CONFIG_SECURITY=y passes.
> 
> Two equivalent one-off patches were posted earlier [3][4]; Miguel asked
> in [5] for a resend that keeps Benno's authorship, which this is.
> Cc'ing the LSM list per Paul's request on the original thread.
> 
> [1] https://lore.kernel.org/r/20250814093046.2071971-1-lossin@kernel.org
> [2] https://github.com/Rust-for-Linux/linux/issues/1189
> [3] https://lore.kernel.org/r/20251129135657.36144-1-atharvd440@gmail.com
> [4] https://lore.kernel.org/r/20260120083824.477339-8-sunke@kylinos.cn
> [5] https://lore.kernel.org/r/CANiq72nJqFOR9vhPBfZUNrxU+M1HMV6wN9bN6i8e9rf_oOD2qw@mail.gmail.com
> 
>  rust/kernel/security.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Merged into lsm/dev, thanks everyone!

--
paul-moore.com
