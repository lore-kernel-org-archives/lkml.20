Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B2D5372DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080512; cv=pass; b=mGp7DT2lQlJMjRmxAGc8B+bDAbc+t5nL6aJhNDtI2teqlIA1te11Vl7Gw70HVe7ldhp06lBZRFXiP/fZUdgcfVbQBEtx5Cs4LX88ClEQKC4AOY70amLGJFKjJ6XMhpvgKlAlhHH+VykBbynH8G1GHlXXJdZuNAYCSqqE0uG56Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080512; c=relaxed/simple;
	bh=ALQACn46SAuo6ABqMmWIs/jscEBUUZDaANiX89ENIH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Tuvt+YlKNNvlacDj/VVjJIa/Gp3eQH5tS6ezvCj9ek6lnos2KTrYp0NXVhf+gUYQlCR+Bf4Z21610NbCj4JLul4knHT+CDd+lJyWDMqY9dGuorA9Nc+q6FtjI6XpgzjRxAv1MxeVWkqMsub3OSVi89ZtZrU899hx4O8fCkBV5uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4p3m//6; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4p3m//6"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20c35575so492962d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790080510; cv=none;
        d=google.com; s=arc-20260327;
        b=d2mQwthoJoV9JjtXDgI5AIi2sgMq447vjiATb2afnEFALAMB+Og1A4ziv2xz4egSe6
         PDOdyJm8OAl2q1BwjmKOQkxnl3GCRNTYBPBRgUiquAggPMbgGHxVFptcI0//EnG51RVk
         5tljPoIR4O1tmqT/nx/xzrAnWQyjSAHX9Clzu00F5yuIaLRBG4dVAKM8z1/zCzwa9Vti
         yYxHEp8fw2lYrlp08V3cQ+I1tsAj+CEAH3FsvQbnw4XDhIr+TZD5I2hHMqW6/TFcISFr
         U+u7Zjrc/N8qXF1T9UmnPCneMdVpikDY47hU9559ANtSRfJUJWdx44iwG3fawkQyc0Qi
         G5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t43upwUK0feeI320sY22/K/H7Nx8XNjdpVO2i6jn6cI=;
        fh=goBUguyG40hnLMA0UjGu3RZu1x1pSjwPoRDnXi3RZgQ=;
        b=Ud6FZuK+Yky2Tm69Md0y+pDN4MFHmeX59K53ff5x7pxiW0ng4uTy/y+MEl/Pt+VZsQ
         H0xvSm9IUJksWS6q/3f2inXaVcH0hhzF0fHw3MAgjHfxbCBLsHMs/R1mtEOTah44LTm6
         ddXKYKDNXAqv+DwicxOR6HVB8IntYfnu/DM/R3ZtlVgR2Vn+sKTKmCUjXWAP0j1krNSk
         StqjVh3hNRli/K5M2ZZ04tO7QIzokW6SEvHxkAsYiPAObJnkdB0J4X8fJOhuelahTlZV
         yFNuT6/J/P6VZ0RdRF9xURE6ZwNQYZ31m+cpeOCMudxgWBhlwA06q4Gwhyn+9Fwe5k7j
         e9Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080510; x=1790685310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t43upwUK0feeI320sY22/K/H7Nx8XNjdpVO2i6jn6cI=;
        b=k4p3m//6V0+Rbj6cPKa/V6v4U8qO8VAJYWkYDYjmAii0iyYKVYDTCllEp5+reHYaF8
         oBtsGtuzBTkFROgMLRlYwqL37WEBuF8o6lXLe7pbR4IuQBB+VUKs0OuvA3/bkXeKQ4n3
         thKV7waI5tPr5VfwdunzX6pzvbcZiMd8Ken0pQ++bgrz3R0tnjmJjkI2USd0le/jB35k
         n2rBWtNm+Jv7N/kaeJRG+x0W2k4TklT7VBXgVK9zzm/PIEDPxxdnwoPxdY7Pqi0TdlCC
         0jv2KOjO/guGEYMu3wFaFYGVmJuKFcqgH1D/tloMDQU4UBdA2QEsGuoYXcy4IhfxEP1h
         5/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080510; x=1790685310;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t43upwUK0feeI320sY22/K/H7Nx8XNjdpVO2i6jn6cI=;
        b=BHyqUMMllpLlWLMSYcMv4uH0leQoWOiUXShkV59zNQPg//1zrIyVAUlpRAW4Uh+bMR
         e+AIJ9BSjS9EH9tO+OzUpuykZNLGIJv02UcSHmfoDdmTGOxR8o/f1yvqkW4UY+DadkrI
         HGZxmSy+k27G5K/eNvHMcz8uzcM6qCDRfBwCmoGbAmA3q4ouNl5cIOgo+15pb9UGw2Ll
         9XLXIKlUilLrCEKVjA3SjuUVqd+oKljNeol91atyl6lP5IqfWgpNAv8facap93Nwb+g0
         HL0XzXixzJc/PhFixYqzxGgKlvPKWCpIORT/zXXHuYHUIEgyWNvE7BLkhpj+UmOKiCd/
         y2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwikjXXA0eA49O9/58hDByJ4szXWa2iW6eGpPgImgsDY/zy3F7ObItmDmJam6DTehet57axGRJOrgbXMk8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPIck7kw2uw6ESfzBcX35LfWc2htMlOgnF1XZRMX+s4O2039Nz
	ekeStc0P5cRcWQ/dvnlR5KOLDhCNFcplF5r3nUqR8Zk8WcXieCE1S4Tt1ri2gMtkQ291Mf1fwpO
	1nGvpf34wjBcP5VKZ6AhFChD+q552knk=
X-Gm-Gg: AYBFou21EBC9ALZ5CrkvDqa8uwWMpGjcI6RaI5KE5+dBKD2SXNHvKdtBpwb9/D0Elq6
	vRbm1hSjxPb98LRvh7uB1+1IzP/kphCzo5WeWQg8lWnr502MBxag2/mszWGP1//ws6+knvMbZ8j
	k/sAvpKxHvx0T7WHnm7UCTCmuJMuuy249xu2ZBl3X6gA3uDP0nMP+vNwIuJjuMMjhE8QTrnCdxX
	oNy1szk5XaC18y/dz1ngW8m8ptxIq60Cnzt151/rIGy0xvET/FxaQnYDjDNWZToKRrO0kx+QXeo
	GBgHy3KdQLPubYywydGEAfOguY7bL7bNQuo+jaOezgMAnuz3PaWwGC6C
X-Received: by 2002:a53:c847:0:b0:66d:14db:b5a4 with SMTP id
 956f58d0204a3-67182e32973mr6312973d50.1.1790080509741; Tue, 22 Sep 2026
 05:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922120330.127262-1-itai.handler@gmail.com>
In-Reply-To: <20260922120330.127262-1-itai.handler@gmail.com>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 22 Sep 2026 15:34:58 +0300
X-Gm-Features: AclHuK9M1FiHPYW0MDamOqCGXrHsZodxWnPTe6_1DsJAstTJCmij7YJNysXMWIE
Message-ID: <CAFpOueSSGssTvQ6q2q-piK4uzdaoUQBvtU4H_yjvN7hyfVa0uQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:04=E2=80=AFPM Itai Handler <itai.handler@gmail.co=
m> wrote:

> A patch doing that is posted:
>
>   https://lore.kernel.org/cryptsetup/20260922100554.28692-1-itai.handler@=
gmail.com/
>
> It is not merged yet.

That cryptsetup patch has since been declined, four minutes after I sent
this series. Correcting the record here rather than leaving the
reference dangling:

  https://lore.kernel.org/cryptsetup/d3823e0b-3387-4b3a-b5e8-a3d5f266308a@r=
edhat.com/

Ondrej Kozina's reasoning is that the missing upper bound in LUKS2
header validation is deliberate: bounding it would stop an older
cryptsetup from even dumping a header that a newer dm-crypt might
support, and the corruption case is already covered by the LUKS2 header
checksum. Both points are correct, and I have withdrawn the patch.

It does not change the position of this one, and it is worth spelling
out why:

- cryptsetup caps the encryption sector size at 4096 on every path that
  *writes* a LUKS header, and this patch does not touch that. No tool
  creates a LUKS device above 4096, so the portability of what
  cryptsetup produces is unchanged.

- A LUKS header declaring more than 4096 can therefore only come from a
  deliberate edit, and as Ondrej notes LUKS2 metadata does not protect
  against deliberate harmful edits in general - changing 512 to 4096
  breaks a device just as effectively.

So the paragraph above should be read as: this is a case that requires
hand-editing metadata, upstream cryptsetup considers guarding it the
wrong trade-off, and I agree.

Two remarks from that thread bear on this patch. Neither is an ack of
it, but both are worth having in this thread:

  "There may be support for larger sectors in future dm-crypt."

  "Since dm-crypt constructor currently stops you from activating such
   device (w/ sector_size > 4096), it's ok."

That is, cryptsetup deliberately leaves this limit to the dm-crypt
constructor. This patch keeps it exactly there. It only changes the
limit from a fixed 4096 to PAGE_SIZE, which is the bound dm-verity
already applies to its own block size.

Itai
