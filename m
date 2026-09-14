Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA7237F726
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412431; cv=none; b=l3ERXE8vIlxOfc/F2HVDd+SxL1rLUlQBjvZITSczDuFQo63foIDMeZrnFMFFo/qhBF1pyQusq4FnpS/LeJR/8w7y+W0Z/fwljeAa+TCkLoQqK81oisWDwuHL9pUHxDJtI7X8Tlhvu2YfDKuP5JZ30DzC6Nk38pgxrQhyE3NdyrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412431; c=relaxed/simple;
	bh=Kn4aWQrGk6gnFAK1RuegAPvSUSETJ6S6j+qIoBe8RAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4meX3G0KhTRkHzLe3VUMmqF/Q3zlwWHnqxDEEEZtvvcQHOxBLYndbSOjcVKrTfJ6jba8fkfIC2E8geiXFKR8fLeRpH85sLsaSV27N0aRj36DtnL0RxxjHOWsp/ifChAJTuVlyi+QCcLTnF/2qxjo7ZIYY/6JN5WKAZoGJOtGM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmXw8V07; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmXw8V07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173291F000FF;
	Mon, 14 Sep 2026 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789412429;
	bh=NbtN13PWQSVAvRZH+CoCA78d0mM+5H17kgV/5pIPbNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VmXw8V07dSdDTIHDKRMZpSoWtfg13PFpqBuryVNGJL8sSORlLEdf2o8oz8Td+gsFa
	 0R5MpEYkKBNMb3Y3vK9nxR8HXsGLkg3vBdAvA/2fcJqmV0qjcPiMYKCQc7LUFjAcAZ
	 Ip1/v/FD0gUr3j3TLYWZCx/ssy79dAb7dkWD27wvPs/EbvfjuJKEpNvGi+s7KgkaqK
	 eTJKuMYcRR6GF6JE6kxsU/+luQWRrH0UKWw3MZq/3KUNC/o8dNyq85wnL9q1rLOa7S
	 /dquBMnVRQlrkYed9yauOE8Bt9+g7apk9ilnE6rpexS/2tP0tVK+jYUF7Rh5W3pfrE
	 ul0w1ReCPDCgg==
Date: Mon, 14 Sep 2026 12:00:26 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Brian Johannesmeyer <bjohannesmeyer@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "scripts/faddr2line: Combine three readelf calls
 into one"
Message-ID: <aqhDm60zSZIazrnC@jpoimboe>
References: <20260905012449.3872882-2-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260905012449.3872882-2-srikar@linux.ibm.com>

On Sat, Sep 05, 2026 at 06:54:49AM +0530, Srikar Dronamraju wrote:
> This reverts commit b8d9d9496c1e ("scripts/faddr2line: Combine three
> readelf calls into one")
> 
> scripts/faddr2line stopped working on PowerPc systems with this commit.
> 
> Output  of scripts/faddr2line on latest kernel sources
> $ scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c
> $
> Output of scripts/faddr2line with revert
> $ scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c
> need_active_balance+0x1d4/0x21c:
> imbalanced_active_balance at kernel/sched/fair.c:12047
> (inlined by) need_active_balance at kernel/sched/fair.c:12061
> $
> 
> readelf on Powerpc when passed with --file-header --section-headers
> --symbol --wide option doesnt show the line
>  "There are 62 section headers, starting at offset 0x16f1a850:"
> 
> Hence faddr2line parsing gets broken.
> 
> It could be a bug in Powerpc readelf that this line doesnt get printed.
> However since its breaking with existing readelf, its better to be
> reverted.
> 
> With the revert, we end up calling readelf three times but this should
> still be fine since calling faddr2line is a debug tool.
> 
> Fixes: b8d9d9496c1e ("scripts/faddr2line: Combine three readelf calls into one")
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>

Can you run

  bash -x scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c

to see what line it's failing at?

Any chance the below fixes it?

diff --git a/scripts/faddr2line b/scripts/faddr2line
index 622875396bcfc..550c0f9b9d473 100755
--- a/scripts/faddr2line
+++ b/scripts/faddr2line
@@ -78,7 +78,7 @@ GREP="grep"
 
 # Enforce ASCII-only output from tools like readelf
 # ensuring sed processes strings correctly.
-export LANG=C
+export LC_ALL=C
 
 command -v ${AWK} >/dev/null 2>&1 || die "${AWK} isn't installed"
 command -v ${READELF} >/dev/null 2>&1 || die "${READELF} isn't installed"
