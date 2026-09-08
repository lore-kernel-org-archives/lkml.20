Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10E3A0EB8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850553; cv=none; b=rCmz9kZj96NA9vxPZ0gVYTVi+0X9TbO2W++BgeqDdbEwn+Uqcgws76LILWe/gTXL81orwTgfSxYlu8AKPxJND5Qbl6UYM4IVQRaKCWReMbie2svzuC0dhmY7YahU/4QGyZ1PFl4BmO9Tjdx0IfrxIVwVOeUON/Ag1EUMRrUN7Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850553; c=relaxed/simple;
	bh=Ms4QXvhHDmIVAgsUKpRVYkkq2AeTWaoHUWHsS7GC19Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZchIrN0TgBX+Ka1uMEP8EWCzi0+m0q4TigKCIlYseF0CaHOM1Lk+k9pBSIim2YJbgSKT5bHwzRUIO6WOTtwTR4PVGV1PKJvQAITaol/FgcWqrlDRcIH2vw7h+IL/9i/AAgyOZVwaLSxSAghl9/BbicC6MywkN69y+ninq1V6f+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=na/7cTQp; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="na/7cTQp"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d52734fc41so76210505ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788850551; x=1789455351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IYNiieOZkD/CRH/B0VLcN7+eexBIJWOxYGToe8m/kAM=;
        b=na/7cTQpDmDIRBBGinlZhdGgQizg7FwgEDSMq9bfTH5xlgWssNSqAG6LPFAZPawF2g
         s5J3FnhPezI8Tvc9arR8Ct2Zc3NKwNsrzXT3/Q9U+Z//v9i2c0Cby5hBZgEOdpxsA4u6
         IdSX135zAcHx8WcIITiOtJzflclnadx5nGgc/xHfWqoSwviopbpjz/FQPFK5utEf0elt
         Nk9liq+0Ywz7p0KDhl1CTtpGmEIRGXhfXKxSywefuvgQEN+kTvdJxpsyf3FH3IDeRyjR
         qDBAqcN4vWC9W/m+rQ9KPOzYf3D+QYgftmFXc2DV893ZNptu/Viv6H/U+DHBBNAwcsms
         +0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850551; x=1789455351;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYNiieOZkD/CRH/B0VLcN7+eexBIJWOxYGToe8m/kAM=;
        b=GHf+ktu756M7ZMRSgKqe+BUk6Wn2xCTDD3qyqvVZ1j/A9W3jridroL0tODyxUf5UbR
         ZdDfKkR9nM+f6qI1ZmjSXO+S8Hjm/h8Uh8GzbUDcccqC2r01az3dfvYRUrjc93eX8Dc0
         B+e1XzeVFtFIFI8gitXIFgz9mjXKRsBoRgt2QFpIU4ixLflHB+5IiQs1N82ZbSfWfaeG
         eT/XGwA3cusDwvhdIUM4/Q71tglSSBUCGzikUrRDEZGZo4na8vMfYEcPBvMQcJc013cD
         bBj+dlId5hSqdyzdYd4cOt12+qwdhrRLpugSXweZnWNhD9QoXXn0Rp6y3H1pxyeRFejz
         HRLw==
X-Forwarded-Encrypted: i=1; AKwUvBzPv/bWhCTayTeFNbNHWUccsTyn/xRwSbn5DTq0tpYsfCe/2/p9snb9GijrKM3FDjtY0KjcFiNOb6X2+js=@vger.kernel.org
X-Gm-Message-State: AFuF++kKGzLkmNOQ6KMLVHeccV0Z6jEF0LL/8GJTjS6SdUr5a3ttjlXG
	hs/HuWyeqQgMout9+saekzo6iPfDZG/a6nXC24jD5RJVeQkV8itdzNbNdA24S/pEchERvaFkJNk
	JDw==
X-Received: from pleb11.prod.google.com ([2002:a17:902:d40b:b0:2db:2f11:a00])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32c4:b0:2db:39dc:48af
 with SMTP id d9443c01a7336-2db39dc4bfdmr219185075ad.17.1788850550796; Mon, 07
 Sep 2026 23:55:50 -0700 (PDT)
Date: Tue,  8 Sep 2026 16:55:29 +1000
In-Reply-To: <20260908065529.901593-1-tweek@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908065529.901593-1-tweek@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908065529.901593-2-tweek@google.com>
Subject: [PATCH bpf-next 2/2] selftests/bpf: Verify program FD after
 non-autoload programs in lskel
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	"=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, KP Singh <kpsingh@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In test_global_percpu_data.c, dump_percpu_data is defined after two
non-autoload SEC("?kprobe") programs (verifier_strncmp and
verifier_snprintf). Verify in test_global_percpu_data_lskel() that
lskel->progs.dump_percpu_data.prog_fd is properly populated (> 0) when
loaded via the light skeleton.

Fixes: 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu data=
")
Fixes: 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu da=
ta")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 tools/testing/selftests/bpf/prog_tests/global_data_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/to=
ols/testing/selftests/bpf/prog_tests/global_data_init.c
index 7c539cbcf3a1..ebda60200b71 100644
--- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
+++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
@@ -214,6 +214,8 @@ static void test_global_percpu_data_lskel(void)
 	lskel =3D test_global_percpu_data_lskel__open_and_load();
 	if (!ASSERT_OK_PTR(lskel, "test_global_percpu_data_lskel__open_and_load")=
)
 		goto out;
+	if (!ASSERT_GT(lskel->progs.dump_percpu_data.prog_fd, 0, "dump_percpu_dat=
a.prog_fd"))
+		goto out;
=20
 	map_fd =3D lskel->maps.percpu.map_fd;
 	prog_fd =3D lskel->progs.update_percpu_data.prog_fd;
--=20
2.55.0.979.g7e5102b832-goog

