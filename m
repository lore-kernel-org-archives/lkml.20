Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43324DFF9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327117; cv=none; b=XAPgV1RFh853W8b69DYRFAdtOtKf6KiOyKIFI9jIRUvdU9i0X3aXUvEWyhLLAJL5N1Nnbrqy/qfwyGwEi9lGqcMFso9YJZfxZ1lqNm0wSP55bAoq2/4dTMoQ+fuH5CR+2AbxlIuRNHUXBFQBmwZ2BTelF+Lpwxq+DKi9bYEvCjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327117; c=relaxed/simple;
	bh=bH0Buk3xCzD+egxywnHWe81W6DFXtGOVFHPtpOmXQkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjJa2YZDMvLTAm5EOSgGToJgdmiAadU/YRCtv5GFctBlVXdQnjbwG62r83rIJP2W3nEUcQyxBriu2mm87GYOwNoK9GEjl5PP2NP0wRMLBBVx0qobEMiJxYxcjiOsQVLQcV5T4O36B6pwVU27m/vrrsyTRasg8TIsSzOuf9qjsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=a8eInwkJ; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=viGJRKRz; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="a8eInwkJ";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="viGJRKRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1788327103; x=1788931903;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=B6gtezrpXMM+WrKlgGNeZEenLznI+XCgGYSh3BBrdN8=;
	b=a8eInwkJF5WivoWF+VlcB/Yv3NAK7uTvxDEr2pzlp3DFHPuaXvZCiwGiwZ1c4Rx3OoD+weQnNQc0Z
	 l9UzOq1pj6hap8cvqwG/e7DioHBfthFMKKBuOonlOSuaT6BCGgfRcWD8AOqxuzxS20REcgj91ubwMj
	 cIIPgZJyhWnIPX6Fj5XNfoLMu8aYwNjtO2uflMHECENh3VACbHYafdREA3CGRVU4ULyk6VsMgESoZ6
	 GejzOg9DHWWF8gOMeBpv4Y6dDBzcUcVr5Jofnsupoechzt0Y5U1vrH6UtSyUxck8v2xWuVlTlF3NIB
	 cJVgBCMv+NhVDXJ/b7eXvzpCuIKdFeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1788327103; x=1788931903;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=B6gtezrpXMM+WrKlgGNeZEenLznI+XCgGYSh3BBrdN8=;
	b=viGJRKRzxNaWycHNkyL6yXlihT0XT9AcNuAHPOqCVsjtZZWtOg8k2Re4YRgtIoJTzzTWrOYRSDw1+
	 qodeZnPBw==
X-HalOne-ID: 92ff610b-a68f-11f1-b2ef-55bb5426428c
Received: from ravnborg.org (unknown [2a00:fd01:81e9:6100:5cc:91fa:7f53:a32a])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 92ff610b-a68f-11f1-b2ef-55bb5426428c;
	Wed, 02 Sep 2026 05:31:42 +0000 (UTC)
Date: Wed, 2 Sep 2026 07:31:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: sparclinux@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com,
	linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v3 5/6] sparc32: move early memory setup to setup_arch
Message-ID: <20260902053141.GA338380@ravnborg.org>
References: <20260901214611.60560-1-linmag7@gmail.com>
 <20260901214611.60560-6-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901214611.60560-6-linmag7@gmail.com>

On Tue, Sep 01, 2026 at 11:45:49PM +0200, Magnus Lindholm wrote:
> Move the early memory configuration out of SRMMU paging setup and next to
> the rest of setup_arch(). Derive the PFN limits from memblock, reserve the
> kernel and initrd there, and retain mem= support with
> memblock_enforce_memory_limit().
> 
> Use for_each_mem_pfn_range() to find the lowmem boundary and replace
> last_valid_pfn with the standard max_low_pfn variable. Set the standard
> max_pfn variable to the end of physical memory and use it as the highmem
> zone limit. This tightens LEON's _pfn_valid() upper bound from all RAM to
> the lowmem limit, with no functional change because LEON does not use
> highmem.
> 
> The removed bootmem code also printed a private HIGHMEM summary. Generic
> memory initialization already reports the highmem zone, so do not retain
> the duplicate message.
> 
> When PAGE_OFFSET maps a relocated kernel, remove memory below phys_base
> from memblock because it cannot be reached through the linear map. This
> replaces the equivalent trimming of sp_banks.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Looks good!
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
