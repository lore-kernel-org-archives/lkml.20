Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069308;
	b=ysqAKZdKWSG/UDsCgFnpLbSmjtIIkLHA3z2/r2H52bh51lcCBHAzPnrogIUooUwUO8f6
	 eV2IHuFShid3sOjL1QBMjajukFiLNKsJ9GJ6YEtxg4rzh3YhwDPFxJE5BFjXp3b9nmOCi
	 wD+gnSPOF7Fdc8BZeG9TF/mbFVzmzNaU7F/3XjxFXIqdoKZgqtW9SmUBOjEhR0z2cfGLJ
	 7e+l2JXDnEe7qEezTasev8xgr97rb6L+acdACQfgZBTtD4irldnpO5vkDEVuTRO5keNR2
	 xQVvwwcPFWzn3+flG7oXjxsTedxdjWn0t9fQgO/YYNJDA0gNUr3KlSbC3iuFKOjSt2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=t9lxvGsvnVKAYbZJhO8MAWe0ocVncbdFnsrj+9efmqA=;
	b=ilG6BUVFSgmNtVkPLh4Yh67uP30wCwwm9CvL9799yDHoBQIQR+Y00MBQRPDai63GELwg
	 AkwweCBT5xjT41WSMnQcjWlbpXGD89QXEX4B6bR+5xOUoEfBS0Bd5U0BPRI4yxm3WHWj1
	 Ytx0ZWhnDX6ePW3i/ySf3mdl4liPFA14s8XOg8iDgK+DadO31ol8yESDHn9mS3zsD1KLW
	 fUyiW1CBgIlAADO5uZU6vi2ALivSAyCnmUFbZjg0mBjw/aLnAAkon+8WUj2LjswgyaLv/
	 LWr4moUr6H2Tf1mAAFF8fovUrXnG04P9LyxZHXzUECUrPB4hRzhmC3TwdrA1Eqiqc7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TNBOtk8t;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D82606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D82606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TNBOtk8t
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so965135a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794069307; x=1794674107; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9lxvGsvnVKAYbZJhO8MAWe0ocVncbdFnsrj+9efmqA=;
        b=TNBOtk8tJLyhYRYcUZ6jwm7nfKmCagIm7N9TXcmUQ4pXY2fzS+SzU3GmVAphRD0tsk
         Dj3u99LGuC/LtlzRqD9RcW80Hof0n3tV5DEkhPOUd167Ts0jC0urKJHx+1EL05HrKv3x
         34CgyoRjK0WnQ+PkZuLCnhmWTLd0pbIXEN9hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069307; x=1794674107;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t9lxvGsvnVKAYbZJhO8MAWe0ocVncbdFnsrj+9efmqA=;
        b=dkTzJPqgp8Nn104VtP9V50SY3IPTuuO5Va5uR+bbds3daInQHJQ0HU12LLEoO1D0Pv
         ca7QoKQ4wMi/2I2aAp8rHB+zZLJ1tV0pCSzYpyp9RRBseaa3SBR2kd2E4WJ5NaMKWZG0
         +kEx75RWdEs6XMbX4UXhl1gDM4Ma5K8YGvDi29Zp4BlHEwgOeDQX0tUcWaNHW5gyGB9t
         fu5ECSL+e+OOtj5IhIgPOOTY92nJST+qWPc/yWPjgZueK00bJNZTO6ecwYW957NGtVHo
         o13V4zF2ehQN/sd6avp5e3dXEmnqZ/45FQxbCtALlvxXdjTK3LFUeO+n+dNRoMc2ogGN
         qghw==
X-Forwarded-Encrypted: i=1; AL+hErHLKaV9vdkeZTPK7/IavfYM10/ntAPeAxOu4nrtusXipxM64P1sUjT7TM0A952NGIUaiuiBEpI0FjSYwRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QhJDL/yM3NXbp/ejpC6NYUUpIKzFV07EWu4YmPYz+0Rs/pnz2
	0ZkbMtde8pxC5IsuENm5VO3CveIVl1FUS82RMgPAHjuRHy1sPK94B0sBJbOALtK0e00=
X-Gm-Gg: AYBFou0/FlEkuZ1iz4MM3YHjgUekqEkEqIP+jJAj+OYQOZt5fuUZPl3IXYJkgZqmwsE
	sPOJfgvq+ye6E1gu7oyQwkfcGs8rlju3NgKg/NiMzS/nxntQ+cE/Ru4EKV41eIe29LGFAtXdYCy
	mmmrtNeC+CauMzxT7eY/KQOm1pU3VRgZMcT4o/Z5PgoOCzIoEroIjidcNuXfmN4mjtfAtcVXcgQ
	8INLTTC7cgAwokjsy3Vws6CUc9+sc6dFbOFmPOhT78HEMd6ZRArp7DPuimyHolH1ExecS13Hcgj
	pZZ8ebQu/+d/WRxqeQxQCnKmrm7B9sZ5dQ7xABCadSuaRgE3hHKLwDPH0CUztWeqS4Za9XaEI3Q
	5+9n5SSR641mGGl0GmPXOGDvQBkiY+LEtQ8V9o1PBSAXKhIh1fXqgYQRU3ixstL+toQlZAcu9gJ
	CE7LKhj+6r1yL2SqcyS2dM1YhQnIBeLQ6D3HgKYnZ0udLGj1vHTW2vRnhu9eGtjAA6LMnIDlxg9
	bH17dYLvqlfSIHj7z1eI0hqMH1Zfey3poEbkNEBa+VrwTw+fN/RjsvgzOl7mcQdmXF6rV+jsp2M
	GcW+lErW4mwsXWXvo3tRi4RuH6sSTMow5rqxg1Cgdu2ID15feyGY7FEP860p4FkbdJMBo7BEOHa
	FtqUwN5JPjW8/VynMdpRVpML6qNNw5h29CulKpB9Nr6TcM1AOLk+xSwUgIT9tloLN/lpSrmxdHF
	bO3pNGlEh1O7mXw6apjCsfIDBTGTpO/dL5i7GAOvER+79vyWuTDVhsmg==
X-Received: by 2002:a17:90b:5107:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b0db6e8f4fmr5544638a91.50.1794069306903;
        Sat, 07 Nov 2026 08:35:06 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a80a1sm3974994a91.12.2026.11.07.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:35:06 -0800 (PST)
Date: Sat, 7 Nov 2026 08:35:05 -0800
From: Chris Down <chris@chrisdown.name>
To: "Martin K. Petersen" <mkp@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/2] scsi: sd: Fix WRITE SAME(10) data corruption
Message-ID: <cover.1794069087.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

With scsi_debug and 512-byte logical blocks, a 1 MiB discard at 2 TiB
succeeds, but it's the first MiB of the disk that gets discarded. This
happens because the starting LBA wraps to zero, because it doesn't fit
in WRITE SAME(10).

Write zeroes can also run out of bits for the block count. With a
0x20000-block WRITE SAME limit, a 64 MiB hole punch sends a count of
zero and leaves the whole range as it was.

Let's use plain WRITE SAME(16) for write zeroes when the LBA or count
won't fit in WRITE SAME(10). For discard, we can just refuse the request
and leave the data alone.

Chris Down (2):
  scsi: sd: Fix data corruption in WRITE SAME(10) write zeroes
  scsi: sd: Fix data corruption in WRITE SAME(10) discards

 drivers/scsi/sd.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)


base-commit: 04feb5fd2c23894ebc2cdaf4a4cc38b8667b17ac
-- 
2.54.0

