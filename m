Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793705880;
	b=HgpdYFaFnJllgCIVGCGyngeLjBHfKZcHtW908i985KATX/6uoS6hIZPeYPIUdScDZeuJ
	 sXel1K4pn4ty77EPD4r2ahhJFD8nu3wrGZwTJKDE/6d54MdJuUV16xgyDmZi2ItcThzpc
	 fz0HrJ3CSECYv3fb1qJS5VYeiEselxbetiIDbXKqEd2quCQmbWpHZieUdi+9x7c18v8Fg
	 KnHLkGl3KC1os4ylXMl1TgZMkfSfAQNcaTHG+KN+obbb4CXRW2dMAK5RNEAcFuyDi1CEr
	 h7+gQ10vHpOUBpmW1FMRPeiZZa5xGNIHMk2t6k0oCYGcK+8bcgCRIjXyFk4xYNeETHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
	b=2OkUS0BbvRYqOFreYzSQ8FEI06MtKd32VpXhoS3t7YeXlXB2f9RipVwcv5pneCbPLfE2
	 ZzdP1uzRT1YnXdu+17gU6D36aHylewhg9AKs+t/ANDLRQjzjKf2txYOCx0ldYdiK4qKSq
	 f1EM2JnwCqD6gY+sP3SnTlCsxJcTmfjJh5EMK9j7XpZ8JDfSz3MoJrPQ3DlmhkOWJKWzd
	 5QP/swYX72ohGtPkQmBog7ejkg51QfOGzTSI4TIoejanQwhdBEFlTpt/jStgBEuYFkMO8
	 nuURitJyHNc+Bv6vWYocPWR2dobwdrceWdqGgEUbxZaUMYQ/+86BmrMhqVEzB+eNDxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WP3UI+8B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E89606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E89606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WP3UI+8B
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so8392665ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793705879; cv=none;
        d=google.com; s=arc-20260327;
        b=iKENfwfQL+PG+6Pk/8EyorM4J0Y2kaBCh3ZPWeJ6krSwGkliaka4mIYg5vnsENmrE9
         NdGjRjyMkJqsPggKDpMcWwyM0OYpwC37MeaU+P5Q+s4rnx3t9W/8IVjMddWiyUBbIDVl
         nL1NojJLiNES8/Uvy+8vDENVT6RUcRY7qZnV1Nd2kvVMtEwXl6v9yeS4miWuaw+X1vww
         IixryEy+fHPZoPGDfRb3dXwGUGqhplr4AveUTNX1St+gGykcVg1V8wt0JwFyMHitbvxB
         85Grln5uaqwspyvGzKQt08nFGe91sziCRda+gj5ExEibgAJWyivePzl8h57CyhxPV7Mw
         JHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
        fh=uA7q4jyMhKw0531xQLvZLoNcNNv+e9vGVOynmbXHHPk=;
        b=jPC5wfHBE0MQIt1VaIm53QR5CyoqQk66YagcmQUVpE/idJZvLuhkj+e2sQA8AlaQHH
         LgzXRcHcubN/CpHTo1Vsj8Cf38adwRMTVKhTdpEnZKRpmB0FsSDmb8aNOwSuBLU7nVeh
         mZ/CFFaw+v63TQyBGCw89sHrjG1XsS8wPjW2i+Eo9c9kMDWHQXeKU5UQcfnpsCiY/Kiv
         ceFbTsjvaisUO7Mj384RpnePS2c7uxZdLLA6UQGkoQzX/qJCC/phwuHxeiSwMAOky0yp
         iZr+xKxSBkYAOKuaRZaxbxTOlgEUIrdRRbPWBkSeHWDr22Y7b2woIvgCohclzJq32K59
         +b6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705879; x=1794310679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
        b=WP3UI+8BsHGl9aTBu+w7LEFUJBnmtfgg7/jdcLdhAXj4N1YI75wsuI6+fX8Gg+ocSD
         lPBTpkVa90LCDn4Pgr5wL9teswpO6rgGZCgFB35Nauvxr1A2/TbRCnPHMZ4CBlgmaWh0
         OJudTryF9ZKukrDWGaoCiMFm+S7WTXXGqATVk5Y3O7aYSYK9M+R6/el7uJrKKM7kyeQN
         8Vm4JZby8127WQCNQUs8cfK7f7nTnw2Y/3Rz0Y9Y1NMF/DsNqOQPbDPQDRu99AaPQCRu
         aDABgWeAoMrkmXFdvx7QBvbEKOoIleyQ7eJxubf1TWy0/eg1X5R1w8S/LtkcdD0QpSyG
         prXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705879; x=1794310679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ox9VPdNe/5nvNwvY5JemNTpyw3tSN5sVHQ5SBOK6/8M=;
        b=zsd5Wc9a03i4KDJPDLdZrZ312zXeMqH45wjxQe9Kb/FXzDEm1nf9LDR2Zr5taPCeL8
         VQMn5bDHzYIE0MGS0Qi1ZL5LxX1zHhrnOJXmKsTLZ5w9tEhDSN/DsXLxGxb1T4gaIDUC
         tjih1Jtbx7xAHeKw4lcbV947wG6tZ+E1DYc3RM09mePc3QPf9bWZ2lKq6bI8LHTNLhBp
         whvolCTKtBDEaW3tyWQlFQoE4hhAZjqL+ELkuitXsHgmBATIAwvWfIzw7/i6gH/fpBwA
         63hIyNm2yHCy7zndWAOiSrEXGPQltoAiEfXU+RQPJC+n6Mp8nlTy8hk2P5tCjkwQw0ga
         fh7A==
X-Forwarded-Encrypted: i=1; AKwUvBzHfml81gb63oFiLvkdUK0b1a9AveGzI66hGIZLkn+eYylTdFbJ8deulY9jlJ6gKkGmbrd3cG1Fo41Z72M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XyCW/Fhao185Lmb+QSEBKdaM6eici95jRVwPT9CKZspbFfaWi
	2Eldfgb6koS+gZbz294TOxQCG+yYzrOl3wXIVSapVc6IZWnxWwyzqmv0LnrWwSYUdNwItKgFiPb
	3l+R+J7TyJhloVLqrR/W6qQFlZgTmHXk=
X-Gm-Gg: AYBFou2tDgJE0Q/IEYORHURbwF7xczz/rSE+VuVYj6GKZwCXPxkHvxj4M7edL0TXwg6
	e43Udwa0k4qWSiW/mJ/q1dw6cyj8RB09fdam7f6FLmvKndP/6cO9cd0YrifXUsG0cDw+zVoFYES
	qtrvM0nmzJ2K2Y7ONwIYufOaoGdtL3u2mfpDLDn+NV+JDgnzDys56KRjJo/hSAEPfxZO4h2y1jR
	paVuTh38n/5ybU7dGk/YIs5jDJxv3FNxtz1oVl3BrdkspyZMEr9mDGDn7zp2KEmq+Mhy82bQL3F
	P2unk6izIKZtHr1dtX03/pmVmPj6yyD8HxYb+VRXjhSIw38pfWYJ9VhFqf0f7gClpIMJUtFU7bq
	jqOLrhl7S01nE6AFzCHgujdyBUitUskLuPQZpMgbD6WzJWpk+STEX2PrFBsR1kEqL12wF6phgIS
	z4cCAMSsHX+34g4XX69EWzfGWSDTrVGH0y+rKv8rmDHCKGHMTfbfR8xWKKbylvHP+/0ttrRM7/n
	f+F8u+esaRKRjtgwRy8BcaP1fc5AtfVkvWh
X-Received: by 2002:a17:902:d501:b0:2e9:6468:1ff1 with SMTP id
 d9443c01a7336-2eb3648bf2cmr192226705ad.2.1793705879368; Tue, 03 Nov 2026
 03:37:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com>
In-Reply-To: <CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:37:45 +0100
X-Gm-Features: AclHuK_NW8SW_bjub3r4YsgwDQ-uRt3rX5_H7c3gsxcyLDfpG0dMRGLtAyOVWec
Message-ID: <CANiq72nNFLKhywoDPRmkeJSwkhQACaZeB2SiokowTOE6a6rOBw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: test drop behavior of Vec::drain_all
To: Peder Bergan <peder.bergan@gmail.com>
Cc: dakr@kernel.org, aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	liam@infradead.org, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:38=E2=80=AFAM Peder Bergan <peder.bergan@gmail.co=
m> wrote:
>
> v2: Split a long test comment to avoid mail transport line wrapping.

No, we don't change diffs just to work around wrapping or sending issues.

Instead, please use `git send-email` and `b4` so that you can send the
patches properly.

I see you used `base-commit` in v2, so my v1 was outdated already --
that was quick, I guess you may be using the LLM to send them and it
decided to add it after it tried to apply the v1 to double-check or
similar? :)

I hope that helps!

Cheers,
Miguel
