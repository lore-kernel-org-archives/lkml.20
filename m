Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B436F35CB91
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789816739; cv=none; b=X9LjhF7u7pFwnhl9F2Wv31Q4clJA0ctCdDg7QrWnQVjGIzVLw+QA4fJQeB3C9kjSGDCqiC3haK3MpF4M9EPyxg35OkJVEAQSl4t/GuMY4Bf+qUMTW5HgTpHj4CylwwkGdMFMxvBMSyRNRLHYk6hZc+7bdOro8UDGJDYpUUXqLq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789816739; c=relaxed/simple;
	bh=EK5NOsU/d+n1xt/OT5dWDkdgXtvBmg0Qf+2flcG40Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwv1PSmUVPv+ED4vd+SMkv1Naoan+RyTX/OlO7y370Vlbctt57dS/JvNnpLoXz3HCaR4C0At29+h5OtCHAAWt4IOFnJpsu0UaE/jJVNr+DLbXJhrhsCBSRa+Ma2EtBlwW1wtn1/GeXYYqF/Lbqo28rbhWbWOj2S+YhveVzL6O5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qS+8jpRD; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qS+8jpRD"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1218023a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789816738; x=1790421538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZJnRQH7738x3rysqogynlQS2Yscli2NgI3HJoxKRb0=;
        b=qS+8jpRDmp2/O+snwZLD1UCWQq76UjhQIJNJWd72peDsMZiXi1BcQ0BX6y7LtOF+Qd
         MWUawX3KwPJMSpuer20V6DOcvoXYcaFO3xkN0O8bX/1S1JmiQspIVAx84SLJwNf3jcQn
         TxoFlKDp4u1xHu/nWm+es84rp2DO6AkCjFS5OJ+Gv5nPjIOTKnYVL/wNlU2GBZs8Gcnm
         A73lOfd2ka2glJAYFbWrChSthj9E7fEECkm46qBKnQJDytxtuGM0XsuxYsFZH/0rsCjK
         i+U4Cy/uH+b9m4UmNbCLzrM/UwAy88PdOWgyAaUhOkfanhkh4rS1yGNAniV5DoFOV2VT
         AiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789816738; x=1790421538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZJnRQH7738x3rysqogynlQS2Yscli2NgI3HJoxKRb0=;
        b=zHFrmtIjJJpToIZRsScTUFp7WhoiPjQ0l0q08gaiRCBIvJbz9UFvqac2hHP57yCuaL
         gGQHYh6gIXLGSSdIeeOFB9fZeivfiZNl491HEjg5pWKO4a2ewtuWTWwinxozGsULaDJF
         /M+De25k2dS/5ZGwMDB0qlw6+hk3/VWofe7wn1Zg7db2GWC/l3s+aret5W/INay8ycQw
         RrrluA43G4xVd5Lk2IskKYxssBGaEOtXwrFUN9uXE3yjGMgJdCQnjr/t2sG6jQCn6cAY
         NowcelVex1KRqmFx9ZJhaIlzk2X3tQSxEgHqWp4Ur4IP39WtmIfQjR8yRNmSAOEwDE08
         ehkw==
X-Forwarded-Encrypted: i=1; AKwUvBzsR4nzfvxO0q4a1cWe4VQqhPKnEGqBX4nM4tndg72JC0rWiyn0Bt7ohlHDUsnualY3WWyVmk7bLzeRH1c=@vger.kernel.org
X-Gm-Message-State: AFuF++n7ah5EKYR6OqMPvx6S4jYyU6EiqkCJgkSW0EqR3TNdpf1++XJB
	loQ4YHZNhnMODqoFx5RgM7OYkf2/NMdTqdYe07rTeSBBPEe8Ol5TmeJ+
X-Gm-Gg: AYBFou3t6E3LjPwjGbjp2zYMt/ZzvIHcjF9GgYJ+2rw3xK356UEOTJb+MpcVOEZfuW8
	nwSHb8faLrLszGofipwqRIlQmGFg6QBYGsf7BzpsYBmRJOm/KvS/Hf3dhd96QRr5uP3w1DOB8yD
	Z6voj8qro2Vfkn3j6u5UrkpUPjj1ekkJwnuBio0aLIZJ58L9XpTUgFXAdxlHgKdvbV5W/w4K8sl
	ISQK1WuyyhgY1hH2Qq9WDCqggwg4GKTIZuIXjEW3/gzY2bx0WuFFtzYotGb1YBnTYsg32KTGnY6
	5+1xhblZScnO3d7cHraqOAXHvkNkCMgFPynPwemJ/kvv9N5wwHvjuqHOg8Ma5repO6jSuJ+fUFi
	qiJ+TNKTXO1ASfwLntq9yg/aPzgeandjD6aalJQkdQF2r3fe9ChyOoUPc0ZFlJ4xUSjzILbn9AR
	g3D43AmY/5Hkpi6DrTyuO7VzQVcnim1JTfzlpfzvgaGduff3hcOxBkc/uIslLxvU0dbj5ihGt1H
	Ngm4FT0Ur63CXI6rGn+Ik+wI53hx7YZ+AwShNOMkfozpY+XkBaOF1yvdQ0XH/ROzVZgWiT+465v
	DPdbbMHyd8wuvck5/b7q7OfZsg==
X-Received: by 2002:a17:90b:4fcf:b0:39e:6c68:1550 with SMTP id 98e67ed59e1d1-39e6c6832d7mr4987578a91.24.1789816738012;
        Sat, 19 Sep 2026 04:18:58 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02738654csm2153372a91.3.2026.09.19.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:18:57 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 19:18:51 +0800
Message-ID: <20260919111851.678-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0c0c19d0-997a-4c8d-a103-2b3d153f4e32@kernel.org>
References: <0c0c19d0-997a-4c8d-a103-2b3d153f4e32@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 12:10:56 +0200, David Hildenbrand (Arm) wrote:
> Are you measuring the worst-case latency of a single write fault or only the
> average over all writes?

The single fault.  Each store is timed by itself (clock_gettime()
before and after), and the latency numbers come from a pattern where
every store takes one of these faults (one store per folio), so there
is nothing else in the average.  The tables show the median of those
faults; I also have p99 and max (i7-12700KF, in a VM, us):

                     v7.3-rc3+              patched
                     p50   p99   max        p50        p99        max
  64K, 1 fault      0.42  0.57  25-26      0.71-0.74  0.96-1.10  28-60
  2M, 1 fault       0.50  0.67  0.7-1.2    10.0-10.2  12.2-15.8  13-22

max is the slowest store of a run, median over 15 runs.  The 25 us on
the base kernel are interrupts; the VM has those on both sides.  The
2M row is the worst case by construction, every one of those faults
walks all 512 PTEs.
