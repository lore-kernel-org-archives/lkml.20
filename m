Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345219;
	b=ghAYbx+XCIWtahQE73gZVwOelZX07xaXSF1exZdTdEar84lb3GI0yjwwkGRDQAUFo6ef
	 OR+QYGwu1WkK6eCVS8qmvipfMvgnTdK3CUy1Dekaac59VBIPSLnG0s9awTKmtGlNWahGS
	 JELI6jAST/SBPh/zHD2OAl2U0p5xEfeYpCuVJXMyb9y+09ymqnAexyr0lm6T85JlaOsA0
	 REWycWoCFj5GV4aX4CPipPju2J1MhZ6zaAWraeliIXEpAxMTbRxyeb82rHMP0rSTWf/DL
	 OWXS82uzV6ljHmtvEt7KZ7+jO8Xaurt+4s0F1el6gWq2MEUgIcF6tZHRNJJFu+vrjHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=lmB6Hd3K7WIxkVjF2clYujbDcz9bAuhj2rRE9NRLJbY=;
	b=R4j0jZ36WMEdHX00onKzGPClA3UrkpzxB01ZBNKl/XEezefr3pIzp+miB2wB0w7d7VXG
	 wPVd6Iwx/zmetQwkjBmLyhn2zmHl+wmyXri4cRM+dmoQNspfyhXhHZYeIZLWl3OAp9K7y
	 y1sgP5wHir5c6/JZqj31SvIIwNCkV+8zO71DuI10oL9jR5KNX++l6Ys2ELgOuGKT27XlT
	 4U7dyTV51RavQ75pLScMQOlo76b5mlY6JT6m9cPhAos+oa2J/4Ki03ZxfyTad/ajd5Qam
	 VWWejR7tYjQbZ8GG4JrAtqwq+l5djYD8++uSKn+TwfjDsoZwAhjvUvbWYbHmgy5eNpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vo3EESPq;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7AA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vo3EESPq
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso24274385ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794345218; x=1794950018; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmB6Hd3K7WIxkVjF2clYujbDcz9bAuhj2rRE9NRLJbY=;
        b=Vo3EESPq3s9qTUdHxZQztaVmL9/aC6NA99RVdFQtk9Th+ZTKg9qYYfhND0p7bl2Ono
         TKEZzBVyUDd94dL+EodmR7LYSoJwCjvdZgB9ZeAC0kJ6A92dJk4tVSiVyBGJNxqXFimF
         863enSCvrOFGp8vbu/PLMUTiA9LrYBwY44pEZQJreOVW9JJ95WuqfvajZPQIEZ67wlDR
         pxFbIaMkVWIrXSbv+vQTTqOPl89SM1A7fIpxKzX9w58tvNljYUThGupW7rB+ztbIsNpX
         l/x2bgq17uZi+Hnx3ht5YlWb/3u4BMoXjgx1i5np6J1DvSLR/gg9laH+hxxuXT/Vt214
         crrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345218; x=1794950018;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmB6Hd3K7WIxkVjF2clYujbDcz9bAuhj2rRE9NRLJbY=;
        b=mhgy+I3TLNGPQl3Gxow0vvVxskHUe2kIhlGq+hkMEIYmC4RENhGAKUXrLQRE/rG8Cv
         eE8PlYrMMmGWnucLpqH7Ag8GVJySZkCPTyWbzwWwG1YigqhNfs4c4XuVawcbj4YPwHVA
         DqJXU1NTS7bm1VYiT20vE3d/eHXgo3lPJVc+IAMHiLpga+Dwwd6KLMYMo5DgliQsrJZV
         u2fSC9q4revE2c1RSMcTy26At/sDs9hhBRSXg4OGWsIp3yBGaroJniLOSS5mPnVCtHRT
         CQZaMo8jylT15OhYpk26Grd7+Rsp7rvu12AvK07VOJ4P+AapEwICyPgF/1OFOMj7CC/1
         1afQ==
X-Forwarded-Encrypted: i=1; AL+hErEPaIy2Fcsi038sOIbANT4azlEYxnkPaBqGrUV0ZRNT2Dmm4FiWUjr/2EAtGmydM9ttCtSFzxfuHJG792I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yNSJJASAeXjSvCKEnejfhfLpjVgFZUNNQ2CE96TvA39wpaIgy
	m17tg00yxDL4gRVzKXKBEPQoctFvCuqPKXKfTRLswSKRh46lt7YmiejpV0B7RuBY8bNVMf81map
	eeE9dfw==
X-Received: from pllh5.prod.google.com ([2002:a17:902:7485:b0:2e9:fe74:4523])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c8b:b0:2ed:2176:2455
 with SMTP id d9443c01a7336-2edd7b864b2mr3011055ad.38.1794345218010; Tue, 10
 Nov 2026 13:13:38 -0800 (PST)
Date: Tue, 10 Nov 2026 13:13:37 -0800
In-Reply-To: <20261103220337.3578111-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103220337.3578111-1-skhawaja@google.com>
Message-ID: <avOJAY8HvkTClshx@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3] vfio: selftests: Remove libuuid dependency
From: Sean Christopherson <seanjc@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, Samiullah Khawaja wrote:
> Replace libuuid with a minimal uuid_t and uuid_parse() in libvfio, and
> drop -luuid from the build. libvfio only uses libuuid to parse VF
> tokens, so pulling in an external library is not worth it.
> 
> libuuid is often missing from cross-compilation sysroots, which causes
> the VFIO selftests to fail to link:
> 
>   ld: cannot find -luuid: No such file or directory
> 
> It also complicates building against glibc alternatives such as musl, see
> https://lore.kernel.org/kvm/c2f7e904-2646-4b01-864d-d185221c7f56@gmail.com/
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---

Tested-by: Sean Christopherson <seanjc@google.com>
