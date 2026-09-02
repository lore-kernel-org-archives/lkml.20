Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B753839A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372277; cv=none; b=A5+th5XIet6RqlAZxvbgTCLEeUDH/zMerwjZI1KhH/ZH82vNwb52ScjjybwsL1DVAkIj6JQ0VXVubEdv+LKI0yJSVvSuzgmqOdfxyHFOsBSk/V2iGeANxkw04+ZIH9qyLfJPNBSA2pKftHugPsyQh7F045nViw/tucuO9AVy5xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372277; c=relaxed/simple;
	bh=CfTWnNxSJggP9yjaDpB3r0Rkf7dLaPcJdZaM28btY4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AESPnr7Frgqi3h7npgdeG7PYhjvl0in2d6Jvhjsr+g9+qRg5aciofA4ABbVXzfaw5sBmq4hWtiZpOufpfNG3NPBNX6d7/CgooHhK4Q93GolKp8m/EvYYIAf2ToCAiKCE4KE0NEIOAcjtreJbis4gCcUSaPHs0IkJSKZ/6h/EDnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3L78KG+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3L78KG+"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1a3bb6c5dso13185111fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372274; x=1788977074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3eSWRBHdZ/8X2dHJRKHsprBiq+T7ne+lI7EooU3WQuw=;
        b=B3L78KG+10VwKobhvdswaiLwCwXYb1ntz6RluckkKfwFVp9wu2M4NJFZLnZsjkAkZ8
         iMOQP1jfXfFTSVJHI7/hxaa96UO/DUC4PthgKaVBOJvGE+a00GiyNPaHAdTNG6nU02ud
         wMs1YLtd7zK7JYZ7odwsOvkhJ3ErLaDuWcMn2g3I057J0d7C/+20Rdjm7vvFyPjDtnMy
         20AOyN6oTM2o+a3eqnQGL2CrFJSO4YATyuCcgaKWFKydhhH/xe9rPEbFC271rZrpQsFu
         WAjnyE3o9nn+un25yCjap4A27VpoJ2WPCk3JNIHFa47g6EavPSkJLGhHzigjguKLKJmJ
         io+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372274; x=1788977074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eSWRBHdZ/8X2dHJRKHsprBiq+T7ne+lI7EooU3WQuw=;
        b=ahDVvS22VqVtIATfsXDq+AACVctQI6AZis7WJOH7SRRR3jy4ssoMymjI7FgfLGK53x
         0HsnPkVl0doYol+w69NjjiQ2AMP6T1fh6yfhOWyiZuFvkBhUvZa02OBlljRvNnj8YfrG
         1ZyA4henwNG8XqH49/jAR3yxbl8K1cN9w/8nY0hSPWb0ycAMcQMwCLuB5gAwFYf/uOSe
         vXsBBZa71ZIvZ+Bkq7N6T2jIKrTswBUfAJ7DDRf0nxA4p2zlTx8GHIcqKKUAWq3O5xLC
         Ent09z5vB1nTtRLeggWV9AudLEUQHSp26LkIqRD0IM+3zhMoNweBmDAmiez2xbJXqQMH
         S8QA==
X-Forwarded-Encrypted: i=1; AKwUvBxFpSANF7LHDx3luW2UJ7rV3s9tp7Cv08LZwVTVIYM49DYFCuFkBjvVLKI7fvsvc7rEG3neumP2J42Dsu8=@vger.kernel.org
X-Gm-Message-State: AFuF++lgUI8nN0Yo7kK1bdFk5HyWqdkxwZURpBewFtM1cOI6tbHzb58N
	bnaGzefIsmhbAH4kaObd2wCpEhWQ7FuZzZc7bV+tJR8tgj8Tq1ZGsKng
X-Gm-Gg: AYBFou0NuYhAt2G7C+1Hg+ai24u1VMB89uI0wV+R8pFfuiJfFtA4xutAEynvm1yp03M
	I9VP+k64rkANyFaPD/rzwevNQqRJyLsZ5XhYf6wYkdPzuI5LXD15u+NAlR/VKQKwg4wxIOAZGrf
	Fl20406FDH+gM7DCjo2wEoPIHsCqgz46gFDNhmt1Uyn2uSpUD5hlWFOXg1WUSYH/5y55mfwGoaW
	hb5AbaJPOiwuzM36ooyLvJPyKtUMRBtmTQ9MRsmBrFsZ3rILG4vojfnLVJvm6I9vtm+FKUKGLUa
	e7Kgq/QLgeQHBhrTtN+TTXRVCA2PtK/L01dPo9xmipjnFF/Y5iPmsjTBcg03brPFOI1rCXleIiL
	jQ+2yFHLczZe9JdvtQ3Wg7TR8TTH4PEuO3PCV8+5UdemPYAk1wh5sLSmDqTnAxPAvsn9Z310PMz
	bY4mu8KFoba4i9d0ujXNyzIAskWSEyL+TDUA0GAH6hAUxLV0ow2Eh7iNWyM9lYdBmBUbGLdR5Yf
	RS3PtUr0ii6qhXLm/F1UGLgZzPr4Ldr1CmcFqCj0BxZBfsjjtpDinuoFqvs/5/UO7oAJknaqxjg
	btdb2PNn6t3pTMH0qVBME75zwhufu9dDbGjlse5BNT6OigQYDKz6q/G4pCg9zuGc/Xd5sX+RG0j
	upctY7SWziA==
X-Received: by 2002:a05:651c:a209:10b0:3a1:f671:b2ee with SMTP id 38308e7fff4ca-3a34fd283b7mr11486751fa.8.1788372273337;
        Wed, 02 Sep 2026 11:04:33 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a1c2-c401-11b2-c123-0d12-6c0f.310.pool.telefonica.de. [2a02:3100:a1c2:c401:11b2:c123:d12:6c0f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad2699bsm8235851fa.35.2026.09.02.11.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:04:32 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:04:30 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] keys: finalize persistent keyring timeout after link
 attempt
Message-ID: <aphkt2PpqUFcTvun@gmail.com>
References: <20260901191743.39210-1-kmehltretter@gmail.com>
 <apdZKMddhZoASXmL@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apdZKMddhZoASXmL@kernel.org>

On Wed, Sep 02, 2026 at 02:00:56AM +0100, Jarkko Sakkinen wrote:
> > +		*persistent_ref = find_key_to_update(reg_ref, index_key);
> > +		if (*persistent_ref)
> > +			return 1;
> 
> I'd return -ENOENT here instead and not make return value tristate.
> 

I don't think using an error to mean "found" is safe. keyring_alloc()
can return -ENOENT through security_key_alloc(). A BPF LSM key_alloc
hook can return any errno.

I checked this in QEMU with a BPF LSM hook returning -ENOENT.
keyring_alloc(".persistent_register") returned -ENOENT and
KEYCTL_GET_PERSISTENT failed with ENOENT.

So -ENOENT would be ambiguous. I also considered +EEXIST instead of 1,
but that seems a bit too clever. I'd rather keep 0/1/<0.

Thanks,
Karl
