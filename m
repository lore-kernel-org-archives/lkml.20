Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023184;
	b=f/H4sbDBiXe3bm3y14iVJ7aD5tc6qYxUE3Gqu86yz+s4BRE5d1D68gwGgefEMactwZA/
	 mQCC4541IQ1eYpLI2FR3Y/LlxiNpw01+dRLCtcRMzGg9wdXNqYnD1Z93NUuvcpXcrKb4U
	 SZC/Q3W5BP3+PKb21VL1B4Ojq4e2l2EzmvkhFIr+TLVydFyAlo3aWztRIX65Ht1W8Z5jU
	 2RLTR7wLnu34i6jW6bVWr5wL+t2PVR3OlAaMDA6zegpPzoZ7R6jaR3Eq7i/MG4Y3Dwi3Z
	 ukwCvq9aogbbX8FF+YJ6pi98Iyazg74zgH7hpmdbmDciV0wTYAVrESh/Kn9PQX+cpkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=fqz4qN+BLKAsTg3hFdIueZvqPQrOf/Q5VzzyopjCcFA=;
	b=THVIhL7ozfXL0wXk+iYl4FzeGtqqUaDpuB4gkM/7k32W5nzMoYO8811HKkKVEuegtUJ1
	 rt4d5bzZCExGBSKmU3VpIRjihx4jb8r4NmAMIEyU/gdJ3KSKehlRb2qEhyxoiX94KM8xa
	 GNo06fYi2+MfXAXe7tnsgScER1gJ9vm6+CP+sk9IchlftZnzWLKJvV3CMauOPChs4jLPD
	 F57JsoQ5a1cqROwOjY+A51L2MVPaD+Ble3peDERvfhN31vMKObqd2bE68lyHTL97YGq5S
	 LMAmVcF2eRn/7eiTL58O0IYAdoTJtRVOxGry4sVbe2VyDHvvTPA1pbvHm/tBjHF+jUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvWndcBQ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F6606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvWndcBQ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so1026941a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794023182; x=1794627982; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqz4qN+BLKAsTg3hFdIueZvqPQrOf/Q5VzzyopjCcFA=;
        b=wvWndcBQ1TgGm4c5X7adPMbmtQszekxX63DaFxEE9f5Frdl/3y2XSIYQneLBLOd3pL
         T81jpOtY7fwKh76/x1jvnFwDTBMiWkK5v3XO3vepfvoOvHcoh96lyc7Z5nMRwfb/bgR1
         oYffdyzikpN1U7+kcfxuWAYJztMekLz4NbRSNZM8Kt7gxoSLJGgbMT0VAzccqMSB0OKy
         AXMewEeWfPgmANG1pYUlTMZzrJpGqRnTJS7HI5nMZebnkv7TytgnsCOq9MmBEPfrr/Vm
         eLH34heLkA2B9I0kA0WypRpxi1sYnpMEK8F5a/JLNeYgXvc4RKLQnwMgAhFUjPXhjh3r
         o2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794023182; x=1794627982;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqz4qN+BLKAsTg3hFdIueZvqPQrOf/Q5VzzyopjCcFA=;
        b=GV9bj5kbc2AyhIhuIrbuYBNKDFFvm5JL+nQnu6qluBYXHs/pBFs4YJUkc1PWvRWS0x
         sUOxtSx6+fd3oqd/eJHbvByheOUtqafcaVj0yfJt1IZsmPIma+TIwIVGKEl6DxbCG9So
         H0QJayyjcWD+X+U63s7YSAfJ+zsFuyGLE+PvOO5n2NhNKtXM9l4MmbO0MYOV9bC7yN+V
         zB4y4xsC24mUIt621A3fKaH+q6h46IRSth1FA2xjt2uLegn85pPt6+SHW63gwxQddInT
         fz9WGmZtBc4CH8GgwEP0PAUppa1MdHp2lT1ckuwNrCIFSt2+4AvQxENwu6pctOdYQWTX
         GpMA==
X-Forwarded-Encrypted: i=1; AL+hErG1tP2qlmpeIltpHH3l4oUPynbDQjetKkfntgp2aBkx2qrcypBDZF/Ct12qP/yRJYl7V98XpD3XG7JiHsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kM0V2ZjaI4LxE7PsxN3qsOAbxeNi7+v7L81/87OIV70kX+NCE
	9XXtYsSL6eyu7u0gKo0BfyGj+61HE5MOusiT3kky4VLjEHjRrpTb/ZZt
X-Gm-Gg: AYBFou1P6Y6+LHEE230DHmpEaBRRaPRpJQr0tQsh+7OjL0rHjd+HnjHXfw84QLrrlyM
	xv8SwGS3RsEHetA0iZWa4mBOgfh0nRDZhGJtYMfQo2LyusoRjxb4UQnI8MlcUg/NmclcWNhZKTr
	6vLhv2AN0IEbObU+Ps4DUdtiPzQb66Im8kZXso0pyMxfrPbkK+8guk2gMbPpELAipcQflnwhLRu
	Z9Evi9r90XVWuVuZmkfIEkNK4jV7/V4E2hiGS556o+krhE91sXvltLnx2PE1rXgzYBmrd97hVom
	T5ZopxPrsS9yuKZDG1xUcpSWasZJXDioYNepaZggYg33XEnegMPqH7FoATkn77WTWlKXeLxhngH
	XNEtwjVR5KFZTA1HozFPlmiYoRxkAh9W6hryJORSJiMnsE1rPkk2ey6nlz58hBSDOxJJudApcVH
	rzoor+m8ykftDX7rGsKI0PVWmXYjBVrKGBw+Xv0M6rqHFvF21xZxzVbJYEFqDrLZ2hcyCfpy5Xq
	Bv7TBJdR24DSkYm4USDxDFiO0nIT9MmKe3rE15wJaV+cqJJJcmrU9skX4mCPuA0t9h+wSR6Cbp7
	ZOmWI7o6As4fRNkZFspUCECBnXq4gQ5FPh+pW4wqspsB9o8Oc+8iq3kduT8AciTpTGo3EDcM6mc
	tCHU/6oWHX/+0ZP+izzIp2xmgMA9lulDsng==
X-Received: by 2002:a17:90a:da8e:b0:3b0:94e6:4364 with SMTP id 98e67ed59e1d1-3b0db70b25bmr4358253a91.64.1794023182095;
        Fri, 06 Nov 2026 19:46:22 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70ab7620sm1090942a12.29.2026.11.06.19.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 19:46:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 03:46:21 +0000
Message-Id: <DMOO53QTDUQ4.2Z9UXMZEPX568@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <bpf@vger.kernel.org>
Cc: <andrii@kernel.org>, <qmo@kernel.org>, <daniel@iogearbox.net>,
 <yonghong.song@linux.dev>, <eddyz87@gmail.com>, <ihor.solodrai@linux.dev>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 0/3] Normalize enum values in libbpf and
 bpftool
In-Reply-To: <20261107020725.36675-1-dennylin0707@gmail.com>
References: <20261107020725.36675-1-dennylin0707@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 06:07 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
>  .../bpf/prog_tests/bpftool_map_dump.c         | 162 ++++++++++++++++++
>  .../selftests/bpf/prog_tests/btf_dump.c       |  77 +++++++++
>  .../selftests/bpf/prog_tests/map_extra.c      |  19 ++
>  .../selftests/bpf/progs/test_map_extra.c      |  12 ++
>  8 files changed, 293 insertions(+), 10 deletions(-)

selftest are growing too fast.

16 subtests create 16 maps and run bpftool 32 times.
9 of the 16 pass without the fix.
Plain and json output come from the same btf_dumper_enum().
One map with a struct of four enums and one run of bpftool are enough.

The btf_dump.c part below is the test from my reply to the libbpf patch.

Keep patches 1 and 2. Keep the map_extra test.

Instead of the other two files of patch 3 (not even compile tested):

diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
index 187b3f7..1c581db 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
@@ -7,6 +7,7 @@

 #define PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_sk_storage"
 #define QUEUE_PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_queue"
+#define ENUM_PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_enum"
 #define JSON_ERROR	"{\"error\":\"can't dump sk_storage map"

 /* An empty socket storage map with an int value. */
@@ -124,10 +125,85 @@ out:
 	close(map_fd);
 }

+struct enums {
+	__u8 u8_name;
+	__s8 s8_name;
+	__u32 u32_num;
+	__u64 u64_num;
+};
+
+/* An array map. Its value is struct enums with an enum behind every member. */
+static int create_enum_map(void)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts);
+	struct btf *btf;
+	int fd = -1;
+
+	btf = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf, "btf__new_empty"))
+		return -1;
+
+	btf__add_int(btf, "int", 4, BTF_INT_SIGNED);	/* [1] */
+	btf__add_enum(btf, "u8", 1);			/* [2] */
+	btf__add_enum_value(btf, "U8_MAX", 0xff);
+	btf__add_enum(btf, "s8", 1);			/* [3] */
+	btf__add_enum_value(btf, "S8_NEG", -1);
+	btf__add_enum(btf, "u32", 4);			/* [4] */
+	btf__add_enum_value(btf, "U32_ONE", 1);
+	btf__add_enum64(btf, "u64", 8, false);		/* [5] */
+	btf__add_enum64_value(btf, "U64_ONE", 1);
+	btf__add_struct(btf, "enums", sizeof(struct enums));	/* [6] */
+	btf__add_field(btf, "u8_name", 2, 0, 0);
+	btf__add_field(btf, "s8_name", 3, 8, 0);
+	btf__add_field(btf, "u32_num", 4, 32, 0);
+	btf__add_field(btf, "u64_num", 5, 64, 0);
+	if (!ASSERT_OK(btf__load_into_kernel(btf), "btf__load_into_kernel"))
+		goto out;
+
+	opts.btf_fd = btf__fd(btf);
+	opts.btf_key_type_id = 1;
+	opts.btf_value_type_id = 6;
+	fd = bpf_map_create(BPF_MAP_TYPE_ARRAY, "enums", sizeof(int),
+			    sizeof(struct enums), 1, &opts);
+	ASSERT_OK_FD(fd, "bpf_map_create");
+out:
+	btf__free(btf);
+	return fd;
+}
+
+static void test_enum(void)
+{
+	struct enums value = { 0xff, -1, (__u32)-22, (1ULL << 63) | 1 };
+	char output[1024] = {};
+	int map_fd, key = 0, ret;
+
+	map_fd = create_enum_map();
+	if (map_fd < 0)
+		return;
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, &key, &value, BPF_ANY),
+		       "update map"))
+		goto out;
+	if (!ASSERT_OK(bpf_obj_pin(map_fd, ENUM_PIN_PATH), "pin map"))
+		goto out;
+
+	ret = get_bpftool_command_output("-j map dump pinned " ENUM_PIN_PATH,
+					 output, sizeof(output));
+	ASSERT_OK(ret, "json dump");
+	ASSERT_HAS_SUBSTR(output,
+			  "{\"u8_name\":\"U8_MAX\",\"s8_name\":\"S8_NEG\","
+			  "\"u32_num\":4294967274,\"u64_num\":9223372036854775809}",
+			  "enum values");
+out:
+	unlink(ENUM_PIN_PATH);
+	close(map_fd);
+}
+
 void test_bpftool_map_dump(void)
 {
 	if (test__start_subtest("sk_storage"))
 		test_sk_storage();
 	if (test__start_subtest("queue"))
 		test_queue();
+	if (test__start_subtest("enum"))
+		test_enum();
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index bfa74db..f126fe3 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -944,6 +944,9 @@ static void test_btf_dump_typedef_data(struct btf *btf, struct btf_dump *d,
 static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
+	__u32 high = 0x80000000;
+	__s32 neg = -1;
+
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
 			     BPF_MAP_CREATE);
@@ -975,6 +978,22 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,

 	TEST_BTF_DUMP_DATA_OVER(btf, d, "enum", str, enum bpf_cmd,
 				sizeof(enum bpf_cmd) - 1, "", BPF_MAP_CREATE);
+
+	/* enumerators with bit 31 set in unsigned and in signed enum */
+	ASSERT_GT(btf__add_enum(btf, "test_enum_u32", 4), 0, "add unsigned enum");
+	ASSERT_OK(btf__add_enum_value(btf, "TEST_ENUM_HIGH", 0x80000000), "add TEST_ENUM_HIGH");
+	ASSERT_GT(btf__add_enum(btf, "test_enum_s32", 4), 0, "add signed enum");
+	ASSERT_OK(btf__add_enum_value(btf, "TEST_ENUM_NEG", -1), "add TEST_ENUM_NEG");
+
+	/* btf_dump__dump_type_data() doesn't resize 'd' for the new types */
+	d = btf_dump__new(btf, btf_dump_snprintf, str, NULL);
+	if (!ASSERT_OK_PTR(d, "btf_dump__new"))
+		return;
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_u32", NULL, 0, &high, 4, str,
+				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	btf_dump__free(d);
 }

 static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,

pw-bot: cr
