Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B18356747
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228155; cv=none; b=mjL+ewSfU+J0t8S+gLuqsfB/q0ObUsDf2kdv+Duc8g54o0fCkKfnSuhABt8SJQyU8d22HGY8v9Cdhj56duYn9Lq074WLNl+xTOvaQXEi8KhERFXPpe75TWDvNX/Vn242yAHZR+KHQrOLt3TIxF7YJh1MZ1V1jOKoPyaRP/EhmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228155; c=relaxed/simple;
	bh=S7YCobBC+HtmpFNk+7TFsgHmGtIoWTkcQMy5z7Dbx1w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=E0oysY/fbCYEhXzWSfPcuMGwyVCIGQJg8dxfa+byDMy2I0sij0RcfFZS7188LxeRVLu0tIVS4DCKwfb1OfnN8I0uy8r57LfBk73+9ls7Wo/6gXhJw6CtSuEUaKO56nK8khXg/15rpYqH7hnagtGhQKFYnmOZjf2wAt/utQKsli4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON6pdYdQ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON6pdYdQ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f20513so939567b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790228154; x=1790832954; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgV+zt06A+GVhiZtJGM9pKXkNiudT+kcv0q8qPUw5Lk=;
        b=ON6pdYdQqqkchV/gy0fNyvMY/t3qbVvF2RCoGW60etofLkHLVcI/fvv44FqDq2csJI
         gT4nQpxv6Y0EQB7ieG7ozL4vfxlogTG+5dOTIrzRukhaCTP8Dsn75Z1wIAhcroDhrO9G
         M4Y/5f6g0QS8M5i8vk0zbPz+STp9EH2D3IMQNgu+J7svAkvV2yYjcqxl8MLHCetwsB45
         dh7ZuqNYalTYdLPXaVo/MGxpwLUoqJ/Mv51BCpHTj+lP9igMj0XviNQLOndxBg1JT3ss
         9AjLf0L892WOrJ6+8foJLelB59CnTxI01cPP9s/k+y6SiG4AnsmI+DMOlzXCmFbQ+7Le
         SJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790228154; x=1790832954;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgV+zt06A+GVhiZtJGM9pKXkNiudT+kcv0q8qPUw5Lk=;
        b=gGgrqnkusoMUjgWurFtRI5YsDhBB9E1d9l0SlPHYT6TkvgJDMwiUxswhWRLKqjwq9m
         7DVEX+30SyID8qEGCSLgBsnm0F1ddgxYxfezfHrDg5XaeJZIGONdaAT3PQcH1pJOSu2G
         WmaKO2nZr6ku2cxQX/BPc7fe8D02HtEcCBiZB2aoKai9luqoWbs6/POsQEWY6RlCz9RT
         Z44sNxA7LFDqyNbNGfvqS7d7jd3a24qJRth1pvYL2+FF+24pwk2LKmLiwT7R3sd04+3S
         85x2iQxz2151GrC2XGzUmRSKOcxXD+7e6xZsddL1ANjjTJRLALXq4sKyGaa9uDXtEp59
         0AYA==
X-Forwarded-Encrypted: i=1; AKwUvBynxAomWXkYouxLcf28iMsUrPncv+UrFy/txYw2chHeZUhH9FEeKuJ4M6z3R4JxffwXLkZEy1EfZz3m/9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nDtiyAwKLp49lMJMXDIZP2fptcd1ig41o6aW2Mvon6jPp3L7Z9
	sFsbvXn+8QGm5Zl6y+ZwoT1TuY1jckt/rT2TtU5W8+whpVqwrmKp9Giu
X-Gm-Gg: AYBFou1vJaIgNPflHmGK6SFN2pzhdEEHA5d76oyMJ1kkSyyBWVMV+TUVFfwSgYJM3dQ
	UCTHtdUys+NVhef7f1151UPBHZHZcqOMTKnsAeFTt9fU2mZmatOkwlUuiivgoqoWMzA8iB2n3lx
	kWSpKYMEYgh/eHClvLgykJrQj1XCCj8+NDNWZG1yQs/lepRy2coVTWaCD2VBTLLw05G7KMtvgAm
	keLiyhzk8bj3XAhHG9GGDhhrWWYKGEt4baSd+5fHbNDq+ZS90zE8E0hVbO/E9ISsfEP73ll1GOI
	CtDox6Dt4a5R2cWK+RH6Fe8sZOUwLAkQk6EF5sPorkqdZ/QAt3aYeCJcr6Awo1nnu2cpx8DTLlz
	1aNcVA2PHfhSYNLnleZAaYMXDDykP97V8sSxcZM3JpDkIr+J5eKhIhmlWAKmOi69dPzBPq4jjjJ
	ZZz+UWyhDORYNKwdJKD31bFUVpUXrAmkTcfiBZnmVl4rb69Ny8EU/RDo6ZrAzP+kDX2SAVxkrN5
	YEfusSqEORHLwftDJITP9DQ6SZS9z9CLUdCQ6p8z+xmNNyYc5eGlZZjhCKVRyQi/WhSMsaFabdo
	7Qs=
X-Received: by 2002:a05:6a00:330c:b0:86b:43f6:67c3 with SMTP id d2e1a72fcca58-87e99087d5cmr1123543b3a.18.1790228153413;
        Wed, 23 Sep 2026 22:35:53 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5bfc87sm2268080b3a.25.2026.09.23.22.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 22:35:53 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 05:35:52 +0000
Message-Id: <DLNAWZH4J2VL.35H5TXY9SPLM8@gmail.com>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next 2/2] samples/bpf: Add memcg async reclaim
 example
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>, "JP Kobryn" <inwardvessel@gmail.com>, "Shakeel
 Butt" <shakeel.butt@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "David Hildenbrand" <david@kernel.org>, "Barry Song"
 <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <netdev@vger.kernel.org>
In-Reply-To: <de7adb6bafa3b808e29c0630f7ed9a2003e5e447.1790222105.git.zhuhui@kylinos.cn>
References: <cover.1790222105.git.zhuhui@kylinos.cn> <de7adb6bafa3b808e29c0630f7ed9a2003e5e447.1790222105.git.zhuhui@kylinos.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 24, 2026 at 12:04 PM Hui Zhu <hui.zhu@linux.dev> wrote:
> Add an example of BPF-driven async proactive reclaim, keeping the
> complex monitoring scenario out of the selftests. A BPF program arms a
> bpf_wq/timer chain that watches the workingset refaults (file and anon)
> of a monitor cgroup; when they grow past a threshold, a round of
> bpf_proactive_reclaim() batches reclaims a target cgroup, re-arming the
> work queue until the round budget is spent.
[...]
>  samples/bpf/memcg_async_reclaim.bpf.c  |  349 ++++++++
>  samples/bpf/memcg_async_reclaim.h      |   39 +
>  samples/bpf/memcg_async_reclaim_user.c | 1141 ++++++++++++++++++++++++
>  5 files changed, 1539 insertions(+), 1 deletion(-)

No. We're not adding new samples to samples/bpf.
1200 lines were overkill as a selftest. 1500 lines as a sample
are not better.
samples/bpf/ are dead. We do not add new things there.

pw-bot: cr
