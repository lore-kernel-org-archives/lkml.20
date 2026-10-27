Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131528;
	b=ZCs/CAIg4weXMxZhlVC3yZ/bG5RuZIHNaHCIWaZfOP4wa02+0SnnsWUHX10shenZK8MQ
	 2ehb9IAAGkawKYmZDtT31pGXwT2GzaSdwxuBSPOO5xat5LvzRrN2op8pz3nkqvFWSK8Ub
	 OdabJd37kxChJw1sQ73Qz8ICxqFfvocQgzcXf49F3ER0ioYRT3iey5INbx+zNKwtltBWL
	 4/4qt4tTRGRu9+FGxD1gm6jqnO16DYbxvh9ciP2ZK463raBmLxdgs3N5zE+dLJz2O78GT
	 bqjAo4xbRBbU95oRhXkbCSIcSR79uK+bt0Xzxtc8TIu2l+KR6KB2qW8Q1y4UGWu9nyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a3lIrKPVMhtRYL/RcRw+WlUdjpRNkiI37olf2kGdOFU=;
	b=tIKeDXOaFBSkFwid+IVfJhDW60Vey6TQ0R1HKfYvfOe32p7IjM3Y22++DR48grXGyqpa
	 J44s0ptFOfLrg9y34zCdy4/kzySdCngkHQMjq9ThpGdYpQguGrXtvNTZ/0WGo0FIefkMO
	 ygsTugJXiXGcd+wou8s6yBdtsWw1P/dv//HmT1M+cydqvsYairOg4OkVFOMzH8KoLR15t
	 FV3DYAwYAU3Fxv9VQZahrKCFQKkDXok3GYnqxRM28ypg9170q6DQP5Dmk2gA5ThHzu80X
	 md8EPpndN9ZeN22U68uzFBjforoRzlgFqQHkD3qhXiEkHQ3+eKr2LQ01aJqKgshMyBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkMo02Ne;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B6606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkMo02Ne
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso2097055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793131526; x=1793736326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3lIrKPVMhtRYL/RcRw+WlUdjpRNkiI37olf2kGdOFU=;
        b=bkMo02NeshJZehxlyTkm7Vh6wE7v5e1KNCLXBGG0i8eQn/wEM4WpiXJ0HpxdGqlwWV
         mqfqVZj8x8yVqM4kDIdTXxSRpkwP8p+TWLv0QlHzsWtBJf3gGL6APPs6x2qHOcq/TxyP
         NfWL6J96uqB+Af1xJk4LM2lJtb5nXmz/TldQWIsLT/GPVbJs9J+7/YarCIXhQjsA9FkT
         UJ+0fCKijca0TF8gP9MhKamiNLK3thbgIe+y0ifHqDWZe1mfRGQNI+IU64jrXq7gLN8P
         Zq+KCOOB2QIf7NbyZIWTE3gB8M6rxUwqaabfdCmZGTH/zWGZ704F19tpb34Sg0TH0JDq
         EASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131526; x=1793736326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3lIrKPVMhtRYL/RcRw+WlUdjpRNkiI37olf2kGdOFU=;
        b=nQENDmVJbZ+rGRMPIm+4XZLJMIfmjY2h7GwQY4G9raP84k+AD1I9NfRtO7C5u28Tw3
         uqNKl3jHK/pYJJ492jYKkEwQo066AZwgTGrGQRnxA+xhtVzI3mAKCgQIsmb/bNxGAAMX
         x4r8qWKUYEFuY59WVksUXKZRd7SlVg/Ask0nBRuxXcoBrvQiOdzfJuR/tjUJMmVN2bXH
         TGNqYICn6AWwZRdCu5VnPxMyYX2H9kMDbKivydjZJCgGhrgLEKRtdQIkNzZfkrImrHOm
         0nGJZtc04E3Cxw8AvF/1WBwZzDkhCh+MZEUnaeuETK/shVR1YoQD7LJggMNiPl2rw0wo
         xY8g==
X-Forwarded-Encrypted: i=1; AKwUvByLcsNTVRDFDqNPfa3Z25/M1eZKd5DRaQcWUwazk83n5TppHGz8m3y2vo1HQByG5b6D2bcYR6s/6/x1gCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5y1yIg89VYKwCHKxXPRbD8tt53r/2McokWivsVDip9hT4/Jra
	AwaNrdkHPnOn+TA2KvcCaQvJcN2qEH0QkyMp3Bl50P8loqKDEmG649g4
X-Gm-Gg: AYBFou2iDOZISL8DLkxWrXaURO+R4IK02Fd2Od5ggPDvzcgUMIJn4+hSGz6ZNzcF7iI
	KZyKt6ITQmuF2Ng3awr6IUSnvHqiapK3P4XCBga5eQIFR9jz+4JE1AB0eXpuNBdc7FzfT/sx///
	Mv0r6SykpST05k+AndHfNmV+wiZ+ClfLnf3azwiEMm0YgYVgKlB61Snz045NQ3zhHxpGrNwibib
	d/1+YrN+OlTtsr0A6sVLeVPlwbbHBiZwmTQEIEpYNdWhu7rPLEGFQWTBuq+aXOoByIvjGfIewl8
	wgrdeDZOJ8OA1Ict9Bobw74misvcum3NCgCDyjMkWS27xeWwY0cvbvXP70Gh17x8qIxs/Lj7+el
	5r7R13hP9aQkxNmDicAPJDSP0aoLVf+vIbKNb1/um3G0MINnlJr0asSudrdV/QUEqRJwPmiBUhS
	ZjtJOIYZormK7DB9g9UMGokCsjNs2HGK+nKWMmk6pQpHOvwe+72VPWoYfq6KbumVNqm4HjkKZc4
	EWHLNN+DoDUEfU0SnT6BjCY2lq6H+wzqiSO75gm+qg/Q+JBQlHsg2sMcG9t9ceKuCpsVG8HkzZ5
	Lan2bjIFNycUelpCuCh3wnzEiIXAwhMSWBsbnQJSgd01xxmpk+Wzs9xt
X-Received: by 2002:a05:600c:b99:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a96667bb22mr94245e9.6.1793131526167;
        Tue, 27 Oct 2026 13:05:26 -0700 (PDT)
Received: from localhost.localdomain ([45.152.96.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e3c638csm4183685e9.8.2026.10.27.13.05.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 13:05:25 -0700 (PDT)
From: skvarlamatus@gmail.com
To: asmadeus@codewreck.org
Cc: ericvh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux_oss@crudebyte.com,
	lucho@ionkov.net,
	sgarzare@redhat.com,
	skvarlamatus@gmail.com,
	stefanha@redhat.com,
	v9fs@lists.linux.dev
Subject: Re: [PATCH v3] net/9p: add vsock transport
Date: Tue, 27 Oct 2026 21:05:22 +0100
Message-ID: <20261027200522.94192-1-skvarlamatus@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <arI7p2EinDektW0n@codewreck.org>
References: <arI7p2EinDektW0n@codewreck.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dominique,

I noticed the batch you applied to 9p-test on Sep 22 (including
the vsock transport) hasn't made it to 9p-next yet, so I just wanted to
check whether it's still planned for the 7.4 merge window or if
it's waiting on something.

If I can help with anything, e.g. testing, just let me know.

--
Matus
