Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619708;
	b=GbMeWdyuTtTjAHxN3QUMBHdqniBIg3tGk7FaN++FyZe5v+xkj+5+5C0O+E46n1RhUO3L
	 kk+h0uIuDTiWsyjemb6xukFGVwzh/WLTXgq0tJ+HfPyQqj19ZqWUj8vxh7pFbYzlbvY9e
	 E+pNLrjinncfAb2dqJwzx+B8ABEqcv2Kx9XRMr2Ci01weoj7ve8sbyAxMfEdZJbt0NCHe
	 z/oerp1GCjtAKIBzUtz37fIKaQxzJ0dCsIndkxojKtH1YXNs8sjcJvjtEMa28c4yUq861
	 fUJY8sye1rDj6Q4gOVTGXNnIcf9rPkcejm6VyCeI3Uj6wZfIB2VeNgEqttJgNgWlGsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619708;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=EcOIUSoIkDrR2MmVp76uBcwR+fAQFhKVpcenocx2Urw=;
	b=P3p4t9ul+g0VAOsf1X+LOpVSOgETeIzMoMD1M5yy/WN/zZn7sNxAX3GQXb7e9RcevIav
	 KVlBEIJiPWnBIzO4tsiVPZNAmmzveMJOG6FvLMIQldOyksearnb/mZXrelmYD0JVHPtv1
	 CSpWaKK+L1CPOwF15ofPezc+f6wp/+Nd3lQu1AHuxaTL0Ky7Bc0p0UlsGeuMRCN2xxRav
	 Pu+Yoo899zIE8H1WcNY9eNytNlEKYT4jwDrAzFf4Ch+qjXHyJYYDuelytlIfd+XTq5GTV
	 gwXQdWfxhSuvv7dTcTAvVF884REpEaEKTpPB75SIy3y8iGRfUw7+kMFfaM0DtabfVbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dd8o8v0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E11606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dd8o8v0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A861F00A1F;
	Mon,  2 Nov 2026 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619707;
	bh=EcOIUSoIkDrR2MmVp76uBcwR+fAQFhKVpcenocx2Urw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Dd8o8v0PKp+YnhT1suzhHh0E1X/oM8YUd+J5zO5xPfYbaYF3AUrUKOYoLdZSE6iKz
	 xi8A0830WcyrJbkQITJoUviNIQQCM6mLXmKx/czLVE1v8g39lT+MWyn5Xp8cu522sR
	 HQnjPm660/XhxPKN0tTnUHtIjQawGZc+fGuzUtefE1HOjsniA2Jup7Ym4PcSVJej75
	 LYOHeFObr0QP85etofGe4gxgmx4IQm3QvXYoGJuc0cL1OrTjuCu/YX2QRtEfS0OYef
	 y1ul4H1HLIQFbvMDEFF2cDILRg633vgb0GQ7179TmndORP61lG+x5BKQwDfCFk/M8c
	 +SRMZus5aHZ9Q==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 172711980047;
	Mon,  2 Nov 2026 06:41:44 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 02 Nov 2026 06:41:44 -0500
X-ME-Sender: <xms:9Xboam1x2t5fmiuHk1RoTGl8n8SuGSnjwJxb-vo4nUc1NsQmT8_jGw>
    <xme:9Xboaj4N9RaxPQY9G6pdWMzYPH_WsVCewc8in2HOAMdhc4e3F4aSRCKIr9-f_rFTJ
    LdGg6zlkHpA9s3UcpR1MSsOrAGNdHaTkSeOX1PNlIYPtIeNaJnW6Oml>
X-ME-Proxy-Cause: dmFkZTFf50Wbq4h86zaJrTMqckRnKO2KyVsZwVOocW/1Ty5E/45rVJCvNTCTfuTlKl1kA7
    Q2cP2VbcVryauLzt1ykhJc+tEbXNkl6yxBjN79m7rMBBW4J4XxyE+gPyhGA2jwUh1opYQ/
    rFWEGGSV7tFN0A5LeYVwhLx+Sx2PrlR8+VpJFbHFmTDRa1Sf9gcttVM456A0USxbDDf4A2
    1Yj9G+yJkfQ/S4gigj6ZG/HDTIVII3DPZNAbl534R+fCDvEQg1Ryj9huNrxF8YHsnlc6xF
    aApKjum6CjVqCyRlkSNhoL06nhdLCmw6II6or1U94pwyeNEjxQ5UCFSFWHnbc0BzP5yNqv
    lcrTjW7fFx7uJun6Nwv1yf9/ignsRr4tjp0lBBZ9VOwGUSH84QeE0+MJ33nOCBjpV10c9m
    Vpz/wNlJl4OUO1F0FDWH9ns5jtic5f3sfv/devFUcsRCkl2PcXOTCkXOMEbNcWKYQWCn2o
    XTeVymvUP57VrsypfdveqreC9kbVfnxn72jnrP6ya7/JErkLLycsA8xgav1UKVwv4fCDui
    +6LJUIaYFVqhpCXU1jzNwxCG9l+sKA6J4ois7YXV0KLhjLujJ8cC1JI0Ir781tqVYpTRTE
    aXe7adyO061dR4My6afCGSjJnvNUNttCz2UIsmrwkQwIBz+LKsOcRfITuN7w
X-ME-Proxy: <xmx:-HboaoOaeYO6QxqGwYukEsS829rqwdkuj_TinhjEE8GTqWt_I8hSJA>
    <xmx:-HboanFNW3Fxt_ab2IXF0yZANxmykM-7TTjSW2wj9jaXRTIYEa5XnA>
    <xmx:-HboauyMOHexpHnmzDcTNZ0Wjj14i9Q0igz-O4nWl7Be6tlorep4HQ>
    <xmx:-HboagqHqnWBKElaLgDtNLNNrttOHW1ydOfNElACoLkg_CBV_poUMA>
    <xmx:-HboasmcFvWt_H2qoV6Yd_wSGzhbJd9puFPmiXidxb6sq2OMgZoxC_d2>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 92F85F8008E; Mon,  2 Nov 2026 06:41:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 02 Nov 2026 12:41:21 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Pankaj Gupta" <pankaj.gupta@amd.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 "Tom Lendacky" <thomas.lendacky@amd.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-kernel@vger.kernel.org,
 "Mike Rapoport" <rppt@kernel.org>, linux-mm@kvack.org
Message-Id: <bd56cfa0-6fdc-4e83-b571-f2abf647afa2@app.fastmail.com>
In-Reply-To: <20261102113127.161823-1-pankaj.gupta@amd.com>
References: <20261102113127.161823-1-pankaj.gupta@amd.com>
Subject: Re: [PATCH] x86/unaccepted_memory: Do not accept ranges that are no longer
 E820 RAM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Pankaj,

On Mon, 2 Nov 2026, at 12:31, Pankaj Gupta wrote:
> The EFI stub builds the unaccepted memory bitmap before the kernel parses
> its command line.  Option memmap=<size>$<addr> removes RAM from the E820
> map while its bits are still set in the bitmap.
>
> The removed range, such as a memmap=...$... hole, is then still treated as
> unaccepted RAM and accept_memory() tries to accept it.  The hole is not
> mapped, so on SEV-SNP the PVALIDATE faults and the guest crashes early in
> the boot:
>
>   BUG: unable to handle page fault for address: ffff8a14bfe00000
>   RIP: 0010:pvalidate_pages+0xc0/0x250
>    set_pages_state+0x41a/0x440
>    snp_accept_memory+0x3e/0x50
>    accept_memory+0x186/0x260
>    __free_pages_core+0xd2/0x240
>    memblock_free_pages+0x1b/0x30
>    memblock_free_all+0x275/0x2d0
>
> This was seen with memmap=2M$0x1ffe00000, a 2 MiB hole in RAM, on a 19 GiB
> SNP guest with lazy acceptance.
>
> Fixes: 2053bc57f367 ("efi: Add unaccepted memory support")
> Signed-off-by: Pankaj Gupta <pankaj.gupta@amd.com>
> ---
>  arch/x86/include/asm/unaccepted_memory.h | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>

Can we just disallow memmap= when running in a confidential VM?

