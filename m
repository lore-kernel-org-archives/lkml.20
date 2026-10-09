Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C032B131
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511484; cv=none; b=Id+edrrDbs7LXZ0FkFT2r76H63mWRUbkl7DPbmpupiZHHwxMBAoukczL3CYB7I9pOiHue1ksIZ5sVJ8ViF9QCbPBb18VtZQu5MaQeakQlRhiP8nWTAEiu5+jzXjOOp6RV/0Zuw37PaSTU7Kg8GFeuLOzxbs+6jFMVkYS/3YCYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511484; c=relaxed/simple;
	bh=fZK2iYpb3NiS2SLGLXmNJuWJVBr5yPWVV3XycV8Z2xc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UF4RqnATAooQkzPvspWezxL66hybRpETIZEgo03gfUHxR2T2JX7r2P2lC/WDah59/9kTluwH8oePgx9v4ofcHQBmJCLJR+8EjhbB/WMmcChXDXfMAcpYvfBj7SQj0xc2+Bra26XYxcuoYE1yDt18dWpElHdxSm85bY5k+ha5HIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV1qZnla; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV1qZnla"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-141395927feso6066424c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511483; x=1792116283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rUnebLJfLajmU4biDRGffXGALZ2NDVISxanjJ9k8qQ0=;
        b=iV1qZnlaxlzjJ3RKDX+bTjST5/JQWUjruk2uYGIgfhj4b+mSexMeoBxIJQ1j2vNwsU
         uWdh4eDbvsskBr39Vfg/81OV8x6YiLH6pmC+f0/Igvdjhzt2VUDveZebfcgKEf7tvuqo
         we8Ao9AU7OEyJ+SsnmQAlKrN7/zs52tgruDPPUCIWvjj+p4NXmGRnxxw/kfePmufVGqb
         7hP8lkyPqBBlb0VtfG8AfQ5xAX42XipZjl41ch2zpKrfNowND4X58cM4oXIhE+DacIK5
         SSRwMOeUbr2PBDZyvP0hXc+7WgUwJ1jJVc4P2VsL2k4s5PntLgxFIoCwllVV4j3OlSP4
         rYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511483; x=1792116283;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rUnebLJfLajmU4biDRGffXGALZ2NDVISxanjJ9k8qQ0=;
        b=TWp9jghVSx9DNSUJwylLaYsIhE2fC5YUuOn8LmeFZ1/U6MjJzjwJJUiKaup3JA3rcQ
         KZKbtidZ/tybgcmzT7GE+fC/wXPq+V9DClu0ehM+b5IQwurqr2ihS/zawxEhzn97prfi
         /sf4Xw/Mgs7NhxbgcNnLmyknq13OIpyECiTLRTIWezj3jk6dEkU3rVytK2k18jmTqU3u
         6be/a2X2M7sKsPi7mKL82gxH2lFa+1Rhe4NGuKMbm3tEHMDbPrjBabCENozWicjIRfZQ
         20n54MDDTH7eqaVMWcuvqnjx0yDmxxUkdNfJw0r9wKwL+LQnMmDc21KkHktuKXsDbOME
         ty8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8s9YM3rbSSi/jz+W1nTa8UGKaVWdVWUPWUsB+3lHDfPV4pc/z4hYhjq2QiFHfSasCOg7XBv+WS5s7BtA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7DK/KcKQD2If6SKH4/7CCQWe8ImwvRU8SIZWHMA4XzeiKWhZ7
	8zPyX0uQEBEI0BevATDfUnR4wpAJj8Tv3GWe46mzs1+eoTNQ1PSVx6bE
X-Gm-Gg: AYBFou2iMAUR85YpINTSgypqizubwfEx24PhoGa7ZHziiDArxSH+xLxYaFDXNo4Ya3+
	XHyAfu+/gqEYUNG9mIF5nS3Cf8XI6POFUZHR0Bi2RQFoJLrS+8Oy8UovjV4qh/b1stKZz/yKeus
	ZtqWRu1xULzw+o2FXUlD1qx1GtOZE5G7cVTowEYHfhMGTcHlLNqspzz1u5vx3EYN6utl6qlyyO0
	5vVJCmJC/0bwB3D2rXa3fOisrPCevjFIXXdaP8M3nlUqfT29Nb6zCoaETFBsZV4swKsriTrYezi
	NZhQTAlblb1eC+4QGqDSWRelA+qT34L7YYQVuuGL6wWKbMl9wOoLvX0tCcPUE5uYRQG5DTFE1iI
	d6VEddhxwCBOelbyyPmQfPVRkcCpGpHm+TWu4KCuwpVXjoWTWzl3y5QVNsBqw8rc2aduM47enwO
	VLisi6XC+gXcKJC81jrTnNrG6e6aPgH1Y27hSzEKx0XUgvNqEYnpe3HaqgRuu0eL265rk=
X-Received: by 2002:a05:701b:2803:b0:16a:b995:dc7c with SMTP id a92af1059eb24-16ab995dd20mr231638c88.21.1791511482503;
        Thu, 08 Oct 2026 19:04:42 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16996eac537sm1970743c88.1.2026.10.08.19.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:04:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v2 0/2] selftests/bpf: Fix the bpffs handling of
 cgroup_hierarchical_stats
Date: Fri, 09 Oct 2026 10:04:36 +0800
Message-Id: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRLyGoC/42NTQ6DIBSEr2LeujSAaH9WvUfjQuChJCqGR42N8
 e6l9gJdfjOZ+TYgjB4J7sUGERdPPkwZ5KkA07dTh8zbzCC5rAXnV0Y4uISUiOnZMdPF8JoZpfY
 XOGKqKpXVUllRGcg3c0Tn10PxhO9mwjVBk5veUwrxfbgXcfT/axbBOLvU+tbWVmgs1aMbWz+cT
 Rih2ff9A8YzPzHaAAAA
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Yosry Ahmed <yosry@kernel.org>, Hao Luo <haoluo@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

cgroup_hierarchical_stats mounts a bpffs on /sys/fs/bpf to pin its
iterators, then moves into a private mount namespace to set up its
cgroups, and unmounts the bpffs in the end if it mounted it itself.

The bpffs lands in the mount namespace shared with the tests running
in parallel, on top of the one already there, and hides what they pin,
which makes bpftool_maps_access and bpftool_metadata fail now and then.
The unmount can't remove it from there, and it checks the other way
around whether the test mounted a bpffs anyway.

Patch 1 mounts the bpffs in the private mount namespace, patch 2 makes
the cleanup unmount the bpffs that the test mounted.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Mount the bpffs in the private mount namespace instead of skipping the
  mount when /sys/fs/bpf is a bpffs already (Yosry, CI bot)
- Put that patch first, so that the unmount fix applies to a bpffs it can
  actually unmount
- Pick up Reviewed-by from Yosry on the unmount fix

v1: https://lore.kernel.org/r/20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com

---
Qiliang Yuan (2):
      selftests/bpf: Keep the bpffs of cgroup_hierarchical_stats private
      selftests/bpf: Unmount the bpffs that cgroup_hierarchical_stats mounted

 tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-cgroup-stats-bpffs-4534db24d15c

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

