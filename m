Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230928;
	b=CQNGmvi+y79irVZ+78+zcsuMbp/GMZWzNANs6NnubzHHVlqTe9IfvzhnasScuArJ513C
	 SGMGAAFSUo10xW9cyYZbGu+/2YsedZmFN5EQ1soYmzYLrvOtxArtr4Ymgy+Py8PCbDkeN
	 DerI/+M2OfPQc2Yz6e9NnzvqOelXKoxJkcBL7qJGUSoZ2h8o2vFaJRhxgjQqvjRyXW8Dv
	 HYckz7EVvwkijghuHvoNlOy9QRriC+MJDt/4sKNzFmad8fZDQwhb/TrcLmFkQl+bKpmSh
	 4dZ/G1tEJob9dr1NyAYjlu09wMWEZc6Y1QX6VsfFTpMIKFZdRrIjqap7ZL9G412GPRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rsswYF+09a+rKyP1kcfLJoXu1lPtWtvOWjlekD34MxU=;
	b=tf4GLFpZXqIXTaRMt/S65/0f7fW8O/ELqWmQUu9mibWEuUMaBvJvzp6YEyyEFShPPDxa
	 tj4Alyd/G1c40FTxK+4P8RxA6X3Irzw+jg/nYEM3gRYcM5NeHQmOBPoDS5F8Vf7lmZS2S
	 wlXk0gjsCKpUG1jhorcPHsKbOdha6/e1mVwblCTD4LnFo83Ln45NlUA8XPNXDkypTrOxv
	 UX93wgX+j8vRe6x4UoREbaMOnKaK8BJsm3Hr4EPt2Ctn3ybriLntFalfnJEtfAVCg+zHv
	 xcQiQRINrCiCYmIHAXjPmaWG1ag1hPdVskd3hz07tJtqzRDH78RKCxlsdF9e4CUbadg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2PFAHXV;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45D9606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45D9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2PFAHXV
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8634735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230926; x=1794835726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsswYF+09a+rKyP1kcfLJoXu1lPtWtvOWjlekD34MxU=;
        b=q2PFAHXVc+qNSn8OFchCGNzLImP53bGX9+CY9a8Kj0gIjN9u9C/YHGrLURQqvnPz5O
         aYyEmxlXRfZeKhc9EfbboBdPCSU0gxrRIma9vyDqInwuKvJ4Hfv0DB01lJIxJNS6XtqJ
         p0nCs2L+V5cy5m8WyvXKrfoFZKsZloZ0jxREaXC/RWDWa0pEmdmmvkHbArfcEHF88LIR
         ZNJcueXbCVEVd0XOoHZUziWP817JHum9ki5fIhQ5lLVM6R+kwG1wEv5r4Qffd9qUS725
         P2s17QJS6scIDiHJWe2/dbnx9cxw6ZI5vChsK+k1UxcbB/L6hRY8Ird58rnqqKWQv+1X
         x3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230926; x=1794835726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsswYF+09a+rKyP1kcfLJoXu1lPtWtvOWjlekD34MxU=;
        b=CTk1+UUZkKIQhpRGwgfrS3dMeCgB43d6+oFNax8lTeMEKU6kpiZQHOKMOltkbx/PLf
         GEvnfKCn4CdCAw1MHDldu2+sxyFyFk78pwbp4elZp7LxBW4zOr3jCQbt4y6ObAcAIiuT
         Hwv/NfLWKHvs8W+CZBkzowXNRY6RiaPYRdBvkh4kvyBueqNmf5yFMAnHVUoP8j8aD8/u
         /sqaL/WoXyBZnOVAdeQn73Nlh6KlnRfenGxaedtqRe7aHRJzp8zOK4R7BVMXp+VpbKwh
         +fIMeJgLOTQjpZzANKIsSVhOCZkYneRLMV8d979KoijPlrakQ77TWwhbz3y5YaVs6PKO
         VcuQ==
X-Forwarded-Encrypted: i=1; AL+hErFipuIvNyMLy9kVH9IbXRY8UwrdNQe8YWD3UAQamw0CEoANuV2LElfbQR+8W+HN9ypBrzOcXb/09EgsN9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Jc7OtYYYX4bEkjG5TNcio7FxM33X9Q1mVDKjoCLi9OFmreid
	B59ZBHXL0rUeGLEXxqcABamCY1/sGeVzUlnGCanmF9DDCNUXf6glxQGF
X-Gm-Gg: AYBFou1Tm2i9FbCvV8ocSF4mQbrO5AUdznzgupAyIwaOHUbKmckqqa7T3DYcYFNm2KB
	jY2JRjlGQp6IfeS2nRXLDBFf/x+y3iuXb5ugMr3MIkVDtSHDdNXJ7Kn2gA37h876q1Kmbkg6dgs
	8W08zmMu3otfnNTN3Pk1+fL0jWXQOWGknL5wSL8yJ+Gl7vuIYRp3f+4PKdiyocdsei2NDUXB/gc
	PobvKfd44GS5Jct4Z2JdeYhxRnqkzkJp4axaFR+tALNAQcjpi4aiZRQydRWtbnjnbXZcQWV0XEP
	awGyo9Xxigmj+a++1/255Eq1k6gprMQVRRdcN6QBKaL8Rbvg8fiHXIB7jmcruCP2Y1E6VJZOXzW
	d6holbSv0mIHaozHwzA8TSC3shLkpG3gCZmvz8izjm7iLNC+b/ZCU2x8FGxCsYsenJ4OLqA+xUN
	ITvpMnO/Cfh8k8gVp7kJcxbuRd1dyIKu3Ed/SyTSEmUU2b0pMQsIktWUc5eQso/rTMJWJd27+jX
	U0k9PFh4WhxQom2YO4MBOFp/2Yxz8evVoX5aK2KqPhF24JjUVWqUt5uk3AJxJnrqqnDNfJDBDpD
	SgeMehQx58j5gk4L+CCUfL7owkCWRAHQoR35
X-Received: by 2002:a05:600c:4505:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4b963c85de8mr77785245e9.33.1794230925937;
        Mon, 09 Nov 2026 05:28:45 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm282951965e9.1.2026.11.09.05.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:28:45 -0800 (PST)
Date: Mon, 9 Nov 2026 13:40:19 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, almagui@kernel.org,
	john.fastabend@gmail.com, qmo@kernel.org, brauner@kernel.org,
	kpsingh@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, sashal@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v1 bpf-next 18/18] bpftool: List and show fmod_ret targets
Message-ID: <avHNQ00KldUBEM29@mail.gmail.com>
References: <20261106210314.1767267-18-a.s.protopopov@gmail.com>
 <148800382a0df555432654e0021a940d6bcd283955b5e1ec88ba885d4f28cfff@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148800382a0df555432654e0021a940d6bcd283955b5e1ec88ba885d4f28cfff@mail.kernel.org>

On 26/11/06 09:35PM, bot+bpf-ci@kernel.org wrote:
> > bpftool: List and show fmod_ret targets
> 
> TL;DR: Nit only: in bpftool fmodret.c collect_targets(), the
> TAG_FMODRET_RETVAL lookup may be unneeded, since the only caller's list path
> doesn't appear to read ->retval.

Yes, thanks, will fix.

> [ ... ]
