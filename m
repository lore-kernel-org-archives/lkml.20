Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641446;
	b=l61p6jtV7uSXwLMKBHs41pxhhARvMn1WCf+cdCWAoX0Y1r9cuLiMOdMsHlrGtKHwQ57l
	 bUv2kte92cZ0B5wjI2cUInRT+b04xxCfMY+jfW1VJTs65l9ayDvBeZdZXxiYoVO2q3k30
	 vQj79iNPXr9IbxAkKZE11Z73tbfIrvP6+hdBrUCc4BZQcsrezqJ/W1MZjEg9yKt43YIUh
	 yIK16Hu283fk9mMtzccBk0zk4rJHYqdCZfSyvXyAxoYCqPJfGpiqxQs7akTC9CJyJ7/6J
	 Hfl4d6WBtUkl3VGqhnSONiXCI7HCXxy9yU+nJtSMB5o//8jhEQp1Fp0Gr8O5wDidNHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=agT2sP37K9WOIXXonUOP0XJUw1BELGxgcJibL+YQ3I0=;
	b=BeWg1fKAOa3TljJhe3AzgzmN4novi7CNcuIPFifq+NAF6eR1U3dnnrSdc+rUlTpoLsiD
	 6/Y/lPzSOe2Va0NUb2KN8swhYYG//yFVgPNjpOLss4pi1M1MuPk61GWBDbAlym+Rp4CCc
	 Awxr6+Spdgd+o2r9XQ/A3l9Y2TLtb5IiWD9K9ZbxXHaCWYO37+jjFN9JgUTf08XUoTbzh
	 PKu6uR7ft0YjUzHNGSMLunBGYlP36JoveVRd5abdVLFMCAWwiXiQimHdytb7oUEiSfCn+
	 hOQGnFHXHpc2QSatVssfBCb4BrHCDEs8NYJ55NtccrvPuGHTIrtKW0iXkd7FS2gpVBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbANDaoZ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12E606B1C8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA12E606B1C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbANDaoZ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so28126985e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641444; x=1794246244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agT2sP37K9WOIXXonUOP0XJUw1BELGxgcJibL+YQ3I0=;
        b=LbANDaoZCQKZPwMi7B3S9QQ1jyxcinSKIlOFzSbHLK+XvBF27u/mJb1LiJK+ETn6Op
         FLYumYA0lJOclOTIo4ZStDYTGaQOUR+HHP3QH4UiVhBg7bv/Dy9U3sE8dUFvYYBFjse+
         9LPanSrKnvESryGi1rFCLuC33/0eb9WRbWljeNmO2veWOoE4wauBm3Z7deMmGvrHyLLg
         stzbGPMQUwqDWd+A3hNNbTsyGFVoaZqQv4oLHJPhtQLYfQpzHYy4tj2Kv3bgR7j2k91Z
         bWiURnTQ/CvWe/3cISwM7btd6E0CxsTKsGHCccfFsJFuWNQ7r7Nb5A8iSm65b8j7d5TL
         mbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641444; x=1794246244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agT2sP37K9WOIXXonUOP0XJUw1BELGxgcJibL+YQ3I0=;
        b=LX5X5hK35ZwCjQmWLjsz+obCpGfoUoLa5+JleS9mROhdAbK+Yni11gjDJO5sTRd456
         a+OYjtpXX1MKpWcIqlekJbdc2OSB2hqoNX+K5nxN0k38qE9WpQEVreZsl/3VjPpJUWIN
         x8jfBCIZ6555mZzEmAUOa4mRNnXu9R6he1WvQpIbzzSk9ixsklhVyynwCrsvXbSFl3zi
         83mzPqzkKZV9r/outBC3xwZI0AgAvNzpjp5E7MYFjyDPXfZ35t9kDNsxmKrRIHvSQSCF
         X5r+6Vt2IPF31XT+pWiS9ahlx3iKzD1KOMT7xCgej/Isuzcbo3O7TzgfRcCJMTwtOdaC
         B5rw==
X-Forwarded-Encrypted: i=1; AKwUvBwDh6AXdD7jS13Ih8PU82OwvzvgBJmHppFiv9k6vI6bk56BYeva84sg24GDqJ934hVH2OqNBbQR8qRliDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLWHhTpQq8b79SJc/OnO08kV3ctPejiQrEfRBMtvbnpibe/4d1
	MVAKrOcUYdOOszL9c/m+cbHlmjcDPwCbxXO5kPcQTF9Lvrc1phxj5zSh
X-Gm-Gg: AYBFou3LYUjmvwgMIicwUAIJQhQHVCY5d0y/h9xQSFxy0xVQzXQsi/5vQnAoyP2/pT4
	cXTDZ/DXfwvXzw58UpueAuyp1xenpQlKU8/4UE+P2OLGER2bXv00PpLtZ0YytfS2fHnFKK3t3Ab
	i6IfXjH77e0Y4p9D3aMVSGD7PSRxHUvAm3YIa0V1N9FMwmCuf3E6tLjYYBIawInqcgoS7bY2Edk
	gnN79KeEbwHwtOBKo/11mYhcVUcTxpago5WQvVsX0xamu2UF/CszWr9xsO5HqHzK7id/vwVARS8
	UWhWzkQMwIT4g/ltxQsyZMElskho4ueX4/dxzK7y8jiFbPcU98leuvzG6KEcCYz9AllgC1ezWgK
	v22xZ/MzTjn4Zh59T48auIsZObMqDA4lTg877ni1ZXqkOkDY1UMvyQJWsVwaf3BYOAPH0ZpQgQ0
	FsJ8/Z4axSWsRzSpvHga6X6j4tN1pVjteDBHGmMDkAC7Zb8bct2oOSZ9DqBwaotR4h0VP6YHGPY
	JkRQLR1SvUd0KVwQIVogXltRpd/Kecoy5kQBkqJOH95x1Qvtjuc49mdDmOG2t7m4odGWpPii/oZ
	S48EGip1ke2P+Aq5l4TAhq5pPxAFA5zM/awJjUX8y/XEPdJ4q40YOvuISMy7h8GiY/xqfUW7BXQ
	H
X-Received: by 2002:a05:600c:a00d:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4ac185bc336mr238059655e9.18.1793641443872;
        Mon, 02 Nov 2026 09:44:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm196311865e9.1.2026.11.02.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:03 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 1/5] libbpf: Count entry programs for bpf_gen__init()
Date: Mon,  2 Nov 2026 17:43:46 +0000
Message-ID: <20261102174350.472592-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102174350.472592-1-mahe.tardy@gmail.com>
References: <20261102174350.472592-1-mahe.tardy@gmail.com>
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

Commit '259172bb6514 ("libbpf: Fix gen_loader assumption on number of
programs.")' explicitly mention that we may pass a higher number of
progs because we include subprogs and autoload=false to bpf_gen__init()
generating a bigger cleanup section which is harmless.

This is in preparation for the next commits that will introduce cleanup
of the link_fds to bpf_gen__init(). We don't want to overallocate but
have the correct count of progs in this situation so that the
program-slot count matches the programs exposed by the skeleton.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/libbpf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 8fcb8cf39cc0..cd8ff7f42768 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -10077,7 +10077,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	 * permit cross-endian creation of "light skeleton".
 	 */
 	if (obj->gen_loader) {
-		int nr_func_ptr_maps = 0, nr_progs = 0, i;
+		int nr_func_ptr_maps = 0, nr_progs = 0, nr_obj_progs = 0, i;
 		bool text_has_callx = false;

 		/*
@@ -10092,12 +10092,16 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 			if (prog_is_subprog(obj, &obj->programs[i]) &&
 			    prog_has_callx(&obj->programs[i]))
 				text_has_callx = true;
-		for (i = 0; i < obj->nr_programs; i++)
-			if (obj->programs[i].autoload && !prog_is_subprog(obj, &obj->programs[i]) &&
+		for (i = 0; i < obj->nr_programs; i++) {
+			if (prog_is_subprog(obj, &obj->programs[i]))
+				continue;
+			nr_obj_progs++;
+			if (obj->programs[i].autoload &&
 			    (text_has_callx || prog_has_callx(&obj->programs[i])))
 				nr_progs++;
+		}
 		bpf_gen__init(obj->gen_loader, obj->log_level | extra_log_level,
-			      obj->nr_programs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
+			      nr_obj_progs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
 	} else if (!is_native_endianness(obj)) {
 		pr_warn("object '%s': loading non-native endianness is unsupported\n", obj->name);
 		return libbpf_err(-LIBBPF_ERRNO__ENDIAN);
--
2.43.0

