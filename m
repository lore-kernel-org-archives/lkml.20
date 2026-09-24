Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5844AEBE5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274725; cv=pass; b=YLfqit9Gl3zzmnxvEWRoP9LcG5zbMHCYgd52R2SOE7nB+tIEsGvJOmCFKDoRA3u4RRQnor/MlHvGcYPdlEnUTMYqwqIUDf9HYN6bmbx/tZEkHrl3DwIdDLSmgUl54vAbMFEGO+1j3rhSK8TryD0fx2WhR8WGnK9gPy02wcVh08o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274725; c=relaxed/simple;
	bh=uDFqkrBofJFmA98fFoYtS95TSJHuBD7aLkjCUtabUSA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ez9ewYiRBCdcNFK0r+C7/NUgYyACuMFkDGZ/irbY26gNZseYum7L2bGNtmGGWjzJMmnaSCw8otMOUj7mBHyC0wVGBsZ4C3R8uNo5doEE3Qoo9+DdDpVshBepnq3lxhfumb/1dAwKnESaEKgMJXWUNLY4Qa4w7rw79q8N6iAJMZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef9A01Oj; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef9A01Oj"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7b325so1327191cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790274723; cv=none;
        d=google.com; s=arc-20260327;
        b=kSSWJ5bbnCQytu8Sg5Hk+ws/eY8+fCaFt9DDcHmaLTbPGIMkFtVHUNBf7HMvcip2TS
         i80/lOJ8OupIxfYaY7r7kyqWZnxZfMbOWtXGSz7SZ1hiib8hPc1jwOcXmSVGDjpsZzch
         xsjo7c+QGVTxeSt/5W1ZBCzUOB5HdUmfq5bNHcUHMyh2D6Ki4Qj4QfqLtdPZr5CcW72r
         4HEtE3RCXrCW/KpczEmfSKq4l6qldQD3AVOGtdyY4tyIvba22m8uvH1vqXw7uZB51EL6
         WkC+/zP5+PcQrrzhTgnwq07RbEE48CM1DAZEIIM4bVrNyBsysXVnjXy5dME4LaAUgtFp
         mMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uDFqkrBofJFmA98fFoYtS95TSJHuBD7aLkjCUtabUSA=;
        fh=6JH7MtqVBEOp2WWunsv5ABNLHRo/xrMjhkkyEHeS8DA=;
        b=AoYL7xCGliEoMGVdue8MfANNR79yedeluKOezxx1bk8RZRtr40Pdc0/ED+acPiGsJF
         xJ73qo8eFbVeNYBwaRCZO//9nEki8DjPQaMqWnILmSekC87NErlr4YHkot9r2ymmiFcf
         c4yEPjan0GTHz1WqhzBZL41pBVX1D9kLDc+hbpyxABzyL8tjlFquK1LylYD19gRPLtQs
         LpCB0uLf6FdYyChDJZgTuU4EyOio/Z2tfSi1q4J7/qTBtZBZTTlGYJms7N+4R0hj0MhC
         71n4uq8axxxqSeq4EMjzc9m7t1kJ7hYx39NgKNONU/OkSieq82nYKGmtA/4oSgDOQJaX
         77wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790274723; x=1790879523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDFqkrBofJFmA98fFoYtS95TSJHuBD7aLkjCUtabUSA=;
        b=Ef9A01OjUbxgRJxq/vYPVn1SxkuYa1Sr34IYVH+zc3OHrROYConvoTwGKROe3DRu8n
         TMxZyVFExpi2rsbxPZFBXepZdqrI/VgxmN8jIDegMwMC8IFOBP9b8EegVbMqtpwfMIsn
         pfNL68m8oPBuhQNvKuSr+LReDKnNLnZ06gBhtZQNE2Fc1hcsgXtQYRgDO5mnP1LLzVLn
         rZWeK4cJKU+C2D+BeMJw5HwS1tMvSYiuL6TLs9vcndPvQPRMuJwivBwujLit2R8IrjHi
         M9pozIBfecpYJxbxPK9OGrrz7J7C54Nbw7OpEU3b2+AAdpdG0SSCW4AMkZ/YShMNUOVO
         y2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790274723; x=1790879523;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uDFqkrBofJFmA98fFoYtS95TSJHuBD7aLkjCUtabUSA=;
        b=TfcNMSbj91TDfGLe/lyM80nEoE7bG8URcenTZb/yHSGN9lkqLHmsStTSV96cAT/n2l
         I1IM4YhyrbhtwO/QOT9OKNBMLVSd+81Tr0jQmEXRM/dLCC3hFEqBzcfpj+eCblWcvSHV
         12qc0xLwKMX8+pVlLdtaft81Ck6d4ekYMyD4ASiTGxLKJVY5EBESHmjswxiDeNmLcF+J
         odeX7BBua++vSjkthuSmqt0iBvQOeA1UlpPb8Ymq/xRQTMy+5WYXsYkCJ6LSYQrkDeFB
         ECxqlvXFpSKrBeRwcnNJLB3bZ52/zmtMo3/yKEVqvd236ZPitLMsIQnv9JzNQFAJwcsT
         sDGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8ODeVg0wi50T3LwurHAzB5TOQgYXGF/adBIm+O11qZdtyZLo5pkqD1DwOahagMJtkAAnGERXzy6xUJ2k=@vger.kernel.org
X-Gm-Message-State: AFuF++nh8tdoEpvtb7IF3x6y0xNlSNSaFkZfps7AtOowp7B1OO8qpe+3
	37YXKeezEhsoqeuGkSIi+tvF2UZbI3xJD7P+Y2ftXg5Oy54+t6MSmN1ZzsoiRZdTFdOyYYp7iak
	WPBryT3aCIW/zaWixkyK2CkNzm3wWpe7HdgkS
X-Gm-Gg: AYBFou2NDEczBV+EuQdohBVSPxcvct5WGNuBSH+0/7BNBBYKLtZseafFV7Q8GCM1IGa
	z4r33HdhdRJdPTz3PP2GZF0z2Ezx6QBPIwrN+GaFuzOuzpqWgWxSvhYXTiklE6juMwrUFl0usO1
	9nyiwaR1yu3xwEqmTZo/Okau20S1Ag5xUY1Znd78ufy5D1nzg9fYaG71JKLmFidlxmNd1X+PJ+J
	0WOoo6HYlKYyBlK/+sZ3TKLxNRr031LFILGmsBCrx1Qyg1B0vDqsHgoxbFaGhOXvKcxOteojjkN
	R9GZnR/XlSfs7vWlulhzy9JURzUH0xrMvLStLKgfOFEFXenJ4UDS9mNi
X-Received: by 2002:ac8:7d0f:0:b0:530:e84c:b78 with SMTP id
 d75a77b69052e-5330b68e8bemr2036841cf.31.1790274722403; Thu, 24 Sep 2026
 11:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: dave mad maxXx <davemadmaxxx@gmail.com>
Date: Thu, 24 Sep 2026 15:32:34 -0300
X-Gm-Features: AclHuK9k-zCUCCzldXTWIeyxKaAWif5I0sMbi5qh1YqkqnV0579Wy8lN53oMJks
Message-ID: <CADy8qZg5agQXatUFynt7s0QGKqFAzg9qsV_zd8OVcsrhbvF-fA@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel paging request in __hfsplus_brec_find
To: syzbot+f957cf00261d1c41fafd@syzkaller.appspotmail.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, Viacheslav Dubeyko <slava@dubeyko.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am following up on this HFS+ crash with additional diagnostic-only results.

I recovered the 25-call syzkaller program byte-for-byte from the
published console log (6553 bytes; SHA-256
c0638cfd888ce9e61abd5d82ab9afeba058d3b42940b2ab8469d12c4f17abe7e) and
ran it against the matching investigation environment without fault
injection.

The natural runs reach the relevant post-split hfs_bnode_find() path,
but do not reproduce the historical failure. In the current passive
trace, node 3 is created and inserted into the hash, and 45 observed
lookups return it with error=0. No ERR_PTR(-EIO) or target crash is
observed.

The published machine disk image does not appear to preserve the HFS+
filesystem state at the instant of the crash, so I cannot yet
determine the first divergence between the healthy run and the
historical -EIO path.

If available, could you please provide either:

1. the HFS+ filesystem image/state mounted when this crash occurred; or
2. any pre-crash trace/log around hfs_bnode_find() that identifies the
node and the condition that caused -EIO; or
3. any additional execution artifact that preserves the HFS+ B-tree
state immediately before the fault?

This is only a request for missing diagnostic evidence; I am not
claiming that the original crash has been reproduced or that its
natural root cause has been established.

Thanks,
David Maximiliano Hermitte
