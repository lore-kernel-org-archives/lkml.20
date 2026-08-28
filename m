Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF03D566F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922625; cv=none; b=ePuwOswMXdV1KPMAJppvXMbyVllVUFO4QqxbrDGFn/994GZInAvwdUCeS3gK0HtGgiRboqreNk7iHhKYObct2U2EeDBYgNapO0PlQag2uDufO/VgeU5tU2nuukJkZSRW9kZefnXqjAoT8QDfOhoQXZnn9yGBOpZjAteZ/AOX324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922625; c=relaxed/simple;
	bh=KPdnlZF27f6Z79k/kponOhNjrKoNEGAFbCTbXooWC8w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uwKhbG7ycnoHcxieS1PJ+BnhQml6dvuFEB/gdzRlr8H5diNsvtifZ/0hS81Uu2kk3JALr0XNZ82tnGlAw1D558TW/I3+D+ThFVGRtg/ncPptHu44QBnyvTRyc8ltFvXWATHetC02bgJpsiKMGvNw4wLedbRlGPDF8xzYjBuaxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=expunge.us; spf=pass smtp.mailfrom=expunge.us; dkim=pass (2048-bit key) header.d=expunge.us header.i=@expunge.us header.b=pjlpDbKH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jL5Dxk+u; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=expunge.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=expunge.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=expunge.us header.i=@expunge.us header.b="pjlpDbKH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jL5Dxk+u"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8F1E914000B7;
	Fri, 28 Aug 2026 09:10:22 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-01.internal (MEProxy); Fri, 28 Aug 2026 09:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=expunge.us; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1787922622;
	 x=1788009022; bh=AZMNej9K+RTFDxSQbSdONK5K4K7qFBjx2poSPSj7ojE=; b=
	pjlpDbKHYTaGJbFFPXHkxRdwvRXWavBV/dayW0h+DMhgErLR/D20HuYArRXcpvVv
	8WqNWX2yG8Aq1FdbbfEVbNVM3+JO+rW1Ou89yusnxwtTEF+aW5KS3WC3N99GjfWO
	jl8UDxPC1R+wP6LBHe0sIFx/WULqdkRq9OfoHcgp2/ekrrBAihRfAeLM7OQEUedk
	/UAzVPsxtJxlDRUf8g0tFLm3xe8znVW9N7r+PkFKQrgVRoHfCiQfiR8MNWb492m8
	SQ3IjQV+qLaIhWFO8uRGs85xiPJqd5yayEZJgnt9Gwk1H7975AaBS4GhpPF66sV2
	9Uv8AWDY+eBn1o01eW4tWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787922622; x=
	1788009022; bh=AZMNej9K+RTFDxSQbSdONK5K4K7qFBjx2poSPSj7ojE=; b=j
	L5Dxk+uCgcuRveb8GbWmJTTNEc2q9z/dIQkZ7ZvLw48LPSKcB4mW4Q+C17i4iwj0
	Mblk9wrTYOZqsk2Pp3tSR3k2SHEg0EpZjo5fSJWd1FMG95Qx/cvhtepTdDnmKcBU
	CfzXNjOOAh5BPmH4FNGdBjBSIlxMEQSp4HO1C7cP4o30WUOea7qQ8vLv1XUZ1Mnu
	kUBwWzKYudHfQsn0WF4van7nFgCQYWet1wkqdXDEqpsQG8qHshLqjir+Nd7KMM4w
	EmTYsYIlXa0rd3Vot3FVSaxY8K5+HI5hC05GPyPDcdIdVRoVt/0C1dPBVAH0Ayrx
	4Yh/E+E97H33u+UD+dcZA==
X-ME-Sender: <xms:voiRam3TK_a2rk5x0hr60Kjy_Po_VoE9eeAB3MmcvJ4ZI-XlYb9qwA>
    <xme:voiRaj7Hp3orfkN-y9YB5HeOrMwThFuTypC88FBX7oBvRcMc5Fqr8ySTZz-vtqHEA
    jd53zL7ggcxbp0kogWv2406aReCp9cNrrzj-dyNCYfQ92aekf8phdE>
X-ME-Proxy-Cause: dmFkZTFgSqJaJF/bRd4EOSdQutdCaKBQfkb/o38GXBlcbHQ8ZP8+jhCVvkF632nQ/QkX6K
    cXK9C6m7ija7xsuROAKHmQcG35794lH8p3f7fsbtmkpadcwBVQdzlvBVuuN21hLY23FaHn
    ctFdbArHSlO4+Fi9ZNRHNctmJooYJQKvoQVjmAc/DhqjYC8TIhd/2tcnwz5mZh1vIRjWLN
    p9bxjHGj7vSFVqdepy8dGIs/g6Ncq6ENKndT05Bs6Ft7nvXktnWF5cU2bQq9v7KOJDojTt
    gaN+EY/sqiv5mS7HI/oE6O+WYXCfEWBNfqBp87J3B0MybgZ/rDAiRheucl0G+XtDKs09Zc
    7AfaUuzGmprwBM7CQBbMWkYW4343xmLZauhy/hYVXSMhsyJWAi2xeqXER7qjJ92qf1Too4
    VU0NAZ0Wfh1UK7eddD0Vu1hiCjxU0SLi5HOb/vi3GI8lfcmRKnrPwh3XC1Bx0gbWnOchAt
    a8oh6NWxLvXqJLDEhltXUUq1kuS3c5aAyooqei7WYYaYETYWb4FPs5J7RiGnNXn8Sa1SJR
    zTJCc2HagILRZyClO18ZlDCMeM8PTvU79Ceg1dFUUCid5+gJZOk+sJw17xc+KHVaH0fyfU
    OINobpytE+2v47RvJViqHi0jvhrpJ5v5VsoEZPTEBuo/tv622Y2bMXA9J21A
X-ME-Proxy: <xmx:voiRajpMkmQw_SUOC1sfB5-Y2WvdEn_L3O3zqw-SdKXZ52nr44V9hw>
    <xmx:voiRarNsgr_E9kTuXyHF1DJLYTkcklXT4VDQ-UdxjwghKHyxU31rzQ>
    <xmx:voiRamqI5LW1yG5xs70dNOpIxKUuAwGFfeG2g_ZQx7tcil4AuQ-hyQ>
    <xmx:voiRaoclSrp9I10JAkEhN4YWkH3fYG8HxPffx7HNXDe55DN1_gRa2A>
    <xmx:voiRajeIcScYWUGBQMKiGxKxlmp8dF_kZISW4LJuu4o--uoweuCJ9_Rz>
Feedback-ID: i0af9447b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1120218E006C; Fri, 28 Aug 2026 09:10:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AqFmyooDI3tB
Date: Fri, 28 Aug 2026 09:08:57 -0400
From: "Jared Baldridge" <jrb@expunge.us>
To: "Thorsten Blum" <blum@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Message-Id: <bcd3ff40-3b04-44a6-9ddc-4d2851c24240@app.fastmail.com>
In-Reply-To: <20260828130622.576064-3-blum@kernel.org>
References: <20260828130622.576064-3-blum@kernel.org>
Subject: Re: [PATCH v2] powerpc/boot: Drop unused min_t()/max_t() helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, Aug 28, 2026, at 9:06 AM, Thorsten Blum wrote:
> Commit c762c69e106f ("powerpc/boot: Add support for XZ compression")
> added min_t() and max_t() to support XZ in the boot wrapper. However,
> since commit 9f121705503a ("lib/xz: replace min_t with min") XZ no
> longer depends on these helpers. Remove them from the boot wrapper.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
> Changes in v2:
> - Mention the commit that removed XZ's dependency on min_t(), fixing the
>   build failure seen with v1
> - v1: https://lore.kernel.org/r/20260525091839.817778-3-thorsten.blum@linux.dev/
> ---
>  arch/powerpc/boot/types.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/powerpc/boot/types.h b/arch/powerpc/boot/types.h
> index 8a4c418b7260..c5085c2632bf 100644
> --- a/arch/powerpc/boot/types.h
> +++ b/arch/powerpc/boot/types.h
> @@ -37,9 +37,6 @@ typedef s64 int64_t;
>  	(void) (&_x == &_y);	\
>  	_x > _y ? _x : _y; })
> 
> -#define min_t(type, a, b) min(((type) a), ((type) b))
> -#define max_t(type, a, b) max(((type) a), ((type) b))
> -
>  typedef int bool;
> 
>  #ifndef true
