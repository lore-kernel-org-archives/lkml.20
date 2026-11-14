Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648574;
	b=2lZ3jZp8E/6znRUgb4Gzv10D6yKfx9BfQmFTCUCmbF7KMCn9NCGkH1+7QuMaFX9WU0zy
	 kGn0r37AfeqLJaqn2NvcM6dMHGNnRq4fw2zH5WBzSrZM6PEzTtE0jSgut6k3/ld+FkfDb
	 9C9FzC10HRCestVos2DEYFJ7qSo3XJMTDO6IU6aV3djR0EgQ5Lv0CV+bFR5pqXRctY32O
	 gcN7unz08clnUNlDF2KT1uxkYFwHswdXtoWCW4LQjGAUa5eh9BNRFbEsik5Jsqlmnno16
	 c49GbQnf4WVDcR5IkQi37mVERsGaMC37gk2eJEsUfsx66M7xwiBHMGp9Hv/ljsBqGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=vz0vstI9OA5h3bsTRS3tRWw1Hwov6sM88rpH9FbtfYM=;
	b=GTqZk28dy4c0OAvl/Mk6RW2WsU6tzxJOYysP2sHBM2YgFKgbgUCOwOSgiXOLkvfPRG4z
	 WBtiiuwV5M7uQOcF/W0IZ0YD1TS0PSKNg4GnfrrC2puK9uGfBNVfdHhwqKYeHgd9iw6eE
	 65PQxrfZYVGCU2pPuWNG9VqPMpd94b/vtAQbsPHQhBtWa472e6o7ON/2MRWp+mt/70gDk
	 bEfEX0fVivWNHWIyyMzKKSS4VlOZw0A473kjAk9t4M++R9KaNuDSoKL2vYeuuQkyb3EQz
	 pD7UpR5fPE4ZHw48p5wiVBxfsJeLj8pnGMmmTF5/KYunbZfwHHKsSkgC6klhlfrr51Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBvC6WSB;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222E606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C222E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBvC6WSB
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4910b863b84so1635588f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794648572; x=1795253372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vz0vstI9OA5h3bsTRS3tRWw1Hwov6sM88rpH9FbtfYM=;
        b=ZBvC6WSBenV8D8YKmhIHmzrsfPzp/N6h0hYS/3wHkdiCKdbm4Xtz4No8qQTORs+3po
         OMYGjJKvA/hgscbCUMcKpIsUgA0bXQlRqUThDkXox1dsNIw4CZaPUnywScY/+US/Q1O7
         VtU9CPPpQ0btH6YK0sLKD2WCOxNoPny5NHxP/y1CoNe0j8iPgtRhOkDNwqKDudbaowut
         Hg/7OxMFDrLJzntvbrkEy+Bx7cE0ux9CZkkOs47kPuU8KruPPc+7sDPli2KmBKii60/W
         /IQ8vIXPAruXsqI3GbfdSg3tpLdx6wiYM5cWOd3ZbhU91nDnIeSK4JbT+F1WuLwoT+jZ
         g0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794648572; x=1795253372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vz0vstI9OA5h3bsTRS3tRWw1Hwov6sM88rpH9FbtfYM=;
        b=BCJwur6lem+e+m0kXH5SbW6FMmQb9z4/Yi2AdTc7A1waciyAWIQaBLGj7wY/FRVDdk
         Lge2QJbrTdtsXk4YcMQcOdn22iV0H02eT0lb7svXXA/TkS6mBuqkPRmAQhD9Y3xuCZs/
         F/KSbJ5WrMTszcsPESEd2OHlCc0viTNrt16uVmzZUCY9+8ta0DFk3cEF5LMcr46Lq+RE
         YP2J76TPE9X03TB2YL+R5tvLmbhAWYmUHzedRBA+ul5y0ld+DslD9xUH3ksdWfhuZcsG
         XMu6axA6wwKF7b2DXBJr6hRR7cWViFNKSwDrnxYK2pzgslvQcQmTkTARnyAvFBXBOLfG
         dFlA==
X-Forwarded-Encrypted: i=1; AL+hErHHNAF/qlfLVo0niB5dEzsVuBVKHl8nXdSiAkEQuEA2L0zyQ7u+2MLE1jhCNmd/wCobq6IYEsx9KV5/ZJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z99RqSjKK2zRpjVxgsXPWYhSvnsGwY2aV/FRhgHU1pu+/dvzVss
	IlDcdyUEOUJOt0FPW7k13uoSeQk9FCqoSx3D2d2CwVj4oXBSinycd3md
X-Gm-Gg: AYBFou0cJ94U2lQOQH1DmcMWVnm4R+UXsns40K7+DhmzcvqDqRK9FXk/AqXpGUI3M7h
	NkD+osv/v8jqm/VGToaXwG9lUGGlqxGE1j+w6Honl3aT3VyYdH/kHK/UWmWN8T6TOUUQCfFwb0q
	zMsyyhnvlXoSUA42r0ZKFyPb9pzTHuFFP/fhOeNfiwspG7W/9kiGXac7IPMKIUSfEc+0vV5jcu6
	FTRzEiEdUhjlU+GkPPlWJzinBhOmx4yVE6D6mHhQaMJAnRySZhvIogb17NGqMfSo1DQ649/hUu4
	ycVYBKv7AWmWEjyScMoPZfUQmR9Kel+GpJo2Ce/whhE6c/4st7zZoIReHpet6+xbwN4cWSlTYtz
	NqACWby3O5WZS98eYXCcSFpB5xikb44fPc2jzM4Yk0BSyYhp+oEqT44Y4Up7n5z+SjVRRIHJ1BR
	DAa2qgOM5J4VQ8MoevwiIA3NlxcFAogJenDpDIcH+Hnu2HylXldBsfXoIFrn6aWMnQRNjTOZdRw
	yNx67G57DX4CVxaac7YFOsAmq2ZPJDNUFqkyULpVJTN5xYdN3oBsheGb3Z7MFH/Gog1xYif0ftX
	eXssm0EuiAN+PqFZySNCdifj3PEzAGHEghtKFhczhyw8q9cldkbxnJ/iGrV2Be9PNRewLxrWMa6
	okbiEVfl7F+zZ1nTdppxG7E9i6SXngdDDpbQr3fvjbhLC0zv9VWsGtKi40YCgHxjMsw48GXzHgx
	0usUJW0dPWt13ba59Q4CY76MTFkbc5YI741w==
X-Received: by 2002:a05:600c:4504:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb559f044amr99585225e9.2.1794648572072;
        Sat, 14 Nov 2026 01:29:32 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b358-dd01-fd08-0f0c-fef7-8409.310.pool.telefonica.de. [2a02:3100:b358:dd01:fd08:f0c:fef7:8409])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm8078945f8f.53.2026.11.14.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:29:30 -0800 (PST)
Date: Sat, 14 Nov 2026 10:29:29 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: Pre-allocate module page tables for execmem
Message-ID: <avgpqlpWf01mwo9P@gmail.com>
References: <20261016102847.96530-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016102847.96530-1-kmehltretter@gmail.com>

On Fri, Oct 16, 2026 at 12:28:47PM +0100, Karl Mehltretter wrote:
>   Unable to handle kernel paging request ...
>   [ffffffff78000000] pgd=0000000000000000
>   ...
>   bpf_jit_fill_hole_with_zero
>   bpf_prog_pack_alloc
> 
> Use CONFIG_EXECMEM for the module-range pre-allocation, as powerpc does
> for its execmem page-table setup. Both CONFIG_MODULES and CONFIG_BPF_JIT
> select it.
> 
> Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Björn Töpel <bjorn@kernel.org>
> ---
> Changes in v2:
> - State that the BPF JIT region lies inside the module region (Mike).
> - Add Acked-by tags from Mike Rapoport and Björn Töpel.
> - No code changes from v1.
> 

A friendly ping on v2 of this RV64 execmem page-table fix.

Is anything else needed from my side?

Thanks,
Karl
