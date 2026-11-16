Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849310;
	b=OgbxhZUpnS1edPZS9uFa8F0GBufZYp4KDK1BPIE4+IVCM/ZsMdkDwTZi282NunVqm7PM
	 bBjhR6K5w2rte0r75oQYmA2bDBU/iW/Q0bP0xIBnmtMw+uzDA3jZdUisnvZQppBkdWaC3
	 cwzPSWqQbHyg3IvL+Q2Wl4WaQ1uv70BjxtYbx4+5W73yUJhyRF5uYobV++CpPWEZxM0hb
	 Ait2oimZPYSBJTDYwtFFusyOn59/TUi+xw0EKxtBaQhX0s+DFcwS4gOCy0AUXu/ApCjzJ
	 T7HQv+2YYKNUlqDcPBPnT3JOfyKoE4hvsMJq+e0tsNn/WWsGeQvwDTfb1wPgivhE08A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SnIAL9Ld5dmry2xIKJXTc5l7jOobd9Cf0HDPQZMDLm0=;
	b=iiGI6PftQ/zzY+k/TU9reahNVmXVzi7YZCOx73d+rNXADUohy75gZ0l6kMvjfQ8uWzHE
	 xJnOliy1Bz5Nlu6VBJgbcx/GsEH3llJ4TJkxAj/XZZ84N52Rzm9/uAmKp0NaaqT6QHBOw
	 k7uw3JVR5dXD5CV5SCLpqNCI8vwTK0oy+l1kAghD9auoabAoeTteC2UKXtTuEMrN88vDa
	 xq+q44NqbmEFwVmJCQ1yGL+pGJXx2j/1zclMaSk+T2idJOYJQ5YoB/F0/ciMoEXx0SE3m
	 4RNMCe/SbbE/LXnNM2gIeMR4ZmhhgsAuUrqk1K0dWJc5URjxay8xuuViNWY9lmvWSOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPeAPlk+;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPeAPlk+
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1921043a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849309; x=1795454109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnIAL9Ld5dmry2xIKJXTc5l7jOobd9Cf0HDPQZMDLm0=;
        b=BPeAPlk+jRpLnePRs+QNuzBU6xDP3ZVzV0UCcs30Ph5AFci32D8BA2iuxiB7PTkkxS
         4N9890b0AhomSOZJ5IBn6wcnTYCLz+j8rxQCXla6fkqTs631ZaoVoSoU79zbTpJdJDmn
         X+FolQ6YP/Nzq6mOSHqifCwj7Mo4O77TQHl0WfWFwkhhWnpdYvB2AgJZWXnNzE/pcZsV
         osFqpFU2UiQnFfCl5BDVpeBfjghoHEvw7NPiOoGTl9UK7IuwMdkaEP5Y8e0DyywHB2B2
         hLsimx2DmWUQR1ByeBo0VJkVnI1lpzbK1Uhb5C/T80btpQcvOeJE8UJqe3EhHDH+8/Po
         HLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849309; x=1795454109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnIAL9Ld5dmry2xIKJXTc5l7jOobd9Cf0HDPQZMDLm0=;
        b=h7mpwxJGl9txXJp1D4C8Fb6WFBTpNqp89Zq7Zy5+sD5B7ZWwGOGD8/OY7TutPS17MN
         Nkug3y7YIvzXb6UGBtxQcczcZV7F54gKfnJ7KDLrcHcvarGDPkn3cixLUw6R+q5d7llm
         bmT14PiGO3Z9wwl12AuEsIUVDfin3t4wcze6O5uK13jerjZbqU1Jg/6cQ8gVVbktVLE2
         30z7L4/SjmF2sOML6ybY+28Q9YcdjwjLxFEcyYFUgM8oAW/T8DKoDO3v9GcQonmKB0rz
         nBJ3CEp0tqX0P5k/aBYNnvRDP8DChqAks3Hd97ab8uahFsxoaKZnDjUHfTsLS43Z1BD8
         ckQQ==
X-Forwarded-Encrypted: i=1; AL+hErFhhnuo8SW6uMxxrOMlGexkyIlF4CTK31mruXr/D4pSOTJ0NNOknteGmdyHqMNTpOMkgV2yYgdV7d99LMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BwL+zoyEt4GJ6/gsSPq8WNzZeVRuFSdQHTQGN0q2D5E1gpkm5
	WWfNWJDkJwJV2A2rz1X5XIFepJj5C4ghvT7AR/d27eYBoM9a8RyzwlrW
X-Gm-Gg: AZFdTZcGfHhi395656W/1Xvfa2L5fSYacwqL/cLWfRcibXYrLZytWBSd4VSrGGLDT7V
	JGk1MrEo4y8Q1X1SS+DFBqyyQWeZ/MtIWmTGN1msX04ep8bSMAMMq7bG4SwVHFHgc3oQDaUB6O/
	v0P/8/E+8Nzy05RI+8nL7l4zrH6TxLHrAZW8+73AVXoIzzDyO0ovcMIJP5prf8CYP6BKyxjmoF5
	NqcU+zaajpl5ac8KpjHcXLILmXmyN4zyQVC39R1WdmgbgG3ZKu6FqnUqlPnhQNqraqTDKMzGYd0
	UkhWeoTPQnDVwlqqnDRO7H3ns038/H2Elu+8crld5x0VVcf7LDO6uMr/KzI8bmyH41j1rztEuYb
	U0x+nIzl+b3ylDWi0bq43jl5vIuzHW9pbra1EAf/EzWfD0Mwheykh4TvEOQDAKd8j2QkqApweCG
	/dQTrrDALRMt1FDGK7pmdK4mC9BMdDHtT0nAMj1SMpTpneYnfJMhOrM7RdbYqTJ7jJRqF0g1xDL
	1JTgaOS8nwJ88jiAWRlUlf5Lz+no61DUErGPvmtmVN6PUoS4DpkX/g1eaIw9GyXIL9TkPqBe8Tv
	jBsLWbReK37TxFeBbH/w1I8q3gzm6G5hgFXvuedqrPUQck/Me8pApe3wBh5hc+1i2poTFNA=
X-Received: by 2002:a17:90b:4e8f:b0:3b3:a982:6e0d with SMTP id 98e67ed59e1d1-3b3a9826eecmr478799a91.61.1794849308712;
        Mon, 16 Nov 2026 09:15:08 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1887d7asm4464335a12.14.2026.11.16.09.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:15:08 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Barry Song <baohua@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Skip memcg_proactive_reclaim when data lands in shmem
Date: Tue, 17 Nov 2026 01:14:30 +0800
Message-ID: <20261116171430.1008098-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <bbb07259-a2e8-40b5-9933-eb3d5d7a4bba@linux.dev>
References: <bbb07259-a2e8-40b5-9933-eb3d5d7a4bba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

Thanks for the review.

On 2026/11/16 11:04, Hui Zhu wrote:
> Would it make sense to turn the silent "return false" into an explicit
> assertion, e.g.:
>
>      if (!ASSERT_OK(read_cgroup_file(CG_PATH, "memory.stat", buf,
>                      sizeof(buf)), "read memory.stat"))
>          return false;

Agreed, a read or parse failure will fail the test in v2.

> Small nit: a one-line comment on the threshold might help future
> readers, something like "all-or-nothing: the data file is either fully
> shmem (stacked tmpfs) or not shmem at all (disk-backed), so half of
> FILE_SIZE is a safe midpoint". Also, printing the measured shmem value
> in the SKIP message could be handy when debugging odd environments.

Will do both.

v2 will also address two points sashiko raised: memory.stat is not
force-flushed, so right after the write it can still read 0 on machines
with many CPUs, and a shmem-backed /tmp should fall back to "." instead
of skipping. I plan to poll memory.stat until the write shows up and to
try each candidate directory in a cgroup of its own.

Thanks,
Kurt
