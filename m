Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793537483;
	b=vH8XGIj0BBVR8OorbP6+vQ9i+HhaiUPBslHnFHeZwrxRPFo16lGXAxNhHcjtxh2850og
	 Eofi66R5gs+/16mnATVvCYE3wLQfHkgDrAkjQ4yxqK2+vHVRglLlHSPlYD6PdJNFjc3iq
	 1PGou9xYyOguculZ7VS2d8qjAyEMRHLPJyjfZ2umegYJGL7XzsBPgu70j3CG/uqoL3870
	 gexDZ03tM4RQs8RUgm/zBAL042cruyHRftCt07LRFhvvM4OQUlVrxVN4EktkEPT9qvftb
	 nXCdCAZsrfo2fHMOM2dCkazKJZTiKWUH7IPWd8SZRWKiMut6Hg9STVgN6DG62kLZdaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793537483;
	h=DMARC-Filter:DKIM-Signature:From:Message-Id:Content-Type:
	 X-Lms-Return-Path:Date:Mime-Version:Received:To:Subject:
	 X-Original-From:Cc:In-Reply-To:References:X-Mailer:
	 Content-Transfer-Encoding;
	bh=bTf75aymh5jBl9eu/8t3zOznHSc9aBSs8jDGsG1P1tY=;
	b=rDD4rn3COXVtCtcOgZSFgZJ4TXd5rncPOHWVVYTUanU2NBC7Zk1NK9I8iX0rEdSS80aZ
	 EZ3VC1BOGnb7in0j4I4BSgMiFu2u9OKD7oe9OY6T39P0drJ1ojFzZoc+1TmZW+nNR+A1x
	 gBYmnePRBXQ61UD/u4fyu2uZcnQREaKRHse9KpfLeQk6/khfV5SZykoNQc1sG66iZnWz3
	 /mTNaswTjQyGovxVNzVuKUjvldgnjGZLmFDkx+PR43nGx+3oU719SYxeELQtL391UCbNZ
	 bdrqxN3EkGemY34ScDH3DfGCZDLRrBBRK+9eawIGTqrLgS8L0oAixNP0yB+MmnEwaYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dw1.io;
	spf=pass smtp.mailfrom=dw1.io;
	dkim=pass header.d=dw1.io header.i=@dw1.io header.a=rsa-sha256 header.s=lark2403231520 header.b=sdU6Q6pT;
	arc=none smtp.remote-ip=209.127.231.51
Received: from va-2-51.ptr.blmpb.com (va-2-51.ptr.blmpb.com [209.127.231.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A001606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A001606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dw1.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dw1.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dw1.io header.i=@dw1.io header.a=rsa-sha256 header.s=lark2403231520 header.b=sdU6Q6pT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2403231520; d=dw1.io; t=1793537477; h=from:subject:mime-version:
 from:date:message-id:subject:to:cc:reply-to:content-type:mime-version:
 in-reply-to:message-id;
 bh=bTf75aymh5jBl9eu/8t3zOznHSc9aBSs8jDGsG1P1tY=;
 b=sdU6Q6pTGdFUiNvz8IAK8o+7wxAQnpL+weLfM5dx470v01aoKYvx6t70phjo3GEa+LQdB+
 J0in4GLb+O7zD3Zpc/tes5MlBsbrEu7kGe0hlxTXlrLoF78+g2MOtzIxOstI0igjeAtgYN
 FyadbUTvfzrkLgatCN+wSN/0LbcQe0Ohg6ENFX43yJhiPPHMZM5BAO1tu+n1UdKA84p1xJ
 6Lo42L+PBnHbNWv0ekumgAh6Q3SMuNTNL2wBYJRXXtdhjBPQrqdYQrZjv9/2WTQOUCApCG
 CVhtcLF3EpvjNg5P0hbgvYS8726UYpzw69zPiMSLMx4zB48SOjjUqVUjK227zQ==
From: "Dwi Siswanto" <me@dw1.io>
Message-Id: <20261101125114.19009-1-me@dw1.io>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ae735c4+e72af5+vger.kernel.org+me@dw1.io>
Date: Sun,  1 Nov 2026 19:47:50 +0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from dwis-macbook-pro.tail904ed7.ts.net ([168.107.87.239]) by smtp.larksuite.com with ESMTPS; Sun, 01 Nov 2026 12:51:16 +0000
To: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Subject: Re: [PATCH 1/3] landlock: Fix layer composition of LANDLOCK_ACCESS_FS_REFER
X-Original-From: Dwi Siswanto <me@dw1.io>
Cc: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	<linux-security-module@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, 
	"Konstantin Meskhidze" <konstantin.meskhidze@huawei.com>, 
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20261030102411.12985-2-gnoack3000@gmail.com>
References: <20261030102411.12985-1-gnoack3000@gmail.com> <20261030102411.12985-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 7bit

I saw the docs still describe the old one. include/uapi/linux/landlock.h
says:

   * For historical reasons, the %LANDLOCK_ACCESS_FS_REFER right is always denied
   * by default, even when its bit is not set in @handled_access_fs.

and, for LANDLOCK_ACCESS_FS_REFER itself:

   *   This is the only access right which is denied by default by any ruleset,
   *   even if the right is not specified as handled at ruleset creation time.

So ruleset that handles no filesystem access right never denies
LANDLOCK_ACCESS_FS_REFER -- alone or layered.

Also, the comment above _LANDLOCK_ACCESS_FS_INITIALLY_DENIED in access.h
has the same problem:

   * All access rights that are denied by default whether they are handled or not
   * by a ruleset/layer.  This must be ORed with all domain->handled_masks[]
   * entries when we need to get the absolute handled access masks, see
   * landlock_upgrade_handled_access_masks().

After this patch, the mask only applies to layers that handle filesystem
access, and after patch 3, nothing ORs it in at read time. *Someone* who
follows the comment could bring the bug back.

> +	access_mask_t handled = domain->handled_masks[layer_level].fs;
> +
> +	/*
> +	 * Handles all initially denied by default access rights, but only for
> +	 * layers handling filesystem accesses.
> +	 */
> +	if (handled)
> +		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
> +
> +	return handled;

nit: I believe landlock_upgrade_handled_access_masks() already has the
same "only if fs is non-zero" rule, so this could be

	return landlock_upgrade_handled_access_masks(
		domain->handled_masks[layer_level]).fs;

Which keep the rule in one place. It matters little if patch 3 goes in
on top, and 6.12 doesn't have the helper. What do you think?

Best!
Dwi
