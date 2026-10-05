Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C224CDDED
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226751; cv=none; b=U44O1UaR2hJPDQ7RFiyVg7fOLNDvOJJZil/ndmeSZA4tOROfAcyx2X1aoO90rdLW0rEFYrIOnKNv6HDogP+Jq95W0MExI1GWAOZfMMy5G16MXkITtShA54fNdF29obDIDZ1wEj/5rzSKIbPOjw5akfJImKaP7yE4HnhIIF6itBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226751; c=relaxed/simple;
	bh=RH+CnPT5AboZDzkPfzmDDAHIiqyv/a+uYoK+W5T39CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2ANMY2++CCZ+DZb4KT5ehtfXCtGnXBYBRElzLK4DHjoUV/aWrBFXx/a2zgWMhtQeIqZPAo31SJzkx5GVwp74/+TW47RvmhcO047HMpXFT6crsVLYDrzGP3ki0RqnACFXxJVaEnlCrWgyb+GdSwxZh0rSS4wCafn5kuTauPZ4pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/jCv1cQ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/jCv1cQ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so901679a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226749; x=1791831549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSXi87+ATCOArHRRy46mVukElIuhUGDXLY5gl03Kkf4=;
        b=V/jCv1cQN58xQVKttsAISPtfQCYACiNg6oK4DnpQk6Rclz7II6zzF91z6uzBgu0yLD
         SKlW1PU0z2aNgHq1eaUDocCwvwXlLfWK86doxBlqPKjoTMVy46xl4CkUVF6BabXXUd+z
         QnNiG3G+JHRHGHlS0VNCGHHZjwayXiEjcLFh3Oz9WqBQ+3Phx7vUpPPUMaj7RJLx+VO7
         NGe+lYGRP1enmS4WgP96CWZGgD0U2h6bwelvDj7Bl3XK3AmeNe5YATZmN8K9gCOeTizi
         d/0yKrcDq6kSHyYIO7bY3IbZNnnHJ3CpacMFtnpNKsQqMIK2jQkZvij5LlPv4cxXxF0o
         cpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226749; x=1791831549;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSXi87+ATCOArHRRy46mVukElIuhUGDXLY5gl03Kkf4=;
        b=Oz8oYqjAU9eqc4VgVT2jJs1r4EOKKwLIAKgp0prvBfRFDkk2QDo/oNoVUQBXK70CoN
         zxBCvcHqcLNl/BgZiMS2nxm5AmTskmGFUIjoj1sCgL8QwmV4S+ViLV9+s0jIbhO0XaCu
         F708l9TIIhX0MMDVpqzshGs1lVi9TdrmaIobmDbTalzAT2QAfl/F9FG+hV3xVy3QkPnO
         zLF7UnW8RdT86rozhrR0mXWGsU7QUHcyeJSEx6zUK503nHqZi3Co+rOAsZEdafgYIloQ
         NL1UEuawrZ/4o+zGgRTmv0ahplnFBiLKmtllTctx/MiMrIGoRpSCUp8mOs90nOmtZ8aL
         yr5A==
X-Forwarded-Encrypted: i=1; AKwUvBwFLzXjeJf8RkobuNMpcV7QWsVip5GoIkl0RVXo8KhBbp2mnB7RUK8qgeDnm3OOZ65LC59UdP8bBbk1Pss=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrdWDxu5Lh+Pz6Ddb8Xo2Ex9raGH5KXlIk/a37tKjaylF94Aq6
	r002hAMjX04/BNRuEPEVDYsrFl5YRJBvVPdp+n5ZuW7lHIQGVs65MNQc
X-Gm-Gg: AYBFou00Zfd1Iz2sTI7eEFLTBCEuzkx/uPa/taOo7tK9EIpl96w14oClJkDxyDoBH8R
	dSVQ/pyi8tX4YfuWajDtULuSPvIMTO3mkDg6wqqu851RmrRigCi7arFItLJhNA/Zd5sPhnJtpcC
	9wODpjHvkvfQypofdy0hGqrRfOxaqOlEaRFWN2ygBaEp2O6dLzosGrH1AvfTX7RJiZVg0AGXdNX
	M8GCo5Tz3TtEEAcioojnYYDVnVOxrRFGOJ/osR8FYLE3nRuV8bFWAumdgqI+k8xFtyl4qyxU8AQ
	lupRKuDavSdJ9GTCgh1hF6CIrU/d6jCPDKBs3A6up2k3uCeLF/F0gtEvbQK3yF7WaE/TcfBkDVn
	d2sVuyFCtIkYSteoDoIJIwjDgrAj9QPnDRHeY3r5VdZTDZVb6ELII/4/NHPl4cy45r9rC1iQdSe
	tKqoM7jqy8vSsFvbcih/DOr2yoYwfmKPkjBPjKNChd1gUiud7tqJczgDgft/a7QwauzXRt0Vs=
X-Received: by 2002:a17:90b:4b01:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3a7d2b52f9emr3999739a91.20.1791226749036;
        Mon, 05 Oct 2026 11:59:09 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cea0f1sm748786a91.15.2026.10.05.11.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:59:07 -0700 (PDT)
Date: Tue, 6 Oct 2026 02:59:01 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: song@kernel.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	kpsingh@kernel.org, matt@bobrowski.net, rostedt@goodmis.org,
	mhiramat@kernel.org, akpm@linux-foundation.org
Cc: jolsa@kernel.org, ihor.solodrai@linux.dev, martin.lau@linux.dev,
	yonghong.song@linux.dev, emil@etsalapatis.com,
	mathieu.desnoyers@efficios.com, hch@infradead.org,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 0/2] lib/sort: Clean up sort_nonatomic() and
 sort_r_nonatomic()
Message-ID: <asPzdeas0ZP2Oeis@google.com>
References: <20260910165222.1186628-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910165222.1186628-1-visitorckw@gmail.com>

On Thu, Sep 10, 2026 at 04:52:19PM +0000, Kuan-Wei Chiu wrote:
> kernel/trace/bpf_trace.c is the sole remaining user of
> sort_r_nonatomic(). Switch check_dup_ids() to sort_r() to match
> bpf_kprobe_multi_link_attach() in the same file, which has safely
> used sort_r() under the same limit (1U << 20) for 4 years.
> 
> With no users left in the tree, remove the unused sort_nonatomic() and
> sort_r_nonatomic() APIs. This drops the __sort_r() wrapper and
> eliminates the may_schedule branch and cond_resched() from the inner
> sorting loop.

Anything else I need to do for this patchset to land?

Regards,
Kuan-Wei

> ---
> Changes in v2:
> - Drop the already accepted arm-smmu-v3 patch.
> - Convert bpf_trace.c to sort_r() instead.
> 
> Kuan-Wei Chiu (2):
>   bpf: Replace sort_r_nonatomic() with sort_r() in check_dup_ids()
>   Revert "lib/sort.c: add _nonatomic() variants with cond_resched()"
> 
>  include/linux/sort.h     |  11 ----
>  kernel/trace/bpf_trace.c |   2 +-
>  lib/sort.c               | 110 +++++++++++----------------------------
>  3 files changed, 32 insertions(+), 91 deletions(-)
> 
> -- 
> 2.55.0.1003.g10538fe699-goog
> 
