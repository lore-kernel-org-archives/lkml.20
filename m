Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732575;
	b=ZfPa6iEVpKUrwPuLbXRYWZqDym6N4y6pXr2lF8hYClZtPtvIYRr/V7jXVBscV99v2Ewl
	 FfCitmxHw276wY39v4DZLRHrP9E0Q1dRqLfjBqHsaH3B4xrvLHw1HeTn5ZgETrx5Pk9Zt
	 5eaAG0/QjRv56e3VhD5vvRq3nDJwKGnzvl//CaHMz+o7BnUByOr8UvyBNcnqyXLHtdGEM
	 0aDh35WwDbfeZBhUFUZ7KKyoAPiuUREZa5UCXp+ckFQR6xx4mAAzUB8ZGpaBQ+tUSBW51
	 r6E6c7jaLcY6JSh1f6xZAJznDzkiAehrRrNdt9DZ4Wr69M0M/XAubcYdJnIb+yKXvtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Chzegh18gcBEAWx7UANv0tSlVU5fQl0smulwKtfc82U=;
	b=Rh+xej7pQgqrz5UXj1xRNxRejTv3UodOA9EogEs6OWajmiyuJTwvD/JwSE+ojVqdr/WX
	 8IDgFjZWwMpeHPTHsxAVikqJnslE5jN78XSO9pBeDVeR4quIpgWsP5HBWvdND/7ffZqHy
	 ufDcKRlgTpZxQcgGfZv6NyX2JAOwV52bk05YNGMvd3nN6GlM+GVMVoYueYKmVE6+GZhof
	 2kxCeTvNgFoAQn56pG6eptmBfgbBZaKYjwQGjARueIBd2a0/QiGmBIxn07WzflbzaEwLw
	 3uSU9bj/zMJB6wQOjilO/wkPKqeEzajjSuq3eqAvG6dDBO0Sz9blbWpVMIXIwEmeLdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHwPy5KX;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F895606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F895606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHwPy5KX
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso2167341eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732575; x=1795337375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Chzegh18gcBEAWx7UANv0tSlVU5fQl0smulwKtfc82U=;
        b=eHwPy5KXIJ1E8/MpMkjWHRKMvhAF+WXNBHxnXqSKwiDN5jRtxyNGHhTcQdwOk5tidq
         woW9rzegoNdwLAJTfHKwGWXkRE4WIoY/2wCQ6/xX064ijcLk5hr7hQ0lDJSE26kTArP+
         /ICq2uyzuUSgcJ55fa56HhIwbVs5OX3yrepB2x/J5cIuP17qo9i1tdDitdRcVEIec8/9
         7YHF5fv8Q5UYIwfgARDw0MJQZrZZwPkUqi419Q+Um2Y7wPCZD7CT7Aq6nFIVo5Eowy8m
         1K7gs+ArGuDqpw9IuU8KmzkUIplGSnS4fnukIv3foYRkJIGUmvP6TZaSadekHuQwy+q0
         kwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732575; x=1795337375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Chzegh18gcBEAWx7UANv0tSlVU5fQl0smulwKtfc82U=;
        b=L8uPlIssx1UrV86fRAaWfyWQ3+QELXPH86kWNXb/wNy+iMk9m3bXZnNeA1EG0W8EZZ
         QgB/ufin2coNqWR0eY6CCgKjMheKl38lktFNP6zxefmYyC5c8RWjxllTlxEVBiak7MCB
         inKjtGFSAGTDllzz9NL5eigQqLoYYdsGd05Mb1Osi9Rf4w0qPtnJzMouxJ4DEbmc7fRn
         A8gHouzWElnyDQmzeo2xLo3ojv3z0iRywXxZqJnorLdRstaXo0jUecRjI0Ne1jA6wAhi
         HiJqr3XlP+uivWBPH2D+nt+8mG3Ye2ua7FuIdFvpP6UcuLBnfbh9u2Qjg6SM+acPq/iS
         GbVQ==
X-Forwarded-Encrypted: i=1; AL+hErHp9U5V9whjeqis1RZjyVrtUHWB8PtI8xht2E1nDk5AEeTFkCpA8zkU5Iuzhy/8VvqpVSkymrIuGngij+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CmFM439M1uKy6iakD934cOcDCtrJD9ghx+OGAJUfdBo+w1Nz0
	DIt+Ns8RtoNRF83/Q0jLpVEt424uzgfunmrX8iq+WiaYeHsFXsHVMMGh
X-Gm-Gg: AYBFou0Q3IbwySOGBIUdevjwjZXZc2DvZje09mPYU9yeVozZBKK/RAHvDYQ2l4lh51a
	Q3oIzsN8KDy5wPpppPecR2IS97Rj8Gd2dDMWbGVZjhj5oMPHwBzdhJZ6mCv5l878T0horj8hDZo
	Cbe2oPGV0vFl7mD2i6YyIaCnNmlPYOheVm8IzyZUuGEVETcQzXYfZVH7HfrtaMH1xb3/bPl+L/b
	zuB7rX9s66Zppc/f3UiCWhI3BSeSEMp8ZJvcZaGmW7yMcMmLUuM2tm3a1J6T6UjJc2QoHwjVbvx
	AEowz6+Reqz5iFL9oYzWD888YKETnrQHOqOhKgPJ0aANcBYdJw6C0HwpcfIGU/OljlZ6Kg/u6YY
	LPyL1s00b+gMrRxJRhMu6E+fBl/NdLTyAp10OqRXa5vKWcQWsRrwdhYxK1MuRV36Hn77O+lNSfR
	ZK4+Wn8wYzZ7mf67qTmZp8k9VfrMjgTHkTO1q9EbgpqTtyHGWMrvaKudObBBybVnU7EpempBvNv
	E0Lsgc/mlxVKh7y/lw9J2beP8mCP/u/HKvxupqevvBgrRhxK3bnrcmZDqBXe7UcwziouvpheFvK
	pvoFKfDRTn8eXatMj26+nD1/3uIEKpNxMF20ZfHVoigLeDHQ3CaP3cwgghYHga/f9s5c4Cb2VdQ
	MldbHyg81sKDwN1EuDZ03mOiw7iY93QJ6DuQz6Q==
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr7610050eec.2.1794732574664;
        Sun, 15 Nov 2026 00:49:34 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm25221051eec.23.2026.11.15.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:34 -0800 (PST)
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
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v2 1/2] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Sun, 15 Nov 2026 08:49:22 +0000
Message-ID: <20261115084923.53182-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115084923.53182-1-dennylin0707@gmail.com>
References: <20261115084923.53182-1-dennylin0707@gmail.com>
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
index bbe86928b3ec..a80762a70cd0 100644
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
+	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {
+		memcpy(buf, data, t->size);
+		data = buf;
 	}
 
 	switch (t->size) {
-- 
2.43.0

