Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284963;
	b=K6ZxYHGphcJ/GmxD0gXtDfSi7pTt0m5RRoQewnU97N0hNpw2la4aag0iqM40+EAbF1J8
	 tXbPLun8u/exhQOK10tJY26lSNHHZYM9beSwFFz/9i2jk1ZFuEJeYM3p9QVXd3trOfeas
	 cXC7TbtzfUqjUK8VKe1prVlNz9cJRdrxMKHBhfuKf4C2LGMrT2t18CLhAWM5HxucBUS/x
	 25k66lIlDAqbA0PC2VLzbPNU3U3U6n3kyupStLkF3DAOCN6Bv6W5SFhvPVrsuQKmpVMNz
	 uXQy2BKhRuY/eFuPrBm1JKIyrqLDIebk3QdxF7MopTtmCPLmPw/Y79PRzvGgIRCde7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FxC5kQ/SMr/KLBKiPx0PdPgsfNWcYSP2FuHJsYS9WuY=;
	b=1Kr3jrQ230GT+K5RcBy2H3tzC+YqC/n2RonZ9seLnE5q+wIKqgamhkzqedIa1cMXyHsp
	 FH7yzjAJC1LF956sYC3OrelOn5zZV+WIFYnMIoI2YMiWChCottIP8du0tew7cqufWLdkW
	 EPNVP6VUXzetct+ouEFJBsa+ckJL9eZ8LI1c0THTUCzvmaKPRR04Rr9xMvbSl8B08JsAo
	 sYcQjqgB0ZhCJdJdmZwvwhB3za3eDO94e5LiQHY0mKgw/ooN81/AQsYQe2aQfBH42J1CD
	 m+oZjJIBUXLCXuNndrGGHyjxcEH7f1rM4JMx2FIOvKqxCOdwOKW+EUjiYjV0FHEfhdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7lv4FZn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADF8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7lv4FZn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so16106125e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284961; x=1794889761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxC5kQ/SMr/KLBKiPx0PdPgsfNWcYSP2FuHJsYS9WuY=;
        b=s7lv4FZn/1PAoZHUD7BtbstZ5547Lki5phWzqkcA39f36aMMYLkQIxf+v1szfr2npL
         NnPUmREW7dj/iyWc/mD/bM0Ohvp2qQXbQ8eYRRYLHPUWz5vJcnbbI3330ktZ9LZAZjpE
         3BJ305JWJxshhQpZmXc3Ow00phbsj9crQIRaz8ntwc7dBN65wo49ijLbS6UPgvG/JRaq
         BljsfrV5ySqeh69bqFruCAgP2u12ALlGc81V/KnuoODbV/lMMIx+Z6nn93/3+3T5LuqE
         K6B22eGGFMVjx8ZejwNEP/rm57cYtsckq8uOf2xiGHjR12WV4VPIfi0i+M0eEovBOgDo
         +JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284961; x=1794889761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxC5kQ/SMr/KLBKiPx0PdPgsfNWcYSP2FuHJsYS9WuY=;
        b=ungyE01Qed4WV+PFjN1iV7T83AbXE7nYVpdAp5oomgp/ig3Kt13nqYXKG5moY0Gt1o
         jQszA6a94xTYmn1dhD5rQMGfubWgvg0nAT9gBOu340OODf1gajw55pkCHNjRW3lc8Bnd
         h3ugiUQ+mPgZdEKpYpMFogF4rCZ/rFV3ldNcBbc1fQjUyqqQsbIruVGH+Wb+cqy/nuyA
         TK+WZwKHu6q4tfKtR/aiA4A15o43b1+Q0K+Qw6UsgZ3v97OGk9Zljdok6jWJ3Sir1T2p
         a9MhLEs+ZDwzjrzRTLs0QvPrTNGPaiSawkhOcqbNHRmF2PQwJNs4ZNt9An/kWgbTNo/L
         x59w==
X-Forwarded-Encrypted: i=1; AL+hErFd9UZy+U+CNfoixrOOn8xVBuYBYY8lDmfLM2DZEWVOo6/DMci1uMrh3eGKEGOJX+2PNwROVpTudS6rD3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UZbsapRaM3FDid2Fcnv/pWwrrc1tvn86Tb7mNvETbeN3vVisj
	JMFTbZVNkkpitGetaS+uxDL0BpSbp1YXmtZm2lmca4uKLTc0BK5HDqCM
X-Gm-Gg: AYBFou2L4iXhlw1PbPHz90xrmBQxoXLkVDg1RjzSg04NfGni0jPeIY0CUjheWr3vqKs
	vnlTVaN9Z9W+eBB/9xJEHeWrqU+74IB2Thd6A5aCORD344l/TNsL8FwBnPi5mqJX/at4JnjoOcF
	pQ+NrkLDOcPQDDW5fnruTytvd30mS6SIa9dwLyazYm9bpZrkYCKeTHYmEvzhqstEwqpxmiYn+q0
	XepmQqLtA9F/Z3EMxnDurFqXALDdRyQNWUC+6LeUG6VW0fAMaFbI/XGCI11WWz9YSKvrXik94Kc
	fxrFTEN6TYl5qvJpjgqm24O1tSy2zzb0BxdFKI7MMcHOhbxACLPawzAi/OXXYrhThKOBO1zIr5x
	ZvAakGN50tswvseTAO/qQ7Qz7t4XdgWTppuxYq9sm0iNtW3IZnG4T7/3iSiNQyqRfAdH1YskyN9
	+z9WAMovK8d0atdZLfdnF2Gpmhn06jsP9ThbnIf63zKhWUb91vgo+jmHTDWLjIdvnFla2Fv3Xe7
	FZf6NKWLaT5C5jpVLvmsIC/dKvMvX/l9qSFktitALwULxbtd7UnG7JaX/1BkjxO1kBy6RXePGcB
	hbT2g9ZL2Zn/wHyHkoZ0/cULnPbeSj9sqxr00HL+Bwtc3VFe8iKlFjahQKykmzM4fLpx1meQwFS
	v39/sr5oy1Re1V9obxhLPmKQmRcfMk2lhQRtSx9nRlv8KkNLum1ReLo//P1u+5pF05PRW4B32Rg
	G8KCfH/Rwvm0f0Jp6xHxht62g8UetIhXre/sNOcPxltS+5qnZ1P3K4Iw==
X-Received: by 2002:a05:600c:6089:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ba02349f95mr17862005e9.17.1794284961165;
        Mon, 09 Nov 2026 20:29:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-757f-6ae5-a6fe-9693.ipv6.o2.cz. [2a00:1028:8388:a84e:757f:6ae5:a6fe:9693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204ee67sm36212185e9.13.2026.11.09.20.29.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:29:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ignat Korchagin <ignat@linux.win>,
	Milan Broz <gmazyland@gmail.com>
Subject: Re: [PATCH] dm-crypt: defer async write submission to write thread
Date: Tue, 10 Nov 2026 05:29:18 +0100
Message-ID: <20261110042809.62987-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4093292e-1fa1-dc18-b185-18dff61a32bf@redhat.com>
References: <20261105072708.30722-1-pepe.schlehofer@gmail.com> <0197be1d-1257-4597-aea2-1a065fe0a1d5@kernel.org> <4093292e-1fa1-dc18-b185-18dff61a32bf@redhat.com>
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

On Mon, 9 Nov 2026, Mikulas Patocka wrote:
> On Mon, 9 Nov 2026, Damien Le Moal wrote:
>> Originally, this was added to avoid write reordering for zoned block devices.
>> So did you test this change with that (scsi_debug or null-blk) ? You can also
>> use an emulated NVMe ZNS device in QEMU.
>
> So, should we disable asynchronous crypto operations for zoned devices?

I tested dm-7.4 with and without the patch in QEMU, using null_blk,
scsi_debug and an emulated ZNS device. I tested both cryptd and a
synchronous cipher.

My write and read-back checks passed on both arm64 and x86_64. I also
ran fio's t/zbd suite and blktests zbd on arm64. All tests passed with
both kernels.

I also used a kprobe to check whether async=1 was ever used in
kcryptd_crypt_write_io_submit() on zoned devices. It wasn't, since
DM_CRYPT_WRITE_INLINE keeps those writes on the async=0 path.

The only exception was blktests zbd/013, which stalled during cleanup on
both kernels under heavy host load. The LUKS volume was still mapped
after luksClose, causing null_blk unloading to wait.

I couldn't find any issues with this change or with async crypto on
zoned devices, so whether to disable it is up to you and Damien.

Thanks,
Josef
