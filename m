Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816135;
	b=zMMi/Ta73CuRArhxS778htxtgo2RBxVju3OUwrejgla1hdyDF8So6zZMuHmcI70AHdLC
	 IEx2AIdfBInCuCYN4UEZvY7Rgau+gk46O6fUv2uwCkbKjUH2M8beD9vW0R3iBB28DwGHh
	 Sk685sYx2k/eyxCJfGCulwbQMJP3rtcizcUcenEGk0fFwoIF6OpI/E1cwRgIVcXfMeKI6
	 8uTAh33Q/RkFILF7/QoTPiFP/Hm2pN3flcUOpznyTzu7Fqx2w/lzzeR62n92oAig/oNJ+
	 EMqvkUj4CnOcOAuM3NQaZhPOkKNM3BWbqUMAC+vSN3W+INEg7OvwhXblIi4AoBYw5MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VVmP8n1fZ6dTUrYQ1pJb8BUanjFDIC8PD4fAF71ivjU=;
	b=Byo0pvtjkG+dHrFPQkoaPdvk4KAQsjIMw7+HtAWySAj/kBNC3yfyc9ua+J+myJqkaAZd
	 3iMncrnHkR9fHfMWDHVYEXbgX3o38RjCzpv3QC0EABDamp0ZivHiiREB5pxLGVIVzMw7Z
	 hhnOpnkqm0iJqeZNsehWyJVYN61Te+5YSANn+bkv+RPsg7QXAHBWT1kVUO+LXcCsdQ5ej
	 Qq4bJROVtb8rItUKJw5QmbBWjAcy9fDsOxZuNq2ROpySaCNMXdMTgnLlANQSXfnkoLIyt
	 7xDlLp9eCkmNejtw+3OYz/LedU7x3O9FxVqjKF0pA2DKTWwY6XoPtTiAVQsGL6M9q9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KMhx/y2T";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53035606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53035606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMhx/y2T
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so937504eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816134; x=1795420934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVmP8n1fZ6dTUrYQ1pJb8BUanjFDIC8PD4fAF71ivjU=;
        b=KMhx/y2TI08m7/WuX0zvsxpuIz/n1FVNmqxo1m/44QouDZU/7IkYgeXP2aa1ro7XWB
         NYVpjzOjvF098jJAtQY+j4GtoPeD1EgRv1KP5Lay7r5qdoECqTHXoBEozVxkPzECneWs
         qiSmAWfbu+v8DH08l4uRZG0X7wHui6pFv1/1XhoKMiierI9vDRXZsEhZSTJ1kshLPWn0
         9g2QgsZbpBVV9PV561ux77z08sQYxIz0lglL8+ZPvOyfTpHpRK6cAWfeOAEk3Pnbjq0t
         6X8C173C6uCyjOB3ULUGYZGlSUK3EYOqgeA/NADr/jdoWMJHwLobgU3ysoS721QbfL6h
         GtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816134; x=1795420934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVmP8n1fZ6dTUrYQ1pJb8BUanjFDIC8PD4fAF71ivjU=;
        b=gWBPT8xlNzLf3DY4oS9E2/xJShJLJ1tnGVMRj3AYCuziGeEbniCHYNsq4CD17r2nYC
         z2hR6M9VI7vBQbNFdWgAJQM+4+CZ1ciIhaH0fEHOHpFpom8vY2mBi/jzy7w6duQQa/W/
         qicfrAzuXiHjDiBqP170gSs6AfD3UMKbwg8Jxgp6z85z+lPagx7a3m3PsYvmJYUsMiO0
         RSXY0dgCWqOK5t1Y9h3Bqwzj55/nD1wdoXRn4mspgdq3rWEWSDbC+B7ccGhSz/KMKhWh
         3R+BGlJiBTzfcPodtncJ/AnVNJ16x+XcntYB0c1Fr24KAuoWWTLVnYrVP3nbRyaijHAz
         o8dA==
X-Forwarded-Encrypted: i=1; AL+hErHckf9haQr6pT+tfGqqcprZgm8uOGPRfPQNUPJnl89Fc23u324ZL5IYYMraUKV5Tc+sczOVvJhhvx0Vnvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oypSpgYH0KtBM4Kd8oau7DOocrTNUa2QdZTEGDgs5Y/K/MTns
	ZUf8z6fj10VpiOPO5ygVP1ComvAO5PqofpIPOblMVJM1LtYLtp7dGYSW
X-Gm-Gg: AYBFou0HfruSFhf9NIkiurl3qm/MHHgHRIyx+GYSpdOAY6c15Kv9t2MmeJmIzkTxMys
	3KiqZIA0o/sEeOM5SVexjNFYhEAF7pjx9R9A9kuG2awT9xHrrRDEczhClxTwbiI4XTgd880U/kF
	BxHNskz2HA/Cb/IxYKUaogywBVTajNSR5WF79yZ8x4Hig9emKDD2h20IAMvUKgi34YcmWZy+ZA3
	Fh8efzWq9x1rFcYt8jv6fqJuLH3r57SotE2MBeNCp9q8zRnjzOHFDEj6tWlB/SgXC6Q8hYlDmoX
	IExol+VOTYEj+jrw7X+2el9fAKloqYPMNOrqGL0HEVMrCCVqbinPplRgoKqQ1auOYE+6dlsU5nS
	vzzoc77tXdAmuMqdErg0iefb2EwFbeSzN42SZscYw7vdh6JGtB+F/VU5Vz/JEz1qnmFla++77Ph
	louTg2DEX/pwRwsqBR3prAyQrXmxSYD/WqwAy82cSn9LCOXHRhmtv+uz4z/rVmwm71JTHf5RHYu
	RCkG5I47Fd69ALX1jinHw+3habo9Kp6xfoe0cKAyrZd998pakSPL5gQF6dQmCflJx9BZsDG1FuY
	5RnYn5DV3z8EXpFsA2WGfbhz/BO3CABvwiUor6IhTYd6oKKyY6G0XXRjTx6pWeJTDGplbPEUr38
	o8GRgCsCHQhdZWYPXM9J+tchLItuZQaIGKiwtQA==
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr15104220eec.33.1794816134232;
        Mon, 16 Nov 2026 00:02:14 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm31128558eec.17.2026.11.16.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:02:13 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v3 1/2] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Mon, 16 Nov 2026 08:01:50 +0000
Message-ID: <20261116080151.44860-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116080151.44860-1-dennylin0707@gmail.com>
References: <20261116080151.44860-1-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size. That makes
right_shift_bits 64 in

	*value = (num << left_shift_bits) >> right_shift_bits;

which is undefined behavior for a __u64 on both endians. The path also
bypasses the signed loads used for aligned data, so a negative value of
a signed enum can lose its enumerator name when the data is unaligned.

Fix this by copying unaligned enum data into an aligned buffer, as
btf_dump_int_data() does, and reading it with the same loads as aligned
data.

Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index bbe86928b3ec..050a5fbb9533 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2329,16 +2329,11 @@ static int btf_dump_get_enum_value(struct btf_dump *d,
 				   __s64 *value)
 {
 	bool is_signed = btf_kflag(t);
+	char buf[8] __attribute__((aligned(8)));
 
-	if (!ptr_is_aligned(d->btf, id, data)) {
-		__u64 val;
-		int err;
-
-		err = btf_dump_get_bitfield_value(d, t, data, 0, 0, &val);
-		if (err)
-			return err;
-		*value = (__s64)val;
-		return 0;
+	if (!ptr_is_aligned(d->btf, id, data) && t->size <= sizeof(buf)) {
+		memcpy(buf, data, t->size);
+		data = buf;
 	}
 
 	switch (t->size) {
-- 
2.43.0

