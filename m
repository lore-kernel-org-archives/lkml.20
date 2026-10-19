Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF537AA9C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378501; cv=none; b=r+E7m8KELG0a8OzOE79DhRX+geSq6mEwwBu0ejC/ntpFl9YXCFtm9h5qkAX/XFNwfmBnL8SpZG0VxjHerkHbtEKzSoida/bcJ7AnbNF4ch80eB8K/GYHg3EzcubT54+YMlXeEtJSMEXpVUtdS+DCMeB72Xwx0FZSWWuBl3eB5Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378501; c=relaxed/simple;
	bh=XGREyND8rEv52sMD8zmNsmIDPDCH9HddupZaIP9wsLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljn0d6TycfsHQY38GyLmI9ehqoyboTPXiTjwzCeAP+ub9zEPgKcXfTuSvGXirPsCVw5ZOj8RHkEEPEuncbTaFpooYB3FHO8VyuUYFYCLeOy5Ha/Of3Ll1APs1oz8vdcVF5w1K4nZF0GEDElK1MSMq+LWUg3fINe8WFt17VlpqFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyJ9saRi; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyJ9saRi"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35ef6b49813so3166400eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792378499; x=1792983299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGREyND8rEv52sMD8zmNsmIDPDCH9HddupZaIP9wsLA=;
        b=fyJ9saRizt//RF3/0HkOaCcodnCYYeYYMp5bBj64t1q3VeUAg0Wxkv0f8nLqQmUVcZ
         PMKSYVD2iI17oCK3tOTtDlZ78rjxzFqKXVEfCZvj5cXenELlpmGB+ir0Oz9r0vSkE5CS
         Qgl6EDZjRxvD5m9ep/pF01h0NdyLZZG3nC90HFqXdYX9OOevgXGQMBw+iyCzg+/f6x7g
         iWEANmZZHlqv3Bu3g52ut2pnsX8m5hn/4Gh4mJgb3aMEpCgAhfiZ3j4xeGhEH9Xwkg3w
         3cJHUvWqoFyYekBo6CJ0/EJqJb3ZBPPscc09Wdc5MlSUOZnKXcTu5OL9hviQq0sZyoQc
         UELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378499; x=1792983299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGREyND8rEv52sMD8zmNsmIDPDCH9HddupZaIP9wsLA=;
        b=qwk7C6NsHYK0okMPtUJuvyg8t4m+c7NjSSHUaZ0Oha37JYD2bkdLSh+Q0u4BncDQfY
         qRQTZl5HJ5UgApSc/jLQAhCInGAppr419JWR/Dxv1OL9IokP7baJfqxwtKDF9DzYGWKk
         2GOJQNBp33IZLTAYKc1qPkWm2X2ZHU1AU5dImpECsDIVCslMzUOdN7d+Tei+4J3YjZdr
         TRe/JYiuechikd5xTzJlVzy239MvsZ04BioAazcRjbBq7oPZ6T/tpoug78ehRuylPX3O
         vIwXEA/uYcapeZbnsLF5DPd0XKPKHLTFXd+uWzgvjzesmWUjTMFopNQ2XRMDR8Wsrs97
         4d/w==
X-Forwarded-Encrypted: i=1; AKwUvBwqAlfx4BPNQWFdiaV+83KAwoxRZFQIgXb1DrGJShNfqWDrKzv/e0GYXk/Cj1JcjqN2V2HoYei1grofWsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4GuE723JnyMVdxAeEX+JWgqms1KLeC+jl7ju4Cbxb92smFeux
	UKhbAtlXdj9al1RJDcs2C125xQYAnyOVTRLIQu7vfudwPMyszKReNpKX
X-Gm-Gg: AYBFou0F+31ozsy34cX6QHey3olAvM7eHGKp0xe8NfBSPyLBa1MhESYtwAIcFnJ2su+
	KntekDJnYECPYFsY5G/ylEvHUGL5zkQHbH5Ldn6IRFB4mvVH9uM93fXYqAsmQ/y078WiJkgI2LB
	I2iwulGfoJoXrsMOGd6hhEYS2XdWdxN/ZksoQPb/yXC0PawHYdtxEtDDN74qw4u8G335BAAyqRn
	HwhsjVa2YnG9bfvePo9Yp8nN8Q/C3e6vNy1sTxNfXavyp/J7vhRJUWM9MxT0b0Owfuoh48T8Kvz
	Q+IW1ZbSrbnpHTiXuamW0D1uYFhpaDQM0ox9DAw7dNNW8jyVLIoi4oCuQtMxWmuMp6vFs2jHxCe
	G6EHXON78LcMnioZIw9kcokihWXzFR4u6AN0tmSjucJ3QR5ObC3DC0GfPacRF3yuxEZbdBhALp8
	Vzm3kPrvYx4f8mUFpp58mx3YY43LlB7ZDGvG/mkN8yeUxHmE/89fbkMSk9vgFwxPOTe/n1wrajP
	Q==
X-Received: by 2002:a05:701b:4586:10b0:18a:6c40:1a35 with SMTP id a92af1059eb24-18a6c401a5dmr2085059c88.20.1792378499080;
        Sun, 18 Oct 2026 19:54:59 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm28459793c88.0.2026.10.18.19.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:54:58 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Run the enable_stats program with BPF_PROG_TEST_RUN
Date: Mon, 19 Oct 2026 10:54:52 +0800
Message-ID: <20261019025452.1470555-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DM6HAA1FCDCO.1V38UFFVZNV16@gmail.com>
References: <20261009-selftests-bpf-enable-stats-inflight-v2-1-691ee379e511@gmail.com> <DM6HAA1FCDCO.1V38UFFVZNV16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 6:35 PM UTC, Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> Did v1 fail anywhere?
> It passed BPF CI on x86, arm64 and s390.

No, I haven't seen v1 fail. v2 only addressed a concern from Sashiko
about the resolution of the clock.

> Run the prog 1000 times in a for loop and keep get_info as it was in v1.
> Then no need for the comment, and check_run_cnt_valid compares
> 1000 with 1000 instead of 1 with 1.

Done in v3 [1].

> Also pls don't respin in 12 hours only because a bot said something. Wait for people to reply.

Understood, sorry for the noise.

[1] https://lore.kernel.org/r/20261019-selftests-bpf-enable-stats-inflight-v3-1-e7728f5b061a@gmail.com
