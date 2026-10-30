Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385232;
	b=xPb7pHdKkBFjyRaaBz4H2mbmOyZGRPIh98iwQKFb0bqHoJDLFasLTo1STPCIKve/gKY5
	 Ykd8nCExQwWvqu9yhg6bar3P5qBrO4DbZbVkmvCxEn9eqtzmxiQrY1gLQlqbvcghROrAk
	 15KBRHL+F4d22+v4kl5GgZLQASvXIibH4k4u6KKU7GFS3coFhvJVQmzhArbo1uww9QUIO
	 wHcQY4AT7sHn5qUH1Qp61RvaeeQ1Dcut327fTVbMIcC/nm3nDmCNpyc4khZzrDkjGSiio
	 9QoMiLJIUi127DKn19woCGAueUfZw/YK8Z+p60iV5Cy4EzSaZpJm7JH/03XoUmHBduw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tcTbJO+0+S2knz+SdPsLwHK3PTtsS4Ru8HZcBW+ib7o=;
	b=RiJBWoG6S3fqlZyupKevdgj9LNAL0rv30/VCz1k0uLZsQniSbTA8wxZkX3KyfF7WishO
	 IeLSFCdZ9TPATcOlEGKmNij2rVBA0UWzhLMMVj4NywAJr1Q4QdaMebC3PhjuCQwKpNtRv
	 dMb3pqgBvPD9k9cM+w6ds9C9RiuSAmvgS9REY4hf6PS4AT9x3hZjyv1ttsZ+qQkIGTNd0
	 AmEXzZ0S5NTAl13g24kLPPPTxf7wVSIeEPY+657xpVrBkuUBslS/IgATR14KYtI3ZqF5N
	 nkSrRR4Q8XfI+0a9PLnQTq1nxuFegDHQ62L7eKAl8AHyB5ANJbrLRh9EeYDA9lh/Kcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YiuMvH5j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDEB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YiuMvH5j
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c45551fa84eso153699366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793385231; cv=none;
        d=google.com; s=arc-20260327;
        b=nZ8B5VlEtN/LNwvhfzKYUk+ZNS97gDY7jUT/IYhKJtV4O3GxCjELQYk9A+FACYQD5r
         3O2NbWo0vqmKAOvqFQhkD1xZnOlGDUteDUpJXxXevmexDazU9CjRqOvlM6CozjzpTufE
         bpHSloWMUZ3jVZa5YWk8zKTFpcvcfc6w5Qc8NHXPpHTi6GZ20cUIYypaN/fLIaebyZSL
         UDRV0RbSmJlp/1gXmrTffP3j5TZip9z42f5V589k/cK/JenujCef+gR6B/Hyw/4Bl7Zo
         RqRT/dv7malxjeVmdyd0W9P+BlRHVWD27YSjcUsy774nYMnZBHM4ZQBqahO160+7yni7
         MEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tcTbJO+0+S2knz+SdPsLwHK3PTtsS4Ru8HZcBW+ib7o=;
        fh=o+5hL96Eh9MUnjxrFFOhRUduuOGlrnaUeCHEDBZwTag=;
        b=l6kg0WM8gRk2kffK4wSflb5G3CcBo//5qt2YzgD79ITdNdwM8Hje7ed8mW1a1GGsyG
         ppYlRQqoUA/uCyT2+tu43ns07/bJhsjsAUnk3CbKsvh6OT7VRWekuKcSaUq914q0L1my
         +zV9XAFyfyGmWtBg7WUvIeq8WPLkYS055M7qfLf8QoyiUxgoNSO+nz2NLBJPthWkPMZH
         plwcv0qFV62wNOZHZalc+fwxk+JahQKQUA9vPqVYWRLrxPub5J21ILAQBu7VuNmY8l4b
         V3QoTctBmAGPTDa3dPYJ2X+DvAYUZA48rQ4lybcGEPViv2S5Cb5e3WF9xW7uG5WoCZB2
         sEUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385231; x=1793990031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tcTbJO+0+S2knz+SdPsLwHK3PTtsS4Ru8HZcBW+ib7o=;
        b=YiuMvH5j0xC7G2dCtE+dqBWbjlFnD9G+5HJGKQuFt68uQ7ICAq2rQdX2qodCZ9Wt6Q
         BjEdWejjMR1maKvxtfSAuX4GfUPvY+5DlXMdOW8aLsTZAgLZdrW1VYYYQY6df0LHdaJe
         tAb4ZgczqkxiDv1DGWcNtvTCUPwKUaOc3Xe06vvfMvr+VV4CK5wTNpIwKn7ghtMvh3wC
         Bd/LhVcXoGNnx1nDr2qvAYMCwT7zBgbBvW8J3mo6hUaNxUdb44Ry0aNe4ksnkRD2OeZ0
         v44iVgk5HXDmtx/BHf+qCJTbqmo3mwsKzx1BnDROSJmQ57B0q9EGVQVGAQE4X6KADjji
         eZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385231; x=1793990031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcTbJO+0+S2knz+SdPsLwHK3PTtsS4Ru8HZcBW+ib7o=;
        b=GjjxvHosbCHIjNhJ+drtI2UlsutZiUjIsiif/KV3GRLQbfZO1FmUKi053p/HLeOFht
         /PI5l7vqAHQMPsk4pntcLtoPhvjjax9R5TC5AYmUSEk4ryW1c1UxbdFdJ5Sdyq7Hudw5
         frkKjBjywluGd412LJ2jlo5ZxFXL1qWOgUnsviSyiZVjt9rvuRfjsGO/l9GTWDEoDBQ+
         Fag2w6BpWomSw9XrGsRph8Hq94sdCQFppEWOZS1h7YHcjdTTq8s/C1RxUJrhWRiAfLUT
         RzrEHM55ueLHO/ois1y2GiUedlqcNKWibUKkY8A+XSG36mabveGx7lIwvb1xJfFTDrO1
         Bc5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw96pzrJmaF/LGku02FRcR4HPTZxlfoieA0q1CG1xC1o3fcGGVkDLZ7MP8jlZFBGwzI1uJgilAZgoRzFVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPW15TECkEDpJcCEcw5HtgWcIsJyCQ+VosGWBMI0sMAFwBs8fk
	QNsitmhUaN4JJCNMNHLOtqKbJ3EQt0arod/4pl/bf122Hou98CGk8YK6qOSdS4DYKrcqUfJm4Jk
	ltCKH4sXnttvutA1HNFQbun8boXNNwCQ=
X-Gm-Gg: AYBFou0tOpUr/DREiaTJaFyDBIS+g2gaPcz/TWkqzBYDA/3wWMsD1NYyYIdXPsGevzQ
	wDcvubh35olwo/5KADKnQQcq8aoAV2L0//b6UCuO3R8ARMJZMhYzDMQoipAtC6xT6FuOhrmNMQ+
	2HI6kKTgoa/Csg8SxEM+YKCYMAfQSYfUhu72/7mPIKCQZoafzoubC7K5GR4Bu2m7D9g7NUWqGBh
	6DAU3phzBBsGEPHLduGQfGXFao+mXWb01Nm1wf4/ou97JtIq7EaXCCpQzuZcMxfMVG7WQbj9RoN
	5y0PFxc7kcMQm8iDv4tlNCH2qbZFhzXQ0/gs7Afvx4vX0zie3Jusl7ZwYV0bbIGX9kelwwUHOue
	RAprSwPtXASoF+TsAUexmjKLDER3xx4rwS+iLrT0DxQIvXX36E2GynwpC8gapH6hYIIM=
X-Received: by 2002:a17:907:3f95:b0:c26:1648:a06b with SMTP id
 a640c23a62f3a-c4ca7a96a37mr288415166b.38.1793385230667; Fri, 30 Oct 2026
 11:33:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015085326.340074-1-liqiang01@kylinos.cn> <20261030-almosen-kaleidoskop-alpinsport-aa25b8e28d7b@brauner>
In-Reply-To: <20261030-almosen-kaleidoskop-alpinsport-aa25b8e28d7b@brauner>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 30 Oct 2026 19:33:37 +0100
X-Gm-Features: AclHuK-rLe_DQTrVjURbbB-BmxTRRZ60mDxXPOCkV58QW-hcxW62qhsY0ehUl4E
Message-ID: <CAGudoHG+ofOUv43u8MD3NX+cDE7Dq67iqnaRH18S_XcrWbrgaw@mail.gmail.com>
Subject: Re: [PATCH] pipe: bound new-page copies by remaining iterator bytes
To: Christian Brauner <brauner@kernel.org>
Cc: Li Qiang <liqiang01@kylinos.cn>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Oct 15, 2026 at 04:53:26PM +0800, Li Qiang wrote:
> > anon_pipe_write() requests PAGE_SIZE bytes even when fewer bytes
> > remain in the source iterator. This causes copy_page_from_iter()
> > to perform an unnecessary extra iteration after copying all data.
>
> This is an optimization not a fix. copy_page_from_iter() already clamps
> to the iterator count, so nothing is copied twice. What you save is one
> kmap round trip.

I know a guy who promised he would write the patch to avoid the
multiple SMAP trips for read and write side (it's not me).

It is unclear if the thing will materialize, let alone for the next merge c=
ycle.

I think the patch proposed here is ok enough to go in regardless, even
if it becomes obsolete in few weeks.
